Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CEC76D673
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8111E8B;
	Wed,  2 Aug 2023 20:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8111E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999586;
	bh=v25E65+35t5pP0V64D3Qgxwl4xwU6AWXEASyntTLjSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=McaI0WkYkNHi01GzEM2IgcMfGCc2bLwfJbOiLgo+wvkj1196gFslrygYwDnYiK+41
	 z+k1CnUl2q/ZnLGAYQgiVWBG8v31OhU+B+AP4hR7KEkGluzbQbca7Dvp7UlbGYFlGS
	 w9WntwswCuvM6zzgtd2HjY/itOtn6QPE0O9J5Xt4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7801CF806B1; Wed,  2 Aug 2023 19:59:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8F63F8058C;
	Wed,  2 Aug 2023 19:59:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C91AF80687; Wed,  2 Aug 2023 19:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FE54F8025A
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE54F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hvqAAqCj
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso1289765e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999080; x=1691603880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8q6oeJAXCtu9hv15ODqXQ4DGTBLuJ63S8PbYuJF85k=;
        b=hvqAAqCj6zLmA/e0ULUUNBKF+kdiqCvNGh4AfBHwGFDJ7Rbwbps4cpWNjeCUwQi1Fy
         O+lf+6UUgcFb8NSipYOOu1CQCXQOdWGEe6JYUM6xwdGZMm/Ce9m/KBAN5k0lvEUUH0uk
         yxcd4hlJOJvCRPXZU7lNwuM7JW0oYDgbB1/tHAIXhTJf0OSkLPza5GHCY+idS2GbTR5e
         zzJQkTO9jGj8gy5+GHCHrkLFs+tcOfCvnBKkwhAVCy5LyNLTU0QT/LVbvaKA5w0/uruD
         ndTFEMw+SsH2n9nEWRm9ZLkXoby/GshpBmXmQTkaeBH0XJjzVr5XKlHIQKGymR8/cCHv
         30/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999080; x=1691603880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8q6oeJAXCtu9hv15ODqXQ4DGTBLuJ63S8PbYuJF85k=;
        b=W2mwkT04lv2VqaAR0yOZaIzHB3f9TkUGkBIv5O4XVT6tVRxbjIO6Yrsx9pG+r7gK//
         FbOBe1YKne3vUzclyNV+KQGaxq+i8wG7qxnVH28Ea6rLsUNTQTV8Ky1u69qiogGT9Z8E
         qsI3+kF4DOVeEjFKGnW1E6QWVqGs8+6HJyOKgfO9G9qNsYwTb70JencXS5QyEmvTJPxC
         IXR7JKUGWb8nchR45SbIT6/zZqU8XUG9vkaQUs/HsHNEZu0bQ8RePlxtT+fwPrNtNS95
         DT3r59vZZBqTfCMpZJBqEOpcXeNJLf1tl4V4C3ZUjwCyJ9wf7n9zviKdL3IseLqU6Uzk
         sXVQ==
X-Gm-Message-State: ABy/qLaGQDYPDkqwsuUptixiNwkjwGP+vFE718HsgWPN+1XhzUwl6iCG
	8yK14DC2cYQRzD6l3rPbo25oj6lsubU=
X-Google-Smtp-Source: 
 APBJJlGUrfqpF/yOLbHFeZQc7xwlzqX/qHeUy+3Q3sxp65BzfkvHzfmYba5BF+W7DC9EZ6VUK/bQsw==
X-Received: by 2002:a5d:428f:0:b0:314:2f5b:2ce with SMTP id
 k15-20020a5d428f000000b003142f5b02cemr5303270wrq.12.1690999080395;
        Wed, 02 Aug 2023 10:58:00 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:57:59 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH 03/27] ASoC: amd: acp: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:13 +0300
