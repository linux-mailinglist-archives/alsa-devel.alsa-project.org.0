Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84722833390
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 11:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 122E286F;
	Sat, 20 Jan 2024 11:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 122E286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705745803;
	bh=HaxmkBU4NtqPbYo58I/nC/41mHNjaslWLh6YNP3krV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A7AmTt9toMMejlOPLqijqTuLcpp/yG6MiWbMU+Jncres8b/WuWXHUfJhf2nEhVs3P
	 VwLfhOUWWQbGGCBqMwxcPB58KurDz7MovpQXm72WVO48cCrXNoi1ayOk+99XTwa3ds
	 uS+KfKuK/d2xTsphKIJuSUvgStXfTy4el338CJSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4968F805F8; Sat, 20 Jan 2024 11:15:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 245E2F805ED;
	Sat, 20 Jan 2024 11:15:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E31EEF80548; Sat, 20 Jan 2024 11:14:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53F66F800F5
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 11:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F66F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E5A1NjzO
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso86701939f.0
        for <alsa-devel@alsa-project.org>;
 Sat, 20 Jan 2024 02:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705745582; x=1706350382;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4JOKB58cvW2V6tKWmuZJJ+pX8d6gLjIVuLPMZDSDgJ4=;
        b=E5A1NjzO+XOphBM0rqk9SFdI6sJJYALCzlxFZSgtiLPElRc9zircbxfAB1f26MipmO
         5nHJKNCUbsKTL9zeGvuy2nS+99kggctoO9/yIXCIWuYREBQB3mwgKZEIIS+0y7kIu7CG
         RVS1oWYNhy79a8VKR+NfJRdcdNc8qN2+BsHjjNkQzz2wuhTdWF3/N51pUQHBvbyFl/kj
         PZOrrATGGrCwTqufZdtn0G7gUEwIgoJEKO+BGGXbCpkzbeALTZmAKeIIteIEUlQri12O
         2hlLt6s+EjN6BK/8uEUSHWrrzbnmx3oj8KBXh5yK+NxBGjgMyk0qgDQANkdGuW6BOgLH
         WXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705745582; x=1706350382;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JOKB58cvW2V6tKWmuZJJ+pX8d6gLjIVuLPMZDSDgJ4=;
        b=XIPwsSvXHAfMu8/H4o6WpatWLNAZ27Bfn5w/WaoPosflyK3VfpUqxN+FIMO2zYJXhX
         GxkoFlHVLqblVbVpNLKmVB2dT02jLjiv1nE+yHyRkqqnF4Sf0hclfZX+CZe4t+FMLZj6
         gn38PGN+Kz8cgn6PDFkplunK7u3Z04mLXLblOekg8uvdQTTOyoUMgDwR5qEYSxL9Z8cR
         mVUTCOI2Z7hEy9AMqFzoDOCF2IFameyEt5XWaBKZGID0au8h4vnlMtid64TFpqGUVLcb
         T3Hu04ijBa8MAmrxBXqHi+M+zIfUuXe/vJYqagK/CH/+ZDJDDVxmWedl5i5SjQiy101d
         IdbQ==
X-Gm-Message-State: AOJu0YxKQkbt5IB2zzi99Xch5edeqy4jHetzZwnc7MVQUxenQ/eIarcA
	42P9LFAGDP5S+Un4el5BfAPak2Ghfh2Dtz7SFJxbgvcaue1G3FGs5/1Q3752euv8Lw==
X-Google-Smtp-Source: 
 AGHT+IEt4Ff+sHOXR/qTe9hEUB0lJ0JGjFWfEq0YTi3OKPlro3xPqfIYsJhZavAwYFVQcWTNQp++DQ==
X-Received: by 2002:a5d:9ed0:0:b0:7bb:bca0:7670 with SMTP id
 a16-20020a5d9ed0000000b007bbbca07670mr1537204ioe.23.1705745582076;
        Sat, 20 Jan 2024 02:13:02 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 jc17-20020a17090325d100b001d72cf69508sm967365plb.23.2024.01.20.02.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 02:13:01 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 5/5] ASoC: codecs: ES8326: fix the capture noise issue
Date: Sat, 20 Jan 2024 18:12:40 +0800
Message-Id: <20240120101240.12496-6-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240120101240.12496-1-zhuning0077@gmail.com>
References: <20240120101240.12496-1-zhuning0077@gmail.com>
Message-ID-Hash: GSFF7GVE3AYH5LWJS6EBCVNVAAN35FRQ
X-Message-ID-Hash: GSFF7GVE3AYH5LWJS6EBCVNVAAN35FRQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSFF7GVE3AYH5LWJS6EBCVNVAAN35FRQ/>
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
index 33c4ebddab40..d51b3e13d1a1 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -283,12 +283,6 @@ static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
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
@@ -308,15 +302,10 @@ static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
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
@@ -606,11 +595,16 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
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
@@ -623,16 +617,22 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
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
@@ -682,7 +682,7 @@ static const struct snd_soc_dai_ops es8326_ops = {
 	.set_fmt = es8326_set_dai_fmt,
 	.set_sysclk = es8326_set_dai_sysclk,
 	.mute_stream = es8326_mute,
-	.no_capture_mute = 1,
+	.no_capture_mute = 0,
 };
 
 static struct snd_soc_dai_driver es8326_dai = {
@@ -1054,6 +1054,7 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE, ES8326_MUTE_MASK,
 			   ES8326_MUTE);
 
+	regmap_write(es8326->regmap, ES8326_ADC_MUTE, 0x0f);
 
 	es8326->jack_remove_retry = 0;
 	es8326->hp = 0;
-- 
2.17.1

