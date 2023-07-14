Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3A5752FEC
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 05:27:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D317BDEC;
	Fri, 14 Jul 2023 05:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D317BDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689305263;
	bh=W4/r+srZNYybIfknrb2BgQmSkovedGRC8uizuU3JuYQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jUNKrIur6Wo4xRPvDtgndgRLCEUF/Io1JBF8C54nPIvRZDAdUkbW9DEgtUHNh5nSx
	 HPYQr7kZPYawonY0Z0S3W1SYVUtg4Nt03Vcpl/1/f/8FEmEoZB04CHz1BKKtkhmyNQ
	 SSx0WCND/CP5Kzy19P8RQXy96SxEPsis+Zn+IFS0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04B37F8053B; Fri, 14 Jul 2023 05:26:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69704F8053B;
	Fri, 14 Jul 2023 05:26:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D51EF80290; Fri, 14 Jul 2023 05:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5206DF800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 05:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5206DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=piV66UV4
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a1ebb85f99so1262832b6e.2
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 20:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689305101; x=1691897101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eo3IhBDQB2OLd7kiPYuV8sy87FZlhY7X/2vIfGAQRIg=;
        b=piV66UV4MVORBIPq22ot+BIemlj0TiI+ZFDfmfE04DeKH5QlPjsC+qauxE2IC3CWj2
         ewrlsjDT4+VUx3E5+9vP9zhnvwZjrunveA12kHhBsnM4i0VZ6/mnemOAsSI5JlzTIGy3
         nBP7lfyFITdkZBobxiTg1uETx8zZwW5+GU/v9jWDMAhsFUJ5SkO+5G9tT0v5scITzccz
         nLRQXBVRKt5p+5wTqSfTw6r24Mt0w+Dtu8RsheXWTrg0IehXOKCD310EwHrLpUvTpkX5
         TAkFpGiQLKCXbvsg1rcpJRkMoTlzHxUdS4l05S7yzgcd0KkmkND2TLK/4ga8nQXG93qK
         Bxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689305101; x=1691897101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eo3IhBDQB2OLd7kiPYuV8sy87FZlhY7X/2vIfGAQRIg=;
        b=YKnqHGHaIV0ZqOW/96fA9YBgXngbUpRQeOHipFjgj/NtvYrLriwbhD9Itb7ZMY1uGI
         uCRUX2ggCSpowX5FSPcVo+cz+3A78cMofd6CrBU22wnDA0fjeqq/2Ocsg67oGzm/FLcj
         v9DZ+m6cAmKwZtvUeLoyuSi9mNfqbI7g2SpZoP7tX3rZe3YVbhUkNVC9NdSV3WKdnNrN
         yssGf9yf9XnD40MeZJc6jChuLAedhc7qFeAGvYmvDzq1mpA1Cgc2pcpxvl5R0r/LEFhh
         48o4tBD3UQN5LipOPAcMMIrrUmnLbosKfevu9n1E/LzpfxcVAe2J/OrDVIZkn0GlbFSe
         0m2g==
X-Gm-Message-State: ABy/qLbgoTOtwra6mkobabpJmq+sYITHZJsbhIsjmo8mB0A775iNzQsk
	LmuosbpIGr86iX2irbbXk5+AXPCacJ0IT+Mz
X-Google-Smtp-Source: 
 APBJJlH9OpBJ3bks0VAm6MO5uXNbvCAh2WMyNb3pdVkz5pkXtGMulyl3WSQk9/oclaqk/fKm0kyrhQ==
X-Received: by 2002:a05:6808:1801:b0:3a4:3170:cc0e with SMTP id
 bh1-20020a056808180100b003a43170cc0emr5406116oib.38.1689305101182;
        Thu, 13 Jul 2023 20:25:01 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a17090b018300b00262d6ac0140sm216016pjs.9.2023.07.13.20.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 20:25:00 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 1/5] ASoC: codecs: ES8326: Add es8326_mute function
