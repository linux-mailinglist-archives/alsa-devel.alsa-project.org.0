Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BA3B6C48
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jun 2021 03:51:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD9E1681;
	Tue, 29 Jun 2021 03:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD9E1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624931481;
	bh=8G9GF/qte5RyVBFeNM8sLG6X7q35L90BaMhqECex7os=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZ3RIeZYtk5dR8E85XcmckdCbpdESldbF95U64VupPnvxeXU+uRqy8wYWMESoftae
	 V9AIFra7efjW9V+4uUtbv82mqSdeivsAanXzurY+H39Y3JSk+ArO4ZpqlYFMSwyr8Y
	 43O82hJQqO3m56q40qOEJYZqIVg5h0a8iQgQnpEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94955F804FB;
	Tue, 29 Jun 2021 03:48:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED31F804E3; Tue, 29 Jun 2021 03:48:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 492EAF804D8
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 03:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 492EAF804D8
X-UUID: 2fb1b68ea09c42a9815fbe873d49d90a-20210629
X-UUID: 2fb1b68ea09c42a9815fbe873d49d90a-20210629
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 956535071; Tue, 29 Jun 2021 09:47:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 09:47:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Jun 2021 09:47:52 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 7/8] ASoC: mediatek: mt8195: add machine driver with mt6359,
 rt1019 and rt5682
Date: Tue, 29 Jun 2021 09:47:35 +0800
Message-ID: <20210629014736.31153-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210629014736.31153-1-trevor.wu@mediatek.com>
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, aaronyu@google.com,
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

This patch adds support for mt8195 board with mt6359, rt1019 and rt5682.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/mediatek/Kconfig                    |  14 +
 sound/soc/mediatek/mt8195/Makefile            |   3 +
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 977 ++++++++++++++++++
 3 files changed, 994 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3389f382be06..bfee954d0c7c 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -193,3 +193,17 @@ config SND_SOC_MT8195
 	  that can be used with other codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8195_MT6359_RT1019_RT5682
+	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019 RT5682 codec"
+	depends on I2C
+	depends on SND_SOC_MT8195
+	select SND_SOC_MT6359
+	select SND_SOC_RT1015P
+	select SND_SOC_RT5682_I2C
+	select SND_SOC_DMIC
+	help
+	  This adds ASoC driver for Mediatek MT8195 boards
+	  with the MT6359 RT1019 RT5682 audio codec.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/mt8195/Makefile b/sound/soc/mediatek/mt8195/Makefile
index b2c9fd88f39e..883038c7dc3f 100644
--- a/sound/soc/mediatek/mt8195/Makefile
+++ b/sound/soc/mediatek/mt8195/Makefile
@@ -9,3 +9,6 @@ snd-soc-mt8195-afe-objs := \
 	mt8195-dai-pcm.o
 
 obj-$(CONFIG_SND_SOC_MT8195) += snd-soc-mt8195-afe.o
