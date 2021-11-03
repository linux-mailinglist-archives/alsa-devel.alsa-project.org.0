Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805EE443FC8
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 11:03:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE9B16AC;
	Wed,  3 Nov 2021 11:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE9B16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635933832;
	bh=7xLl9uStpxj76+H6PiypwgLbUUqpSiQvShoaS+fkWRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ki2snlIdhbRPSX0jsn1Oo9SayZB7AEClHn5ghh1vQ8W/fMG46i/OpH7Z+r3nVa/4V
	 efnskZcNYin05/mxjgTUaoCNL9ckFVDPHjO44/3yPrTBqIHENLTFT1lw75WAcym503
	 akDyv54N0gndBboDrmZeqIkkU2lY+xjpL/XK/JxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A743F802BE;
	Wed,  3 Nov 2021 11:02:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C0BF8026A; Wed,  3 Nov 2021 11:02:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D1D3F80279
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 11:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D1D3F80279
X-UUID: 23aa6cb90956464ea7bd48cb17dcde3b-20211103
X-UUID: 23aa6cb90956464ea7bd48cb17dcde3b-20211103
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1670906568; Wed, 03 Nov 2021 18:00:47 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 18:00:46 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 3 Nov 2021 18:00:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Nov 2021 18:00:46 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code from
 machine driver
Date: Wed, 3 Nov 2021 18:00:39 +0800
Message-ID: <20211103100040.11933-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211103100040.11933-1-trevor.wu@mediatek.com>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com, daniel.baluta@nxp.com,
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

Because we will add DSP support, an new machine driver for the same
board is required. BE and codec configuration will use the same code
when machine driver is designed for the same board.

Separate common code which can be used in multiple machine drivers so
that the common code can be reused when a new machine driver is created.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/Makefile            |  11 +-
 sound/soc/mediatek/mt8195/mt8195-common.c     | 398 ++++++++++++
 sound/soc/mediatek/mt8195/mt8195-common.h     |  33 +
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 568 +-----------------
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 527 +---------------
 .../mediatek/mt8195/mt8195-realtek-common.c   | 161 +++++
 .../mediatek/mt8195/mt8195-realtek-common.h   |  34 ++
 7 files changed, 656 insertions(+), 1076 deletions(-)
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-common.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-realtek-common.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-realtek-common.h

diff --git a/sound/soc/mediatek/mt8195/Makefile b/sound/soc/mediatek/mt8195/Makefile
index e5f0df5010b6..2edcd2855847 100644
--- a/sound/soc/mediatek/mt8195/Makefile
+++ b/sound/soc/mediatek/mt8195/Makefile
@@ -12,5 +12,12 @@ snd-soc-mt8195-afe-objs := \
 obj-$(CONFIG_SND_SOC_MT8195) += snd-soc-mt8195-afe.o
 
 # machine driver
