Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DD5A4FA58
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:38:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFCE760387;
	Wed,  5 Mar 2025 10:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFCE760387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167529;
	bh=NiA8B3e0ANak57mTI6oFWzPGBLit725o1Kfiqp5IVuE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bq20OzCUxCWl03xVAPg1A4iIfjIqGzEBg1zO9C4dEaiZUcLvK6G2qPWcEWfracUMc
	 vUiu3C2hd4v7sxRdtyiNyPSfhUBeK4zvVoryAYWGQ4MKuF3RIi9VI0F+fQcJ+a6c7d
	 ju0fHLy0/TK/AyvskKYS7DP+BJmaCJDrdV8mSUco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D579F806EF; Wed,  5 Mar 2025 10:36:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6EFF806F2;
	Wed,  5 Mar 2025 10:36:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD55DF800C1; Sat,  1 Mar 2025 16:36:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-03.simnet.is (smtp-out1-03.simnet.is
 [194.105.232.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 255D8F800C1
	for <alsa-devel@alsa-project.org>; Sat,  1 Mar 2025 16:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 255D8F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=G+dIXKdK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1740843399; x=1772379399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JRJCPtBEngPYbKT68vpCqbvINZFmXHRVmsuFvuHMi68=;
  b=G+dIXKdKA7Dy9b+SgzG+OW/Pymb2uio2XlGZut74w3NTODM9USYCVHLJ
   u63BB+WQkiMnhYqakVmSWP/SQ4vJlCPWGiijPTPJQvqwqN/eVhCLQB0dk
   sMh5D/dqUANiJPrp5WPTIOopoy4vvIPX9eKb+EzQGtcFvI72EefagXnZZ
   a8yM+/p0h7jM9Mp5vtnObHQ15SzfyyR4uyh0oA5oGEHe3zb3RL5kxWUK+
   +vKf8tzdXLwbTM6ukQZxvRO7sZt6Cxl6AxL5Qu4vrR6seYdnby8PRH3zR
   T6EVRgGoFxQ7rQR5A5/FA8hqSfhjxS2SHMmYvCM2wMoAjnaZFnQErM871
   w==;
X-CSE-ConnectionGUID: sze3pjwnQV6zAC3L5MlsBQ==
X-CSE-MsgGUID: 9gyGcWw+Ra+mMPXbfrekSg==
Authentication-Results: smtp-out-03.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2EJAAD/JcNnhVjoacJaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIFBAwEBAQELAYJDfYFkBIghjiGRSoxNFIEsRgcBAQEPOwkEA?=
 =?us-ascii?q?QEDAQOCDIJ0ixcoNgcOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBgEBAQEBA?=
 =?us-ascii?q?QYHAhABAQEBQA47hTVGDYMWUx5lCQYBAQEBAQEBAQEBAQEBASIBAQEBJwICC?=
 =?us-ascii?q?4ErUi18J4MCAYJkFAavUIEBM4EBgxzbGIFeEIFIAYVrgmMBhWuEdzwGgg2BF?=
 =?us-ascii?q?TIDgQZQHVFvghRNAwEYgS1FhhgEghgXgTuCAoFqhyWCOYEXg3CDU4JfgT0gE?=
 =?us-ascii?q?pFjSIEhA1ksAVUTDQoLBwWBcQM1DAsuFTKBFEM3N4IOaUk6Ag0CNYIefIIrg?=
 =?us-ascii?q?luBeYRDhECFUoIRizeEdR02CgMLGA1IESw3FBtEbgehAQE8g0UJAS42AQYGA?=
 =?us-ascii?q?QEwDBw1ASkBIzYtDAcDMAYECx0BUCmSVkSPWYFEoCSBPoQlhlyDMYILlUozI?=
 =?us-ascii?q?oNhgVeRaww6kSaBJZh9jgWVGU8NARg3hGeBbgOCDCwHGggwO4JnCUkZD44HI?=
 =?us-ascii?q?wMWiDU2wwN4AgE5AgcLAQEDCYZNixoBAQ?=
IronPort-PHdr: A9a23:W5yxeRCqDmLH+M9GsAZKUyQVQxdPi9zP1m898Z87k/dJb7jmp8+kJ
 03a4/hxyl7SDs3X6PNB3uzRta2oGWkN+o2Iv31KdptQHwQEhsMbk01oAMOMBUDhav+/aSs8E
 ax/
IronPort-Data: A9a23:anYTO6MLT2vtywnvrR1Xk8FynXyQoLVcMsEvi/8bNLSZYAhShG1co
 T9OB3fTeL2UMz62KpwlNZO3xf41yZPTn4VnGlZrqHgwQi4U9cPOWNrHcB6sNn3DIJLJQR89s
 8tCOonLJZ5kE3ON+RyjPOPr9iUj3P6FGbHyAbSeaioZqWOIMMsEoUsLd7kR3NUy2rBVej+lu
 c/uu5+Yf1Ckx3h9Nnkd3+ebshRtsf/u/jQCsRtpfaVCuETXozwRDZhZKqCtfHKtSI1TFL20E
 v3Zx/ak9Wae5x43Ed6/1L2TTqFxeVKuAOT0oj8KHfDKvzBCujAqgOF8K+UDL05TkDzMh8p2y
 thGqdq3UwhuN6nXkaERVBIfGiVlNOhC+bWALmK4rNSk+FDNdj3s3/BqZH3aRrb0jNube0kWs
 6NwFRgNcgyb1aXx362kDOBonc0XadHxO4ESsW0myivWSv8iWpn3BqnN7phR2Cw5soVKHPyZa
 NAedCJYWwnLZltPJlITYK7S59xE+kQTCRUd9BTNzZcK3lQ/peAJPNLFOd7Oc8GBQIMM2EqZq
 GyuEw/RCBtAbdLPwmaPqXyi3bLGx33xUd5NHbTjqKM2iwaenTQaUBZLBFfl/vC10RO1BY4DI
 EdK8yR+pPg+rBXyEdenBnVUzJL8Ujs0ArK8RMVnt1rVokat3y6ZGnQcHHkGZ9068sYyXjUek
 0eTmNHkDiApt6eaDiWFo76QtjqGfCwUJykNZDNXRF4P597p849mlQjECctoFemth8fuFCu2y
 Fi2QFMFa8kuYbQjkvn9pTj6qzKwuoCbCUk65xmRV2a+5zc8fJSiZYGj9R7c9/kXNNOQSkKIi
 D0AmsLY4+ESXpjYniiKSrYDSaqz7LGxYiDXhBlbTYEo7S+g4TioFby8mwqSWHqFSO5BJXmxC
 HL7uR9N/M0Ue2S1cul+Z5m4TtwwyqrtHsijUerbKdNKeZE0eAiMuxU8bEqL1iXpkUJrpfMwI
 5CGafGbEH0fT6R7yT7eewtm6lNd+8xE7TuVGvjG5xS7zaLMIzmKVqhDOV+VZ6Uh9qSGrQ7Jt
 dFFOIyDzw5WFeH5aW7e9ZUaaFQLJz80H5frs/tga+WGZAp6HWVJNxOq+l9XRmAft/wTyY/11
 nGhRlcKjx3gmmKBIAGRY0QmcKnoX5t0sTQ8JyNrNFKz0kxmbYGkq5NNfp8sdI1i8O1pisomQ
 OMCZt23NelET3LH5zEZBaUR17eOCClH/yrLY2z9CAUXf4J8X16OvcD7YU3m8DIHOm+vr8w8r
 ra8kATBTt0KQx9rOIPab/noxleqtExYnON4GETSJcRLT3Lx+40sKzD0ipcLz7o3xWn+KkGyk
 lrQWX8lmNTxT+bZiDWjra+JqYqzGu84FFdVBAE3hp7taXbQ9zr4yoIQXeqFdG6DXT76pq+oN
 b0En/ytPaEJxglA7Np3HekylP1kvYSy+edWk1VqESqaMVn3Uu8xLHLetSUjWtWh45cA0efhc
 hveoIMy1cy1Bf7Y/H4tyCsNZO6JjPoekDLbtvo5fh7zviF79rHZDEwIMUXW13MCfbJcPdJ+y
 4/NmuZPsFXn1UBC3vVqL8xw3z7RRpDVe/x/7vn2OKey1ExzjAkEOcGAYsPPyMnnQ81WNUU3K
 SOjiqPHhrBNrmLPaHNb+ULlhIKxvrxQ/kkRpLM+Dw7RwIed3aduhEc5HQkfF2y58D0WgoqfB
 UAzX6FFDf3m1ytlgsFFQ1etF2lpbDWF+lb8wkc+j2bQSU+lTATldAXR7s7UoSj1W0oFFtRq1
 OnwJFTNCF4GT+mttscGYnOJntS4JTBHGqIur+j8dyiNN8FSjTMIGcZCb0JQw/fsKZtZaEEqO
 YCGVQu/AEH2HXd4nkE1N2WV/a8CRUucJnNEeM8/7ooiRkWBXTWp8wHbfihdeusVTxDL2VG5E
 NArNMNKTw65xDfL9mpdG68XP/l1h5bF5vJbK++tfDZb9eHE9Hw54Po89QCn7IMva99hud08L
 4Xca3SDCQR8gFMPyjWU95IbagJUZ/FVaxzT19+qs98AVJcmiNFmf1s/0YC76iD93AxPpE7E7
 VySO8c61ddKwIB3ls7gH7tOAy29Lcj6EfyS9wK+uMgIasnAWe/VqgkQq0XPNRlZJv0dVt52n
 LLLt8T4tH4pp54oUnvF3ouAErFT4tWjGbINdNz2N2UcnDDqtNLQDwUr4HK1coRLj9Vk2Je1b
 iDjTJaVccU/YoIIrJFKUBR2HxEYAqXxS67voyKhsviBYiTxNySadLtLEle0NQlmmj80BnHoN
 uPjk9eVju20QaxSBQQYQuNnBodiJ0/yHPN8McPwriXeD3LAbrK+VlnKy0BIBdLjUyjs/CPGD
 XTtHEmWmPOa4/ig8T2hm9Yu1iD79V4k6QXKQmoT+sRtlxexB3McIOIWPP0uU84IynOsi8ynN
 GmWNAPO7BkRuxwZKH0QB/y+B2+i6hAmYIipTtDU1xrIMHnvWuts/pMwqnk7i5uJRtcT5Lr7e
 YBBqyGY0umZx5BtTK4T6JSGbRRPm5vnKoYz0RmlyaTaWk9CaZ1UjyYJNFQWCkT6/zTlzx6jy
 Z4dHjscGBnTpI+YOZoIRkO57zlH5W++kWRwPHjnLRS2k9zz8dCsAcbXY4nbuoDvpuxTTFLSb
 Rsbn1ew3l0=
IronPort-HdrOrdr: A9a23:No5yxa4Y1SnJGJlUKQPXwMPXdLJyesId70hD6qm+c202TiW9rb
 HWoB17726TtN9/YhAdcLy7WJVoIkmskqKdg7NhWYtKNTOO0ADDQe0Mg7cKqAeQfhEWmNQttp
 uIC5IOcOHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ALCVPqmiU8gIcVFJ4ctfoXJkUOzJuaW/Ql2/SPEm?=
 =?us-ascii?q?BNzh7YZbObQK1/LhOqp87?=
X-Talos-MUID: 9a23:+nW47wolH+qlHr2CZWoez2BtJehj3LvtMklOlLA+i8OKLyFzADjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,325,1732579200";
   d="1'?diff'?bugs'?scan'208";a="39213378"
Received: from vist-zimproxy-02.vist.is ([194.105.232.88])
  by smtp-out-03.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2025 15:36:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id 2EEED444632B;
	Sat,  1 Mar 2025 15:36:36 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 4QJ2MHSqqu5Y; Sat,  1 Mar 2025 15:36:34 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id D09284446481;
	Sat,  1 Mar 2025 15:36:34 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id gZw9jFGR1tHQ; Sat,  1 Mar 2025 15:36:34 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTPS id 9FE44444632B;
	Sat,  1 Mar 2025 15:36:34 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1toOtG-000000001iS-09lP;
	Sat, 01 Mar 2025 15:36:34 +0000
Date: Sat, 1 Mar 2025 15:36:33 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Cc: Debian Bug Tracking System <submit@bugs.debian.org>
Subject: alsaucm.1: Some remarks and a patch with editorial changes for this
 man page
Message-ID: 
 <174084317735.6540.16110786643260809278.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="arZipvw0uTFSQO46"
Content-Disposition: inline
X-Mailer: reportbug 13.1.0
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CHDBT43SYWLPKH2XHS4I6BXN6ZLPZ5UK
X-Message-ID-Hash: CHDBT43SYWLPKH2XHS4I6BXN6ZLPZ5UK
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:36:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHDBT43SYWLPKH2XHS4I6BXN6ZLPZ5UK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--arZipvw0uTFSQO46
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


an.tmac:<stdin>:30: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")


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

Kernel: Linux 6.12.12-amd64 (SMP w/2 CPU threads; PREEMPT)
Locale: LANG=is_IS.iso88591, LC_CTYPE=is_IS.iso88591 (charmap=ISO-8859-1), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: sysvinit (via /sbin/init)

Versions of packages alsa-utils depends on:
ii  kmod              33+20240816-2
ii  libasound2t64     1.2.13-1+b1
ii  libatopology2t64  1.2.13-1+b1
ii  libc6             2.40-7
ii  libfftw3-single3  3.3.10-2+b1
ii  libncursesw6      6.5+20250216-1
ii  libsamplerate0    0.2.2-4+b2
ii  libtinfo6         6.5+20250216-1

alsa-utils recommends no packages.

Versions of packages alsa-utils suggests:
pn  dialog  <none>

-- no debconf information

--arZipvw0uTFSQO46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.alsaucm.1"

Input file is alsaucm.1

Output from "mandoc -T lint  alsaucm.1": (shortened list)

      1 input text line longer than 80 bytes: ALSA Use Case Interf...
      1 input text line longer than 80 bytes: The master use case ...
      1 input text line longer than 80 bytes: Use Case Interface: ...
      1 input text line longer than 80 bytes: files. An audio use ...
      6 skipping paragraph macro: sp after SH
      2 whitespace at end of input line

Remove trailing space with: sed -e 's/  *$//'

-.-.

Output from "test-groff -mandoc -t -ww -z alsaucm.1": (shortened list)

      2 trailing space in the line

Remove trailing space with: sed -e 's/  *$//'

-.-.

Show if generated from reStructuredText

Who is actually generating this man page?  Debian or upstream?

Is the generating software out of date?

1:.\" Man page generated from reStructuredText.

-.-.

Remove space characters (whitespace) at the end of lines.
Use "git apply ... --whitespace=fix" to fix extra space issues, or use
global configuration "core.whitespace".

Number of lines affected is

2

-.-.

Remove space in the first column, if not indented.
Use ".in +<number>n" and ".in" to end it; ".nf" and ".fi" to end
it, for an extra indention.

alsaucm.1:40: from the command line.
alsaucm.1:237: <http://git.alsa\-project.org/?p=alsa\-lib.git;a=blob;f=src/ucm/parser.c> 

-.-.

Strings longer than 3/4 of a standard line length (80)
Use "\:" to split the string at the end of an output line, for example a
long URL (web address)

39 Interface <http://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm.html>
149 ALSA Use Case Interface <http://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm.html>
237  <http://git.alsa\-project.org/?p=alsa\-lib.git;a=blob;f=src/ucm/parser.c> 
285 Use Case Interface:  <http://www.alsa\-project.org/alsa\-doc/alsa\-lib/group__ucm.html> 

-.-.

Add a "\&" (or a comma (Oxford comma)) after "e.g." and "i.e.",
or use English words
(man-pages(7)).
Abbreviation points should be marked as such and protected against being
interpreted as an end of sentence, if they are not, and that independent
of the current place on the line.

59:The verb describes the use case action i.e. a phone call, listening to music,
61:and playback hardware i.e. headphones, phone handset, bluetooth headset, etc.
216:supported use cases, e.g.

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

Some sentences (etc.) do not begin on a new line.

Split (sometimes) lines after a punctuation mark; before a conjunction.

N.B.

  The number of lines affected can be too large to be in a patch.

  Lines with only one (or two) space(s) between sentences could be split,
so latter sentences begin on a new line.

Use

#!/usr/bin/sh

sed -e '/^\./n' \
-e 's/\([[:alpha:]]\)\.  */\1.\n/g' $1

to split lines after a sentence period.
Check result with the difference between the formatted outputs.
See also the attachment "general.bugs"

57:files. An audio use case can be defined by a \fBverb\fP and \fBdevice\fP parameter.
60:recording a conversation etc. The device describes the physical audio capture

-.-.

Split lines longer than 80 characters into two or more lines.
Appropriate break points are the end of a sentence and a subordinate
clause; after punctuation marks.
Add "\:" to split the string for the output, "\<newline>" in the source.  

Line 57, length 83

files. An audio use case can be defined by a \fBverb\fP and \fBdevice\fP parameter.

Line 114, length 81

\fB_devices[/{verb}]\fP \- get list of supported devices (in pair device+comment)

Line 116, length 87

\fB_modifiers[/{verb}]\fP \- get list of supported modifiers (in pair modifier+comment)

Line 137, length 82

\fB_conflictingdevs/{modifier}|{device}[/{verb}]\fP \- list of conflicting devices

Line 149, length 87

ALSA Use Case Interface <http://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm.html>

Line 212, length 91

The master use case files for each supported sound card are in \fB/usr/share/alsa/ucm\fP\&.

Line 285, length 88

Use Case Interface:  <http://www.alsa\-project.org/alsa\-doc/alsa\-lib/group__ucm.html> 

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".

alsaucm.1:38:alsaucm (ALSA Use Case Manager) is a program to use the ALSA Use Case
alsaucm.1:79:batch mode (use \fB\(aq\-\(aq\fP for the stdin input)
alsaucm.1:112:\fB_verbs\fP \- get verb list (in pair verb+comment)
alsaucm.1:114:\fB_devices[/{verb}]\fP \- get list of supported devices (in pair device+comment)
alsaucm.1:116:\fB_modifiers[/{verb}]\fP \- get list of supported modifiers (in pair modifier+comment)

-.-.

No need for '\&' to be in front of a period (.),
if there is a character in front of it.

Remove with "sed -e 's/\\&\././g'".


95:valid names are sound card names as listed in \fB/usr/share/alsa/ucm\fP\&.
212:The master use case files for each supported sound card are in \fB/usr/share/alsa/ucm\fP\&.
234:\fB/usr/share/alsa/ucm/PandaBoard/hifi\fP\&.

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z ":

an.tmac:<stdin>:30: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")
an.tmac:<stdin>:40: style: 1 leading space(s) on input line
an.tmac:<stdin>:237: style: 1 leading space(s) on input line
troff:<stdin>:237: warning: trailing space in the line
troff:<stdin>:285: warning: trailing space in the line

-.-.

Spelling:

switche -> switch

-.-

Generally:

Split (sometimes) lines after a punctuation mark; before a conjunction.

--arZipvw0uTFSQO46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="alsaucm.1.diff"

--- alsaucm.1	2025-03-01 14:55:25.265148045 +0000
+++ alsaucm.1.new	2025-03-01 15:26:40.241393658 +0000
@@ -31,13 +31,14 @@ level margin: \\n[rst2man-indent\\n[rst2
 .SH NAME
 alsaucm \- ALSA Use Case Manager
 .SH SYNOPSIS
-.sp
-\fIalsaucm\fP <options> [command]
+.B alsaucm
+.IR <options> " [" command ]
 .SH DESCRIPTION
-.sp
-alsaucm (ALSA Use Case Manager) is a program to use the ALSA Use Case
-Interface <http://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm.html>
- from the command line.
+alsaucm
+(ALSA Use Case Manager)
+is a program to use the ALSA Use Case
+Interface <http://www.alsa-project.org/\:alsa-doc/\:alsa-lib/\:group__ucm.html>
+from the command line.
 .sp
 On complex sound cards, setting up audio routes is not trivial and mixer
 settings can conflict one another preventing the audio card to work at all.
@@ -54,13 +55,14 @@ ALSA kcontrols to change the hardware di
 match the requested device use case.
 .sp
 The use case manager kcontrol configurations are stored in easy to modify text
-files. An audio use case can be defined by a \fBverb\fP and \fBdevice\fP parameter.
+files.
+An audio use case can be defined by a \fBverb\fP and \fBdevice\fP parameter.
 .sp
-The verb describes the use case action i.e. a phone call, listening to music,
-recording a conversation etc. The device describes the physical audio capture
-and playback hardware i.e. headphones, phone handset, bluetooth headset, etc.
+The verb describes the use case action i.e.\& a phone call, listening to music,
+recording a conversation etc.
+The device describes the physical audio capture
+and playback hardware i.e.\& headphones, phone handset, bluetooth headset, etc.
 .SH OPTIONS
-.sp
 Available options:
 .INDENT 0.0
 .INDENT 3.5
@@ -76,7 +78,8 @@ open card NAME
 interactive mode
 .TP
 .B \fB\-b\fP, \fB\-\-batch\fP \fIFILE\fP
-batch mode (use \fB\(aq\-\(aq\fP for the stdin input)
+batch mode
+(use \fB\(aq\-\(aq\fP for the stdin input)
 .TP
 .B \fB\-n\fP, \fB\-\-no\-open\fP
 do not open first card found
@@ -92,7 +95,7 @@ Available commands:
 .B \fBopen\fP \fINAME\fP
 open card NAME.
 .sp
-valid names are sound card names as listed in \fB/usr/share/alsa/ucm\fP\&.
+valid names are sound card names as listed in \fB/usr/share/alsa/ucm\fP.
 .TP
 .B \fBreset\fP
 reset sound card to default state.
@@ -109,11 +112,14 @@ list command, for items returning two en
 the value of the \fIIDENTIFIER\fP argument can be:
 .INDENT 7.0
 .IP \(bu 2
-\fB_verbs\fP \- get verb list (in pair verb+comment)
+\fB_verbs\fP \- get verb list \
+(in pair verb+comment)
 .IP \(bu 2
-\fB_devices[/{verb}]\fP \- get list of supported devices (in pair device+comment)
+\fB_devices[/{verb}]\fP \- get list of supported devices \
+(in pair device+comment)
 .IP \(bu 2
-\fB_modifiers[/{verb}]\fP \- get list of supported modifiers (in pair modifier+comment)
+\fB_modifiers[/{verb}]\fP \- get list of supported modifiers \
+(in pair modifier+comment)
 .UNINDENT
 .sp
 The forms without the trailing \fB/{verb}\fP are valid only after a specific
@@ -134,7 +140,8 @@ it can be:
 .IP \(bu 2
 \fB_supporteddevs/{modifier}|{device}[/{verb}]\fP \- list of supported devices
 .IP \(bu 2
-\fB_conflictingdevs/{modifier}|{device}[/{verb}]\fP \- list of conflicting devices
+\fB_conflictingdevs/{modifier}|{device}[/{verb}]\fP \- list of
+conflicting devices
 .UNINDENT
 .TP
 .B \fBget\fP \fIIDENTIFIER\fP
@@ -145,9 +152,9 @@ the value of the \fIIDENTIFIER\fP argume
 .IP \(bu 2
 \fB_verb\fP \- return current verb
 .IP \(bu 2
-\fB[=]{NAME}[/[{modifier}|{/device}][/{verb}]]\fP (For valid NAMEs look at the
-ALSA Use Case Interface <http://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm.html>
-)
+\fB[=]{NAME}[/[{modifier}|{/device}][/{verb}]]\fP \
+(For valid NAMEs look at the ALSA Use Case Interface
+<http://www.alsa-project.org/\:alsa-doc/\:alsa-lib/\:group__ucm.html>)
 .UNINDENT
 .TP
 .B \fBgeti\fP \fIIDENTIFIER\fP
@@ -173,7 +180,7 @@ The value of the \fIIDENTIFIER\fP argume
 .IP \(bu 2
 \fB_disdev\fP \- disable the device specified by \fIVALUE\fP
 .IP \(bu 2
-\fB_swdev/{old_device}\fP \- switche device:
+\fB_swdev/{old_device}\fP \- switch device:
 .INDENT 2.0
 .IP \(bu 2
 disable \fIold_device\fP and then enable the device specified by
@@ -208,12 +215,12 @@ quit
 .UNINDENT
 .UNINDENT
 .SH FILES
-.sp
-The master use case files for each supported sound card are in \fB/usr/share/alsa/ucm\fP\&.
+The master use case files for each supported sound card are in
+\fB/usr/share/alsa/ucm\fP.
 .sp
 For example, the master use case file for the \fIPandaboard\fP card is in
 \fB/usr/share/alsa/ucm/PandaBoard/PandaBoard.conf\fP, this file lists all the
-supported use cases, e.g.
+supported use cases, e.g.\&
 .INDENT 0.0
 .INDENT 3.5
 .sp
@@ -231,12 +238,11 @@ Each use case defines a _verb, which is
 the \fBFile\fP directive, like above.
 .sp
 The \fBHiFi\fP verb above is described in
-\fB/usr/share/alsa/ucm/PandaBoard/hifi\fP\&.
+\fB/usr/share/alsa/ucm/PandaBoard/hifi\fP.
 .sp
 For more details on the syntax of UCM files, see the alsa\-lib source code:
- <http://git.alsa\-project.org/?p=alsa\-lib.git;a=blob;f=src/ucm/parser.c> 
+<http://git.alsa\-project.org/\:?p=alsa\-lib.git;a=blob;f=src/\:ucm/\:parser.c>
 .SH EXAMPLES OF USE
-.sp
 Some commands, like for instance \fBlist _devices\fP,
 can only work after setting a \fB_verb\fP in the \fBsame execution\fP, for
 instance this sequence doesn\(aqt work:
@@ -282,10 +288,10 @@ EOM
 .SH SEE ALSO
 .INDENT 0.0
 .IP \(bu 2
-Use Case Interface:  <http://www.alsa\-project.org/alsa\-doc/alsa\-lib/group__ucm.html> 
+Use Case Interface: \
+<http://www.alsa\-project.org/\:alsa\-doc/\:alsa\-lib/\:group__ucm.html>
 .UNINDENT
 .SH BUGS
-.sp
 None known.
 .SH AUTHOR
 Antonio Ospite <ao2@ao2.it>

--arZipvw0uTFSQO46
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

--arZipvw0uTFSQO46--
