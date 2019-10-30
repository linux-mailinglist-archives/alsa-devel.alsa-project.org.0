Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F66DE9892
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 09:59:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB9A12318;
	Wed, 30 Oct 2019 09:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB9A12318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572425960;
	bh=fasFXrgks9bU2ACRK5CkjDoOC5/PsM/wrPW4pNeKCZo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n/yX7eDAGR+/4gufgZF0tAvMXzyw7/SkkLUdoYxpFq/b/zi5VuqPfgVnkYpK16ZDk
	 U6qNVuRxqCquk+HKSJc1GTrgk+8N3r/z07nkAsq12GtUN2KtwtM1xF9ulbspGb3hB6
	 GghD4Js29HUSRH5l7mtuWbL9VjkhVcW5Has49AIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90FFBF805FF;
	Wed, 30 Oct 2019 09:56:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64989F805FD; Wed, 30 Oct 2019 09:56:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2289F805FB
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2289F805FB
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9U8uUvB004505,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9U8uUvB004505
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 16:56:31 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server id
 14.3.468.0; Wed, 30 Oct 2019 16:56:26 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 30 Oct 2019 16:56:17 +0800
Message-ID: <20191030085617.14405-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, tzungbi@google.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
Subject: [alsa-devel] [PATCH 3/3] ASoC: rt1011: improve readability and
	remove redundant code
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

1. remove !component->card->instantiated statement in kcontrol
2. goto the end of fucntion if "ret = -EINVAL" in rt1011_set_dai_fmt()
3. fix typo
4. add the range check for temperature_calib from device property
5. remove unnecessary tabs using spaces instead

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 72 ++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index dcd397a83cb4..10bbdb37d689 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -61,7 +61,6 @@ static const struct reg_sequence init_list[] = {
 	{ RT1011_DAC_SET_1, 0xe702 },
 	{ RT1011_DAC_SET_3, 0x2004 },
 };
-#define RT1011_INIT_REG_LEN ARRAY_SIZE(init_list)
 
 static const struct reg_default rt1011_reg[] = {
 	{0x0000, 0x0000},
@@ -684,7 +683,8 @@ static int rt1011_reg_init(struct snd_soc_component *component)
 {
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
 
-	regmap_multi_reg_write(rt1011->regmap, init_list, RT1011_INIT_REG_LEN);
+	regmap_multi_reg_write(rt1011->regmap,
+		init_list, ARRAY_SIZE(init_list));
 	return 0;
 }
 
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
@@ -1163,9 +1163,6 @@ static int rt1011_bq_drc_coeff_put(struct snd_kcontrol *kcontrol,
 		(struct rt1011_bq_drc_params *)ucontrol->value.integer.value;
 	unsigned int i, mode_idx = 0;
 
-	if (!component->card->instantiated)
-		return 0;
-
 	if (strstr(ucontrol->id.name, "AdvanceMode Initial Set"))
 		mode_idx = RT1011_ADVMODE_INITIAL_SET;
 	else if (strstr(ucontrol->id.name, "AdvanceMode SEP BQ Coeff"))
@@ -1236,9 +1233,6 @@ static int rt1011_r0_cali_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
 
-	if (!component->card->instantiated)
-		return 0;
-
 	rt1011->cali_done = 0;
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
 		ucontrol->value.integer.value[0])
@@ -1284,9 +1278,6 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] == rt1011->r0_reg)
 		return 0;
 
-	if (!component->card->instantiated)
-		return 0;
-
 	if (ucontrol->value.integer.value[0] == 0)
 		return -EINVAL;
 
@@ -1298,7 +1289,7 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 		r0_integer = format / rt1011->r0_reg / 128;
 		r0_factor = ((format / rt1011->r0_reg * 100) / 128)
 						- (r0_integer * 100);
-		dev_info(dev,	"New r0 resistance about %d.%02d ohm, reg=0x%X\n",
+		dev_info(dev, "New r0 resistance about %d.%02d ohm, reg=0x%X\n",
 			r0_integer, r0_factor, rt1011->r0_reg);
 
 		if (rt1011->r0_reg)
@@ -1640,6 +1631,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	default:
 		ret = -EINVAL;
+		goto _set_fmt_err_;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -1650,6 +1642,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	default:
 		ret = -EINVAL;
+		goto _set_fmt_err_;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -1666,6 +1659,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	default:
 		ret = -EINVAL;
+		goto _set_fmt_err_;
 	}
 
 	switch (dai->id) {
@@ -1683,6 +1677,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		ret = -EINVAL;
 	}
 
