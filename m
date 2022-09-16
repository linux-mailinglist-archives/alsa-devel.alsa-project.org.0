Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 320545BA9A4
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 11:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3F71A46;
	Fri, 16 Sep 2022 11:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3F71A46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663321418;
	bh=cfUnlsC0M5BOl0KJTEzTYIPwzoYUUdUZzNsWhgaauHo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R/lY5JMSl0kw05UoI6uZiIogDsSGG6OU+7VvZ3y496pOe5JGJyEPofpmsmTVQiH2v
	 1JTPWOfQYXmOns1LJroQ4TrpajRDSroMnsoFmGhHVnD6L+HBtrmeGjvgc6/tr/WpFy
	 HR3WMFtm0ZSZbC5PfgI4/gRpssNE0Mrom+D7etc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 471B3F80496;
	Fri, 16 Sep 2022 11:42:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AF87F802BE; Fri, 16 Sep 2022 11:42:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB1DAF8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 11:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB1DAF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ykp1uzW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663321354; x=1694857354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cfUnlsC0M5BOl0KJTEzTYIPwzoYUUdUZzNsWhgaauHo=;
 b=Ykp1uzW4doZahk4wUSzDc7wDZyYOzCHtsfY5kF3RdM18gpnQqn6sNsLU
 KfvtGbyTjF+18iEH+aiU96krY65QhXSCclVonUP5Oc9TBtRRvGpg7kYw0
 h8iIcGsk6Xr0R6Dc4YsQg9FTVf2FZCITH2Ju/gHhHB3wFETQtBKZB8koW
 z/1t9bzw0An/AO12UVqdwivWyC4bMyETdOIol25sO7K8uDaeWZEiYyV56
 1yV06IuPPHl6AsnhjgHYZ2/mSJKHceUlBBu1vginPAQXyX24UUysXQqkB
 hBHYUL5xqV/QOvi9P/yjYTik52DlvEgpyWIWvWjOIOZtJb1FNxVihDC2B A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="362918726"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="362918726"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:42:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="568774154"
Received: from ncleary-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.16.186])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:42:28 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	steve.lee.analog@gmail.com
Subject: [PATCH] ASoC: max98390: Fix dsm calibration reading
Date: Fri, 16 Sep 2022 12:42:35 +0300
Message-Id: <20220916094235.1471-1-peter.ujfalusi@linux.intel.com>
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
Do this while keeping the dapm licked to avoid interfering with normal
operation wia DAPM.

Fixes: 6ac246105b4f ("ASoC: max98390: Remove unnecessary amp on/off conrtol")
Reported-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
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

