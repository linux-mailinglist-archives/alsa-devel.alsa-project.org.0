Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 599108274F9
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 17:22:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BC81FE;
	Mon,  8 Jan 2024 17:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BC81FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704730976;
	bh=pfc5gtvn4b4EVAxlXDU40ahe+qqsr/NuY7UWWPnRXk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OtQliAmMVl7fvmJVbobho01AWgbgrue3GJeYJ/8u37H7XKtX/aW5eaM/nK/YayYlj
	 KM8pP5ytEq1Ldw4082T1eIqLjtlWOrsjbxO4APJlcu8x/ZDsp42evaaQB679yxzqjY
	 Y8fUxUzkTbH5p/NtDMuYTDfceVddhiAglDGkJVrw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D1AF805EE; Mon,  8 Jan 2024 17:21:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22543F805F0;
	Mon,  8 Jan 2024 17:21:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04EDBF802DB; Sun,  7 Jan 2024 14:49:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6A34F800F5
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 14:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6A34F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FcKI08p4
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7831be84f4eso53781185a.0
        for <alsa-devel@alsa-project.org>;
 Sun, 07 Jan 2024 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704635366; x=1705240166;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vo9zZ7GO4dydRr6xjEjRJpw5b3BLUzuSBST5lbeN9WQ=;
        b=FcKI08p4e+2iGKrB7Fq5MwwRP6WYrcMd1jnTLD1JzBJRIYfANQEH/6j6sq8jz5otKL
         8a/s5L5sx9iqDPfLW5rTwpmwp+GR3VASaww+pfCN2jDO12ckuz3a5+1XaNobnrlO10+V
         RBLGY30V+k/jsPMhPLoZBYibgphsXk+oceDTLyH2b98no055GOdarNFu9gLbT32em7+F
         kgDjaRTwGIm1+crafXxzNzbZPPlpg+sFrfZ0+lRyQKdSnwq+fxnYwRmuo1Ml/sm9nu0Y
         WJiD261rFCsWNuyVyMd5T809dRTAWLFWgAAPm0IY/3p73BYY6ILkB/tjSu5/BxLqEdW5
         miOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704635366; x=1705240166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vo9zZ7GO4dydRr6xjEjRJpw5b3BLUzuSBST5lbeN9WQ=;
        b=TdmxWgfCEoYKoZXJFr7CawBtASaf0NRo2Z277Km/sdbs6gEUzbxXVi/9FUZeNtrdVv
         vB6nvTVnd0Gyd8I26LZoblCsMcrpJFDtxGhKP0l579sZ7VoYetM1W3i8PilAxy6GJV8d
         kXbo7p1wvjnZdI2ShHLZwq/u5YEVMcdI3zwASbi5pDHDwzgb4fU45jj+WgqGHZ3TmdkX
         Yln77hLR/a6e47wd7U+TC3KvbjjC0m+6HHF+n1zHsZkZEcDKLspCf/HGXAG3VBQ1ZM5r
         jRQmPYpJLveYCaJqOJU6jwXo6GbIbrRTvkGJ5DTv5HvqKB5GQ/FQ+7NV9pImJUN0Wukh
         sv2A==
X-Gm-Message-State: AOJu0YxLwfFqokfZmGP83zCxzZLaY7JmzKt6ktpYUk89giVswh9A6rNa
	cRdmxqawR0qZUQoRcYs5c520UjePVNU=
X-Google-Smtp-Source: 
 AGHT+IHTQjPG7dZ3gd0zZfFxszWgc+6ZRaoomoEwnk9Vm2JijVbMH0tkj4nsWLXJ5xZ3Lz+rtKwrMA==
X-Received: by 2002:a05:620a:2415:b0:781:5b96:537f with SMTP id
 d21-20020a05620a241500b007815b96537fmr3396619qkn.114.1704635366455;
        Sun, 07 Jan 2024 05:49:26 -0800 (PST)
Received: from localhost.localdomain ([2602:47:d950:3e00:64e5:89b4:ac:57eb])
        by smtp.googlemail.com with ESMTPSA id
 os8-20020a05620a810800b0078310c390ffsm1120279qkn.9.2024.01.07.05.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 05:49:26 -0800 (PST)
