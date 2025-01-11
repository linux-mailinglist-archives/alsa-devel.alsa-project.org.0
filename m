Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98057A10261
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 09:51:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E671160285;
	Tue, 14 Jan 2025 09:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E671160285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736844690;
	bh=C8uQa5XRuGI45cy5JQLA75f9wCuiswCxX1xFNP7JI3I=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sZQSdDAMjolLErFtrkR8dMx8z2mP91UR8b86upvCTm5NBUR5oWechoTLgQCkxgYq9
	 qaCrZmBgE0ObO7f2oItrTwJJQeO1vL0wiVfKhVb4881DYn/pAtVcRgRA7DSZ0VI6rn
	 0svUNN6zYvyhllKnOSs8MDWHrTZnfI3FB0ROMzzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 293A1F805BB; Tue, 14 Jan 2025 09:50:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07C12F805BB;
	Tue, 14 Jan 2025 09:50:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C83CF80508; Sat, 11 Jan 2025 22:33:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-06.simnet.is (smtp-out1-06.simnet.is
 [194.105.231.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DDBCF800ED
	for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2025 22:33:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DDBCF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=gC/q010C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1736631213; x=1768167213;
  h=date:from:to:subject:message-id:mime-version;
  bh=7QUtogvyxCKUfMpkBZ5qk6rZbVQ+y5cm27snjwUDMYQ=;
  b=gC/q010CdfU07qWSF+9ie2WB3CoyxHgvGHSAKfi/f85sFm3HNeSnbdjz
   ZEGWlXA+dA7HRECn3mAPQhNLiKXAEwd4SU+E7wDHr0qSzSGaUMFCVHPXS
   qG3fFkvVqs5hgjG6MzRUirtVHjzFOv6w5Kg5xoE0GWcXhLRQL6w+WO5TG
   cQ6ZG8Ql0QYjQIJgUL4c5TKxeoMYkwWIPRjZzlmcYwzk8xqR0+hJBy8EF
   +hauDvPAMVScpSjvL1wLj/wyumId1GaJdjX+L7dTDJB3kYikDy/fPgzC6
   LjUdV8q2CbwucB/bYvoCN9VW7F1oGV+63Gv+14REf7AY9gf9x5I7TPyEJ
   g==;
X-CSE-ConnectionGUID: QMgCHGFoTB2wFk6uLSQ+uA==
X-CSE-MsgGUID: cyh5TRsVSBWUdFMRI/Q/RA==
Authentication-Results: smtp-out-06.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2EgAwBG3YJnhVnoacJaHgEBCxIMQIQXfYFkiCWOH5FNj?=
 =?us-ascii?q?GKBcgcBAQEPOQsEAQEDAQOFAIp3KDgTAQIEAQEBAQMCAwEBAQEBAQEBDgEBB?=
 =?us-ascii?q?gEBAQEBAQYHAhABAQEBQA47hTVGDYMWcYElAQEBAQEBAQEBAQEBAR0CAj8qg?=
 =?us-ascii?q?Ux8MIJ4AYJkFLRNgTSBAYMc2xeBXRCBSIVrgmMBhWuEdzwGgg2BFTIDgQZtU?=
 =?us-ascii?q?W+BD4FSAQOBIWmGGASCHBeBRYNuhmZUhkeBD4ZciHtIgSEDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFzAzgMCzAVNYEZRDc3gg9pSzcCDQI1gh58giuCX4F/hEeEVIVnghSGER02C?=
 =?us-ascii?q?gMLGA1IESw3FBtEbgebNT2CeAlgBQEMAQEwJjcBgQMtEwMFKwYPHgYbExySa?=
 =?us-ascii?q?ViPVYFEoCGBPoQlhlyDMYILji2HGzMig2JNknMMOpJJmHyCWKEfGTeEZoF+g?=
 =?us-ascii?q?X8sBxoIMDuCZwlJGQ+OByMDFhaIIDa0aHg8AgcLAQEDCZEtAQE?=
IronPort-PHdr: A9a23:ZaG12BchYNH7iBZC0lAXrd2plGM/noqcDmcuAvsPkLdSauGk4oinZ
 BKZ/vRoilLVG4TAuLpIiOvT5qbnX2FIoZOMq2sLf5EEURgZwd4XkAotDI/NCUDyIPPwKS1vG
 sNEWTdY
IronPort-Data: A9a23:wEdCyKpSlxdXTjMrOoUY+tJ5SCFeBmIxYhIvgKrLsJaIsI4StFGz/
 9Y/7Vv2aafRDT+kJccjKs+otgpT6M2AjMsnHUEosygFoxli+ZfJWI3HIBn5MXrNf5eZFkk7v
 8gSYNPOd85lFXKH+xvzOOPq9nIs3/qEFuulWODJayl4SAVpECl61k44l7No3+aE7TTB7yal4
 Lse9OWGYAP1glaYS1489L2c7hlupPG0vykX+VE4IuhWtlvfnHAJDZUZPuaqLj7yWI5fHvOgS
 o7/IMqCEjbkE20FUZX9+ovGT3HmK1Kq0WKmkWJbUquvmF1eqzculP99OPsSZy+74B2Hkox7x
 dkcu5LvQldxN6SWw7tCWUFUTCgjMKMfpeeefnbh6sHJkUCdf3Wzz69lVBk9NIBJp7l8XGger
 a1DdWlQBvzva5pa5ZriIgU7rpt5cJaD0Pojh0xdIRHl4dcOEcDIEv3G6YVRhGxuj8lAEKiGO
 JpDNzZlNh2eMkYRNAk+BcNllo9EpFGmKGQA9wj9SYnbQoT35FYsuFQ4GIONIrRmfe0MwwDA4
 DqApjylav0jHIT34SKf9X6xjfP4kyr+WYYDfJW17fcCbGe7nwT/MzVIEwLhyRWFohTmAY8Hc
 hVNonZGQZUarSRHcPGsDnVUn1bc1vIsc4I4O/E37giL1p3V726xboTTZmccADCOnJZeqQ0Cj
 jdlrfuwbdBcmOH9pUamy1uhhWja1R75goM1TXRsoQMtu7EPqWyo5/7FZo4L/KWd1rUZFdxsq
 twjQedXa7g71KY2O6uHEV/vuhejjbjmYAkJzF/IcGH78ydCXc24Ttn9gbTbxa4owIexUFiao
 D0Wms2G9uceHNTVz2qTQf4RWrCyjxqHGGSN3Rg2R8RnrW/3vS7yFWxTyGgWyENBOMksYj7sZ
 kLP/wJKjHNWFCDxMPYoM9/rYygs5aPxFYnZbOvqVfBxX5RfUTWmuxgpX2fFiggBl2B3zfFuZ
 sbHGSq2Nl4TDb9uiTa7WeoZ+bYv3Sl73XnUR53w01Kgy7X2WZKOYakEK0fLfOE89LmDsBSQq
 40ZKcqR11NeS4USfxU776YqCF8hDVcVAqzc8dN5dbCeBjFfW3wIXqq5LawaR6RpmKFcl+Ht9
 367W1NFxFeXuZEhAVnVApyEQO+/NauTvU4G0ToQ0UGA+kNLXGpCxLkebIdyb7gi7PZk3e8xF
 6JDZcSbHrJOUVwrGgjxj7Gg/OSOlzzy1Gpi2hZJhhBkJfaMoCSTq7fZkvPHrnVmM8ZOnZJWT
 0ec/g3aW4EfYA9pEdzbbvmip3vo4iNDxbkpDhWUcoIKEKkJzGSMA3Ch5hPQC51dQSgvOhPAh
 1b+7eow/LWW/dZrmDU3rf/d89fB/xRC8rpyRDWLvOnnaUE2D0KmwItJGOaGFQ0xp0upkJhOk
 d59lqmmWNVexQoim9QnSd5Dk/lhj+YDUpcBlWyI6l2QNAzzUtuN4xCugaFyi0G67uQE5lHnA
 BnUooUy1HfgEJqNLWP97TENNoyrvcz4UBGLhRjpCC0WPBNKwYc=
IronPort-HdrOrdr: A9a23:LeNWTqAuhOx9e5TlHem555DYdb4zR+YMi2TD83oBLyC9E/bo8P
 xG88576faZslYssRIb6LS90cu7MBbhHPdOiOF7V9rPM2fbUQCTXeNfBOXZsl7d8lXFh5dg6Z
 s=
X-Talos-CUID: 9a23:pJz382xAfiB0mUGx+7dKBgUtP88OUlLzy0v6eVCWCjh0bIasCkK5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3An06N7w5rV0NdXGDWMbhvtBeWxoxj8qTzNHoWr64?=
 =?us-ascii?q?shPSIGwlKGnCkyw6eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,308,1728950400";
   d="1'?diff'?scan'208";a="33517852"
Received: from vist-zimproxy-03.vist.is ([194.105.232.89])
  by smtp-out-06.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2025 21:33:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-03.vist.is (Postfix) with ESMTP id E4F5341F6314
	for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2025 21:33:29 +0000 (GMT)
Received: from vist-zimproxy-03.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-03.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id eruyDpMJsipC for <alsa-devel@alsa-project.org>;
 Sat, 11 Jan 2025 21:33:28 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-03.vist.is (Postfix) with ESMTP id C4C3441F6320
	for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2025 21:33:28 +0000 (GMT)
Received: from vist-zimproxy-03.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-03.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id aUhWOQfip1f1 for <alsa-devel@alsa-project.org>;
 Sat, 11 Jan 2025 21:33:28 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-03.vist.is (Postfix) with ESMTPS id A9B2741F6314
	for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2025 21:33:28 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1tWj6m-000000000lY-0VGb
	for alsa-devel@alsa-project.org;
	Sat, 11 Jan 2025 21:33:28 +0000
Date: Sat, 11 Jan 2025 21:33:28 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: speaker-test.1: Some remarks and a patch with editorial changes for
 this man page
Message-ID: <173663098940.2857.9286980961714784609.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fhKBDjn8ybdDSAtq"
Content-Disposition: inline
X-Mailer: reportbug 13.0.2
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: M2KBZN3K4X434AW4B3CKHWGXR5B35THB
X-Message-ID-Hash: M2KBZN3K4X434AW4B3CKHWGXR5B35THB
X-Mailman-Approved-At: Tue, 14 Jan 2025 08:50:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2KBZN3K4X434AW4B3CKHWGXR5B35THB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fhKBDjn8ybdDSAtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package: alsa-utils
Version: 1.2.13-1
Severity: minor
Tags: patch

   * What led up to the situation?

     Checking for defects with a new version

test-[g|n]roff -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z < "man page"

  [Use "groff -e ' $' <file>" to find trailing spaces.]

  ["test-groff" is a script in the repository for "groff"; is not shipped]
(local copy and "troff" slightly changed by me).

  [The fate of "test-nroff" was decided in groff bug #55941.]

   * What was the outcome of this action?

an.tmac:<stdin>:183: misuse, warning: .BR is for at least 2 arguments, got 1
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

Kernel: Linux 6.12.6-amd64 (SMP w/2 CPU threads; PREEMPT)
Locale: LANG=is_IS.iso88591, LC_CTYPE=is_IS.iso88591 (charmap=ISO-8859-1), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: sysvinit (via /sbin/init)

Versions of packages alsa-utils depends on:
ii  kmod              33+20240816-2
ii  libasound2t64     1.2.13-1+b1
ii  libatopology2t64  1.2.13-1+b1
ii  libc6             2.40-4
ii  libfftw3-single3  3.3.10-2+b1
ii  libncursesw6      6.5-2+b1
ii  libsamplerate0    0.2.2-4+b2
ii  libtinfo6         6.5-2+b1

alsa-utils recommends no packages.

Versions of packages alsa-utils suggests:
pn  dialog  <none>

-- no debconf information

--fhKBDjn8ybdDSAtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.speaker-test.1"

Input file is speaker-test.1

  Any program (person), that produces man pages, should check the output
for defects by using (both groff and nroff)

[gn]roff -mandoc -t -ww -b -z -K utf8  <man page>

  The same goes for man pages that are used as an input.

  For a style guide use

  mandoc -T lint

-.-

  So any 'generator' should check its products with the above mentioned
'groff', 'mandoc',  and additionally with 'nroff ...'.

  This is just a simple quality control measure.

  The 'generator' may have to be corrected to get a better man page,
the source file may, and any additional file may.

  Common defects:

  Input text line longer than 80 bytes.

  Not removing trailing spaces (in in- and output).
  The reason for these trailing spaces should be found and eliminated.

  Not beginning each input sentence on a new line.
Lines should thus be shorter.

  See man-pages(7), item 'semantic newline'.

-.-

The difference between the formatted output of the original and patched file
can be seen with:

  nroff -mandoc <file1> > <out1>
  nroff -mandoc <file2> > <out2>
  diff -u <out1> <out2>

and for groff, using

"printf '%s\n%s\n' '.kern 0' '.ss 12 0' | groff -mandoc -Z - "

instead of 'nroff -mandoc'

  Add the option '-t', if the file contains a table.

  Read the output of 'diff -u' with 'less -R' or similar.

-.-.

  If 'man' (man-db) is used to check the manual for warnings,
the following must be set:

  The option "-warnings=w"

  The environmental variable:

export MAN_KEEP_STDERR=yes (or any non-empty value)

  or

  (produce only warnings):

export MANROFFOPT="-ww -b -z"

export MAN_KEEP_STDERR=yes (or any non-empty value)

-.-.

Output from "mandoc -T lint  speaker-test.1": (shortened list)

     10 input text line longer than 80 bytes
      2 skipping all arguments
      1 skipping paragraph macro

-.-.

Output from "test-groff -mandoc -t -ww -z speaker-test.1": (shortened list)

      1 	Use macro '.B' for one argument or split argument.
      1 .BR is for at least 2 arguments, got 1

-.-.

Change '-' (\-) to '\(en' (en-dash) for a (numeric) range.
GNU gnulib has recently (2023-06-18) updated its
"build_aux/update-copyright" to recognize "\(en" in man pages.

speaker-test.1:148:Allow supplied \fIFREQ\fP to be outside the default range of 30-8000Hz. A minimum of 1Hz is still enforced.

-.-.

Change two HYPHEN-MINUSES (code 0x2D) to an em-dash (\(em),
if one is intended.
  " \(em " creates a too big gap in the text (in "troff").

An en-dash is usually surrounded by a space,
while an em-dash is used without spaces.
"man" (1 byte characters in input) transforms an en-dash (\(en) to one
HYPHEN-MINUS,
and an em-dash to two HYPHEN-MINUSES without considering the space
around it.
If "--" are two single "-"
(begin of an option or end of options)
then use "\-\-".

speaker-test.1:100:Pink noise is perceptually uniform noise -- that is, it sounds like every frequency at once.  If you can hear any tone it may indicate resonances in your speaker system or room.

-.-.

Change (or include a "FIXME" paragraph about) misused SI (metric)
numeric prefixes (or names) to the binary ones, like Ki (kibi), Mi
(mebi), Gi (gibi), or Ti (tebi), if indicated.
If the metric prefixes are correct, add the definitions or an
explanation to avoid misunderstanding.

106:Note that sampling rates less than 48KHz are outside the scope of the spec, and an attempt will be made to construct a reduced rate filter.

-.-.

Add a (no-break, "\ " or "\~") space between a number and a unit,
as these are not one entity.

106:Note that sampling rates less than 48KHz are outside the scope of the spec, and an attempt will be made to construct a reduced rate filter.

-.-.

Change - to \- if it shall be printed as a minus sign.

speaker-test.1:102:\fB\-t st2095\fP means use bandlimited pink noise at -18.5dB AES FS, generated according to SMPTE ST-2095:1-2015.

-.-.

Move a full stop (period) and a comma outside of a quoted text, if it is
at the end of the quote and does not end a quoted sentence.

105:electroacoustic response of a cinema B-chain system."

-.-.

Wrong distance between sentences in the input file.

  Separate the sentences and subordinate clauses; each begins on a new
line.  See man-pages(7) ("Conventions for source file layout") and
"info groff" ("Input Conventions").

  The best procedure is to always start a new sentence on a new line,
at least, if you are typing on a computer.

Remember coding: Only one command ("sentence") on each (logical) line.

E-mail: Easier to quote exactly the relevant lines.

Generally: Easier to edit the sentence.

Patches: Less unaffected text.

Search for two adjacent words is easier, when they belong to the same line,
and the same phrase.

  The amount of space between sentences in the output can then be
controlled with the ".ss" request.

Mark a final abbreviation point as such by suffixing it with "\&".


23:\fBspeaker\-test\fP by default will test the \fIdefault\fP device. If you
26:those cards. Notice that there might be for example, one device for
50:and surround40. So, if you want to test the last device you can
51:run \fBspeaker\-test \-Dsurround40:ICH5 \-c 6\fR. The \fB\-c\fR option will
148:Allow supplied \fIFREQ\fP to be outside the default range of 30-8000Hz. A minimum of 1Hz is still enforced.

-.-.

Split lines longer than 80 characters into two or more lines.
Appropriate break points are the end of a sentence and a subordinate
clause; after punctuation marks.

Line 21, length 89

\fBspeaker\-test\fP generates a tone that can be used to test the speakers of a computer.

Line 100, length 177

Pink noise is perceptually uniform noise -- that is, it sounds like every frequency at once.  If you can hear any tone it may indicate resonances in your speaker system or room.

Line 102, length 113

\fB\-t st2095\fP means use bandlimited pink noise at -18.5dB AES FS, generated according to SMPTE ST-2095:1-2015.

Line 103, length 147

In addition to speaker localization it may be used for system calibration, for example 85dB for thater drivers, with an extra +10dB for subwoofers.

Line 104, length 84

Per the spec, it is intended "to be used in calibrating the sound pressure level and

Line 106, length 139

Note that sampling rates less than 48KHz are outside the scope of the spec, and an attempt will be made to construct a reduced rate filter.

Line 110, length 94

\fB\-t wav\fP means to play WAV files, either pre-defined files or given via \fB\-w\fP option.

Line 119, length 91

When \fB\-s\fP option below with a valid channel is given, \fBspeaker\-test\fP will perform

Line 124, length 87

Do a single-shot speaker test for the given channel.  The channel number starts from 1.

Line 125, length 82

The channel number corresponds to left, right, rear-left, rear-right, center, LFE,

Line 128, length 92

For example, when 1 is passed, it tests the left channel only once rather than both channels

Line 148, length 107

Allow supplied \fIFREQ\fP to be outside the default range of 30-8000Hz. A minimum of 1Hz is still enforced.

Line 167, length 93

To send a nice low 75Hz tone to the Woofer and then exit without touching any other speakers:

-.-.

Use the name of units in text; use symbols in tables and
calculations.
The rule is to have a (no-break, \~) space between a number and
its units (see "www.bipm.org/en/publications/si-brochure")

102:\fB\-t st2095\fP means use bandlimited pink noise at -18.5dB AES FS, generated according to SMPTE ST-2095:1-2015.
103:In addition to speaker localization it may be used for system calibration, for example 85dB for thater drivers, with an extra +10dB for subwoofers.
106:Note that sampling rates less than 48KHz are outside the scope of the spec, and an attempt will be made to construct a reduced rate filter.
148:Allow supplied \fIFREQ\fP to be outside the default range of 30-8000Hz. A minimum of 1Hz is still enforced.
167:To send a nice low 75Hz tone to the Woofer and then exit without touching any other speakers:

-.-.

Name of a manual is set in bold, the section in roman.
See man-pages(7).

183:.BR aplay(1)

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".
Not considered in a patch, too many lines.


speaker-test.1:172:To do a 2\-speaker test using the spdif (coax or optical) output:

-.-.

Use a no-break space between a number and a (SI) unit

148:Allow supplied \fIFREQ\fP to be outside the default range of 30-8000Hz. A minimum of 1Hz is still enforced.
167:To send a nice low 75Hz tone to the Woofer and then exit without touching any other speakers:

-.-.

Put a subordinate sentence (after a comma) on a new line.

26:those cards. Notice that there might be for example, one device for
27:analog sound, one for digital sound and one for HDMI sound.
49:in the above example, there are four devices listed: null, default, front
50:and surround40. So, if you want to test the last device you can
79:When 0 is given, use the maximal buffer size.
85:When 0 is given, the periods given by \fB\-P\fP option is used.
100:Pink noise is perceptually uniform noise -- that is, it sounds like every frequency at once.  If you can hear any tone it may indicate resonances in your speaker system or room.
102:\fB\-t st2095\fP means use bandlimited pink noise at -18.5dB AES FS, generated according to SMPTE ST-2095:1-2015.
103:In addition to speaker localization it may be used for system calibration, for example 85dB for thater drivers, with an extra +10dB for subwoofers.
104:Per the spec, it is intended "to be used in calibrating the sound pressure level and
106:Note that sampling rates less than 48KHz are outside the scope of the spec, and an attempt will be made to construct a reduced rate filter.
110:\fB\-t wav\fP means to play WAV files, either pre-defined files or given via \fB\-w\fP option.
119:When \fB\-s\fP option below with a valid channel is given, \fBspeaker\-test\fP will perform
125:The channel number corresponds to left, right, rear-left, rear-right, center, LFE,
126:side-left, side-right, and so on.
128:For example, when 1 is passed, it tests the left channel only once rather than both channels
144:required, pass the channel position strings to this option.

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z ":

an.tmac:<stdin>:183: misuse, warning: .BR is for at least 2 arguments, got 1
	Use macro '.B' for one argument or split argument.


--fhKBDjn8ybdDSAtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="speaker-test.1.diff"

--- speaker-test.1	2025-01-10 23:55:38.162393206 +0000
+++ speaker-test.1.new	2025-01-11 21:26:59.088889888 +0000
@@ -15,19 +15,25 @@
 .SH NAME
 speaker\-test \- command\-line speaker test tone generator for ALSA
 .SH SYNOPSIS
-.B speaker\-test [\-options]
+.BR speaker\-test\  [ \fIoptions\fR ]
 
 .SH DESCRIPTION
-\fBspeaker\-test\fP generates a tone that can be used to test the speakers of a computer.
+\fBspeaker\-test\fP generates a tone that can be used to test the speakers
+of a computer.
 
-\fBspeaker\-test\fP by default will test the \fIdefault\fP device. If you
-want to test another sound device you will have first to get a list of
-all of the sound cards in your system and the devices associated with
-those cards. Notice that there might be for example, one device for
-analog sound, one for digital sound and one for HDMI sound.
-To get the list of available cards and devices you can run \fBaplay \-L\fR.
+\fBspeaker\-test\fP by default will test the \fIdefault\fP device.
+If you want to test another sound device
+you will have first to get a list of all of the sound cards in your system
+and the devices associated with those cards.
+Notice that there might be for example,
+one device for analog sound,
+one for digital sound
+and one for HDMI sound.
+To get the list of available cards
+and devices you can run \fBaplay \-L\fR.
 
-.P \fBaplay\fR's output will be similar to this one:
+.P
+\fBaplay\fR's output will be similar to this one:
 
 .nf
 $ aplay \-L
@@ -45,15 +51,15 @@ surround40:CARD=ICH5,DEV=0
 (...)
 .fi
 
-.P Each of the devices is listed in the beginning of the definition so,
-in the above example, there are four devices listed: null, default, front
-and surround40. So, if you want to test the last device you can
-run \fBspeaker\-test \-Dsurround40:ICH5 \-c 6\fR. The \fB\-c\fR option will
-indicate that the six audio channels in the device have to be tested.
-
-
-
-
+.P
+Each of the devices is listed in the beginning of the definition so,
+in the above example,
+there are four devices listed:
+null, default, front and surround40.
+So, if you want to test the last device
+you can run \fBspeaker\-test \-Dsurround40:ICH5 \-c 6\fR.
+The \fB\-c\fR option will indicate
+that the six audio channels in the device have to be tested.
 
 .SH OPTIONS
 
@@ -76,13 +82,15 @@ Print usage help
 .TP
 \fB\-b\fP | \fB\-\-buffer\fP \fITIME\fP
 Use buffer size of \fITIME\fP microseconds.
-When 0 is given, use the maximal buffer size.
+When 0 is given,
+use the maximal buffer size.
 The default value is 0.
 
 .TP
 \fB\-p\fP | \fB\-\-period\fP \fITIME\fP
 Use period size of \fITIME\fP microseconds.
-When 0 is given, the periods given by \fB\-P\fP option is used.
+When 0 is given,
+the periods given by \fB\-P\fP option is used.
 The default value is 0.
 
 .TP
@@ -97,17 +105,27 @@ stream of \fIRATE\fP Hz
 \fB\-t\fP | \fB\-\-test\fP \fBpink\fP|\fBst2095\fP|\fBsine\fP|\fBwav\fP
 \fB\-t pink\fP means use pink noise (default).
 
-Pink noise is perceptually uniform noise -- that is, it sounds like every frequency at once.  If you can hear any tone it may indicate resonances in your speaker system or room.
-
-\fB\-t st2095\fP means use bandlimited pink noise at -18.5dB AES FS, generated according to SMPTE ST-2095:1-2015.
-In addition to speaker localization it may be used for system calibration, for example 85dB for thater drivers, with an extra +10dB for subwoofers.
-Per the spec, it is intended "to be used in calibrating the sound pressure level and
-electroacoustic response of a cinema B-chain system."
-Note that sampling rates less than 48KHz are outside the scope of the spec, and an attempt will be made to construct a reduced rate filter.
+Pink noise is perceptually uniform noise \(en that is,
+it sounds like every frequency at once.
+If you can hear any tone
+it may indicate resonances in your speaker system or room.
+
+\fB\-t st2095\fP means use bandlimited pink noise at \-18.5\~dB AES FS,
+generated according to SMPTE ST-2095:1-2015.
+In addition to speaker localization it may be used for system calibration,
+for example 85\~dB for thater drivers,
+with an extra +10\~dB for subwoofers.
+Per the spec,
+it is intended
+"to be used in calibrating the sound pressure level
+and electroacoustic response of a cinema B-chain system".
+Note that sampling rates less than 48\~kHz are outside the scope of the spec,
+and an attempt will be made to construct a reduced rate filter.
 
 \fB\-t sine\fP means to use sine wave.
 
-\fB\-t wav\fP means to play WAV files, either pre-defined files or given via \fB\-w\fP option.
+\fB\-t wav\fP means to play WAV files,
+either pre-defined files or given via \fB\-w\fP option.
 
 You can pass the number from 1 to 3 as a backward compatibility.
 
@@ -116,17 +134,20 @@ You can pass the number from 1 to 3 as a
 
 Specifies the number of loops.  Zero means to run infinitely.
 
-When \fB\-s\fP option below with a valid channel is given, \fBspeaker\-test\fP will perform
-always a single-shot without looping.
+When \fB\-s\fP option below with a valid channel is given,
+\fBspeaker\-test\fP will perform always a single-shot without looping.
 
 .TP
 \fB\-s\fP | \fB\-\-speaker\fP \fICHANNEL\fP
-Do a single-shot speaker test for the given channel.  The channel number starts from 1.
+Do a single-shot speaker test for the given channel.
+The channel number starts from 1.
 The channel number corresponds to left, right, rear-left, rear-right, center, LFE,
 side-left, side-right, and so on.
 
-For example, when 1 is passed, it tests the left channel only once rather than both channels
-with looping.
+For example,
+when 1 is passed,
+it tests the left channel only once
+rather than both channels with looping.
 
 .TP
 \fB\-w\fP | \fB\-\-wavfile\fP \fIFILE\fP
@@ -140,13 +161,15 @@ The default path is \fI/usr/share/sounds
 .TP
 \fB\-m\fP | \fB\-\-chmap\fP \fIMAP\fP
 Pass the channel map to override.
-If the playback in a specific channel order or channel positions is
-required, pass the channel position strings to this option.
+If the playback in a specific channel order
+or channel positions
+is required,
+pass the channel position strings to this option.
 
 .TP
 \fB\-X\fP | \fB\-\-force-frequency\fP
-Allow supplied \fIFREQ\fP to be outside the default range of 30-8000Hz. A minimum of 1Hz is still enforced.
-
+Allow supplied \fIFREQ\fP to be outside the default range of 30\(en8000\~Hz.
+A minimum of 1\~Hz is still enforced.
 .SH USAGE EXAMPLES
 
 Produce stereo sound from one stereo jack:
@@ -164,12 +187,15 @@ Produce 5.1 speaker sound from three ste
   speaker\-test \-Dplug:surround51 \-c6
 .EE
 
-To send a nice low 75Hz tone to the Woofer and then exit without touching any other speakers:
+To send a nice low 75\~Hz tone to the Woofer
+and then exit without touching any other speakers:
 .EX
   speaker\-test \-Dplug:surround51 \-c6 \-s1 \-f75
 .EE
 
-To do a 2\-speaker test using the spdif (coax or optical) output:
+To do a 2\-speaker test using the spdif
+(coax or optical)
+output:
 .EX
   speaker\-test \-Dplug:spdif \-c2
 .EE
@@ -180,7 +206,7 @@ Play in the order of front\-right and fr
 .EE
 
 .SH SEE ALSO
-.BR aplay(1)
+.BR aplay (1)
 
 .SH AUTHOR
 The speaker\-test program was written by James Courtier-Dutton.

--fhKBDjn8ybdDSAtq--