+_set_fmt_err_:
 	snd_soc_dapm_mutex_unlock(dapm);
 	return ret;
 }
@@ -1778,7 +1773,8 @@ static int rt1011_set_component_pll(struct snd_soc_component *component,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n",
+			freq_in);
 		return ret;
 	}
 
@@ -1982,14 +1978,14 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 
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
@@ -2114,7 +2110,7 @@ static const struct snd_soc_component_driver soc_component_dev_rt1011 = {
 	.remove = rt1011_remove,
 	.suspend = rt1011_suspend,
 	.resume = rt1011_resume,
-	.set_bias_level		= rt1011_set_bias_level,
+	.set_bias_level = rt1011_set_bias_level,
 	.controls = rt1011_snd_controls,
 	.num_controls = ARRAY_SIZE(rt1011_snd_controls),
 	.dapm_widgets = rt1011_dapm_widgets,
@@ -2123,9 +2119,9 @@ static const struct snd_soc_component_driver soc_component_dev_rt1011 = {
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
@@ -2227,17 +2223,17 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
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
@@ -2257,7 +2253,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 		while (count < chk_cnt) {
 			msleep(100);
 			regmap_read(rt1011->regmap,
-				RT1011_INIT_RECIPROCAL_SYN_24_16,	&value);
+				RT1011_INIT_RECIPROCAL_SYN_24_16, &value);
 			r0[count%3] = value << 16;
 			regmap_read(rt1011->regmap,
 				RT1011_INIT_RECIPROCAL_SYN_15_0, &value);
@@ -2272,7 +2268,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 				break;
 		}
 		if (count > chk_cnt) {
-			dev_err(dev,	"Calibrate R0 Failure\n");
+			dev_err(dev, "Calibrate R0 Failure\n");
 			ret = -EAGAIN;
 		} else {
 			format = 2147483648U; /* 2^24 * 128 */
@@ -2281,7 +2277,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 							- (r0_integer * 100);
 			rt1011->r0_reg = r0[0];
 			rt1011->cali_done = 1;
-			dev_info(dev,	"r0 resistance about %d.%02d ohm, reg=0x%X\n",
+			dev_info(dev, "r0 resistance about %d.%02d ohm, reg=0x%X\n",
 				r0_integer, r0_factor, r0[0]);
 		}
 	}
@@ -2346,7 +2342,8 @@ static void rt1011_calibration_work(struct work_struct *work)
 	rt1011_reg_init(component);
 
 	/* Apply temperature and calibration data from device property */
-	if (rt1011->temperature_calib) {
+	if (rt1011->temperature_calib <= 0xff &&
+		rt1011->temperature_calib > 0) {
 		snd_soc_component_update_bits(component,
 			RT1011_STP_INITIAL_RESISTANCE_TEMP, 0x3ff,
 			(rt1011->temperature_calib << 2));
@@ -2359,7 +2356,7 @@ static void rt1011_calibration_work(struct work_struct *work)
 		r0_integer = format / rt1011->r0_reg / 128;
 		r0_factor = ((format / rt1011->r0_reg * 100) / 128)
 						- (r0_integer * 100);
-		dev_info(component->dev,	"DP r0 resistance about %d.%02d ohm, reg=0x%X\n",
+		dev_info(component->dev, "DP r0 resistance about %d.%02d ohm, reg=0x%X\n",
 			r0_integer, r0_factor, rt1011->r0_reg);
 
 		rt1011_r0_load(rt1011);
@@ -2380,7 +2377,7 @@ static int rt1011_parse_dp(struct rt1011_priv *rt1011, struct device *dev)
 }
 
 static int rt1011_i2c_probe(struct i2c_client *i2c,
-		    const struct i2c_device_id *id)
+			const struct i2c_device_id *id)
 {
 	struct rt1011_priv *rt1011;
 	int ret;
@@ -2388,7 +2385,7 @@ static int rt1011_i2c_probe(struct i2c_client *i2c,
 
 	rt1011 = devm_kzalloc(&i2c->dev, sizeof(struct rt1011_priv),
 				GFP_KERNEL);
-	if (rt1011 == NULL)
+	if (!rt1011)
 		return -ENOMEM;
 
 	i2c_set_clientdata(i2c, rt1011);
@@ -2425,7 +2422,6 @@ static void rt1011_i2c_shutdown(struct i2c_client *client)
 	rt1011_reset(rt1011->regmap);
 }
 
-
 static struct i2c_driver rt1011_i2c_driver = {
 	.driver = {
 		.name = "rt1011",
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
