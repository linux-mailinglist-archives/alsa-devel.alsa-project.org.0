Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE715BF74
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:34:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BB3F167D;
	Thu, 13 Feb 2020 14:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BB3F167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581600872;
	bh=4mryckrfDMo8+mFGIWsrIHXzKNdKOblSllcqYFda8Dc=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iEAhQfsZF98nAk53TZiTtEQ81nIdYBJgaE/MZTzYCjyThsFoWkgz3mJamfd+dxFTK
	 idbacI85jWEyTMO6GadmbOrVz9q0psncxqVyFOzv3oaQcGbtIiZQYuDLVyuJL0FtuF
	 Z1+XrIGUYINr9fCwuv6a01g1yF26ZhOMwpBiBZxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB10BF8021E;
	Thu, 13 Feb 2020 14:32:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA382F80138; Thu, 13 Feb 2020 14:32:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 55BFBF80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55BFBF80138
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E3B11045;
 Thu, 13 Feb 2020 05:32:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A165D3F6CF;
 Thu, 13 Feb 2020 05:32:02 -0800 (PST)
Date: Thu, 13 Feb 2020 13:32:01 +0000
From: Mark Brown <broonie@kernel.org>
To: derek.fang <derek.fang@realtek.com>
In-Reply-To: <1581577510-1807-1-git-send-email-derek.fang@realtek.com>
Message-Id: <applied-1581577510-1807-1-git-send-email-derek.fang@realtek.com>
X-Patchwork-Hint: ignore
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt5682: Enable PLL2 function" to the
	asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: rt5682: Enable PLL2 function

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 0c48a65394ab6d2b4afde3fbe840dbb05a52d929 Mon Sep 17 00:00:00 2001
From: "derek.fang" <derek.fang@realtek.com>
Date: Thu, 13 Feb 2020 15:05:10 +0800
Subject: [PATCH] ASoC: rt5682: Enable PLL2 function

Enable RT5682 PLL2 function to implement the more complex
frequency conversion.

Signed-off-by: derek.fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/1581577510-1807-1-git-send-email-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682.c | 211 ++++++++++++++++++++++++++++++--------
 sound/soc/codecs/rt5682.h |  39 ++++++-
 2 files changed, 203 insertions(+), 47 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 82a636620131..9fbb3862f8d7 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -64,9 +64,9 @@ struct rt5682_priv {
 	int bclk[RT5682_AIFS];
 	int master[RT5682_AIFS];
 
-	int pll_src;
-	int pll_in;
-	int pll_out;
+	int pll_src[RT5682_PLLS];
+	int pll_in[RT5682_PLLS];
+	int pll_out[RT5682_PLLS];
 
 	int jack_type;
 };
@@ -75,6 +75,7 @@ static const struct reg_sequence patch_list[] = {
 	{RT5682_HP_IMP_SENS_CTRL_19, 0x1000},
 	{RT5682_DAC_ADC_DIG_VOL1, 0xa020},
 	{RT5682_I2C_CTRL, 0x000f},
+	{RT5682_PLL2_INTERNAL, 0x8266},
 };
 
 static const struct reg_default rt5682_reg[] = {
@@ -222,7 +223,7 @@ static const struct reg_default rt5682_reg[] = {
 	{0x0148, 0x0000},
 	{0x0149, 0x0000},
 	{0x0150, 0x79a1},
-	{0x0151, 0x0000},
+	{0x0156, 0xaaaa},
 	{0x0160, 0x4ec0},
 	{0x0161, 0x0080},
 	{0x0162, 0x0200},
@@ -928,10 +929,10 @@ static int rt5682_headset_detect(struct snd_soc_component *component,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB);
 		snd_soc_component_update_bits(component,
-				RT5682_PWR_ANLG_1, RT5682_PWR_FV2, 0);
+			RT5682_PWR_ANLG_1, RT5682_PWR_FV2, 0);
 		usleep_range(15000, 20000);
 		snd_soc_component_update_bits(component,
-				RT5682_PWR_ANLG_1, RT5682_PWR_FV2, RT5682_PWR_FV2);
+			RT5682_PWR_ANLG_1, RT5682_PWR_FV2, RT5682_PWR_FV2);
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_3,
 			RT5682_PWR_CBJ, RT5682_PWR_CBJ);
 
