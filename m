Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEE8328C9
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:30:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F19BDB65;
	Fri, 19 Jan 2024 12:30:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F19BDB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663857;
	bh=674tDTiDlWIl3qZq+F+4nQuuogkUcyGVC3Ni7ePevso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FJJ/+JX5b7ysrPD9G4YmChZ7fAnkFO6yHelelC1bFixsHZL/uzrgTSRiXb72vglQa
	 MzcNQBqdV0rYKKo/T22Ff2RMoZex3I/P2CIUTB3aHWmqLU4IwPadphtgKvHUwmvJo9
	 rnmS6f3feQTKprLBpmDct7LmuDs1et4qgqMl/kb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5598F80612; Fri, 19 Jan 2024 12:29:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D815F80604;
	Fri, 19 Jan 2024 12:29:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C120F805F9; Fri, 19 Jan 2024 12:29:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27EF1F8003A
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27EF1F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gHg4C4Ux
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d9c2db82b0so564401b3a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 03:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705663769; x=1706268569;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PukuqSkFqArLMkVmFzdDVnacS7jVSYVupLAIDu+heWc=;
        b=gHg4C4Uxz1qKSwU9ZFJ0RqgE2al+a3A22C00JPGhiMlyyqMI/7HSnKp6SKzdZcpPlK
         7V+oMQ1bPvxwNWxKRizsw8TTIJkwna6ZZ+8C5bTRS7XkZABce+fXHBnAgOT/QfqDnK+K
         4RR6MzTEq5QdZzG6dS98yu6N0bxY+awhS5vEstDMvsZBD9I7rhrfCoSj7ZqweDC8vI9f
         4ZrMydUYQiDvSTNFaHHD7U/HEe0+xNDPGbv8JLzWtzEwKmdVNYoehMKEnJ7fRdQxCTCc
         /+qMIfJ6QK3RwcYYb0o9h49kAnqAej3Gj0A8Snv9VqgBMow0MUdIh5HjZGeYKk3HygFj
         f4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705663769; x=1706268569;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PukuqSkFqArLMkVmFzdDVnacS7jVSYVupLAIDu+heWc=;
        b=Gs9IgkecAeAIID5eTLvB0z1kBhIvi3CjDMSO+vxd4cRH+8cQ2Sh8swU7wSsiHK7Qng
         EWSPQ2iHMjdWX+70g0EfZa9yqzgWMmLQg+2z6ZTVJ8OCvFQdJJgqbF7nWZaQNYExpwwl
         ro5gxylNn6V7F72scb5gvy4MgjDxPKDtfBHy2NK3dHNQ6J8Dd/8E96nEK5aZzsCFhCQJ
         YnICnTnkrUeGfIZnb7NXlzqBfY3i1oLdnUZYHzzk8UR57fq4VVBZwocDdMngf+SkpBXX
         MCqr3sXHF7tBgtI3RDpDyNWGI7Zu1xfrlVBz75ApFGvu3StVWOgN6Gq8WV06fo0h8dfZ
         Bf0g==
X-Gm-Message-State: AOJu0YyjMCs31z5GcKRNPp72wJhI0K5OYGgEdN49rZb6UjIF7zQH40+8
	z3KBVCljWwVpq+DjSg4kNed8+Pqtmuk5vwrrZ6zJvFjPIEBKCzRo4PREloxoOw8Kj4+j
X-Google-Smtp-Source: 
 AGHT+IESai/mp6KlyJCbfRPNyYu3P8RosfPSAjc9Sjmsyxdnux1KMe0bxKj9LAwts6H2lNbUk2GSBg==
X-Received: by 2002:a05:6a00:23c4:b0:6d9:3d15:d506 with SMTP id
 g4-20020a056a0023c400b006d93d15d506mr2081929pfc.53.1705663768743;
        Fri, 19 Jan 2024 03:29:28 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b006d9b8e1971dsm4884541pff.191.2024.01.19.03.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:29:28 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
