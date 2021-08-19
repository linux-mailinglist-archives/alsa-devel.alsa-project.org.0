Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BAB3F157B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 10:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECD7F1686;
	Thu, 19 Aug 2021 10:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECD7F1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629362762;
	bh=WqyZNpyvoxoczXmp4NnV5clzbLgakiHs7MVqPLGfJiU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bnMGkVBwa13cW+LW71TNUOgu6TGpq5oIqW7hhy969VF3jxUpyn32s/jtpi0k6kjOW
	 yHrHC+ZZkZL3Rb5gbpkopwMB6x0ZZypPIqT3qeRFHXQYTSA3LlFXmWvLC45m8pus0f
	 qdQMVm2IB/SYmmJWaFfGnWJ/b6neSrRkEQQUyheI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9649F804FA;
	Thu, 19 Aug 2021 10:43:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64153F804E6; Thu, 19 Aug 2021 10:43:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DB35F802C4
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 10:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DB35F802C4
X-UUID: feac066661014cfebd06b23ea4018c5b-20210819
X-UUID: feac066661014cfebd06b23ea4018c5b-20210819
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1708232796; Thu, 19 Aug 2021 16:43:09 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 16:43:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 16:43:08 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH v5 05/11] ASoC: mediatek: mt8195: support pcm in platform
 driver
Date: Thu, 19 Aug 2021 16:41:38 +0800
Message-ID: <20210819084144.18483-6-trevor.wu@mediatek.com>
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

This patch adds mt8195 pcm dai driver.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c | 389 +++++++++++++++++++++
 1 file changed, 389 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
new file mode 100644
index 000000000000..5d10d2c4c991
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek ALSA SoC Audio DAI PCM I/F Control
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8195-afe-clk.h"
+#include "mt8195-afe-common.h"
+#include "mt8195-reg.h"
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
+	SND_SOC_DAPM_INPUT("PCM1_INPUT"),
+	SND_SOC_DAPM_OUTPUT("PCM1_OUTPUT"),
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
+	{"PCM1_OUTPUT", NULL, "PCM1 Playback"},
+	{"PCM1 Capture", NULL, "PCM1_INPUT"},
+};
+
+static void mtk_dai_pcm_enable(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
+			   PCM_INTF_CON1_PCM_EN, PCM_INTF_CON1_PCM_EN);
+}
+
+static void mtk_dai_pcm_disable(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
+			   PCM_INTF_CON1_PCM_EN, 0x0);
+}
+
+static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime * const runtime = substream->runtime;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_pcmif_priv *pcmif_priv = afe_priv->dai_priv[dai->id];
+	unsigned int slave_mode = pcmif_priv->slave_mode;
+	unsigned int lrck_inv = pcmif_priv->lrck_inv;
+	unsigned int bck_inv = pcmif_priv->bck_inv;
+	unsigned int fmt = pcmif_priv->format;
+	unsigned int bit_width = dai->sample_bits;
+	unsigned int val = 0;
+	unsigned int mask = 0;
+	int fs = 0;
+	int mode = 0;
+
+	/* sync freq mode */
+	fs = mt8195_afe_fs_timing(runtime->rate);
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
+		/* TODO: add asrc setting for slave mode */
+	}
+	mask |= PCM_INTF_CON1_PCM_M_S_MASK;
+
+	regmap_update_bits(afe->regmap, PCM_INTF_CON1, mask, val);
+
+	return 0;
+}
+
+/* dai ops */
+static int mtk_dai_pcm_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	if (dai->component->active)
+		return 0;
+
+	mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_ASRC11]);
+	mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_ASRC12]);
+	mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_PCMIF]);
+
+	return 0;
+}
+
+static void mtk_dai_pcm_shutdown(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	if (dai->component->active)
+		return;
+
+	mtk_dai_pcm_disable(afe);
+
+	mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_PCMIF]);
+	mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_ASRC12]);
+	mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_ASRC11]);
+}
+
+static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int ret = 0;
+
+	if (snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+	    snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_CAPTURE))
+		return 0;
+
+	ret = mtk_dai_pcm_configure(substream, dai);
+	if (ret)
+		return ret;
+
+	mtk_dai_pcm_enable(afe);
+
+	return 0;
+}
+
+static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_pcmif_priv *pcmif_priv = afe_priv->dai_priv[dai->id];
+
+	dev_dbg(dai->dev, "%s fmt 0x%x\n", __func__, fmt);
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
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		pcmif_priv->slave_mode = 1;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
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
+	.startup	= mtk_dai_pcm_startup,
+	.shutdown	= mtk_dai_pcm_shutdown,
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
+		.id = MT8195_AFE_IO_PCM,
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
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_pcmif_priv *pcmif_priv;
+
+	pcmif_priv = devm_kzalloc(afe->dev, sizeof(struct mtk_dai_pcmif_priv),
+				  GFP_KERNEL);
+	if (!pcmif_priv)
+		return -ENOMEM;
+
+	afe_priv->dai_priv[MT8195_AFE_IO_PCM] = pcmif_priv;
+	return 0;
+}
+
+int mt8195_dai_pcm_register(struct mtk_base_afe *afe)
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

