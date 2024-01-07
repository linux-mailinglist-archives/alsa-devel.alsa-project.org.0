Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC38274FB
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 17:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A85D823;
	Mon,  8 Jan 2024 17:23:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A85D823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704730999;
	bh=j33KwBE+ESJjy2ZwRNfG6TakLeb0ccaARxU4EAyKqQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N4JjeQs6EzflI/by4Oo81zh4bbp7dT2yIlsyMrxnqO1qWQ33Zk4Y7pAt+H9KQbeh8
	 +e+i1AxOUjsPOMfKO3iE5cnMPhTIJ793OzmD5BX6Vm5u1wgzS0GJSzuz3RpL9+pw/8
	 K7D4urdYK1spD6/TZLNnlPvWwCLIuuYTKKbC//Fo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E8DF805FC; Mon,  8 Jan 2024 17:22:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B558EF80640;
	Mon,  8 Jan 2024 17:22:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12E48F804F1; Sun,  7 Jan 2024 14:49:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7F13F80236
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 14:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F13F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=F84jCa02
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-7831be84f4eso53782285a.0
        for <alsa-devel@alsa-project.org>;
 Sun, 07 Jan 2024 05:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704635368; x=1705240168;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Hqw57BmkdbaBbLNY/q+mzp+dqJI+Q3yMncezqofKS8=;
        b=F84jCa02R+9yfhLdBstErAyMpxIaac7AYoHPjmaaWLR3BT0GYO4XvEcWHW4iCLoXoI
         Hld2T+UFDAF9HL1kqI6zw/GFKhdHvTHRYiXkCj1hiezaHWzQF1IW08zrAqgZZOEXlN7x
         mkpQ/evWocuTMPBdhq74X3j7T3ZcGP+JK/zikMSD38/718M5b+Y3BN2qGIc4DXrO2NSk
         kMvMGiAoHCSiY4v/CaU/jiaQ2tjxSOZILtpTd5Yy5owEoxx/WtQtR3PygkAd0tipkd7c
         JKwcr67BShiWP7VcTYrwB9lSoBqY1DbnJvjczT00Ocb9GP1SqBizvO0GxwNOcWQ4OZdY
         D7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704635368; x=1705240168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Hqw57BmkdbaBbLNY/q+mzp+dqJI+Q3yMncezqofKS8=;
        b=QrH2kNyFFkDm4AbMLbbeFNOYTTY0gh+NlHpuQnT+PN8i1H25l6z6gCvdNH1LDzs8s9
         XA2uHcbqn06V4OF7fx3rQAiUTJ7KZlzQCCXvDKeSwUcac6RBNdnECA3HWTEUF35fWUTi
         58L0gKrzXZFBddH78F68bCFGaWtfW/h7rcohycarqeowzWq8cKKa/AYjb4owjS0h91E0
         70aYSQEkSDodXx2we8cPO5xFG10TKWWSLEys8qKXB+s9g+YGSOFE4oRP4BXBG5HtpTXK
         dmZziihgOm9WPLAx3XQYjqdUhyP39V1/F0FkLuNDw7wDVlgUbFAMZYhOfyEf/upm2vdg
         ecOA==
X-Gm-Message-State: AOJu0YxaYVbBEPZnT1ZZYtGoaQhYIpqUCZR8VdjekL0WKUUkKaCaiwLG
	Sn7m6Xhg7hdF3ZWB9CmVoC48AmElHHE=
X-Google-Smtp-Source: 
 AGHT+IFpmEy81X6grJrTNVhk8om1w/FdiwnA2vdUl2Dqutlz0dTF6iryqo/osbDNwtmmIPeNymNYWA==
X-Received: by 2002:ae9:f40d:0:b0:783:2092:412b with SMTP id
 y13-20020ae9f40d000000b007832092412bmr465856qkl.20.1704635368282;
        Sun, 07 Jan 2024 05:49:28 -0800 (PST)
Received: from localhost.localdomain ([2602:47:d950:3e00:64e5:89b4:ac:57eb])
        by smtp.googlemail.com with ESMTPSA id
 os8-20020a05620a810800b0078310c390ffsm1120279qkn.9.2024.01.07.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 05:49:27 -0800 (PST)
