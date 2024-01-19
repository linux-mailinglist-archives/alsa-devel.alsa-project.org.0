Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564B8328C8
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:30:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C85822;
	Fri, 19 Jan 2024 12:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C85822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663841;
	bh=uGnXBoy7ILdY1GFVkqqWGFPDKF87GLY6aiytakmDVKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZADBfEw7nX8LkChllK7Xz467F8VwyPxWxzorO6zqvsqWZ/Vt7fmeqhbJQgkgG/Kur
	 nlTFuJKKoGzMRjkpBnRoeiQ2s2K4TW5KU1n96YeaqtFCkA2CtSCdcb661Yfou4mBTy
	 iMENXdZKU8WjZ7eTPIev90DmRMjCUewSZ5kHhMH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D997F8028D; Fri, 19 Jan 2024 12:29:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E7BF805F1;
	Fri, 19 Jan 2024 12:29:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CEA0F80520; Fri, 19 Jan 2024 12:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71ABFF80520
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71ABFF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jeWXlvMY
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so522226a12.1
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 03:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705663753; x=1706268553;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lu4mBGRHek8xxeOugvmNKBRhHVvcnP8bUZIpFogLPGk=;
        b=jeWXlvMY6xUHaXn2iIbnFnYVFG+HGdZ67J8vrmocJij/Ixl/e4bAKIXm1BGRTLAz2D
         t+LXxoMHB6xj8AQuMYsp85/MfSxe8lGQ5q6qoOlmArE1ZOcoVme5Nh8JQd9Bar4o5+ok
         daio39rE75YCSL3ce/ULqrmppcAYWs5nu2DGFzRT8FZCeBCuthuuiltwJtPLRtgcM3fI
         Di1t1Up3foFAIaCSBJurJ6E3pVXeGp8UxMeLRfkDMiq81TxEjxtu3k2ILVp3DXirnIOR
         EbrzLSV5TrSTtaoLadorVGAd/d7UwC4XF4NSxphTKyEne6kRjDv4Sc9IhlAcSb0z23GO
         ZK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705663753; x=1706268553;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lu4mBGRHek8xxeOugvmNKBRhHVvcnP8bUZIpFogLPGk=;
        b=k9m5hENbZJ0Z7Tm0Kc00x8aQbXGS30BsNpg2FAAtrLrRcnIe4BP2aYtudUqhpsrPSS
         eP4b6Y9BfUziG86wpj6dCxsrzUUqHzOQvqc9UOuXL+gcrVOYwUr883KLkEVH7/FqqbSh
         KdvkcrJsqW1Lrb9FNaIBiFZiz2JXHtLF1fi//8lxYZJYMD0bZUJtusACrmqLV3nGEdLU
         5WAMftfKICFsWoD/0aqwSbHS9Wyl9fSE5hYQuoBa99kj5nUbuf52RxDp8vsk+/P4wCMT
         /DTSw9+MkQuG5Ynul1NOp1E+6kY4yrYuhdPjYblWtWQoQPS6KjF15xQHBV/PbL2JUM5W
         6f8g==
X-Gm-Message-State: AOJu0YxxXPvnSykYQ5PTygEuWFMYqu+AC9zSKcZPyNJ/9AEOBHddXwzK
	UhyTI3eLwUGUFMJbPH2G7CCR7WRWBkKxjBeH20JW1F4LdnhWW7ICr0HsmHlKj+2R4OkD
X-Google-Smtp-Source: 
 AGHT+IFjVxE9BVr4RTThMwXjc6X6XEl92U421XxDuDEiAOoZsnVdt96zPNk8h5lEqxkj/sdqdgH9EA==
X-Received: by 2002:a05:6a20:439e:b0:19b:6a1:a6a7 with SMTP id
 i30-20020a056a20439e00b0019b06a1a6a7mr2384453pzl.117.1705663752870;
        Fri, 19 Jan 2024 03:29:12 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b006d9b8e1971dsm4884541pff.191.2024.01.19.03.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:29:12 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 1/5] ASoC: codecs: ES8326: improving crosstalk performance
Date: Fri, 19 Jan 2024 19:28:54 +0800
Message-Id: <20240119112858.2982-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240119112858.2982-1-zhuning0077@gmail.com>
References: <20240119112858.2982-1-zhuning0077@gmail.com>
Message-ID-Hash: RFSKCMLCAWJTW35PCELSGD7ZQLGE35I7
X-Message-ID-Hash: RFSKCMLCAWJTW35PCELSGD7ZQLGE35I7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFSKCMLCAWJTW35PCELSGD7ZQLGE35I7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    We change the crosstalk parameter in es8326_resume function
    to improve crosstalk performance.
    Adding crosstalk kcontrol to enhance the flexibility of crosstalk
    debugging in machine.
    Adding ES8326_DAC_CROSSTALK macro to declare the crosstalk register.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 82 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/es8326.h |  1 +
 2 files changed, 83 insertions(+)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index fa890f6205e2..82d1c4f8324c 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -45,6 +45,82 @@ struct es8326_priv {
 	int jack_remove_retry;
 };
 
