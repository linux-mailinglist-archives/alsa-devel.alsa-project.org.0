Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD01A674B0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 14:15:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C1C60351;
	Tue, 18 Mar 2025 14:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C1C60351
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742303753;
	bh=WelF19sl42iB7WQ7DO6fFLXa8UqrkaF3pEuV0hYU9og=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lOTS23Ejkoly/VU2gZc65/KHyRiZsfnb7iJe9nkwWwnVtnc8+DHYOivtcKLt54jKy
	 qaWY/h4IgKJrYttTOeg7jszJuAWzlxI09nKLa2U4XExr8XEJGM2xCDzSWlRqclZDCG
	 TSPaerBhQjnCJ7sxqgg7aW57aS4G5B6sacJPDcCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22B4CF805BB; Tue, 18 Mar 2025 14:15:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE192F805AE;
	Tue, 18 Mar 2025 14:15:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5CF0F8023A; Sat, 15 Mar 2025 22:42:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-06.simnet.is (smtp-out1-06.simnet.is
 [194.105.231.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0702F8010B
	for <alsa-devel@alsa-project.org>; Sat, 15 Mar 2025 22:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0702F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=UM9YYTZI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1742074938; x=1773610938;
  h=date:from:to:subject:message-id:mime-version;
  bh=IF0D+voPy7nPYKTEGPAO0OSYnNagsSNKMCBR/enrydE=;
  b=UM9YYTZI6ngtRqejQKUFX5bV4Z/zJ4cBXWaWwaMNVTdt4H7A+/SHU8OR
   8GlYaiWvlov49FfN+JxNlmusTVnLM1qx2hk+w1gbjLhIp58u9iQf9cKGB
   JTQ82+kkGsSnhjYo/KLBVrvWaaxu4eijAJ5SrILqyp+35ezitX8ffT3dB
   w6xNBd+sTqWk2YXIbsisr7qvVF4RmifASBRQRSiuT2bBaQz/wxHSscpN4
   sHmPX+2ujkSPxS9FA739ozP7WX29/7XLxaEVO7pGs/or5bThsx1zODr+/
   wPGBv6RCPe/rCVy4+S7faDlhN+sTtKFBsvbPEG1OS7AFDjscYzB411xMp
   Q==;
X-CSE-ConnectionGUID: jE5IoVS+Q9u63x6pthwVjA==
X-CSE-MsgGUID: vlYbJUCqRsu8XGCme6lNuw==
Authentication-Results: smtp-out-06.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2GVAgD78tVnhVfoacJaHQEBAQEJARIBBQUBQIFTgkR9g?=
 =?us-ascii?q?WSIJY4ioB0HAQEBDzETBAEBAwEDhQCLICg4EwECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQYBAQEBAQEGBwIQAQEBAUAOO4U1Rg2DFoIWLAKCNXyDKQGCZK8Yg?=
 =?us-ascii?q?TSBAYMc2xeBXhCBSIVtgmMBhWyEdzwGgg2BRwOBBoE+b4RvhhgEghgXgTuCA?=
 =?us-ascii?q?oFqhklUg0mCYoc8gV2IYiyKA0iBIQNZLAFVEw0KCwcFgWwDNQwLLhUygRRDN?=
 =?us-ascii?q?zWCDmlJOgINAjWCG3yCK4JVgXiEPIRChVCCEYs0hGEtUIEeHTYKAwsYDUgRL?=
 =?us-ascii?q?DcUG0RuB6IAO4NICWUHBgEBMAxRAQqBHAoMBwM2LZQUAY9agUSDKpx6gT6EJ?=
 =?us-ascii?q?YZcgzGCC5VKMyKDYYFXkWwMOpJLmH6jbiY3hGiBfoF/LAcaCDA7gmcJSRkPj?=
 =?us-ascii?q?gcjAxaINcRLeDwCBwsBAQMJkWcBAQ?=
IronPort-PHdr: A9a23:fBJp5xA9GcMWoRhYERq/UyQVQxdPi9zP1m898Z87k/dJb7jmp8qkJ
 03a4/hxyl7SDs3X6PNB3uzRta2oGWkN+o2Iv31KdptQHwQEhsMbk01oAMOMBUDhav+/aSs8E
 ax/
IronPort-Data: A9a23:ZURXGKo8ZC2K4dEWuCx6KK++4SNeBmL1YhIvgKrLsJaIsI4StFGz/
 9Y/7Vv2aafRDT+kJccjKs+orB9V+sOR0NdT/DEc+Xo8FXkWo5CbDIWVchv5Zn3PfpyfFRw6t
 p4UO9KadphuFCGEqx70O+bo9SEgifyDHbf3AbLON30rFFI+FXwq1XqP9wJBbqtA2LBVVCvU4
 omtyyGmBGKY59Id3hr4gYqCpRh0sei04XUUv1IwDRwglFGBnicYV59DfPDhcCv2G9RfE7/qT
 OvIxuDlr22Fr08gAIz1nOehKERVE7SJM1nXgysPB6GuiElM9idrgqxhZat0hSu789mst4kZJ
 IJl78fgE2/FR5HxpdjxOvUg/0tWMqBA9aXOJT61rMOIp6GtWyCwnP9nXBo9MN0V9ut+Xz9Hq
 PJGIjpdNkHTirO7nLzhFeMz1s8tc5CyY9lF5Sw+lT2EXPgrHsGdTvmSuY5W129YaqyiZRr7T
 5NxhW1HNUWaOXWjQ2sqNa/SvNtEp1H0LmMG+ArPqfZqvTeNlgZ7gOHmaoKJc4zXHJ4LxUiWr
 EvLrj/zav04HIXEkGLaqBpApQNucQfTAt96+GiQr6Yy6LGr7jVNTkVQDR3j/KXRZneWA7p3M
 1YT9jclsZ88/UmqSsiVdxCjqRZohDZFMzZrO7N8sV3lJpb8uV7DWzBfF2MZMrTKiedvLdAU/
 g7Y9z/WLWQHXI29ERq16rqSpDWuDikZRUdqTTMEVwYM/+74q4g1iB/VJv47eEJipoSocd1Y6
 2niQBkW393/v+ZSv0mI1QyvbwaXm3T8ZlVdCjM78Y6SxlgRiIaNP+RE4LVAhBpKBN7xolKp5
 BDolyUChQyn4F7keCGlGY0w8L+VC/mtMhCBoFlRJNoYpinzoG79ZZxQ/w98DRI8WioEUWeBj
 E77pwJK+NpBPX6yd6hncsfpUoI0zLP8U9X+PhzWRoMfPt4oLFLBpno0Ix7Pt4zuuBFEfaUXM
 5izasepC3sGT6V8pNazb7tFgeZ6m3pmrY/VbY7//h6F7JGHXmWIGYcqG16DMOQf8bzR9W059
 P4Ea5vblEQDOAHkWQHe9ZUaaFwHM3U/LZnysMUSbvSEIAdtBCcmEfC5/F86U5JkhLgQhObN5
 mu6Sl4dkAO5m3zcNUOLcRiPdY8DQ759gC8aOhIXfm/5xiZ4cdi38KcASZkeKOxPGPNY8dZ4S
 PwMesOlC/tJSyja9zl1UXUbhNAyHPhMrV/XVxdJcAQCk4hcqxvh2+SMQ+cC3DcPFTbyp8o7u
 6enxhKeGcNFWQV5EIDXc5pDLm9dX1BDwYqevGORc7G/nXkAFqAxdkQdaddseakxxe3rnGfy6
 upvKU5wSRPxi4E06sLVoquPsp2kFeBzdmIDQDWCvOnpbHeHojPzqWOlbApuVWyMPI8T0Pj7D
 di5M9mmYKFvcKti6tYnTe81pU7Az4uy/+YyIvtY8IXjNAj7W+wxfhFqLOFKt6lEjr9X0TZaq
 WrSkuS2zY6hYZu/eHZIfVZNRrrYj5k8xGKNhcnZ1W2hv0ebCpLcCh0KZ3FhSUV1cNNIDW/S6
 b1x6ZBItlHm0UVC3xTvpnk8yllg50coC80P3qz2yqex4ub34jmuuaDhNxI=
IronPort-HdrOrdr: A9a23:yt7Zoa7sUamqfoexHwPXwMLXdLJyesId70hD6qkRc20zTiX8ra
 vFoB11737JYVoqNE3Jt7i7WJVoIkmslqKdg7NhWYtKNTOO0AaVxepZg7cKrQeOJ8RSzJ8+6U
 4lSdkaNOHN
X-Talos-CUID: 9a23:aGo7l21xf3XIrdGYZia1RbxfGO14U3rj9zTpclLmUnY3UKGVVmGS0fYx
X-Talos-MUID: 9a23:OtATaQQmC7irJ/B3RXTygABoFvpD+p61FRA9vr4DtpeAEzFvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.14,250,1736812800";
   d="1'?diff'?bugs'?scan'208";a="40819520"
Received: from vist-zimproxy-01.vist.is ([194.105.232.87])
  by smtp-out-06.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2025 21:42:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id E125C41CEF56
	for <alsa-devel@alsa-project.org>; Sat, 15 Mar 2025 21:42:15 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id wnj5tpFMCJoG for <alsa-devel@alsa-project.org>;
 Sat, 15 Mar 2025 21:42:15 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id 5F23E41CEF5A
	for <alsa-devel@alsa-project.org>; Sat, 15 Mar 2025 21:42:15 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id oLwWXFVvR0td for <alsa-devel@alsa-project.org>;
 Sat, 15 Mar 2025 21:42:15 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTPS id 4AF2241C468F
	for <alsa-devel@alsa-project.org>; Sat, 15 Mar 2025 21:42:15 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1ttZGo-000000001je-2LbL
	for alsa-devel@alsa-project.org;
	Sat, 15 Mar 2025 21:42:14 +0000
Date: Sat, 15 Mar 2025 21:42:14 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: iecset.1: Some remarks and a patch with editorial changes for this
 man page
Message-ID: <174207477224.6611.5724917164313810875.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8LvnyeFHLWbsxheX"
Content-Disposition: inline
X-Mailer: reportbug 13.1.0
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BCJQ77OZTVIANBD2A2G4BIRDD2H3MDXT
X-Message-ID-Hash: BCJQ77OZTVIANBD2A2G4BIRDD2H3MDXT
X-Mailman-Approved-At: Tue, 18 Mar 2025 13:15:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BCJQ77OZTVIANBD2A2G4BIRDD2H3MDXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8LvnyeFHLWbsxheX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package: alsa-utils
Version: 1.2.13-1
Severity: minor
Tags: patch

   * What led up to the situation?

     Checking for defects with a new version

test-[g|n]roff -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z < "man page"

  [Use "groff -e ' $' -e '\\~$' <file>" to find obvious trailing spaces.]

  ["test-groff" is a script in the repository for "groff"; is not shipped]
(local copy and "troff" slightly changed by me).

  [The fate of "test-nroff" was decided in groff bug #55941.]

   * What was the outcome of this action?


an.tmac:<stdin>:1: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")
an.tmac:<stdin>:24: misuse, warning: .BI is for at least 2 arguments, got 1
	Use macro '.B' for one argument or split argument.
an.tmac:<stdin>:28: misuse, warning: .BI is for at least 2 arguments, got 1
	Use macro '.B' for one argument or split argument.
an.tmac:<stdin>:33: misuse, warning: .BI is for at least 2 arguments, got 1
	Use macro '.B' for one argument or split argument.


   * What outcome did you expect instead?

     No output (no warnings).

-.-

  General remarks and further material, if a diff-file exist, are in the
attachments.


-- System Information:
Debian Release: trixie/sid
  APT prefers testing
  APT policy: (500, 'testing')
Architecture: amd64 (x86_64)

Kernel: Linux 6.12.17-amd64 (SMP w/2 CPU threads; PREEMPT)
Locale: LANG=is_IS.iso88591, LC_CTYPE=is_IS.iso88591 (charmap=ISO-8859-1), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: sysvinit (via /sbin/init)

Versions of packages alsa-utils depends on:
ii  kmod              34-3
ii  libasound2t64     1.2.13-1+b1
ii  libatopology2t64  1.2.13-1+b1
ii  libc6             2.41-4
ii  libfftw3-single3  3.3.10-2+b1
ii  libncursesw6      6.5+20250216-2
ii  libsamplerate0    0.2.2-4+b2
ii  libtinfo6         6.5+20250216-2

alsa-utils recommends no packages.

Versions of packages alsa-utils suggests:
pn  dialog  <none>

-- no debconf information

--8LvnyeFHLWbsxheX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.iecset.1"

Input file is iecset.1

Output from "mandoc -T lint  iecset.1": (shortened list)


-.-.

Output from "test-nroff -mandoc -t -ww -z iecset.1": (shortened list)

      3 	Use macro '.B' for one argument or split argument.
      3 .BI is for at least 2 arguments, got 1

-.-.

Put a subordinate sentence (after a comma) on a new line.

iecset.1:14:When the commands are given in the arguments, they are parsed
iecset.1:19:As the boolean argument, \fIyes\fP, \fIno\fP, \fItrue\fP, \fIfalse\fP,
iecset.1:46:Specifies the IEC958 control element index, in case you have multiple

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z ":

an.tmac:<stdin>:1: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")
an.tmac:<stdin>:24: misuse, warning: .BI is for at least 2 arguments, got 1
	Use macro '.B' for one argument or split argument.
an.tmac:<stdin>:28: misuse, warning: .BI is for at least 2 arguments, got 1
	Use macro '.B' for one argument or split argument.
an.tmac:<stdin>:33: misuse, warning: .BI is for at least 2 arguments, got 1
	Use macro '.B' for one argument or split argument.

-.-.

Additionally:

Change "50/15us" to (50/15)\~us (3.3... microseconds)

Generally:

Split (sometimes) lines after a punctuation mark; before a conjunction.

--8LvnyeFHLWbsxheX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="iecset.1.diff"

--- iecset.1	2025-03-15 21:19:21.056290127 +0000
+++ iecset.1.new	2025-03-15 21:32:06.514180381 +0000
@@ -11,28 +11,31 @@ iecset \- Set or dump IEC958 status bits
 
 When \fBiecset\fP is started without arguments except for options,
 it will show the current IEC958 status in a human-readable form.
-When the commands are given in the arguments, they are parsed
+When the commands are given in the arguments,
+they are parsed
 and the IEC958 status bits are updated.  The resultant status is
 shown as well.
 
 The commands consist of the command directive and the argument.
-As the boolean argument, \fIyes\fP, \fIno\fP, \fItrue\fP, \fIfalse\fP,
+As the boolean argument,
+\fIyes\fP, \fIno\fP, \fItrue\fP, \fIfalse\fP,
 or a digit number is allowed.
 
 .SH EXAMPLES
 .TP
-.BI iecset\ \-Dhw:1
+.B iecset\ \-Dhw:1
 Displays the current IEC958 status bits on the second card.
 This is equivalent with \fI\-c 1\fP.
 .TP
-.BI iecset\ \-x
+.B iecset\ \-x
 Displays the current IEC958 status bits in a style of the arguments
 for the PCM stream.  The output string can be passed to the \fIiec958\fP
 (or \fIspdif\fP) PCM type as the optional argument.
 .TP
-.BI iecset\ pro\ off\ audio\ off
+.B iecset\ pro\ off\ audio\ off
 Sets the current status to the consumer-mode and turns on the
-non-audio bit.  The modified status will be shown, too.
+non-audio bit.
+The modified status will be shown, too.
 
 .SH OPTIONS
 .TP
@@ -43,8 +46,9 @@ Specifies the device name of the control
 Specifies the card index to open.  Equivalent with \fI\-Dhw:x\fP.
 .TP
 \fI\-n\fP index
-Specifies the IEC958 control element index, in case you have multiple
-IEC958 devices and need to choose one of them.
+Specifies the IEC958 control element index,
+in case you have multiple IEC958 devices
+and need to choose one of them.
 .TP
 \fI\-x\fP
 Dumps the status in the form of AESx bytes.
@@ -68,7 +72,7 @@ The sample rate in Hz.
 
 .TP
 \fIemphasis\fP <int>
-The emphasis: 0 = none, 1 = 50/15us, 2 = CCITT.
+The emphasis: 0 = none, 1 = (50/15)\~us, 2 = CCITT.
 
 .TP
 \fIlock\fP <bool>
@@ -82,7 +86,8 @@ This command is for the professional mod
 
 .TP
 \fIwordlength\fP <int>
-Wordlength: 0 = No, 2 = 22-18 bit, 4 = 23-19 bit, 5 = 24-20 bit, 6 = 20-16 bit.
+Wordlength: 0 = No, 2 = 22\(en18 bit, 4 = 23\(en19 bit, 5 = 24\(en20 bit,
+6 = 20\(en16 bit.
 This command is for the professional mode only.
 
 .TP

--8LvnyeFHLWbsxheX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="general.bugs"

  Any program (person), that produces man pages, should check the output
for defects by using (both groff and nroff)

[gn]roff -mandoc -t -ww -b -z -K utf8 <man page>

  The same goes for man pages that are used as an input.

  For a style guide use

  mandoc -T lint

-.-

  Any "autogenerator" should check its products with the above mentioned
'groff', 'mandoc', and additionally with 'nroff ...'.

  It should also check its input files for too long (> 80) lines.

  This is just a simple quality control measure.

  The "autogenerator" may have to be corrected to get a better man page,
the source file may, and any additional file may.

  Common defects:

  Not removing trailing spaces (in in- and output).
  The reason for these trailing spaces should be found and eliminated.

  "git" has a "tool" to point out whitespace,
see for example "git-apply(1)" and git-config(1)")

  Not beginning each input sentence on a new line.
Line length and patch size should thus be reduced.

  The script "reportbug" uses 'quoted-printable' encoding when a line is
longer than 1024 characters in an 'ascii' file.

  See man-pages(7), item "semantic newline".

-.-

The difference between the formatted output of the original and patched file
can be seen with:

  nroff -mandoc <file1> > <out1>
  nroff -mandoc <file2> > <out2>
  diff -d -u <out1> <out2>

and for groff, using

\"printf '%s\n%s\n' '.kern 0' '.ss 12 0' | groff -mandoc -Z - \"

instead of 'nroff -mandoc'

  Add the option '-t', if the file contains a table.

  Read the output from 'diff -d -u ...' with 'less -R' or similar.

-.-.

  If 'man' (man-db) is used to check the manual for warnings,
the following must be set:

  The option \"-warnings=w\"

  The environmental variable:

export MAN_KEEP_STDERR=yes (or any non-empty value)

  or

  (produce only warnings):

export MANROFFOPT=\"-ww -b -z\"

export MAN_KEEP_STDERR=yes (or any non-empty value)

-.-

--8LvnyeFHLWbsxheX--
