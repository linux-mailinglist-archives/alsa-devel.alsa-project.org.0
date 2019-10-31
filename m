Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EDFEB161
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 14:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B9420DE;
	Thu, 31 Oct 2019 14:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B9420DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572529436;
	bh=AUeLgpUXzUIpF0b1qIaVwMdhJ66GFqdfFsLhJxJD6Ds=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AE9ByV50WaPbm9tKLs3LJEVYXFwECuwfOb0938w364a1UXjX+FTSocli8b7lXipSc
	 O6L6TNSkx46vKeTU4Avig8i0dV851tfJxYK4ia3TejG5btj8dQLJQB7nwWaGQ0db8Y
	 NIb1fplPhavBDjEstNtIzVFMtgTdvyNNQMMfuVeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABFDF8044B;
	Thu, 31 Oct 2019 14:42:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CDCCF802A0; Thu, 31 Oct 2019 14:42:10 +0100 (CET)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA9A3F802A0
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 14:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA9A3F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NkyABL+f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ezdPJmj8mOg4gAL3To/zdoR83lk1N7fyq6ha66JVVio=; b=NkyABL+f2kbR
 ZeX6CwnXlEpxzN3/9JQuJ7TPM/9B1O6IM12kwDeoA6PB586hhdghak93ha7GSS617di1SAbaiXtvS
 ORhfH3J++rZjywg2rSn7jutHa/2OA5dA/O6DJ/ZWcbWGqHCua14htZEW3yY/E3ajkGmZQ/6IWlYfq
 2SBAc=;
Received: from [91.217.168.176] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iQAQK-0007oU-K4; Thu, 31 Oct 2019 13:23:36 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 47328D020AE; Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191031115425.21003-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191031132336.47328D020AE@fitzroy.sirena.org.uk>
Date: Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: remove unnecessary tabs using
	spaces instead" to the asoc tree
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

   ASoC: rt1011: remove unnecessary tabs using spaces instead

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 270d1b39b006a408e35278d4b64b2c4e1945adf0 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Thu, 31 Oct 2019 19:54:25 +0800
Subject: [PATCH] ASoC: rt1011: remove unnecessary tabs using spaces instead

There are unnecessary tabs inside some statements.
It uses sapces instead.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191031115425.21003-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 45 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 57a3a34b5f18..2f1de933f3ac 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -989,7 +989,7 @@ static SOC_ENUM_SINGLE_DECL(rt1011_din_source_enum, RT1011_CROSS_BQ_SET_1, 5,
 
 static const char * const rt1011_tdm_data_out_select[] = {
 	"TDM_O_LR", "BQ1", "DVOL", "BQ10", "ALC", "DMIX", "ADC_SRC_LR",
-	"ADC_O_LR",	"ADC_MONO", "RSPK_BPF_LR", "DMIX_ADD", "ENVELOPE_FS",
+	"ADC_O_LR", "ADC_MONO", "RSPK_BPF_LR", "DMIX_ADD", "ENVELOPE_FS",
 	"SEP_O_GAIN", "ALC_BK_GAIN", "STP_V_C", "DMIX_ABST"
 };
 
@@ -1002,7 +1002,7 @@ static SOC_ENUM_SINGLE_DECL(rt1011_tdm2_l_dac1_enum, RT1011_TDM2_SET_4, 12,
 	rt1011_tdm_l_ch_data_select);
 
 static SOC_ENUM_SINGLE_DECL(rt1011_tdm1_adc1_dat_enum,
-	RT1011_ADCDAT_OUT_SOURCE, 0,	rt1011_tdm_data_out_select);
+	RT1011_ADCDAT_OUT_SOURCE, 0, rt1011_tdm_data_out_select);
 static SOC_ENUM_SINGLE_DECL(rt1011_tdm1_adc1_loc_enum, RT1011_TDM1_SET_2, 0,
 	rt1011_tdm_l_ch_data_select);
 
@@ -1024,9 +1024,9 @@ static const char * const rt1011_tdm_adc_swap_select[] = {
 	"L/R", "R/L", "L/L", "R/R"
 };
 
