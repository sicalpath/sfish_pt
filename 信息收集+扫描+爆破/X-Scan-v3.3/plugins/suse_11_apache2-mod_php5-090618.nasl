
#
# (C) Tenable Network Security, Inc.
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(41369);
 script_version("$Revision: 1.1 $");
 script_name(english: "SuSE Security Update:  apache2-mod_php5 (2009-06-18)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing a security patch for apache2-mod_php5");
 script_set_attribute(attribute: "description", value: "This update fixes the JSON parser (CVE-2009-1271) and the
zip packer code (CVE-2009-1272) in php5. Both bugs can lead
to a remote denial of service attack.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_set_attribute(attribute: "solution", value: "Run yast to install the security patch for apache2-mod_php5");
script_set_attribute(attribute: "see_also", value: "https://bugzilla.novell.com/show_bug.cgi?id=493122");
script_end_attributes();

 script_cve_id("CVE-2009-1271", "CVE-2009-1272");
script_summary(english: "Check for the apache2-mod_php5 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"apache2-mod_php5-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-bcmath-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-bz2-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-calendar-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-ctype-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-curl-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-dba-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-dbase-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-dom-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-exif-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-fastcgi-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-ftp-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-gd-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-gettext-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-gmp-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-hash-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-iconv-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-json-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-ldap-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-mbstring-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-mcrypt-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-mysql-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-odbc-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-openssl-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-pcntl-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-pdo-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-pear-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-pgsql-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-pspell-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-shmop-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-snmp-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-soap-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-suhosin-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-sysvmsg-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-sysvsem-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-sysvshm-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-tokenizer-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-wddx-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-xmlreader-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-xmlrpc-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-xmlwriter-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-xsl-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-zip-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"php5-zlib-5.2.6-50.19.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
