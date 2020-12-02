Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A282CCCB3
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 03:33:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05A15182A;
	Thu,  3 Dec 2020 03:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05A15182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606962838;
	bh=ia7fjjke1O1a30knHZydNnYkxbTVKMb6L2XPI4KIul8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gIfufbiuBItbcB2xDqwujVe31JyiHsnZ1bKcdSBAQk+b5ASGoQVMok8Rt/3TE+9gL
	 uDMmJOpHVszTmEkNa6VBbM0qEX002gqF93tBIQ5TVyrKa7oXdSeG8rQx/kgRHcwjbp
	 zs4NHNFagTqqgrIv8ZpuzaVALgzQXgwN/UeLVovA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA0DF804E0;
	Thu,  3 Dec 2020 03:31:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8BBCF8049C; Thu,  3 Dec 2020 03:31:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24E04F8016D
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 03:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24E04F8016D
IronPort-SDR: 1Xb1+0wyptgx+3lNPLybBCpIY7vP1pv0S1HEWFDN0So2UCJujX/PSo1I64Cy+R1VB7R17n4NAa
 1P9pYZTCgljw==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="234727994"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="234727994"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 18:31:20 -0800
IronPort-SDR: gfk078eK5EGoxT9pdv2QKD5vCbFwhztxbXxgBMsGmc8VmnQruAs5jx+oSxJnq58wU++vISoD6P
 9HBzhlqC9TWw==
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="539931632"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 18:31:18 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 3/4] ASoC/SoundWire: rt715-sdca: use rt715_sdca prefix for
 symbols
Date: Wed,  2 Dec 2020 22:38:44 +0800
Message-Id: <20201202143845.18697-4-yung-chuan.liao@linux.intel.com>
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

To avoid using the same name as rt715 driver and resulting in compiling
issue.

