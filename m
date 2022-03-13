Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0254D7644
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Mar 2022 16:15:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A17B17E2;
	Sun, 13 Mar 2022 16:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A17B17E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647184547;
	bh=lc2VVzSb9//0ml0zPVK+Exyv7n3ujvUVD5zv4VNQPXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V94QFca4Y+jyuF0at8/6GCKcmyzz5H4WB6tywjxnAHPCCz/DTYgxDbmL2OokAQorN
	 IcCpRBDU7uSqcIRWbipoR2POXTV/8ztH4Js5OsBD2gENjX9c+ILRb/kas/LIaSFhkC
	 VJIMx7wqYiRMyROfeYgxH6ljS7K1s7s1usUFwqCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BC4F8059F;
	Sun, 13 Mar 2022 16:11:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C38ADF80516; Sun, 13 Mar 2022 16:11:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 751A3F8051A
 for <alsa-devel@alsa-project.org>; Sun, 13 Mar 2022 16:10:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 751A3F8051A
X-UUID: abbc52f7853a4735b9a379c83a699b0c-20220313
X-UUID: abbc52f7853a4735b9a379c83a699b0c-20220313
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 41626643; Sun, 13 Mar 2022 23:10:42 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 13 Mar 2022 23:10:41 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 13 Mar 2022 23:10:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Mar 2022 23:10:39 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: [v3 15/19] ASoC: mediatek: mt8186: add machine driver with mt6366,
 da7219 and max98357
Date: Sun, 13 Mar 2022 23:10:19 +0800
Message-ID: <20220313151023.21229-16-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

Add support for mt8186 board with mt6366, da7219 and max98357.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 924 ++++++++++++++++++
 1 file changed, 924 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
