Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 550834617BA
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 15:14:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6C591AAB;
	Mon, 29 Nov 2021 15:13:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6C591AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638195239;
	bh=u9cX9/136U4kNUEDzgVPciVF6mUyOos2r/ZsS+Di2Cg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiFMUaQcTKjOsT4TwrI9k713SpL289JFc4flgZmtG1eZxWNnAqCFRi53Mx6dba/E7
	 sM6x7/WK2nX5vViWfbAjpbDBIjZwqRRxDIEkhixhhStkNDTwIR0tl/4mFz/M/pWP5+
	 RrSKnJI5EaZbooUIsumTR9nxE1D0EdVwglT89nNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16288F804FC;
	Mon, 29 Nov 2021 15:11:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D959AF80246; Mon, 29 Nov 2021 15:11:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B6F2F80217
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 15:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B6F2F80217
X-UUID: a4e2fe1d179d46e094b23befe89991e2-20211129
X-UUID: a4e2fe1d179d46e094b23befe89991e2-20211129
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1770213480; Mon, 29 Nov 2021 22:11:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 22:11:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 22:11:05 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/4] ASoC: mediatek: mt8195: add headset codec rt5682s
 support
Date: Mon, 29 Nov 2021 22:10:54 +0800
Message-ID: <20211129141057.12422-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211129141057.12422-1-trevor.wu@mediatek.com>
References: <20211129141057.12422-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, daniel.baluta@nxp.com,
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

mt8195 machine driver adds rt5682s support in this patch.
Card name can be specified from dts by model property, and driver makes
use of the name to distinguish which headset codec is on the board.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                    |  2 ++
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 29 +++++++++++++-----
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 30 ++++++++++++++-----
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3b1ddea26a9e..9306b7ca2644 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -205,6 +205,7 @@ config SND_SOC_MT8195_MT6359_RT1019_RT5682
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	select SND_SOC_HDMI_CODEC
 	help
@@ -220,6 +221,7 @@ config SND_SOC_MT8195_MT6359_RT1011_RT5682
 	select SND_SOC_MT6359
 	select SND_SOC_RT1011
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	select SND_SOC_HDMI_CODEC
 	help
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index e103102d7ef6..797f155c882b 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -27,6 +27,9 @@
 #define RT5682_CODEC_DAI	"rt5682-aif1"
 #define RT5682_DEV0_NAME	"rt5682.2-001a"
 
+#define RT5682S_CODEC_DAI	"rt5682s-aif1"
+#define RT5682S_DEV0_NAME	"rt5682s.2-001a"
+
 struct mt8195_mt6359_rt1011_rt5682_priv {
 	struct device_node *platform_node;
 	struct device_node *hdmi_node;
@@ -691,14 +694,12 @@ SND_SOC_DAILINK_DEFS(ETDM1_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_IN")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
@@ -1046,9 +1047,19 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8195_mt6359_rt1011_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1011_rt5682_priv *priv;
+	int is5682s = 0;
 	int ret, i;
 
 	card->dev = &pdev->dev;
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err(&pdev->dev, "%s new card name parsing error %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	if (strstr(card->name, "_5682s"))
+		is5682s = 1;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -1078,9 +1089,7 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
 			}
-		}
-
-		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
+		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
 			priv->hdmi_node =
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,hdmi-codec", 0);
@@ -1092,6 +1101,12 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
 			}
+		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
+			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			dai_link->codecs->name =
+				is5682s ? RT5682S_DEV0_NAME : RT5682_DEV0_NAME;
+			dai_link->codecs->dai_name =
+				is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
 		}
 	}
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 95abaadcd842..7209c70acf6e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -25,6 +25,9 @@
 #define RT5682_CODEC_DAI	"rt5682-aif1"
 #define RT5682_DEV0_NAME	"rt5682.2-001a"
 
+#define RT5682S_CODEC_DAI	"rt5682s-aif1"
+#define RT5682S_DEV0_NAME	"rt5682s.2-001a"
+
 struct mt8195_mt6359_rt1019_rt5682_priv {
 	struct device_node *platform_node;
 	struct device_node *hdmi_node;
@@ -661,14 +664,12 @@ SND_SOC_DAILINK_DEFS(ETDM1_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_IN")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
@@ -999,10 +1000,21 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1019_rt5682_priv *priv;
+	int is5682s = 0;
 	int ret, i;
 
 	card->dev = &pdev->dev;
 
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err(&pdev->dev, "%s new card name parsing error %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	if (strstr(card->name, "_5682s"))
+		is5682s = 1;
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -1031,9 +1043,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
 			}
-		}
-
-		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
+		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
 			priv->hdmi_node =
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,hdmi-codec", 0);
@@ -1045,6 +1055,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
 			}
+		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
+			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			dai_link->codecs->name =
+				is5682s ? RT5682S_DEV0_NAME : RT5682_DEV0_NAME;
+			dai_link->codecs->dai_name =
+				is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
 		}
 	}
 
-- 
2.18.0

