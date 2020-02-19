Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8C163877
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:21:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E1B71702;
	Wed, 19 Feb 2020 01:21:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E1B71702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071718;
	bh=JXmDCaubVcNcEJTNZQBKciA5gwQVemHpKo+MsSzaA8Q=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BBc/zToqRsgumsyVGyb6nsE+Y2BiqxunsEf17Tat6L2tv1i5+ZMghaSZFIu+oLlN/
	 74S9yG7HJX4MMCvNWzkBC3F+SRTIB33IVQXQrSOIvIvin5dMFvk5tbCOLb073nwJ7x
	 rrnCRWWwsYuq6tVqRQmLtJr6K8CpguOJvTUfcPJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C3DDF80344;
	Wed, 19 Feb 2020 01:10:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00FFCF80342; Wed, 19 Feb 2020 01:10:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D33DF80340
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D33DF80340
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7001F1FB;
 Tue, 18 Feb 2020 16:10:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1D463F68F;
 Tue, 18 Feb 2020 16:10:29 -0800 (PST)
Date: Wed, 19 Feb 2020 00:10:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Derek Fang <derek.fang@realtek.com>
Subject: Applied "ASoC: rt5682: Add CCF usage for providing I2S clks" to the
 asoc tree
In-Reply-To: <1582033912-6841-1-git-send-email-derek.fang@realtek.com>
Message-Id: <applied-1582033912-6841-1-git-send-email-derek.fang@realtek.com>
X-Patchwork-Hint: ignore
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

The patch

   ASoC: rt5682: Add CCF usage for providing I2S clks

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

From ebbfabc16d23dfd20eecd4b6e68212fec37ae7c6 Mon Sep 17 00:00:00 2001
From: Derek Fang <derek.fang@realtek.com>
Date: Tue, 18 Feb 2020 21:51:51 +0800
Subject: [PATCH] ASoC: rt5682: Add CCF usage for providing I2S clks

There is a need to use RT5682 as DAI clock master for other codecs
within a platform, which means that the DAI clocks are required to
remain, regardless of whether the RT5682 is actually running
playback/capture.

The RT5682 CCF basic functions are implemented almost by the existing
internal functions and asoc apis. It needs a clk provider (rt5682 mclk)
to generate the bclk and wclk outputs.

The RT5682 CCF supports and restricts as below:
1. Fmt of DAI-AIF1 must be configured to master before using CCF.
2. Only accept a 48MHz clk as the clk provider.
3. Only provide a 48kHz wclk and a set of multiples of wclk as bclk.

There are some temporary limitations in this patch until a better
implementation.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/1582033912-6841-1-git-send-email-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/rt5682.h    |   8 +
 sound/soc/codecs/rt5682.c | 407 +++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/rt5682.h |   4 +-
 3 files changed, 415 insertions(+), 4 deletions(-)

diff --git a/include/sound/rt5682.h b/include/sound/rt5682.h
index bc2c31734df1..6bf0e3581056 100644
--- a/include/sound/rt5682.h
+++ b/include/sound/rt5682.h
@@ -24,6 +24,12 @@ enum rt5682_jd_src {
 	RT5682_JD1,
 };
 
