Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596FD7CFC3F
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:15:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92CC8EAD;
	Thu, 19 Oct 2023 16:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92CC8EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724904;
	bh=WZt5eTa7zkW6bQrHgbHRjZQbRqV3ZR/LqPocFu3tH7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rk8D6UTx2XDwuEv1BGcLWWmxy2KWTpLpL0Cw5CJZNAXa2E2eADyfAehb0/CGjYZOR
	 Xvk0XngdsfgAvrmNfzLtW9bXeryIqfnBf4pax/qBhzhtUYSSJrn5ST3X8W5WJV84sp
	 RvkiFj8yWSRwZbbCcNJlnCGbNzomHgdBnAftcWiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF3F5F80614; Thu, 19 Oct 2023 16:11:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DEFAF8060D;
	Thu, 19 Oct 2023 16:11:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41165F8027B; Thu, 19 Oct 2023 12:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFE89F800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 12:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFE89F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=JGICuzAJ
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6bd0e1b1890so4058202b3a.3
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Oct 2023 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697709815; x=1698314615; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jy2Ch1JEdLGN/hTnIKDE58lJ94BQHeUPcnTqdlap1A=;
        b=JGICuzAJ8r7AggItviNYBmj58TXijf6ThtjFwk3bpMFcxYFqMHGmwrjeJrXqxxGojp
         A0tyN+W1jy103/7/WoXcFG8Gz1OBrWizzy8jVu3fzYiBsc1claVOmr1k11nQgfhTr0MS
         8xJmzrHex97PgpRsReGIkBPtdozKMNYhfBFrEV8r6NYGNxEFq5HFM5VVcJzKVQTe9BDq
         V9Z73Bh5Nz+y1OVeikAe5pOeaD9VFHaFtPvvouBuVGXSxMla+rJa3eCE3z/O1lIHTgQa
         m+QXsb2emygR1PwrzSqWeJfTfwkp4mvgyx/VyHCbvt/8EnP5nKa4l4z4TmTs3m8ia+We
         /SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709815; x=1698314615;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jy2Ch1JEdLGN/hTnIKDE58lJ94BQHeUPcnTqdlap1A=;
        b=Ca14BICCtSagfOyOSB/fWtiTkOzpwXDGoACG/rxxu0CuAkO3j9kwyi16ld9QpASqUs
         4lQTpWpb9GlYOCYOynKYCJDpPdBYsKa0ad7QINuH2yZd07rPIIgIpo/Krgj1Z4R/geEB
         QwLSLNGJA8KnI+6IdyEL0Ch6k7G8x9EZtj9r5t5ZIx463UtqCREDjQF9/c6NvrwwxaDv
         UclfvTI7aCtMG+Ti+PpzJ4lifydMvrGb/Z7c6hyq5Iw6fFOjoethcVWVmDgTPGnF5pfv
         s0uKWFn1FekljYAuAOPBWKqveUQ2s3uKdRbV1vLIkcR7hYC8oyEZuHWNmgXZbosMJEGt
         b1EQ==
X-Gm-Message-State: AOJu0YzsXoZ/4/aqbgVk4ejQmBlmvFx4OjWL/Vb6EN2Gm0WQDZ9XX5h8
	Et9hgm/FzL/9FnPlU27Z1Sxq0w==
X-Google-Smtp-Source: 
 AGHT+IHuTIV8zd8oIWuYyHvZgbVMSpc3Bu+zC2skiZiABWHGYXflDFcB+DMne2So7LrkNPAQqeqglw==
X-Received: by 2002:aa7:9852:0:b0:68a:4bef:5f9a with SMTP id
 n18-20020aa79852000000b0068a4bef5f9amr1249581pfq.0.1697709815452;
        Thu, 19 Oct 2023 03:03:35 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a655209000000b005b46e691108sm2606680pgp.68.2023.10.19.03.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:03:35 -0700 (PDT)
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
Subject: [v2 2/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650
 support
Date: Thu, 19 Oct 2023 18:03:22 +0800
Message-Id: 
 <20231019100322.25425-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SLV5MIM5P5DF4FT5WGKAYDES6P4YK7QF
X-Message-ID-Hash: SLV5MIM5P5DF4FT5WGKAYDES6P4YK7QF
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:11:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLV5MIM5P5DF4FT5WGKAYDES6P4YK7QF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5650 as the codec and the amp, add a new
sound card named mt8186_rt5650.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 44 ++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

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
index 4684bfd89ecd..6dfcfcf47cab 100644
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
@@ -1058,6 +1060,27 @@ mt8186_mt6366_rt1019_rt5682s_routes[] = {
 	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
 };
 
+static const struct snd_soc_dapm_route mt8186_mt6366_rt5650_routes[] = {
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
@@ -1096,6 +1119,21 @@ static struct snd_soc_card mt8186_mt6366_rt5682s_max98360_soc_card = {
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
@@ -1253,6 +1291,10 @@ static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
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

