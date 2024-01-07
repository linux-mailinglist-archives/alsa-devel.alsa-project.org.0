Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A16A08274F8
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 17:22:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12F1A844;
	Mon,  8 Jan 2024 17:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12F1A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704730963;
	bh=FSDlVm0rLhEYeDuV0E8E+AKyN9rpWnOJ0CT1flbEcqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbtBqZNB7Llur4DWNp2Ypl+/cUYZNHgh0qfrDP+iPnCtqEdpVY/JdjPFXKS5JF5hV
	 ygvbOyk/3j5OF3Wy7d+GflGQpnCjCAzd7w+mZRLBPQ83hi4lPmkMneJNvMuAWZ68r2
	 WsXjec8oCQtoW/7HfkPmYptudPa/RZSnuS7frRa4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5345CF805CA; Mon,  8 Jan 2024 17:21:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BC1AF805C0;
	Mon,  8 Jan 2024 17:21:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EF05F80246; Sun,  7 Jan 2024 14:49:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65A1BF800F5
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 14:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A1BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B5QwIo0M
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-78313f4d149so133494385a.1
        for <alsa-devel@alsa-project.org>;
 Sun, 07 Jan 2024 05:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704635355; x=1705240155;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnRcuzP8uUbut4x7l1LBBiVBM7MaTfbqnBg/jjmN/bo=;
        b=B5QwIo0MkuoIdfQVhqegBtluEZAVHyJp/NIyc0Zt30rEJx1db8ujMeEzYL4oD66ml4
         wTReVAite3zRe3cqnir73N+lvZiyakLnztWfCt95T8QXYL1F2OrknPOhNdGeajqV2Nlr
         LgtdcnjFuqzX1cxOyBLRjA3pg2X31XDgzgIBVR2XzB35v2LHE3RR3YFr5z2YG3yoGdQ1
         bTXQiHsndP0NQgroCcPv2yMKjlnAOgGqC+K7qDmwC77UPubahtjYfg+e0mh1CWWhuNHN
         AKqrBZCObd28IedE1oV6hNd6K2w1302EUGqAiZoVLg1Bvw1fVJKg6dcT8x8FpePBdql0
         cqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704635355; x=1705240155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnRcuzP8uUbut4x7l1LBBiVBM7MaTfbqnBg/jjmN/bo=;
        b=addMrA1laVRJpnpiItXuSaVdhJRWndKDZKqn//fhRw/SwKxrliHXafRrJnsaBMHc6F
         NPjbsaZZSp6IswFQu8MFh2Sdi3+YnIRy5+76rdfH2cPxRVh7ZasFhy7fc+q1WXmNKb6i
         E7GuuIqmxQT9O08tkhf0JrteUGCkVJfqrSu95tnJEr5aFJRw2nIop5Swrax/e0OTw0QX
         yEjjrboZS3sI++0eIDznW3kLJkHuNbnYZxsRzXXbQXvPKvlyC/wqrlRfNbrqHyY972Eq
         mnlQ/4NMitFQ7suQ7TumEfswsczYH6KLxp2ZBo/RyYRrjcEmALnDyfSlqy4HVQntE2HV
         v3/w==
X-Gm-Message-State: AOJu0YzqYnjHJT6h8rKkniYtrC0Wyrz95D0F1OWLkTKpu8rm1P1IJEhj
	gPtacxKRwAKlc9HQxmkEhjvXlTngUHk=
X-Google-Smtp-Source: 
 AGHT+IHg3PKAwi35xhlUubi1aHDoDFlTKPBcrHj4s1F3JT8hEbIVaizWEQLX7QZkNaKmsVVnIfUWXg==
X-Received: by 2002:a05:620a:3636:b0:783:137d:7b4c with SMTP id
 da54-20020a05620a363600b00783137d7b4cmr2422974qkb.120.1704635355484;
        Sun, 07 Jan 2024 05:49:15 -0800 (PST)
