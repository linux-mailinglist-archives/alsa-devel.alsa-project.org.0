Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66C9DFC2E
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9803C233F;
	Mon,  2 Dec 2024 09:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9803C233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128944;
	bh=qIOaITSkr2hoSHYZoH8rMa+w2PEY8oF1TUWYTma/SZ8=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fjbbjI2MG2YS7gVX7xsnt/MQIF1bNxqTln3cYpDD4ru6mr3tpC8/BZZkDTdUo5MdG
	 vMy3vki7Fa8IbXCgYcCjRE+h0FMl0zQdseQ90cKzYJ8+7qk/bsdjoNMWlhI+0pdubm
	 i9SrLmatr6ZvcKGAQSf5tXFrvOBvShl7LdwAERI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 184D7F8003C; Mon,  2 Dec 2024 09:41:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 385D8F805C2;
	Mon,  2 Dec 2024 09:41:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D12D3F80236; Wed, 27 Nov 2024 03:15:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 68F1BF80116
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 03:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68F1BF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=LLu+qnJu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1732673723; x=1764209723;
  h=date:from:to:subject:message-id:mime-version;
  bh=TDRHElr7oOSLi/OaWah5wWZcBo30pme1wqiET5MbYkU=;
  b=LLu+qnJujJNkM18z0fzYjNyRN3ZR3GPlJBgf91+rUYG5ErBTlyhFkJqR
   2wtRdMSGvyGqQaSWus4UEqltLiMtFK+ZsCG2geG7wypveIRpdDVw+xb4e
   yv+eZ/jEEVkknGjTx2v8Kjin99aZLepzwzw84IKe58GT4+7sTF2kBZMSN
   /qicS7qXWtyVQjAF7t9GferlCpSJTFaVM6gYJ4mSAP7fwq8MykMSjH2dE
   j4mzSQ4TJCzbcbH8Ad3KPMlw4vmyDyXC87UaTE66oCahOO5pIO6l6m4Ve
   uskAGaVuBI1WjilCOkGR76qKoN0CN8C74Spf4tSYsDXStDq+egUIjcsPh
   w==;
X-CSE-ConnectionGUID: Fa6L/vLQRKyLan+ht2ABBg==
X-CSE-MsgGUID: 3XwjPYZcSI6+tNK3IGK9Tg==
Authentication-Results: smtp-out-06.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2HOAgDefUZnhVjoacJaHgEBCxIMQIFIC4IcKH2BZIglj?=
 =?us-ascii?q?h+gIAcBAQEPMRMEAQEDAQOBUIMwil4oNwYOAQIEAQEBAQMCAwEBAQEBAQEBD?=
 =?us-ascii?q?gEBBgEBAQEBAQYHAhABAQEBQA47hTVGDYMWghYsAi6BTQowI1kngwEBgmSxH?=
 =?us-ascii?q?4E0gQGDHNsXgV0QgUiFaoJiAYVphHc8BoINgRUyA4EGbVFvhG+GGASCJBwtT?=
 =?us-ascii?q?EGBLAyCCxIlghqBDYFfgg9egQ2Bb4IPhByCVYJgHR0wgVVZgTeJRUiBIQNZI?=
 =?us-ascii?q?REBVRMNCgsHBYF2A4JMeiuBC4EXOoF+gRNKg0qBQkY9N4ITaUs3Ag0CNoIkf?=
 =?us-ascii?q?YJNgxiBf4RphFuGMB02CgMLGA1IESw3FBtEbgegNAFGgk0JPyIEAQ0BMAwaD?=
 =?us-ascii?q?BgTAS8eMgQjChMDMAIEBAsdAQ2UA49PgUShXIQkhluDMIILlUczIoNigVeRa?=
 =?us-ascii?q?Aw6kkiYe5cAjCZMGTeEZoF9ggAsBxoIMDuCZwlJGQ+OByMDFoEMAQeHIjbDR?=
 =?us-ascii?q?Xg7AgcLAQEDCZJpAQE?=
