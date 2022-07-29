Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47A584DF1
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 11:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B8711684;
	Fri, 29 Jul 2022 11:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B8711684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659086173;
	bh=Qq0dv8CsuHVZfbKI/jp4fAweBwazdqhtwLflK9cEYmo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DfdhglvMvGCm+AZIoE2U/3Tx3z8oISuA4qF0va5ze5giDmh7ByyFVssZVjX85TJqs
	 lm7ijq/3ZpN7IHzGX6o5Hf/iu4EElFP5BehC/QDuQVH3KLEByjbib7xwRvJlcPs9ap
	 BdaGVGK41/xvE3PkXzSgpEJM2Ba81dW0A9uC1FvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 043C7F80544;
	Fri, 29 Jul 2022 11:14:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B15DDF80544; Fri, 29 Jul 2022 11:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=NO_DNS_FOR_FROM,RDNS_NONE,
 SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C782F8049C
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 11:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C782F8049C
X-UUID: 3f6a7baa60eb4bc78cbfc250fb56e66c-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:5a7b5be1-1c31-42d0-ab21-af7d66c52c8d, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:37f8becf-a6cf-4fb6-be1b-c60094821ca2,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 3f6a7baa60eb4bc78cbfc250fb56e66c-20220729
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1033397230; Fri, 29 Jul 2022 17:14:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 17:14:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Fri, 29 Jul 2022 17:14:15 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8186: add SOF support on
 mt8186-mt6366-da7219-max98357
Date: Fri, 29 Jul 2022 17:14:04 +0800
Message-ID: <20220729091404.7799-4-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729091404.7799-1-chunxu.li@mediatek.com>
References: <20220729091404.7799-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 project_global_chrome_upstream_group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

1. Add widgets, routes and dai-links required by SOF

2. Only when adsp phandle could be retrieved from DTS, the SOF related part
of machine driver is executed.

3. Support dai-links could be specified from DTS, so that
we can disable AP side hardware controls when DSP SOF controls the same
audio FE.

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 168 ++++++++++++++++--
 1 file changed, 155 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index 387f25cad809..84ee5d95a9f0 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -18,6 +18,8 @@
 #include "../../codecs/da7219.h"
 #include "../../codecs/mt6358.h"
 #include "../common/mtk-afe-platform-driver.h"
+#include "../common/mtk-dsp-sof-common.h"
+#include "../common/mtk-soc-card.h"
 #include "mt8186-afe-common.h"
 #include "mt8186-afe-clk.h"
 #include "mt8186-afe-gpio.h"
@@ -26,6 +28,11 @@
 #define DA7219_CODEC_DAI "da7219-hifi"
 #define DA7219_DEV_NAME "da7219.5-001a"
 
+#define SOF_DMA_DL1 "SOF_DMA_DL1"
+#define SOF_DMA_DL2 "SOF_DMA_DL2"
+#define SOF_DMA_UL1 "SOF_DMA_UL1"
+#define SOF_DMA_UL2 "SOF_DMA_UL2"
+
 struct mt8186_mt6366_da7219_max98357_priv {
 	struct snd_soc_jack headset_jack, hdmi_jack;
 };
@@ -47,8 +54,9 @@ static struct snd_soc_codec_conf mt8186_mt6366_da7219_max98357_codec_conf[] = {
 
 static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct mt8186_mt6366_da7219_max98357_priv *priv =
+	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
+	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
@@ -154,8 +162,9 @@ static int mt8186_mt6366_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *r
 {
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
-	struct mt8186_mt6366_da7219_max98357_priv *priv =
+	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
+	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
 	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, &priv->hdmi_jack);
@@ -201,6 +210,24 @@ static int mt8186_anx7625_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return mt8186_hw_params_fixup(rtd, params, SNDRV_PCM_FORMAT_S24_LE);
 }
 
+/* fixup the BE DAI link to match any values from topology */
+static int mt8186_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
+				     struct snd_pcm_hw_params *params)
+{
+	int ret;
+
+	ret = mtk_sof_dai_link_fixup(rtd, params);
+
+	if (!strcmp(rtd->dai_link->name, "I2S0") ||
+	    !strcmp(rtd->dai_link->name, "I2S1") ||
+	    !strcmp(rtd->dai_link->name, "I2S2"))
+		mt8186_i2s_hw_params_fixup(rtd, params);
+	else if (!strcmp(rtd->dai_link->name, "I2S3"))
+		mt8186_anx7625_i2s_hw_params_fixup(rtd, params);
+
+	return ret;
+}
+
 static int mt8186_mt6366_da7219_max98357_playback_startup(struct snd_pcm_substream *substream)
 {
 	static const unsigned int rates[] = {
@@ -474,6 +501,33 @@ SND_SOC_DAILINK_DEFS(hostless_src_aaudio,
 		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless SRC AAudio DAI")),
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static const struct sof_conn_stream g_sof_conn_streams[] = {
+	{ "I2S1", "AFE_SOF_DL1", SOF_DMA_DL1, SNDRV_PCM_STREAM_PLAYBACK},
+	{ "I2S3", "AFE_SOF_DL2", SOF_DMA_DL2, SNDRV_PCM_STREAM_PLAYBACK},
+	{ "Primary Codec", "AFE_SOF_UL1", SOF_DMA_UL1, SNDRV_PCM_STREAM_CAPTURE},
+	{ "I2S0", "AFE_SOF_UL2", SOF_DMA_UL2, SNDRV_PCM_STREAM_CAPTURE},
+};
+
 static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	/* Front End DAI links */
 	{
@@ -848,12 +902,41 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_ul6),
 	},
+	/* SOF BE */
+	{
+		.name = "AFE_SOF_DL1",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL1),
+	},
+	{
+		.name = "AFE_SOF_DL2",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL2),
+	},
+	{
+		.name = "AFE_SOF_UL1",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL1),
+	},
+	{
+		.name = "AFE_SOF_UL2",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL2),
+	},
 };
 
 static const struct snd_soc_dapm_widget
 mt8186_mt6366_da7219_max98357_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_OUTPUT("HDMI1"),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL1, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_route
