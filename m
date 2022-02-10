Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3A34B13E3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 18:09:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024EC1A99;
	Thu, 10 Feb 2022 18:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024EC1A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644512940;
	bh=2Jzl/N8+Bc66sjAjE5JnyMHJZQ2m02eXEkg4AzGDBEE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yfw52SPKUFixWMN6HUx9tLwVTQSErjmHc8vz5lbBWqUbZ2qvZm2T5AjlqNO6AHaX3
	 WA6WaqcbiBKT7HN2x6tuGPdyyg0/VoX1wjDN9Ltq0paZYukP3om4m4Sygk/8skx28u
	 8QshXn/SxqpiLLn2Ykf/jqkFp9u/yoAg9+L1jysc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BD31F80302;
	Thu, 10 Feb 2022 18:07:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B183F8028B; Thu, 10 Feb 2022 18:07:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7B07F8013D
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 18:07:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7B07F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="K4Wbo38b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1644512867;
 x=1676048867; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=1YzcmRiE+HQODW1675RKTGgZ7cPQXTXg8rdg8uXa8Z8=;
 b=K4Wbo38b5n8Vavcr9Q4uTH/AMTA1hUJcihiH2SHuAaWBTn11tSrsJAIo
 btq1K8/IRhuOIbHBBaWQ5hMfSWRPmPxFmCeI8woKHGkBOHjNbXMYlAHEM
 WTjyJLGVfjoTx6xWJqzI01qdBQ7Xg/kxpxyRVJJvLCJssrcESnlOt1f3X
 jbWc8Z1+b3Mt7/0bcrTCKNXM47jfwDyJKQCzrBvwv/zS1jYB4aFuGkCU6
 L5c94s379PsZ0jPFUGj+JAgEKgyPtgQqmEA+KPMfFp78hi3N0/x4NetKv
 TO4yJHeAIbrcwozvVPbjzpWgr+mpLt3yzxotXmq1wu++1d/L2ppno+Xr3 Q==;
Date: Thu, 10 Feb 2022 18:07:36 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: tlv320adc3xxx: Add IIR filter configuration
In-Reply-To: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
Message-ID: <alpine.DEB.2.21.2202101805360.7068@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail06w.axis.com (10.20.40.12) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel <kernel@axis.com>
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
Changelog:
v2:
- Removed marking miniDSP coefficient registers as volatile,
  as writes always take place regardless of caching.
- Replace slightly obscure while loops in coefficient read/write
  functions with more obvious for loops. 

 sound/soc/codecs/tlv320adc3xxx.c | 143 ++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 4baf3d881633..1d12a3f7074a 100644
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
@@ -373,6 +390,40 @@ static const struct reg_default adc3xxx_defaults[] = {
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
@@ -388,7 +439,7 @@ static bool adc3xxx_volatile_reg(struct device *dev, unsigned int reg)
 static const struct regmap_range_cfg adc3xxx_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 2 * ADC3XXX_PAGE_SIZE,
+		.range_max = 5 * ADC3XXX_PAGE_SIZE,
 		.selector_reg = ADC3XXX_PAGE_SELECT,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -410,7 +461,7 @@ static const struct regmap_config adc3xxx_regmap = {
 
 	.ranges = adc3xxx_ranges,
 	.num_ranges = ARRAY_SIZE(adc3xxx_ranges),
-	.max_register = 2 * ADC3XXX_PAGE_SIZE,
+	.max_register = 5 * ADC3XXX_PAGE_SIZE,
 };
 
 struct adc3xxx_rate_divs {
@@ -497,6 +548,83 @@ static int adc3xxx_pll_delay(struct snd_soc_dapm_widget *w,
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
+	for (index = 0; index < numcoeff; index++) {
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
+		ucontrol->value.integer.value[index] = value;
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
+	for (index = 0; index < numcoeff; index++) {
+		unsigned int value = ucontrol->value.integer.value[index];
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
@@ -640,6 +768,17 @@ static const struct snd_kcontrol_new adc3xxx_snd_controls[] = {
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