IronPort-PHdr: A9a23:2x2bCxZN9sZb3rcBA+S1ddn/LTAChN3EVzX9i7I8jq5WN6O+49G6Y
 grE5PBrgUOPXJ6Io/5Hiu+DtafmVCRA5Juaq3kNfdRKUANNksQZmQEsQYaFBET3IeSsbnk8G
 8JPPGI=
IronPort-Data: A9a23:uLuM2awWkmMVyotLS3h6t+dawSrEfRIJ4+MujC+fZmQN5Y4CYwd3n
 TpENjTXZOHfICDrKoU1Od7yqVQHiSLmvt41TVY+qnxjF3kW+cbMVYnGchv5Yy3Mf5CeFB5st
 ZROYYiQIs5qHiWB/Bn9OLaw/Hci2fDUTOSnWb+dZH0rHlAMpEvN8f5Gs7dRbtlA34jnW2thw
 O/PnvEzUbPdN1RcO2YP4qmfrFU2+vjztj1wUjcWOfwa5QCDmiQfAJhOe63hISGmGdkIReTlT
 L+ekrvm92jX9EdwUtr5n+agLUBTG7eMMFPVgCINAPLy2BMf9iZrjc7XWBZkhWJ/0l1lyPguk
 osU3XDJdToUA0HspAg8e0QETHAiY/1MqbLJcCTj7cGflRHLLyWzk/w1AB07MNIV0+smWmsmG
 d4wcWtUNk/Z7w6VLBNXbsE226zP+eGyZNt3VklIlGyfVbB+B8mbH80m3PcAtB8onMdCAP3CU
 MQQbDtrfXzobgZGUrstIMtWcNyA2D+mKVW0lHrP/fBrujGJklQquFTQGIO9luKiFJQ9cnmw/
 goqz0yhajkGOdqWzyay837ErocjSguiBer+vJXhnhJbqAX7Kl47UXX6ZnPnyRWNsXNSbvoEQ
 6AiFoXCmoBpnKCjZoGVsxRVOxdotDZEMzZbO7VSBA1gVsM4SutWb4QJZmcpVTAoiCM5bRIji
 HvOgffQPx9+lLSTCnKBrJ6+hzznbED5LUdaDcMFZRUE+MWmsoA2lgjIXscmSPTzkNzuBXfx2
 FhmrgBn1ulV1JZWkf/gpxaX01pApbCQJuIxzg/Ydnmk6wV0eMikfORE7HCBsqsRdtbEEzFtu
 lBfq9ec1NE8Bqqsym+RZsZWPZ6KtsqKZWi0bVlHRMVxpmv8pxZPZ7t46TVlLQJlP9gJfRfgZ
 FTa/BtL451eN2fsarV4C79dEOw0zLP8UMbkU+jOacpfJ8ArMhGG5z0oZFX4M33RfFYEv6hhH
 dCFVf+WLmc+AKIkzCbsbs033up+rswh/l/7SZf+xhWh9LORYn+JVLsIWGdiiMhls8toRy2Jo
 r5i29u29vlJbAHpSgjsmbP/wHgULGMnQIL3rtRNcf6SZ1I8Xn8gEOOXwKhJl21Zc0Z9yL6gE
 pKVAx4wJL/DaZvvclzihpdLM+qHYHqHhShnVRHAxH7xs5TZXa6h7b0Ea7w8dqQ9+epowJZcF
 qZeIZvcX6UXE22eo1zxiKURSqQ+JHxHYirTZ0KYjMQXJcM9L+A00oa4JVW2qkHi8ALo6ZJgy
 1Ff6u8racFfF1U9XZq+hAOHylK1tDAdlopPs7jgf7FulLHX2NEycUTZ16ZrS+lSck+r7mXBi
 G6r7eIw/rKlT3kdq4KR3fjsQkbAO7cWI3e26EGHtO7pb3mFpjf7qWKCOc7RFQ3guKrP0P3KT
 Y1oIzvUaZXrQH4iX1JALotW
