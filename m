Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B805821A004
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 14:29:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57D0615F2;
	Thu,  9 Jul 2020 14:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57D0615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594297759;
	bh=EWDsQdn3GDOxfGKiCl7T8XDJbdAAJ9gz6drkQ4IhTVQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpTUBDe+NROcqj4IHyN04QKLveeEnSu/I3MfJ7Ax6F/AdCYFxed3r8Zv21ookr7wd
	 2h6yy41VcRsB7tDwP9/cB0RY8XEV+FLWc7OFDy6X3Bie+VU5c+AfP6jdl28P86eM3Z
	 fPp9b7BVNm1HmXsLMVVfDYxOAealhCRcKL+rGnDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0613FF802DD;
	Thu,  9 Jul 2020 14:25:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD42EF802EC; Thu,  9 Jul 2020 14:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FD80F802DD
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 14:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD80F802DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sLSTE/LF"
Received: by mail-yb1-xb4a.google.com with SMTP id i203so2649467yba.9
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 05:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9A1xWv5PcetWLDv17nyjEyWHMq2fVkUg/EnnDj/J8IE=;
 b=sLSTE/LFjK9O2CAv0xFboVwWfTF0PVAx0LflUK1E5pc2b9FjBRl9QVUFeYrtIG7jyh
 EoiG/hnd4emriS6kaJhTtgL7jWv0P6/IEZtK/JYco5N3cc4XlzYU4/E9CdFHa5f7/+QP
 txIeMIxWYEP0P29L0/XbIva/3jT1bczqCtnEInxZqG6P6VeMrmRq1o8O3MvtOiUIE/bi
 xk7eWfrxAwlO7FCMdoVN7QNryxWYak/+uq0Rlby6moZNiEmnzO7SOrF2DIEsNXUfrQis
 tVhGjkq6utQJ2Te5iv/KEo9COlBsQLwo24wz1N5/5+xrQW6wUIAK+qfBYoiZuqL4sBHj
 jT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9A1xWv5PcetWLDv17nyjEyWHMq2fVkUg/EnnDj/J8IE=;
 b=eC45LmvrKMI4/afoGOzHuHJdaCIJiAgQ9M2+bpKvKZXibUO7YjAqACnNBbSD0YuJ6h
 h4q4Ed+1vz5Z9neCVes1NNmtq2XYcmV71yGVNmJWKM7ZAwFHWpUNQx3gLQI4CYSDbqvt
 7/qoVwYNIThCeiOZwv9UkIwmP9tIh5bGGM0F3ldEFmkytpNuimYSemjAriP0qS180gFe
 01YEXPB+Fngs0JXCfMdctTmvrrn3gog+K+4ATRf1odO8ZF0J/gG4Pje0cCkmtlL9ftz4
 JGJ8H1sATVJ1mx5TbblREJVbRy13zQ7Z2rMJMBd1xl7r0DXIi6c/fboLaL6PL7BKkZ4a
 CMWQ==
X-Gm-Message-State: AOAM532abPHJtRnloLrDRcnNGu+9H3KjrroQxQv6E+qKV1SEn1RfRjal
 RSmRuwmGBspclzLdu4JFpMh9ajeVBME6
X-Google-Smtp-Source: ABdhPJw7LhFEWDQkmmUEKM3pX/o3JZn8M+N/r+E1RXC8w6USlbStIJ23UcTTapP+1Isy4aSC0S9vcZ4Dovyi
X-Received: by 2002:a25:cfd7:: with SMTP id f206mr9264630ybg.289.1594297511427; 
 Thu, 09 Jul 2020 05:25:11 -0700 (PDT)
Date: Thu,  9 Jul 2020 20:24:45 +0800
In-Reply-To: <20200709122445.1584497-1-tzungbi@google.com>
Message-Id: <20200709122445.1584497-6-tzungbi@google.com>
Mime-Version: 1.0
References: <20200709122445.1584497-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 5/5] ASoC: mediatek: mt8183-da7219: support machine driver
 with rt1015
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Supports machine driver with rt1015 ("mt8183-da7219-rt1015").  Embeds in
existing mt8183-da7219-max98357.c because they share most of the code.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |   5 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 170 ++++++++++++++++--
 2 files changed, 158 insertions(+), 17 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 238e4871678a..786a8d5031e4 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -134,15 +134,16 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	  If unsure select "N".
 
 config SND_SOC_MT8183_DA7219_MAX98357A
