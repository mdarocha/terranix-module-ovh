{ ... }:

{
  ovh.dnsDomain = "example.com";

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
  };
}
