Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB85F0E56
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 17:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299CC16C0;
	Fri, 30 Sep 2022 17:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299CC16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664550104;
	bh=BcZV/2bw8T1sM929mul+2kbF3MbOlyL5JQaGVf7Fyow=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okSUrDDaVuoyIuQWyskZ6dd88O+FALkJWTplSLFUTfCzaxELAY9jVJDKM5Dd+Pkjv
	 i2wz/JN66PAgxELQj0eegQ8LFKw/EGcZjLfZ7+Em6wPNhLw9yZ05dS4jPolqdO1ehb
	 /ECIhnHMgqmD9uBkKvoV8caHWAloIfl2k/jtWSJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E542DF805AF;
	Fri, 30 Sep 2022 16:57:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D910CF8057A; Fri, 30 Sep 2022 16:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF670F800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 16:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF670F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="i6iBU1Py"
X-UUID: 6e8a38cef7e440e5977a93e84e77ed45-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Wx09Dh/Rx7dGxAWqMAD/HO6lV5btJFh0pFyH6insU44=; 
 b=i6iBU1PyDwZCz/QqeaibxIiUSrOzfUfIPrys7CyyfC6bq/qo1X+z5kYcDMkxWp+0oSIWIsGY6QmPDUFHjymX13REml+K6JYOG2bRkkacn8zQztWImplBeKxvhsPmRAsDVRqH0WVyDLYFOaFFz0rpU7Ow9oMH6lh151LupvK42mQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:f3dc682c-85aa-4e22-a9e4-080feaccf215, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.11, REQID:f3dc682c-85aa-4e22-a9e4-080feaccf215, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:39a5ff1, CLOUDID:f50bcde4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:220930225712K95JKIPF,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,
 COL:0
X-UUID: 6e8a38cef7e440e5977a93e84e77ed45-20220930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1990132994; Fri, 30 Sep 2022 22:57:10 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 22:57:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 22:57:08 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
Subject: [PATCH 06/12] ASoC: mediatek: mt8188: support pcmif in platform driver
Date: Fri, 30 Sep 2022 22:56:55 +0800
Message-ID: <20220930145701.18790-7-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930145701.18790-1-trevor.wu@mediatek.com>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org
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

Add mt8188 pcmif dai driver support

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c | 362 +++++++++++++++++++++
 1 file changed, 362 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