IronPort-HdrOrdr: A9a23:ZzDCuqhpnz85LNBLvcY2InPVWXBQXs8ji2hC6mlwRA09TyW9rb
 HJoB17726StN9/YhAdcLy7WJVoIkmskaKdg7NhWItKNTOO0ADDQe0Mg7cKqAeQeREWmNQttp
 uIC5IOceHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3APiV4N2kMZDiS/9UWOsduhcq/M17XOVPUklOXPWu?=
 =?us-ascii?q?BM0V4bLSTCl+MoopOucU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1eG6/w23sfVcIRNjM5zv9DgyhjUjuJSxCng8o54?=
 =?us-ascii?q?9mpfHKQpTYBayr2WLTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,188,1728950400";
   d="1'?diff'?scan'208";a="27592855"
Received: from vist-zimproxy-02.vist.is ([194.105.232.88])
  by smtp-out-06.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:15:20 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id 481314009081
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 02:15:20 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id YCqGNvgOVMMU for <alsa-devel@alsa-project.org>;
 Wed, 27 Nov 2024 02:15:19 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id 5748043D59B0
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 02:15:19 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Qfk5lIz0YRfV for <alsa-devel@alsa-project.org>;
 Wed, 27 Nov 2024 02:15:19 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTPS id 41E384009081
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 02:15:19 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1tG7aL-000000002wO-45lQ
	for alsa-devel@alsa-project.org;
	Wed, 27 Nov 2024 02:15:21 +0000
Date: Wed, 27 Nov 2024 02:15:21 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: alsactl.1: Some remarks and editorial changes for this man page
Message-ID: 
 <173267285341.10818.18163035991786515444.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EA3fa+uv7YkAxoyi"
Content-Disposition: inline
X-Mailer: reportbug 13.0.2
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NDYV37I4L3F2BG7RES635WUEPPZFPGOE
X-Message-ID-Hash: NDYV37I4L3F2BG7RES635WUEPPZFPGOE
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:41:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDYV37I4L3F2BG7RES635WUEPPZFPGOE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EA3fa+uv7YkAxoyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package: alsa-utils
Version: 1.2.12-1
Severity: minor
Tags: patch

   * What led up to the situation?

     Checking for defects with

test-[g|n]roff -mandoc -t -K utf8 -rF0 -rHY=0 -ww -b -z < "man page"

  [Use "groff -e ' $' <file>" to find trailing spaces.]

  ["test-groff" is a script in the repository for "groff"; is not shipped]
