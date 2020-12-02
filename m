Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B72CCCB4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 03:34:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22CF41812;
	Thu,  3 Dec 2020 03:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22CF41812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606962873;
	bh=tiWwrtSkGXnI9Ea9K0JNeqqQkp6Q7sATj4LfJN5dm9E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/Y2L/Vcif40Wjl0PlDUpxWNx4cIg7kf8a9rxRye8xuP+LtagN0PysavqBdgdS5GI
	 7xyvCa6cumXpwH1QydcI7ldZAgop7DTBwEh7CSwF0FOJPKauMixT6c6b7Fw5RaoDow
	 CMgMSOSLlcYdEvYL8IQ1Lj2tRUrSNz0zdfjfMYxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C340F804E4;
	Thu,  3 Dec 2020 03:31:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4B20F80278; Thu,  3 Dec 2020 03:31:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1CC8F8026B
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 03:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1CC8F8026B
IronPort-SDR: 9qIN7Iy5pkhLlO67vId4evAhwBLeiFDcnO/awwLhwylarJX3K+ZmPUY56RGLBnfTbOwdALl2BM
 VornXxHqmZ0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="234727996"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="234727996"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 18:31:22 -0800
IronPort-SDR: /eY2MSugNa5NS2groT3tjuMvg26SfZ/sOKxiMQrJq8hlxxlwJXYAAzLUBitM1NXq7Nju1AKhpn
 Y4qq9Pd1MKUQ==
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="539931647"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 18:31:20 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 4/4] ASoC/SoundWire: rt715-sdca: merge mute/volume operations
Date: Wed,  2 Dec 2020 22:38:45 +0800
Message-Id: <20201202143845.18697-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202143845.18697-1-yung-chuan.liao@linux.intel.com>
References: <20201202143845.18697-1-yung-chuan.liao@linux.intel.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

From: Jack Yu <jack.yu@realtek.com>

The existing code separates mute/volume controls for different channels.
For example, "FU02 1_2" for FU02 channel 1 and 2, and "FU02 3_4" for
FU02 channel 3 and 4.
That is not necessary. We can control all channels with a single
control.

Fixes: 6f4a038b9967 ('ASoC/SoundWire: rt715-sdca: First version of rt715
sdw sdca codec driver')
Signed-off-by: Jack Yu <jack.yu@realtek.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt715-sdca.c | 213 ++++++++++++++++++----------------
 1 file changed, 112 insertions(+), 101 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 42cf5e9ca5b0..b43ac8559e45 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -88,9 +88,18 @@ static int rt715_sdca_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
-	unsigned int val_l, val_r, gain_l_val, gain_r_val;
+	unsigned int val_l, val_r, gain_l_val, gain_r_val, loop_cnt, i, reg;
 	int ret;
 
+	if (strstr(ucontrol->id.name, "FU02 Capture Volume") ||
+		strstr(ucontrol->id.name, "FU06 Capture Volume"))
+		loop_cnt = 2;
+	else if (strstr(ucontrol->id.name, "FU0E Boost") ||
+		strstr(ucontrol->id.name, "FU0C Boost"))
+		loop_cnt = 4;
+	else
+		loop_cnt = 1;
+
 	/* control value to 2s complement */
 	/* L channel */
 	gain_l_val = ucontrol->value.integer.value[0];
@@ -129,18 +138,24 @@ static int rt715_sdca_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* Lch*/
-	ret = regmap_write(rt715->mbq_regmap, mc->reg, gain_l_val);
-	if (ret != 0) {
-		dev_err(component->dev, "Failed to write 0x%x=0x%x\n", mc->reg,
-			gain_l_val);
-		return ret;
+	for (i = 0; i < loop_cnt; i++) {
+		ret = regmap_write(rt715->mbq_regmap, mc->reg + i * 2, gain_l_val);
+		if (ret != 0) {
+			dev_err(component->dev, "Failed to write 0x%x=0x%x\n",
+				mc->reg + i * 2, gain_l_val);
+			return ret;
+		}
 	}
+
 	/* Rch */
-	ret = regmap_write(rt715->mbq_regmap, mc->rreg, gain_r_val);
-	if (ret != 0) {
-		dev_err(component->dev, "Failed to write 0x%x=0x%x\n", mc->rreg,
-			gain_r_val);
-		return ret;
+	for (i = 0; i < loop_cnt; i++) {
+		reg = (i == 3) ? (mc->rreg - 2) | BIT(15) : mc->rreg + i * 2;
+		ret = regmap_write(rt715->mbq_regmap, reg, gain_r_val);
+		if (ret != 0) {
+			dev_err(component->dev, "Failed to write 0x%x=0x%x\n",
+				reg, gain_r_val);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -208,6 +223,86 @@ static int rt715_sdca_set_amp_gain_get(struct snd_kcontrol *kcontrol,
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -17625, 375, 0);
 static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
 
+static int rt715_sdca_fu_info(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+
+	return 0;
+}
+
+static int rt715_sdca_get_volsw(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int invert = mc->invert;
+	unsigned int max = mc->max;
+	int val;
+
+	val = snd_soc_component_read(component, mc->reg);
+	if (val < 0)
+		return -EINVAL;
+	ucontrol->value.integer.value[0] = invert ? max - val : val;
+
+	val = snd_soc_component_read(component, mc->rreg);
+	if (val < 0)
+		return -EINVAL;
+	ucontrol->value.integer.value[1] = invert ? max - val : val;
+
+	return 0;
+}
+
+static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int val, val2, loop_cnt = 2, i;
+	unsigned int invert = mc->invert;
+	unsigned int reg2 = mc->rreg;
+	unsigned int reg = mc->reg;
+	unsigned int max = mc->max;
+	int err;
+
+	val = ucontrol->value.integer.value[0];
+	if (invert)
+		val = max - val;
+
+	val2 = ucontrol->value.integer.value[1];
+	if (invert)
+		val2 = max - val2;
+
+	for (i = 0; i < loop_cnt; i++) {
+		err = snd_soc_component_write(component, reg + i * 2, val);
+		if (err < 0)
+			return err;
+		err = snd_soc_component_write(component, reg2 + i * 2, val2);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+#define RT715_SDCA_FU_VALUE(xlreg, xrreg, xshift, xmax, xinvert) \
+	((unsigned long)&(struct soc_mixer_control) \
+	{.reg = xlreg, .rreg = xrreg, .shift = xshift, \
+	.max = xmax, .invert = xinvert})
+
+#define RT715_SDCA_FU_CTRL(xname, reg_left, reg_right, xshift, xmax, xinvert) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.info = rt715_sdca_fu_info, \
+	.get = rt715_sdca_get_volsw, \
+	.put = rt715_sdca_put_volsw, \
+	.private_value = RT715_SDCA_FU_VALUE(reg_left, reg_right, xshift, \
+					    xmax, xinvert)}
+
 #define SOC_DOUBLE_R_EXT(xname, reg_left, reg_right, xshift, xmax, xinvert,\
 	 xhandler_get, xhandler_put) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
@@ -224,30 +319,18 @@ static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
 			RT715_SDCA_FU_MUTE_CTRL, CH_02),
 			0, 1, 1),
-	SOC_DOUBLE_R("FU02 1_2 Capture Switch",
+	RT715_SDCA_FU_CTRL("FU02 Capture Switch",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
 			RT715_SDCA_FU_MUTE_CTRL, CH_01),
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
 			RT715_SDCA_FU_MUTE_CTRL, CH_02),
 			0, 1, 1),
-	SOC_DOUBLE_R("FU02 3_4 Capture Switch",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
-			RT715_SDCA_FU_MUTE_CTRL, CH_03),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
-			RT715_SDCA_FU_MUTE_CTRL, CH_04),
-			0, 1, 1),
-	SOC_DOUBLE_R("FU06 1_2 Capture Switch",
+	RT715_SDCA_FU_CTRL("FU06 Capture Switch",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
 			RT715_SDCA_FU_MUTE_CTRL, CH_01),
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
 			RT715_SDCA_FU_MUTE_CTRL, CH_02),
 			0, 1, 1),
