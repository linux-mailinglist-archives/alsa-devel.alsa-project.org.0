Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8642D9359
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 07:44:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A2C71724;
	Mon, 14 Dec 2020 07:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A2C71724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607928281;
	bh=wiys0AYRpB1eOy6SSYJbv7b5iWTTgJPSX9UZmM03wio=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CSKImxcECzyJHUmT46EyJd5M6sERZ60Bom6fZtaOQ+v3Ef3geBd3Q2EUfwxVNpDGM
	 G6SopdGEbh02yvXGZ901OZqM3RFdudtsu+S2u8Nrku2zxemnSs87b25fSui+wGQDp/
	 NEdJ400hnOwvqpum+S9/7c2saubhQRNzR7ykPz3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98BDAF80129;
	Mon, 14 Dec 2020 07:43:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B8D8F80121; Mon, 14 Dec 2020 07:42:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30FF2F80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 07:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30FF2F80121
IronPort-SDR: w64dRIwxDRNLJ6LaJzPp30a3C8HoGt3spUSP1CIZs3zHU0Do8Kr96F1QiEFoszc5agheKvGD3M
 BoIv5u2LXlzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="173893828"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; d="scan'208";a="173893828"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 22:42:43 -0800
IronPort-SDR: uMedxYny5+kYm/Ayiue2SKTp9YcXsD+SioqEQmELNA2u+BYn2tSbHFvi0/SCpC9Vu5lCO0zcSe
 kei27wvHL/VQ==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; d="scan'208";a="367138342"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 22:42:41 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH v2] ASoC: max98373: don't access volatile registers in bias
 level off
Date: Mon, 14 Dec 2020 14:42:37 +0800
Message-Id: <20201214064237.15763-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 ryans.lee@maximintegrated.com, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

We will set regcache_cache_only true in suspend. As a result,
regmap_read will return error when we try to read volatile
registers in suspend. Besides, it doesn't make sense to read
feedback data when codec is not active. To make userspace
happy, this patch returns a cached value shich should be a
valid value.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
v2:
 - Return cached values instead of 0.
