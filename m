Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980541A905
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 08:37:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED2F16A4;
	Tue, 28 Sep 2021 08:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED2F16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632811020;
	bh=WKHYA2PmwBeaez5ZiD1t6dG17l/42p/41j52OyHmM0I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jK/ELLRiLgQNpXLEkfUCMxzCp7syP39bRXZ46m89fPskII8J4f9aOGsYgY1pc7OE4
	 e3B9m6pYrPAtG3avKj7fhpBkmTIOT05bmaXAgODGKKVlS1pTxpb9M+opAjShN4DCsI
	 H5In3+ngqnv26Qi6FA0ROp4wpK04AkPeAWxDZtGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1904BF800DE;
	Tue, 28 Sep 2021 08:35:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3F5DF800DE; Tue, 28 Sep 2021 08:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B75F800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 08:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B75F800DE
X-UUID: 3e7385b025ac48c2bcc2c3cc11792b34-20210928
X-UUID: 3e7385b025ac48c2bcc2c3cc11792b34-20210928
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 407077680; Tue, 28 Sep 2021 14:35:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 28 Sep 2021 14:35:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Sep 2021 14:35:21 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: add missing of_node_put in probe
Date: Tue, 28 Sep 2021 14:35:20 +0800
Message-ID: <20210928063520.23927-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 linux-kernel@vger.kernel.org, cuibixuan@huawei.com, trevor.wu@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

dp node and hdmi node are retrieved from of_parse_phandle(), so using
of_node_put() on them before return.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index a3fa8efc8f81..cb15467e5fc5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -995,6 +995,8 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
 	struct device_node *platform_node;
+	struct device_node *dp_node;
+	struct device_node *hdmi_node;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1019_rt5682_priv *priv = NULL;
 	int ret, i;
@@ -1013,12 +1015,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 			dai_link->platforms->of_node = platform_node;
 
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
-			dai_link->codecs->of_node =
-				of_parse_phandle(pdev->dev.of_node,
-						 "mediatek,dptx-codec", 0);
-			if (!dai_link->codecs->of_node) {
+			dp_node = of_parse_phandle(pdev->dev.of_node,
+						   "mediatek,dptx-codec", 0);
+			if (!dp_node) {
 				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
 			} else {
+				dai_link->codecs->of_node = dp_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
@@ -1026,12 +1028,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 		}
 
 		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
-			dai_link->codecs->of_node =
-				of_parse_phandle(pdev->dev.of_node,
-						 "mediatek,hdmi-codec", 0);
-			if (!dai_link->codecs->of_node) {
+			hdmi_node = of_parse_phandle(pdev->dev.of_node,
+						     "mediatek,hdmi-codec", 0);
+			if (!hdmi_node) {
 				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
 			} else {
+				dai_link->codecs->of_node = hdmi_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
@@ -1041,8 +1043,8 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
-		of_node_put(platform_node);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out;
 	}
 
 	snd_soc_card_set_drvdata(card, priv);
@@ -1052,6 +1054,9 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 
+out:
+	of_node_put(hdmi_node);
+	of_node_put(dp_node);
 	of_node_put(platform_node);
 	return ret;
 }
-- 
2.18.0

