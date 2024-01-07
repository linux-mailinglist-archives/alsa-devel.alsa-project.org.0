Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756908274FC
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 17:23:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3D8AE94;
	Mon,  8 Jan 2024 17:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3D8AE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704731003;
	bh=COIMYhmOeamnzBh9DzoVKj7taL2SyUsGtfhPKJDnnzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jHEE9tpA2MoFHBo5gHRyGTlLQjsUsYCegOD4pZJ0JD1M6M1Le0rtZ0Z2Ejj1w1cj8
	 RgK0pQ1U4SjuGG2T3MSJmjWOBGcub5My3rffnpOl1deOtBvVAt/oGeHmYuafUDDheW
	 qfGbWkS0dL9ViMBy7CTRa2WFxXWownJ+2HtWpjU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DACCAF80621; Mon,  8 Jan 2024 17:21:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65C31F80604;
	Mon,  8 Jan 2024 17:21:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3039EF80254; Sun,  7 Jan 2024 14:49:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC003F80086
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 14:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC003F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=chC8TnuP
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7831be84f4eso53782985a.0
        for <alsa-devel@alsa-project.org>;
 Sun, 07 Jan 2024 05:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704635370; x=1705240170;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOF6sEqDIgSyAvb+prfjypAX6iR1Y4dGfmqj46BSgHA=;
        b=chC8TnuPSxwY59sIyXnKCg2yn6x0Ez8xjbBmaHG8Sb9sHfE1o+C4frh/no83xP/Qt6
         QFD4kIEkrdWQ7IYI5di/9kiuJqHmu3Fk0kUv7/OPECReUFneX3rDizRQPg+EVx2bidlx
         2YOyqqeQNThiPWuihDKwgt/YrQEWJE5k0RS2VzJ2IjulpV8xZFr9e+OqYCkSGApNyBRa
         NTpvtZ4ETluh/UYYLMwUEanDGKYujvi1xlOLoa3EYHD23Y3y3z4f3anit/BsZiiuXP52
         DCqbM5Qt0wGXaJGFfad0upDk/If/BDojjoDbHxVuFr1qfy/mf6GX2jA65zdXtiUbrkzp
         Bpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704635370; x=1705240170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOF6sEqDIgSyAvb+prfjypAX6iR1Y4dGfmqj46BSgHA=;
        b=ILafkZU2KtIozAD4nWZxXGObY214EQ+QxpKtiO9yArifGWLu2J/e2UvbqfVgFpNcph
         KE7Yv2nNIQo/FuKKTH0bbqjjbgjSc1KChApAWY2bkFk81sg1/9dZI0z/aO/gmEKZUl2h
         xqddIL+i9VceIAajXcJ77v/w1b49N9rAVjdyC7hpVubTKq1xUQn/XkTSJj375D0HmIqb
         SEbzEqYC4TMFAiU4EPdtP2oauGT5PjmGjhzlY/wl7Kqke1AWeC9wpfcT0T0IC+gqAUIA
         5Iyso16baiP8YOLOX1/+M0d8Hl7gkUk9d0O3Mrl6GqQ0bhT/RTSEw1zYrmspzr5nUdRV
         va3w==
X-Gm-Message-State: AOJu0Yykgk9Q9mjbQ6pc6bX9171Lb1pFUSJgxfpglwIy4nygFHE+vGKc
	3L+fsglx8Q5QYRyQHs9eQgkJZms0poE=
X-Google-Smtp-Source: 
 AGHT+IFnb37vBjY66Nu2rSQ0/P/iq7LZuxpig0/R2LCHTpVEcPdVYio3qWgU+Ne/5nxgcww411b+Hg==
X-Received: by 2002:a05:620a:1454:b0:77e:fba3:4f28 with SMTP id
 i20-20020a05620a145400b0077efba34f28mr2303236qkl.126.1704635369856;
        Sun, 07 Jan 2024 05:49:29 -0800 (PST)
Received: from localhost.localdomain ([2602:47:d950:3e00:64e5:89b4:ac:57eb])
        by smtp.googlemail.com with ESMTPSA id
 os8-20020a05620a810800b0078310c390ffsm1120279qkn.9.2024.01.07.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 05:49:29 -0800 (PST)
From: Nicholas Vinson <nvinson234@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Nicholas Vinson <nvinson234@gmail.com>
Subject: [PATCH 4/4] libatopology: Remove version-script flags
Date: Sun,  7 Jan 2024 08:48:56 -0500
Message-ID: 
 <f00125b2e661576756d7efefbe9707774efffaf5.1704635150.git.nvinson234@gmail.com>
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
Message-ID-Hash: R4OUPK7LM4YILZ7KJ5JDCKS7CJ33AE3N
X-Message-ID-Hash: R4OUPK7LM4YILZ7KJ5JDCKS7CJ33AE3N
X-Mailman-Approved-At: Mon, 08 Jan 2024 16:21:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4OUPK7LM4YILZ7KJ5JDCKS7CJ33AE3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Review of Versions.in does not list any symbols defined in the
libatopology library. Naming undefined symbols in a version script
causes build failures with ld.lld when using default flags.

Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>
---
 src/topology/Makefile.am | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/src/topology/Makefile.am b/src/topology/Makefile.am
index 9f48891f..b1bc10f1 100644
--- a/src/topology/Makefile.am
+++ b/src/topology/Makefile.am
@@ -1,11 +1,5 @@
 COMPATNUM=@LIBTOOL_VERSION_INFO@
 
-if VERSIONED_SYMBOLS
-VSYMS = -Wl,--version-script=../Versions
-else
-VSYMS =
-endif
-
 if SYMBOLIC_FUNCTIONS
 SYMFUNCS = -Wl,-Bsymbolic-functions
 else
@@ -15,7 +9,7 @@ endif
 lib_LTLIBRARIES = libatopology.la
 
 libatopology_la_LIBADD = ../libasound.la
-libatopology_la_LDFLAGS = -version-info $(COMPATNUM) $(VSYMS) $(SYMFUNCS) $(LDFLAGS_NOUNDEFINED)
+libatopology_la_LDFLAGS = -version-info $(COMPATNUM) $(SYMFUNCS) $(LDFLAGS_NOUNDEFINED)
 
 libatopology_la_SOURCES =\
 	parser.c \
-- 
2.43.0