new file mode 100644
index 000000000000..40a634cffebf
--- /dev/null
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek ALSA SoC Audio DAI PCM I/F Control
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ *         Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
+ */
+
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8188-afe-clk.h"
+#include "mt8188-afe-common.h"
+#include "mt8188-reg.h"
+
+enum {
+	MTK_DAI_PCM_FMT_I2S,
+	MTK_DAI_PCM_FMT_EIAJ,
+	MTK_DAI_PCM_FMT_MODEA,
+	MTK_DAI_PCM_FMT_MODEB,
+};
+
+enum {
+	MTK_DAI_PCM_CLK_A1SYS,
+	MTK_DAI_PCM_CLK_A2SYS,
+	MTK_DAI_PCM_CLK_26M_48K,
+	MTK_DAI_PCM_CLK_26M_441K,
+};
+
+struct mtk_dai_pcm_rate {
+	unsigned int rate;
+	unsigned int reg_value;
+};
+
+struct mtk_dai_pcmif_priv {
+	unsigned int slave_mode;
+	unsigned int lrck_inv;
+	unsigned int bck_inv;
+	unsigned int format;
+};
+
+static const struct mtk_dai_pcm_rate mtk_dai_pcm_rates[] = {
+	{ .rate = 8000, .reg_value = 0, },
+	{ .rate = 16000, .reg_value = 1, },
+	{ .rate = 32000, .reg_value = 2, },
+	{ .rate = 48000, .reg_value = 3, },
+	{ .rate = 11025, .reg_value = 1, },
+	{ .rate = 22050, .reg_value = 2, },
+	{ .rate = 44100, .reg_value = 3, },
+};
+
+static int mtk_dai_pcm_mode(unsigned int rate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_dai_pcm_rates); i++)
+		if (mtk_dai_pcm_rates[i].rate == rate)
+			return mtk_dai_pcm_rates[i].reg_value;
+
+	return -EINVAL;
+}
+
+static const struct snd_kcontrol_new mtk_dai_pcm_o000_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I000 Switch", AFE_CONN0, 0, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I070 Switch", AFE_CONN0_2, 6, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_dai_pcm_o001_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I001 Switch", AFE_CONN1, 1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I071 Switch", AFE_CONN1_2, 7, 1, 0),
+};
+
+static const struct snd_soc_dapm_widget mtk_dai_pcm_widgets[] = {
+	SND_SOC_DAPM_MIXER("I002", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I003", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("O000", SND_SOC_NOPM, 0, 0,
+			   mtk_dai_pcm_o000_mix,
+			   ARRAY_SIZE(mtk_dai_pcm_o000_mix)),
+	SND_SOC_DAPM_MIXER("O001", SND_SOC_NOPM, 0, 0,
+			   mtk_dai_pcm_o001_mix,
+			   ARRAY_SIZE(mtk_dai_pcm_o001_mix)),
+
+	SND_SOC_DAPM_SUPPLY("PCM_1_EN", PCM_INTF_CON1, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_INPUT("PCM1_INPUT"),
+	SND_SOC_DAPM_OUTPUT("PCM1_OUTPUT"),
+
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_asrc11"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_asrc12"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_pcmif"),
+};
+
+static const struct snd_soc_dapm_route mtk_dai_pcm_routes[] = {
+	{"I002", NULL, "PCM1 Capture"},
+	{"I003", NULL, "PCM1 Capture"},
+
+	{"O000", "I000 Switch", "I000"},
+	{"O001", "I001 Switch", "I001"},
+
+	{"O000", "I070 Switch", "I070"},
+	{"O001", "I071 Switch", "I071"},
+
+	{"PCM1 Playback", NULL, "O000"},
+	{"PCM1 Playback", NULL, "O001"},
+
+	{"PCM1 Playback", NULL, "PCM_1_EN"},
+	{"PCM1 Playback", NULL, "aud_asrc12"},
+	{"PCM1 Playback", NULL, "aud_pcmif"},
+
+	{"PCM1 Capture", NULL, "PCM_1_EN"},
+	{"PCM1 Capture", NULL, "aud_asrc11"},
+	{"PCM1 Capture", NULL, "aud_pcmif"},
+
+	{"PCM1_OUTPUT", NULL, "PCM1 Playback"},
+	{"PCM1 Capture", NULL, "PCM1_INPUT"},
+};
+
+static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime * const runtime = substream->runtime;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_pcmif_priv *pcmif_priv = NULL;
+	unsigned int slave_mode = 0;
+	unsigned int lrck_inv = 0;
+	unsigned int bck_inv = 0;
+	unsigned int fmt = 0;
+	unsigned int bit_width = dai->sample_bits;
+	unsigned int val = 0;
+	unsigned int mask = 0;
+	int fs = 0;
+	int mode = 0;
+
+	if (dai->id < 0)
+		return -EINVAL;
+
+	pcmif_priv = afe_priv->dai_priv[dai->id];
+	slave_mode = pcmif_priv->slave_mode;
+	lrck_inv = pcmif_priv->lrck_inv;
+	bck_inv = pcmif_priv->bck_inv;
+	fmt = pcmif_priv->format;
+
+	/* sync freq mode */
+	fs = mt8188_afe_fs_timing(runtime->rate);
+	if (fs < 0)
+		return -EINVAL;
+	val |= PCM_INTF_CON2_SYNC_FREQ_MODE(fs);
+	mask |= PCM_INTF_CON2_SYNC_FREQ_MODE_MASK;
+
+	/* clk domain sel */
+	if (runtime->rate % 8000)
+		val |= PCM_INTF_CON2_CLK_DOMAIN_SEL(MTK_DAI_PCM_CLK_26M_441K);
+	else
+		val |= PCM_INTF_CON2_CLK_DOMAIN_SEL(MTK_DAI_PCM_CLK_26M_48K);
+	mask |= PCM_INTF_CON2_CLK_DOMAIN_SEL_MASK;
+
+	regmap_update_bits(afe->regmap, PCM_INTF_CON2, mask, val);
+
+	val = 0;
+	mask = 0;
+
+	/* pcm mode */
+	mode = mtk_dai_pcm_mode(runtime->rate);
+	if (mode < 0)
+		return -EINVAL;
+	val |= PCM_INTF_CON1_PCM_MODE(mode);
+	mask |= PCM_INTF_CON1_PCM_MODE_MASK;
+
+	/* pcm format */
+	val |= PCM_INTF_CON1_PCM_FMT(fmt);
+	mask |= PCM_INTF_CON1_PCM_FMT_MASK;
+
+	/* pcm sync length */
+	if (fmt == MTK_DAI_PCM_FMT_MODEA ||
+	    fmt == MTK_DAI_PCM_FMT_MODEB)
+		val |= PCM_INTF_CON1_SYNC_LENGTH(1);
+	else
+		val |= PCM_INTF_CON1_SYNC_LENGTH(bit_width);
+	mask |= PCM_INTF_CON1_SYNC_LENGTH_MASK;
+
+	/* pcm bits, word length */
+	if (bit_width > 16) {
+		val |= PCM_INTF_CON1_PCM_24BIT;
+		val |= PCM_INTF_CON1_PCM_WLEN_64BCK;
+	} else {
+		val |= PCM_INTF_CON1_PCM_16BIT;
+		val |= PCM_INTF_CON1_PCM_WLEN_32BCK;
+	}
+	mask |= PCM_INTF_CON1_PCM_BIT_MASK;
+	mask |= PCM_INTF_CON1_PCM_WLEN_MASK;
+
+	/* master/slave */
+	if (!slave_mode) {
+		val |= PCM_INTF_CON1_PCM_MASTER;
+
+		if (lrck_inv)
+			val |= PCM_INTF_CON1_SYNC_OUT_INV;
+		if (bck_inv)
+			val |= PCM_INTF_CON1_BCLK_OUT_INV;
+		mask |= PCM_INTF_CON1_CLK_OUT_INV_MASK;
+	} else {
+		val |= PCM_INTF_CON1_PCM_SLAVE;
+
+		if (lrck_inv)
+			val |= PCM_INTF_CON1_SYNC_IN_INV;
+		if (bck_inv)
+			val |= PCM_INTF_CON1_BCLK_IN_INV;
+		mask |= PCM_INTF_CON1_CLK_IN_INV_MASK;
+
+		// TODO: add asrc setting for slave mode
+	}
+	mask |= PCM_INTF_CON1_PCM_M_S_MASK;
+
+	regmap_update_bits(afe->regmap, PCM_INTF_CON1, mask, val);
+
+	return 0;
+}
+
+/* dai ops */
+static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	if (dai->playback_widget->active || dai->capture_widget->active)
+		return 0;
+
+	return mtk_dai_pcm_configure(substream, dai);
+}
+
+static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_pcmif_priv *pcmif_priv = NULL;
+
+	dev_dbg(dai->dev, "%s fmt 0x%x\n", __func__, fmt);
+
+	if (dai->id < 0)
+		return -EINVAL;
+
+	pcmif_priv = afe_priv->dai_priv[dai->id];
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		pcmif_priv->format = MTK_DAI_PCM_FMT_I2S;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		pcmif_priv->format = MTK_DAI_PCM_FMT_MODEA;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		pcmif_priv->format = MTK_DAI_PCM_FMT_MODEB;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		pcmif_priv->bck_inv = 0;
+		pcmif_priv->lrck_inv = 0;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		pcmif_priv->bck_inv = 0;
+		pcmif_priv->lrck_inv = 1;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		pcmif_priv->bck_inv = 1;
+		pcmif_priv->lrck_inv = 0;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		pcmif_priv->bck_inv = 1;
+		pcmif_priv->lrck_inv = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		pcmif_priv->slave_mode = 1;
+		break;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		pcmif_priv->slave_mode = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
+	.prepare	= mtk_dai_pcm_prepare,
+	.set_fmt	= mtk_dai_pcm_set_fmt,
+};
+
+/* dai driver */
+#define MTK_PCM_RATES (SNDRV_PCM_RATE_8000_48000)
+
+#define MTK_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mtk_dai_pcm_driver[] = {
+	{
+		.name = "PCM1",
+		.id = MT8188_AFE_IO_PCM,
+		.playback = {
+			.stream_name = "PCM1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.capture = {
+			.stream_name = "PCM1 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_dai_pcm_ops,
+		.symmetric_rate = 1,
+		.symmetric_sample_bits = 1,
+	},
+};
+
+static int init_pcmif_priv_data(struct mtk_base_afe *afe)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_pcmif_priv *pcmif_priv;
+
+	pcmif_priv = devm_kzalloc(afe->dev, sizeof(struct mtk_dai_pcmif_priv),
+				  GFP_KERNEL);
+	if (!pcmif_priv)
+		return -ENOMEM;
+
+	afe_priv->dai_priv[MT8188_AFE_IO_PCM] = pcmif_priv;
+	return 0;
+}
+
+int mt8188_dai_pcm_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_pcm_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_pcm_driver);
+
+	dai->dapm_widgets = mtk_dai_pcm_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_pcm_widgets);
+	dai->dapm_routes = mtk_dai_pcm_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_pcm_routes);
+
+	return init_pcmif_priv_data(afe);
+}
-- 
2.18.0