Date: Fri, 14 Jul 2023 11:24:49 +0800
Message-Id: <20230714032453.3334-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M36SPBF3KQLOOB4PEO6O6UPDUQ5QBHLE
X-Message-ID-Hash: M36SPBF3KQLOOB4PEO6O6UPDUQ5QBHLE
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M36SPBF3KQLOOB4PEO6O6UPDUQ5QBHLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The internal analog power and hp Vref of es8326 should always be on to
reduce pop noise. The HP_VOL and HP_CAL are moved to es8326_mute function
so they are turned on at last and turned off at first.

Also, the calibration should be done manually once during start-up
to reduce DC offset on headphone.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 75 ++++++++++++++++-----------------------
 sound/soc/codecs/es8326.h |  9 +++--
 2 files changed, 37 insertions(+), 47 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index ed348bbf5f49..191579d9552c 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -38,6 +38,9 @@ struct es8326_priv {
 	u8 interrupt_clk;
 	bool jd_inverted;
 	unsigned int sysclk;
+
+	bool calibrated;
+	int version;
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
@@ -121,33 +124,12 @@ static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
 	/* Analog Power Supply*/
 	SND_SOC_DAPM_DAC("Right DAC", NULL, ES8326_ANA_PDN, 0, 1),
 	SND_SOC_DAPM_DAC("Left DAC", NULL, ES8326_ANA_PDN, 1, 1),
-	SND_SOC_DAPM_SUPPLY("Analog Power", ES8326_ANA_PDN, 7, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("IBias Power", ES8326_ANA_PDN, 6, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("ADC Vref", ES8326_ANA_PDN, 5, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("DAC Vref", ES8326_ANA_PDN, 4, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("Vref Power", ES8326_ANA_PDN, 3, 1, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MICBIAS1", ES8326_ANA_MICBIAS, 2, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MICBIAS2", ES8326_ANA_MICBIAS, 3, 0, NULL, 0),
 
 	SND_SOC_DAPM_PGA("LHPMIX", ES8326_DAC2HPMIX, 7, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("RHPMIX", ES8326_DAC2HPMIX, 3, 0, NULL, 0),
 
-	/* Headphone Charge Pump and Output */
-	SND_SOC_DAPM_SUPPLY("HPOR Cal", ES8326_HP_CAL, 7, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("HPOL Cal", ES8326_HP_CAL, 3, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("Headphone Charge Pump", ES8326_HP_DRIVER,
-			    3, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("Headphone Driver Bias", ES8326_HP_DRIVER,
-			    2, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("Headphone LDO", ES8326_HP_DRIVER,
-			    1, 1, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("Headphone Reference", ES8326_HP_DRIVER,
-			    0, 1, NULL, 0),
-	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "HPOR Supply", ES8326_HP_CAL,
-			 ES8326_HPOR_SHIFT, 7, 7, 0),
-	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "HPOL Supply", ES8326_HP_CAL,
-			 0, 7, 7, 0),
-
 	SND_SOC_DAPM_OUTPUT("HPOL"),
 	SND_SOC_DAPM_OUTPUT("HPOR"),
 };
@@ -166,34 +148,12 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 	{"I2S OUT", NULL, "ADC L"},
 	{"I2S OUT", NULL, "ADC R"},
 
-	{"I2S OUT", NULL, "Analog Power"},
-	{"I2S OUT", NULL, "ADC Vref"},
-	{"I2S OUT", NULL, "Vref Power"},
-	{"I2S OUT", NULL, "IBias Power"},
-	{"I2S IN", NULL, "Analog Power"},
-	{"I2S IN", NULL, "DAC Vref"},
-	{"I2S IN", NULL, "Vref Power"},
-	{"I2S IN", NULL, "IBias Power"},
-
 	{"Right DAC", NULL, "I2S IN"},
 	{"Left DAC", NULL, "I2S IN"},
 
 	{"LHPMIX", NULL, "Left DAC"},
 	{"RHPMIX", NULL, "Right DAC"},
 
-	{"HPOR", NULL, "HPOR Cal"},
-	{"HPOL", NULL, "HPOL Cal"},
-	{"HPOR", NULL, "HPOR Supply"},
-	{"HPOL", NULL, "HPOL Supply"},
-	{"HPOL", NULL, "Headphone Charge Pump"},
-	{"HPOR", NULL, "Headphone Charge Pump"},
-	{"HPOL", NULL, "Headphone Driver Bias"},
-	{"HPOR", NULL, "Headphone Driver Bias"},
-	{"HPOL", NULL, "Headphone LDO"},
-	{"HPOR", NULL, "Headphone LDO"},
-	{"HPOL", NULL, "Headphone Reference"},
-	{"HPOR", NULL, "Headphone Reference"},
-
 	{"HPOL", NULL, "LHPMIX"},
 	{"HPOR", NULL, "RHPMIX"},
 };
@@ -419,6 +379,31 @@ static int es8326_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+
+	if (mute) {
+		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
+		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
+				ES8326_MUTE_MASK, ES8326_MUTE);
+		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xf0);
+	} else {
+		if (!es8326->calibrated) {
+			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_FORCE_CAL);
+			msleep(30);
+			es8326->calibrated = true;
+		}
+		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa0);
+		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x00);
+		regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_ON);
+		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
+				ES8326_MUTE_MASK, ~(ES8326_MUTE));
+	}
+	return 0;
+}
+
 static int es8326_set_bias_level(struct snd_soc_component *codec,
 				 enum snd_soc_bias_level level)
 {
@@ -469,6 +454,8 @@ static const struct snd_soc_dai_ops es8326_ops = {
 	.hw_params = es8326_pcm_hw_params,
 	.set_fmt = es8326_set_dai_fmt,
 	.set_sysclk = es8326_set_dai_sysclk,
+	.mute_stream = es8326_mute,
+	.no_capture_mute = 1,
 };
 
 static struct snd_soc_dai_driver es8326_dai = {
@@ -691,7 +678,7 @@ static int es8326_suspend(struct snd_soc_component *component)
 
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 	es8326_disable_micbias(component);
-
+	es8326->calibrated = false;
 	regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_OFF);
 	regcache_cache_only(es8326->regmap, true);
 	regcache_mark_dirty(es8326->regmap);
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 8e5ffe5ee10d..3f8f7da58062 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -9,8 +9,6 @@
 #ifndef _ES8326_H
 #define _ES8326_H
 
-#define CONFIG_HHTECH_MINIPMP	1
-
 /* ES8326 register space */
 #define ES8326_RESET		0x00
 #define ES8326_CLK_CTL		0x01
@@ -94,6 +92,8 @@
 #define	ES8326_PWRUP_SEQ_EN	(1 << 5)
 #define ES8326_CODEC_RESET (0x0f << 0)
 #define ES8326_CSM_OFF (0 << 7)
+#define ES8326_MUTE_MASK (3 << 0)
+#define ES8326_MUTE (3 << 0)
 
 /* ES8326_CLK_CTL */
 #define ES8326_CLK_ON (0x7f << 0)
@@ -122,7 +122,9 @@
 #define ES8326_MIC2_SEL (1 << 5)
 
 /* ES8326_HP_CAL */
-#define ES8326_HPOR_SHIFT 4
+#define ES8326_HP_OFF 0
+#define ES8326_HP_FORCE_CAL ((1 << 7) | (1 << 3))
+#define ES8326_HP_ON ((7 << 4) | (7 << 0))
 
 /* ES8326_ADC1_SRC */
 #define ES8326_ADC1_SHIFT 0
@@ -180,3 +182,4 @@
 #define ES8326_VERSION_B (1 << 0)
 
 #endif
+
-- 
2.34.1