From: Nicholas Vinson <nvinson234@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Nicholas Vinson <nvinson234@gmail.com>
Subject: [PATCH 2/4] src/Versions.in: Add guards for opt. alisp symbols
Date: Sun,  7 Jan 2024 08:48:54 -0500
Message-ID: 
 <b60ab4a86cc69a7749f5a4b1a6325933a048eb45.1704635150.git.nvinson234@gmail.com>
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
Message-ID-Hash: 2VVYMQFO2PPCR2RCPR5ZACWKGVWLYSJD
X-Message-ID-Hash: 2VVYMQFO2PPCR2RCPR5ZACWKGVWLYSJD
X-Mailman-Approved-At: Mon, 08 Jan 2024 16:21:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VVYMQFO2PPCR2RCPR5ZACWKGVWLYSJD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add guards for optional alisp symbols. This ensures that the Versions
file does not contain undefined symbols when building alisp support is
disabled.

Fixes Gentoo bugs 914511 (https://bugs.gentoo.org/914511),
    914643 (https://bugs.gentoo.org/914643),
    and 919417 (https://bugs.gentoo.org/919417).

Fixes bug #305
Fixes alsa_lisp symbol error reported in bug #356

Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>
---
 configure.ac                        |  2 +-
 src/Makefile.am                     | 11 ++++++++++-
 src/{Versions.in => Versions.in.in} |  4 ++++
 3 files changed, 15 insertions(+), 2 deletions(-)
 rename src/{Versions.in => Versions.in.in} (99%)

diff --git a/configure.ac b/configure.ac
index 9db527c3..024e70b0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -749,7 +749,7 @@ fi
 
 AC_CONFIG_FILES(Makefile doc/Makefile doc/pictures/Makefile doc/doxygen.cfg \
 		include/Makefile include/sound/Makefile include/sound/uapi/Makefile \
-		src/Versions src/Makefile \
+		src/Versions.in src/Makefile \
 		src/control/Makefile src/mixer/Makefile \
 		src/pcm/Makefile src/pcm/scopes/Makefile \
 		src/rawmidi/Makefile src/timer/Makefile \
diff --git a/src/Makefile.am b/src/Makefile.am
index df46dbc4..b4a0d5d9 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -1,10 +1,11 @@
-EXTRA_DIST=Versions
 COMPATNUM=@LIBTOOL_VERSION_INFO@
 
 if VERSIONED_SYMBOLS
 VSYMS = -Wl,--version-script=Versions
+BUILT_SOURCES = $(top_builddir)/src/Versions
 else
 VSYMS =
+BUILT_SOURCES =
 endif
 
 if SYMBOLIC_FUNCTIONS
@@ -13,6 +14,8 @@ else
 SYMFUNCS =
 endif
 
+VERSION_CPPFLAGS =
+
 lib_LTLIBRARIES = libasound.la
 libasound_la_SOURCES = conf.c confeval.c confmisc.c input.c output.c async.c error.c dlmisc.c socket.c shmarea.c userfile.c names.c
 
@@ -43,6 +46,9 @@ SUBDIRS += ucm
 libasound_la_LIBADD += ucm/libucm.la
 endif
 if BUILD_ALISP
+if VERSIONED_SYMBOLS
+VERSION_CPPFLAGS += -DHAVE_ALISP_SYMS
+endif
 SUBDIRS += alisp
 libasound_la_LIBADD += alisp/libalisp.la
 endif
@@ -51,6 +57,9 @@ libasound_la_LIBADD += @ALSA_DEPLIBS@
 
 libasound_la_LDFLAGS = -version-info $(COMPATNUM) $(VSYMS) $(SYMFUNCS) $(LDFLAGS_NOUNDEFINED)
 
+$(top_builddir)/src/Versions: $(top_builddir)/src/Versions.in
+	$(COMPILE) -E $(VERSION_CPPFLAGS) -x assembler-with-cpp -o $@ $<
+
 control/libcontrol.la:
 	$(MAKE) -C control libcontrol.la
 
diff --git a/src/Versions.in b/src/Versions.in.in
similarity index 99%
rename from src/Versions.in
rename to src/Versions.in.in
index c53a99fa..041eff08 100644
--- a/src/Versions.in
+++ b/src/Versions.in.in
@@ -118,15 +118,19 @@ ALSA_0.9.3 {
 } ALSA_0.9.0;
 
 ALSA_0.9.5 {
+#ifdef HAVE_ALISP_SYMS
   global:
 
     @SYMBOL_PREFIX@alsa_lisp;
+#endif
 } ALSA_0.9.3;
 
 ALSA_0.9.7 {
+#ifdef HAVE_ALISP_SYMS
   global:
 
     @SYMBOL_PREFIX@alsa_lisp_*;
+#endif
 } ALSA_0.9.5;
 
 ALSA_1.1.6 {
-- 
2.43.0