(local copy and "troff" slightly changed by me).

  [The fate of "test-nroff" was decided in groff bug #55941.]

   * What was the outcome of this action?


troff: backtrace: file '<stdin>':93
troff:<stdin>:93: warning: trailing space in the line
troff: backtrace: file '<stdin>':224
troff:<stdin>:224: warning: trailing space in the line


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

Kernel: Linux 6.11.9-amd64 (SMP w/2 CPU threads; PREEMPT)
Locale: LANG=is_IS.iso88591, LC_CTYPE=is_IS.iso88591 (charmap=ISO-8859-1), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: sysvinit (via /sbin/init)

Versions of packages alsa-utils depends on:
ii  kmod              33+20240816-2
ii  libasound2t64     1.2.12-1+b1
ii  libatopology2t64  1.2.12-1+b1
ii  libc6             2.40-3
ii  libfftw3-single3  3.3.10-1+b3
ii  libncursesw6      6.5-2+b1
ii  libsamplerate0    0.2.2-4+b2
ii  libtinfo6         6.5-2+b1

alsa-utils recommends no packages.

Versions of packages alsa-utils suggests:
pn  dialog  <none>

-- no debconf information

--EA3fa+uv7YkAxoyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.alsactl.1"

Input file is alsactl.1

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

Output from "mandoc -T lint  alsactl.1 ": (shortened list)

      2 input text line longer than 80 bytes
      2 whitespace at end of input line

-.-.

Output from "test-groff -mandoc -t -ww -b -z alsactl.1 ": (shortened list)

      2 trailing space in the line

-.-.

Output from "mandoc -T lint  alsactl.1 ":

mandoc: alsactl.1:93:20: STYLE: whitespace at end of input line
mandoc: alsactl.1:110:92: STYLE: input text line longer than 80 bytes: Select the boot / ho...
mandoc: alsactl.1:226:10: STYLE: whitespace at end of input line
mandoc: alsactl.1:231:83: STYLE: input text line longer than 80 bytes: <abramo@alsa\-projec...

-.-.

Remove space characters at the end of lines.

Use "git apply ... --whitespace=fix" to fix extra space issues, or use
global configuration "core.whitespace".

93:\fI\-h, \-\-help\fP 
226:.SH BUGS 

-.-.

Add a comma (or \&) after "e.g." and "i.e.", or use English words
(man-pages(7)).
Abbreviation points should be protected against being interpreted as
an end of sentence, if they are not, and that independent of the
current place on the line.

214:necessary for some soundcard features (e.g. enabling/disabling

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

17:soundcard drivers. It supports multiple soundcards. If your card has
25:The \fI<card>\fP argument is optional. If no soundcards are specified,
36:configuration file. If restoring fails (eventually partly), the init
46:This command tries to initialize all devices to a default state. If device
76:The optional element identifiers are accepted as a filter. One extra
106:Select the configuration file to use. The default is /var/lib/alsa/asound.state.
110:Select the boot / hotplug ALSA configuration directory to use. The default is /var/lib/alsa.
133:Used with store, restore and init commands. Do not show 'No soundcards found'
152:Save restore and init state to this file. The file will contain only errors.
167:The configuration file for init. By default, PREFIX/share/alsa/init/00main
196:Execute also the 'defaults' section from the UCM configuration. The standard
201:Skip the UCM init even if available. It may be useful for the test the
207:soundcards. The settings include all the usual soundcard mixer
213:\fBalsactl store\fP. Editing the configuration file by hand may be
214:necessary for some soundcard features (e.g. enabling/disabling
231:<abramo@alsa\-project.org>. This document is by Paul Winkler <zarmzarm@erols.com>.

-.-.

Split lines longer than 80 characters into two or more lines.
Appropriate break points are the end of a sentence and a subordinate
clause; after punctuation marks.

Line 7, length 93

\fBalsactl\fP [\fIoptions\fP] [\fIstore\fP|\fIrestore\fP|\fIinit\fP] <card # or id or device>

Line 110, length 92

Select the boot / hotplug ALSA configuration directory to use. The default is /var/lib/alsa.

Line 231, length 82

<abramo@alsa\-project.org>. This document is by Paul Winkler <zarmzarm@erols.com>.


-.-.

Use \(en (en-dash) for a dash between space characters,
not a minus (\-) or a hyphen (-), except in the NAME section.

alsactl.1:162:ALSA_CONFIG_PATH to read different or optimized configuration - may be

-.-.

Name of a manual is set in bold, the section in roman.
See man-pages(7).

223:alsactl_init(7)

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".

alsactl.1:36:configuration file. If restoring fails (eventually partly), the init
alsactl.1:120:file (including the global state file).
alsactl.1:188:Set the process priority (see 'man nice')

-.-.

Two or more space charaters between printable characters.

When the distance is between sentences,
start the beginning of the second one on a separate line
("semantic newline").

128:Used with restore command.  Try to restore the matching control elements
129:as much as possible.  This option is set as default now.
138:Used with restore command.  Don't restore mismatching control elements.
143:Don't initialize cards if restore fails.  Since version 1.0.18,
145:as default.  But this can cause incompatibility with the older version.
147:exists.  This option takes the restore behavior back to the older
208:settings.  More importantly, alsactl is

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -ww -b -z ":

troff: backtrace: file '<stdin>':93
troff:<stdin>:93: warning: trailing space in the line
troff: backtrace: file '<stdin>':224
troff:<stdin>:224: warning: trailing space in the line

--EA3fa+uv7YkAxoyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="alsactl.1.diff"

--- alsactl.1	2024-11-27 01:36:34.387486580 +0000
+++ alsactl.1.new	2024-11-27 01:53:30.810769721 +0000
@@ -4,7 +4,8 @@ alsactl \- advanced controls for ALSA so
 
 .SH SYNOPSIS
 
-\fBalsactl\fP [\fIoptions\fP] [\fIstore\fP|\fIrestore\fP|\fIinit\fP] <card # or id or device>
+\fBalsactl\fP [\fIoptions\fP] [\fIstore\fP|\fIrestore\fP|\fIinit\fP] <card # \
+or id or device>
 
 \fBalsactl\fP \fImonitor\fP <card # or id>
 
@@ -14,8 +15,10 @@ alsactl \- advanced controls for ALSA so
 
 .SH DESCRIPTION
 \fBalsactl\fP is used to control advanced settings for the ALSA
-soundcard drivers. It supports multiple soundcards. If your card has
-features that you can't seem to control from a mixer application,
+soundcard drivers.
+It supports multiple soundcards.
+If your card has features
+that you can't seem to control from a mixer application,
 you have come to the right place.
 
 .SH COMMANDS
@@ -38,13 +41,13 @@ action is called.
 
 .SS nrestore <card>
 
-This command is like \fIrestore\fP, but it notifies also the daemon
-to do new rescan for available soundcards.
+This command is like \fIrestore\fP,
+but it notifies also the daemon to do new rescan for available soundcards.
 
 .SS init <card>
 
-This command tries to initialize all devices to a default state. If device
-is not known, error code 99 is returned.
+This command tries to initialize all devices to a default state.
+If device is not known, error code 99 is returned.
 
 .SS daemon
 
@@ -56,8 +59,8 @@ This command is like \fIdaemon\fP but re
 
 .SS kill <cmd>
 
-This command notifies the daemon to do the specified operation (quit,
-rescan, save_and_quit).
+This command notifies the daemon to do the specified operation
+(quit, rescan, save_and_quit).
 
 .SS monitor <card>
 
@@ -73,8 +76,8 @@ collected from the given control device
 
 This command cleans the controls created by applications.
 
-The optional element identifiers are accepted as a filter. One extra
-argument is parsed as an element identifiers.
+The optional element identifiers are accepted as a filter.
+One extra argument is parsed as an element identifiers.
 
 \fIExample:\fP alsactl clean 0 "name='PCM'" "name='Mic Phantom'"
 
@@ -90,7 +93,7 @@ Note that the configuration hooks are ev
 .SH OPTIONS
 
 .TP
-\fI\-h, \-\-help\fP 
+\fI\-h, \-\-help\fP
 Help: show available flags and commands.
 
 .TP
@@ -103,21 +106,24 @@ Print alsactl version number.
 
 .TP
 \fI\-f, \-\-file\fP
-Select the configuration file to use. The default is /var/lib/alsa/asound.state.
+Select the configuration file to use.
+The default is /var/lib/alsa/asound.state.
 
 .TP
 \fI\-a, \-\-config-dir\fP
-Select the boot / hotplug ALSA configuration directory to use. The default is /var/lib/alsa.
+Select the boot / hotplug ALSA configuration directory to use.
+The default is /var/lib/alsa.
 
 .TP
 \fI\-l, \-\-lock\fP
-Use the file locking to serialize the concurrent access to the state file (this
-option is default for the global state file).
+Use the file locking to serialize the concurrent access to the state file
+(this option is default for the global state file).
 
 .TP
 \fI\-L, \-\-no-lock\fP
 Do not use the file locking to serialize the concurrent access to the state
-file (including the global state file).
+file
+(including the global state file).
 
 .TP
 \fI\-O, \-\-lock-state-file\fP
@@ -130,21 +136,27 @@ as much as possible.  This option is set
 
 .TP
 \fI\-g, \-\-ignore\fP
-Used with store, restore and init commands. Do not show 'No soundcards found'
-and do not set an error exit code when soundcards are not installed.
+Used with store, restore and init commands.
+Do not show 'No soundcards found'
+and do not set an error exit code
+when soundcards are not installed.
 
 .TP
 \fI\-P, \-\-pedantic\fP
-Used with restore command.  Don't restore mismatching control elements.
+Used with restore command.
+Don't restore mismatching control elements.
 This option was the old default behavior.
 
 .TP
 \fI\-I, \-\-no\-init\-fallback\fP
-Don't initialize cards if restore fails.  Since version 1.0.18,
+Don't initialize cards if restore fails.
+Since version 1.0.18,
 \fBalsactl\fP tries to initialize the card with the restore operation
-as default.  But this can cause incompatibility with the older version.
-The caller may expect that the state won't be touched if no state file
-exists.  This option takes the restore behavior back to the older
+as default.
+But this can cause incompatibility with the older version.
+The caller may expect
+that the state won't be touched if no state file exists.
+This option takes the restore behavior back to the older
 version by suppressing the initialization.
 
 .TP
@@ -158,9 +170,10 @@ Remove runstate file at first.
 
 .TP
 \fI\-E, \-\-env\fP #=#
-Set environment variable (useful for init action or you may override
-ALSA_CONFIG_PATH to read different or optimized configuration - may be
-useful for "boot" scripts).
+Set environment variable
+(useful for init action
+or you may override ALSA_CONFIG_PATH to read different
+or optimized configuration \(en may be useful for "boot" scripts).
 
 .TP
 \fI\-i, \-\-initfile\fP
@@ -193,39 +206,40 @@ Set the process scheduling policy to idl
 
 .TP
 \fI\-D, \-\-ucm-defaults\fP
-Execute also the 'defaults' section from the UCM configuration. The standard
-behaviour is to execute only 'once' section.
+Execute also the 'defaults' section from the UCM configuration.
+The standard behaviour is to execute only 'once' section.
 
 .TP
 \fI\-U, \-\-no-ucm\fP
-Skip the UCM init even if available. It may be useful for the test the
-legacy init configuration.
+Skip the UCM init even if available.
+It may be useful for the test the legacy init configuration.
 
 .SH FILES
-\fI/var/lib/alsa/asound.state\fP (or whatever file you specify with the
-\fB\-f\fP flag) is used to store current settings for your
-soundcards. The settings include all the usual soundcard mixer
-settings.  More importantly, alsactl is
-capable of controlling other card-specific features that mixer apps
-usually don't know about.
+\fI/var/lib/alsa/asound.state\fP
+(or whatever file you specify with the \fB\-f\fP flag)
+is used to store current settings for your soundcards.
+The settings include all the usual soundcard mixer settings.
+More importantly,
+alsactl is capable of controlling other card-specific features
+that mixer apps usually don't know about.
 
 The configuration file is generated automatically by running
 \fBalsactl store\fP. Editing the configuration file by hand may be
-necessary for some soundcard features (e.g. enabling/disabling
+necessary for some soundcard features (e.g., enabling/disabling
 automatic mic gain, digital output, joystick/game ports, some future MIDI
 routing options, etc).
 
 .SH SEE ALSO
-\fB
-amixer(1),
-alsamixer(1),
-aplay(1),
-alsactl_init(7)
-\fP
+.BR \
+amixer "(1), "\
+alsamixer "(1), "\
+aplay "(1), "\
+alsactl_init (7)
 
-.SH BUGS 
+.SH BUGS
 None known.
 
 .SH AUTHOR
-\fBalsactl\fP is by Jaroslav Kysela <perex@perex.cz> and Abramo Bagnara
-<abramo@alsa\-project.org>. This document is by Paul Winkler <zarmzarm@erols.com>.
+\fBalsactl\fP is by Jaroslav Kysela <perex@perex.cz>
+and Abramo Bagnara <abramo@alsa\-project.org>.
+This document is by Paul Winkler <zarmzarm@erols.com>.

--EA3fa+uv7YkAxoyi--
