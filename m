Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44E8328CE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:31:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6DD206;
	Fri, 19 Jan 2024 12:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6DD206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663890;
	bh=PeSGgUlLO0QYQTNF6HEH4Awp8ydSuN7HXZkAQhBxbH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLR2zoJ0JGTV4Q7ZtG0n4+4cdVq0maKyIC4bwzoq7n6Ln5FGNvdvsamtu9cBtBn4w
	 ObfQRbINJeQl3EDwa+vyK0QfXenDoXHg3xCsdTPs5CR707VGxrpWGWpf3bJV2jQ45P
	 ozuGzBUWooyZI5ubxU0uosXIY+XBP1cKK5kdsAuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C518BF80641; Fri, 19 Jan 2024 12:29:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39AB7F80676;
	Fri, 19 Jan 2024 12:29:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AED2F80637; Fri, 19 Jan 2024 12:29:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 121DCF80520
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121DCF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g8XzdJHq
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3bd6581bc62so456877b6e.2
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705663776; x=1706268576;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzWU93PVglAiK6JeYvApr/hL3iYswtlmnngYtH+W0CM=;
        b=g8XzdJHqTFhWqSZ8i8lF4LeJw6RPGSC61uQc4tmAIjzAevh57Mpq0WqcirOaM8Wg/l
         atnYUXHaN54nsXNU5Xq12k/FrJxuHS78LS/6cIzjA8f+3RX9JO3OLYf6ZycIJc3lPRg9
         IiFXzZKiD0eDINSE5RTNBhn5w8BJzrYTgVtMU5XlVa00a2+O+v7P43IxruHrZMLEKYEL
         PY04Qj37xiTYj9cBq5L8QGHjsU6MLVe+TJompVy7LZ3hF+1KBqo3xEemzjmqUFzWlAsH
         WTen+8+6OQMfejAMaV3eyExvmsDgxXqoQlCyQmpR5HOhIwxksf0rw8l1pOBssPy7gdNJ
         6R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705663776; x=1706268576;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzWU93PVglAiK6JeYvApr/hL3iYswtlmnngYtH+W0CM=;
        b=XkDbhpW24GcVskvqGetmuyYjGajfpaoOhV1VAhY0fg3DzwLh2rv874QAsxR9TYEUPB
         wT4CELeXFTpnIE8z+NYjB/mSoo5A2witYcbebW1ufhhc5EKin7Ns/j5DW4QfO10AS1hI
         02MMqCBOlOD3+nBz3dAQCYaRMMvhYtkoEn2kBBgZ7zcD2cp1/i1z8maGQ7AjkJ1tTowr
         o0N45qEN4OQyiXKdU3D+IYItaLcRvgNrOeTXJwXQ/kWlpOZISGcKUnsWzTl8SYQkbJqa
         uKxNkDfgr3KwKJUSEbPtBwzdDRKziVsZUl0XqXzRl2dHnXl5u5eNlRvQ79kh5wx9T1cq
         dNtQ==
X-Gm-Message-State: AOJu0Yxt8G0FIL74GltSQPLDPRsYCg2LZ0r9vELqLs+6uL+WecHSSxwU
	s6TlcQ/4ReoKPTJQV9cFORiA0+ZIW6cBBVeOu3VH0P0tsV4sfMbm8lMLRKM69a9RyODG
X-Google-Smtp-Source: 
 AGHT+IGRvRiKLinz+GPG9h9DEF08HnviY4IR7tU6JNhQIlV8OAH1KDJdfxnmc8SZRrozmnGoaColVQ==
X-Received: by 2002:a05:6808:2193:b0:3bd:5b4d:3e30 with SMTP id
 be19-20020a056808219300b003bd5b4d3e30mr2831823oib.81.1705663776564;
        Fri, 19 Jan 2024 03:29:36 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b006d9b8e1971dsm4884541pff.191.2024.01.19.03.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:29:36 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 5/5] ASoC: codecs: ES8326: fix the capture noise issue
