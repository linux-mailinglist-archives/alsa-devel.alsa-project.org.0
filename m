Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF6A4F5A70
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 12:07:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8506C1705;
	Wed,  6 Apr 2022 12:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8506C1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649239649;
	bh=RNe0PI9mOcC7W8yN6kVryINB68dJf9Ho3kNAxuM5yxA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2ibm1VHIJmmLvuJit2FSReA5nXdR3S7DiQ+HrgK4agWWyrt8qT5ETAYM7gnv8eAk
	 pylYIueMLOE4lu+BvxLXhKko/lfB0VbE4ZT+pkF7H/iAqTs4dpVMqY0GhyxApqcJFU
	 c4T/EIXf/IqZx2wbCjoEYk4a0/nOLZPfH0sC7yYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58D3F80518;
	Wed,  6 Apr 2022 12:06:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED6D1F8020C; Wed,  6 Apr 2022 12:06:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B007F8020C
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 12:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B007F8020C
X-UUID: 7e015190cef7459c948e91df0f1c38a7-20220406
X-UUID: 7e015190cef7459c948e91df0f1c38a7-20220406
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 487011296; Wed, 06 Apr 2022 18:05:21 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 6 Apr 2022 18:05:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 18:05:19 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nfraprado@collabora.com>,
 <tzungbi@google.com>
Subject: [v9 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of
 headset
Date: Wed, 6 Apr 2022 18:05:13 +0800
Message-ID: <20220406100514.11269-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
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

MT8192 platform use rt5682 codec, so through the snd_soc_of_get_dai_link_codecs()
to complete the configuration of I2S8/I2S9 dai_link's codecs.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 15711448d259..4a11f687d416 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -28,9 +28,6 @@
 #define RT1015_DEV0_NAME	"rt1015.1-0028"
 #define RT1015_DEV1_NAME	"rt1015.1-0029"
 
-#define RT5682_CODEC_DAI	"rt5682-aif1"
-#define RT5682_DEV0_NAME	"rt5682.1-001a"
-
 struct mt8192_mt6359_priv {
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -626,14 +623,12 @@ SND_SOC_DAILINK_DEFS(i2s7,
 
 SND_SOC_DAILINK_DEFS(i2s8,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S8")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(i2s9,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S9")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(connsys_i2s,
@@ -1114,7 +1109,7 @@ static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node, *hdmi_codec, *speaker_codec;
+	struct device_node *platform_node, *hdmi_codec, *headset_codec, *speaker_codec;
 	int ret, i;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8192_mt6359_priv *priv;
@@ -1142,6 +1137,13 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		goto err_speaker_codec;
 	}
 
+	headset_codec = of_get_child_by_name(pdev->dev.of_node, "headset-codec");
+	if (!headset_codec) {
+		ret = -EINVAL;
+		dev_err_probe(&pdev->dev, ret, "Property 'headset-codec' missing or invalid\n");
+		goto err_headset_codec;
+	}
+
 	for_each_card_prelinks(card, i, dai_link) {
 		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
 		if (ret) {
@@ -1150,6 +1152,20 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 			goto err_probe;
 		}
 
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S8");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
+		}
+
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S9");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
+		}
+
 		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
 			dai_link->codecs->of_node = hdmi_codec;
 			dai_link->ignore = 0;
@@ -1180,6 +1196,8 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
 
 err_probe:
+	of_node_put(headset_codec);
+err_headset_codec:
 	of_node_put(speaker_codec);
 err_speaker_codec:
 	of_node_put(platform_node);
-- 
2.25.1

