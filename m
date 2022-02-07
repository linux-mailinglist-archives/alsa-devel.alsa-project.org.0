Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0158E4AC6EE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 18:13:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 961641888;
	Mon,  7 Feb 2022 18:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 961641888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644254006;
	bh=bk7Z9jZhsU6gAFTXqhA5wXjohyDbNYd6KKWxzoBKGUs=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YiUrT+pktGNWvga1O26XzYAAVlrCm6uWoNfRI1gwoZmYoroYuEm8LSob1nMnF5wyt
	 mUjpRLWRkgJKNTq1f9PHDxpclqsFN9UQEqog+7mPvpL1qmhpJBtxdM+uzLWtER8zmv
	 U73Iy5HQPYBmRWgjzCmU8wJCdSD1RIrU/1JEpILg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1D9F80246;
	Mon,  7 Feb 2022 18:12:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA1D8F80240; Mon,  7 Feb 2022 18:12:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DDA0F800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 18:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DDA0F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="UbMApB3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1644253934;
 x=1675789934;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=rvsi9cl93TqLjGbnJuqfpOw8Ea302qJWH6Ck01IvfIE=;
 b=UbMApB3md3eaeQPOmZ03GBkLzeT7W9BZqhnt69YJsXfMxDOBFVLoINdS
 Nb+jODS/GLDu7pjjg4yjmSTHfxMBL0ctG2eSzXCaSF+g2WpiJaH+ixq+o
 pmCFY7W5NVswrkBR4ruZLT85Xqx96C9L7gbFnDr5+Rm1xaYd9SYsUCagB
 SFx05TaNnGYT7+sC7VtudHdThfkXConn3JVkK6wqQB/+x4hHEwR8UiCcR
 w6c4oqCqQcLW5He4tHIv8nNoPB/xThXO3Dv8F4RQCpBpy9L1en8gFy7ef
 glaoxS5ECaS0jt5hDgg1edhkmNjf1mPrNBt2wLSy8/g3iAXfBYdI3i6M1 Q==;
Date: Mon, 7 Feb 2022 18:12:06 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: tlv320adc3xxx: Add IIR filter configuration
Message-ID: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel@axis.com
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


The TLV320ADC3001/3101 have an internal DSP, which can either be
used in various preset configurations (called "Processing Blocks"
in the data sheet), or as a freely programmable (using the 
"PurePath Studio" graphical programming tool from TI) but rather
small DSP ("miniDSP").

Using the default configuration (PRB_R1) it's possible to set up
filtering using a first-order IIR, which can be useful for adding
a digital high pass filter to the signal chain, for instance.

This patch adds support for configuring the IIR filter coefficients.
The filter itself is always enabled; the default coefficients 
implement a pass-through function.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 160 +++++++++++++++++++++++++++++--
 1 file changed, 153 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 4baf3d881633..d0d5206db0c7 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -169,6 +169,23 @@
 #define ADC3XXX_ANALOG_PGA_FLAGS		ADC3XXX_REG(1, 62)
 /* 63-127 Reserved */
 
+/*
+ * Page 4 registers. First page of coefficient memory for the miniDSP.
+ */
+#define ADC3XXX_LEFT_ADC_IIR_COEFF_N0_MSB	ADC3XXX_REG(4, 8)
+#define ADC3XXX_LEFT_ADC_IIR_COEFF_N0_LSB	ADC3XXX_REG(4, 9)
+#define ADC3XXX_LEFT_ADC_IIR_COEFF_N1_MSB	ADC3XXX_REG(4, 10)
+#define ADC3XXX_LEFT_ADC_IIR_COEFF_N1_LSB	ADC3XXX_REG(4, 11)
+#define ADC3XXX_LEFT_ADC_IIR_COEFF_D1_MSB	ADC3XXX_REG(4, 12)
+#define ADC3XXX_LEFT_ADC_IIR_COEFF_D1_LSB	ADC3XXX_REG(4, 13)
+
+#define ADC3XXX_RIGHT_ADC_IIR_COEFF_N0_MSB	ADC3XXX_REG(4, 72)
+#define ADC3XXX_RIGHT_ADC_IIR_COEFF_N0_LSB	ADC3XXX_REG(4, 73)
+#define ADC3XXX_RIGHT_ADC_IIR_COEFF_N1_MSB	ADC3XXX_REG(4, 74)
+#define ADC3XXX_RIGHT_ADC_IIR_COEFF_N1_LSB	ADC3XXX_REG(4, 75)
+#define ADC3XXX_RIGHT_ADC_IIR_COEFF_D1_MSB	ADC3XXX_REG(4, 76)
+#define ADC3XXX_RIGHT_ADC_IIR_COEFF_D1_LSB	ADC3XXX_REG(4, 77)
+
 /*
  * Register bits.
  */