new file mode 100644
index 000000000000..630023f1fb16
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -0,0 +1,924 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8186-mt6366-da7219-max98357.c
+//	--  MT8186-MT6366-DA7219-MAX98357 ALSA SoC machine driver
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+//
+
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "../../codecs/da7219-aad.h"
+#include "../../codecs/da7219.h"
+#include "../../codecs/mt6358.h"
+#include "../common/mtk-afe-platform-driver.h"
+#include "mt8186-afe-common.h"
+#include "mt8186-afe-clk.h"
+#include "mt8186-afe-gpio.h"
+
+#define DA7219_CODEC_DAI "da7219-hifi"
+#define DA7219_DEV_NAME "da7219.5-001a"
+
+struct mt8186_mt6366_da7219_max98357_priv {
+	struct snd_soc_jack headset_jack, hdmi_jack;
+};
+
+static struct snd_soc_codec_conf mt6366_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF("mt6358-sound"),
+		.name_prefix = "Mt6366",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("bt-sco"),
+		.name_prefix = "Mt8186 bt",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("hdmi-audio-codec"),
+		.name_prefix = "Mt8186 hdmi",
+	},
+};
+
+static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8186_mt6366_da7219_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_jack *jack = &priv->headset_jack;
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	int ret;
+
+	/* Enable Headset and 4 Buttons Jack detection */
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3 | SND_JACK_LINEOUT,
+				    jack, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	da7219_aad_jack_det(cmpnt_codec, &priv->headset_jack);
+
+	return 0;
+}
+
+static int mt8186_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	unsigned int rate = params_rate(params);
+	unsigned int mclk_fs_ratio = 256;
+	unsigned int mclk_fs = rate * mclk_fs_ratio;
+	unsigned int freq;
+	int ret = 0, j;
+
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0,
+				     mclk_fs, SND_SOC_CLOCK_OUT);
+	if (ret < 0) {
+		dev_err(rtd->dev, "failed to set cpu dai sysclk: %d\n", ret);
+		return ret;
+	}
+
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
+		if (!strcmp(codec_dai->component->name, DA7219_DEV_NAME)) {
+			ret = snd_soc_dai_set_sysclk(codec_dai,
+						     DA7219_CLKSRC_MCLK,
+						     mclk_fs,
+						     SND_SOC_CLOCK_IN);
+			if (ret < 0) {
+				dev_err(rtd->dev, "failed to set sysclk: %d\n",
+					ret);
+				return ret;
+			}
+
+			if ((rate % 8000) == 0)
+				freq = DA7219_PLL_FREQ_OUT_98304;
+			else
+				freq = DA7219_PLL_FREQ_OUT_90316;
+
+			ret = snd_soc_dai_set_pll(codec_dai, 0,
+						  DA7219_SYSCLK_PLL_SRM,
+						  0, freq);
+			if (ret) {
+				dev_err(rtd->dev, "failed to start PLL: %d\n",
+					ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mt8186_da7219_i2s_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int ret = 0, j;
+
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
+		if (!strcmp(codec_dai->component->name, DA7219_DEV_NAME)) {
+			ret = snd_soc_dai_set_pll(codec_dai,
+						  0, DA7219_SYSCLK_MCLK, 0, 0);
+			if (ret < 0) {
+				dev_err(rtd->dev, "failed to stop PLL: %d\n",
+					ret);
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_ops mt8186_da7219_i2s_ops = {
+	.hw_params = mt8186_da7219_i2s_hw_params,
+	.hw_free = mt8186_da7219_i2s_hw_free,
+};
+
+static int mt8186_mt6366_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mt8186_mt6366_da7219_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &priv->hdmi_jack, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
+}
+
+static int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	int ret;
+
+	/* set mtkaif protocol */
+	mt6358_set_mtkaif_protocol(cmpnt_codec,
+				   MT6358_MTKAIF_PROTOCOL_1);
+	afe_priv->mtkaif_protocol = MT6358_MTKAIF_PROTOCOL_1;
+
+	ret = snd_soc_dapm_sync(dapm);
+	if (ret) {
+		dev_err(rtd->dev, "failed to snd_soc_dapm_sync\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt8186_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params,
+				  snd_pcm_format_t fmt)
+{
+	struct snd_interval *channels = hw_param_interval(params,
+		SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	dev_dbg(rtd->dev, "%s(), fix format to %d\n", __func__, fmt);
+
+	/* fix BE i2s channel to 2 channel */
+	channels->min = 2;
+	channels->max = 2;
+
+	/* clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, fmt);
+
+	return 0;
+}
+
+
+static int mt8186_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				      struct snd_pcm_hw_params *params)
+{
+	return mt8186_hw_params_fixup(rtd, params, SNDRV_PCM_FORMAT_S32_LE);
+}
+
+static int mt8186_hdmi_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					   struct snd_pcm_hw_params *params)
+{
+	return mt8186_hw_params_fixup(rtd, params, SNDRV_PCM_FORMAT_S24_LE);
+}
+
+/* FE */
+SND_SOC_DAILINK_DEFS(playback1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback12,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL12")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback4,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback6,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback7,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL7")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback8,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL8")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture4,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture6,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture7,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL7")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* hostless */
+SND_SOC_DAILINK_DEFS(hostless_lpbk,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless LPBK DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_fm,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless FM DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_src1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless_SRC_1_DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_src_bargein,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless_SRC_Bargein_DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* BE */
+SND_SOC_DAILINK_DEFS(adda,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6358-sound",
+						   "mt6358-snd-codec-aif1"),
+					COMP_CODEC("dmic-codec",
+						   "dmic-hifi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(i2s0,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S0")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(DA7219_DEV_NAME,
+						   DA7219_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(i2s1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S1")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(DA7219_DEV_NAME,
+						   DA7219_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(i2s2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(i2s3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi"),
+					COMP_CODEC("max98357a", "HiFi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hw_gain1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("HW Gain 1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hw_gain2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("HW Gain 2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hw_src1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("HW_SRC_1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hw_src2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("HW_SRC_2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(connsys_i2s,
+		     DAILINK_COMP_ARRAY(COMP_CPU("CONNSYS_I2S")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(pcm1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("PCM 1")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm-wb")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(tdm_in,
+		     DAILINK_COMP_ARRAY(COMP_CPU("TDM IN")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* hostless */
+SND_SOC_DAILINK_DEFS(hostless_ul1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless_UL1 DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_ul2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless_UL2 DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_ul3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless_UL3 DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_ul5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless_UL5 DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_ul6,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless_UL6 DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_hw_gain_aaudio,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless HW Gain AAudio DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(hostless_src_aaudio,
+		     DAILINK_COMP_ARRAY(COMP_CPU("Hostless SRC AAudio DAI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+#if IS_ENABLED(CONFIG_SND_SOC_MTK_BTCVSD)
+SND_SOC_DAILINK_DEFS(btcvsd,
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_PLATFORM("18050000.mtk-btcvsd-snd")));
+#endif
+static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
+	/* Front End DAI links */
+	{
+		.name = "Playback_1",
+		.stream_name = "Playback_1",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_format = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback1),
+	},
+	{
+		.name = "Playback_12",
+		.stream_name = "Playback_12",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback12),
+	},
+	{
+		.name = "Playback_2",
+		.stream_name = "Playback_2",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_format = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback2),
+	},
+	{
+		.name = "Playback_3",
+		.stream_name = "Playback_3",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_format = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback3),
+	},
+	{
+		.name = "Playback_4",
+		.stream_name = "Playback_4",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback4),
+	},
+	{
+		.name = "Playback_5",
+		.stream_name = "Playback_5",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback5),
+	},
+	{
+		.name = "Playback_6",
+		.stream_name = "Playback_6",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback6),
+	},
+	{
+		.name = "Playback_7",
+		.stream_name = "Playback_7",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback7),
+	},
+	{
+		.name = "Playback_8",
+		.stream_name = "Playback_8",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback8),
+	},
+	{
+		.name = "Capture_1",
+		.stream_name = "Capture_1",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture1),
+	},
+	{
+		.name = "Capture_2",
+		.stream_name = "Capture_2",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_format = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(capture2),
+	},
+	{
+		.name = "Capture_3",
+		.stream_name = "Capture_3",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture3),
+	},
+	{
+		.name = "Capture_4",
+		.stream_name = "Capture_4",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_format = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(capture4),
+	},
+	{
+		.name = "Capture_5",
+		.stream_name = "Capture_5",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture5),
+	},
+	{
+		.name = "Capture_6",
+		.stream_name = "Capture_6",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_format = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(capture6),
+	},
+	{
+		.name = "Capture_7",
+		.stream_name = "Capture_7",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture7),
+	},
+	{
+		.name = "Hostless_LPBK",
+		.stream_name = "Hostless_LPBK",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_lpbk),
+	},
+	{
+		.name = "Hostless_FM",
+		.stream_name = "Hostless_FM",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_fm),
+	},
+	{
+		.name = "Hostless_SRC_1",
+		.stream_name = "Hostless_SRC_1",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_src1),
+	},
+	{
+		.name = "Hostless_SRC_Bargein",
+		.stream_name = "Hostless_SRC_Bargein",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_src_bargein),
+	},
+	{
+		.name = "Hostless_HW_Gain_AAudio",
+		.stream_name = "Hostless_HW_Gain_AAudio",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_hw_gain_aaudio),
+	},
+	{
+		.name = "Hostless_SRC_AAudio",
+		.stream_name = "Hostless_SRC_AAudio",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_src_aaudio),
+	},
+	/* BTCVSD */
+#if IS_ENABLED(CONFIG_SND_SOC_MTK_BTCVSD)
+	{
+		.name = "BTCVSD",
+		.stream_name = "BTCVSD",
+		SND_SOC_DAILINK_REG(btcvsd),
+	},
+#endif
+	/* Back End DAI links */
+	{
+		.name = "Primary Codec",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		.init = mt8186_mt6366_init,
+		SND_SOC_DAILINK_REG(adda),
+	},
+	{
+		.name = "I2S3",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			   SND_SOC_DAIFMT_IB_NF |
+			   SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_playback = 1,
+		.ignore_suspend = 1,
+		.init = mt8186_mt6366_hdmi_init,
+		.be_hw_params_fixup = mt8186_hdmi_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s3),
+	},
+	{
+		.name = "I2S0",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
+		.ops = &mt8186_da7219_i2s_ops,
+		SND_SOC_DAILINK_REG(i2s0),
+	},
+	{
+		.name = "I2S1",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
+		.init = mt8186_da7219_init,
+		.ops = &mt8186_da7219_i2s_ops,
+		SND_SOC_DAILINK_REG(i2s1),
+	},
+	{
+		.name = "I2S2",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s2),
+	},
+	{
+		.name = "HW Gain 1",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hw_gain1),
+	},
+	{
+		.name = "HW Gain 2",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hw_gain2),
+	},
+	{
+		.name = "HW_SRC_1",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hw_src1),
+	},
+	{
+		.name = "HW_SRC_2",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hw_src2),
+	},
+	{
+		.name = "CONNSYS_I2S",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(connsys_i2s),
+	},
+	{
+		.name = "PCM 1",
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			   SND_SOC_DAIFMT_NB_IF,
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(pcm1),
+	},
+	{
+		.name = "TDM IN",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(tdm_in),
+	},
+	/* dummy BE for ul memif to record from dl memif */
+	{
+		.name = "Hostless_UL1",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_ul1),
+	},
+	{
+		.name = "Hostless_UL2",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_ul2),
+	},
+	{
+		.name = "Hostless_UL3",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_ul3),
+	},
+	{
+		.name = "Hostless_UL5",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_ul5),
+	},
+	{
+		.name = "Hostless_UL6",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_ul6),
+	},
+};
+
+static const struct snd_soc_dapm_widget
+mt8186_mt6366_da7219_max98357_widgets[] = {
+	SND_SOC_DAPM_SPK("SPK Out", NULL),
+	SND_SOC_DAPM_OUTPUT("HDMI Out"),
+};
+
+static const struct snd_soc_dapm_route
+mt8186_mt6366_da7219_max98357_routes[] = {
+	/* SPK */
+	{ "SPK Out", NULL, "Speaker" },
+	/* HDMI */
+	{ "HDMI Out", NULL, "TX" },
+};
+
+static const struct snd_kcontrol_new
+mt8186_mt6366_da7219_max98357_controls[] = {
+	SOC_DAPM_PIN_SWITCH("SPK Out"),
+	SOC_DAPM_PIN_SWITCH("HDMI Out"),
+};
+
+static struct snd_soc_card mt8186_mt6366_da7219_max98357_soc_card = {
+	.name = "mt8186_mt6366_da7219_max98357",
+	.owner = THIS_MODULE,
+	.dai_link = mt8186_mt6366_da7219_max98357_dai_links,
+	.num_links = ARRAY_SIZE(mt8186_mt6366_da7219_max98357_dai_links),
+	.controls = mt8186_mt6366_da7219_max98357_controls,
+	.num_controls = ARRAY_SIZE(mt8186_mt6366_da7219_max98357_controls),
+	.dapm_widgets = mt8186_mt6366_da7219_max98357_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_da7219_max98357_widgets),
+	.dapm_routes = mt8186_mt6366_da7219_max98357_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_da7219_max98357_routes),
+	.codec_conf = mt6366_codec_conf,
+	.num_configs = ARRAY_SIZE(mt6366_codec_conf),
+};
+
+static int mt8186_mt6366_da7219_max98357_dev_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt8186_mt6366_da7219_max98357_soc_card;
+	struct snd_soc_dai_link *dai_link;
+	struct mt8186_mt6366_da7219_max98357_priv *priv;
+	struct device_node *platform_node, *hdmi_codec;
+	int ret, i;
+
+	dev_info(&pdev->dev, "%s(), ++\n", __func__);
+
+	card->dev = &pdev->dev;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
+	if (!platform_node) {
+		ret = -EINVAL;
+		dev_err_probe(&pdev->dev, ret, "Property 'platform' missing or invalid\n");
+		goto err_platform_node;
+	}
+
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
+	if (!hdmi_codec) {
+		ret = -EINVAL;
+		dev_err_probe(&pdev->dev, ret, "Property 'hdmi' missing or invalid\n");
+		goto err_hdmi_node;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->platforms->name)
+			continue;
+
+		if (hdmi_codec && strcmp(dai_link->name, "I2S3") == 0) {
+			dai_link->codecs->of_node = hdmi_codec;
+			dai_link->ignore = 0;
+		}
+
+		dai_link->platforms->of_node = platform_node;
+	}
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	/* init gpio */
+	ret = mt8186_afe_gpio_init(&pdev->dev);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
+		goto err_init_gpio;
+	}
+
+	dev_info(&pdev->dev, "%s(), devm_snd_soc_register_card\n", __func__);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret,
+			      "%s snd_soc_register_card fail\n", __func__);
+
+err_init_gpio:
+	of_node_put(hdmi_codec);
+err_hdmi_node:
+	of_node_put(platform_node);
+err_platform_node:
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id mt8186_mt6366_da7219_max98357_dt_match[] = {
+	{.compatible = "mediatek,mt8186_mt6366_da7219_max98357_sound",},
+	{}
+};
+#endif
+
+static struct platform_driver mt8186_mt6366_da7219_max98357_driver = {
+	.driver = {
+		.name = "mt8186_mt6366_da7219_max98357",
+#if IS_ENABLED(CONFIG_OF)
+		.of_match_table = mt8186_mt6366_da7219_max98357_dt_match,
+#endif
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = mt8186_mt6366_da7219_max98357_dev_probe,
+};
+
+module_platform_driver(mt8186_mt6366_da7219_max98357_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8186-MT6366-DA7219-MAX98357 ALSA SoC machine driver");
+MODULE_AUTHOR("Jiaxin Yu <jiaxin.yu@mediatek.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("mt8186_mt6366_da7219_max98357 soc card");
-- 
2.18.0

