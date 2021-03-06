#
# (C) Tenable Network Security, Inc.
#
# This script contains information extracted from VuXML :
#
# Copyright 2003-2006 Jacques Vidrine and contributors
#
# Redistribution and use in source (VuXML) and 'compiled' forms (SGML,
# HTML, PDF, PostScript, RTF and so forth) with or without modification,
# are permitted provided that the following conditions are met:
# 1. Redistributions of source code (VuXML) must retain the above
#   copyright notice, this list of conditions and the following
#   disclaimer as the first lines of this file unmodified.
# 2. Redistributions in compiled form (transformed to other DTDs,
#   published online in any format, converted to PDF, PostScript,
#   RTF and other formats) must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer
#   in the documentation and/or other materials provided with the
#   distribution.
#
# THIS DOCUMENTATION IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS DOCUMENTATION,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#
#

include('compat.inc');

if ( description )
{
 script_id(19159);
 script_version("$Revision: 1.6 $");
 script_bugtraq_id(10724);
 script_cve_id("CVE-2004-0595");

 script_name(english:"FreeBSD : php -- strip_tags cross-site scripting vulnerability (2421)");

script_set_attribute(attribute:'synopsis', value: 'The remote host is missing a security update');
script_set_attribute(attribute:'description', value:'The following package needs to be updated: mod_php4-twig');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute:'solution', value: 'Update the package on the remote host');
script_set_attribute(attribute: 'see_also', value: 'http://security.e-matters.de/advisories/122004.html');
script_set_attribute(attribute:'see_also', value: 'http://www.FreeBSD.org/ports/portaudit/edf61c61-0f07-11d9-8393-000103ccf9d6.html');

 script_end_attributes();
 script_summary(english:"Check for mod_php4-twig");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 family["english"] = "FreeBSD Local Security Checks";
 script_family(english:family["english"]);
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/FreeBSD/pkg_info");
 exit(0);
}
global_var cvss_score;
cvss_score=6;
include('freebsd_package.inc');


holes_nb += pkg_test(pkg:"mod_php4-twig<=4.3.7_3");

holes_nb += pkg_test(pkg:"php4<=4.3.7_3");

holes_nb += pkg_test(pkg:"php4-cgi<=4.3.7_3");

holes_nb += pkg_test(pkg:"php4-cli<=4.3.7_3");

holes_nb += pkg_test(pkg:"php4-dtc<=4.3.7_3");

holes_nb += pkg_test(pkg:"php4-horde<=4.3.7_3");

holes_nb += pkg_test(pkg:"php4-nms<=4.3.7_3");

holes_nb += pkg_test(pkg:"mod_php4<=4.3.7_3,1");

holes_nb += pkg_test(pkg:"php5<=5.0.0.r3_2");

holes_nb += pkg_test(pkg:"php5-cgi<=5.0.0.r3_2");

holes_nb += pkg_test(pkg:"php5-cli<=5.0.0.r3_2");

holes_nb += pkg_test(pkg:"mod_php5<=5.0.0.r3_2,1");

if (holes_nb == 0) exit(0,"Host is not affected");
