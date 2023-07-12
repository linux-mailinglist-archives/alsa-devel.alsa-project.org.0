Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A137500CD
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 10:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5FE43E7;
	Wed, 12 Jul 2023 10:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5FE43E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689149386;
	bh=7+pC5WJrzlkRc+cbkzrNtskfa1GPiFPUfn3/7ncwcp4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lQIOS5DwWbdvvOHlafyFZHhwssFVS0akVLEDTa6lGII2I3T7gxJzLU5XfXNZys0QC
	 7AbL3reXe+6W0XqawKkzywiKOerzS8BYY9NWae5w2UknjrC3Ln3kDdG2Z2fe2sXF7y
	 7FfzurdlbdPSx8+ikYOXnBdAHRGZZSVcWbzMdPWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EDA6F8027B; Wed, 12 Jul 2023 10:08:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE1DF80249;
	Wed, 12 Jul 2023 10:08:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8D92F80290; Wed, 12 Jul 2023 10:08:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A855F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 10:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A855F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=C+blddPP
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-668730696a4so3713598b3a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689149319; x=1691741319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOh8JM5Q3jrZoKDIXTQHeUOKxkZ29/mF6UN2/He0ib0=;
        b=C+blddPPXTxgrh7db3ANIUV4OxZj963w4ks+XWMJI4OuRVGfoPOokuwZMJL2THjI68
         4na64rQWz5vM3IwamfHvYKr3NsCd8+5PR8d/NVF6u4X5y1a/Kn2Znx+sgGT/mXwRuPXr
         gzaEPf0Kl614/ZpGQKAcKT0nIRV09LcowX6ezgi9HCcK0aK47aRSQ3n3olPoO0lLKuN8
         HmnPZipGb+8VCd1NgZPpwJt/lEmoNqE2Nx8MZ5ecemHsKiwCrDzUPp5YKemHTpz3Cor5
         t3HTrhhjPR4W4dPA6PZwYjAPqtc3ARaogDJ3aN2jEKcD7WV0l/sHxdv0YlJJ1IrghZTE
         Z9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689149319; x=1691741319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOh8JM5Q3jrZoKDIXTQHeUOKxkZ29/mF6UN2/He0ib0=;
        b=OGQLQ8K/UX0ev1j3iBtXayp4npiQtbhao5R1mM5wX2K8uVhGR95UspNlmXcscO33j2
         5DbRvaaf5kR0w8zhM6vjvfJzTLLbw/O3RY7NulErcOjLkDcrbMYMMoce3J4v02GNDQf7
         KTXK8SlKkEGtkegocPV7FJlAMQbT3XWb0NHdNRV+rkmBb8DRQ3iKYyQvXqLMjDCgpwAc
         /RDDfxq/8g1BbrGcSmQM0ZR59ZSqU5vQzLPXei+W4I0Mk0wNCT3VN6aExaCwrjY4HAL3
         N2dgW2KvqTr9ezGVI9C60RLkhKxhmAghdRdVcdcBWXvHZ7GuUZk25SRvACOazNZixuI9
         04lg==
X-Gm-Message-State: ABy/qLYD018CdotWXu12JynsANqSZbECUNpt9AFpg1i5EKWi8AkkQO7S
	B/SHYAiFgZVIFGXADPOlM31pJ+AJdnwvcqPq
X-Google-Smtp-Source: 
 APBJJlF4B0cxemPl5fQNiYiwzy3irBa33gV8yFr7nEmfLZ/8VAKh+UrwpOccvR+lFgAMUwh3iyRLdA==
X-Received: by 2002:a05:6a21:7899:b0:12f:85cd:ba10 with SMTP id
 bf25-20020a056a21789900b0012f85cdba10mr18361708pzc.58.1689149319071;
        Wed, 12 Jul 2023 01:08:39 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a170903018a00b001b3f9a5d4besm3285962plg.255.2023.07.12.01.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:08:38 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 1/4] ASoC: codecs: es8326: Add es8326_mute function
Date: Wed, 12 Jul 2023 16:08:27 +0800
Message-Id: <20230712080830.973766-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3BZHCPFGLYOTSLK3BWX75BBQGSSRPF2Q
X-Message-ID-Hash: 3BZHCPFGLYOTSLK3BWX75BBQGSSRPF2Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BZHCPFGLYOTSLK3BWX75BBQGSSRPF2Q/>
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
 sound/soc/codecs/es8326.h |  5 +--
 2 files changed, 34 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index ed348bbf5f49..9190a8779334 100644
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
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
+		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
+				ES8326_MUTE_MASK, ES8326_MUTE);
+		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xf0);
+	} else {
+		if (!es8326->calibrated) {
+			regmap_write(es8326->regmap, ES8326_HP_CAL, 0x88);
+			msleep(30);
+			es8326->calibrated = true;
+		}
+		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa0);
+		regmap_write(es8326->regmap, ES8326_HP_VOL, 0x00);
+		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x77);
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
index 8e5ffe5ee10d..b837ed8c4b39 100644
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
@@ -180,3 +180,4 @@
 #define ES8326_VERSION_B (1 << 0)
 
 #endif
+
-- 
2.34.1

