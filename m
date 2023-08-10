Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3177728A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 10:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C98684D;
	Thu, 10 Aug 2023 10:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C98684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691655251;
	bh=BDVwIjk2/azMdk95krURCtBbcE0miWsH+jVdqpQkNnc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cuz/dCvVwhaogWlXJfg1G1QT7O/jRl9s8hnWlIeWSpz/gQDITvu0ESH4ysePaK1hJ
	 /N1bpesoWYU2niy3EGPB5ahy2DkWtpNsKvJlWGvCrNTwJM6DGCp/88nn9a+j3+iyYS
	 +rVF2MsCbZ9FzuYYg+4X924xwHvirc/NDTq+7Au0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A87F80579; Thu, 10 Aug 2023 10:12:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C7BCF80579;
	Thu, 10 Aug 2023 10:12:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB1DBF800FB; Thu, 10 Aug 2023 10:12:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1B7BF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 10:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B7BF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=Z0zqq1Ba
X-UUID: 8a2283d0375511ee9cb5633481061a41-20230810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LEy2cM8iqgdTUwWNrRY9ne2NFOosBkhxNhWOh9wSVco=;
	b=Z0zqq1Ba0rrEdAHt0rXT+ixUfQJ+LpyOaqXB/Dj+bY797IPENrDWDJ2uav2TumQwPjwEMSM9B0Cg17HZfDHWnTVP5RebbaL9PIzyX+zLbVrHZZhG9vS6xgQ7422GMzw+cv5kSZdSUWRejYVExglDVhsDZsk7JKlepQH5YVKI0vU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:40436190-cfc7-4839-89e2-02eaacc72c81,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:bafd5eee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8a2283d0375511ee9cb5633481061a41-20230810
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 94896436; Thu, 10 Aug 2023 16:11:42 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 10 Aug 2023 16:11:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 10 Aug 2023 16:11:41 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 3/3] ASoC: mediatek: mt8188-mt6359: add SOF support
Date: Thu, 10 Aug 2023 16:11:39 +0800
Message-ID: <20230810081139.27957-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230810081139.27957-1-trevor.wu@mediatek.com>
References: <20230810081139.27957-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: NLFUTQVMPMUKIBNOH6SOGW5QFZ33VTP7
X-Message-ID-Hash: NLFUTQVMPMUKIBNOH6SOGW5QFZ33VTP7
X-MailFrom: trevor.wu@mediatek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLFUTQVMPMUKIBNOH6SOGW5QFZ33VTP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SOF is enabled when adsp phandle is assigned to "mediatek,adsp".
The required callback will be assigned when SOF is enabled.

Additionally, "mediatek,dai-link" is introduced to decide the supported
dai links for a project, so user can reuse the machine driver regardless
of dai link combination.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 218 ++++++++++++++++++++--
 1 file changed, 205 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index e7ac2b6671d3..40d0a7265c19 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -19,6 +19,8 @@
 #include "../../codecs/mt6359.h"
 #include "../common/mtk-afe-platform-driver.h"
 #include "../common/mtk-soundcard-driver.h"
+#include "../common/mtk-dsp-sof-common.h"
+#include "../common/mtk-soc-card.h"
 
 #define CKSYS_AUD_TOP_CFG	0x032c
  #define RG_TEST_ON		BIT(0)
@@ -45,6 +47,11 @@
  */
 #define NAU8825_CODEC_DAI  "nau8825-hifi"
 