Message-Id: <20230802175737.263412-4-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OPLSN4PL2VEVLNCB44Z4JCVMM6O3MYAJ
X-Message-ID-Hash: OPLSN4PL2VEVLNCB44Z4JCVMM6O3MYAJ
X-MailFrom: alpernebiyasak@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPLSN4PL2VEVLNCB44Z4JCVMM6O3MYAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The RT5682, RT5682s,
NAU8825 and NAU8821 codecs used here can detect Headphone and Headset
Mic connections. Expose both to userspace as kcontrols and add the
necessary widgets. Split the jack and pin structs per-codec to
accommodate for per-codec differences.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Do I have to keep the lowercase "jack" in the last one instead?
Should the SND_JACK_LINEOUT be removed from the jack_new_pins calls?
I don't know why it was split as vg_headset / pco_jack, maybe everything
could be merged instead?

 sound/soc/amd/acp/acp-mach-common.c | 226 ++++++++++++++++++++++------
 1 file changed, 182 insertions(+), 44 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index ff5cbc4a6427..f3abaa182fbb 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -28,7 +28,6 @@
 #include "../../codecs/nau8821.h"
 #include "acp-mach.h"
 
-static struct snd_soc_jack vg_headset;
 #define PCO_PLAT_CLK 48000000
 #define RT5682_PLL_FREQ (48000 * 512)
 #define DUAL_CHANNEL	2
@@ -52,8 +51,6 @@ const struct dmi_system_id acp_quirk_table[] = {
 };
 EXPORT_SYMBOL_GPL(acp_quirk_table);
 
-static struct snd_soc_jack pco_jack;
-
 static const unsigned int channels[] = {
 	DUAL_CHANNEL,
 };
