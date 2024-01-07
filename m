Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DAA8274F7
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 17:22:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2809D7F1;
	Mon,  8 Jan 2024 17:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2809D7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704730942;
	bh=I96i702ehEXV2bP/es9iEcyvt819MhmZKF2jCxGP+eQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hSK2UM7eOcM4DxPBRVy0cB6Wt/HILh9nO7FiuMkPJTO1lomYr0LsHci8Nl4wds/Xs
	 /wKJn5qLibBR3bB+Lf/SA2oTJPMMneE6J43i8jKgZdvNC+94PFARO1HVU6gmVo9t3P
	 JC5f1hVeJFzQd18prHOq7+/h63WWCJ2jhRFM2UVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F40F6F80246; Mon,  8 Jan 2024 17:21:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43225F80564;
	Mon,  8 Jan 2024 17:21:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEDDAF80246; Sun,  7 Jan 2024 14:49:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F070F800F5
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 14:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F070F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZygQyvrA
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-78314e00337so80631085a.0
        for <alsa-devel@alsa-project.org>;
 Sun, 07 Jan 2024 05:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704635350; x=1705240150;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0c+9gb4cntrTPDiZ4Yi2sXbAz1IqGZQbNwa9w9EdZI=;
        b=ZygQyvrALLJxs+Q5wY/98l8jSe0zFuBu7zy3N8VNrnNK7k37i1mY6Eqj5r4GDdhpu7
         KLlGPnD7rnFJLzFEFbbHhHnK3ahdszs+5ksKPZ/ATWqk1xvWP/ORlyrVQaZX+PryxsmM
         OmJ2wB0apmMxl639yjj61u05axOzAPA44T40lfpxbwD1bALVhWlf4wU2RqsrtH/TCj2p
         tM7G1pxJRv/NgA2B0Y/iISB4Z+pn2o9FC3iKTl6eJyDzSY6oQhSTL25QqSB6vDuuDoXI
         xHSldg92zXMqgdFnHHRGEh6SZGiMo0VgPxH3ngHvMLpNMCrqs/xJGbjtQnJv7pvJJxjF
         HJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704635350; x=1705240150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0c+9gb4cntrTPDiZ4Yi2sXbAz1IqGZQbNwa9w9EdZI=;
        b=r6Qe4h3AQi4TPGbgVS7pcApe+MLR4cLIVLvQONUrjY2c77XvoY6qr9Yr0ytRdUobG0
         1RIVTpOBGY+FXt99qKpReowJbv4nQL3N3IumceJpmqh96CEY91QB38Tf/gI5sxDJ2gMu
         23oJK8f3Dp1FcXFjBtXExAMShkrorn+MS1ZTp9GDTofi4v4V8is37xFeFRAg6DJOT5Mw
         qNjDVqN6LaifodDD7bpn4w02BGEvcaYv8V/ID/3sB5ax0Qy5Nz5tMDU3czVBcJttuHrV
         wwS7kEdlWxKBzeGKHagoNVyXOrMZ/l1M3wGxEWq34HWy00QXwVQdHSaaoBVIQqwnS9Uc
         LkpQ==
X-Gm-Message-State: AOJu0YyVM724tIV1QK46SW/zzVQtb9/miFuAWyoZ5YGE11MqF19D8sS1
	LkWSB/slvhE/BYFFE8WRqE1LWz17K3k=
X-Google-Smtp-Source: 
 AGHT+IG22L27g5wT2yYxCgM90j0lfDsCBT1Y82Fy/BDZIVuuynwV97oHi7MFHbR12Cn+h64nuslVAw==
X-Received: by 2002:a05:620a:5615:b0:781:5c55:d7bf with SMTP id
 vu21-20020a05620a561500b007815c55d7bfmr2159676qkn.110.1704635350111;
        Sun, 07 Jan 2024 05:49:10 -0800 (PST)
Received: from localhost.localdomain ([2602:47:d950:3e00:64e5:89b4:ac:57eb])
        by smtp.googlemail.com with ESMTPSA id
 os8-20020a05620a810800b0078310c390ffsm1120279qkn.9.2024.01.07.05.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 05:49:09 -0800 (PST)
From: Nicholas Vinson <nvinson234@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Nicholas Vinson <nvinson234@gmail.com>
Subject: [PATCH 0/4] Clang: fix versioned symbol build errors
Date: Sun,  7 Jan 2024 08:48:52 -0500
Message-ID: <cover.1704635150.git.nvinson234@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: nvinson234@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R4M3K3J7COXIP63XPCMD7CJGNJ5ZZEYZ
X-Message-ID-Hash: R4M3K3J7COXIP63XPCMD7CJGNJ5ZZEYZ
X-Mailman-Approved-At: Mon, 08 Jan 2024 16:21:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4M3K3J7COXIP63XPCMD7CJGNJ5ZZEYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When building alsa-lib with the following settings

    CFLAGS='-O3 -pipe'
    CXXFLAGS='-O3 -pipe'
    LDFLAGS=-Wl,-O1		\
	-Wl,--as-needed		\
	-fuse-ld=lld		\
	-rtlib=compiler-rt	\
	-unwindlib=libunwind

the build fails with errors similar to

    ld.lld: error: version script assignment of 'ALSA_0.9.5' to symbol
	'alsa_lisp' failed: symbol not defined

This patch corrects that issue and additional issues found while making
corrections so alsa-lib will successfully build using clang and ld.lld.

This patch set was also submitted as a github PR
(https://github.com/alsa-project/alsa-lib/pull/376).

Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>

Nicholas Vinson (4):
  configure.ac: Update AC_OUTPUT() function
  src/Versions.in: Add guards for opt. alisp symbols
  src/Versions.in: Add guards for pcm and timer syms
  libatopology: Remove version-script flags

 configure.ac                        | 34 +++++++++++++++--------------
 src/Makefile.am                     | 14 +++++++++++-
 src/{Versions.in => Versions.in.in} | 17 +++++++++++++++
 src/topology/Makefile.am            |  8 +------
 4 files changed, 49 insertions(+), 24 deletions(-)
 rename src/{Versions.in => Versions.in.in} (95%)

-- 
2.43.0