+
+# machine driver
+obj-$(CONFIG_SND_SOC_MT8195_MT6359_RT1019_RT5682) += mt8195-mt6359-rt1019-rt5682.o
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
new file mode 100644
index 000000000000..58ed9799ca14
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -0,0 +1,977 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8195-mt6359-rt1019-rt5682.c  --
+//	MT8195-MT6359-RT1019-RT6358 ALSA SoC machine driver
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Trevor Wu <trevor.wu@mediatek.com>
+//
+
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/rt5682.h>
+#include <sound/soc.h>
+#include "../../codecs/mt6359.h"
+#include "../../codecs/rt5682.h"
+#include "../common/mtk-afe-platform-driver.h"
+#include "mt8195-afe-common.h"
+
+#define RT1019_CODEC_DAI	"HiFi"
+#define RT1019_DEV0_NAME	"rt1019p"
+
+#define RT5682_CODEC_DAI	"rt5682-aif1"
+#define RT5682_DEV0_NAME	"rt5682.2-001a"
+
+struct mt8195_mt6359_rt1019_rt5682_priv {
+	struct snd_soc_jack headset_jack;
+};
+
+static const struct snd_soc_dapm_widget
+	mt8195_mt6359_rt1019_rt5682_widgets[] = {
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route mt8195_mt6359_rt1019_rt5682_routes[] = {
+	/* speaker */
+	{ "Speakers", NULL, "Speaker" },
+	/* headset */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+};
+
+static const struct snd_kcontrol_new mt8195_mt6359_rt1019_rt5682_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int rate = params_rate(params);
+	unsigned int mclk_fs_ratio = 128;
+	unsigned int mclk_fs = rate * mclk_fs_ratio;
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
+				  params_rate(params) * 64,
+				  params_rate(params) * 512);
+	if (ret) {
+		dev_err(card->dev, "failed to set pll\n");
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai,
+				     RT5682_SCLK_S_PLL1,
+				     params_rate(params) * 512,
+				     SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(card->dev, "failed to set sysclk\n");
+		return ret;
+	}
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
+	.hw_params = mt8195_rt5682_etdm_hw_params,
+};
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
+	int phase;
+	unsigned int monitor;
+	int mtkaif_calibration_num_phase;
+	int test_done_1, test_done_2, test_done_3;
+	int cycle_1, cycle_2, cycle_3;
+	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
+	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
+	int counter;
+	bool mtkaif_calibration_ok;
+	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
+	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
+	int i;
+
+	dev_info(afe->dev, "%s(), start\n", __func__);
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
+static int mt8195_mt6359_init(struct snd_soc_pcm_runtime *rtd)
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
+static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
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
+static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				       struct snd_pcm_hw_params *params)
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
+static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	unsigned int rate = params_rate(params);
+	unsigned int mclk_fs_ratio = 256;
+	unsigned int mclk_fs = rate * mclk_fs_ratio;
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs,
+				      SND_SOC_CLOCK_OUT);
+}
+
+static struct snd_soc_ops mt8195_dptx_ops = {
+	.hw_params = mt8195_dptx_hw_params,
+};
+
+static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				       struct snd_pcm_hw_params *params)
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
+static const struct snd_soc_ops mt8195_playback_ops = {
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
+static const struct snd_soc_ops mt8195_capture_ops = {
+	.startup = mt8195_capture_startup,
+};
+
+enum {
+	DAI_LINK_DL2_FE,
+	DAI_LINK_DL3_FE,
+	DAI_LINK_DL6_FE,
+	DAI_LINK_DL7_FE,
+	DAI_LINK_DL8_FE,
+	DAI_LINK_DL10_FE,
+	DAI_LINK_DL11_FE,
+	DAI_LINK_UL1_FE,
+	DAI_LINK_UL2_FE,
+	DAI_LINK_UL3_FE,
+	DAI_LINK_UL4_FE,
+	DAI_LINK_UL5_FE,
+	DAI_LINK_UL6_FE,
+	DAI_LINK_UL8_FE,
+	DAI_LINK_UL9_FE,
+	DAI_LINK_UL10_FE,
+	DAI_LINK_DL_SRC_BE,
+	DAI_LINK_DPTX_BE,
+	DAI_LINK_ETDM1_IN_BE,
+	DAI_LINK_ETDM2_IN_BE,
+	DAI_LINK_ETDM1_OUT_BE,
+	DAI_LINK_ETDM2_OUT_BE,
+	DAI_LINK_ETDM3_OUT_BE,
+	DAI_LINK_PCM1_BE,
+	DAI_LINK_UL_SRC1_BE,
+	DAI_LINK_UL_SRC2_BE,
+};
+
+/* FE */
+SND_SOC_DAILINK_DEFS(DL2_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(DL3_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(DL6_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(DL7_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL7")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(DL8_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL8")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(DL10_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL10")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(DL11_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL11")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL1_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL2_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL3_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL4_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL5_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL6_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL8_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL8")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL9_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL9")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL10_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL10")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* BE */
+SND_SOC_DAILINK_DEFS(DL_SRC_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL_SRC")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif1")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(DPTX_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DPTX")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM1_IN_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_IN")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_IN")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
+						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
+						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1019_DEV0_NAME,
+						   RT1019_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM3_OUT_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM3_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(PCM1_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("PCM1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL_SRC1_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC1")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif1"),
+					COMP_CODEC("dmic-codec",
+						   "dmic-hifi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL_SRC2_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC2")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif2")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
+	/* FE */
+	[DAI_LINK_DL2_FE] = {
+		.name = "DL2_FE",
+		.stream_name = "DL2 Playback",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8195_playback_ops,
+		SND_SOC_DAILINK_REG(DL2_FE),
+	},
+	[DAI_LINK_DL3_FE] = {
+		.name = "DL3_FE",
+		.stream_name = "DL3 Playback",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8195_playback_ops,
+		SND_SOC_DAILINK_REG(DL3_FE),
+	},
+	[DAI_LINK_DL6_FE] = {
+		.name = "DL6_FE",
+		.stream_name = "DL6 Playback",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8195_playback_ops,
+		SND_SOC_DAILINK_REG(DL6_FE),
+	},
+	[DAI_LINK_DL7_FE] = {
+		.name = "DL7_FE",
+		.stream_name = "DL7 Playback",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_PRE,
+			SND_SOC_DPCM_TRIGGER_PRE,
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(DL7_FE),
+	},
+	[DAI_LINK_DL8_FE] = {
+		.name = "DL8_FE",
+		.stream_name = "DL8 Playback",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8195_playback_ops,
+		SND_SOC_DAILINK_REG(DL8_FE),
+	},
+	[DAI_LINK_DL10_FE] = {
+		.name = "DL10_FE",
+		.stream_name = "DL10 Playback",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(DL10_FE),
+	},
+	[DAI_LINK_DL11_FE] = {
+		.name = "DL11_FE",
+		.stream_name = "DL11 Playback",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8195_playback_ops,
+		SND_SOC_DAILINK_REG(DL11_FE),
+	},
+	[DAI_LINK_UL1_FE] = {
+		.name = "UL1_FE",
+		.stream_name = "UL1 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_PRE,
+			SND_SOC_DPCM_TRIGGER_PRE,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(UL1_FE),
+	},
+	[DAI_LINK_UL2_FE] = {
+		.name = "UL2_FE",
+		.stream_name = "UL2 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8195_capture_ops,
+		SND_SOC_DAILINK_REG(UL2_FE),
+	},
+	[DAI_LINK_UL3_FE] = {
+		.name = "UL3_FE",
+		.stream_name = "UL3 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8195_capture_ops,
+		SND_SOC_DAILINK_REG(UL3_FE),
+	},
+	[DAI_LINK_UL4_FE] = {
+		.name = "UL4_FE",
+		.stream_name = "UL4 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8195_capture_ops,
+		SND_SOC_DAILINK_REG(UL4_FE),
+	},
+	[DAI_LINK_UL5_FE] = {
+		.name = "UL5_FE",
+		.stream_name = "UL5 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8195_capture_ops,
+		SND_SOC_DAILINK_REG(UL5_FE),
+	},
+	[DAI_LINK_UL6_FE] = {
+		.name = "UL6_FE",
+		.stream_name = "UL6 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_PRE,
+			SND_SOC_DPCM_TRIGGER_PRE,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(UL6_FE),
+	},
+	[DAI_LINK_UL8_FE] = {
+		.name = "UL8_FE",
+		.stream_name = "UL8 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8195_capture_ops,
+		SND_SOC_DAILINK_REG(UL8_FE),
+	},
+	[DAI_LINK_UL9_FE] = {
+		.name = "UL9_FE",
+		.stream_name = "UL9 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8195_capture_ops,
+		SND_SOC_DAILINK_REG(UL9_FE),
+	},
+	[DAI_LINK_UL10_FE] = {
+		.name = "UL10_FE",
+		.stream_name = "UL10 Capture",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8195_capture_ops,
+		SND_SOC_DAILINK_REG(UL10_FE),
+	},
+	/* BE */
+	[DAI_LINK_DL_SRC_BE] = {
+		.name = "DL_SRC_BE",
+		.init = mt8195_mt6359_init,
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(DL_SRC_BE),
+	},
+	[DAI_LINK_DPTX_BE] = {
+		.name = "DPTX_BE",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8195_dptx_ops,
+		.be_hw_params_fixup = mt8195_dptx_hw_params_fixup,
+		SND_SOC_DAILINK_REG(DPTX_BE),
+	},
+	[DAI_LINK_ETDM1_IN_BE] = {
+		.name = "ETDM1_IN_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ETDM1_IN_BE),
+	},
+	[DAI_LINK_ETDM2_IN_BE] = {
+		.name = "ETDM2_IN_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		.init = mt8195_rt5682_init,
+		.ops = &mt8195_rt5682_etdm_ops,
+		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
+		SND_SOC_DAILINK_REG(ETDM2_IN_BE),
+	},
+	[DAI_LINK_ETDM1_OUT_BE] = {
+		.name = "ETDM1_OUT_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		.ops = &mt8195_rt5682_etdm_ops,
+		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
+		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
+	},
+	[DAI_LINK_ETDM2_OUT_BE] = {
+		.name = "ETDM2_OUT_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(ETDM2_OUT_BE),
+	},
+	[DAI_LINK_ETDM3_OUT_BE] = {
+		.name = "ETDM3_OUT_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(ETDM3_OUT_BE),
+	},
+	[DAI_LINK_PCM1_BE] = {
+		.name = "PCM1_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(PCM1_BE),
+	},
+	[DAI_LINK_UL_SRC1_BE] = {
+		.name = "UL_SRC1_BE",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(UL_SRC1_BE),
+	},
+	[DAI_LINK_UL_SRC2_BE] = {
+		.name = "UL_SRC2_BE",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(UL_SRC2_BE),
+	},
+};
+
+static struct snd_soc_card mt8195_mt6359_rt1019_rt5682_soc_card = {
+	.name = "mt8195_mt6359_rt1019_rt5682",
+	.owner = THIS_MODULE,
+	.dai_link = mt8195_mt6359_rt1019_rt5682_dai_links,
+	.num_links = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_dai_links),
+	.controls = mt8195_mt6359_rt1019_rt5682_controls,
+	.num_controls = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_controls),
+	.dapm_widgets = mt8195_mt6359_rt1019_rt5682_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_widgets),
+	.dapm_routes = mt8195_mt6359_rt1019_rt5682_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_routes),
+};
+
+static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
+	struct device_node *platform_node;
+	struct snd_soc_dai_link *dai_link;
+	struct mt8195_mt6359_rt1019_rt5682_priv *priv = NULL;
+
+	int ret, i;
+
+	card->dev = &pdev->dev;
+
+	platform_node = of_parse_phandle(pdev->dev.of_node,
+					 "mediatek,platform", 0);
+	if (!platform_node) {
+		dev_dbg(&pdev->dev, "Property 'platform' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (!dai_link->platforms->name)
+			dai_link->platforms->of_node = platform_node;
+	}
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret)
+		dev_dbg(&pdev->dev, "%s snd_soc_register_card fail %d\n",
+			__func__, ret);
+	return ret;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id mt8195_mt6359_rt1019_rt5682_dt_match[] = {
+	{.compatible = "mediatek,mt8195_mt6359_rt1019_rt5682",},
+	{}
+};
+#endif
+
+static const struct dev_pm_ops mt8195_mt6359_rt1019_rt5682_pm_ops = {
+	.poweroff = snd_soc_poweroff,
+	.restore = snd_soc_resume,
+};
+
+static struct platform_driver mt8195_mt6359_rt1019_rt5682_driver = {
+	.driver = {
+		.name = "mt8195_mt6359_rt1019_rt5682",
+#ifdef CONFIG_OF
+		.of_match_table = mt8195_mt6359_rt1019_rt5682_dt_match,
+#endif
+		.pm = &mt8195_mt6359_rt1019_rt5682_pm_ops,
+	},
+	.probe = mt8195_mt6359_rt1019_rt5682_dev_probe,
+};
+
+module_platform_driver(mt8195_mt6359_rt1019_rt5682_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8195-MT6359-RT1019-RT5682 ALSA SoC machine driver");
+MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("mt8195_mt6359_rt1019_rt5682 soc card");
-- 
2.18.0