Fixes: 6f4a038b9967 ('ASoC/SoundWire: rt715-sdca: First version of rt715
sdw sdca codec driver')
Signed-off-by: Jack Yu <jack.yu@realtek.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt715-sdca-sdw.c |  12 +--
 sound/soc/codecs/rt715-sdca.c     | 126 +++++++++++++++---------------
 sound/soc/codecs/rt715-sdca.h     |   4 +-
 3 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 889b6b3b0009..e73a826ee8e3 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -114,7 +114,7 @@ static const struct regmap_config rt715_sdca_mbq_regmap = {
 	.use_single_write = true,
 };
 
-static int rt715_update_status(struct sdw_slave *slave,
+static int rt715_sdca_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(&slave->dev);
@@ -130,10 +130,10 @@ static int rt715_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt715_io_init(&slave->dev, slave);
+	return rt715_sdca_io_init(&slave->dev, slave);
 }
 
-static int rt715_read_prop(struct sdw_slave *slave)
+static int rt715_sdca_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
 	int nval, i;
@@ -171,8 +171,8 @@ static int rt715_read_prop(struct sdw_slave *slave)
 }
 
 static struct sdw_slave_ops rt715_sdca_slave_ops = {
-	.read_prop = rt715_read_prop,
-	.update_status = rt715_update_status,
+	.read_prop = rt715_sdca_read_prop,
+	.update_status = rt715_sdca_update_status,
 };
 
 static int rt715_sdca_sdw_probe(struct sdw_slave *slave,
@@ -191,7 +191,7 @@ static int rt715_sdca_sdw_probe(struct sdw_slave *slave,
 	if (!regmap)
 		return -EINVAL;
 
-	return rt715_init(&slave->dev, mbq_regmap, regmap, slave);
+	return rt715_sdca_init(&slave->dev, mbq_regmap, regmap, slave);
 }
 
 static const struct sdw_device_id rt715_sdca_id[] = {
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index b843e47eb25b..42cf5e9ca5b0 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -29,8 +29,8 @@
 
 #include "rt715-sdca.h"
 
-static int rt715_index_write(struct rt715_sdca_priv *rt715, unsigned int nid,
-		unsigned int reg, unsigned int value)
+static int rt715_sdca_index_write(struct rt715_sdca_priv *rt715,
+		unsigned int nid, unsigned int reg, unsigned int value)
 {
 	struct regmap *regmap = rt715->mbq_regmap;
 	unsigned int addr;
@@ -47,7 +47,7 @@ static int rt715_index_write(struct rt715_sdca_priv *rt715, unsigned int nid,
 	return ret;
 }
 
-static int rt715_index_read(struct rt715_sdca_priv *rt715,
+static int rt715_sdca_index_read(struct rt715_sdca_priv *rt715,
 		unsigned int nid, unsigned int reg, unsigned int *value)
 {
 	struct regmap *regmap = rt715->mbq_regmap;
@@ -65,23 +65,23 @@ static int rt715_index_read(struct rt715_sdca_priv *rt715,
 	return ret;
 }
 
-static int rt715_index_update_bits(struct rt715_sdca_priv *rt715,
+static int rt715_sdca_index_update_bits(struct rt715_sdca_priv *rt715,
 	unsigned int nid, unsigned int reg, unsigned int mask, unsigned int val)
 {
 	unsigned int tmp;
 	int ret;
 
-	ret = rt715_index_read(rt715, nid, reg, &tmp);
+	ret = rt715_sdca_index_read(rt715, nid, reg, &tmp);
 	if (ret < 0)
 		return ret;
 
 	set_mask_bits(&tmp, mask, val);
 
-	return rt715_index_write(rt715, nid, reg, tmp);
+	return rt715_sdca_index_write(rt715, nid, reg, tmp);
 }
 
 /* SDCA Volume/Boost control */
-static int rt715_set_amp_gain_put_sdca(struct snd_kcontrol *kcontrol,
+static int rt715_sdca_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
@@ -146,7 +146,7 @@ static int rt715_set_amp_gain_put_sdca(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int rt715_set_amp_gain_get_sdca(struct snd_kcontrol *kcontrol,
+static int rt715_sdca_set_amp_gain_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
@@ -216,7 +216,7 @@ static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
 	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
 					    xmax, xinvert) }
 
-static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
+static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
 	/* Capture switch */
 	SOC_DOUBLE_R("FU0A Capture Switch",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
@@ -255,7 +255,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
 			RT715_SDCA_FU_VOL_CTRL, CH_02),
 			0x2f, 0x7f, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		in_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU02 1_2 Capture Volume",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
@@ -263,7 +263,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
 			RT715_SDCA_FU_VOL_CTRL, CH_02),
 			0x2f, 0x7f, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		in_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU02 3_4 Capture Volume",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
@@ -272,7 +272,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
 			RT715_SDCA_FU_VOL_CTRL,
 			CH_04), 0x2f, 0x7f, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		in_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU06 1_2 Capture Volume",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
@@ -281,7 +281,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
 			RT715_SDCA_FU_VOL_CTRL,
 			CH_02), 0x2f, 0x7f, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		in_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU06 3_4 Capture Volume",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
@@ -290,7 +290,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
 			RT715_SDCA_FU_VOL_CTRL,
 			CH_04), 0x2f, 0x7f, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		in_vol_tlv),
 	/* MIC Boost Control */
 	SOC_DOUBLE_R_EXT_TLV("FU0E 1_2 Boost",
@@ -300,7 +300,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_02), 8, 3, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU0E 3_4 Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
@@ -309,7 +309,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_04), 8, 3, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU0E 5_6 Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
@@ -318,7 +318,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_06), 8, 3, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU0E 7_8 Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
@@ -327,7 +327,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_08), 8, 3, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU0C 1_2 Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
@@ -336,7 +336,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_02), 8, 3, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU0C 3_4 Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
@@ -345,7 +345,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_04), 8, 3, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU0C 5_6 Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
@@ -354,7 +354,7 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_06), 8, 3, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU0C 7_8 Boost",
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
@@ -363,11 +363,11 @@ static const struct snd_kcontrol_new rt715_snd_controls_sdca[] = {
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
 			RT715_SDCA_FU_DMIC_GAIN_CTRL,
 			CH_08), 8, 3, 0,
