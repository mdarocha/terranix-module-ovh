# ovh module options

<ul>
<li>
  <b><u>ovh.dns</u></b><br>
  <b>type</b>: attribute set of submodules<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/terranix/terranix-module-ovh/tree/main/module/modules/dns.nix">modules/dns.nix</a><br>
  <b>description</b>: Manage OVH DNS entries<br>
</li>
<li>
  <b><u>ovh.dns.&lt;name&gt;.addPrefix</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/terranix/terranix-module-ovh/tree/main/module/modules/dns.nix">modules/dns.nix</a><br>
  <b>description</b>: Whether the www. prefix should be added (if applicable)
<br>
</li>
<li>
  <b><u>ovh.dns.&lt;name&gt;.subdomain</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;‹name›&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/terranix/terranix-module-ovh/tree/main/module/modules/dns.nix">modules/dns.nix</a><br>
  <b>description</b>: The subdomain (under the chosen domain) to create.
<br>
</li>
<li>
  <b><u>ovh.dns.&lt;name&gt;.target</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/terranix/terranix-module-ovh/tree/main/module/modules/dns.nix">modules/dns.nix</a><br>
  <b>description</b>: The target the subdomain should point to.
Note that this can be either a preset string or a
terraform reference.
<br>
</li>
<li>
  <b><u>ovh.dns.&lt;name&gt;.ttl</u></b><br>
  <b>type</b>: signed integer<br>
  <b>default</b>: 60<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/terranix/terranix-module-ovh/tree/main/module/modules/dns.nix">modules/dns.nix</a><br>
  <b>description</b>: The TTL of the created DNS entry<br>
</li>
<li>
  <b><u>ovh.dns.&lt;name&gt;.type</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/terranix/terranix-module-ovh/tree/main/module/modules/dns.nix">modules/dns.nix</a><br>
  <b>description</b>: Type of the DNS entry to create (A, AAAA, CNAME, etc.)
<br>
</li>
<li>
  <b><u>ovh.dnsDomain</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/terranix/terranix-module-ovh/tree/main/module/modules/dns.nix">modules/dns.nix</a><br>
  <b>description</b>: The domain that is managed<br>
</li>
</ul>
