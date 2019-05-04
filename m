Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A494139E8
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 14:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1754189B;
	Sat,  4 May 2019 14:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1754189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556974434;
	bh=BobKtXRm0p7C9FehApHBdRpWXEWZzs4XDO4A6eV4PBk=;
	h=To:From:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcpUSqV1Bi88nC+BZcP4cLJeUeNHXYy6DOhZ1ixZ6lPqZ8MtURS03adUMiSBXMXQT
	 RbpucHndrLWE0aAfOtDpzBX9cS5M0lCeKizsrVWNcHTW+6FqgIRgX0WrBcGzace5j3
	 zrsd8zNDYSMiJdz4jvJXRgzcF/zovIWEnDO7OCYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49229F80726;
	Sat,  4 May 2019 14:52:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72C59F896C7; Sat,  4 May 2019 14:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=FORGED_MUA_MOZILLA,
 HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from blaine.gmane.org (unknown [195.159.176.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 138DFF80726
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 14:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 138DFF80726
Received: from list by blaine.gmane.org with local (Exim 4.89)
 (envelope-from <glad-alsa-devel-2@m.gmane.org>) id 1hMu94-000goC-W6
 for alsa-devel@alsa-project.org; Sat, 04 May 2019 14:52:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: alsa-devel@alsa-project.org
From: Rob van der Putten <rob@sput.nl>
Date: Sat, 4 May 2019 14:51:53 +0200
Message-ID: <qak1t9$4vqg$1@blaine.gmane.org>
References: <q9nlbm$3kqm$1@blaine.gmane.org> <s5h1s1mmudg.wl-tiwai@suse.de>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <s5h1s1mmudg.wl-tiwai@suse.de>
Content-Language: en-GB
Subject: Re: [alsa-devel] [PATCH] Aseqnet, no nagle and dual stack
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi there


On 28/04/2019 10:00, Takashi Iwai wrote:

> On Tue, 23 Apr 2019 20:25:58 +0200,
> Rob van der Putten wrote:
> On Tue, 23 Apr 2019 20:25:58 +0200,
> Rob van der Putten wrote:
>>
>> Hi there
>>
>>
>> Not an ALSA source patch, but a patch for an ALSA related util.
>> Aseqnet sends ALSA sound_seq MIDI over TCP/IP. The patch below
>> disables nagle, enables quickack and makes aseqnet dual-stack.
> 
> Thanks for the patch.  Could you repost with a proper patch change log
> and your Signed-off-by line so that one can apply to git repo?

Added
- Disabled Nagle's algorithm
- Enbled quickack
- IPv6 support

Signed-off-by: Rob van der Putten <rob@sput.nl>

> About the changes:
>> --- aseqnet.c.bak	2012-01-25 10:43:38.000000000 +0100
>> +++ aseqnet.c	2017-08-26 14:17:58.261868853 +0200
>> @@ -3,6 +3,8 @@
>>    *   ver.0.1
>>    *
>>    * Copyright (C) 1999-2000 Takashi Iwai
>> + * Modified by Rob van der Putten, Leiden, Holland,
>> + * rob at sput dot nl.
> 
> We don't need to add each change in the source like that as all
> tracked in git.
> 
>> @@ -15,18 +17,21 @@
>>    *
>>    */
>>
>> +#include <alsa/asoundlib.h>
>> +#include <arpa/inet.h>
>> +#include <assert.h>
>> +#include <ctype.h>
>> +#include <getopt.h>
>> +#include <locale.h>
>> +#include <netdb.h>
>> +#include <netinet/in.h>
>> +#include <netinet/tcp.h>
>> +#include <signal.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>> -#include <ctype.h>
>>   #include <string.h>
>> -#include <netinet/in.h>
>>   #include <sys/socket.h>
>> -#include <netdb.h>
>> -#include <locale.h>
>> -#include <alsa/asoundlib.h>
>> -#include <getopt.h>
>> -#include <signal.h>
>> -#include <assert.h>
>> +#include <sys/types.h>
>>   #include "aconfig.h"
>>   #include "gettext.h"
> 
> Why these large rearrangement of include files?  If it must be
> inevitably done, please describe the reason in the changelog, too.

I just put them into alphabetical order. I changed that back.

>> @@ -327,17 +332,24 @@
>>    */
>>   static void init_server(int port)
>>   {
>> +	/*
>> +	*       RvdP, changed to support IPv6
>> +	*       Dual stack only!
>> +	*/
> 
> Wouldn't it potentially break things?  IMO, it's better to keep the
> old behavior (ipv4-only), at least, with an option.

Server:
The behaviour is determined by /proc/sys/net/ipv6/bindv6only
If this is one, the listening socket will be IPv6 only instead of dual
stack. A socket option is used to set IPV6_V6ONLY to zero, which forces 
the listening socket dual stack.

Client:
The 'for (rp = result; rp != NULL; rp = rp->ai_next) {' loop keeps 
trying to connect to the remote host: If IPv6 fails, it uses IPv4 instead.

Both:
I added a -4 / --ipv4 option.
This not in the previous patch.
It also introduces the string '-4, --ipv4 : IPv4 only' for which there 
no translations. And a new bit in the man page, with an added man page 
patch.

> Also, drop your initials in the commit, it's rather superfluous.

A new aseqnet patch. Note: This patches the original, not the previous 
patch.
--- a/seq/aseqnet/aseqnet.c
+++ b/seq/aseqnet/aseqnet.c
@@ -29,6 +29,9 @@
  #include <assert.h>
  #include "aconfig.h"
  #include "gettext.h"
+#include <arpa/inet.h>
+#include <netinet/tcp.h>
+#include <sys/types.h>

  /*
   * prototypes
@@ -78,6 +81,8 @@
  static int verbose = 0;
  static int info = 0;

+static int ipv4only = 0;
+

  /*
   * main routine
@@ -90,6 +95,7 @@
         {"help", 0, NULL, 'h'},
         {"verbose", 0, NULL, 'v'},
         {"info", 0, NULL, 'i'},
+       {"ipv4", 0, NULL, '4'},
         {NULL, 0, NULL, 0},
  };

@@ -104,7 +110,7 @@
         textdomain(PACKAGE);
  #endif

-       while ((c = getopt_long(argc, argv, "p:s:d:vi", long_option, 
NULL)) != -1) {
+       while ((c = getopt_long(argc, argv, "p:s:d:vi4", long_option, 
NULL)) != -1) {
                 switch (c) {
                 case 'p':
                         if (isdigit(*optarg))
@@ -124,6 +130,9 @@
                 case 'i':
                         info++;
                         break;
+               case '4':
+                       ipv4only++;
+                       break;
                 default:
                         usage();
                         exit(1);
@@ -172,6 +181,7 @@
         printf(_("  -d,--dest addr : write to given addr 
(client:port)\n"));
         printf(_("  -v, --verbose : print verbose messages\n"));
         printf(_("  -i, --info : print certain received events\n"));
+       printf(_("  -4, --ipv4 : IPv4 only\n"));
  }


@@ -329,25 +339,64 @@
  {
         int i;
         int curstate = 1;
-       struct sockaddr_in addr;
-
-       memset(&addr, 0, sizeof(addr));
-
-       addr.sin_family = AF_INET;
-       addr.sin_addr.s_addr = INADDR_ANY;
-       addr.sin_port = htons(port);
+       int ipv6only = 0;
+       int nodelay  = 1;
+       int quickack = 1;
+       struct sockaddr_in addr4;
+       struct sockaddr_in6 addr;
+
+       if (ipv4only == 0) {
+               memset(&addr, 0, sizeof(addr));
+
+               addr.sin6_family = AF_INET6;
+               inet_pton(AF_INET6, "::", &(addr.sin6_addr));
+               addr.sin6_port = htons(port);
+
+               sockfd = socket(PF_INET6, SOCK_STREAM, 0);
+               if (sockfd < 0)  {
+                       perror("create socket");
+                       exit(1);
+               }
+       } else {
+               memset(&addr4, 0, sizeof(addr4));

-       sockfd = socket(AF_INET, SOCK_STREAM, 0);
-       if (sockfd < 0)  {
-               perror("create socket");
-               exit(1);
+               addr4.sin_family = AF_INET;
+               addr4.sin_addr.s_addr = INADDR_ANY;
+               addr4.sin_port = htons(port);
+
+               sockfd = socket(AF_INET, SOCK_STREAM, 0);
+               if (sockfd < 0)  {
+                       perror("create socket");
+                       exit(1);
+               }
         }
         setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &curstate, 
sizeof(curstate));
         /* the return value is ignored.. */

-       if (bind(sockfd, (struct sockaddr *)&addr, sizeof(addr)) < 0)  {
-               perror("can't bind");
-               exit(1);
+       if (ipv4only == 0) {
+               /*    Force dual stack    */
+               setsockopt(sockfd, IPPROTO_IPV6, IPV6_V6ONLY, &ipv6only, 
sizeof(ipv6only));
+               /* the return value is ignored.. */
+       }
+
+       /*    Nagle and quickack  */
+       if ((setsockopt(sockfd, IPPROTO_TCP, TCP_NODELAY, &nodelay, 
sizeof(nodelay))) < 0) {
+               perror("Error setsockopt tcp_nodelay");
+       }
+       if ((setsockopt(sockfd, IPPROTO_TCP, TCP_QUICKACK, &quickack, 
sizeof(quickack))) < 0) {
+               perror("Error setsockopt tcp_quickack");
+       }
+
+       if (ipv4only == 0) {
+               if (bind(sockfd, (struct sockaddr *) &addr, 
sizeof(addr)) < 0)  {
+                       perror("can't bind");
+                       exit(1);
+               }
+       } else {
+               if (bind(sockfd, (struct sockaddr *) &addr4, 
sizeof(addr4)) < 0)  {
+                       perror("can't bind");
+                       exit(1);
+               }
         }

         if (listen(sockfd, 5) < 0)  {
@@ -365,7 +414,8 @@
   */
  static void start_connection(void)
  {
-       struct sockaddr_in addr;
+       struct sockaddr_in6 addr;
+       struct sockaddr_in addr4;
         int i;
         socklen_t addr_len;

@@ -377,9 +427,15 @@
                 fprintf(stderr, _("too many connections!\n"));
                 exit(1);
         }
-       memset(&addr, 0, sizeof(addr));
-       addr_len = sizeof(addr);
-       netfd[i] = accept(sockfd, (struct sockaddr *)&addr, &addr_len);
+       if (ipv4only == 0) {
+               memset(&addr, 0, sizeof(addr));
+               addr_len = sizeof(addr);
+               netfd[i] = accept(sockfd, (struct sockaddr *)&addr, 
&addr_len);
+       } else {
+               memset(&addr4, 0, sizeof(addr4));
+               addr_len = sizeof(addr4);
+               netfd[i] = accept(sockfd, (struct sockaddr *)&addr4, 
&addr_len);
+       }
         if (netfd[i] < 0) {
                 perror("accept");
                 exit(1);
@@ -394,30 +450,57 @@
   */
  static void init_client(char *server, int port)
  {
-       struct sockaddr_in addr;
-       struct hostent *host;
+       struct addrinfo hints;
+       struct addrinfo *result, *rp;
         int curstate = 1;
-       int fd;
+       int nodelay  = 1;
+       int quickack = 1;
+       int fd, s;
+       char portstr[8];
+       struct hostent *host;

-       if ((fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0){
-               perror("create socket");
+       memset(&hints, 0, sizeof(struct addrinfo));
+       if(ipv4only == 0)
+               hints.ai_family = AF_UNSPEC;
+       else
+               hints.ai_family = AF_INET;
+       hints.ai_socktype = SOCK_STREAM;
+       /* hints.ai_protocol = IPPROTO_TCP; */
+       hints.ai_flags    = 0;
+
+       memset(portstr, 0, 8);
+       snprintf(portstr, 6, "%d", port);
+
+       s = getaddrinfo(server, portstr, &hints, &result);
+       if (s != 0) {
+               fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
+               exit(1);
+       }
+       for (rp = result; rp != NULL; rp = rp->ai_next) {
+               fd = socket(rp->ai_family, rp->ai_socktype, 
rp->ai_protocol);
+               if (fd == -1)
+                       continue;
+               if (connect(fd, rp->ai_addr, rp->ai_addrlen) != -1)
+                       break;
+               close(fd);
+       }
+       if (rp == NULL) {
+               fprintf(stderr, "Could not connect\n");
                 exit(1);
         }
+
         if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &curstate, 
sizeof(curstate)) < 0) {
                 perror("setsockopt");
                 exit(1);
         }
-       if ((host = gethostbyname(server)) == NULL){
-               fprintf(stderr, _("can't get address %s\n"), server);
-               exit(1);
+
+       if ((setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &nodelay, 
sizeof(nodelay))) < 0) {
+               perror("Error setsockopt tcp_nodelay");
         }
-       addr.sin_port = htons(port);
-       addr.sin_family = AF_INET;
-       memcpy(&addr.sin_addr, host->h_addr, host->h_length);
-       if (connect(fd, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
-               perror("connect");
-               exit(1);
+       if ((setsockopt(fd, IPPROTO_TCP, TCP_QUICKACK, &quickack, 
sizeof(quickack))) < 0) {
+               perror("Error setsockopt tcp_quickack");
         }
+
         if (verbose)
                 fprintf(stderr, _("ok.. connected\n"));
         netfd[0] = fd;


A man page patch;
--- a/seq/aseqnet/aseqnet.1
+++ b/seq/aseqnet/aseqnet.1
@@ -1,4 +1,4 @@
-.TH aseqnet 1 "January 1, 2000"
+.TH aseqnet 1 "May 1, 2019"
  .SH NAME
  aseqnet \- ALSA sequencer connectors over network

@@ -72,6 +72,9 @@
  .TP
  .B \-v
  Verbose mode.
+.TP
+.B \-4
+IPv4 only.

  .SH "SEE ALSO"
  aconnect(1), pmidi(1)


Regards,
Rob

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