-	tristate "ASoC Audio driver for MT8183 with DA7219 MAX98357A codec"
+	tristate "ASoC Audio driver for MT8183 with DA7219 MAX98357A RT1015 codec"
 	depends on SND_SOC_MT8183 && I2C
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
+	select SND_SOC_RT1015
 	select SND_SOC_DA7219
 	select SND_SOC_BT_SCO
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
-	  with the DA7219 MAX98357A audio codec.
+	  with the DA7219 MAX98357A RT1015 audio codec.
 	  Select Y if you have such device.
 	  If unsure select "N".
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 17c8e4ac18a9..bc551a4af25f 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -8,6 +8,7 @@
 
 #include <linux/input.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
@@ -15,10 +16,14 @@
 
 #include "../../codecs/da7219-aad.h"
 #include "../../codecs/da7219.h"
+#include "../../codecs/rt1015.h"
 #include "mt8183-afe-common.h"
 
 #define DA7219_CODEC_DAI "da7219-hifi"
 #define DA7219_DEV_NAME "da7219.5-001a"
+#define RT1015_CODEC_DAI "rt1015-aif"
+#define RT1015_DEV0_NAME "rt1015.6-0028"
+#define RT1015_DEV1_NAME "rt1015.6-0029"
 
 struct mt8183_da7219_max98357_priv {
 	struct snd_soc_jack headset_jack;
@@ -108,6 +113,51 @@ static const struct snd_soc_ops mt8183_da7219_i2s_ops = {
 	.hw_free = mt8183_da7219_hw_free,
 };
 
+static int
+mt8183_da7219_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	unsigned int rate = params_rate(params);
+	struct snd_soc_dai *codec_dai;
+	int ret = 0, i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!strcmp(codec_dai->component->name, RT1015_DEV0_NAME) ||
+		    !strcmp(codec_dai->component->name, RT1015_DEV1_NAME)) {
+			ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+			if (ret) {
+				dev_err(rtd->dev, "failed to set bclk ratio\n");
+				return ret;
+			}
+
+			ret = snd_soc_dai_set_pll(codec_dai, 0,
+						  RT1015_PLL_S_BCLK,
+						  rate * 64, rate * 256);
+			if (ret) {
+				dev_err(rtd->dev, "failed to set pll\n");
+				return ret;
+			}
+
+			ret = snd_soc_dai_set_sysclk(codec_dai,
+						     RT1015_SCLK_S_PLL,
+						     rate * 256,
+						     SND_SOC_CLOCK_IN);
+			if (ret) {
+				dev_err(rtd->dev, "failed to set sysclk\n");
+				return ret;
+			}
+		}
+	}
+
+	return mt8183_da7219_i2s_hw_params(substream, params);
+}
+
+static const struct snd_soc_ops mt8183_da7219_rt1015_i2s_ops = {
+	.hw_params = mt8183_da7219_rt1015_i2s_hw_params,
+	.hw_free = mt8183_da7219_hw_free,
+};
+
 static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
@@ -120,6 +170,18 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					     struct snd_pcm_hw_params *params)
+{
+	/* fix BE i2s format to 32bit, clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+
+	return 0;
+}
+
 static int
 mt8183_da7219_max98357_startup(
 	struct snd_pcm_substream *substream)
@@ -272,12 +334,19 @@ SND_SOC_DAILINK_DEFS(i2s2,
 	DAILINK_COMP_ARRAY(COMP_CODEC(DA7219_DEV_NAME, DA7219_CODEC_DAI)),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-SND_SOC_DAILINK_DEFS(i2s3,
+SND_SOC_DAILINK_DEFS(i2s3_max98357a,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
 	DAILINK_COMP_ARRAY(COMP_CODEC("max98357a", "HiFi"),
 			   COMP_CODEC(DA7219_DEV_NAME, DA7219_CODEC_DAI)),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(i2s3_rt1015,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME, RT1015_CODEC_DAI),
+			   COMP_CODEC(RT1015_DEV1_NAME, RT1015_CODEC_DAI),
+			   COMP_CODEC(DA7219_DEV_NAME, DA7219_CODEC_DAI)),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 SND_SOC_DAILINK_DEFS(i2s5,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S5")),
 	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
@@ -288,7 +357,7 @@ SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
+static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	/* FE */
 	{
 		.name = "Playback_1",
@@ -423,9 +492,6 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
-		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
-		.ops = &mt8183_da7219_i2s_ops,
-		SND_SOC_DAILINK_REG(i2s3),
 	},
 	{
 		.name = "I2S5",
@@ -518,25 +584,56 @@ static struct snd_soc_card mt8183_da7219_max98357_card = {
 	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_max98357_dapm_widgets),
 	.dapm_routes = mt8183_da7219_max98357_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_max98357_dapm_routes),
-	.dai_link = mt8183_da7219_max98357_dai_links,
-	.num_links = ARRAY_SIZE(mt8183_da7219_max98357_dai_links),
+	.dai_link = mt8183_da7219_dai_links,
+	.num_links = ARRAY_SIZE(mt8183_da7219_dai_links),
 	.aux_dev = &mt8183_da7219_max98357_headset_dev,
 	.num_aux_devs = 1,
 	.codec_conf = mt6358_codec_conf,
 	.num_configs = ARRAY_SIZE(mt6358_codec_conf),
 };
 
