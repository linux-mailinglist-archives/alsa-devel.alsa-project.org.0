Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBA3F01DA
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 12:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77394E;
	Wed, 18 Aug 2021 12:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77394E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629283014;
	bh=uxrhlrjHbi2N4GBtitYVsstI03rCgLxPcRKuXP0WAcg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sWr8Oleyup0ldOvWXJbPtyg7GX4BoRwBIKKMMiSSWpaR5pZOPO09aSTqxd/LLA5H5
	 IP1l9Yha69wTtLJSywrW6AeEx8bIBq8nvUtrAlQc4+x9kXr+C8sLKmtP6zvDmcBSHv
	 W63U7hb19TPxVOfXaInDfO+q0BFWNmRReBC4Y6Dk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D7AF80528;
	Wed, 18 Aug 2021 12:32:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1D07F80524; Wed, 18 Aug 2021 12:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84864F804E1
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 12:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84864F804E1
X-UUID: 92ee899d91504b73bcdf5351bc6d0ec0-20210818
X-UUID: 92ee899d91504b73bcdf5351bc6d0ec0-20210818
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1060562664; Wed, 18 Aug 2021 18:32:24 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 18:32:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 18:32:23 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH v4 10/11] ASoC: mediatek: mt8195: add HDMITX audio support
Date: Wed, 18 Aug 2021 18:32:14 +0800
Message-ID: <20210818103215.9186-11-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818103215.9186-1-trevor.wu@mediatek.com>
References: <20210818103215.9186-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, wenst@chromium.org, aaronyu@google.com,
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

This patch adds HDMITX audio support on mt8195-mt6359-rt1019-rt5682 board.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index d853bc445753..e4472bbc9f01 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -28,6 +28,7 @@
 struct mt8195_mt6359_rt1019_rt5682_priv {
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack dp_jack;
+	struct snd_soc_jack hdmi_jack;
 };
 
 static const struct snd_soc_dapm_widget
@@ -407,6 +408,22 @@ static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return snd_soc_component_set_jack(cmpnt_codec, &priv->dp_jack, NULL);
 }
 
+static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	int ret = 0;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &priv->hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
+}
+
 static int mt8195_hdmitx_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					      struct snd_pcm_hw_params *params)
 
@@ -936,6 +953,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_playback = 1,
+		.be_hw_params_fixup = mt8195_hdmitx_dptx_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM3_OUT_BE),
 	},
 	[DAI_LINK_PCM1_BE] = {
@@ -1008,6 +1026,26 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 			dai_link->codecs->dai_name = "i2s-hifi";
 			dai_link->init = mt8195_dptx_codec_init;
 		}
+
+		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MT8195)
+			dai_link->codecs->of_node =
+				of_parse_phandle(machine_node,
+						 "mediatek,hdmi-codec", 0);
+#else
+			dai_link->codecs->of_node =
+				of_parse_phandle(pdev->dev.of_node,
+						 "mediatek,hdmi-codec", 0);
+#endif
+			if (!dai_link->codecs->of_node) {
+				dev_err(&pdev->dev, "Property 'hdmi-codec' missing or invalid\n");
+				return -EINVAL;
+			}
+
+			dai_link->codecs->name = NULL;
+			dai_link->codecs->dai_name = "i2s-hifi";
+			dai_link->init = mt8195_hdmi_codec_init;
+		}
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-- 
2.18.0

