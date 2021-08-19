Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A2B3F157E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 10:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF3C16A8;
	Thu, 19 Aug 2021 10:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF3C16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629362811;
	bh=vRuLyWfwmccAA6wWgRTsLXTJyGXio0PM4yw5T9z17EE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7uAnagnot8XIQjBAPkIYSI41Q139FZvK2W4Ty8arhGluvlRcKV4QrvHWF2WojLVh
	 DueFt9rjkBaI81zeEyQQvrhtgS6xGDjxqMiPn8wPyT1DZH7SMW61n/h7Kkp4lFFgkR
	 Ch/tPv4Mb+N4N9Xv3Wd1cKLDFHW0u/jkB0jo0f/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37025F80515;
	Thu, 19 Aug 2021 10:43:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7860F804FD; Thu, 19 Aug 2021 10:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46751F80301
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 10:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46751F80301
X-UUID: 49f7054fea78460291db02d06b2dbdd5-20210819
X-UUID: 49f7054fea78460291db02d06b2dbdd5-20210819
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 618432502; Thu, 19 Aug 2021 16:43:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 16:43:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 16:43:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH v5 10/11] ASoC: mediatek: mt8195: add HDMITX audio support
Date: Thu, 19 Aug 2021 16:41:43 +0800
Message-ID: <20210819084144.18483-11-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210819084144.18483-1-trevor.wu@mediatek.com>
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
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
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index d853bc445753..5dc217f59bd6 100644
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
@@ -1008,6 +1026,20 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 			dai_link->codecs->dai_name = "i2s-hifi";
 			dai_link->init = mt8195_dptx_codec_init;
 		}
+
+		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
+			dai_link->codecs->of_node =
+				of_parse_phandle(pdev->dev.of_node,
+						 "mediatek,hdmi-codec", 0);
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

