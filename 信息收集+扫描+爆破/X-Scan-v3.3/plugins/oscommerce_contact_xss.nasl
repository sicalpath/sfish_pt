#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if(description)
{
 script_id(16476);
 script_version("$Revision: 1.8 $");

 script_cve_id("CVE-2005-0458");
 script_bugtraq_id(12568);
 script_xref(name:"OSVDB", value:"14029");

 script_name(english:"osCommerce contact_us.php enquiry Parameter XSS");
 script_summary(english:"Determines the presence of OSCommerce");

 script_set_attribute(attribute:"synopsis", value:
"The remote host has a PHP script that is affected by a cross- site
scripting vulnerability." );
 script_set_attribute(attribute:"description", value:
"The installed version of OSCommerce is vulnerable to a cross-site
scripting (XSS) attack.  An attacker, exploiting this flaw, would need
to be able to coerce an unsuspecting user into visiting a malicious
website.  Upon successful exploitation, the attacker would be able to
possibly steal credentials or execute browser-side code." );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:N/A:N" );
 script_end_attributes();

 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses : XSS");
 
 script_dependencies("oscommerce_detect.nasl", "cross_site_scripting.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");
include("webapp_func.inc");


port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0, "The web server on port "+port+" does not support PHP scripts.");
if (get_kb_item("www/"+port+"/generic_xss")) exit(1, "The web server itself is prone to XSS attacks.");

# Test an install.
install = get_install_from_kb(appname:'oscommerce', port:port);
if (isnull(install)) exit(1, "osCommerce wasn't detected on port "+port+".");
dir = install['dir'];


test_cgi_xss(port: port, cgi: "/contact_us.php", dirs:make_list(dir),
 pass_str: "<script>alert(document.cookie)</script>", 
 qs: "&name=1&email=1&enquiry=</textarea><script>alert(document.cookie);</script>");
