Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A64EFEF4
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Apr 2022 07:20:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD2B91866;
	Sat,  2 Apr 2022 07:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD2B91866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648876799;
	bh=kJ2VjU7Y5fNFdZjNrg3wkOGbzkGyyS99OLxIOTskxtY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hfy83A2UMU583ZuirLWIXN6sA5EViENi1g9rektqhm3r9HX1LUpQuQiFfRqi1Gv63
	 UQmZ/rF68xJ845N3I4OSH85cLmqDo0vEeOQ58/4R6CFOS2UohI5GxFsWRKjRfdWZsv
	 HN2QeurcH1wkZHKG1itRJtTEfaxeSP22QSAyS48U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1505EF80518;
	Sat,  2 Apr 2022 07:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 868A0F80517; Sat,  2 Apr 2022 07:18:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E269F802DB
 for <alsa-devel@alsa-project.org>; Sat,  2 Apr 2022 07:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E269F802DB
X-UUID: 6b356b269a73439f8f02d88d62df5c0d-20220402
X-UUID: 6b356b269a73439f8f02d88d62df5c0d-20220402
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1942133482; Sat, 02 Apr 2022 13:18:02 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 2 Apr 2022 13:18:01 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 2 Apr 2022 13:18:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 2 Apr 2022 13:17:59 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <tzungbi@google.com>
Subject: [v8 4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Date: Sat, 2 Apr 2022 13:17:54 +0800
Message-ID: <20220402051754.17513-5-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402051754.17513-1-jiaxin.yu@mediatek.com>
References: <20220402051754.17513-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com, aaronyu@google.com,
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

To support machine that only choose one of the rt5682s and rt5682 as
headset codec, adds new compatible string "mt8192_mt6359_rt1015p_rt5682s".
Meanwhile, using macros to simplifies card name and compatible name.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 63 ++++++++++++-------
 2 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index d515613a79da..cacfbab4262d 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -176,6 +176,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	help
 	  This adds ASoC driver for Mediatek MT8192 boards
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index fd140df0fd23..780ba7106d9f 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -28,6 +28,14 @@
 #define RT1015_DEV0_NAME	"rt1015.1-0028"
 #define RT1015_DEV1_NAME	"rt1015.1-0029"
 
+#define RT1015_RT5682_CARD_NAME "mt8192_mt6359_rt1015_rt5682"
+#define RT1015P_RT5682_CARD_NAME "mt8192_mt6359_rt1015p_rt5682"
+#define RT1015P_RT5682S_CARD_NAME "mt8192_mt6359_rt1015p_rt5682s"
+
+#define RT1015_RT5682_OF_NAME "mediatek,mt8192_mt6359_rt1015_rt5682"
+#define RT1015P_RT5682_OF_NAME "mediatek,mt8192_mt6359_rt1015p_rt5682"
+#define RT1015P_RT5682S_OF_NAME "mediatek,mt8192_mt6359_rt1015p_rt5682s"
+
 struct mt8192_mt6359_priv {
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -68,8 +76,8 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
-static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
-				       struct snd_pcm_hw_params *params)
+static int mt8192_rt5682x_i2s_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
@@ -118,8 +126,8 @@ static const struct snd_soc_ops mt8192_rt1015_i2s_ops = {
 	.hw_params = mt8192_rt1015_i2s_hw_params,
 };
 
-static const struct snd_soc_ops mt8192_rt5682_i2s_ops = {
-	.hw_params = mt8192_rt5682_i2s_hw_params,
+static const struct snd_soc_ops mt8192_rt5682x_i2s_ops = {
+	.hw_params = mt8192_rt5682x_i2s_hw_params,
 };
 
 static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
@@ -950,7 +958,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.init = mt8192_rt5682_init,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s8),
-		.ops = &mt8192_rt5682_i2s_ops,
+		.ops = &mt8192_rt5682x_i2s_ops,
 	},
 	{
 		.name = "I2S9",
@@ -959,7 +967,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s9),
-		.ops = &mt8192_rt5682_i2s_ops,
+		.ops = &mt8192_rt5682x_i2s_ops,
 	},
 	{
 		.name = "CONNSYS_I2S",
@@ -1039,7 +1047,7 @@ static struct snd_soc_codec_conf rt1015_amp_conf[] = {
 };
 
 static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
-	.name = "mt8192_mt6359_rt1015_rt5682",
+	.name = RT1015_RT5682_CARD_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
@@ -1053,14 +1061,13 @@ static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
 	.num_configs = ARRAY_SIZE(rt1015_amp_conf),
 };
 
-static const struct snd_soc_dapm_widget
-mt8192_mt6359_rt1015p_rt5682_widgets[] = {
+static const struct snd_soc_dapm_widget mt8192_mt6359_rt1015p_rt5682x_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
-static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682_routes[] = {
+static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682x_routes[] = {
 	/* speaker */
 	{ "Speakers", NULL, "Speaker" },
 	/* headset */
@@ -1069,23 +1076,22 @@ static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682_routes[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682_controls[] = {
+static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682x_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
-static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
-	.name = "mt8192_mt6359_rt1015p_rt5682",
+static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682x_card = {
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
-	.controls = mt8192_mt6359_rt1015p_rt5682_controls,
-	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_controls),
-	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_widgets),
-	.dapm_routes = mt8192_mt6359_rt1015p_rt5682_routes,
-	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
+	.controls = mt8192_mt6359_rt1015p_rt5682x_controls,
+	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_controls),
+	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682x_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_widgets),
+	.dapm_routes = mt8192_mt6359_rt1015p_rt5682x_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_routes),
 };
 
 static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
@@ -1119,9 +1125,16 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	card->dev = &pdev->dev;
 
+	if (of_device_is_compatible(pdev->dev.of_node, RT1015P_RT5682_OF_NAME))
+		card->name = RT1015P_RT5682_CARD_NAME;
+	else if (of_device_is_compatible(pdev->dev.of_node, RT1015P_RT5682S_OF_NAME))
+		card->name = RT1015P_RT5682S_CARD_NAME;
+	else
+		dev_dbg(&pdev->dev, "No need to set card name\n");
+
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
 	if (!hdmi_codec)
-		dev_info(&pdev->dev, "The machine don't have hdmi-codec\n");
+		dev_dbg(&pdev->dev, "The machine don't have hdmi-codec\n");
 
 	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
 	if (!platform_node) {
@@ -1209,12 +1222,16 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id mt8192_mt6359_dt_match[] = {
 	{
-		.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",
+		.compatible = RT1015_RT5682_OF_NAME,
 		.data = &mt8192_mt6359_rt1015_rt5682_card,
 	},
 	{
-		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682",
-		.data = &mt8192_mt6359_rt1015p_rt5682_card,
+		.compatible = RT1015P_RT5682_OF_NAME,
+		.data = &mt8192_mt6359_rt1015p_rt5682x_card,
+	},
+	{
+		.compatible = RT1015P_RT5682S_OF_NAME,
+		.data = &mt8192_mt6359_rt1015p_rt5682x_card,
 	},
 	{}
 };
-- 
2.18.0