---
 sound/soc/codecs/max98373-i2c.c |  8 ++++++++
 sound/soc/codecs/max98373-sdw.c |  8 ++++++++
 sound/soc/codecs/max98373.c     | 34 ++++++++++++++++++++++++++++++---
 sound/soc/codecs/max98373.h     | 14 ++++++++++++++
 4 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 92921e34f948..09890478b120 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -472,6 +472,11 @@ static struct snd_soc_dai_driver max98373_dai[] = {
 static int max98373_suspend(struct device *dev)
 {
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
+	int i;
+
+	/* cache feedback register values before suspend */
+	for (i = 0; i < max98373->cache_num; i++)
+		regmap_read(max98373->regmap, max98373->cache[i].reg, &max98373->cache[i].val);
 
 	regcache_cache_only(max98373->regmap, true);
 	regcache_mark_dirty(max98373->regmap);
@@ -534,6 +539,9 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	max98373->cache = max98373_cache;
+	max98373->cache_num = ARRAY_SIZE(max98373_cache);
+
 	/* voltage/current slot & gpio configuration */
 	max98373_slot_config(&i2c->dev, max98373);
 
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index ec2e79c57357..0575d323df8a 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -245,6 +245,11 @@ static const struct regmap_config max98373_sdw_regmap = {
 static __maybe_unused int max98373_suspend(struct device *dev)
 {
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
+	int i;
+
+	/* cache feedback register values before suspend */
+	for (i = 0; i < max98373->cache_num; i++)
+		regmap_read(max98373->regmap, max98373->cache[i].reg, &max98373->cache[i].val);
 
 	regcache_cache_only(max98373->regmap, true);
 
@@ -768,6 +773,9 @@ static int max98373_init(struct sdw_slave *slave, struct regmap *regmap)
 	max98373->regmap = regmap;
 	max98373->slave = slave;
 
+	max98373->cache = max98373_cache;
+	max98373->cache_num = ARRAY_SIZE(max98373_cache);
+
 	/* Read voltage and slot configuration */
 	max98373_slot_config(dev, max98373);
 
diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 929bb1798c43..31d571d4fac1 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -168,6 +168,31 @@ static SOC_ENUM_SINGLE_DECL(max98373_adc_samplerate_enum,
 			    MAX98373_R2051_MEAS_ADC_SAMPLING_RATE, 0,
 			    max98373_ADC_samplerate_text);
 
+static int max98373_feedback_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
+	int i;
+
+	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		/*
+		 * Register values will be cached before suspend. The cached value
+		 * will be a valid value and userspace will happy with that.
+		 */
+		for (i = 0; i < max98373->cache_num; i++) {
+			if (mc->reg == max98373->cache[i].reg) {
+				ucontrol->value.integer.value[0] = max98373->cache[i].val;
+				return 0;
+			}
+		}
+	}
+
+	return snd_soc_put_volsw(kcontrol, ucontrol);
+}
+
 static const struct snd_kcontrol_new max98373_snd_controls[] = {
 SOC_SINGLE("Digital Vol Sel Switch", MAX98373_R203F_AMP_DSP_CFG,
 	MAX98373_AMP_VOL_SEL_SHIFT, 1, 0),
@@ -209,8 +234,10 @@ SOC_SINGLE("ADC PVDD FLT Switch", MAX98373_R2052_MEAS_ADC_PVDD_FLT_CFG,
 	MAX98373_FLT_EN_SHIFT, 1, 0),
 SOC_SINGLE("ADC TEMP FLT Switch", MAX98373_R2053_MEAS_ADC_THERM_FLT_CFG,
 	MAX98373_FLT_EN_SHIFT, 1, 0),
-SOC_SINGLE("ADC PVDD", MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK, 0, 0xFF, 0),
-SOC_SINGLE("ADC TEMP", MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK, 0, 0xFF, 0),
+SOC_SINGLE_EXT("ADC PVDD", MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK, 0, 0xFF, 0,
+	max98373_feedback_get, NULL),
+SOC_SINGLE_EXT("ADC TEMP", MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK, 0, 0xFF, 0,
+	max98373_feedback_get, NULL),
 SOC_SINGLE("ADC PVDD FLT Coeff", MAX98373_R2052_MEAS_ADC_PVDD_FLT_CFG,
 	0, 0x3, 0),
 SOC_SINGLE("ADC TEMP FLT Coeff", MAX98373_R2053_MEAS_ADC_THERM_FLT_CFG,
@@ -226,7 +253,8 @@ SOC_SINGLE("BDE LVL1 Thresh", MAX98373_R2097_BDE_L1_THRESH, 0, 0xFF, 0),
 SOC_SINGLE("BDE LVL2 Thresh", MAX98373_R2098_BDE_L2_THRESH, 0, 0xFF, 0),
 SOC_SINGLE("BDE LVL3 Thresh", MAX98373_R2099_BDE_L3_THRESH, 0, 0xFF, 0),
 SOC_SINGLE("BDE LVL4 Thresh", MAX98373_R209A_BDE_L4_THRESH, 0, 0xFF, 0),
-SOC_SINGLE("BDE Active Level", MAX98373_R20B6_BDE_CUR_STATE_READBACK, 0, 8, 0),
+SOC_SINGLE_EXT("BDE Active Level", MAX98373_R20B6_BDE_CUR_STATE_READBACK, 0, 8, 0,
+	max98373_feedback_get, NULL),
 SOC_SINGLE("BDE Clip Mode Switch", MAX98373_R2092_BDE_CLIPPER_MODE, 0, 1, 0),
 SOC_SINGLE("BDE Thresh Hysteresis", MAX98373_R209B_BDE_THRESH_HYST, 0, 0xFF, 0),
 SOC_SINGLE("BDE Hold Time", MAX98373_R2090_BDE_LVL_HOLD, 0, 0xFF, 0),
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index 4ab29b9d51c7..6206c6c3a773 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -203,6 +203,17 @@
 /* MAX98373_R2000_SW_RESET */
 #define MAX98373_SOFT_RESET (0x1 << 0)
 
+struct max98373_cache {
+	u32 reg;
+	u32 val;
+};
+
+struct max98373_cache max98373_cache[] = {
+	{MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK, 0},
+	{MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK, 0},
+	{MAX98373_R20B6_BDE_CUR_STATE_READBACK, 0},
+};
+
 struct max98373_priv {
 	struct regmap *regmap;
 	int reset_gpio;
@@ -212,6 +223,9 @@ struct max98373_priv {
 	bool interleave_mode;
 	unsigned int ch_size;
 	bool tdm_mode;
+	/* cache for reading a valid fake feedback value */
+	struct max98373_cache *cache;
+	int cache_num;
 	/* variables to support soundwire */
 	struct sdw_slave *slave;
 	bool hw_init;
-- 
2.17.1