+#define SOF_DMA_DL2 "SOF_DMA_DL2"
+#define SOF_DMA_DL3 "SOF_DMA_DL3"
+#define SOF_DMA_UL4 "SOF_DMA_UL4"
+#define SOF_DMA_UL5 "SOF_DMA_UL5"
+
 /* FE */
 SND_SOC_DAILINK_DEFS(playback2,
 		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
@@ -176,6 +183,49 @@ SND_SOC_DAILINK_DEFS(ul_src,
 						   "dmic-hifi")),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL4,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static const struct sof_conn_stream g_sof_conn_streams[] = {
+	{
+		.sof_link = "AFE_SOF_DL2",
+		.sof_dma = SOF_DMA_DL2,
+		.stream_dir = SNDRV_PCM_STREAM_PLAYBACK
+	},
+	{
+		.sof_link = "AFE_SOF_DL3",
+		.sof_dma = SOF_DMA_DL3,
+		.stream_dir = SNDRV_PCM_STREAM_PLAYBACK
+	},
+	{
+		.sof_link = "AFE_SOF_UL4",
+		.sof_dma = SOF_DMA_UL4,
+		.stream_dir = SNDRV_PCM_STREAM_CAPTURE
+	},
+	{
+		.sof_link = "AFE_SOF_UL5",
+		.sof_dma = SOF_DMA_UL5,
+		.stream_dir = SNDRV_PCM_STREAM_CAPTURE
+	},
+};
+
 struct mt8188_mt6359_priv {
 	struct snd_soc_jack dp_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -246,6 +296,10 @@ static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SINK("HDMI"),
 	SND_SOC_DAPM_SINK("DP"),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL4, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL5, SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	/* dynamic pinctrl */
 	SND_SOC_DAPM_PINCTRL("ETDM_SPK_PIN", "aud_etdm_spk_on", "aud_etdm_spk_off"),
@@ -266,6 +320,19 @@ static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 };
 
+static const struct snd_soc_dapm_route mt8188_mt6359_routes[] = {
+	/* SOF Uplink */
+	{SOF_DMA_UL4, NULL, "O034"},
+	{SOF_DMA_UL4, NULL, "O035"},
+	{SOF_DMA_UL5, NULL, "O036"},
+	{SOF_DMA_UL5, NULL, "O037"},
+	/* SOF Downlink */
+	{"I070", NULL, SOF_DMA_DL2},
+	{"I071", NULL, SOF_DMA_DL2},
+	{"I020", NULL, SOF_DMA_DL3},
+	{"I021", NULL, SOF_DMA_DL3},
+};
+
 static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_afe =
@@ -471,8 +538,17 @@ enum {
 	DAI_LINK_ETDM3_OUT_BE,
 	DAI_LINK_PCM1_BE,
 	DAI_LINK_UL_SRC_BE,
+	DAI_LINK_REGULAR_LAST = DAI_LINK_UL_SRC_BE,
+	DAI_LINK_SOF_START,
+	DAI_LINK_SOF_DL2_BE = DAI_LINK_SOF_START,
+	DAI_LINK_SOF_DL3_BE,
+	DAI_LINK_SOF_UL4_BE,
+	DAI_LINK_SOF_UL5_BE,
+	DAI_LINK_SOF_END = DAI_LINK_SOF_UL5_BE,
 };
 
+#define	DAI_LINK_REGULAR_NUM	(DAI_LINK_REGULAR_LAST + 1)
+
 static int mt8188_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
@@ -503,7 +579,8 @@ static int mt8188_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
+	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
@@ -528,7 +605,8 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
+	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
@@ -648,7 +726,8 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(card);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	int ret;
@@ -733,6 +812,33 @@ static int mt8188_nau8825_hw_params(struct snd_pcm_substream *substream,
 static const struct snd_soc_ops mt8188_nau8825_ops = {
 	.hw_params = mt8188_nau8825_hw_params,
 };
+
+static int mt8188_sof_be_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_component *cmpnt_afe = NULL;
+	struct snd_soc_pcm_runtime *runtime;
+
+	/* find afe component */
+	for_each_card_rtds(rtd->card, runtime) {
+		cmpnt_afe = snd_soc_rtdcom_lookup(runtime, AFE_PCM_NAME);
+		if (cmpnt_afe)
+			break;
+	}
+
+	if (cmpnt_afe && !pm_runtime_active(cmpnt_afe->dev)) {
+		dev_err(rtd->dev, "afe pm runtime is not active!!\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8188_sof_be_ops = {
+	.hw_params = mt8188_sof_be_hw_params,
+};
+
 static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	/* FE */
 	[DAI_LINK_DL2_FE] = {
@@ -1003,6 +1109,36 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ul_src),
 	},
+
+	/* SOF BE */
+	[DAI_LINK_SOF_DL2_BE] = {
+		.name = "AFE_SOF_DL2",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8188_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL2),
+	},
+	[DAI_LINK_SOF_DL3_BE] = {
+		.name = "AFE_SOF_DL3",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8188_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL3),
+	},
+	[DAI_LINK_SOF_UL4_BE] = {
+		.name = "AFE_SOF_UL4",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8188_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL4),
+	},
+	[DAI_LINK_SOF_UL5_BE] = {
+		.name = "AFE_SOF_UL5",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8188_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL5),
+	},
 };
 
 static struct snd_kcontrol *ctl_find(struct snd_card *card, const char *name)
