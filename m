Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF944DAA47
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 07:03:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A78F174C;
	Wed, 16 Mar 2022 07:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A78F174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647410632;
	bh=ug7s8KJMotPVml0kMahcgY+Zjv9KJaxZG1l1E3VVj2A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJraXtYuMWAV8kufA/9rfICutN8o8w7scgSOq4id0fmVXixxANreJGqgP8GFEsTni
	 IwIWOEpuYvo24k51XHfl2LPbdwOLiJoL05YWg8yejd42mAUSJrGXc20evlOSDMchkZ
	 n5YUmg3UU0zT0UW0blawGWxsAmA/ol0/8ED3Rkbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D23FF8051A;
	Wed, 16 Mar 2022 07:02:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3AE3F80518; Wed, 16 Mar 2022 07:02:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3BD5F80084
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 07:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3BD5F80084
X-UUID: 797887090a084424afae197deaac6a69-20220316
X-UUID: 797887090a084424afae197deaac6a69-20220316
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 418308825; Wed, 16 Mar 2022 14:01:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Mar 2022 14:01:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 14:01:46 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 4/5] ASoC: mediatek: mt8195: add machine support for
 max98390 and rt5682
Date: Wed, 16 Mar 2022 14:01:38 +0800
Message-ID: <20220316060139.6211-5-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220316060139.6211-1-trevor.wu@mediatek.com>
References: <20220316060139.6211-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

This patch adds support for mt8195 board with mt6359, max98390 and
rt5682.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                |  1 +
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 72 +++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 16204a135c4d..2a38e01da4ba 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -207,6 +207,7 @@ config SND_SOC_MT8195_MT6359
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_RT5682S
+	select SND_SOC_MAX98390
 	select SND_SOC_DMIC
 	select SND_SOC_HDMI_CODEC
 	help
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 5ad6363e1bc9..506eb60585c2 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -44,6 +44,11 @@ struct sof_conn_stream {
 
 #define RT1011_SPEAKER_AMP_PRESENT		BIT(0)
 #define RT1019_SPEAKER_AMP_PRESENT		BIT(1)
+#define MAX98390_SPEAKER_AMP_PRESENT		BIT(2)
+
+#define MAX98390_CODEC_DAI	"max98390-aif1"
+#define MAX98390_DEV0_NAME	"max98390.2-0038" /* right */
+#define MAX98390_DEV1_NAME	"max98390.2-0039" /* left */
 
 #define RT1011_CODEC_DAI	"rt1011-aif"
 #define RT1011_DEV0_NAME	"rt1011.2-0038"
@@ -121,6 +126,11 @@ static const struct snd_soc_dapm_route mt8195_rt1019_routes[] = {
 	{ "Ext Spk", NULL, "Speaker" },
 };
 
+static const struct snd_soc_dapm_route mt8195_max98390_routes[] = {
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
+};
+
 #define CKSYS_AUD_TOP_CFG 0x032c
 #define CKSYS_AUD_TOP_MON 0x0330
 
@@ -668,6 +678,35 @@ static int mt8195_rt1019_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+static int mt8195_max98390_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, mt8195_dual_speaker_widgets,
+					ARRAY_SIZE(mt8195_dual_speaker_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, mt8195_dual_speaker_controls,
+					ARRAY_SIZE(mt8195_dual_speaker_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_max98390_routes,
+				      ARRAY_SIZE(mt8195_max98390_routes));
+
+	if (ret)
+		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
+
+	return ret;
+}
+
 static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 {
@@ -929,6 +968,12 @@ SND_SOC_DAILINK_DEF(rt1011_comps,
 				       COMP_CODEC(RT1011_DEV1_NAME,
 						  RT1011_CODEC_DAI)));
 
+SND_SOC_DAILINK_DEF(max98390_comps,
+		    DAILINK_COMP_ARRAY(COMP_CODEC(MAX98390_DEV0_NAME,
+						  MAX98390_CODEC_DAI),
+				       COMP_CODEC(MAX98390_DEV1_NAME,
+						  MAX98390_CODEC_DAI)));
+
 static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 	/* FE */
 	[DAI_LINK_DL2_FE] = {
@@ -1246,6 +1291,17 @@ static struct snd_soc_codec_conf rt1011_codec_conf[] = {
 	},
 };
 
+static struct snd_soc_codec_conf max98390_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX98390_DEV0_NAME),
+		.name_prefix = "Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX98390_DEV1_NAME),
+		.name_prefix = "Left",
+	},
+};
+
 static const struct sof_conn_stream g_sof_conn_streams[] = {
 	{ "ETDM2_OUT_BE", "AFE_SOF_DL2", SOF_DMA_DL2, SNDRV_PCM_STREAM_PLAYBACK},
 	{ "ETDM1_OUT_BE", "AFE_SOF_DL3", SOF_DMA_DL3, SNDRV_PCM_STREAM_PLAYBACK},
@@ -1554,6 +1610,13 @@ static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
 				dai_link->num_codecs = ARRAY_SIZE(rt1019_comps);
 				dai_link->init = mt8195_rt1019_init;
 				break;
+			case MAX98390_SPEAKER_AMP_PRESENT:
+				dai_link->codecs = max98390_comps;
+				dai_link->num_codecs = ARRAY_SIZE(max98390_comps);
+				dai_link->init = mt8195_max98390_init;
+				card->codec_conf = max98390_codec_conf;
+				card->num_configs = ARRAY_SIZE(max98390_codec_conf);
+				break;
 			default:
 				break;
 			}
@@ -1584,6 +1647,11 @@ static struct mt8195_card_data mt8195_mt6359_rt1011_rt5682_card = {
 	.quirk = RT1011_SPEAKER_AMP_PRESENT,
 };
 
+static struct mt8195_card_data mt8195_mt6359_max98390_rt5682_card = {
+	.name = "mt8195_m98390_r5682",
+	.quirk = MAX98390_SPEAKER_AMP_PRESENT,
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id mt8195_mt6359_dt_match[] = {
 	{
@@ -1594,6 +1662,10 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 		.compatible = "mediatek,mt8195_mt6359_rt1011_rt5682",
 		.data = &mt8195_mt6359_rt1011_rt5682_card,
 	},
+	{
+		.compatible = "mediatek,mt8195_mt6359_max98390_rt5682",
+		.data = &mt8195_mt6359_max98390_rt5682_card,
+	},
 };
 #endif
 
-- 
2.18.0