+static int es8326_crosstalk1_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int crosstalk_h, crosstalk_l;
+	unsigned int crosstalk;
+
+	regmap_read(es8326->regmap, ES8326_DAC_RAMPRATE, &crosstalk_h);
+	regmap_read(es8326->regmap, ES8326_DAC_CROSSTALK, &crosstalk_l);
+	crosstalk_h &= 0x20;
+	crosstalk_l &= 0xf0;
+	crosstalk = crosstalk_h >> 1 | crosstalk_l >> 4;
+	ucontrol->value.integer.value[0] = crosstalk;
+
+	return 0;
+}
+
+static int es8326_crosstalk1_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int crosstalk_h, crosstalk_l;
+	unsigned int crosstalk;
+
+	crosstalk = ucontrol->value.integer.value[0];
+	regmap_read(es8326->regmap, ES8326_DAC_CROSSTALK, &crosstalk_l);
+	crosstalk_h = (crosstalk & 0x10) << 1;
+	crosstalk_l &= 0x0f;
+	crosstalk_l |= (crosstalk & 0x0f) << 4;
+	regmap_update_bits(es8326->regmap, ES8326_DAC_RAMPRATE,
+			0x20, crosstalk_h);
+	regmap_write(es8326->regmap, ES8326_DAC_CROSSTALK, crosstalk_l);
+
+	return 0;
+}
+
+static int es8326_crosstalk2_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int crosstalk_h, crosstalk_l;
+	unsigned int crosstalk;
+
+	regmap_read(es8326->regmap, ES8326_DAC_RAMPRATE, &crosstalk_h);
+	regmap_read(es8326->regmap, ES8326_DAC_CROSSTALK, &crosstalk_l);
+	crosstalk_h &= 0x10;
+	crosstalk_l &= 0x0f;
+	crosstalk = crosstalk_h  | crosstalk_l;
+	ucontrol->value.integer.value[0] = crosstalk;
+
+	return 0;
+}
+
+static int es8326_crosstalk2_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int crosstalk_h, crosstalk_l;
+	unsigned int crosstalk;
+
+	crosstalk = ucontrol->value.integer.value[0];
+	regmap_read(es8326->regmap, ES8326_DAC_CROSSTALK, &crosstalk_l);
+	crosstalk_h = crosstalk & 0x10;
+	crosstalk_l &= 0xf0;
+	crosstalk_l |= crosstalk & 0x0f;
+	regmap_update_bits(es8326->regmap, ES8326_DAC_RAMPRATE,
+			0x10, crosstalk_h);
+	regmap_write(es8326->regmap, ES8326_DAC_CROSSTALK, crosstalk_l);
+
+	return 0;
+}
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_analog_pga_tlv, 0, 300, 0);
@@ -102,6 +178,10 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 	SOC_SINGLE_TLV("ALC Capture Target Level", ES8326_ALC_LEVEL,
 			0, 0x0f, 0, drc_target_tlv),
 
+	SOC_SINGLE_EXT("CROSSTALK1", SND_SOC_NOPM, 0, 31, 0,
+			es8326_crosstalk1_get, es8326_crosstalk1_set),
+	SOC_SINGLE_EXT("CROSSTALK2", SND_SOC_NOPM, 0, 31, 0,
+			es8326_crosstalk2_get, es8326_crosstalk2_set),
 };
 
 static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
@@ -844,6 +924,8 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME, 0x00);
 	/* calibrate for B version */
 	es8326_calibrate(component);
+	regmap_write(es8326->regmap, ES8326_DAC_CROSSTALK, 0xaa);
+	regmap_write(es8326->regmap, ES8326_DAC_RAMPRATE, 0x00);
 	/* turn off headphone out */
 	regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
 	/* set ADC and DAC in low power mode */
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 90a08351d6ac..dfef808673f4 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -72,6 +72,7 @@
 #define ES8326_DAC_VOL		0x50
 #define ES8326_DRC_RECOVERY	0x53
 #define ES8326_DRC_WINSIZE	0x54
+#define ES8326_DAC_CROSSTALK	0x55
 #define ES8326_HPJACK_TIMER	0x56
 #define ES8326_HPDET_TYPE	0x57
 #define ES8326_INT_SOURCE	0x58
-- 
2.17.1