@@ -1017,7 +1153,8 @@ static struct snd_kcontrol *ctl_find(struct snd_card *card, const char *name)
 
 static void mt8188_fixup_controls(struct snd_soc_card *card)
 {
-	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(card);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct mt8188_card_data *card_data = (struct mt8188_card_data *)priv->private_data;
 	struct snd_kcontrol *kctl;
 
@@ -1045,6 +1182,8 @@ static struct snd_soc_card mt8188_mt6359_soc_card = {
 	.num_links = ARRAY_SIZE(mt8188_mt6359_dai_links),
 	.dapm_widgets = mt8188_mt6359_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(mt8188_mt6359_widgets),
+	.dapm_routes = mt8188_mt6359_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8188_mt6359_routes),
 	.controls = mt8188_mt6359_controls,
 	.num_controls = ARRAY_SIZE(mt8188_mt6359_controls),
 	.fixup_controls = mt8188_fixup_controls,
@@ -1054,6 +1193,8 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8188_mt6359_soc_card;
 	struct device_node *platform_node;
+	struct device_node *adsp_node;
+	struct mtk_soc_card_data *soc_card_data;
 	struct mt8188_mt6359_priv *priv;
 	struct mt8188_card_data *card_data;
 	struct snd_soc_dai_link *dai_link;
@@ -1074,21 +1215,64 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 	if (!card->name)
 		card->name = card_data->name;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return  -ENOMEM;
-
 	if (of_property_read_bool(pdev->dev.of_node, "audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 		if (ret)
 			return ret;
 	}
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	soc_card_data = devm_kzalloc(&pdev->dev, sizeof(*card_data), GFP_KERNEL);
+	if (!soc_card_data)
+		return -ENOMEM;
+
+	soc_card_data->mach_priv = priv;
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
+		soc_card_data->sof_priv = sof_priv;
+		card->probe = mtk_sof_card_probe;
+		card->late_probe = mtk_sof_card_late_probe;
+		if (!card->topology_shortname_created) {
+			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
+			card->topology_shortname_created = true;
+		}
+		card->name = card->topology_shortname;
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
+		ret = mtk_sof_dailink_parse_of(card, pdev->dev.of_node,
+					       "mediatek,dai-link",
+					       mt8188_mt6359_dai_links,
+					       ARRAY_SIZE(mt8188_mt6359_dai_links));
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "Parse dai-link fail\n");
+			goto err_adsp_node;
+		}
+	} else {
+		if (!adsp_node)
+			card->num_links = DAI_LINK_REGULAR_NUM;
+	}
+
 	platform_node = of_parse_phandle(pdev->dev.of_node,
 					 "mediatek,platform", 0);
 	if (!platform_node) {
-		ret = -EINVAL;
-		return dev_err_probe(&pdev->dev, ret, "Property 'platform' missing or invalid\n");
+		ret = dev_err_probe(&pdev->dev, -EINVAL,
+				    "Property 'platform' missing or invalid\n");
+		goto err_adsp_node;
+
 	}
 
 	ret = parse_dai_link_info(card);
@@ -1096,8 +1280,12 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 		goto err;
 
 	for_each_card_prelinks(card, i, dai_link) {
-		if (!dai_link->platforms->name)
-			dai_link->platforms->of_node = platform_node;
+		if (!dai_link->platforms->name) {
+			if (!strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")) && adsp_node)
+				dai_link->platforms->of_node = adsp_node;
+			else
+				dai_link->platforms->of_node = platform_node;
+		}
 
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
 			if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
@@ -1140,7 +1328,7 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 	}
 
 	priv->private_data = card_data;
-	snd_soc_card_set_drvdata(card, priv);
+	snd_soc_card_set_drvdata(card, soc_card_data);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
@@ -1149,6 +1337,10 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 err:
 	of_node_put(platform_node);
 	clean_card_reference(card);
+
+err_adsp_node:
+	of_node_put(adsp_node);
+
 	return ret;
 }
 
-- 
2.18.0