From: Nicholas Vinson <nvinson234@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Nicholas Vinson <nvinson234@gmail.com>
Subject: [PATCH 3/4] src/Versions.in: Add guards for pcm and timer syms
Date: Sun,  7 Jan 2024 08:48:55 -0500
Message-ID: 
 <40181a6d1a2ef02257899e6bd1a0609660501f48.1704635150.git.nvinson234@gmail.com>
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
Message-ID-Hash: MB5PGC76N7JJP6XEMMQM64J4SHVQQQBU
X-Message-ID-Hash: MB5PGC76N7JJP6XEMMQM64J4SHVQQQBU
X-Mailman-Approved-At: Mon, 08 Jan 2024 16:21:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MB5PGC76N7JJP6XEMMQM64J4SHVQQQBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Configure script allows for the disabling of the pcm module. When
disabled, the pcm symbols will not be available. Add guards to remove
symbols from version map when not present.

Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>
---
 src/Makefile.am    |  3 +++
 src/Versions.in.in | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/src/Makefile.am b/src/Makefile.am
index b4a0d5d9..ad5bf8ef 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -26,6 +26,9 @@ SUBDIRS += mixer
 libasound_la_LIBADD += mixer/libmixer.la
 endif
 if BUILD_PCM
+if VERSIONED_SYMBOLS
+VERSION_CPPFLAGS += -DHAVE_PCM_SYMS -DHAVE_TIMER_SYMS
+endif
 SUBDIRS += pcm timer
 libasound_la_LIBADD += pcm/libpcm.la timer/libtimer.la
 endif
diff --git a/src/Versions.in.in b/src/Versions.in.in
index 041eff08..98f36ded 100644
--- a/src/Versions.in.in
+++ b/src/Versions.in.in
@@ -16,6 +16,7 @@ ALSA_0.9 {
 };
 
 ALSA_0.9.0rc4 {
+#ifdef HAVE_PCM_SYMS
   global:
 
     @SYMBOL_PREFIX@snd_pcm_hw_params_get_access;
@@ -42,6 +43,7 @@ ALSA_0.9.0rc4 {
     @SYMBOL_PREFIX@snd_pcm_hw_params_get_rate_max;
     @SYMBOL_PREFIX@snd_pcm_hw_params_set_rate_near;
     @SYMBOL_PREFIX@snd_pcm_hw_params_set_rate_first;
+
     @SYMBOL_PREFIX@snd_pcm_hw_params_set_rate_last;
 
     @SYMBOL_PREFIX@snd_pcm_hw_params_get_period_time;
@@ -85,22 +87,29 @@ ALSA_0.9.0rc4 {
     @SYMBOL_PREFIX@snd_pcm_hw_params_set_tick_time_near;
     @SYMBOL_PREFIX@snd_pcm_hw_params_set_tick_time_first;
     @SYMBOL_PREFIX@snd_pcm_hw_params_set_tick_time_last;
+#endif
 
 } ALSA_0.9;
 
 ALSA_0.9.0rc8 {
+#ifdef HAVE_PCM_SYMS
   global:
 
     @SYMBOL_PREFIX@snd_pcm_forward;
     @SYMBOL_PREFIX@snd_pcm_status_get_trigger_htstamp;
     @SYMBOL_PREFIX@snd_pcm_status_get_htstamp;
+#endif
 
 } ALSA_0.9.0rc4;
 
 ALSA_0.9.0 {
+#if defined HAVE_PCM_SYMS || defined HAVE_TIMER_SYMS
   global:
 
+#if defined HAVE_PCM_SYMS
     @SYMBOL_PREFIX@snd_pcm_type_name;
+#endif
+#ifdef HAVE_TIMER_SYMS
     @SYMBOL_PREFIX@snd_timer_query_info;
     @SYMBOL_PREFIX@snd_timer_query_params;
     @SYMBOL_PREFIX@snd_timer_query_status;
@@ -108,6 +117,8 @@ ALSA_0.9.0 {
     @SYMBOL_PREFIX@snd_timer_params_get_exclusive;
     @SYMBOL_PREFIX@snd_timer_params_set_filter;
     @SYMBOL_PREFIX@snd_timer_params_get_filter;
+#endif
+#endif
 } ALSA_0.9.0rc8;
 
 ALSA_0.9.3 {
@@ -146,11 +157,13 @@ ALSA_1.2.6 {
 } ALSA_1.1.6;
 
 ALSA_1.2.9 {
+#ifdef HAVE_PCM_SYMS
   global:
 
     @SYMBOL_PREFIX@snd_pcm_hw_params_is_perfect_drain;
     @SYMBOL_PREFIX@snd_pcm_hw_params_set_drain_silence;
     @SYMBOL_PREFIX@snd_pcm_hw_params_get_drain_silence;
+#endif
 } ALSA_1.2.6;
 
 ALSA_1.2.10 {
-- 
2.43.0

