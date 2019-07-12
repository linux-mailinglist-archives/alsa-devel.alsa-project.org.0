Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41DA66ABB
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 12:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74FB31607;
	Fri, 12 Jul 2019 12:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74FB31607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562926163;
	bh=PQofZ8Cd1gkJSRVDqnIbuzYSKZePYfPMruy1e7wA4/M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P1IhurIfwRb9RWyynks+CEfDB8MhdS/QyZhMjJELlcrpv827NGvor9CckcIGJ/kYL
	 LwqjlY4peiOdD8o7UQCOYIixku93chGfcFqu2+toup5LIMzzjU3yz6z1hDL2fcslH8
	 lHCaKCqXmV4eVIq5UCZlJpXnAEmzVxmTlaAxK9lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EB45F80393;
	Fri, 12 Jul 2019 12:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D0F9F803CF; Fri, 12 Jul 2019 12:05:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PDS_NO_HELO_DNS, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4BE0F80394
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 12:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4BE0F80394
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SZN+/74k"
Received: by mail-pg1-x541.google.com with SMTP id s27so4338006pgl.2
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UcuUE/S7i/9RoJgJQkaNx3Dl7upRJzpic0vUkmZftPI=;
 b=SZN+/74k664aY8s7pxXCuLYbdIWYXlWOmIjt1Pl2yd3TZUdFe5aUbrFHFE5qtNExB7
 WrPZJiVGfuOjoU4vWKoQTUtnsaOp6vhdiDoY9kiDGmoupHj2EJRPSANIqGmaBmDUrMnO
 rqcY58Nm6qrZQp7p/YNN0kc4S2Nr7XpLkayiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UcuUE/S7i/9RoJgJQkaNx3Dl7upRJzpic0vUkmZftPI=;
 b=ei9KEp/i+C3MAGGODp/IOajq+1bgfJLwDiS3uZ2oMQSYaJkPKiPmDvpVWCMYM1qGTU
 DBmDYrSKqYjvazDXiWQ8+Ys72Yzkpcoll7LYUFaFl4PW5pOjcNTbas5pWuV3hn3Qq+Wx
 DaDBB4lRDAASZwCwRss0rzXLjp9cTCWdQOA4XkcBi0EcizplDyJw8Zxc7RvVpFK8/8HJ
 zWHmyUEXNifGgAZO78LzBCcsN4TEU/SAZAxd+abVoXFtY8VLwEj3LmKnMdZ8sdkpVHh0
 iXn4cNg9QA8u86dp2DddzAsEy3ANfx26vnwPYcva53X5lJQ2SKubdfXvrsMUTs2jPRLk
 X4JA==
X-Gm-Message-State: APjAAAX+qbPugiNB1WvYoOBpa3oQmrfFdromvJsV4jlQXHDih6fbfBXH
 bb/kdXN/vHTkEFmjrTGSHrTmBQ==
X-Google-Smtp-Source: APXvYqxh7q966eYcp2rR9UQb8pkOB6/cMnveD2kVcKioxebwqu35NF1XmSzQ1pCVN5SrTk+j1hLFEA==
X-Received: by 2002:a17:90a:376f:: with SMTP id
 u102mr10750198pjb.5.1562925944579; 
 Fri, 12 Jul 2019 03:05:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id t29sm9600560pfq.156.2019.07.12.03.05.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 03:05:44 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 12 Jul 2019 18:04:42 +0800
Message-Id: <20190712100443.221322-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190712100443.221322-1-cychiang@chromium.org>
References: <20190712100443.221322-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tzungbi@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH v3 4/5] ASoC: rockchip_max98090: Add dai_link
	for HDMI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use two dai_links. One for HDMI and one for max98090.
With this setup, audio can play to speaker and HDMI selectively.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/Kconfig             |  3 +-
 sound/soc/rockchip/rockchip_max98090.c | 96 ++++++++++++++++++++------
 2 files changed, 75 insertions(+), 24 deletions(-)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index b43657e6e655..d610b553ea3b 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -40,9 +40,10 @@ config SND_SOC_ROCKCHIP_MAX98090
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_MAX98090
 	select SND_SOC_TS3A227E
+	select SND_SOC_HDMI_CODEC
 	help
 	  Say Y or M here if you want to add support for SoC audio on Rockchip
-	  boards using the MAX98090 codec, such as Veyron.
+	  boards using the MAX98090 codec and HDMI codec, such as Veyron.
 
 config SND_SOC_ROCKCHIP_RT5645
 	tristate "ASoC support for Rockchip boards using a RT5645/RT5650 codec"
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index c5fc24675a33..c82948e383da 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -11,6 +11,7 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <sound/core.h>
+#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -41,6 +42,7 @@ static const struct snd_soc_dapm_widget rk_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_LINE("HDMI", NULL),
 };
 
 static const struct snd_soc_dapm_route rk_audio_map[] = {
@@ -52,6 +54,7 @@ static const struct snd_soc_dapm_route rk_audio_map[] = {
 	{"Headphone", NULL, "HPR"},
 	{"Speaker", NULL, "SPKL"},
 	{"Speaker", NULL, "SPKR"},
+	{"HDMI", NULL, "TX"},
 };
 
 static const struct snd_kcontrol_new rk_mc_controls[] = {
@@ -59,6 +62,7 @@ static const struct snd_kcontrol_new rk_mc_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Int Mic"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
+	SOC_DAPM_PIN_SWITCH("HDMI"),
 };
 
 static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
@@ -92,38 +96,63 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 
 	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
 				     SND_SOC_CLOCK_OUT);