-obj-$(CONFIG_SND_SOC_MT8195_MT6359_RT1019_RT5682) += mt8195-mt6359-rt1019-rt5682.o
-obj-$(CONFIG_SND_SOC_MT8195_MT6359_RT1011_RT5682) += mt8195-mt6359-rt1011-rt5682.o
+snd-soc-mt8195-rt-common-objs := mt8195-common.o mt8195-realtek-common.o
+
+obj-$(CONFIG_SND_SOC_MT8195_MT6359_RT1019_RT5682) += \
+	snd-soc-mt8195-rt-common.o \
+	mt8195-mt6359-rt1019-rt5682.o
+
+obj-$(CONFIG_SND_SOC_MT8195_MT6359_RT1011_RT5682) += \
+	snd-soc-mt8195-rt-common.o \
+	mt8195-mt6359-rt1011-rt5682.o
diff --git a/sound/soc/mediatek/mt8195/mt8195-common.c b/sound/soc/mediatek/mt8195/mt8195-common.c
new file mode 100644
index 000000000000..97f238fa3414
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-common.c
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt8195-common.c  --  common code for MT8195 ALSA SoC machine driver
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/input.h>
+#include <linux/pm_runtime.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "../../codecs/mt6359.h"
+#include "../common/mtk-afe-platform-driver.h"
+#include "mt8195-afe-common.h"
+#include "mt8195-common.h"
+
+#define CKSYS_AUD_TOP_CFG 0x032c
+#define CKSYS_AUD_TOP_MON 0x0330
+
+static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtkaif_param *param = &afe_priv->mtkaif_params;
+	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
+	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
+	int test_done_1, test_done_2, test_done_3;
+	int cycle_1, cycle_2, cycle_3;
+	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
+	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
+	int mtkaif_calibration_num_phase;
+	bool mtkaif_calibration_ok;
+	unsigned int monitor;
+	int counter;
+	int phase;
+	int i;
+
+	dev_dbg(afe->dev, "%s(), start\n", __func__);
+
+	param->mtkaif_calibration_ok = false;
+	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++) {
+		param->mtkaif_chosen_phase[i] = -1;
+		param->mtkaif_phase_cycle[i] = 0;
+		mtkaif_chosen_phase[i] = -1;
+		mtkaif_phase_cycle[i] = 0;
+	}
+
+	if (IS_ERR(afe_priv->topckgen)) {
+		dev_info(afe->dev, "%s() Cannot find topckgen controller\n",
+			 __func__);
+		return 0;
+	}
+
+	pm_runtime_get_sync(afe->dev);
+	mt6359_mtkaif_calibration_enable(cmpnt_codec);
+
+	/* set test type to synchronizer pulse */
+	regmap_update_bits(afe_priv->topckgen,
+			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
+	mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
+	mtkaif_calibration_ok = true;
+
+	for (phase = 0;
+	     phase <= mtkaif_calibration_num_phase && mtkaif_calibration_ok;
+	     phase++) {
+		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
+						    phase, phase, phase);
+
+		regmap_update_bits(afe_priv->topckgen,
+				   CKSYS_AUD_TOP_CFG, 0x1, 0x1);
+
+		test_done_1 = 0;
+		test_done_2 = 0;
+		test_done_3 = 0;
+		cycle_1 = -1;
+		cycle_2 = -1;
+		cycle_3 = -1;
+		counter = 0;
+		while (!(test_done_1 & test_done_2 & test_done_3)) {
+			regmap_read(afe_priv->topckgen,
+				    CKSYS_AUD_TOP_MON, &monitor);
+			test_done_1 = (monitor >> 28) & 0x1;
+			test_done_2 = (monitor >> 29) & 0x1;
+			test_done_3 = (monitor >> 30) & 0x1;
+			if (test_done_1 == 1)
+				cycle_1 = monitor & 0xf;
+
+			if (test_done_2 == 1)
+				cycle_2 = (monitor >> 4) & 0xf;
+
+			if (test_done_3 == 1)
+				cycle_3 = (monitor >> 8) & 0xf;
+
+			/* handle if never test done */
+			if (++counter > 10000) {
+				dev_info(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, cycle_3 %d, monitor 0x%x\n",
+					 __func__,
+					 cycle_1, cycle_2, cycle_3, monitor);
+				mtkaif_calibration_ok = false;
+				break;
+			}
+		}
+
+		if (phase == 0) {
+			prev_cycle_1 = cycle_1;
+			prev_cycle_2 = cycle_2;
+			prev_cycle_3 = cycle_3;
+		}
+
+		if (cycle_1 != prev_cycle_1 &&
+		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] < 0) {
+			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] = phase - 1;
+			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_0] = prev_cycle_1;
+		}
+
+		if (cycle_2 != prev_cycle_2 &&
+		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] < 0) {
+			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] = phase - 1;
+			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1] = prev_cycle_2;
+		}
+
+		if (cycle_3 != prev_cycle_3 &&
+		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] < 0) {
+			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] = phase - 1;
+			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_2] = prev_cycle_3;
+		}
+
+		regmap_update_bits(afe_priv->topckgen,
+				   CKSYS_AUD_TOP_CFG, 0x1, 0x0);
+
+		if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] >= 0 &&
+		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] >= 0 &&
+		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] >= 0)
+			break;
+	}
+
+	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] < 0) {
+		mtkaif_calibration_ok = false;
+		chosen_phase_1 = 0;
+	} else {
+		chosen_phase_1 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0];
+	}
+
+	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] < 0) {
+		mtkaif_calibration_ok = false;
+		chosen_phase_2 = 0;
+	} else {
+		chosen_phase_2 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1];
+	}
+
+	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] < 0) {
+		mtkaif_calibration_ok = false;
+		chosen_phase_3 = 0;
+	} else {
+		chosen_phase_3 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2];
+	}
+
+	mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
+					    chosen_phase_1,
+					    chosen_phase_2,
+					    chosen_phase_3);
+
+	mt6359_mtkaif_calibration_disable(cmpnt_codec);
+	pm_runtime_put(afe->dev);
+
+	param->mtkaif_calibration_ok = mtkaif_calibration_ok;
+	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] = chosen_phase_1;
+	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] = chosen_phase_2;
+	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] = chosen_phase_3;
+	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++)
+		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
+
+	dev_info(afe->dev, "%s(), end, calibration ok %d\n",
+		 __func__, param->mtkaif_calibration_ok);
+
+	return 0;
+}
+
+int mt8195_mt6359_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+
+	/* set mtkaif protocol */
+	mt6359_set_mtkaif_protocol(cmpnt_codec,
+				   MT6359_MTKAIF_PROTOCOL_2_CLK_P2);
+
+	/* mtkaif calibration */
+	mt8195_mt6359_mtkaif_calibration(rtd);
+
+	return 0;
+}
+
+static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
+				      SND_SOC_CLOCK_OUT);
+}
+
+const struct snd_soc_ops mt8195_dptx_ops = {
+	.hw_params = mt8195_dptx_hw_params,
+};
+
+int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				struct snd_pcm_hw_params *params)
+
+{
+	/* fix BE i2s format to 32bit, clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+
+	return 0;
+}
+
+int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8195_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+				    &priv->dp_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return snd_soc_component_set_jack(cmpnt_codec, &priv->dp_jack, NULL);
+}
+
+int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8195_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &priv->hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
+}
+
+static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream *substream)
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
+	int ret;
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
+const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops = {
+	.startup = mt8195_hdmitx_dptx_startup,
+};
+
+static int mt8195_playback_startup(struct snd_pcm_substream *substream)
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
+	int ret;
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
+const struct snd_soc_ops mt8195_playback_ops = {
+	.startup = mt8195_playback_startup,
+};
+
+static int mt8195_capture_startup(struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		48000
+	};
+	static const unsigned int channels[] = {
+		1, 2
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
+	int ret;
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
+const struct snd_soc_ops mt8195_capture_ops = {
+	.startup = mt8195_capture_startup,
+};
+
+const struct dev_pm_ops mt8195_pm_ops = {
+	.poweroff = snd_soc_poweroff,
+	.restore = snd_soc_resume,
+};
diff --git a/sound/soc/mediatek/mt8195/mt8195-common.h b/sound/soc/mediatek/mt8195/mt8195-common.h
new file mode 100644
index 000000000000..7a834ce8b49a
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-common.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8195-common.h  --  Mediatek 8195 common header for machine driver
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT_8195_COMMON_H_
+#define _MT_8195_COMMON_H_
+
+struct mt8195_priv {
+	struct device_node *platform_node;
+	struct device_node *hdmi_node;
+	struct device_node *dp_node;
+	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack dp_jack;
+	struct snd_soc_jack hdmi_jack;
+};
+
+extern const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops;
+extern const struct snd_soc_ops mt8195_dptx_ops;
+extern const struct snd_soc_ops mt8195_playback_ops;
+extern const struct snd_soc_ops mt8195_capture_ops;
+extern const struct dev_pm_ops mt8195_pm_ops;
+
+int mt8195_mt6359_init(struct snd_soc_pcm_runtime *rtd);
+int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd);
+int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd);
+int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				struct snd_pcm_hw_params *params);
+
+#endif
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index 797f155c882b..49a0268e2525 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -7,40 +7,13 @@
 // Author: Trevor Wu <trevor.wu@mediatek.com>
 //
 
-#include <linux/input.h>
 #include <linux/module.h>
-#include <linux/pm_runtime.h>
-#include <sound/jack.h>
-#include <sound/pcm_params.h>
-#include <sound/rt5682.h>
 #include <sound/soc.h>
-#include "../../codecs/mt6359.h"
-#include "../../codecs/rt1011.h"
-#include "../../codecs/rt5682.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "mt8195-afe-common.h"
-
-#define RT1011_CODEC_DAI	"rt1011-aif"
-#define RT1011_DEV0_NAME	"rt1011.2-0038"
-#define RT1011_DEV1_NAME	"rt1011.2-0039"
-
-#define RT5682_CODEC_DAI	"rt5682-aif1"
-#define RT5682_DEV0_NAME	"rt5682.2-001a"
-
-#define RT5682S_CODEC_DAI	"rt5682s-aif1"
-#define RT5682S_DEV0_NAME	"rt5682s.2-001a"
-
-struct mt8195_mt6359_rt1011_rt5682_priv {
-	struct device_node *platform_node;
-	struct device_node *hdmi_node;
-	struct device_node *dp_node;
-	struct snd_soc_jack headset_jack;
-	struct snd_soc_jack dp_jack;
-	struct snd_soc_jack hdmi_jack;
-};
+#include "mt8195-common.h"
+#include "mt8195-realtek-common.h"
 
 static const struct snd_soc_dapm_widget
-mt8195_mt6359_rt1011_rt5682_widgets[] = {
+	mt8195_mt6359_rt1011_rt5682_widgets[] = {
 	SND_SOC_DAPM_SPK("Left Speaker", NULL),
 	SND_SOC_DAPM_SPK("Right Speaker", NULL),
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
@@ -64,507 +37,6 @@ static const struct snd_kcontrol_new mt8195_mt6359_rt1011_rt5682_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
-static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	unsigned int rate = params_rate(params);
-	int bitwidth;
-	int ret;
-
-	bitwidth = snd_pcm_format_width(params_format(params));
-	if (bitwidth < 0) {
-		dev_err(card->dev, "invalid bit width: %d\n", bitwidth);
-		return bitwidth;
-	}
-
-	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x00, 0x0, 0x2, bitwidth);
-	if (ret) {
-		dev_err(card->dev, "failed to set tdm slot\n");
-		return ret;
-	}
-
-	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1, RT5682_PLL1_S_BCLK1,
-				  rate * 64, rate * 512);
-	if (ret) {
-		dev_err(card->dev, "failed to set pll\n");
-		return ret;
-	}
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
-				     rate * 512, SND_SOC_CLOCK_IN);
-	if (ret) {
-		dev_err(card->dev, "failed to set sysclk\n");
-		return ret;
-	}
-
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 128,
-				      SND_SOC_CLOCK_OUT);
-}
-
-static const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
-	.hw_params = mt8195_rt5682_etdm_hw_params,
-};
-
-static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_card *card = rtd->card;
-	int srate, i, ret = 0;
-
-	srate = params_rate(params);
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1011_PLL1_S_BCLK,
-					  64 * srate, 256 * srate);
-		if (ret < 0) {
-			dev_err(card->dev, "codec_dai clock not set\n");
-			return ret;
-		}
-
-		ret = snd_soc_dai_set_sysclk(codec_dai,
-					     RT1011_FS_SYS_PRE_S_PLL1,
-					     256 * srate, SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "codec_dai clock not set\n");
-			return ret;
-		}
-	}
-	return ret;
-}
-
-static const struct snd_soc_ops mt8195_rt1011_etdm_ops = {
-	.hw_params = mt8195_rt1011_etdm_hw_params,
-};
-
-#define CKSYS_AUD_TOP_CFG 0x032c
-#define CKSYS_AUD_TOP_MON 0x0330
-
-static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *cmpnt_afe =
-		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	struct mtkaif_param *param = &afe_priv->mtkaif_params;
-	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
-	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
-	int test_done_1, test_done_2, test_done_3;
-	int cycle_1, cycle_2, cycle_3;
-	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
-	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
-	int mtkaif_calibration_num_phase;
-	bool mtkaif_calibration_ok;
-	unsigned int monitor;
-	int counter;
-	int phase;
-	int i;
-
-	dev_dbg(afe->dev, "%s(), start\n", __func__);
-
-	param->mtkaif_calibration_ok = false;
-	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++) {
-		param->mtkaif_chosen_phase[i] = -1;
-		param->mtkaif_phase_cycle[i] = 0;
-		mtkaif_chosen_phase[i] = -1;
-		mtkaif_phase_cycle[i] = 0;
-	}
-
-	if (IS_ERR(afe_priv->topckgen)) {
-		dev_info(afe->dev, "%s() Cannot find topckgen controller\n",
-			 __func__);
-		return 0;
-	}
-
-	pm_runtime_get_sync(afe->dev);
-	mt6359_mtkaif_calibration_enable(cmpnt_codec);
-
-	/* set test type to synchronizer pulse */
-	regmap_update_bits(afe_priv->topckgen,
-			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
-	mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
-	mtkaif_calibration_ok = true;
-
-	for (phase = 0;
-	     phase <= mtkaif_calibration_num_phase && mtkaif_calibration_ok;
-	     phase++) {
-		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
-						    phase, phase, phase);
-
-		regmap_update_bits(afe_priv->topckgen,
-				   CKSYS_AUD_TOP_CFG, 0x1, 0x1);
-
-		test_done_1 = 0;
-		test_done_2 = 0;
-		test_done_3 = 0;
-		cycle_1 = -1;
-		cycle_2 = -1;
-		cycle_3 = -1;
-		counter = 0;
-		while (!(test_done_1 & test_done_2 & test_done_3)) {
-			regmap_read(afe_priv->topckgen,
-				    CKSYS_AUD_TOP_MON, &monitor);
-			test_done_1 = (monitor >> 28) & 0x1;
-			test_done_2 = (monitor >> 29) & 0x1;
-			test_done_3 = (monitor >> 30) & 0x1;
-			if (test_done_1 == 1)
-				cycle_1 = monitor & 0xf;
-
-			if (test_done_2 == 1)
-				cycle_2 = (monitor >> 4) & 0xf;
-
-			if (test_done_3 == 1)
-				cycle_3 = (monitor >> 8) & 0xf;
-
-			/* handle if never test done */
-			if (++counter > 10000) {
-				dev_info(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, cycle_3 %d, monitor 0x%x\n",
-					 __func__,
-					 cycle_1, cycle_2, cycle_3, monitor);
-				mtkaif_calibration_ok = false;
-				break;
-			}
-		}
-
-		if (phase == 0) {
-			prev_cycle_1 = cycle_1;
-			prev_cycle_2 = cycle_2;
-			prev_cycle_3 = cycle_3;
-		}
-
-		if (cycle_1 != prev_cycle_1 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] < 0) {
-			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] = phase - 1;
-			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_0] = prev_cycle_1;
-		}
-
-		if (cycle_2 != prev_cycle_2 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] < 0) {
-			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] = phase - 1;
-			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1] = prev_cycle_2;
-		}
-
-		if (cycle_3 != prev_cycle_3 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] < 0) {
-			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] = phase - 1;
-			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_2] = prev_cycle_3;
-		}
-
-		regmap_update_bits(afe_priv->topckgen,
-				   CKSYS_AUD_TOP_CFG, 0x1, 0x0);
-
-		if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] >= 0 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] >= 0 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] >= 0)
-			break;
-	}
-
-	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] < 0) {
-		mtkaif_calibration_ok = false;
-		chosen_phase_1 = 0;
-	} else {
-		chosen_phase_1 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0];
-	}
-
-	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] < 0) {
-		mtkaif_calibration_ok = false;
-		chosen_phase_2 = 0;
-	} else {
-		chosen_phase_2 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1];
-	}
-
-	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] < 0) {
-		mtkaif_calibration_ok = false;
-		chosen_phase_3 = 0;
-	} else {
-		chosen_phase_3 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2];
-	}
-
-	mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
-					    chosen_phase_1,
-					    chosen_phase_2,
-					    chosen_phase_3);
-
-	mt6359_mtkaif_calibration_disable(cmpnt_codec);
-	pm_runtime_put(afe->dev);
-
-	param->mtkaif_calibration_ok = mtkaif_calibration_ok;
-	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] = chosen_phase_1;
-	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] = chosen_phase_2;
-	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] = chosen_phase_3;
-	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++)
-		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
-
-	dev_info(afe->dev, "%s(), end, calibration ok %d\n",
-		 __func__, param->mtkaif_calibration_ok);
-
-	return 0;
-}
-
-static int mt8195_mt6359_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-
-	/* set mtkaif protocol */
-	mt6359_set_mtkaif_protocol(cmpnt_codec,
-				   MT6359_MTKAIF_PROTOCOL_2_CLK_P2);
-
-	/* mtkaif calibration */
-	mt8195_mt6359_mtkaif_calibration(rtd);
-
-	return 0;
-}
-
-static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_jack *jack = &priv->headset_jack;
-	int ret;
-
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
-				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
-				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-				    SND_JACK_BTN_3,
-				    jack, NULL, 0);
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
-		return ret;
-	}
-
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
-
-	ret = snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack set failed: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-};
-
-static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-				       struct snd_pcm_hw_params *params)
-{
-	/* fix BE i2s format to 32bit, clean param mask first */
-	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
-
-	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
-
-	return 0;
-}
-
-static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const unsigned int channels[] = {
-		2, 4, 6, 8
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list  = channels,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops = {
-	.startup = mt8195_hdmitx_dptx_startup,
-};
-
-static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
-				      SND_SOC_CLOCK_OUT);
-}
-
-static struct snd_soc_ops mt8195_dptx_ops = {
-	.hw_params = mt8195_dptx_hw_params,
-};
-
-static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	int ret;
-
-	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
-				    &priv->dp_jack, NULL, 0);
-	if (ret)
-		return ret;
-
-	return snd_soc_component_set_jack(cmpnt_codec, &priv->dp_jack, NULL);
-}
-
-static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	int ret;
-
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
-				    &priv->hdmi_jack, NULL, 0);
-	if (ret)
-		return ret;
-
-	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
-}
-
-static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-				       struct snd_pcm_hw_params *params)
-
-{
-	/* fix BE i2s format to 32bit, clean param mask first */
-	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
-
-	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
-
-	return 0;
-}
-
-static int mt8195_playback_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const unsigned int channels[] = {
-		2
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list  = channels,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8195_playback_ops = {
-	.startup = mt8195_playback_startup,
-};
-
-static int mt8195_capture_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const unsigned int channels[] = {
-		1, 2
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list  = channels,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8195_capture_ops = {
-	.startup = mt8195_capture_startup,
-};
-
 enum {
 	DAI_LINK_DL2_FE,
 	DAI_LINK_DL3_FE,
@@ -959,7 +431,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1011_rt5682_dai_links[] = {
 		.dpcm_capture = 1,
 		.init = mt8195_rt5682_init,
 		.ops = &mt8195_rt5682_etdm_ops,
-		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
+		.be_hw_params_fixup = mt8195_etdm_rt_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM2_IN_BE),
 	},
 	[DAI_LINK_ETDM1_OUT_BE] = {
@@ -970,7 +442,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1011_rt5682_dai_links[] = {
 			SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_playback = 1,
 		.ops = &mt8195_rt5682_etdm_ops,
-		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
+		.be_hw_params_fixup = mt8195_etdm_rt_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
 	},
 	[DAI_LINK_ETDM2_OUT_BE] = {
@@ -981,7 +453,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1011_rt5682_dai_links[] = {
 			SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_playback = 1,
 		.ops = &mt8195_rt1011_etdm_ops,
-		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
+		.be_hw_params_fixup = mt8195_etdm_rt_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM2_OUT_BE),
 	},
 	[DAI_LINK_ETDM3_OUT_BE] = {
@@ -1016,17 +488,6 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1011_rt5682_dai_links[] = {
 	},
 };
 
-static struct snd_soc_codec_conf rt1011_amp_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF(RT1011_DEV0_NAME),
-		.name_prefix = "Left",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(RT1011_DEV1_NAME),
-		.name_prefix = "Right",
-	},
-};
-
 static struct snd_soc_card mt8195_mt6359_rt1011_rt5682_soc_card = {
 	.name = "mt8195_r1011_5682",
 	.owner = THIS_MODULE,
@@ -1038,15 +499,13 @@ static struct snd_soc_card mt8195_mt6359_rt1011_rt5682_soc_card = {
 	.num_dapm_widgets = ARRAY_SIZE(mt8195_mt6359_rt1011_rt5682_widgets),
 	.dapm_routes = mt8195_mt6359_rt1011_rt5682_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt8195_mt6359_rt1011_rt5682_routes),
-	.codec_conf = rt1011_amp_conf,
-	.num_configs = ARRAY_SIZE(rt1011_amp_conf),
 };
 
 static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8195_mt6359_rt1011_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
-	struct mt8195_mt6359_rt1011_rt5682_priv *priv;
+	struct mt8195_priv *priv;
 	int is5682s = 0;
 	int ret, i;
 
@@ -1080,7 +539,6 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 			priv->dp_node =
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,dptx-codec", 0);
-
 			if (!priv->dp_node) {
 				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
 			} else {
@@ -1112,6 +570,8 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 
+	mt8195_rt1011_codec_conf(card);
+
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
@@ -1127,8 +587,7 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 static int mt8195_mt6359_rt1011_rt5682_dev_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(card);
+	struct mt8195_priv *priv = snd_soc_card_get_drvdata(card);
 
 	of_node_put(priv->hdmi_node);
 	of_node_put(priv->dp_node);
@@ -1144,18 +603,13 @@ static const struct of_device_id mt8195_mt6359_rt1011_rt5682_dt_match[] = {
 };
 #endif
 
-static const struct dev_pm_ops mt8195_mt6359_rt1011_rt5682_pm_ops = {
-	.poweroff = snd_soc_poweroff,
-	.restore = snd_soc_resume,
-};
-
 static struct platform_driver mt8195_mt6359_rt1011_rt5682_driver = {
 	.driver = {
 		.name = "mt8195_mt6359_rt1011_rt5682",
 #ifdef CONFIG_OF
 		.of_match_table = mt8195_mt6359_rt1011_rt5682_dt_match,
 #endif
-		.pm = &mt8195_mt6359_rt1011_rt5682_pm_ops,
+		.pm = &mt8195_pm_ops,
 	},
 	.probe = mt8195_mt6359_rt1011_rt5682_dev_probe,
 	.remove = mt8195_mt6359_rt1011_rt5682_dev_remove,
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 7209c70acf6e..1f3d5cf6fa4c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1,41 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 //
 // mt8195-mt6359-rt1019-rt5682.c  --
-//	MT8195-MT6359-RT1019-RT6358 ALSA SoC machine driver
+//	MT8195-MT6359-RT1019-RT5682 ALSA SoC machine driver
 //
 // Copyright (c) 2021 MediaTek Inc.
 // Author: Trevor Wu <trevor.wu@mediatek.com>
 //
 
-#include <linux/input.h>
 #include <linux/module.h>
-#include <linux/pm_runtime.h>
-#include <sound/jack.h>
-#include <sound/pcm_params.h>
-#include <sound/rt5682.h>
 #include <sound/soc.h>
-#include "../../codecs/mt6359.h"
-#include "../../codecs/rt5682.h"
-#include "../common/mtk-afe-platform-driver.h"
-#include "mt8195-afe-common.h"
-
-#define RT1019_CODEC_DAI	"HiFi"
-#define RT1019_DEV0_NAME	"rt1019p"
-
-#define RT5682_CODEC_DAI	"rt5682-aif1"
-#define RT5682_DEV0_NAME	"rt5682.2-001a"
-
-#define RT5682S_CODEC_DAI	"rt5682s-aif1"
-#define RT5682S_DEV0_NAME	"rt5682s.2-001a"
-
-struct mt8195_mt6359_rt1019_rt5682_priv {
-	struct device_node *platform_node;
-	struct device_node *hdmi_node;
-	struct device_node *dp_node;
-	struct snd_soc_jack headset_jack;
-	struct snd_soc_jack dp_jack;
-	struct snd_soc_jack hdmi_jack;
-};
+#include "mt8195-common.h"
+#include "mt8195-realtek-common.h"
 
 static const struct snd_soc_dapm_widget
 	mt8195_mt6359_rt1019_rt5682_widgets[] = {
@@ -59,482 +34,6 @@ static const struct snd_kcontrol_new mt8195_mt6359_rt1019_rt5682_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
-static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	unsigned int rate = params_rate(params);
-	unsigned int mclk_fs_ratio = 128;
-	unsigned int mclk_fs = rate * mclk_fs_ratio;
-	int bitwidth;
-	int ret;
-
-	bitwidth = snd_pcm_format_width(params_format(params));
-	if (bitwidth < 0) {
-		dev_err(card->dev, "invalid bit width: %d\n", bitwidth);
-		return bitwidth;
-	}
-
-	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x00, 0x0, 0x2, bitwidth);
-	if (ret) {
-		dev_err(card->dev, "failed to set tdm slot\n");
-		return ret;
-	}
-
-	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1,
-				  RT5682_PLL1_S_BCLK1,
-				  params_rate(params) * 64,
-				  params_rate(params) * 512);
-	if (ret) {
-		dev_err(card->dev, "failed to set pll\n");
-		return ret;
-	}
-
-	ret = snd_soc_dai_set_sysclk(codec_dai,
-				     RT5682_SCLK_S_PLL1,
-				     params_rate(params) * 512,
-				     SND_SOC_CLOCK_IN);
-	if (ret) {
-		dev_err(card->dev, "failed to set sysclk\n");
-		return ret;
-	}
-
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
-}
-
-static const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
-	.hw_params = mt8195_rt5682_etdm_hw_params,
-};
-
-#define CKSYS_AUD_TOP_CFG 0x032c
-#define CKSYS_AUD_TOP_MON 0x0330
-
-static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *cmpnt_afe =
-		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	struct mtkaif_param *param = &afe_priv->mtkaif_params;
-	int phase;
-	unsigned int monitor;
-	int mtkaif_calibration_num_phase;
-	int test_done_1, test_done_2, test_done_3;
-	int cycle_1, cycle_2, cycle_3;
-	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
-	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
-	int counter;
-	bool mtkaif_calibration_ok;
-	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
-	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
-	int i;
-
-	dev_info(afe->dev, "%s(), start\n", __func__);
-
-	param->mtkaif_calibration_ok = false;
-	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++) {
-		param->mtkaif_chosen_phase[i] = -1;
-		param->mtkaif_phase_cycle[i] = 0;
-		mtkaif_chosen_phase[i] = -1;
-		mtkaif_phase_cycle[i] = 0;
-	}
-
-	if (IS_ERR(afe_priv->topckgen)) {
-		dev_info(afe->dev, "%s() Cannot find topckgen controller\n",
-			 __func__);
-		return 0;
-	}
-
-	pm_runtime_get_sync(afe->dev);
-	mt6359_mtkaif_calibration_enable(cmpnt_codec);
-
-	/* set test type to synchronizer pulse */
-	regmap_update_bits(afe_priv->topckgen,
-			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
-	mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
-	mtkaif_calibration_ok = true;
-
-	for (phase = 0;
-	     phase <= mtkaif_calibration_num_phase && mtkaif_calibration_ok;
-	     phase++) {
-		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
-						    phase, phase, phase);
-
-		regmap_update_bits(afe_priv->topckgen,
-				   CKSYS_AUD_TOP_CFG, 0x1, 0x1);
-
-		test_done_1 = 0;
-		test_done_2 = 0;
-		test_done_3 = 0;
-		cycle_1 = -1;
-		cycle_2 = -1;
-		cycle_3 = -1;
-		counter = 0;
-		while (!(test_done_1 & test_done_2 & test_done_3)) {
-			regmap_read(afe_priv->topckgen,
-				    CKSYS_AUD_TOP_MON, &monitor);
-			test_done_1 = (monitor >> 28) & 0x1;
-			test_done_2 = (monitor >> 29) & 0x1;
-			test_done_3 = (monitor >> 30) & 0x1;
-			if (test_done_1 == 1)
-				cycle_1 = monitor & 0xf;
-
-			if (test_done_2 == 1)
-				cycle_2 = (monitor >> 4) & 0xf;
-
-			if (test_done_3 == 1)
-				cycle_3 = (monitor >> 8) & 0xf;
-
-			/* handle if never test done */
-			if (++counter > 10000) {
-				dev_info(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, cycle_3 %d, monitor 0x%x\n",
-					 __func__,
-					 cycle_1, cycle_2, cycle_3, monitor);
-				mtkaif_calibration_ok = false;
-				break;
-			}
-		}
-
-		if (phase == 0) {
-			prev_cycle_1 = cycle_1;
-			prev_cycle_2 = cycle_2;
-			prev_cycle_3 = cycle_3;
-		}
-
-		if (cycle_1 != prev_cycle_1 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] < 0) {
-			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] = phase - 1;
-			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_0] = prev_cycle_1;
-		}
-
-		if (cycle_2 != prev_cycle_2 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] < 0) {
-			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] = phase - 1;
-			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1] = prev_cycle_2;
-		}
-
-		if (cycle_3 != prev_cycle_3 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] < 0) {
-			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] = phase - 1;
-			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_2] = prev_cycle_3;
-		}
-
-		regmap_update_bits(afe_priv->topckgen,
-				   CKSYS_AUD_TOP_CFG, 0x1, 0x0);
-
-		if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] >= 0 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] >= 0 &&
-		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] >= 0)
-			break;
-	}
-
-	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] < 0) {
-		mtkaif_calibration_ok = false;
-		chosen_phase_1 = 0;
-	} else {
-		chosen_phase_1 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0];
-	}
-
-	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] < 0) {
-		mtkaif_calibration_ok = false;
-		chosen_phase_2 = 0;
-	} else {
-		chosen_phase_2 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1];
-	}
-
-	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] < 0) {
-		mtkaif_calibration_ok = false;
-		chosen_phase_3 = 0;
-	} else {
-		chosen_phase_3 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2];
-	}
-
-	mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
-					    chosen_phase_1,
-					    chosen_phase_2,
-					    chosen_phase_3);
-
-	mt6359_mtkaif_calibration_disable(cmpnt_codec);
-	pm_runtime_put(afe->dev);
-
-	param->mtkaif_calibration_ok = mtkaif_calibration_ok;
-	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] = chosen_phase_1;
-	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] = chosen_phase_2;
-	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] = chosen_phase_3;
-	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++)
-		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
-
-	dev_info(afe->dev, "%s(), end, calibration ok %d\n",
-		 __func__, param->mtkaif_calibration_ok);
-
-	return 0;
-}
-
-static int mt8195_mt6359_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-
-	/* set mtkaif protocol */
-	mt6359_set_mtkaif_protocol(cmpnt_codec,
-				   MT6359_MTKAIF_PROTOCOL_2_CLK_P2);
-
-	/* mtkaif calibration */
-	mt8195_mt6359_mtkaif_calibration(rtd);
-
-	return 0;
-}
-
-static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_jack *jack = &priv->headset_jack;
-	int ret;
-
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
-				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
-				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-				    SND_JACK_BTN_3,
-				    jack, NULL, 0);
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
-		return ret;
-	}
-
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
-
-	ret = snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack set failed: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-};
-
-static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-				       struct snd_pcm_hw_params *params)
-{
-	/* fix BE i2s format to 32bit, clean param mask first */
-	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
-
-	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
-
-	return 0;
-}
-
-static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const unsigned int channels[] = {
-		2, 4, 6, 8
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list  = channels,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops = {
-	.startup = mt8195_hdmitx_dptx_startup,
-};
-
-static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	unsigned int rate = params_rate(params);
-	unsigned int mclk_fs_ratio = 256;
-	unsigned int mclk_fs = rate * mclk_fs_ratio;
-
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs,
-				      SND_SOC_CLOCK_OUT);
-}
-
-static struct snd_soc_ops mt8195_dptx_ops = {
-	.hw_params = mt8195_dptx_hw_params,
-};
-
-static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	int ret = 0;
-
-	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
-				    &priv->dp_jack, NULL, 0);
-	if (ret)
-		return ret;
-
-	return snd_soc_component_set_jack(cmpnt_codec, &priv->dp_jack, NULL);
-}
-
-static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	int ret = 0;
-
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
-				    &priv->hdmi_jack, NULL, 0);
-	if (ret)
-		return ret;
-
-	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
-}
-
-static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-				       struct snd_pcm_hw_params *params)
-
-{
-	/* fix BE i2s format to 32bit, clean param mask first */
-	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
-
-	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
-
-	return 0;
-}
-
-static int mt8195_playback_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const unsigned int channels[] = {
-		2
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list  = channels,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8195_playback_ops = {
-	.startup = mt8195_playback_startup,
-};
-
-static int mt8195_capture_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const unsigned int channels[] = {
-		1, 2
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list  = channels,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8195_capture_ops = {
-	.startup = mt8195_capture_startup,
-};
-
 enum {
 	DAI_LINK_DL2_FE,
 	DAI_LINK_DL3_FE,
@@ -927,7 +426,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 		.dpcm_capture = 1,
 		.init = mt8195_rt5682_init,
 		.ops = &mt8195_rt5682_etdm_ops,
-		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
+		.be_hw_params_fixup = mt8195_etdm_rt_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM2_IN_BE),
 	},
 	[DAI_LINK_ETDM1_OUT_BE] = {
@@ -938,7 +437,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 			SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_playback = 1,
 		.ops = &mt8195_rt5682_etdm_ops,
-		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
+		.be_hw_params_fixup = mt8195_etdm_rt_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
 	},
 	[DAI_LINK_ETDM2_OUT_BE] = {
@@ -999,7 +498,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
-	struct mt8195_mt6359_rt1019_rt5682_priv *priv;
+	struct mt8195_priv *priv;
 	int is5682s = 0;
 	int ret, i;
 
@@ -1021,6 +520,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 
 	priv->platform_node = of_parse_phandle(pdev->dev.of_node,
 					       "mediatek,platform", 0);
+
 	if (!priv->platform_node) {
 		dev_dbg(&pdev->dev, "Property 'platform' missing or invalid\n");
 		return -EINVAL;
@@ -1034,7 +534,6 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 			priv->dp_node =
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,dptx-codec", 0);
-
 			if (!priv->dp_node) {
 				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
 			} else {
@@ -1081,8 +580,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 static int mt8195_mt6359_rt1019_rt5682_dev_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(card);
+	struct mt8195_priv *priv = snd_soc_card_get_drvdata(card);
 
 	of_node_put(priv->hdmi_node);
 	of_node_put(priv->dp_node);
@@ -1098,18 +596,13 @@ static const struct of_device_id mt8195_mt6359_rt1019_rt5682_dt_match[] = {
 };
 #endif
 
-static const struct dev_pm_ops mt8195_mt6359_rt1019_rt5682_pm_ops = {
-	.poweroff = snd_soc_poweroff,
-	.restore = snd_soc_resume,
-};
-
 static struct platform_driver mt8195_mt6359_rt1019_rt5682_driver = {
 	.driver = {
 		.name = "mt8195_mt6359_rt1019_rt5682",
 #ifdef CONFIG_OF
 		.of_match_table = mt8195_mt6359_rt1019_rt5682_dt_match,
 #endif
-		.pm = &mt8195_mt6359_rt1019_rt5682_pm_ops,
+		.pm = &mt8195_pm_ops,
 	},
 	.probe = mt8195_mt6359_rt1019_rt5682_dev_probe,
 	.remove = mt8195_mt6359_rt1019_rt5682_dev_remove,
@@ -1120,5 +613,5 @@ module_platform_driver(mt8195_mt6359_rt1019_rt5682_driver);
 /* Module information */
 MODULE_DESCRIPTION("MT8195-MT6359-RT1019-RT5682 ALSA SoC machine driver");
 MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("mt8195_mt6359_rt1019_rt5682 soc card");
diff --git a/sound/soc/mediatek/mt8195/mt8195-realtek-common.c b/sound/soc/mediatek/mt8195/mt8195-realtek-common.c
new file mode 100644
index 000000000000..2ca9ae571441
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-realtek-common.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt8195-realtek-common.c  --
+ *	common code for realtek codec used in mt8195 machine driver
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/input.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/rt5682.h>
+#include <sound/soc.h>
+#include "../../codecs/rt1011.h"
+#include "../../codecs/rt5682.h"
+#include "mt8195-common.h"
+#include "mt8195-realtek-common.h"
+
+int mt8195_etdm_rt_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				   struct snd_pcm_hw_params *params)
+{
+	/* fix BE i2s format to 32bit, clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+
+	return 0;
+}
+
+static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int rate = params_rate(params);
+	int bitwidth;
+	int ret;
+
+	bitwidth = snd_pcm_format_width(params_format(params));
+	if (bitwidth < 0) {
+		dev_err(card->dev, "invalid bit width: %d\n", bitwidth);
+		return bitwidth;
+	}
+
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x00, 0x0, 0x2, bitwidth);
+	if (ret) {
+		dev_err(card->dev, "failed to set tdm slot\n");
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1,
+				  RT5682_PLL1_S_BCLK1,
+				  rate * 64,
+				  rate * 512);
+	if (ret) {
+		dev_err(card->dev, "failed to set pll\n");
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai,
+				     RT5682_SCLK_S_PLL1,
+				     rate * 512,
+				     SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(card->dev, "failed to set sysclk\n");
+		return ret;
+	}
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 128,
+				      SND_SOC_CLOCK_OUT);
+}
+
+const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
+	.hw_params = mt8195_rt5682_etdm_hw_params,
+};
+
+int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mt8195_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_jack *jack = &priv->headset_jack;
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    jack, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	ret = snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack set failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+};
+
+static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai;
+	unsigned int rate = params_rate(params);
+	int i, ret = 0;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1011_PLL1_S_BCLK,
+					  64 * rate, 256 * rate);
+		if (ret < 0) {
+			dev_err(card->dev, "codec_dai clock not set\n");
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_sysclk(codec_dai,
+					     RT1011_FS_SYS_PRE_S_PLL1,
+					     256 * rate, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "codec_dai clock not set\n");
+			return ret;
+		}
+	}
+	return ret;
+}
+
+const struct snd_soc_ops mt8195_rt1011_etdm_ops = {
+	.hw_params = mt8195_rt1011_etdm_hw_params,
+};
+
+static struct snd_soc_codec_conf rt1011_amp_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
+void mt8195_rt1011_codec_conf(struct snd_soc_card *card)
+{
+	card->codec_conf = rt1011_amp_conf;
+	card->num_configs = ARRAY_SIZE(rt1011_amp_conf);
+}
diff --git a/sound/soc/mediatek/mt8195/mt8195-realtek-common.h b/sound/soc/mediatek/mt8195/mt8195-realtek-common.h
new file mode 100644
index 000000000000..4a2c6fe551e9
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-realtek-common.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8195-realtek-common.h  --
+ *	Mediatek 8195 realtek common header for machine driver
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT_8195_RT_COMMON_H_
+#define _MT_8195_RT_COMMON_H_
+
+#define RT1019_CODEC_DAI	"HiFi"
+#define RT1019_DEV0_NAME	"rt1019p"
+
+#define RT5682_CODEC_DAI	"rt5682-aif1"
+#define RT5682_DEV0_NAME	"rt5682.2-001a"
+
+#define RT5682S_CODEC_DAI	"rt5682s-aif1"
+#define RT5682S_DEV0_NAME	"rt5682s.2-001a"
+
+#define RT1011_CODEC_DAI	"rt1011-aif"
+#define RT1011_DEV0_NAME	"rt1011.2-0038"
+#define RT1011_DEV1_NAME	"rt1011.2-0039"
+
+extern const struct snd_soc_ops mt8195_rt5682_etdm_ops;
+extern const struct snd_soc_ops mt8195_rt1011_etdm_ops;
+
+int mt8195_etdm_rt_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				   struct snd_pcm_hw_params *params);
+int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd);
+void mt8195_rt1011_codec_conf(struct snd_soc_card *card);
+
+#endif
-- 
2.18.0

