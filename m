Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F084E5E4A
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 06:41:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D1C1725;
	Thu, 24 Mar 2022 06:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D1C1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648100503;
	bh=BE3eRAgjKqYmo5zOvVJTqkviPZb9VHwz9wgHuSxQPF0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3aHts4cws/1E+UafdWv6BCweOuhnFxgtZ1/lS1IXPuG2ajUs9bEnuPvpTjwonqdV
	 AHd/ZxR+bpQJ7scAsAkRmrk4qWy3tQwz/m56DLYu8c4YDubEKPFB9SeRQByN/pJ0dN
	 Q9Z01yC/p8o+VXxur4PoDKWTYlmLeVbH9zXBEGfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C703F8052E;
	Thu, 24 Mar 2022 06:39:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CCFFF801EC; Thu, 24 Mar 2022 06:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A8DFF801EC
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 06:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A8DFF801EC
X-UUID: 9a9ee63e58a94a3683f1e5c45480ba06-20220324
X-UUID: 9a9ee63e58a94a3683f1e5c45480ba06-20220324
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 611101395; Thu, 24 Mar 2022 13:38:57 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 24 Mar 2022 13:38:56 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 13:38:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Mar 2022 13:38:56 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v4 1/6] ASoC: mediatek: mt8195: revise
 mt8195-mt6359-rt1019-rt5682.c
Date: Thu, 24 Mar 2022 13:38:46 +0800
Message-ID: <20220324053851.27350-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220324053851.27350-1-trevor.wu@mediatek.com>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tzungbi@google.com, miles.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, aaronyu@google.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
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

Revise driver for the coming driver combination.
There are two major parts including in the patch.
1. Apply some suggested changes used in mt8195-mt6359-rt1011-rt5682.c.
2. Reorder the layout for centralizing the codec related code.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 488 +++++++++---------
 1 file changed, 240 insertions(+), 248 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index e3146311722f..a144ef188dfb 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -14,7 +14,6 @@
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/rt5682.h>
-#include <sound/sof.h>
 #include <sound/soc.h>
 #include "../../codecs/mt6359.h"
 #include "../../codecs/rt5682.h"
@@ -86,51 +85,6 @@ static const struct snd_kcontrol_new mt8195_mt6359_rt1019_rt5682_controls[] = {
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
-	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1, RT5682_PLL1_S_MCLK,
-				  rate * 256, rate * 512);
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
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 256,
-				      SND_SOC_CLOCK_OUT);
-}
-
-static const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
-	.hw_params = mt8195_rt5682_etdm_hw_params,
-};
-
 #define CKSYS_AUD_TOP_CFG 0x032c
 #define CKSYS_AUD_TOP_MON 0x0330
 
@@ -143,20 +97,20 @@ static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
-	int phase;
-	unsigned int monitor;
-	int mtkaif_calibration_num_phase;
+	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
+	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
 	int test_done_1, test_done_2, test_done_3;
 	int cycle_1, cycle_2, cycle_3;
-	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
-	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
-	int counter;
-	bool mtkaif_calibration_ok;
 	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
 	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
+	int mtkaif_calibration_num_phase;
+	bool mtkaif_calibration_ok;
+	unsigned int monitor;
+	int counter;
+	int phase;
 	int i;
 
-	dev_info(afe->dev, "%s(), start\n", __func__);
+	dev_dbg(afe->dev, "%s(), start\n", __func__);
 
 	param->mtkaif_calibration_ok = false;
 	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++) {
@@ -312,57 +266,6 @@ static int mt8195_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
-	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
-		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_jack *jack = &priv->headset_jack;
-	struct snd_soc_component *cmpnt_afe =
-		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int ret;
-
-	priv->i2so1_mclk = afe_priv->clk[MT8195_CLK_TOP_APLL12_DIV2];
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
-	/* fix BE i2s format to S24_LE, clean param mask first */
-	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
-
-	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
-
-	return 0;
-}
-
 static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream *substream)
 {
 	static const unsigned int rates[] = {
@@ -414,11 +317,8 @@ static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	unsigned int rate = params_rate(params);
-	unsigned int mclk_fs_ratio = 256;
-	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs,
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
 				      SND_SOC_CLOCK_OUT);
 }
 