@@ -1298,6 +1299,21 @@ static int is_sys_clk_from_pll1(struct snd_soc_dapm_widget *w,
 		return 0;
 }
 
+static int is_sys_clk_from_pll2(struct snd_soc_dapm_widget *w,
+			 struct snd_soc_dapm_widget *sink)
+{
+	unsigned int val;
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+
+	val = snd_soc_component_read32(component, RT5682_GLB_CLK);
+	val &= RT5682_SCLK_SRC_MASK;
+	if (val == RT5682_SCLK_SRC_PLL2)
+		return 1;
+	else
+		return 0;
+}
+
 static int is_using_asrc(struct snd_soc_dapm_widget *w,
 			 struct snd_soc_dapm_widget *sink)
 {
@@ -1612,9 +1628,11 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("PLL2B", RT5682_PWR_ANLG_3, RT5682_PWR_PLL2B_BIT,
 		0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("PLL2F", RT5682_PWR_ANLG_3, RT5682_PWR_PLL2F_BIT,
-		0, NULL, 0),
+		0, set_filter_clk, SND_SOC_DAPM_PRE_PMU),
 	SND_SOC_DAPM_SUPPLY("Vref1", RT5682_PWR_ANLG_1, RT5682_PWR_VREF1_BIT, 0,
 		rt5655_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_SUPPLY("Vref2", RT5682_PWR_ANLG_1, RT5682_PWR_VREF2_BIT, 0,
+		NULL, 0),
 
 	/* ASRC */
 	SND_SOC_DAPM_SUPPLY_S("DAC STO1 ASRC", 1, RT5682_PLL_TRACK_1,
@@ -1796,7 +1814,11 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 	/*PLL*/
 	{"ADC Stereo1 Filter", NULL, "PLL1", is_sys_clk_from_pll1},
+	{"ADC Stereo1 Filter", NULL, "PLL2B", is_sys_clk_from_pll2},
+	{"ADC Stereo1 Filter", NULL, "PLL2F", is_sys_clk_from_pll2},
 	{"DAC Stereo1 Filter", NULL, "PLL1", is_sys_clk_from_pll1},
+	{"DAC Stereo1 Filter", NULL, "PLL2B", is_sys_clk_from_pll2},
+	{"DAC Stereo1 Filter", NULL, "PLL2F", is_sys_clk_from_pll2},
 
 	/*ASRC*/
 	{"ADC Stereo1 Filter", NULL, "ADC STO1 ASRC", is_using_asrc},
@@ -2053,8 +2075,10 @@ static int rt5682_hw_params(struct snd_pcm_substream *substream,
 			RT5682_I2S1_DL_MASK, len_1);
 		if (rt5682->master[RT5682_AIF1]) {
 			snd_soc_component_update_bits(component,
-				RT5682_ADDA_CLK_1, RT5682_I2S_M_DIV_MASK,
-				pre_div << RT5682_I2S_M_DIV_SFT);
+				RT5682_ADDA_CLK_1, RT5682_I2S_M_DIV_MASK |
+				RT5682_I2S_CLK_SRC_MASK,
+				pre_div << RT5682_I2S_M_DIV_SFT |
+				(rt5682->sysclk_src) << RT5682_I2S_CLK_SRC_SFT);
 		}
 		if (params_channels(params) == 1) /* mono mode */
 			snd_soc_component_update_bits(component,
@@ -2227,61 +2251,157 @@ static int rt5682_set_component_pll(struct snd_soc_component *component,
 		unsigned int freq_out)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	struct rl6231_pll_code pll_code;
+	struct rl6231_pll_code pll_code, pll2f_code, pll2b_code;
+	unsigned int pll2_fout1;
 	int ret;
 
-	if (source == rt5682->pll_src && freq_in == rt5682->pll_in &&
-	    freq_out == rt5682->pll_out)
+	if (source == rt5682->pll_src[pll_id] &&
+	    freq_in == rt5682->pll_in[pll_id] &&
+	    freq_out == rt5682->pll_out[pll_id])
 		return 0;
 
 	if (!freq_in || !freq_out) {
 		dev_dbg(component->dev, "PLL disabled\n");
 
-		rt5682->pll_in = 0;
-		rt5682->pll_out = 0;
+		rt5682->pll_in[pll_id] = 0;
+		rt5682->pll_out[pll_id] = 0;
 		snd_soc_component_update_bits(component, RT5682_GLB_CLK,
 			RT5682_SCLK_SRC_MASK, RT5682_SCLK_SRC_MCLK);
 		return 0;
 	}
 
-	switch (source) {
-	case RT5682_PLL1_S_MCLK:
-		snd_soc_component_update_bits(component, RT5682_GLB_CLK,
-			RT5682_PLL1_SRC_MASK, RT5682_PLL1_SRC_MCLK);
-		break;
-	case RT5682_PLL1_S_BCLK1:
-		snd_soc_component_update_bits(component, RT5682_GLB_CLK,
-				RT5682_PLL1_SRC_MASK, RT5682_PLL1_SRC_BCLK1);
-		break;
-	default:
-		dev_err(component->dev, "Unknown PLL Source %d\n", source);
-		return -EINVAL;
-	}
+	if (pll_id == RT5682_PLL2) {
+		switch (source) {
+		case RT5682_PLL2_S_MCLK:
+			snd_soc_component_update_bits(component,
+				RT5682_GLB_CLK, RT5682_PLL2_SRC_MASK,
+				RT5682_PLL2_SRC_MCLK);
+			break;
+		default:
+			dev_err(component->dev, "Unknown PLL2 Source %d\n",
+				source);
+			return -EINVAL;
+		}
 
-	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
-	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
-		return ret;
+		/**
+		 * PLL2 concatenates 2 PLL units.
+		 * We suggest the Fout of the front PLL is 3.84MHz.
+		 */
+		pll2_fout1 = 3840000;
+		ret = rl6231_pll_calc(freq_in, pll2_fout1, &pll2f_code);
+		if (ret < 0) {
+			dev_err(component->dev, "Unsupport input clock %d\n",
+				freq_in);
+			return ret;
+		}
+		dev_dbg(component->dev, "PLL2F: fin=%d fout=%d bypass=%d m=%d n=%d k=%d\n",
+			freq_in, pll2_fout1,
+			pll2f_code.m_bp,
+			(pll2f_code.m_bp ? 0 : pll2f_code.m_code),
+			pll2f_code.n_code, pll2f_code.k_code);
+
+		ret = rl6231_pll_calc(pll2_fout1, freq_out, &pll2b_code);
+		if (ret < 0) {
+			dev_err(component->dev, "Unsupport input clock %d\n",
+				pll2_fout1);
+			return ret;
+		}
+		dev_dbg(component->dev, "PLL2B: fin=%d fout=%d bypass=%d m=%d n=%d k=%d\n",
+			pll2_fout1, freq_out,
+			pll2b_code.m_bp,
+			(pll2b_code.m_bp ? 0 : pll2b_code.m_code),
+			pll2b_code.n_code, pll2b_code.k_code);
+
+		snd_soc_component_write(component, RT5682_PLL2_CTRL_1,
+			pll2f_code.k_code << RT5682_PLL2F_K_SFT |
+			pll2b_code.k_code << RT5682_PLL2B_K_SFT |
+			pll2b_code.m_code);
+		snd_soc_component_write(component, RT5682_PLL2_CTRL_2,
+			pll2f_code.m_code << RT5682_PLL2F_M_SFT |
+			pll2b_code.n_code);
+		snd_soc_component_write(component, RT5682_PLL2_CTRL_3,
+			pll2f_code.n_code << RT5682_PLL2F_N_SFT);
+		snd_soc_component_update_bits(component, RT5682_PLL2_CTRL_4,
+			RT5682_PLL2B_M_BP_MASK | RT5682_PLL2F_M_BP_MASK | 0xf,
+			(pll2b_code.m_bp ? 1 : 0) << RT5682_PLL2B_M_BP_SFT |
+			(pll2f_code.m_bp ? 1 : 0) << RT5682_PLL2F_M_BP_SFT |
+			0xf);
+	} else {
+		switch (source) {
+		case RT5682_PLL1_S_MCLK:
+			snd_soc_component_update_bits(component,
+				RT5682_GLB_CLK, RT5682_PLL1_SRC_MASK,
+				RT5682_PLL1_SRC_MCLK);
+			break;
+		case RT5682_PLL1_S_BCLK1:
+			snd_soc_component_update_bits(component,
+				RT5682_GLB_CLK, RT5682_PLL1_SRC_MASK,
+				RT5682_PLL1_SRC_BCLK1);
+			break;
+		default:
+			dev_err(component->dev, "Unknown PLL1 Source %d\n",
+				source);
+			return -EINVAL;
+		}
+
+		ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
+		if (ret < 0) {
+			dev_err(component->dev, "Unsupport input clock %d\n",
+				freq_in);
+			return ret;
+		}
+
+		dev_dbg(component->dev, "bypass=%d m=%d n=%d k=%d\n",
+			pll_code.m_bp, (pll_code.m_bp ? 0 : pll_code.m_code),
+			pll_code.n_code, pll_code.k_code);
+
+		snd_soc_component_write(component, RT5682_PLL_CTRL_1,
+			pll_code.n_code << RT5682_PLL_N_SFT | pll_code.k_code);
+		snd_soc_component_write(component, RT5682_PLL_CTRL_2,
+		    (pll_code.m_bp ? 0 : pll_code.m_code) << RT5682_PLL_M_SFT |
+		    pll_code.m_bp << RT5682_PLL_M_BP_SFT | RT5682_PLL_RST);
 	}
 
-	dev_dbg(component->dev, "bypass=%d m=%d n=%d k=%d\n",
-		pll_code.m_bp, (pll_code.m_bp ? 0 : pll_code.m_code),
-		pll_code.n_code, pll_code.k_code);
+	rt5682->pll_in[pll_id] = freq_in;
+	rt5682->pll_out[pll_id] = freq_out;
+	rt5682->pll_src[pll_id] = source;
+
+	return 0;
+}
+
+static int rt5682_set_bclk1_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
-	snd_soc_component_write(component, RT5682_PLL_CTRL_1,
-		pll_code.n_code << RT5682_PLL_N_SFT | pll_code.k_code);
-	snd_soc_component_write(component, RT5682_PLL_CTRL_2,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT5682_PLL_M_SFT |
-		pll_code.m_bp << RT5682_PLL_M_BP_SFT | RT5682_PLL_RST);
+	rt5682->bclk[dai->id] = ratio;
 
-	rt5682->pll_in = freq_in;
-	rt5682->pll_out = freq_out;
-	rt5682->pll_src = source;
+	switch (ratio) {
+	case 256:
+		snd_soc_component_update_bits(component, RT5682_TDM_TCON_CTRL,
+			RT5682_TDM_BCLK_MS1_MASK, RT5682_TDM_BCLK_MS1_256);
+		break;
+	case 128:
+		snd_soc_component_update_bits(component, RT5682_TDM_TCON_CTRL,
+			RT5682_TDM_BCLK_MS1_MASK, RT5682_TDM_BCLK_MS1_128);
+		break;
+	case 64:
+		snd_soc_component_update_bits(component, RT5682_TDM_TCON_CTRL,
+			RT5682_TDM_BCLK_MS1_MASK, RT5682_TDM_BCLK_MS1_64);
+		break;
+	case 32:
+		snd_soc_component_update_bits(component, RT5682_TDM_TCON_CTRL,
+			RT5682_TDM_BCLK_MS1_MASK, RT5682_TDM_BCLK_MS1_32);
+		break;
+	default:
+		dev_err(dai->dev, "Invalid bclk1 ratio %d\n", ratio);
+		return -EINVAL;
+	}
 
 	return 0;
 }
 
-static int rt5682_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+static int rt5682_set_bclk2_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
@@ -2300,7 +2420,7 @@ static int rt5682_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 			RT5682_I2S2_BCLK_MS2_32);
 		break;
 	default:
