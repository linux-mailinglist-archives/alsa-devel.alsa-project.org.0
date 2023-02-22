Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0D69F927
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 17:39:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546B2839;
	Wed, 22 Feb 2023 17:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546B2839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677083974;
	bh=iZc9V8ksdiitj3UL6RqItjJl4rUBFEsk5fAz5ekVSQg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YZ5OrZDKWLzKXp5hIWyvjP/TVEZiE44/jIWNav+tOfAF5XAkYpljppmCNTvMukKlI
	 Dnzizvy4FK9cUXpfD18XslxXN4g1uwOR66GfLypk88Pm1pl0RQLFpDcXHE4DqJC8TJ
	 A1SrKqAzWprcrkqXQaCXbSM7lzpPreYkHszdQoq8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C7E1F8025A;
	Wed, 22 Feb 2023 17:38:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F5C4F80266; Wed, 22 Feb 2023 17:38:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69179F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 17:38:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69179F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JEKehRm5
Received: by mail-oi1-x22a.google.com with SMTP id w7so8432333oik.13
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 08:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gBhTi+5PGjTaDBaoDeFfLRIGNxs1Z56VzL6lqJVsCCU=;
        b=JEKehRm54KlCyWCAfEj5DjCgfIaVFksTJ3waX7OdneyWjO4830NqV3yUxeHy3ybbbz
         ZQ1cVWYRq9FiBKMMd4UiH9LuUzOHKHccNDH324U1iW7Y76uEQMKBe/SUWrV5eQd6B02u
         XPnG78M6CLs8T7osPKIVn9Sbyeitozo0+wGy9XkEXBUMeWSI1GGWHenvGj3PRsb7FIBm
         jH5O5bgeddnF2lCjiYivdeL19WAlUpVuyfy2nQv7Gd/RMLPHWjp4740F5AHVJ0nkhCkX
         oM8jtt9Q6sZAO872QtzbWsQTXlyC8WAfEMFxfbKAgaYRU0ea8GbNHWy/n8XNmM0MDA87
         zyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBhTi+5PGjTaDBaoDeFfLRIGNxs1Z56VzL6lqJVsCCU=;
        b=wEx41SpMAmaFJF3ZQ85ba8p0Bhz6Q2GjKdB4zsbojzSi1iE5RisBV82ccpA/wGy2Dc
         KQDgZ/JKqG0q5ejtnqv75tTusBbegmu4VG4qkh26kFlljnheCeL58jVN15o9oR3+g+s5
         DU0Hitj/aD/+GM7qisjEufosLqesXNOBEwe8upaXhUV97sAEvoUP54RzTP9o6dzvprpo
         EZ7U8kvhWc5HdyUcXvE+B6394jVKO1XZsdnfCboBISDRR2nSiw/xSzzlX3OVv4f6lSrZ
         yW3femG4JZAGshPXGZa16YxndM61lHmrtjQ1V3uWz58adg+tTT3VwLUmFRAy/rpL44ZF
         Ou8Q==
X-Gm-Message-State: AO0yUKU+K8x8g8b18Zkv+x6OuT/vwQd0OCOJiHTT/xI8ikD8rg03K6wF
	VQUjdXrzAsTb8TRN52YjdUXF5uHNMlg=
X-Google-Smtp-Source: 
 AK7set9nDesYZbq6tcIax+zV+G4E63+DHVl4VjkFaPwKNG12FGJwjVGMlLpJTWENTK6RJJuQuLPE1w==
X-Received: by 2002:a05:6808:c6:b0:378:2fcd:b6c3 with SMTP id
 t6-20020a05680800c600b003782fcdb6c3mr666871oic.31.1677083911846;
        Wed, 22 Feb 2023 08:38:31 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
        by smtp.gmail.com with ESMTPSA id
 q127-20020acac085000000b0037d813cd612sm1410083oif.43.2023.02.22.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:38:31 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ucm2: Rockchip: rk817: Add ALSA UCM support
