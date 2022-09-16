Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69625BAC1E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 13:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48F631AA2;
	Fri, 16 Sep 2022 13:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48F631AA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663326894;
	bh=rMxZoopL3pX9CVeNH0tkiG39os//4xbCUhR8NN4VmmE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rh+FsnGG3Zy18C+YLcq9yRJ766Ioh1KrjlFaI5PWBX5qG5vRi94+eqHICMHxw6TAX
	 1TP3gz3rqr5OvNWWxzl+JHL7kbU9fmtgiDSGe+1jHnTZp3S2LnsLeCI3+iBjWqe/g9
	 eq2jIB9NNzLv8lLOOSLSJcWGbM0NNaCBuuS9ArCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 917EEF80496;
	Fri, 16 Sep 2022 13:13:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 179F1F802BE; Fri, 16 Sep 2022 13:13:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7043DF8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 13:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7043DF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lO2lVeQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663326829; x=1694862829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rMxZoopL3pX9CVeNH0tkiG39os//4xbCUhR8NN4VmmE=;
 b=lO2lVeQQCCUCqQtwRg73KSnFSnelgwo/Xpr99nqlg2Ekcm3sE+fSjMPT
 8Aa6Z7MmF4cKAXxHuxSfYb66OJILidVBmooa3ogRWEI/MzqLCS6eM1xhn
 EjVS2e4mSUT7SZymrholJrSLgrsmmlCA6gs2C8i7lnMdrHRh8KtmyRwPV
 8yT2cQLCO3TnDJXab99b7QOnqgH9SPfBr8XpJR3vmr6Y6ksxRXsvPmmnV
 2SVZInx52AxBMwHjbgn7FLe0Vw2iSyd+vQo1xegH5Ma8pUcWWaYPaF+3w
 t1a07MvvUgO6y/tEcWoRD900MfrpMKNY/oId9uiCHwtgpfICd/wj8Kf5s g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="325243151"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="325243151"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 04:13:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="679927862"
Received: from ncleary-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.16.186])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 04:13:41 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	steve.lee.analog@gmail.com
Subject: [PATCH v2] ASoC: max98390: Fix dsm calibration reading
Date: Fri, 16 Sep 2022 14:13:49 +0300
Message-Id: <20220916111349.4433-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: fred.oh@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com
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

With the change introduced by 6ac246105b4f, the calibration can only be
done after the codec probe (but questionable if it is working since
203A_AMP_EN is 0) or when the codec is powered up for audio use, in other
cases "AMP is not ready to run calibration" is printed.

This changes how this worked before the patch: the codec was force powered
on for the duration of the calibration readout, then shut down.
So, if a calibration was asked when the codec was active, it would have
powered it down?

To correct the calibration logic: check if the codec is powered on and if
it is not then enable it, do the readout and put it back to disabled.
Do this while keeping the dapm locked to avoid interfering with normal
operation via DAPM.

Fixes: 6ac246105b4f ("ASoC: max98390: Remove unnecessary amp on/off conrtol")
Reported-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

Changes since v1:
- typos corrected in the commit message

Regards,
Peter

 sound/soc/codecs/max98390.c | 79 ++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 4ef8cd1053af..7a5260ff8d6b 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -161,8 +161,6 @@ static struct reg_default max98390_reg_defaults[] = {
 	{MAX98390_R23FF_GLOBAL_EN, 0x00},
 };
 
-static int max98390_dsm_calibrate(struct snd_soc_component *component);
-
 static int max98390_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = codec_dai->component;
@@ -635,20 +633,49 @@ static int max98390_dsm_calib_get(struct snd_kcontrol *kcontrol,
 static int max98390_dsm_calib_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned int val;
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct max98390_priv *max98390 =
-		snd_soc_component_get_drvdata(component);
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct max98390_priv *max98390 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	unsigned int rdc, rdc_cal_result, rdc_integer, rdc_factor, temp, val;
+
+	snd_soc_dapm_mutex_lock(dapm);
 
 	regmap_read(max98390->regmap, MAX98390_R23FF_GLOBAL_EN, &val);
-	if (val == 0x1)
-		max98390_dsm_calibrate(component);
-	else {
-		dev_err(component->dev, "AMP is not ready to run calibration\n");
-		return -ECANCELED;
+	if (!val) {
+		/* Enable the codec for the duration of calibration readout */
+		regmap_update_bits(max98390->regmap, MAX98390_R203A_AMP_EN,
+				   MAX98390_AMP_EN_MASK, 1);
+		regmap_update_bits(max98390->regmap, MAX98390_R23FF_GLOBAL_EN,
+				   MAX98390_GLOBAL_EN_MASK, 1);
+	}
+
+	regmap_read(max98390->regmap, THERMAL_RDC_RD_BACK_BYTE1, &rdc);
+	regmap_read(max98390->regmap, THERMAL_RDC_RD_BACK_BYTE0, &rdc_cal_result);
+	regmap_read(max98390->regmap, MAX98390_MEAS_ADC_CH2_READ, &temp);
+
+	if (!val) {
+		/* Disable the codec if it was disabled */
+		regmap_update_bits(max98390->regmap, MAX98390_R23FF_GLOBAL_EN,
+				   MAX98390_GLOBAL_EN_MASK, 0);
+		regmap_update_bits(max98390->regmap, MAX98390_R203A_AMP_EN,
+				   MAX98390_AMP_EN_MASK, 0);
 	}
 
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	rdc_cal_result |= (rdc << 8) & 0x0000FFFF;
+	if (rdc_cal_result)
+		max98390->ref_rdc_value = 268435456U / rdc_cal_result;
+
+	max98390->ambient_temp_value = temp * 52 - 1188;
+
+	rdc_integer =  rdc_cal_result * 937  / 65536;
+	rdc_factor = ((rdc_cal_result * 937 * 100) / 65536) - (rdc_integer * 100);
+
+	dev_info(component->dev,
+		 "rdc resistance about %d.%02d ohm, reg=0x%X temp reg=0x%X\n",
+		 rdc_integer, rdc_factor, rdc_cal_result, temp);
+
 	return 0;
 }
 
@@ -828,34 +855,6 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	return ret;
 }
 
-static int max98390_dsm_calibrate(struct snd_soc_component *component)
-{
-	unsigned int rdc, rdc_cal_result, temp;
-	unsigned int rdc_integer, rdc_factor;
-	struct max98390_priv *max98390 =
-		snd_soc_component_get_drvdata(component);
-
-	regmap_read(max98390->regmap,
-		THERMAL_RDC_RD_BACK_BYTE1, &rdc);
-	regmap_read(max98390->regmap,
-		THERMAL_RDC_RD_BACK_BYTE0, &rdc_cal_result);
-	rdc_cal_result |= (rdc << 8) & 0x0000FFFF;
-	if (rdc_cal_result)
-		max98390->ref_rdc_value = 268435456U / rdc_cal_result;
-
-	regmap_read(max98390->regmap, MAX98390_MEAS_ADC_CH2_READ, &temp);
-	max98390->ambient_temp_value = temp * 52 - 1188;
-
-	rdc_integer =  rdc_cal_result * 937  / 65536;
-	rdc_factor = ((rdc_cal_result * 937 * 100) / 65536)
-					- (rdc_integer * 100);
-
-	dev_info(component->dev, "rdc resistance about %d.%02d ohm, reg=0x%X temp reg=0x%X\n",
-		 rdc_integer, rdc_factor, rdc_cal_result, temp);
-
-	return 0;
-}
-
 static void max98390_init_regs(struct snd_soc_component *component)
 {
 	struct max98390_priv *max98390 =
-- 
2.37.3