@@ -862,6 +945,14 @@ mt8186_mt6366_da7219_max98357_routes[] = {
 	{ "Speakers", NULL, "Speaker"},
 	/* HDMI */
 	{ "HDMI1", NULL, "TX"},
+	/* SOF Uplink */
+	{SOF_DMA_UL1, NULL, "UL1_CH1"},
+	{SOF_DMA_UL1, NULL, "UL1_CH2"},
+	{SOF_DMA_UL2, NULL, "UL2_CH1"},
+	{SOF_DMA_UL2, NULL, "UL2_CH2"},
+	/* SOF Downlink */
+	{"DSP_DL1_VIRT", NULL, SOF_DMA_DL1},
+	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
 };
 
 static const struct snd_kcontrol_new
@@ -889,8 +980,10 @@ static int mt8186_mt6366_da7219_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
 	struct snd_soc_dai_link *dai_link;
-	struct mt8186_mt6366_da7219_max98357_priv *priv;
-	struct device_node *platform_node, *headset_codec, *playback_codec;
+	struct mtk_soc_card_data *soc_card_data;
+	struct mt8186_mt6366_da7219_max98357_priv *mach_priv;
+	struct device_node *platform_node, *headset_codec, *playback_codec, *adsp_node;
+	int sof_on = 0;
 	int ret, i;
 
 	card = (struct snd_soc_card *)device_get_match_data(&pdev->dev);
@@ -898,11 +991,60 @@ static int mt8186_mt6366_da7219_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	card->dev = &pdev->dev;
 
+	soc_card_data = devm_kzalloc(&pdev->dev, sizeof(*soc_card_data), GFP_KERNEL);
+	if (!soc_card_data)
+		return -ENOMEM;
+	mach_priv = devm_kzalloc(&pdev->dev, sizeof(*mach_priv), GFP_KERNEL);
+	if (!mach_priv)
+		return -ENOMEM;
+
+	soc_card_data->mach_priv = mach_priv;
+
+	adsp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,adsp", 0);
+	if (adsp_node) {
+		struct mtk_sof_priv *sof_priv;
+
+		sof_priv = devm_kzalloc(&pdev->dev, sizeof(*sof_priv), GFP_KERNEL);
+		if (!sof_priv) {
+			ret = -ENOMEM;
+			goto err_adsp_node;
+		}
+		sof_priv->conn_streams = g_sof_conn_streams;
+		sof_priv->num_streams = ARRAY_SIZE(g_sof_conn_streams);
+		sof_priv->sof_dai_link_fixup = mt8186_sof_dai_link_fixup;
+		soc_card_data->sof_priv = sof_priv;
+		card->probe = mtk_sof_card_probe;
+		card->late_probe = mtk_sof_card_late_probe;
+		if (!card->topology_shortname_created) {
+			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
+			card->topology_shortname_created = true;
+		}
+		card->name = card->topology_shortname;
+		sof_on = 1;
+	} else {
+		dev_info(&pdev->dev, "Probe without adsp\n");
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
+		ret = mtk_sof_dailink_parse_of(card, pdev->dev.of_node,
+					       "mediatek,dai-link",
+					       mt8186_mt6366_da7219_max98357_dai_links,
+					       ARRAY_SIZE(mt8186_mt6366_da7219_max98357_dai_links));
+		if (ret) {
+			dev_dbg(&pdev->dev, "Parse dai-link fail\n");
+			goto err_adsp_node;
+		}
+	} else {
+		if (!sof_on)
+			card->num_links = ARRAY_SIZE(mt8186_mt6366_da7219_max98357_dai_links)
+					- ARRAY_SIZE(g_sof_conn_streams);
+	}
+
 	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
 	if (!platform_node) {
 		ret = -EINVAL;
 		dev_err_probe(&pdev->dev, ret, "Property 'platform' missing or invalid\n");
-		return ret;
+		goto err_platform_node;
 	}
 
 	playback_codec = of_get_child_by_name(pdev->dev.of_node, "playback-codecs");
@@ -941,17 +1083,14 @@ static int mt8186_mt6366_da7219_max98357_dev_probe(struct platform_device *pdev)
 			goto err_probe;
 		}
 
-		if (!dai_link->platforms->name)
-			dai_link->platforms->of_node = platform_node;
-	}
+		if (!strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")) && sof_on)
+			dai_link->platforms->of_node = adsp_node;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto err_probe;
+		if (!dai_link->platforms->name && !dai_link->platforms->of_node)
+			dai_link->platforms->of_node = platform_node;
 	}
 
-	snd_soc_card_set_drvdata(card, priv);
+	snd_soc_card_set_drvdata(card, soc_card_data);
 
 	ret = mt8186_afe_gpio_init(&pdev->dev);
 	if (ret) {
@@ -969,6 +1108,9 @@ static int mt8186_mt6366_da7219_max98357_dev_probe(struct platform_device *pdev)
 	of_node_put(playback_codec);
 err_playback_codec:
 	of_node_put(platform_node);
+err_platform_node:
+err_adsp_node:
+	of_node_put(adsp_node);
 
 	return ret;
 }
-- 
2.18.0