-static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc1_1_enum,	RT1011_TDM1_SET_3, 6,
+static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc1_1_enum, RT1011_TDM1_SET_3, 6,
 	rt1011_tdm_adc_swap_select);
-static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc2_1_enum,	RT1011_TDM1_SET_3, 4,
+static SOC_ENUM_SINGLE_DECL(rt1011_tdm_adc2_1_enum, RT1011_TDM1_SET_3, 4,
 	rt1011_tdm_adc_swap_select);
 
 static void rt1011_reset(struct regmap *regmap)
@@ -1092,9 +1092,9 @@ static bool rt1011_validate_bq_drc_coeff(unsigned short reg)
 {
 	if ((reg == RT1011_DAC_SET_1) |
 		(reg >= RT1011_ADC_SET && reg <= RT1011_ADC_SET_1) |
-		(reg == RT1011_ADC_SET_4) |	(reg == RT1011_ADC_SET_5) |
+		(reg == RT1011_ADC_SET_4) | (reg == RT1011_ADC_SET_5) |
 		(reg == RT1011_MIXER_1) |
-		(reg == RT1011_A_TIMING_1) |	(reg >= RT1011_POWER_7 &&
+		(reg == RT1011_A_TIMING_1) | (reg >= RT1011_POWER_7 &&
 		reg <= RT1011_POWER_8) |
 		(reg == RT1011_CLASS_D_POS) | (reg == RT1011_ANALOG_CTRL) |
 		(reg >= RT1011_SPK_TEMP_PROTECT_0 &&
@@ -1289,7 +1289,7 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 		r0_integer = format / rt1011->r0_reg / 128;
 		r0_factor = ((format / rt1011->r0_reg * 100) / 128)
 						- (r0_integer * 100);
-		dev_info(dev,	"New r0 resistance about %d.%02d ohm, reg=0x%X\n",
+		dev_info(dev, "New r0 resistance about %d.%02d ohm, reg=0x%X\n",
 			r0_integer, r0_factor, rt1011->r0_reg);
 
 		if (rt1011->r0_reg)
@@ -1977,14 +1977,14 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 
 	snd_soc_component_update_bits(component, RT1011_TDM1_SET_1,
 		RT1011_I2S_CH_TX_MASK | RT1011_I2S_CH_RX_MASK |
-		RT1011_I2S_CH_TX_LEN_MASK |	RT1011_I2S_CH_RX_LEN_MASK, val);
+		RT1011_I2S_CH_TX_LEN_MASK | RT1011_I2S_CH_RX_LEN_MASK, val);
 	snd_soc_component_update_bits(component, RT1011_TDM2_SET_1,
 		RT1011_I2S_CH_TX_MASK | RT1011_I2S_CH_RX_MASK |
-		RT1011_I2S_CH_TX_LEN_MASK |	RT1011_I2S_CH_RX_LEN_MASK, val);
+		RT1011_I2S_CH_TX_LEN_MASK | RT1011_I2S_CH_RX_LEN_MASK, val);
 	snd_soc_component_update_bits(component, RT1011_TDM1_SET_2,
-		RT1011_TDM_I2S_DOCK_EN_1_MASK,	tdm_en);
+		RT1011_TDM_I2S_DOCK_EN_1_MASK, tdm_en);
 	snd_soc_component_update_bits(component, RT1011_TDM2_SET_2,
-		RT1011_TDM_I2S_DOCK_EN_2_MASK,	tdm_en);
+		RT1011_TDM_I2S_DOCK_EN_2_MASK, tdm_en);
 	if (tx_slotnum)
 		snd_soc_component_update_bits(component, RT1011_TDM_TOTAL_SET,
 			RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
@@ -2109,7 +2109,7 @@ static const struct snd_soc_component_driver soc_component_dev_rt1011 = {
 	.remove = rt1011_remove,
 	.suspend = rt1011_suspend,
 	.resume = rt1011_resume,
-	.set_bias_level		= rt1011_set_bias_level,
+	.set_bias_level = rt1011_set_bias_level,
 	.controls = rt1011_snd_controls,
 	.num_controls = ARRAY_SIZE(rt1011_snd_controls),
 	.dapm_widgets = rt1011_dapm_widgets,
@@ -2118,9 +2118,9 @@ static const struct snd_soc_component_driver soc_component_dev_rt1011 = {
 	.num_dapm_routes = ARRAY_SIZE(rt1011_dapm_routes),
 	.set_sysclk = rt1011_set_component_sysclk,
 	.set_pll = rt1011_set_component_pll,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
+	.use_pmdown_time = 1,
+	.endianness = 1,
+	.non_legacy_dai_naming = 1,
 };
 
 static const struct regmap_config rt1011_regmap = {
@@ -2222,17 +2222,17 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 	dc_offset = value << 16;
 	regmap_read(rt1011->regmap, RT1011_EFUSE_ADC_OFFSET_15_0, &value);
 	dc_offset |= (value & 0xffff);
-	dev_info(dev,	"ADC offset=0x%x\n", dc_offset);
+	dev_info(dev, "ADC offset=0x%x\n", dc_offset);
 	regmap_read(rt1011->regmap, RT1011_EFUSE_DAC_OFFSET_G0_20_16, &value);
 	dc_offset = value << 16;
 	regmap_read(rt1011->regmap, RT1011_EFUSE_DAC_OFFSET_G0_15_0, &value);
 	dc_offset |= (value & 0xffff);
-	dev_info(dev,	"Gain0 offset=0x%x\n", dc_offset);
+	dev_info(dev, "Gain0 offset=0x%x\n", dc_offset);
 	regmap_read(rt1011->regmap, RT1011_EFUSE_DAC_OFFSET_G1_20_16, &value);
 	dc_offset = value << 16;
 	regmap_read(rt1011->regmap, RT1011_EFUSE_DAC_OFFSET_G1_15_0, &value);
 	dc_offset |= (value & 0xffff);
-	dev_info(dev,	"Gain1 offset=0x%x\n", dc_offset);
+	dev_info(dev, "Gain1 offset=0x%x\n", dc_offset);
 
 
 	if (cali_flag) {
@@ -2252,7 +2252,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 		while (count < chk_cnt) {
 			msleep(100);
 			regmap_read(rt1011->regmap,
-				RT1011_INIT_RECIPROCAL_SYN_24_16,	&value);
+				RT1011_INIT_RECIPROCAL_SYN_24_16, &value);
 			r0[count%3] = value << 16;
 			regmap_read(rt1011->regmap,
 				RT1011_INIT_RECIPROCAL_SYN_15_0, &value);
@@ -2267,7 +2267,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 				break;
 		}
 		if (count > chk_cnt) {
-			dev_err(dev,	"Calibrate R0 Failure\n");
+			dev_err(dev, "Calibrate R0 Failure\n");
 			ret = -EAGAIN;
 		} else {
 			format = 2147483648U; /* 2^24 * 128 */
@@ -2276,7 +2276,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 							- (r0_integer * 100);
 			rt1011->r0_reg = r0[0];
 			rt1011->cali_done = 1;
-			dev_info(dev,	"r0 resistance about %d.%02d ohm, reg=0x%X\n",
+			dev_info(dev, "r0 resistance about %d.%02d ohm, reg=0x%X\n",
 				r0_integer, r0_factor, r0[0]);
 		}
 	}
@@ -2354,7 +2354,7 @@ static void rt1011_calibration_work(struct work_struct *work)
 		r0_integer = format / rt1011->r0_reg / 128;
 		r0_factor = ((format / rt1011->r0_reg * 100) / 128)
 						- (r0_integer * 100);
-		dev_info(component->dev,	"DP r0 resistance about %d.%02d ohm, reg=0x%X\n",
+		dev_info(component->dev, "DP r0 resistance about %d.%02d ohm, reg=0x%X\n",
 			r0_integer, r0_factor, rt1011->r0_reg);
 
 		rt1011_r0_load(rt1011);
@@ -2420,7 +2420,6 @@ static void rt1011_i2c_shutdown(struct i2c_client *client)
 	rt1011_reset(rt1011->regmap);
 }
 
-
 static struct i2c_driver rt1011_i2c_driver = {
 	.driver = {
 		.name = "rt1011",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