@@ -373,22 +390,63 @@ static const struct reg_default adc3xxx_defaults[] = {
 	{ 180, 0xff },  { 181, 0x00 },  { 182, 0x3f },  { 183, 0xff },
 	{ 184, 0x00 },  { 185, 0x3f },  { 186, 0x00 },  { 187, 0x80 },
 	{ 188, 0x80 },  { 189, 0x00 },  { 190, 0x00 },  { 191, 0x00 },
+
+	/* Page 4 */
+	{ 1024, 0x00 },			{ 1026, 0x01 },	{ 1027, 0x17 },
+	{ 1028, 0x01 }, { 1029, 0x17 }, { 1030, 0x7d }, { 1031, 0xd3 },
+	{ 1032, 0x7f }, { 1033, 0xff }, { 1034, 0x00 }, { 1035, 0x00 },
+	{ 1036, 0x00 }, { 1037, 0x00 }, { 1038, 0x7f }, { 1039, 0xff },
+	{ 1040, 0x00 }, { 1041, 0x00 }, { 1042, 0x00 }, { 1043, 0x00 },
+	{ 1044, 0x00 }, { 1045, 0x00 }, { 1046, 0x00 }, { 1047, 0x00 },
+	{ 1048, 0x7f }, { 1049, 0xff }, { 1050, 0x00 }, { 1051, 0x00 },
+	{ 1052, 0x00 }, { 1053, 0x00 }, { 1054, 0x00 }, { 1055, 0x00 },
+	{ 1056, 0x00 }, { 1057, 0x00 }, { 1058, 0x7f }, { 1059, 0xff },
+	{ 1060, 0x00 }, { 1061, 0x00 }, { 1062, 0x00 }, { 1063, 0x00 },
+	{ 1064, 0x00 }, { 1065, 0x00 }, { 1066, 0x00 }, { 1067, 0x00 },
+	{ 1068, 0x7f }, { 1069, 0xff }, { 1070, 0x00 }, { 1071, 0x00 },
+	{ 1072, 0x00 }, { 1073, 0x00 }, { 1074, 0x00 }, { 1075, 0x00 },
+	{ 1076, 0x00 }, { 1077, 0x00 }, { 1078, 0x7f }, { 1079, 0xff },
+	{ 1080, 0x00 }, { 1081, 0x00 }, { 1082, 0x00 }, { 1083, 0x00 },
+	{ 1084, 0x00 }, { 1085, 0x00 }, { 1086, 0x00 }, { 1087, 0x00 },
+	{ 1088, 0x00 }, { 1089, 0x00 }, { 1090, 0x00 }, { 1091, 0x00 },
+	{ 1092, 0x00 }, { 1093, 0x00 }, { 1094, 0x00 }, { 1095, 0x00 },
+	{ 1096, 0x00 }, { 1097, 0x00 }, { 1098, 0x00 }, { 1099, 0x00 },
+	{ 1100, 0x00 }, { 1101, 0x00 }, { 1102, 0x00 }, { 1103, 0x00 },
+	{ 1104, 0x00 }, { 1105, 0x00 }, { 1106, 0x00 }, { 1107, 0x00 },
+	{ 1108, 0x00 }, { 1109, 0x00 }, { 1110, 0x00 }, { 1111, 0x00 },
+	{ 1112, 0x00 }, { 1113, 0x00 }, { 1114, 0x00 }, { 1115, 0x00 },
+	{ 1116, 0x00 }, { 1117, 0x00 }, { 1118, 0x00 }, { 1119, 0x00 },
+	{ 1120, 0x00 }, { 1121, 0x00 }, { 1122, 0x00 }, { 1123, 0x00 },
+	{ 1124, 0x00 }, { 1125, 0x00 }, { 1126, 0x00 }, { 1127, 0x00 },
+	{ 1128, 0x00 }, { 1129, 0x00 }, { 1130, 0x00 }, { 1131, 0x00 },
+	{ 1132, 0x00 }, { 1133, 0x00 }, { 1134, 0x00 }, { 1135, 0x00 },
+	{ 1136, 0x00 }, { 1137, 0x00 }, { 1138, 0x00 }, { 1139, 0x00 },
+	{ 1140, 0x00 }, { 1141, 0x00 }, { 1142, 0x00 }, { 1143, 0x00 },
+	{ 1144, 0x00 }, { 1145, 0x00 }, { 1146, 0x00 }, { 1147, 0x00 },
+	{ 1148, 0x00 }, { 1149, 0x00 }, { 1150, 0x00 }, { 1151, 0x00 },
 };
 
 static bool adc3xxx_volatile_reg(struct device *dev, unsigned int reg)
 {
-	switch (reg) {
-	case ADC3XXX_RESET:
+	if (reg == ADC3XXX_RESET)
 		return true;
-	default:
-		return false;
-	}
+
+	/*
+	 * Coefficient RAM registers for miniDSP are marked as volatile
+	 * mainly because they must be written in pairs, so we don't want
+	 * them to be cached. Updates are not likely to occur very often,
+	 * so the performance penalty is minimal.
+	 */
+	if (reg >= ADC3XXX_REG(4, 2) && reg <= ADC3XXX_REG(4, 128))
+		return true;
+
+	return false;
 }
 
 static const struct regmap_range_cfg adc3xxx_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 2 * ADC3XXX_PAGE_SIZE,
