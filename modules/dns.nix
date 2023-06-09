{ lib, config, ... }:

with lib;
with lib.types;

let
  cfg = config.ovh.dns;
  domain = config.ovh.dnsDomain;
in
{
  options.ovh = {
    dnsDomain = mkOption {
      type = str;
      description = "The domain that is managed";
    };

    dns = mkOption {
      default = {};
      description = "Manage OVH DNS entries";
      type = attrsOf (submodule ({ name, ... }: {
        options = {
          subdomain = mkOption {
            default = name;
            type = str;
            description = ''
              The subdomain (under the chosen domain) to create.
            '';
          };
          target = mkOption {
            type = str;
            description = ''
              The target the subdomain should point to.
              Note that this can be either a preset string or a
              terraform reference.
            '';
          };
          type = mkOption {
            type = str;
            description = ''
              Type of the DNS entry to create (A, AAAA, CNAME, etc.)
            '';
          };
          ttl = mkOption {
            type = int;
            default = 60;
            description = "The TTL of the created DNS entry";
          };
          addPrefix = mkOption {
            type = bool;
            default = false;
            description = ''
              Whether the www. prefix should be added (if applicable)
            '';
          };
          addSuffix = mkOption {
            type = bool;
            default = true;
            description = ''
              Whether the given target should be extended with the dnsDomain if applicable.
              This happens ie. for CNAME records that don't specify a domain down to a TLD.
            '';
          };
        };
      }));
    };
  };

  config.resource."ovh_domain_zone_record" = (listToAttrs (flatten (map
    (name:
      let
        value = getAttr name cfg;
        add_www_prefix = value.addPrefix && (value.type == "A" || value.type == "AAAA" || value.type == "CNAME");

        targetWithDomain = let
          isCNAME = value.type == "CNAME";
          hasDomainSuffix = hasSuffix domain value.target;

          tlds = builtins.fromJSON (builtins.readFile ./tlds.json);
          hasTldSuffix = builtins.any (tld: hasSuffix ".${tld}" value.target) tlds;
        in
        if isCNAME && !hasDomainSuffix && !hasTldSuffix && value.addSuffix
        then "${value.target}.${domain}"
        else value.target;

        target = if (hasSuffix "." targetWithDomain || value.type != "CNAME") then targetWithDomain else "${targetWithDomain}.";
      in
      singleton
        {
          name = "${replaceStrings ["."] ["-"] name}-record";
          value = {
            inherit (value) subdomain ttl;
            inherit target;
            fieldtype = value.type;

            zone = domain;
          };
        } ++ optional add_www_prefix {
        name = "${replaceStrings ["."] ["-"] name}-record-www";
        value = {
          inherit target;
          subdomain = "www.${value.subdomain}";
          fieldtype = "CNAME";

          zone = domain;
          inherit (value) ttl;
        };
      }
    )
    (attrNames cfg))));
}