-	SOC_DOUBLE_R("FU06 3_4 Capture Switch",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
-			RT715_SDCA_FU_MUTE_CTRL, CH_03),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
-			RT715_SDCA_FU_MUTE_CTRL, CH_04),
-			0, 1, 1),
 	/* Volume Control */
 	SOC_DOUBLE_R_EXT_TLV("FU0A Capture Volume",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
@@ -257,7 +340,7 @@ static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
 			0x2f, 0x7f, 0,
 		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		in_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU02 1_2 Capture Volume",
+	SOC_DOUBLE_R_EXT_TLV("FU02 Capture Volume",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
 			RT715_SDCA_FU_VOL_CTRL, CH_01),
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
@@ -265,16 +348,7 @@ static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
 			0x2f, 0x7f, 0,
 		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		in_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU02 3_4 Capture Volume",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
-			RT715_SDCA_FU_VOL_CTRL,
-			CH_03),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
-			RT715_SDCA_FU_VOL_CTRL,
-			CH_04), 0x2f, 0x7f, 0,
-		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
-		in_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU06 1_2 Capture Volume",
+	SOC_DOUBLE_R_EXT_TLV("FU06 Capture Volume",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
 			RT715_SDCA_FU_VOL_CTRL,
 			CH_01),
@@ -283,17 +357,8 @@ static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
 			CH_02), 0x2f, 0x7f, 0,
 		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		in_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU06 3_4 Capture Volume",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
-			RT715_SDCA_FU_VOL_CTRL,
-			CH_03),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
-			RT715_SDCA_FU_VOL_CTRL,
-			CH_04), 0x2f, 0x7f, 0,
-		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
-		in_vol_tlv),
 	/* MIC Boost Control */
-	SOC_DOUBLE_R_EXT_TLV("FU0E 1_2 Boost",
+	SOC_DOUBLE_R_EXT_TLV("FU0E Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_01),
@@ -302,34 +367,7 @@ static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
 			CH_02), 8, 3, 0,
 		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU0E 3_4 Boost",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_03),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_04), 8, 3, 0,
-		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
-		mic_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU0E 5_6 Boost",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_05),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_06), 8, 3, 0,
-		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
-		mic_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU0E 7_8 Boost",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_07),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_08), 8, 3, 0,
-		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
-		mic_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU0C 1_2 Boost",
+	SOC_DOUBLE_R_EXT_TLV("FU0C Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_01),
@@ -338,33 +376,6 @@ static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
 			CH_02), 8, 3, 0,
 		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU0C 3_4 Boost",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_03),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_04), 8, 3, 0,
-		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
-		mic_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU0C 5_6 Boost",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_05),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_06), 8, 3, 0,
-		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
-		mic_vol_tlv),
-	SOC_DOUBLE_R_EXT_TLV("FU0C 7_8 Boost",
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_07),
-		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
-			RT715_SDCA_FU_DMIC_GAIN_CTRL,
-			CH_08), 8, 3, 0,
-		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
-		mic_vol_tlv),
 };
 
 static int rt715_sdca_mux_get(struct snd_kcontrol *kcontrol,
-- 
2.17.1