+		.range_max = 5 * ADC3XXX_PAGE_SIZE,
 		.selector_reg = ADC3XXX_PAGE_SELECT,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -410,7 +468,7 @@ static const struct regmap_config adc3xxx_regmap = {
 
 	.ranges = adc3xxx_ranges,
 	.num_ranges = ARRAY_SIZE(adc3xxx_ranges),
-	.max_register = 2 * ADC3XXX_PAGE_SIZE,
+	.max_register = 5 * ADC3XXX_PAGE_SIZE,
 };
 
 struct adc3xxx_rate_divs {
@@ -497,6 +555,83 @@ static int adc3xxx_pll_delay(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int adc3xxx_coefficient_info(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_info *uinfo)
+{
+	int numcoeff = kcontrol->private_value >> 16;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = numcoeff;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 0xffff; /* all coefficients are 16 bit */
+	return 0;
+}
+
+static int adc3xxx_coefficient_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	int numcoeff  = kcontrol->private_value >> 16;
+	int reg = kcontrol->private_value & 0xffff;
+	int index = 0;
+
+	while (index < numcoeff) {
+		unsigned int value_msb, value_lsb, value;
+
+		value_msb = snd_soc_component_read(component, reg++);
+		if ((int)value_msb < 0)
+			return (int)value_msb;
+
+		value_lsb = snd_soc_component_read(component, reg++);
+		if ((int)value_lsb < 0)
+			return (int)value_lsb;
+
+		value = (value_msb << 8) | value_lsb;
+		ucontrol->value.integer.value[index++] = value;
+	}
+
+	return 0;
+}
+
+static int adc3xxx_coefficient_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	int numcoeff  = kcontrol->private_value >> 16;
+	int reg = kcontrol->private_value & 0xffff;
+	int index = 0;
+	int ret;
+
+	while (index < numcoeff) {
+		unsigned int value = ucontrol->value.integer.value[index++];
+		unsigned int value_msb = (value >> 8) & 0xff;
+		unsigned int value_lsb = value & 0xff;
+
+		ret = snd_soc_component_write(component, reg++, value_msb);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_write(component, reg++, value_lsb);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* All on-chip filters have coefficients which are expressed in terms of
+ * 16 bit values, so represent them as strings of 16-bit integers.
+ */
+#define TI_COEFFICIENTS(xname, reg, numcoeffs) { \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+	.name = xname, \
+	.info = adc3xxx_coefficient_info, \
+	.get = adc3xxx_coefficient_get,\
+	.put = adc3xxx_coefficient_put, \
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.private_value = reg | (numcoeffs << 16) \
+}
+
 static const char * const adc_softstepping_text[] = { "1 step", "2 step", "off" };
 static SOC_ENUM_SINGLE_DECL(adc_softstepping_enum, ADC3XXX_ADC_DIGITAL, 0,
 			    adc_softstepping_text);
@@ -640,6 +775,17 @@ static const struct snd_kcontrol_new adc3xxx_snd_controls[] = {
 	SOC_SINGLE("Right ADC Unselected CM Bias Capture Switch",
 		   ADC3XXX_RIGHT_PGA_SEL_2, 6, 1, 0),
 	SOC_ENUM("Dither Control DC Offset", dither_dc_offset_enum),
+
+	/* Coefficient memory for miniDSP. */
+	/* For the default PRB_R1 processing block, the only available
+	 * filter is the first order IIR.
+	 */
+
+	TI_COEFFICIENTS("Left ADC IIR Coefficients N0 N1 D1",
+			ADC3XXX_LEFT_ADC_IIR_COEFF_N0_MSB, 3),
+
+	TI_COEFFICIENTS("Right ADC IIR Coefficients N0 N1 D1",
+			ADC3XXX_RIGHT_ADC_IIR_COEFF_N0_MSB, 3),
 };
 
 /* Left input selection, Single Ended inputs and Differential inputs */
-- 
2.20.1


-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
