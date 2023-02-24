Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0486A225E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 20:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA9C1F1;
	Fri, 24 Feb 2023 20:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA9C1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677267270;
	bh=Vijctpact0xck3jF9kb3XgIQNfirOUFsJaFMDkEqy8w=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PqnXM3Eg8nmjyvIb5HpgDV7DhflWNZ+h1HutcqZf18vCvPEpXeo6VTcZYK3bwuzw1
	 xWVswsOBF05VYLmFW/pv9H0s/Vx//BUocTH33UHlZe6qBfFTHxAIyK/iXwSF7Av8uL
	 cYEJISHp3oInWOpCCohYINKhU8OeNwIl8Ud+VHDI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E63AF80116;
	Fri, 24 Feb 2023 20:33:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD06CF80125; Fri, 24 Feb 2023 20:33:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 414A0F800BA
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 20:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 414A0F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qvYqkTux
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-172afa7bee2so656482fac.6
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Feb 2023 11:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suuHc+QssPUgMgWFyXBbvhN4v+IEsVH6gYnhCegTahE=;
        b=qvYqkTuxCbJRdHAIXjQvM2aAUUvy7GUoz2pkRSfK4FBNPF4IbDhs/9DYX/uuBZyN9o
         VX8fawuT0QXYIrfeHN8mhxeRhsq7pkXGy4NOaBhMKyeo6+Qn2rcOkf2nwvMQrPdjCxJx
         839bmudhSm8ZINO2p5rgrBcJpmBr2tF5JdnygWQ2kh+c9c7RCgASeVKzvVtw/AiYzkF0
         55zqk1AFvy3k/Nm6G3WC3AR9BNLvoTjKKo9rWAUQQ8Pedj4/M0rwfMVjx9k9EPrS2QSR
         HjWqCaimGiEaAbeQ44YgeZo+UUnWt6P4oevqMKokZhuQT49b2VmNHzePzp6MS8HFIHW2
         huVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suuHc+QssPUgMgWFyXBbvhN4v+IEsVH6gYnhCegTahE=;
        b=AwAWqrlPSRELXXSgPp7JsM7ZAQ/EgpqoQVvneAF2OSkQ5/g9HlcxYSmv7Xjl7TgJek
         tDQMJrSEqtZeZDeejiobb1xe/bqUQF1BGlL82sX/IMDLIuHScu+BX8WCyZVqYMTvs9f3
         tVcl5ZHTHsJEp/CcnEhGwFNPoem6/tvaBtKdkaBCZPJJrtbbF4mgdJjNocaz8EvwYgeN
         Vq4Cja8WopCU4Xc33lXmBxccB1tyc8uyXlX6OC+YFDgj2JhUYHiFgYdo9bLqNnPy9cC1
         lghMp3cBLni3sszuqjH26UR0Uxtlu2gqUWgQmCPI1hzeV4SJv3YstXtvHonkrU1kBRhP
         haFw==
X-Gm-Message-State: AO0yUKWrUIx1T1RKDJAM2BhIxVT2BxTi9iORNsgmw9oZvRR4rsmSvM5V
	xVlnlKxoElMNSbcgrUMaGPFzTOxOs3Q=
X-Google-Smtp-Source: 
 AK7set99yoJ3nM67hFfoBqWEBkgikeqpA9TMMSRwB3HYC0AOgmPLXsPR4Z4ujdZlLq81xbc+ECMdmQ==
X-Received: by 2002:a05:6870:b487:b0:16d:eaa7:66d7 with SMTP id
 y7-20020a056870b48700b0016deaa766d7mr15659791oap.2.1677267203881;
        Fri, 24 Feb 2023 11:33:23 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
        by smtp.gmail.com with ESMTPSA id
 b6-20020a056870918600b0015f4d1b195bsm460696oaf.36.2023.02.24.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 11:33:23 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH V2] ucm2: Rockchip: rk817: Add ALSA UCM support
Date: Fri, 24 Feb 2023 13:33:20 -0600
Message-Id: <20230224193320.1503-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5IUU75IWZID6O2VDSNXX3AMHNRLKNIZR
X-Message-ID-Hash: 5IUU75IWZID6O2VDSNXX3AMHNRLKNIZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IUU75IWZID6O2VDSNXX3AMHNRLKNIZR/>
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

Changes from V1:
 - Use a constant to control if the output mux is set to HP or SPK.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 ucm2/Rockchip/rk817-sound/HiFi.conf        | 68 ++++++++++++++++++++++
 ucm2/Rockchip/rk817-sound/rk817-sound.conf |  6 ++
 ucm2/conf.d/simple-card/rk817_ext.conf     |  1 +
 ucm2/conf.d/simple-card/rk817_int.conf     |  1 +
 4 files changed, 76 insertions(+)
 create mode 100644 ucm2/Rockchip/rk817-sound/HiFi.conf
 create mode 100644 ucm2/Rockchip/rk817-sound/rk817-sound.conf
 create mode 120000 ucm2/conf.d/simple-card/rk817_ext.conf
 create mode 120000 ucm2/conf.d/simple-card/rk817_int.conf

diff --git a/ucm2/Rockchip/rk817-sound/HiFi.conf b/ucm2/Rockchip/rk817-sound/HiFi.conf
new file mode 100644
index 0000000..8d90567
--- /dev/null
+++ b/ucm2/Rockchip/rk817-sound/HiFi.conf
@@ -0,0 +1,68 @@
+Define.pbk_mux "SPK"
+
+If.1 {
+	Condition {
+		Type ControlExists
+		Control "name='Internal Speakers Switch'"
+	}
+
+	True {
+		Define.pbk_mux "HP"
+		SectionDevice."Speaker".EnableSequence [
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
+		cset "name='Playback Mux' ${var:pbk_mux}"
+	]
+
+	Value {
+		PlaybackMixerElem "Master Playback Volume"
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
+		PlaybackMixerElem "Master Playback Volume"
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
index 0000000..90ec794
--- /dev/null
+++ b/ucm2/Rockchip/rk817-sound/rk817-sound.conf
@@ -0,0 +1,6 @@
+Syntax 4
+
+SectionUseCase."HiFi" {
+	File "/Rockchip/rk817-sound/HiFi.conf"
+	Comment "Play HiFi quality music"
+}
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