-		rt715_set_amp_gain_get_sdca, rt715_set_amp_gain_put_sdca,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
 		mic_vol_tlv),
 };
 
-static int rt715_mux_get(struct snd_kcontrol *kcontrol,
+static int rt715_sdca_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
@@ -386,7 +386,7 @@ static int rt715_mux_get(struct snd_kcontrol *kcontrol,
 	else
 		return -EINVAL;
 
-	rt715_index_read(rt715, RT715_VENDOR_HDA_CTL,
+	rt715_sdca_index_read(rt715, RT715_VENDOR_HDA_CTL,
 		RT715_HDA_LEGACY_MUX_CTL1, &val);
 	val = (val >> mask_sft) & 0xf;
 
@@ -403,7 +403,7 @@ static int rt715_mux_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int rt715_mux_put(struct snd_kcontrol *kcontrol,
+static int rt715_sdca_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
@@ -432,14 +432,14 @@ static int rt715_mux_put(struct snd_kcontrol *kcontrol,
 	/* Verb ID = 0x701h, nid = e->reg */
 	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
 
-	rt715_index_read(rt715, RT715_VENDOR_HDA_CTL,
+	rt715_sdca_index_read(rt715, RT715_VENDOR_HDA_CTL,
 		RT715_HDA_LEGACY_MUX_CTL1, &val2);
 	val2 = (val2 >> mask_sft) & 0xf;
 
 	change = val != val2;
 
 	if (change)
-		rt715_index_update_bits(rt715, RT715_VENDOR_HDA_CTL,
+		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_HDA_CTL,
 			RT715_HDA_LEGACY_MUX_CTL1, 0xf << mask_sft, val << mask_sft);
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, item[0], e, NULL);
@@ -502,21 +502,21 @@ static SOC_VALUE_ENUM_SINGLE_DECL(rt715_adc25_enum,
 
 static const struct snd_kcontrol_new rt715_adc22_mux =
 	SOC_DAPM_ENUM_EXT("ADC 22 Mux", rt715_adc22_enum,
-			rt715_mux_get, rt715_mux_put);
+			rt715_sdca_mux_get, rt715_sdca_mux_put);
 
 static const struct snd_kcontrol_new rt715_adc23_mux =
 	SOC_DAPM_ENUM_EXT("ADC 23 Mux", rt715_adc23_enum,
-			rt715_mux_get, rt715_mux_put);
+			rt715_sdca_mux_get, rt715_sdca_mux_put);
 
 static const struct snd_kcontrol_new rt715_adc24_mux =
 	SOC_DAPM_ENUM_EXT("ADC 24 Mux", rt715_adc24_enum,
-			rt715_mux_get, rt715_mux_put);
+			rt715_sdca_mux_get, rt715_sdca_mux_put);
 
 static const struct snd_kcontrol_new rt715_adc25_mux =
 	SOC_DAPM_ENUM_EXT("ADC 25 Mux", rt715_adc25_enum,
-			rt715_mux_get, rt715_mux_put);
+			rt715_sdca_mux_get, rt715_sdca_mux_put);
 
-static int rt715_pde23_24_event(struct snd_soc_dapm_widget *w,
+static int rt715_sdca_pde23_24_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
@@ -540,7 +540,7 @@ static int rt715_pde23_24_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static const struct snd_soc_dapm_widget rt715_dapm_widgets[] = {
+static const struct snd_soc_dapm_widget rt715_sdca_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("DMIC1"),
 	SND_SOC_DAPM_INPUT("DMIC2"),
 	SND_SOC_DAPM_INPUT("DMIC3"),
@@ -551,7 +551,7 @@ static const struct snd_soc_dapm_widget rt715_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("LINE2"),
 
 	SND_SOC_DAPM_SUPPLY("PDE23_24", SND_SOC_NOPM, 0, 0,
-		rt715_pde23_24_event,
+		rt715_sdca_pde23_24_event,
 		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 
 	SND_SOC_DAPM_ADC("ADC 07", NULL, SND_SOC_NOPM, 4, 0),
@@ -570,7 +570,7 @@ static const struct snd_soc_dapm_widget rt715_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("DP6TX", "DP6 Capture", 0, SND_SOC_NOPM, 0, 0),
 };
 
-static const struct snd_soc_dapm_route rt715_audio_map[] = {
+static const struct snd_soc_dapm_route rt715_sdca_audio_map[] = {
 	{"DP6TX", NULL, "ADC 09"},
 	{"DP6TX", NULL, "ADC 08"},
 	{"DP4TX", NULL, "ADC 07"},
@@ -620,15 +620,15 @@ static const struct snd_soc_dapm_route rt715_audio_map[] = {
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_rt715_sdca = {
-	.controls = rt715_snd_controls_sdca,
-	.num_controls = ARRAY_SIZE(rt715_snd_controls_sdca),
-	.dapm_widgets = rt715_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(rt715_dapm_widgets),
-	.dapm_routes = rt715_audio_map,
-	.num_dapm_routes = ARRAY_SIZE(rt715_audio_map),
+	.controls = rt715_sdca_snd_controls,
+	.num_controls = ARRAY_SIZE(rt715_sdca_snd_controls),
+	.dapm_widgets = rt715_sdca_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt715_sdca_dapm_widgets),
+	.dapm_routes = rt715_sdca_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(rt715_sdca_audio_map),
 };
 
-static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+static int rt715_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 				int direction)
 {
 	struct rt715_sdw_stream_data *stream;
@@ -648,7 +648,7 @@ static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	return 0;
 }
 
-static void rt715_shutdown(struct snd_pcm_substream *substream,
+static void rt715_sdca_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 
 {
@@ -662,7 +662,7 @@ static void rt715_shutdown(struct snd_pcm_substream *substream,
 	kfree(stream);
 }
 
-static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
+static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
@@ -687,13 +687,13 @@ static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 	case RT715_AIF1:
 		direction = SDW_DATA_DIR_TX;
 		port = 6;
-		rt715_index_write(rt715, RT715_VENDOR_REG, RT715_SDW_INPUT_SEL,
+		rt715_sdca_index_write(rt715, RT715_VENDOR_REG, RT715_SDW_INPUT_SEL,
 			0xa500);
 		break;
 	case RT715_AIF2:
 		direction = SDW_DATA_DIR_TX;
 		port = 4;
-		rt715_index_write(rt715, RT715_VENDOR_REG, RT715_SDW_INPUT_SEL,
+		rt715_sdca_index_write(rt715, RT715_VENDOR_REG, RT715_SDW_INPUT_SEL,
 			0xaf00);
 		break;
 	default:
@@ -777,7 +777,7 @@ static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int rt715_pcm_hw_free(struct snd_pcm_substream *substream,
+static int rt715_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
@@ -796,14 +796,14 @@ static int rt715_pcm_hw_free(struct snd_pcm_substream *substream,
 #define RT715_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
-static struct snd_soc_dai_ops rt715_ops = {
-	.hw_params	= rt715_pcm_hw_params,
-	.hw_free	= rt715_pcm_hw_free,
-	.set_sdw_stream	= rt715_set_sdw_stream,
-	.shutdown	= rt715_shutdown,
+static struct snd_soc_dai_ops rt715_sdca_ops = {
+	.hw_params	= rt715_sdca_pcm_hw_params,
+	.hw_free	= rt715_sdca_pcm_hw_free,
+	.set_sdw_stream	= rt715_sdca_set_sdw_stream,
+	.shutdown	= rt715_sdca_shutdown,
 };
 
-static struct snd_soc_dai_driver rt715_dai[] = {
+static struct snd_soc_dai_driver rt715_sdca_dai[] = {
 	{
 		.name = "rt715-aif1",
 		.id = RT715_AIF1,
@@ -814,7 +814,7 @@ static struct snd_soc_dai_driver rt715_dai[] = {
 			.rates = RT715_STEREO_RATES,
 			.formats = RT715_FORMATS,
 		},
-		.ops = &rt715_ops,
+		.ops = &rt715_sdca_ops,
 	},
 	{
 		.name = "rt715-aif2",
@@ -826,7 +826,7 @@ static struct snd_soc_dai_driver rt715_dai[] = {
 			.rates = RT715_STEREO_RATES,
 			.formats = RT715_FORMATS,
 		},
-		.ops = &rt715_ops,
+		.ops = &rt715_sdca_ops,
 	},
 };
 
@@ -838,7 +838,7 @@ static struct snd_soc_dai_driver rt715_dai[] = {
 #define RT715_CLK_FREQ_2400000HZ 2400000
 #define RT715_CLK_FREQ_12288000HZ 12288000
 
-int rt715_init(struct device *dev, struct regmap *mbq_regmap,
+int rt715_sdca_init(struct device *dev, struct regmap *mbq_regmap,
 	struct regmap *regmap, struct sdw_slave *slave)
 {
 	struct rt715_sdca_priv *rt715;
@@ -862,13 +862,13 @@ int rt715_init(struct device *dev, struct regmap *mbq_regmap,
 
 	ret = devm_snd_soc_register_component(dev,
 			&soc_codec_dev_rt715_sdca,
-			rt715_dai,
-			ARRAY_SIZE(rt715_dai));
+			rt715_sdca_dai,
+			ARRAY_SIZE(rt715_sdca_dai));
 
 	return ret;
 }
 
-int rt715_io_init(struct device *dev, struct sdw_slave *slave)
+int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
 	unsigned int hw_ver;
@@ -897,7 +897,7 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
-	rt715_index_read(rt715, RT715_VENDOR_REG,
+	rt715_sdca_index_read(rt715, RT715_VENDOR_REG,
 		RT715_PRODUCT_NUM, &hw_ver);
 	hw_ver = hw_ver & 0x000f;
 
@@ -907,12 +907,12 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
 			RT715_SDCA_CX_CLK_SEL_CTRL, CH_00), 0x1);
 	/* set GPIO_4/5/6 to be 3rd/4th DMIC usage */
 	if (hw_ver == 0x0)
-		rt715_index_update_bits(rt715, RT715_VENDOR_REG,
+		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_REG,
 			RT715_AD_FUNC_EN, 0x54, 0x54);
 	else if (hw_ver == 0x1) {
-		rt715_index_update_bits(rt715, RT715_VENDOR_REG,
+		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_REG,
 			RT715_AD_FUNC_EN, 0x55, 0x55);
-		rt715_index_update_bits(rt715, RT715_VENDOR_REG,
+		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_REG,
 			RT715_REV_1, 0x40, 0x40);
 	}
 	/* trigger mode = VAD enable */
diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.h
index 6326cd8c374e..840c237895dd 100644
--- a/sound/soc/codecs/rt715-sdca.h
+++ b/sound/soc/codecs/rt715-sdca.h
@@ -117,8 +117,8 @@ enum {
 	RT715_AIF2,
 };
 
-int rt715_io_init(struct device *dev, struct sdw_slave *slave);
-int rt715_init(struct device *dev, struct regmap *mbq_regmap,
+int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave);
+int rt715_sdca_init(struct device *dev, struct regmap *mbq_regmap,
 	struct regmap *regmap, struct sdw_slave *slave);
 
 #endif /* __RT715_SDCA_H__ */
-- 
2.17.1

