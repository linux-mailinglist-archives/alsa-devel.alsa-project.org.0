Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2DEAFD3
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 13:09:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E756E2098;
	Thu, 31 Oct 2019 13:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E756E2098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572523795;
	bh=IbVIAEQt99XoVRIypufAj5qwvaoJk/mne9ZtJol/6uI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zpm7onNzmg+FQAlGQoRv1kjC8TuMF1ZxjcGMRqv6CIELmK+btSY0wZIf7gYPkvMSw
	 iEX8SNZxObzRUxqWMUPKDIvOSHGPOHYhz5Uu3prylFzivEPtPE4QScEOruDFrOW4pH
	 p5kuPkoscSx/wPVzstNqXk5gvn0duzqrt4v6k7UI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7950EF8060D;
	Thu, 31 Oct 2019 13:07:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B2E8F80392; Thu, 31 Oct 2019 13:04:36 +0100 (CET)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7185F800F6
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 12:54:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7185F800F6
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9VBsUfF001991,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9VBsUfF001991
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 19:54:30 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server id
 14.3.468.0; Thu, 31 Oct 2019 19:54:29 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 31 Oct 2019 19:54:25 +0800
Message-ID: <20191031115425.21003-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, tzungbi@google.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
Subject: [alsa-devel] [PATCH 3/5] ASoC: rt1011: remove unnecessary tabs
	using spaces instead
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

There are unnecessary tabs inside some statements.
It uses sapces instead.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
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
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