Date: Fri, 19 Jan 2024 19:28:56 +0800
Message-Id: <20240119112858.2982-4-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240119112858.2982-1-zhuning0077@gmail.com>
References: <20240119112858.2982-1-zhuning0077@gmail.com>
Message-ID-Hash: AUXFM5UZMUCJJTQA2TNCIIRXAVEJHEPE
X-Message-ID-Hash: AUXFM5UZMUCJJTQA2TNCIIRXAVEJHEPE
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUXFM5UZMUCJJTQA2TNCIIRXAVEJHEPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    ES8326 features a headphone volume control register and four DAC
    volume control registers.
    We add new volume Kcontrols for these registers to enhance the
    configurability of the volume settings, providing users with
    greater flexibility.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 30 ++++++++++++++++++++++++++++++
 sound/soc/codecs/es8326.h |  5 ++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 10157a4bd500..c7f89c990178 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -151,12 +151,34 @@ static const char *const winsize[] = {
 static const char *const dacpol_txt[] =	{
 	"Normal", "R Invert", "L Invert", "L + R Invert" };
 
+static const char *const hpvol[] = {
+	"0 dB",
+	"-6 dB",
+	"-24 dB",
+	"+3.5 dB",
+	"-3.5 dB",
+	"-18 dB",
+};
+static const unsigned int hp_vol_values[] = { 0, 1, 2, 4, 5, 6 };
+
+static const char *const hp_spkvol_switch[] = {
+	"HPVOL: HPL+HPL, SPKVOL: HPL+HPL",
+	"HPVOL: HPL+HPR, SPKVOL: HPL+HPR",
+	"HPVOL: HPL+HPL, SPKVOL: SPKL+SPKR",
+	"HPVOL: HPL+HPR, SPKVOL: SPKL+SPKR",
+};
+
 static const struct soc_enum dacpol =
 	SOC_ENUM_SINGLE(ES8326_DAC_DSM, 4, 4, dacpol_txt);
 static const struct soc_enum alc_winsize =
 	SOC_ENUM_SINGLE(ES8326_ADC_RAMPRATE, 4, 16, winsize);
 static const struct soc_enum drc_winsize =
 	SOC_ENUM_SINGLE(ES8326_DRC_WINSIZE, 4, 16, winsize);
+static const struct soc_enum hp_vol =
+	SOC_VALUE_ENUM_DOUBLE(ES8326_HP_VOL, 4, 0, 7,
+			ARRAY_SIZE(hpvol), hpvol, hp_vol_values);
+static const struct soc_enum hpvol_spkvol_switch =
+	SOC_ENUM_SINGLE(ES8326_HP_MISC, 6, 4, hp_spkvol_switch);
 
 static const struct snd_kcontrol_new es8326_snd_controls[] = {
 	SOC_SINGLE_TLV("DAC Playback Volume", ES8326_DAC_VOL, 0, 0xbf, 0, dac_vol_tlv),
@@ -182,6 +204,14 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 			es8326_crosstalk1_get, es8326_crosstalk1_set),
 	SOC_SINGLE_EXT("CROSSTALK2", SND_SOC_NOPM, 0, 31, 0,
 			es8326_crosstalk2_get, es8326_crosstalk2_set),
+
+	SOC_SINGLE_TLV("HPL Playback Volume", ES8326_DACL_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("HPR Playback Volume", ES8326_DACR_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("SPKL Playback Volume", ES8326_SPKL_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("SPKR Playback Volume", ES8326_SPKR_VOL, 0, 0xbf, 0, dac_vol_tlv),
+
+	SOC_ENUM("HP Volume", hp_vol),
+	SOC_ENUM("HPVol SPKVol switch", hpvol_spkvol_switch),
 };
 
 static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 4234bbb900c4..ee12caef8105 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -69,7 +69,7 @@
 #define ES8326_DAC_DSM		0x4D
 #define ES8326_DAC_RAMPRATE	0x4E
 #define ES8326_DAC_VPPSCALE	0x4F
-#define ES8326_DAC_VOL		0x50
+#define ES8326_DACL_VOL	        0x50
 #define ES8326_DRC_RECOVERY	0x53
 #define ES8326_DRC_WINSIZE	0x54
 #define ES8326_DAC_CROSSTALK	0x55
@@ -81,6 +81,9 @@
 #define ES8326_SDINOUT23_IO	0x5B
 #define ES8326_JACK_PULSE	0x5C
 
+#define ES8326_DACR_VOL		0xF4
+#define ES8326_SPKL_VOL		0xF5
+#define ES8326_SPKR_VOL		0xF6
 #define ES8326_HP_MISC		0xF7
 #define ES8326_CTIA_OMTP_STA	0xF8
 #define ES8326_PULLUP_CTL	0xF9
-- 
2.17.1

