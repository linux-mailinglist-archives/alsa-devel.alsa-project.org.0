Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7304774218D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 10:00:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B7C77F8;
	Thu, 29 Jun 2023 09:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B7C77F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688025645;
	bh=jygzC7/KhiL1ONGd/+dQZmfiBQBnLTPaCLR4p+mBUX0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dF7W/BDRZ+CqnvV8RN6wQmdRI8oUlkrFpKzovvbcoR/ZyXvwJlNRHxcR42hvybtUX
	 Lcwy9atjy57fnyYwRQZtFOjY8tiWvntbVQFDVbYSS59mBINEw1kjZm7Ox2ta7C8fY5
	 uWz7SYUp1rXSTIeD92oY81m5Tdiq8HZAMuutj1NQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87A4DF8027B; Thu, 29 Jun 2023 09:59:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25938F80169;
	Thu, 29 Jun 2023 09:59:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0AA8F80212; Thu, 29 Jun 2023 09:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B77CF800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 09:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B77CF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=YY7zdvpd
X-UUID: d7cc6962165211eeb20a276fd37b9834-20230629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DiiWsMcy5MZboP5al/aFt6kLyJc9jecmPV9qc6pE8+w=;
	b=YY7zdvpdoecyLAxPnBHUZLd5Rihhga+1Mv6mY6h2h8SJXx3ObJgwUMZJ9aqM0jczOhe3U93UkLwqC7m/OBo6RLAEI14iJ+iv0x3YUqcgjM8Uc/MRp2HoF2jTr/lNsRwwexdchIbEjBWkmUKX7uo7P8lC+/XJdHbgzbzpV+yu6W0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:5c1cbac4-5a1f-4724-bae3-51f1bfb37881,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:01c9525,CLOUDID:0ec75e0d-26a8-467f-b838-f99719a9c083,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d7cc6962165211eeb20a276fd37b9834-20230629
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 532892412; Thu, 29 Jun 2023 15:59:15 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Jun 2023 15:59:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Jun 2023 15:59:15 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mediatek: mt8188: add constraints for PCM
Date: Thu, 29 Jun 2023 15:59:10 +0800
Message-ID: <20230629075910.21982-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: LIN2V4O5466FXEU5HTT67XPSPIZ7CFGZ
X-Message-ID-Hash: LIN2V4O5466FXEU5HTT67XPSPIZ7CFGZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIN2V4O5466FXEU5HTT67XPSPIZ7CFGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For certain projects, only a limited number of parameters are necessary.
Therefore, it may be beneficial to add constraints that restrict the
capacity of the PCM.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 145 +++++++++++++++++++++-
 1 file changed, 144 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index ac69c23e0da1..0e4e1b8c99e2 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -30,6 +30,7 @@
  #define TEST_MISO_DONE_2	BIT(29)
 
 #define NAU8825_HS_PRESENT	BIT(0)
+#define DPCM_FE_CONSTRAINT	BIT(16)
 
 /*
  * Maxim MAX98390
@@ -452,6 +453,143 @@ enum {
 	DAI_LINK_UL_SRC_BE,
 };
 
+static int mt8188_playback_startup(struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		48000
+	};
+	static const unsigned int channels[] = {
+		2
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list  = channels,
+		.mask = 0,
+	};
+
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct mt8188_card_data *data = (struct mt8188_card_data *)priv->private_data;
+	int ret;
+
+	if (!(data->quirk & DPCM_FE_CONSTRAINT))
+		return 0;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &constraints_rates);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 &constraints_channels);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8188_playback_ops = {
+	.startup = mt8188_playback_startup,
+};
+
+static int mt8188_capture_startup(struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		48000
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct mt8188_card_data *data = (struct mt8188_card_data *)priv->private_data;
+	int ret;
+
+	if (!(data->quirk & DPCM_FE_CONSTRAINT))
+		return 0;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &constraints_rates);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8188_capture_ops = {
+	.startup = mt8188_capture_startup,
+};
+
+static int mt8188_hdmi_dptx_startup(struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		48000
+	};
+	static const unsigned int channels[] = {
+		2, 4, 6, 8
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list  = channels,
+		.mask = 0,
+	};
+
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct mt8188_card_data *data = (struct mt8188_card_data *)priv->private_data;
+	int ret;
+
+	if (!(data->quirk & DPCM_FE_CONSTRAINT))
+		return 0;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &constraints_rates);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 &constraints_channels);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8188_hdmi_dptx_playback_ops = {
+	.startup = mt8188_hdmi_dptx_startup,
+};
+
 static int mt8188_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
@@ -723,6 +861,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8188_playback_ops,
 		SND_SOC_DAILINK_REG(playback2),
 	},
 	[DAI_LINK_DL3_FE] = {
@@ -734,6 +873,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8188_playback_ops,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	[DAI_LINK_DL6_FE] = {
@@ -778,6 +918,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8188_hdmi_dptx_playback_ops,
 		SND_SOC_DAILINK_REG(playback10),
 	},
 	[DAI_LINK_DL11_FE] = {
@@ -833,6 +974,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8188_capture_ops,
 		SND_SOC_DAILINK_REG(capture4),
 	},
 	[DAI_LINK_UL5_FE] = {
@@ -844,6 +986,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8188_capture_ops,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	[DAI_LINK_UL6_FE] = {
@@ -1122,7 +1265,7 @@ static struct mt8188_card_data mt8188_evb_card = {
 
 static struct mt8188_card_data mt8188_nau8825_card = {
 	.name = "mt8188_nau8825",
-	.quirk = NAU8825_HS_PRESENT,
+	.quirk = NAU8825_HS_PRESENT | DPCM_FE_CONSTRAINT,
 };
 
 static const struct of_device_id mt8188_mt6359_dt_match[] = {
-- 
2.18.0