+enum rt5682_dai_clks {
+	RT5682_DAI_WCLK_IDX,
+	RT5682_DAI_BCLK_IDX,
+	RT5682_DAI_NUM_CLKS,
+};
+
 struct rt5682_platform_data {
 
 	int ldo1_en; /* GPIO for LDO1_EN */
@@ -32,6 +38,8 @@ struct rt5682_platform_data {
 	enum rt5682_dmic1_clk_pin dmic1_clk_pin;
 	enum rt5682_jd_src jd_src;
 	unsigned int btndet_delay;
+
+	const char *dai_clk_names[RT5682_DAI_NUM_CLKS];
 };
 
 #endif
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 9fbb3862f8d7..6774813e0eea 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -27,6 +27,9 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 #include <sound/rt5682.h>
 
 #include "rl6231.h"
@@ -45,6 +48,8 @@ static const struct rt5682_platform_data i2s_default_platform_data = {
 	.dmic1_clk_pin = RT5682_DMIC1_CLK_GPIO3,
 	.jd_src = RT5682_JD1,
 	.btndet_delay = 16,
+	.dai_clk_names[RT5682_DAI_WCLK_IDX] = "rt5682-dai-wclk",
+	.dai_clk_names[RT5682_DAI_BCLK_IDX] = "rt5682-dai-bclk",
 };
 
 struct rt5682_priv {
@@ -58,6 +63,13 @@ struct rt5682_priv {
 	struct mutex calibrate_mutex;
 	bool is_sdw;
 
+#ifdef CONFIG_COMMON_CLK
+	struct clk_hw dai_clks_hw[RT5682_DAI_NUM_CLKS];
+	struct clk_lookup *dai_clks_lookup[RT5682_DAI_NUM_CLKS];
+	struct clk *dai_clks[RT5682_DAI_NUM_CLKS];
+	struct clk *mclk;
+#endif
+
 	int sysclk;
 	int sysclk_src;
 	int lrck[RT5682_AIFS];
@@ -921,6 +933,7 @@ static int rt5682_headset_detect(struct snd_soc_component *component,
 		int jack_insert)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = &component->dapm;
 	unsigned int val, count;
 
 	if (jack_insert) {
@@ -963,8 +976,13 @@ static int rt5682_headset_detect(struct snd_soc_component *component,
 		rt5682_enable_push_button_irq(component, false);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
 			RT5682_TRIG_JD_MASK, RT5682_TRIG_JD_LOW);
-		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
-			RT5682_PWR_VREF2 | RT5682_PWR_MB, 0);
+		if (snd_soc_dapm_get_pin_status(dapm, "MICBIAS"))
+			snd_soc_component_update_bits(component,
+				RT5682_PWR_ANLG_1, RT5682_PWR_VREF2, 0);
+		else
+			snd_soc_component_update_bits(component,
+				RT5682_PWR_ANLG_1,
+				RT5682_PWR_VREF2 | RT5682_PWR_MB, 0);
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_3,
 			RT5682_PWR_CBJ, 0);
 
@@ -1633,6 +1651,7 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 		rt5655_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY("Vref2", RT5682_PWR_ANLG_1, RT5682_PWR_VREF2_BIT, 0,
 		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MICBIAS", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	/* ASRC */
 	SND_SOC_DAPM_SUPPLY_S("DAC STO1 ASRC", 1, RT5682_PLL_TRACK_1,
@@ -2459,12 +2478,380 @@ static int rt5682_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+#ifdef CONFIG_COMMON_CLK
+#define CLK_PLL2_FIN 48000000
+#define CLK_PLL2_FOUT 24576000
+#define CLK_48 48000
+
+static bool rt5682_clk_check(struct rt5682_priv *rt5682)
+{
+	if (!rt5682->master[RT5682_AIF1]) {
+		dev_err(rt5682->component->dev, "sysclk/dai not set correctly\n");
+		return false;
+	}
+	return true;
+}
+
+static int rt5682_wclk_prepare(struct clk_hw *hw)
+{
+	struct rt5682_priv *rt5682 =
+		container_of(hw, struct rt5682_priv,
+			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
+	struct snd_soc_component *component = rt5682->component;
+	struct snd_soc_dapm_context *dapm =
+			snd_soc_component_get_dapm(component);
+
+	if (!rt5682_clk_check(rt5682))
+		return -EINVAL;
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS");
+	snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
+				RT5682_PWR_MB, RT5682_PWR_MB);
+	snd_soc_dapm_force_enable_pin_unlocked(dapm, "I2S1");
+	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PLL2F");
+	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PLL2B");
+	snd_soc_dapm_sync_unlocked(dapm);
+
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 0;
+}
+
+static void rt5682_wclk_unprepare(struct clk_hw *hw)
+{
+	struct rt5682_priv *rt5682 =
+		container_of(hw, struct rt5682_priv,
+			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
+	struct snd_soc_component *component = rt5682->component;
+	struct snd_soc_dapm_context *dapm =
+			snd_soc_component_get_dapm(component);
+
+	if (!rt5682_clk_check(rt5682))
+		return;
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS");
+	if (!rt5682->jack_type)
+		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
+				RT5682_PWR_MB, 0);
+	snd_soc_dapm_disable_pin_unlocked(dapm, "I2S1");
+	snd_soc_dapm_disable_pin_unlocked(dapm, "PLL2F");
+	snd_soc_dapm_disable_pin_unlocked(dapm, "PLL2B");
+	snd_soc_dapm_sync_unlocked(dapm);
+
+	snd_soc_dapm_mutex_unlock(dapm);
+}
+
+static unsigned long rt5682_wclk_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct rt5682_priv *rt5682 =
+		container_of(hw, struct rt5682_priv,
+			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
+
+	if (!rt5682_clk_check(rt5682))
+		return 0;
+	/*
+	 * Only accept to set wclk rate to 48kHz temporarily.
+	 */
+	return CLK_48;
+}
+
+static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *parent_rate)
+{
+	struct rt5682_priv *rt5682 =
+		container_of(hw, struct rt5682_priv,
+			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
+
+	if (!rt5682_clk_check(rt5682))
+		return -EINVAL;
+	/*
+	 * Only accept to set wclk rate to 48kHz temporarily.
+	 */
+	return CLK_48;
+}
+
+static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct rt5682_priv *rt5682 =
+		container_of(hw, struct rt5682_priv,
+			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
+	struct snd_soc_component *component = rt5682->component;
+	struct clk *parent_clk;
+	const char * const clk_name = __clk_get_name(hw->clk);
+	int pre_div;
+
+	if (!rt5682_clk_check(rt5682))
+		return -EINVAL;
+
+	/*
+	 * Whether the wclk's parent clk (mclk) exists or not, please ensure
+	 * it is fixed or set to 48MHz before setting wclk rate. It's a
+	 * temporary limitation. Only accept 48MHz clk as the clk provider.
+	 *
+	 * It will set the codec anyway by assuming mclk is 48MHz.
+	 */
+	parent_clk = clk_get_parent(hw->clk);
+	if (!parent_clk)
+		dev_warn(component->dev,
+			"Parent mclk of wclk not acquired in driver. Please ensure mclk was provided as %d Hz.\n",
+			CLK_PLL2_FIN);
+
+	if (parent_rate != CLK_PLL2_FIN)
+		dev_warn(component->dev, "clk %s only support %d Hz input\n",
+			clk_name, CLK_PLL2_FIN);
+
+	/*
+	 * It's a temporary limitation. Only accept to set wclk rate to 48kHz.
+	 * It will force wclk to 48kHz even it's not.
+	 */
+	if (rate != CLK_48) {
+		dev_warn(component->dev, "clk %s only support %d Hz output\n",
+			clk_name, CLK_48);
+		rate = CLK_48;
+	}
+
+	/*
+	 * To achieve the rate conversion from 48MHz to 48kHz, PLL2 is needed.
+	 */
+	rt5682_set_component_pll(component, RT5682_PLL2, RT5682_PLL2_S_MCLK,
+		CLK_PLL2_FIN, CLK_PLL2_FOUT);
+
+	rt5682_set_component_sysclk(component, RT5682_SCLK_S_PLL2, 0,
+		CLK_PLL2_FOUT, SND_SOC_CLOCK_IN);
+
+	pre_div = rl6231_get_clk_info(rt5682->sysclk, rate);
+
+	snd_soc_component_update_bits(component, RT5682_ADDA_CLK_1,
+		RT5682_I2S_M_DIV_MASK | RT5682_I2S_CLK_SRC_MASK,
+		pre_div << RT5682_I2S_M_DIV_SFT |
+		(rt5682->sysclk_src) << RT5682_I2S_CLK_SRC_SFT);
+
+	return 0;
+}
+
+static unsigned long rt5682_bclk_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct rt5682_priv *rt5682 =
+		container_of(hw, struct rt5682_priv,
+			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
+	struct snd_soc_component *component = rt5682->component;
+	unsigned int bclks_per_wclk;
+
+	snd_soc_component_read(component, RT5682_TDM_TCON_CTRL,
+				&bclks_per_wclk);
+
+	switch (bclks_per_wclk & RT5682_TDM_BCLK_MS1_MASK) {
+	case RT5682_TDM_BCLK_MS1_256:
+		return parent_rate * 256;
+	case RT5682_TDM_BCLK_MS1_128:
+		return parent_rate * 128;
+	case RT5682_TDM_BCLK_MS1_64:
+		return parent_rate * 64;
+	case RT5682_TDM_BCLK_MS1_32:
+		return parent_rate * 32;
+	default:
+		return 0;
+	}
+}
+
+static unsigned long rt5682_bclk_get_factor(unsigned long rate,
+					    unsigned long parent_rate)
+{
+	unsigned long factor;
+
+	factor = rate / parent_rate;
+	if (factor < 64)
+		return 32;
+	else if (factor < 128)
+		return 64;
+	else if (factor < 256)
+		return 128;
+	else
+		return 256;
+}
+
+static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *parent_rate)
+{
+	struct rt5682_priv *rt5682 =
+		container_of(hw, struct rt5682_priv,
+			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
+	unsigned long factor;
+
+	if (!*parent_rate || !rt5682_clk_check(rt5682))
+		return -EINVAL;
+
+	/*
+	 * BCLK rates are set as a multiplier of WCLK in HW.
+	 * We don't allow changing the parent WCLK. We just do
+	 * some rounding down based on the parent WCLK rate
+	 * and find the appropriate multiplier of BCLK to
+	 * get the rounded down BCLK value.
+	 */
+	factor = rt5682_bclk_get_factor(rate, *parent_rate);
+
+	return *parent_rate * factor;
+}
+
+static int rt5682_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct rt5682_priv *rt5682 =
+		container_of(hw, struct rt5682_priv,
+			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
+	struct snd_soc_component *component = rt5682->component;
+	struct snd_soc_dai *dai = NULL;
+	unsigned long factor;
+
+	if (!rt5682_clk_check(rt5682))
+		return -EINVAL;
+
+	factor = rt5682_bclk_get_factor(rate, parent_rate);
+
+	for_each_component_dais(component, dai)
+		if (dai->id == RT5682_AIF1)
+			break;
+	if (!dai) {
+		dev_err(component->dev, "dai %d not found in component\n",
+			RT5682_AIF1);
+		return -ENODEV;
+	}
+
+	return rt5682_set_bclk1_ratio(dai, factor);
+}
+
+static const struct clk_ops rt5682_dai_clk_ops[RT5682_DAI_NUM_CLKS] = {
+	[RT5682_DAI_WCLK_IDX] = {
+		.prepare = rt5682_wclk_prepare,
+		.unprepare = rt5682_wclk_unprepare,
+		.recalc_rate = rt5682_wclk_recalc_rate,
+		.round_rate = rt5682_wclk_round_rate,
+		.set_rate = rt5682_wclk_set_rate,
+	},
+	[RT5682_DAI_BCLK_IDX] = {
+		.recalc_rate = rt5682_bclk_recalc_rate,
+		.round_rate = rt5682_bclk_round_rate,
+		.set_rate = rt5682_bclk_set_rate,
+	},
+};
+
+static int rt5682_register_dai_clks(struct snd_soc_component *component)
+{
+	struct device *dev = component->dev;
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct rt5682_platform_data *pdata = &rt5682->pdata;
+	struct clk_init_data init;
+	struct clk *dai_clk;
+	struct clk_lookup *dai_clk_lookup;
+	struct clk_hw *dai_clk_hw;
+	const char *parent_name;
+	int i, ret;
+
+	for (i = 0; i < RT5682_DAI_NUM_CLKS; ++i) {
+		dai_clk_hw = &rt5682->dai_clks_hw[i];
+
+		switch (i) {
+		case RT5682_DAI_WCLK_IDX:
+			/* Make MCLK the parent of WCLK */
+			if (rt5682->mclk) {
+				parent_name = __clk_get_name(rt5682->mclk);
+				init.parent_names = &parent_name;
+				init.num_parents = 1;
+			} else {
+				init.parent_names = NULL;
+				init.num_parents = 0;
+			}
+			break;
+		case RT5682_DAI_BCLK_IDX:
+			/* Make WCLK the parent of BCLK */
+			parent_name = __clk_get_name(
+				rt5682->dai_clks[RT5682_DAI_WCLK_IDX]);
+			init.parent_names = &parent_name;
+			init.num_parents = 1;
+			break;
+		default:
+			dev_err(dev, "Invalid clock index\n");
+			ret = -EINVAL;
+			goto err;
+		}
+
+		init.name = pdata->dai_clk_names[i];
+		init.ops = &rt5682_dai_clk_ops[i];
+		init.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_GATE;
+		dai_clk_hw->init = &init;
+
+		dai_clk = devm_clk_register(dev, dai_clk_hw);
+		if (IS_ERR(dai_clk)) {
+			dev_warn(dev, "Failed to register %s: %ld\n",
+				 init.name, PTR_ERR(dai_clk));
+			ret = PTR_ERR(dai_clk);
+			goto err;
+		}
+		rt5682->dai_clks[i] = dai_clk;
+
+		if (dev->of_node) {
+			devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+						    dai_clk_hw);
+		} else {
+			dai_clk_lookup = clkdev_create(dai_clk, init.name,
+						       "%s", dev_name(dev));
+			if (!dai_clk_lookup) {
+				ret = -ENOMEM;
+				goto err;
+			} else {
+				rt5682->dai_clks_lookup[i] = dai_clk_lookup;
+			}
+		}
+	}
+
+	return 0;
+
+err:
+	do {
+		if (rt5682->dai_clks_lookup[i])
+			clkdev_drop(rt5682->dai_clks_lookup[i]);
+	} while (i-- > 0);
+
+	return ret;
+}
+#endif /* CONFIG_COMMON_CLK */
+
 static int rt5682_probe(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
+#ifdef CONFIG_COMMON_CLK
+	int ret;
+#endif
 	rt5682->component = component;
 
+#ifdef CONFIG_COMMON_CLK
+	/* Check if MCLK provided */
+	rt5682->mclk = devm_clk_get(component->dev, "mclk");
+	if (IS_ERR(rt5682->mclk)) {
+		if (PTR_ERR(rt5682->mclk) != -ENOENT) {
+			ret = PTR_ERR(rt5682->mclk);
+			return ret;
+		}
+		rt5682->mclk = NULL;
+	}
+
+	/* Register CCF DAI clock control */
+	ret = rt5682_register_dai_clks(component);
+	if (ret)
+		return ret;
+
+	/* Initial setup for CCF */
+	rt5682->lrck[RT5682_AIF1] = CLK_48;
+#endif
+
 	return 0;
 }
 
@@ -2472,6 +2859,15 @@ static void rt5682_remove(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
+#ifdef CONFIG_COMMON_CLK
+	int i;
+
+	for (i = RT5682_DAI_NUM_CLKS - 1; i >= 0; --i) {
+		if (rt5682->dai_clks_lookup[i])
+			clkdev_drop(rt5682->dai_clks_lookup[i]);
+	}
+#endif
+
 	rt5682_reset(rt5682);
 }
 
@@ -2606,6 +3002,13 @@ static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 	rt5682->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
 		"realtek,ldo1-en-gpios", 0);
 
+	if (device_property_read_string_array(dev, "clock-output-names",
+					      rt5682->pdata.dai_clk_names,
+					      RT5682_DAI_NUM_CLKS) < 0)
+		dev_warn(dev, "Using default DAI clk names: %s, %s\n",
+			 rt5682->pdata.dai_clk_names[RT5682_DAI_WCLK_IDX],
+			 rt5682->pdata.dai_clk_names[RT5682_DAI_BCLK_IDX]);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 465c99b7f906..f82126a6f211 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -841,8 +841,8 @@
 #define RT5682_TDM_M_LP_INV			(0x1 << 1)
 #define RT5682_TDM_MS_MASK			(0x1 << 0)
 #define RT5682_TDM_MS_SFT			0
-#define RT5682_TDM_MS_M				(0x0 << 0)
-#define RT5682_TDM_MS_S				(0x1 << 0)
+#define RT5682_TDM_MS_S				(0x0 << 0)
+#define RT5682_TDM_MS_M				(0x1 << 0)
 
 /* Global Clock Control (0x0080) */
 #define RT5682_SCLK_SRC_MASK			(0x7 << 13)
-- 
2.20.1