Received: from localhost.localdomain ([2602:47:d950:3e00:64e5:89b4:ac:57eb])
        by smtp.googlemail.com with ESMTPSA id
 os8-20020a05620a810800b0078310c390ffsm1120279qkn.9.2024.01.07.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 05:49:15 -0800 (PST)
From: Nicholas Vinson <nvinson234@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Nicholas Vinson <nvinson234@gmail.com>
Subject: [PATCH 1/4] configure.ac: Update AC_OUTPUT() function
Date: Sun,  7 Jan 2024 08:48:53 -0500
Message-ID: 
 <583278d4eaaa96c3de2b053c499ac09c2a911b9d.1704635150.git.nvinson234@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1704635150.git.nvinson234@gmail.com>
References: <cover.1704635150.git.nvinson234@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: nvinson234@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2TVUZQM2G6TZZZV4LIBCBNRG4MXXTRWM
X-Message-ID-Hash: 2TVUZQM2G6TZZZV4LIBCBNRG4MXXTRWM
X-Mailman-Approved-At: Mon, 08 Jan 2024 16:21:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TVUZQM2G6TZZZV4LIBCBNRG4MXXTRWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Modern autoconf practice says AC_OUTPUT() should be called with no
arguments and generated configuration files should be specified by
calling AC_CONFIG_FILES() before AC_OUTPUT().

Update configure.ac to follow this practice.

Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>
---
 configure.ac | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/configure.ac b/configure.ac
index f86011f1..9db527c3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -747,22 +747,24 @@ if test ! -L "$srcdir"/include/alsa ; then
   ln -sf . "$srcdir"/include/alsa
 fi
 
-AC_OUTPUT(Makefile doc/Makefile doc/pictures/Makefile doc/doxygen.cfg \
-	  include/Makefile include/sound/Makefile include/sound/uapi/Makefile \
-	  src/Versions src/Makefile \
-          src/control/Makefile src/mixer/Makefile \
-	  src/pcm/Makefile src/pcm/scopes/Makefile \
-	  src/rawmidi/Makefile src/timer/Makefile \
-          src/hwdep/Makefile src/seq/Makefile src/ucm/Makefile \
-          src/alisp/Makefile src/topology/Makefile \
-	  src/conf/Makefile \
-	  src/conf/cards/Makefile \
-	  src/conf/ctl/Makefile \
-	  src/conf/pcm/Makefile \
-	  modules/Makefile modules/mixer/Makefile modules/mixer/simple/Makefile \
-	  alsalisp/Makefile aserver/Makefile \
-	  test/Makefile test/lsb/Makefile \
-	  utils/Makefile utils/alsa-lib.spec utils/alsa.pc utils/alsa-topology.pc)
+AC_CONFIG_FILES(Makefile doc/Makefile doc/pictures/Makefile doc/doxygen.cfg \
+		include/Makefile include/sound/Makefile include/sound/uapi/Makefile \
+		src/Versions src/Makefile \
+		src/control/Makefile src/mixer/Makefile \
+		src/pcm/Makefile src/pcm/scopes/Makefile \
+		src/rawmidi/Makefile src/timer/Makefile \
+		src/hwdep/Makefile src/seq/Makefile src/ucm/Makefile \
+		src/alisp/Makefile src/topology/Makefile \
+		src/conf/Makefile \
+		src/conf/cards/Makefile \
+		src/conf/ctl/Makefile \
+		src/conf/pcm/Makefile \
+		modules/Makefile modules/mixer/Makefile modules/mixer/simple/Makefile \
+		alsalisp/Makefile aserver/Makefile \
+		test/Makefile test/lsb/Makefile \
+		utils/Makefile utils/alsa-lib.spec utils/alsa.pc utils/alsa-topology.pc)
+
+AC_OUTPUT()
 
 dnl Create asoundlib.h dynamically according to configure options
 echo "Creating asoundlib.h..."
-- 
2.43.0