Date: Fri, 19 Jan 2024 19:28:58 +0800
Message-Id: <20240119112858.2982-6-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240119112858.2982-1-zhuning0077@gmail.com>
References: <20240119112858.2982-1-zhuning0077@gmail.com>
Message-ID-Hash: GSVVMUCQDEIWVZS7RKK5QZ6OJZ6ENFCG
X-Message-ID-Hash: GSVVMUCQDEIWVZS7RKK5QZ6OJZ6ENFCG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSVVMUCQDEIWVZS7RKK5QZ6OJZ6ENFCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    We get a noise issue during the startup of recording. We update the
    register setting and dapm widgets to fix this issue.
    we change callback type of es8326_mute function to mute_stream.
    ES8326_ADC_MUTE is moved to es8326_mute function so it can
    be turned on at last and turned off at first.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 63 ++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index fd3e73c4b7e9..4026d939e051 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -227,12 +227,6 @@ static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("I2S OUT", "I2S1 Capture", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("I2S IN", "I2S1 Playback", 0, SND_SOC_NOPM, 0, 0),
 
-	/* ADC Digital Mute */
-	SND_SOC_DAPM_PGA("ADC L1", ES8326_ADC_MUTE, 0, 1, NULL, 0),
-	SND_SOC_DAPM_PGA("ADC R1", ES8326_ADC_MUTE, 1, 1, NULL, 0),
-	SND_SOC_DAPM_PGA("ADC L2", ES8326_ADC_MUTE, 2, 1, NULL, 0),
-	SND_SOC_DAPM_PGA("ADC R2", ES8326_ADC_MUTE, 3, 1, NULL, 0),
-
 	/* Analog Power Supply*/
 	SND_SOC_DAPM_DAC("Right DAC", NULL, ES8326_ANA_PDN, 0, 1),
 	SND_SOC_DAPM_DAC("Left DAC", NULL, ES8326_ANA_PDN, 1, 1),
@@ -252,15 +246,10 @@ static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
-	{"ADC L1", NULL, "MIC1"},
-	{"ADC R1", NULL, "MIC2"},
-	{"ADC L2", NULL, "MIC3"},
-	{"ADC R2", NULL, "MIC4"},
-
-	{"ADC L", NULL, "ADC L1"},
-	{"ADC R", NULL, "ADC R1"},
-	{"ADC L", NULL, "ADC L2"},
-	{"ADC R", NULL, "ADC R2"},
+	{"ADC L", NULL, "MIC1"},
+	{"ADC R", NULL, "MIC2"},
+	{"ADC L", NULL, "MIC3"},
+	{"ADC R", NULL, "MIC4"},
 
 	{"I2S OUT", NULL, "ADC L"},
 	{"I2S OUT", NULL, "ADC R"},
@@ -550,11 +539,16 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 	unsigned int offset_l, offset_r;
 
 	if (mute) {
-		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
-		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
-				ES8326_MUTE_MASK, ES8326_MUTE);
-		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF,
-				0x30, 0x00);
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
+			regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
+					ES8326_MUTE_MASK, ES8326_MUTE);
+			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF,
+					0x30, 0x00);
+		} else {
+			regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
+					0x0F, 0x0F);
+		}
 	} else {
 		if (!es8326->calibrated) {
 			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_FORCE_CAL);
@@ -567,16 +561,22 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
 			es8326->calibrated = true;
 		}
-		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x01);
-		usleep_range(1000, 5000);
-		regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
-		usleep_range(1000, 5000);
-		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x30, 0x20);
-		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x30, 0x30);
-		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
-		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_ON);
-		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
-				ES8326_MUTE_MASK, ~(ES8326_MUTE));
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x01);
+			usleep_range(1000, 5000);
+			regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
+			usleep_range(1000, 5000);
+			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x30, 0x20);
+			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x30, 0x30);
+			regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
+			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_ON);
+			regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
+					ES8326_MUTE_MASK, ~(ES8326_MUTE));
+		} else {
+			msleep(300);
+			regmap_update_bits(es8326->regmap,  ES8326_ADC_MUTE,
+					0x0F, 0x00);
+		}
 	}
 	return 0;
 }
@@ -626,7 +626,7 @@ static const struct snd_soc_dai_ops es8326_ops = {
 	.set_fmt = es8326_set_dai_fmt,
 	.set_sysclk = es8326_set_dai_sysclk,
 	.mute_stream = es8326_mute,
-	.no_capture_mute = 1,
+	.no_capture_mute = 0,
 };
 
 static struct snd_soc_dai_driver es8326_dai = {
@@ -998,6 +998,7 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE, ES8326_MUTE_MASK,
 			   ES8326_MUTE);
 
+	regmap_write(es8326->regmap, ES8326_ADC_MUTE, 0x0f);
 
 	es8326->jack_remove_retry = 0;
 	es8326->hp = 0;
-- 
2.17.1

