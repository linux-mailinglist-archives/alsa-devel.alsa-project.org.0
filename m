Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F64EFEF5
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Apr 2022 07:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C6B6189A;
	Sat,  2 Apr 2022 07:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C6B6189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648876828;
	bh=p01a1sBa+kWSumJO0/TeY1CzhALZAkUnPZPtE/RJzHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCkuAXPCf+CHmnzGSFnVV9yCTJg3ZkGuzab7iD/FdGabIiVxh7GVfdFT5A61UmuHA
	 h5xhlBXperH4F+wrS66dmQj2S4r+pBCRnvN6IEQfUyimPL+6HbqThU55nYmDetSPsn
	 L7XiJHrNsVNyY69yJJbLRVY8ZuGDoozn/L/3xrOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 551A0F80526;
	Sat,  2 Apr 2022 07:18:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB1FEF80524; Sat,  2 Apr 2022 07:18:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29E42F80310
 for <alsa-devel@alsa-project.org>; Sat,  2 Apr 2022 07:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E42F80310
X-UUID: 1af5afca3e214f37bdd073005fdeef80-20220402
X-UUID: 1af5afca3e214f37bdd073005fdeef80-20220402
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 384783067; Sat, 02 Apr 2022 13:18:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 2 Apr 2022 13:17:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 2 Apr 2022 13:17:58 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <tzungbi@google.com>
Subject: [v8 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of speaker
Date: Sat, 2 Apr 2022 13:17:52 +0800
Message-ID: <20220402051754.17513-3-jiaxin.yu@mediatek.com>
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
 matthias.bgg@gmail.com, aaronyu@google.com,
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

MT8192 platform will use rt1015 or rt105p codec, so through the
snd_soc_of_get_dai_link_codecs() to complete the configuration
of dai_link's codecs.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 108 +++++++++---------
 1 file changed, 57 insertions(+), 51 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index ee91569c0911..a0b305c45ac8 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -604,17 +604,9 @@ SND_SOC_DAILINK_DEFS(i2s2,
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-SND_SOC_DAILINK_DEFS(i2s3_rt1015,
+SND_SOC_DAILINK_DEFS(i2s3,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME,
-						   RT1015_CODEC_DAI),
-					COMP_CODEC(RT1015_DEV1_NAME,
-						   RT1015_CODEC_DAI)),
-		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
-		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC("rt1015p", "HiFi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(i2s5,
@@ -929,6 +921,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s3),
 	},
 	{
 		.name = "I2S5",
@@ -1100,55 +1093,61 @@ static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
 	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
 };
 
+static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
+					  struct snd_soc_dai_link *link,
+					  struct device_node *node,
+					  char *link_name)
+{
+	int ret;
+
+	if (node && strcmp(link->name, link_name) == 0) {
+		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
+		if (ret < 0) {
+			dev_err_probe(card->dev, ret, "get dai link codecs fail\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node, *hdmi_codec;
+	struct device_node *platform_node, *hdmi_codec, *speaker_codec;
 	int ret, i;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8192_mt6359_priv *priv;
 
-	platform_node = of_parse_phandle(pdev->dev.of_node,
-					 "mediatek,platform", 0);
-	if (!platform_node) {
-		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
+	if (!card)
 		return -EINVAL;
-	}
+	card->dev = &pdev->dev;
 
-	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card) {
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
+	if (!hdmi_codec)
+		dev_info(&pdev->dev, "The machine don't have hdmi-codec\n");
+
+	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
+	if (!platform_node) {
 		ret = -EINVAL;
-		goto put_platform_node;
+		dev_err_probe(&pdev->dev, ret, "Property 'platform' missing or invalid\n");
+		goto err_platform_node;
 	}
-	card->dev = &pdev->dev;
 
-	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
-				      "mediatek,hdmi-codec", 0);
+	speaker_codec = of_get_child_by_name(pdev->dev.of_node, "speaker-codecs");
+	if (!speaker_codec) {
+		ret = -EINVAL;
+		dev_err_probe(&pdev->dev, ret, "Property 'speaker-codecs' missing or invalid\n");
+		goto err_speaker_codec;
+	}
 
 	for_each_card_prelinks(card, i, dai_link) {
-		if (strcmp(dai_link->name, "I2S3") == 0) {
-			if (card == &mt8192_mt6359_rt1015_rt5682_card) {
-				dai_link->ops = &mt8192_rt1015_i2s_ops;
-				dai_link->cpus = i2s3_rt1015_cpus;
-				dai_link->num_cpus =
-					ARRAY_SIZE(i2s3_rt1015_cpus);
-				dai_link->codecs = i2s3_rt1015_codecs;
-				dai_link->num_codecs =
-					ARRAY_SIZE(i2s3_rt1015_codecs);
-				dai_link->platforms = i2s3_rt1015_platforms;
-				dai_link->num_platforms =
-					ARRAY_SIZE(i2s3_rt1015_platforms);
-			} else if (card == &mt8192_mt6359_rt1015p_rt5682_card) {
-				dai_link->cpus = i2s3_rt1015p_cpus;
-				dai_link->num_cpus =
-					ARRAY_SIZE(i2s3_rt1015p_cpus);
-				dai_link->codecs = i2s3_rt1015p_codecs;
-				dai_link->num_codecs =
-					ARRAY_SIZE(i2s3_rt1015p_codecs);
-				dai_link->platforms = i2s3_rt1015p_platforms;
-				dai_link->num_platforms =
-					ARRAY_SIZE(i2s3_rt1015p_platforms);
-			}
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
 		}
 
 		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
@@ -1156,6 +1155,9 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 			dai_link->ignore = 0;
 		}
 
+		if (strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
+			dai_link->ops = &mt8192_rt1015_i2s_ops;
+
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
 	}
@@ -1163,22 +1165,26 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-		goto put_hdmi_codec;
+		goto err_probe;
 	}
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = mt8192_afe_gpio_init(&pdev->dev);
 	if (ret) {
-		dev_err(&pdev->dev, "init gpio error %d\n", ret);
-		goto put_hdmi_codec;
+		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
+		goto err_probe;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
 
-put_hdmi_codec:
-	of_node_put(hdmi_codec);
-put_platform_node:
+err_probe:
+	of_node_put(speaker_codec);
+err_speaker_codec:
 	of_node_put(platform_node);
+err_platform_node:
+	of_node_put(hdmi_codec);
 	return ret;
 }
 
-- 
2.18.0