Date: Wed, 22 Feb 2023 10:38:26 -0600
Message-Id: <20230222163826.73354-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V4LEWIGIN2KADZKZAXZRABBPI2C3MUX6
X-Message-ID-Hash: V4LEWIGIN2KADZKZAXZRABBPI2C3MUX6
X-MailFrom: macroalpha82@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Chris Morgan <macromorgan@hotmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4LEWIGIN2KADZKZAXZRABBPI2C3MUX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add ALSA-UCM support for the Rockchip RK817 audio codec. This codec
is typically configured either with an internal or external amplifier
as reflected by the longname. This configuration has been tested on
the Anbernic RG353P (rk817_ext) and the Odroid Go Advance (rk817_int).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 ucm2/Rockchip/rk817-sound/HiFi.conf        | 66 ++++++++++++++++++++++
 ucm2/Rockchip/rk817-sound/rk817-sound.conf |  7 +++
 ucm2/conf.d/simple-card/rk817_ext.conf     |  1 +
 ucm2/conf.d/simple-card/rk817_int.conf     |  1 +
 4 files changed, 75 insertions(+)
 create mode 100644 ucm2/Rockchip/rk817-sound/HiFi.conf
 create mode 100644 ucm2/Rockchip/rk817-sound/rk817-sound.conf
 create mode 120000 ucm2/conf.d/simple-card/rk817_ext.conf
 create mode 120000 ucm2/conf.d/simple-card/rk817_int.conf

diff --git a/ucm2/Rockchip/rk817-sound/HiFi.conf b/ucm2/Rockchip/rk817-sound/HiFi.conf
new file mode 100644
index 0000000..e285db7
--- /dev/null
+++ b/ucm2/Rockchip/rk817-sound/HiFi.conf
@@ -0,0 +1,66 @@
+If.1 {
+	Condition {
+		Type ControlExists
+		Control "name='Internal Speakers Switch'"
+	}
+
+	True {
+		SectionDevice."Speaker".EnableSequence [
+			cset "name='Playback Mux' HP"
+			cset "name='Internal Speakers Switch' on"
+		]
+
+		SectionDevice."Speaker".DisableSequence [
+			cset "name='Internal Speakers Switch' off"
+		]
+	}
+}
+
+SectionDevice."Speaker" {
+	Comment "Internal Speaker"
+
+	EnableSequence [
+		cset "name='Playback Mux' SPK"
+	]
+
+	Value {
+		PlaybackMasterElem "Master Playback Volume"
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId}"
+	}
+
+	ConflictingDevice [
+		"Headphones"
+	]
+}
+
+SectionDevice."Mic" {
+	Comment "Microphone"
+
+	Value {
+		CapturePriority 100
+		CapturePCM "hw:${CardId}"
+		CaptureMixerElem "Mic Capture Gain"
+		CaptureMasterElem "Master Capture Volume"
+	}
+}
+
+SectionDevice."Headphones" {
+	Comment "Headphones"
+
+	EnableSequence [
+		cset "name='Playback Mux' HP"
+	]
+
+	Value {
+		PlaybackMasterElem "Master Playback Volume"
+		PlaybackPriority 200
+		PlaybackPCM "hw:${CardId}"
+		JackControl "Headphones Jack"
+		JackHWMute "Speaker"
+	}
+
+	ConflictingDevice [
+		"Speaker"
+	]
+}
diff --git a/ucm2/Rockchip/rk817-sound/rk817-sound.conf b/ucm2/Rockchip/rk817-sound/rk817-sound.conf
new file mode 100644
index 0000000..6e326af
--- /dev/null
+++ b/ucm2/Rockchip/rk817-sound/rk817-sound.conf
@@ -0,0 +1,7 @@
+Syntax 4
+
+SectionUseCase."HiFi" {
+	File "/Rockchip/rk817-sound/HiFi.conf"
+	Comment "Play HiFi quality music"
+}
+
diff --git a/ucm2/conf.d/simple-card/rk817_ext.conf b/ucm2/conf.d/simple-card/rk817_ext.conf
new file mode 120000
index 0000000..6fa8db7
--- /dev/null
+++ b/ucm2/conf.d/simple-card/rk817_ext.conf
@@ -0,0 +1 @@
+../../Rockchip/rk817-sound/rk817-sound.conf
\ No newline at end of file
diff --git a/ucm2/conf.d/simple-card/rk817_int.conf b/ucm2/conf.d/simple-card/rk817_int.conf
new file mode 120000
index 0000000..6fa8db7
--- /dev/null
+++ b/ucm2/conf.d/simple-card/rk817_int.conf
@@ -0,0 +1 @@
+../../Rockchip/rk817-sound/rk817-sound.conf
\ No newline at end of file
-- 
2.34.1