+static struct snd_soc_codec_conf mt8183_da7219_rt1015_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF("mt6358-sound"),
+		.name_prefix = "Mt6358",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1015_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1015_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
+static struct snd_soc_card mt8183_da7219_rt1015_card = {
+	.name = "mt8183_da7219_rt1015",
+	.owner = THIS_MODULE,
+	.controls = mt8183_da7219_max98357_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_da7219_max98357_snd_controls),
+	.dapm_widgets = mt8183_da7219_max98357_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_max98357_dapm_widgets),
+	.dapm_routes = mt8183_da7219_max98357_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_max98357_dapm_routes),
+	.dai_link = mt8183_da7219_dai_links,
+	.num_links = ARRAY_SIZE(mt8183_da7219_dai_links),
+	.aux_dev = &mt8183_da7219_max98357_headset_dev,
+	.num_aux_devs = 1,
+	.codec_conf = mt8183_da7219_rt1015_codec_conf,
+	.num_configs = ARRAY_SIZE(mt8183_da7219_rt1015_codec_conf),
+};
+
 static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = &mt8183_da7219_max98357_card;
+	struct snd_soc_card *card;
 	struct device_node *platform_node;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_da7219_max98357_priv *priv;
 	struct pinctrl *pinctrl;
+	const struct of_device_id *match;
 	int ret, i;
 
-	card->dev = &pdev->dev;
-
 	platform_node = of_parse_phandle(pdev->dev.of_node,
 					 "mediatek,platform", 0);
 	if (!platform_node) {
@@ -544,10 +641,46 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
+	if (!match || !match->data)
+		return -EINVAL;
+
+	card = (struct snd_soc_card *)match->data;
+	card->dev = &pdev->dev;
+
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->platforms->name)
-			continue;
-		dai_link->platforms->of_node = platform_node;
+		if (strcmp(dai_link->name, "I2S3") == 0) {
+			if (card == &mt8183_da7219_max98357_card) {
+				dai_link->be_hw_params_fixup =
+					mt8183_i2s_hw_params_fixup;
+				dai_link->ops = &mt8183_mt6358_i2s_ops;
+				dai_link->cpus = i2s3_max98357a_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s3_max98357a_cpus);
+				dai_link->codecs = i2s3_max98357a_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s3_max98357a_codecs);
+				dai_link->platforms = i2s3_max98357a_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s3_max98357a_platforms);
+			} else if (card == &mt8183_da7219_rt1015_card) {
+				dai_link->be_hw_params_fixup =
+					mt8183_rt1015_i2s_hw_params_fixup;
+				dai_link->ops = &mt8183_da7219_rt1015_i2s_ops;
+				dai_link->cpus = i2s3_rt1015_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s3_rt1015_cpus);
+				dai_link->codecs = i2s3_rt1015_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s3_rt1015_codecs);
+				dai_link->platforms = i2s3_rt1015_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s3_rt1015_platforms);
+			}
+		}
+
+		if (!dai_link->platforms->name)
+			dai_link->platforms->of_node = platform_node;
 	}
 
 	mt8183_da7219_max98357_headset_dev.dlc.of_node =
@@ -578,14 +711,21 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id mt8183_da7219_max98357_dt_match[] = {
-	{.compatible = "mediatek,mt8183_da7219_max98357",},
+	{
+		.compatible = "mediatek,mt8183_da7219_max98357",
+		.data = &mt8183_da7219_max98357_card,
+	},
+	{
+		.compatible = "mediatek,mt8183_da7219_rt1015",
+		.data = &mt8183_da7219_rt1015_card,
+	},
 	{}
 };
 #endif
 
 static struct platform_driver mt8183_da7219_max98357_driver = {
 	.driver = {
-		.name = "mt8183_da7219_max98357",
+		.name = "mt8183_da7219",
 #ifdef CONFIG_OF
 		.of_match_table = mt8183_da7219_max98357_dt_match,
 #endif
-- 
2.27.0.383.g050319c2ae-goog