@@ -87,6 +84,28 @@ static int acp_clk_enable(struct acp_card_drvdata *drvdata,
 SND_SOC_DAILINK_DEF(rt5682,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
 
+static struct snd_soc_jack rt5682_jack;
+static struct snd_soc_jack_pin rt5682_jack_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static const struct snd_kcontrol_new rt5682_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const struct snd_soc_dapm_widget rt5682_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
 static const struct snd_soc_dapm_route rt5682_map[] = {
 	{ "Headphone Jack", NULL, "HPOL" },
 	{ "Headphone Jack", NULL, "HPOR" },
@@ -110,22 +129,38 @@ static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 	drvdata->wclk = clk_get(component->dev, "rt5682-dai-wclk");
 	drvdata->bclk = clk_get(component->dev, "rt5682-dai-bclk");
 
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &pco_jack);
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt5682_widgets,
+					ARRAY_SIZE(rt5682_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, rt5682_controls,
+					ARRAY_SIZE(rt5682_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &rt5682_jack,
+					 rt5682_jack_pins,
+					 ARRAY_SIZE(rt5682_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "HP jack creation failed %d\n", ret);
 		return ret;
 	}
 
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	snd_jack_set_key(rt5682_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(rt5682_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(rt5682_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(rt5682_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	ret = snd_soc_component_set_jack(component, &pco_jack, NULL);
+	ret = snd_soc_component_set_jack(component, &rt5682_jack, NULL);
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
 		return ret;
@@ -275,6 +310,28 @@ static const struct snd_soc_ops acp_card_rt5682_ops = {
 SND_SOC_DAILINK_DEF(rt5682s,
 		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RTL5682:00", "rt5682s-aif1")));
 
+static struct snd_soc_jack rt5682s_jack;
+static struct snd_soc_jack_pin rt5682s_jack_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static const struct snd_kcontrol_new rt5682s_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const struct snd_soc_dapm_widget rt5682s_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
 static const struct snd_soc_dapm_route rt5682s_map[] = {
 	{ "Headphone Jack", NULL, "HPOL" },
 	{ "Headphone Jack", NULL, "HPOR" },
@@ -299,22 +356,38 @@ static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 		drvdata->bclk = clk_get(component->dev, "rt5682-dai-bclk");
 	}
 
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &pco_jack);
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt5682s_widgets,
+					ARRAY_SIZE(rt5682s_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, rt5682s_controls,
+					ARRAY_SIZE(rt5682s_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &rt5682s_jack,
+					 rt5682s_jack_pins,
+					 ARRAY_SIZE(rt5682s_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "HP jack creation failed %d\n", ret);
 		return ret;
 	}
 
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	snd_jack_set_key(rt5682s_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(rt5682s_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(rt5682s_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(rt5682s_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	ret = snd_soc_component_set_jack(component, &pco_jack, NULL);
+	ret = snd_soc_component_set_jack(component, &rt5682s_jack, NULL);
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
 		return ret;
@@ -762,6 +835,28 @@ static const struct snd_soc_ops acp_max98388_ops = {
 SND_SOC_DAILINK_DEF(nau8825,
 		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10508825:00", "nau8825-hifi")));
 
+static struct snd_soc_jack nau8825_jack;
+static struct snd_soc_jack_pin nau8825_jack_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static const struct snd_kcontrol_new nau8825_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const struct snd_soc_dapm_widget nau8825_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
 static const struct snd_soc_dapm_route nau8825_map[] = {
 	{ "Headphone Jack", NULL, "HPOL" },
 	{ "Headphone Jack", NULL, "HPOR" },
@@ -780,22 +875,38 @@ static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
 	if (drvdata->hs_codec_id != NAU8825)
 		return -EINVAL;
 
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
+	ret = snd_soc_dapm_new_controls(&card->dapm, nau8825_widgets,
+					ARRAY_SIZE(nau8825_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, nau8825_controls,
+					ARRAY_SIZE(nau8825_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
 					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
 					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
-					 &pco_jack);
+					 &nau8825_jack,
+					 nau8825_jack_pins,
+					 ARRAY_SIZE(nau8825_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "HP jack creation failed %d\n", ret);
 		return ret;
 	}
 
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	snd_jack_set_key(nau8825_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(nau8825_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(nau8825_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(nau8825_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	ret = snd_soc_component_set_jack(component, &pco_jack, NULL);
+	ret = snd_soc_component_set_jack(component, &nau8825_jack, NULL);
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
 		return ret;
@@ -921,8 +1032,25 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	return ret;
 }
 
+static struct snd_soc_jack nau8821_jack;
+static struct snd_soc_jack_pin nau8821_jack_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static const struct snd_kcontrol_new nau8821_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
 static const struct snd_soc_dapm_widget nau8821_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone jack", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
@@ -932,12 +1060,12 @@ static const struct snd_soc_dapm_widget nau8821_widgets[] = {
 
 static const struct snd_soc_dapm_route nau8821_audio_route[] = {
 	/* HP jack connectors - unknown if we have jack detection */
-	{ "Headphone jack", NULL, "HPOL" },
-	{ "Headphone jack", NULL, "HPOR" },
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
 	{ "MICL", NULL, "Headset Mic" },
 	{ "MICR", NULL, "Headset Mic" },
 	{ "DMIC", NULL, "Int Mic" },
-	{ "Headphone jack", NULL, "Platform Clock" },
+	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
 	{ "Int Mic", NULL, "Platform Clock" },
 };
@@ -966,21 +1094,31 @@ static int acp_8821_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &vg_headset);
+	ret = snd_soc_add_card_controls(card, nau8821_controls,
+					ARRAY_SIZE(nau8821_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &nau8821_jack,
+					 nau8821_jack_pins,
+					 ARRAY_SIZE(nau8821_jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed %d\n", ret);
 		return ret;
 	}
-	snd_jack_set_key(vg_headset.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(vg_headset.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(vg_headset.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(vg_headset.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	nau8821_enable_jack_detect(component, &vg_headset);
+	snd_jack_set_key(nau8821_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(nau8821_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(nau8821_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(nau8821_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	nau8821_enable_jack_detect(component, &nau8821_jack);
 
 	return snd_soc_dapm_add_routes(&rtd->card->dapm, nau8821_audio_route,
 				       ARRAY_SIZE(nau8821_audio_route));
-- 
2.40.1