-		dev_err(dai->dev, "Invalid bclk ratio %d\n", ratio);
+		dev_err(dai->dev, "Invalid bclk2 ratio %d\n", ratio);
 		return -EINVAL;
 	}
 
@@ -2389,12 +2509,13 @@ static const struct snd_soc_dai_ops rt5682_aif1_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_tdm_slot = rt5682_set_tdm_slot,
+	.set_bclk_ratio = rt5682_set_bclk1_ratio,
 };
 
 static const struct snd_soc_dai_ops rt5682_aif2_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
-	.set_bclk_ratio = rt5682_set_bclk_ratio,
+	.set_bclk_ratio = rt5682_set_bclk2_ratio,
 };
 
 static struct snd_soc_dai_driver rt5682_dai[] = {
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 4d3a8c41546e..465c99b7f906 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -177,7 +177,7 @@
 #define RT5682_TEST_MODE_CTRL_4			0x0148
 #define RT5682_TEST_MODE_CTRL_5			0x0149
 #define RT5682_PLL1_INTERNAL			0x0150
-#define RT5682_PLL2_INTERNAL			0x0151
+#define RT5682_PLL2_INTERNAL			0x0156
 #define RT5682_STO_NG2_CTRL_1			0x0160
 #define RT5682_STO_NG2_CTRL_2			0x0161
 #define RT5682_STO_NG2_CTRL_3			0x0162
@@ -738,7 +738,7 @@
 #define RT5682_ADC_OSR_D_24			(0x7 << 12)
 #define RT5682_ADC_OSR_D_32			(0x8 << 12)
 #define RT5682_ADC_OSR_D_48			(0x9 << 12)
-#define RT5682_I2S_M_DIV_MASK			(0xf << 12)
+#define RT5682_I2S_M_DIV_MASK			(0xf << 8)
 #define RT5682_I2S_M_DIV_SFT			8
 #define RT5682_I2S_M_D_1			(0x0 << 8)
 #define RT5682_I2S_M_D_2			(0x1 << 8)
@@ -820,6 +820,12 @@
 #define RT5682_TDM_DF_PCM_B			(0x3 << 11)
 #define RT5682_TDM_DF_PCM_A_N			(0x6 << 11)
 #define RT5682_TDM_DF_PCM_B_N			(0x7 << 11)
+#define RT5682_TDM_BCLK_MS1_MASK		(0x3 << 9)
+#define RT5682_TDM_BCLK_MS1_SFT			9
+#define RT5682_TDM_BCLK_MS1_32			(0x0 << 9)
+#define RT5682_TDM_BCLK_MS1_64			(0x1 << 9)
+#define RT5682_TDM_BCLK_MS1_128			(0x2 << 9)
+#define RT5682_TDM_BCLK_MS1_256			(0x3 << 9)
 #define RT5682_TDM_CL_MASK			(0x3 << 4)
 #define RT5682_TDM_CL_16			(0x0 << 4)
 #define RT5682_TDM_CL_20			(0x1 << 4)
@@ -1049,6 +1055,28 @@
 #define RT5682_PWR_CLK1M_PD			(0x0 << 8)
 #define RT5682_PWR_CLK1M_PU			(0x1 << 8)
 
+/* PLL2 M/N/K Code Control 1 (0x009b) */
+#define RT5682_PLL2F_K_MASK			(0x1f << 8)
+#define RT5682_PLL2F_K_SFT			8
+#define RT5682_PLL2B_K_MASK			(0xf << 4)
+#define RT5682_PLL2B_K_SFT			4
+#define RT5682_PLL2B_M_MASK			(0xf << 0)
+
+/* PLL2 M/N/K Code Control 2 (0x009c) */
+#define RT5682_PLL2F_M_MASK			(0x3f << 8)
+#define RT5682_PLL2F_M_SFT			8
+#define RT5682_PLL2B_N_MASK			(0x3f << 0)
+
+/* PLL2 M/N/K Code Control 2 (0x009d) */
+#define RT5682_PLL2F_N_MASK			(0x7f << 8)
+#define RT5682_PLL2F_N_SFT			8
+
+/* PLL2 M/N/K Code Control 2 (0x009e) */
+#define RT5682_PLL2B_M_BP_MASK			(0x1 << 11)
+#define RT5682_PLL2B_M_BP_SFT			11
+#define RT5682_PLL2F_M_BP_MASK			(0x1 << 7)
+#define RT5682_PLL2F_M_BP_SFT			7
+
 /* RC Clock Control (0x009f) */
 #define RT5682_POW_IRQ				(0x1 << 15)
 #define RT5682_POW_JDH				(0x1 << 14)
@@ -1315,6 +1343,13 @@ enum {
 	RT5682_PLL1_S_MCLK,
 	RT5682_PLL1_S_BCLK1,
 	RT5682_PLL1_S_RCCLK,
+	RT5682_PLL2_S_MCLK,
+};
+
+enum {
+	RT5682_PLL1,
+	RT5682_PLL2,
+	RT5682_PLLS,
 };
 
 enum {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
