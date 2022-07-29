Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E988584E84
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 12:06:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D1C2167C;
	Fri, 29 Jul 2022 12:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D1C2167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659089216;
	bh=5Z7/lPprLG9H/5eFqaofOr1785aeS38XpPGUXooiIgI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXwui/c/IjKpleGMcOKt3F0j64QpDdKV15XIrCX/VyV64GKyNjxp5WJC9y9ZOXf7S
	 fh0hRVXQHtBubX1iiUzRKPMPEIZNkLiMOSkljLBV/dRB69/ho3ZglB0ByNVfJmAudq
	 1Kso65SsoHfJ6ecPk+Q2Vpc3PDyYrQxz0wOcparA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB523F80507;
	Fri, 29 Jul 2022 12:05:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFA7EF8049C; Fri, 29 Jul 2022 12:05:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE, T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A1BBF80430
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 12:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A1BBF80430
X-UUID: 41362e145cef41d0bd3fb14a0cc4419f-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:c28dbf4f-a38f-4bd2-ba0d-5121ab3cfeb9, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:15f6b924-a982-4824-82d2-9da3b6056c2a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 41362e145cef41d0bd3fb14a0cc4419f-20220729
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 546010780; Fri, 29 Jul 2022 18:05:00 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with ShadowRedundancy id 15.2.792.3; 
 Fri, 29 Jul 2022 10:03:29 +0000
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 17:14:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Fri, 29 Jul 2022 17:14:14 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt8186: add SOF support on
 mt8186-mt6366-rt1019-rt5682s
Date: Fri, 29 Jul 2022 17:14:03 +0800
Message-ID: <20220729091404.7799-3-chunxu.li@mediatek.com>
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
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 168 ++++++++++++++++--
 1 file changed, 155 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 891146fd6c2b..6c41706a5621 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -19,6 +19,8 @@
 #include "../../codecs/mt6358.h"
 #include "../../codecs/rt5682.h"
 #include "../common/mtk-afe-platform-driver.h"
+#include "../common/mtk-dsp-sof-common.h"
+#include "../common/mtk-soc-card.h"
 #include "mt8186-afe-common.h"
 #include "mt8186-afe-clk.h"
 #include "mt8186-afe-gpio.h"
@@ -30,6 +32,11 @@
 #define RT5682S_CODEC_DAI	"rt5682s-aif1"
 #define RT5682S_DEV0_NAME	"rt5682s.5-001a"
 
+#define SOF_DMA_DL1 "SOF_DMA_DL1"
+#define SOF_DMA_DL2 "SOF_DMA_DL2"
+#define SOF_DMA_UL1 "SOF_DMA_UL1"
+#define SOF_DMA_UL2 "SOF_DMA_UL2"
+
 struct mt8186_mt6366_rt1019_rt5682s_priv {
 	struct snd_soc_jack headset_jack, hdmi_jack;
 };
@@ -51,8 +58,9 @@ static struct snd_soc_codec_conf mt8186_mt6366_rt1019_rt5682s_codec_conf[] = {
 
 static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct mt8186_mt6366_rt1019_rt5682s_priv *priv =
+	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
+	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
@@ -130,8 +138,9 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 {
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
-	struct mt8186_mt6366_rt1019_rt5682s_priv *priv =
+	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
+	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, &priv->hdmi_jack);
@@ -177,6 +186,24 @@ static int mt8186_it6505_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return mt8186_hw_params_fixup(rtd, params, SNDRV_PCM_FORMAT_S32_LE);
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
+		mt8186_it6505_i2s_hw_params_fixup(rtd, params);
+
+	return ret;
+}
+
 static int mt8186_mt6366_rt1019_rt5682s_playback_startup(struct snd_pcm_substream *substream)
 {
 	static const unsigned int rates[] = {
@@ -450,6 +477,33 @@ SND_SOC_DAILINK_DEFS(hostless_src_aaudio,
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
 static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	/* Front End DAI links */
 	{
@@ -824,12 +878,41 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
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
 mt8186_mt6366_rt1019_rt5682s_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_OUTPUT("HDMI1"),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL1, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_route
@@ -838,6 +921,14 @@ mt8186_mt6366_rt1019_rt5682s_routes[] = {
 	{ "Speakers", NULL, "Speaker" },
 	/* HDMI */
 	{ "HDMI1", NULL, "TX" },
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
@@ -865,8 +956,10 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
 	struct snd_soc_dai_link *dai_link;
-	struct mt8186_mt6366_rt1019_rt5682s_priv *priv;
-	struct device_node *platform_node, *headset_codec, *playback_codec;
+	struct mtk_soc_card_data *soc_card_data;
+	struct mt8186_mt6366_rt1019_rt5682s_priv *mach_priv;
+	struct device_node *platform_node, *headset_codec, *playback_codec, *adsp_node;
+	int sof_on = 0;
 	int ret, i;
 
 	card = (struct snd_soc_card *)device_get_match_data(&pdev->dev);
@@ -874,11 +967,60 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
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
+					       mt8186_mt6366_rt1019_rt5682s_dai_links,
+					       ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links));
+		if (ret) {
+			dev_dbg(&pdev->dev, "Parse dai-link fail\n");
+			goto err_adsp_node;
+		}
+	} else {
+		if (!sof_on)
+			card->num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links)
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
@@ -917,17 +1059,14 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
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
@@ -945,6 +1084,9 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
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