-	if (ret < 0) {
-		dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
+	if (ret) {
+		dev_err(cpu_dai->dev, "Can't set cpu dai clock %d\n", ret);
 		return ret;
 	}
 
+	/* HDMI codec dai does not need to set sysclk. */
+	if (!strcmp(rtd->dai_link->name, "HDMI"))
+		return 0;
+
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
 				     SND_SOC_CLOCK_IN);
-	if (ret < 0) {
-		dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
+	if (ret) {
+		dev_err(codec_dai->dev, "Can't set codec dai clock %d\n", ret);
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_ops rk_aif1_ops = {
 	.hw_params = rk_aif1_hw_params,
 };
 
-SND_SOC_DAILINK_DEFS(hifi,
+SND_SOC_DAILINK_DEFS(analog,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link rk_dailink = {
-	.name = "max98090",
-	.stream_name = "Audio",
-	.ops = &rk_aif1_ops,
-	/* set max98090 as slave */
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		SND_SOC_DAIFMT_CBS_CFS,
-	SND_SOC_DAILINK_REG(hifi),
+SND_SOC_DAILINK_DEFS(hdmi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(HDMI_CODEC_DRV_NAME, "i2s-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+enum {
+	DAILINK_MAX98090,
+	DAILINK_HDMI,
+};
+
+/* max98090 and HDMI codec dai_link */
+static struct snd_soc_dai_link rk_dailinks[] = {
+	[DAILINK_MAX98090] = {
+		.name = "max98090",
+		.stream_name = "Analog",
+		.ops = &rk_aif1_ops,
+		/* set max98090 as slave */
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		SND_SOC_DAILINK_REG(analog),
+	},
+	[DAILINK_HDMI] = {
+		.name = "HDMI",
+		.stream_name = "HDMI",
+		.ops = &rk_aif1_ops,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		SND_SOC_DAILINK_REG(hdmi),
+	}
 };
 
 static int rk_98090_headset_init(struct snd_soc_component *component);
@@ -136,8 +165,8 @@ static struct snd_soc_aux_dev rk_98090_headset_dev = {
 static struct snd_soc_card snd_soc_card_rk = {
 	.name = "ROCKCHIP-I2S",
 	.owner = THIS_MODULE,
-	.dai_link = &rk_dailink,
-	.num_links = 1,
+	.dai_link = rk_dailinks,
+	.num_links = ARRAY_SIZE(rk_dailinks),
 	.aux_dev = &rk_98090_headset_dev,
 	.num_aux_devs = 1,
 	.dapm_widgets = rk_dapm_widgets,
@@ -173,27 +202,48 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	int ret = 0;
 	struct snd_soc_card *card = &snd_soc_card_rk;
 	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np_analog;
+	struct device_node *np_cpu;
+	struct of_phandle_args args;
 
 	/* register the soc card */
 	card->dev = &pdev->dev;
 
-	rk_dailink.codecs->of_node = of_parse_phandle(np,
-			"rockchip,audio-codec", 0);
-	if (!rk_dailink.codecs->of_node) {
+	np_analog = of_parse_phandle(np, "rockchip,audio-codec", 0);
+	if (!np_analog) {
 		dev_err(&pdev->dev,
 			"Property 'rockchip,audio-codec' missing or invalid\n");
 		return -EINVAL;
 	}
+	rk_dailinks[DAILINK_MAX98090].codecs->of_node = np_analog;
+
+	ret = of_parse_phandle_with_fixed_args(np, "rockchip,audio-codec",
+					       0, 0, &args);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Unable to parse property 'rockchip,audio-codec'\n");
+		return ret;
+	}
+
+	ret = snd_soc_get_dai_name(
+			&args, &rk_dailinks[DAILINK_MAX98090].codecs->dai_name);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to get codec dai_name\n");
+		return ret;
+	}
+
+	np_cpu = of_parse_phandle(np, "rockchip,i2s-controller", 0);
 
-	rk_dailink.cpus->of_node = of_parse_phandle(np,
-			"rockchip,i2s-controller", 0);
-	if (!rk_dailink.cpus->of_node) {
+	if (!np_cpu) {
 		dev_err(&pdev->dev,
 			"Property 'rockchip,i2s-controller' missing or invalid\n");
 		return -EINVAL;
 	}
 
-	rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
+	rk_dailinks[DAILINK_MAX98090].cpus->of_node = np_cpu;
+	rk_dailinks[DAILINK_MAX98090].platforms->of_node = np_cpu;
+	rk_dailinks[DAILINK_HDMI].cpus->of_node = np_cpu;
+	rk_dailinks[DAILINK_HDMI].platforms->of_node = np_cpu;
 
 	rk_98090_headset_dev.codec_of_node = of_parse_phandle(np,
 			"rockchip,headset-codec", 0);
-- 
2.22.0.510.g264f2c817a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
