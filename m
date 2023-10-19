Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E63577CFC3B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:14:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FC8DE10;
	Thu, 19 Oct 2023 16:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FC8DE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724864;
	bh=myvBm0G9x06+PEpMlCtUwpmMdHV2/eGXRaezSLdVKTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cyspYNEpMECKfbu44GeEF0n+zf1eUW8oerFh4Ca4xbC49xTbjq31NOJOIOorf0kKk
	 fn3KGdQzkNJkm/XtiWB6mybMEbfth2V/AZnZMr7e0RjdHLiF+3C2ZxhQdeAYX01gyJ
	 tUUSLlAniAGvUCeOaYu7lFP/zNcSikdq5xaBRaDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A7E5F805FF; Thu, 19 Oct 2023 16:11:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46AF3F805F7;
	Thu, 19 Oct 2023 16:11:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24151F8024E; Thu, 19 Oct 2023 04:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8D83F8025F
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 04:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8D83F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=C+sPJwKG
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6bee11456baso463391b3a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Oct 2023 19:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697681506; x=1698286306; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TesY55WayWThzDzzYAmx0jlTWe8bYphYnJXBdBkbqm4=;
        b=C+sPJwKGK1/5WDcqPfhlMJNyWKSBBevCrrOIvkt0J2tCVRxPu7UA6utvWPq9pOeFsg
         uO0JVOr/5Ac2Orik5iJDhbKyF4vaHRlQHmxB+iTV2sEzwcUZTapJAxNqStsIUlmnqAF6
         MLfnBqZWDJBMPfbPKZNUaRh/2FzQShItUPM2AqEMtVMVS6VTt1XVHsDns2aCTXV7v0Y1
         M1HZBEyl+mfUVLg4SGD3XiHNPR+UkZixrY3grs9Id0M+wIoCAW3qspiW5FowjvYJz0Ds
         +RJmInJ2Ia8BXHiRa88GQ9W+wiBuvDYhloa1XBFOlaCRIgvVdxqrtuL2VAYc0hkHwjIj
         2p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697681506; x=1698286306;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TesY55WayWThzDzzYAmx0jlTWe8bYphYnJXBdBkbqm4=;
        b=WagTiv1SdyA/croj3KRQKQJK/RJTTgvR3WUj3rvel/U9JftqYvdHvlLLS2lJ91N97h
         WSHlV0/Nt/hCthb8LA4QQ7wB4JoqpYK0xuK85nEPG9sRbL9QxJznWPm+JkzSl04Df6pW
         WqOPOEhYwJbSXaizJ1Qy06e65ej1U4OqrPIC/w9czvyOuhj4nqVoM1Lbna8quVlcPoeR
         uYNhPHCLThPMkDUMaKfwOOvlwxFbsQokrOpk7iqJuspYJ15sCj34cUyrQT2SGXFdAqAv
         qrT9fkIsbPoW+oEk1o2ZcR2QC8JIPi+eR1kbuHcz5ozYWemVe3E2z09jTB8IPgldXsH/
         g4LQ==
X-Gm-Message-State: AOJu0YzH+mSoFyjsttiYXARMSF/1sFwMUtpIYJtLoQOxljXjNMDuobOM
	WY6fGuc4WB3yJxXWP1D+e6M+0Q==
X-Google-Smtp-Source: 
 AGHT+IEjGbSHVE9/MFrqNqEm01C96ZHgZKf48mYBwZfkvR+TH1wdoxro0LKzp/BecYxza4103ygmyg==
X-Received: by 2002:a05:6a00:23c9:b0:693:3cac:7897 with SMTP id
 g9-20020a056a0023c900b006933cac7897mr947076pfc.9.1697681506266;
        Wed, 18 Oct 2023 19:11:46 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 d7-20020aa797a7000000b0068fadc9226dsm3974278pfq.33.2023.10.18.19.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:11:46 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 2/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650
 support
Date: Thu, 19 Oct 2023 10:11:33 +0800
Message-Id: 
 <20231019021133.23855-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SSILH7ACKX3X5GVGOAIEYP7BZUMNT3ER
X-Message-ID-Hash: SSILH7ACKX3X5GVGOAIEYP7BZUMNT3ER
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:11:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSILH7ACKX3X5GVGOAIEYP7BZUMNT3ER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5650 as the codec and the amp, add a new
sound card named mt8186_rt5650.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 45 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 43c8fea00439..b93d455744ab 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -210,6 +210,7 @@ config SND_SOC_MT8186_MT6366_RT1019_RT5682S
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682S
+	select SND_SOC_RT5645
 	select SND_SOC_BT_SCO
 	select SND_SOC_DMIC
 	select SND_SOC_HDMI_CODEC
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 4684bfd89ecd..8c534c338f0e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -170,6 +170,7 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_codec =
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
+	int type;
 
 	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
 	if (ret) {
@@ -193,7 +194,8 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	return snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
+	type = SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3;
+	return snd_soc_component_set_jack(cmpnt_codec, jack, (void *)&type);
 }
 
 static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -1058,6 +1060,28 @@ mt8186_mt6366_rt1019_rt5682s_routes[] = {
 	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
 };
 
+static const struct snd_soc_dapm_route
+mt8186_mt6366_rt5650_routes[] = {
+	/* SPK */
+	{"Speakers", NULL, "SPOL"},
+	{"Speakers", NULL, "SPOR"},
+	/* Headset */
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+	{ "IN1N", NULL, "Headset Mic"},
+	/* HDMI */
+	{ "HDMI1", NULL, "TX" },
+	/* SOF Uplink */
+	{SOF_DMA_UL1, NULL, "UL1_CH1"},
+	{SOF_DMA_UL1, NULL, "UL1_CH2"},
+	{SOF_DMA_UL2, NULL, "UL2_CH1"},
+	{SOF_DMA_UL2, NULL, "UL2_CH2"},
+	/* SOF Downlink */
+	{"DSP_DL1_VIRT", NULL, SOF_DMA_DL1},
+	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
+};
+
 static const struct snd_kcontrol_new
 mt8186_mt6366_rt1019_rt5682s_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
@@ -1096,6 +1120,21 @@ static struct snd_soc_card mt8186_mt6366_rt5682s_max98360_soc_card = {
 	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
 };
 
+static struct snd_soc_card mt8186_mt6366_rt5650_soc_card = {
+	.name = "mt8186_rt5650",
+	.owner = THIS_MODULE,
+	.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
+	.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
+	.controls = mt8186_mt6366_rt1019_rt5682s_controls,
+	.num_controls = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_controls),
+	.dapm_widgets = mt8186_mt6366_rt1019_rt5682s_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_widgets),
+	.dapm_routes = mt8186_mt6366_rt5650_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_rt5650_routes),
+	.codec_conf = mt8186_mt6366_rt1019_rt5682s_codec_conf,
+	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
+};
+
 static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -1253,6 +1292,10 @@ static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
 		.compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound",
 		.data = &mt8186_mt6366_rt5682s_max98360_soc_card,
 	},
+	{
+		.compatible = "mediatek,mt8186-mt6366-rt5650-sound",
+		.data = &mt8186_mt6366_rt5650_soc_card,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt8186_mt6366_rt1019_rt5682s_dt_match);
-- 
2.17.1