@@ -432,7 +332,7 @@ static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
-	int ret = 0;
+	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
 				    &priv->dp_jack, NULL, 0);
@@ -448,7 +348,7 @@ static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
-	int ret = 0;
+	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
 				    &priv->hdmi_jack, NULL, 0);
@@ -460,7 +360,6 @@ static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
-
 {
 	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
@@ -563,6 +462,102 @@ static const struct snd_soc_ops mt8195_capture_ops = {
 	.startup = mt8195_capture_startup,
 };
 
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
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1, RT5682_PLL1_S_MCLK,
+				  rate * 256, rate * 512);
+	if (ret) {
+		dev_err(card->dev, "failed to set pll\n");
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+				     rate * 512, SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(card->dev, "failed to set sysclk\n");
+		return ret;
+	}
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 256,
+				      SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
+	.hw_params = mt8195_rt5682_etdm_hw_params,
+};
+
+static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_jack *jack = &priv->headset_jack;
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	priv->i2so1_mclk = afe_priv->clk[MT8195_CLK_TOP_APLL12_DIV2];
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
+	/* fix BE i2s format to S24_LE, clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+
+	return 0;
+}
+
 static int mt8195_set_bias_level_post(struct snd_soc_card *card,
 	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
 {
@@ -581,7 +576,6 @@ static int mt8195_set_bias_level_post(struct snd_soc_card *card,
 	    strcmp(component->name, RT5682S_DEV0_NAME)))
 		return 0;
 
-
 	switch (level) {
 	case SND_SOC_BIAS_OFF:
 		if (!__clk_is_enabled(priv->i2so1_mclk))
@@ -808,127 +802,6 @@ static const struct sof_conn_stream g_sof_conn_streams[] = {
 	{ "ETDM2_IN_BE", "AFE_SOF_UL5", SOF_DMA_UL5, SNDRV_PCM_STREAM_CAPTURE},
 };
 
-/* fixup the BE DAI link to match any values from topology */
-static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
-				 struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai_link *sof_dai_link = NULL;
-	struct snd_soc_pcm_runtime *runtime;
-	struct snd_soc_dai *cpu_dai;
-	int i, j, ret = 0;
-
-	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
-		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
-
-		if (strcmp(rtd->dai_link->name, conn->normal_link))
-			continue;
-
-		for_each_card_rtds(card, runtime) {
-			if (strcmp(runtime->dai_link->name, conn->sof_link))
-				continue;
-
-			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
-				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
-					sof_dai_link = runtime->dai_link;
-					break;
-				}
-			}
-			break;
-		}
-
-		if (sof_dai_link && sof_dai_link->be_hw_params_fixup)
-			ret = sof_dai_link->be_hw_params_fixup(runtime, params);
-
-		break;
-	}
-
-	if (!strcmp(rtd->dai_link->name, "ETDM2_IN_BE") ||
-	    !strcmp(rtd->dai_link->name, "ETDM1_OUT_BE")) {
-		mt8195_etdm_hw_params_fixup(runtime, params);
-	}
-
-	return ret;
-}
-
-static int mt8195_mt6359_rt1019_rt5682_card_late_probe(struct snd_soc_card *card)
-{
-	struct snd_soc_pcm_runtime *runtime;
-	struct snd_soc_component *sof_comp = NULL;
-	int i;
-
-	/* 1. find sof component */
-	for_each_card_rtds(card, runtime) {
-		for (i = 0; i < runtime->num_components; i++) {
-			if (!runtime->components[i]->driver->name)
-				continue;
-			if (!strcmp(runtime->components[i]->driver->name, "sof-audio-component")) {
-				sof_comp = runtime->components[i];
-				break;
-			}
-		}
-	}
-
-	if (!sof_comp) {
-		dev_info(card->dev, " probe without component\n");
-		return 0;
-	}
-	/* 2. add route path and fixup callback */
-	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
-		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
-		struct snd_soc_pcm_runtime *sof_rtd = NULL;
-		struct snd_soc_pcm_runtime *normal_rtd = NULL;
-		struct snd_soc_pcm_runtime *rtd = NULL;
-
-		for_each_card_rtds(card, rtd) {
-			if (!strcmp(rtd->dai_link->name, conn->sof_link)) {
-				sof_rtd = rtd;
-				continue;
-			}
-			if (!strcmp(rtd->dai_link->name, conn->normal_link)) {
-				normal_rtd = rtd;
-				continue;
-			}
-			if (normal_rtd && sof_rtd)
-				break;
-		}
-		if (normal_rtd && sof_rtd) {
-			int j;
-			struct snd_soc_dai *cpu_dai;
-
-			for_each_rtd_cpu_dais(sof_rtd, j, cpu_dai) {
-				struct snd_soc_dapm_route route;
-				struct snd_soc_dapm_path *p = NULL;
-				struct snd_soc_dapm_widget *play_widget =
-					cpu_dai->playback_widget;
-				struct snd_soc_dapm_widget *cap_widget =
-					cpu_dai->capture_widget;
-				memset(&route, 0, sizeof(route));
-				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE &&
-				    cap_widget) {
-					snd_soc_dapm_widget_for_each_sink_path(cap_widget, p) {
-						route.source = conn->sof_dma;
-						route.sink = p->sink->name;
-						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
-					}
-				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK &&
-						play_widget){
-					snd_soc_dapm_widget_for_each_source_path(play_widget, p) {
-						route.source = p->source->name;
-						route.sink = conn->sof_dma;
-						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
-					}
-				} else {
-					dev_err(cpu_dai->dev, "stream dir and widget not pair\n");
-				}
-			}
-			normal_rtd->dai_link->be_hw_params_fixup = mt8195_dai_link_fixup;
-		}
-	}
-
-	return 0;
-}
-
 static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 	/* FE */
 	[DAI_LINK_DL2_FE] = {
@@ -1248,6 +1121,127 @@ static struct snd_soc_card mt8195_mt6359_rt1019_rt5682_soc_card = {
 	.set_bias_level_post = mt8195_set_bias_level_post,
 };
 
+/* fixup the BE DAI link to match any values from topology */
+static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai_link *sof_dai_link = NULL;
+	struct snd_soc_pcm_runtime *runtime;
+	struct snd_soc_dai *cpu_dai;
+	int i, j, ret = 0;
+
+	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
+		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
+
+		if (strcmp(rtd->dai_link->name, conn->normal_link))
+			continue;
+
+		for_each_card_rtds(card, runtime) {
+			if (strcmp(runtime->dai_link->name, conn->sof_link))
+				continue;
+
+			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
+				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
+					sof_dai_link = runtime->dai_link;
+					break;
+				}
+			}
+			break;
+		}
+
+		if (sof_dai_link && sof_dai_link->be_hw_params_fixup)
+			ret = sof_dai_link->be_hw_params_fixup(runtime, params);
+
+		break;
+	}
+
+	if (!strcmp(rtd->dai_link->name, "ETDM2_IN_BE") ||
+	    !strcmp(rtd->dai_link->name, "ETDM1_OUT_BE")) {
+		mt8195_etdm_hw_params_fixup(runtime, params);
+	}
+
+	return ret;
+}
+
+static int mt8195_mt6359_rt1019_rt5682_card_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *runtime;
+	struct snd_soc_component *sof_comp = NULL;
+	int i;
+
+	/* 1. find sof component */
+	for_each_card_rtds(card, runtime) {
+		for (i = 0; i < runtime->num_components; i++) {
+			if (!runtime->components[i]->driver->name)
+				continue;
+			if (!strcmp(runtime->components[i]->driver->name, "sof-audio-component")) {
+				sof_comp = runtime->components[i];
+				break;
+			}
+		}
+	}
+
+	if (!sof_comp) {
+		dev_info(card->dev, " probe without component\n");
+		return 0;
+	}
+	/* 2. add route path and fixup callback */
+	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
+		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
+		struct snd_soc_pcm_runtime *sof_rtd = NULL;
+		struct snd_soc_pcm_runtime *normal_rtd = NULL;
+		struct snd_soc_pcm_runtime *rtd = NULL;
+
+		for_each_card_rtds(card, rtd) {
+			if (!strcmp(rtd->dai_link->name, conn->sof_link)) {
+				sof_rtd = rtd;
+				continue;
+			}
+			if (!strcmp(rtd->dai_link->name, conn->normal_link)) {
+				normal_rtd = rtd;
+				continue;
+			}
+			if (normal_rtd && sof_rtd)
+				break;
+		}
+		if (normal_rtd && sof_rtd) {
+			int j;
+			struct snd_soc_dai *cpu_dai;
+
+			for_each_rtd_cpu_dais(sof_rtd, j, cpu_dai) {
+				struct snd_soc_dapm_route route;
+				struct snd_soc_dapm_path *p = NULL;
+				struct snd_soc_dapm_widget *play_widget =
+					cpu_dai->playback_widget;
+				struct snd_soc_dapm_widget *cap_widget =
+					cpu_dai->capture_widget;
+				memset(&route, 0, sizeof(route));
+				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE &&
+				    cap_widget) {
+					snd_soc_dapm_widget_for_each_sink_path(cap_widget, p) {
+						route.source = conn->sof_dma;
+						route.sink = p->sink->name;
+						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+					}
+				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK &&
+						play_widget){
+					snd_soc_dapm_widget_for_each_source_path(play_widget, p) {
+						route.source = p->source->name;
+						route.sink = conn->sof_dma;
+						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+					}
+				} else {
+					dev_err(cpu_dai->dev, "stream dir and widget not pair\n");
+				}
+			}
+			normal_rtd->dai_link->be_hw_params_fixup = mt8195_dai_link_fixup;
+		}
+	}
+
+	return 0;
+}
+
 static int mt8195_dailink_parse_of(struct snd_soc_card *card, struct device_node *np,
 				   const char *propname)
 {
@@ -1322,6 +1316,18 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
+		ret = mt8195_dailink_parse_of(card, pdev->dev.of_node,
+					      "mediatek,dai-link");
+		if (ret) {
+			dev_dbg(&pdev->dev, "Parse dai-link fail\n");
+			return -EINVAL;
+		}
+	} else {
+		if (!sof_on)
+			card->num_links = DAI_LINK_REGULAR_NUM;
+	}
+
 	platform_node = of_parse_phandle(pdev->dev.of_node,
 					 "mediatek,platform", 0);
 	if (!platform_node) {
@@ -1337,19 +1343,6 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	hdmi_node = of_parse_phandle(pdev->dev.of_node,
 				     "mediatek,hdmi-codec", 0);
 
-	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
-		ret = mt8195_dailink_parse_of(card, pdev->dev.of_node,
-					      "mediatek,dai-link");
-		if (ret) {
-			dev_dbg(&pdev->dev, "Parse dai-link fail\n");
-			ret = -EINVAL;
-			goto put_node;
-		}
-	} else {
-		if (!sof_on)
-			card->num_links = DAI_LINK_REGULAR_NUM;
-	}
-
 	for_each_card_prelinks(card, i, dai_link) {
 		if (!dai_link->platforms->name) {
 			if (!strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")) && sof_on)
@@ -1399,7 +1392,6 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-put_node:
 	of_node_put(platform_node);
 	of_node_put(adsp_node);
 	of_node_put(dp_node);
-- 
2.18.0

