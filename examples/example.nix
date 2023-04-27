{ ... }:

{
  # You have to set the base domain that is managed
  ovh.dnsDomain = "example.com";

  # You can manage any number of DNS entries
  ovh.dns = {
    test1 = {
      subdomain = "test1";
      target = "127.0.0.1";
      type = "A";
    };
    test2 = {
      subdomain = "test2";
      target = "127.0.0.1";
      type = "A";
    };
    test3 = {
      subdomain = "test3";
      target = "test1"; # if you omit the rest of the domain, it will be added automatically
      type = "CNAME";
    };
    test4 = {
      subdomain = "test4";
      target = "test2.example.com";
      type = "CNAME";
    };
  };
}
