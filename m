Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C223008F6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 17:47:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5939C1EF9;
	Fri, 22 Jan 2021 17:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5939C1EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611334055;
	bh=F+w9wXEQ7XFEFg7ES0caRT/WkMT+lnJDGjIB8DhLmzE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H++jP0tsI2k6M9/Rt7EtDqsgleGFkK3zTyZlnCgJjKaTAjxDeSqxdDQ7eatcWyn4l
	 WyhiyB2pedfYMQ8CY1rkcym1cKtw1emlx3CXp8YQlEKCaaN7LhVVvpoN0T4Ddm+FFT
	 +Eiyg9Rrkv6e1JuRq2IrG4U9Ezbd4mz7o2nWbVpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F41F80542;
	Fri, 22 Jan 2021 17:41:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49DC0F80538; Fri, 22 Jan 2021 17:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79882F80517
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 17:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79882F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="BApKf8lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611333708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uis9RyHZyGfZiEw4j0VNHR8AyI5qEfQKR2mWwdveAfg=;
 b=BApKf8lhx6SJ0EbRTv6wlYE2AuDOcFBWVcRpgS/5Z+yIR9hipyIhxbCvxJQJAN73fjSbWw
 clBiA1emxMjDrok+tExwoZ3VCjKL7d+RrKwv4cAKOUcVMScqfo96nB2EOpfuXKQ6kZE6Kz
 mNxcQKeIBx2+KID8IoX7xtjZp2PoIso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-FeoR9H_qNuO0ZkeMqNVVqw-1; Fri, 22 Jan 2021 11:41:46 -0500
X-MC-Unique: FeoR9H_qNuO0ZkeMqNVVqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 124A18015FD;
 Fri, 22 Jan 2021 16:41:44 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D67EC60916;
 Fri, 22 Jan 2021 16:41:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 11/13] ASoC: arizona-jack: Cleanup logging
Date: Fri, 22 Jan 2021 17:41:05 +0100
Message-Id: <20210122164107.361939-12-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-1-hdegoede@redhat.com>
References: <20210122164107.361939-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Cleanup the use of dev_foo functions used for logging:

1. Many of these are unnecessarily split over multiple lines
2. Use dev_err_probe() in cases where we might get a -EPROBE_DEFERRED
   return value

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- This is a new patch in v3 of this patch-series
---
 sound/soc/codecs/arizona-jack.c | 107 ++++++++++----------------------
 1 file changed, 34 insertions(+), 73 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 268d2a44d891..e101976e1c14 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -124,8 +124,7 @@ static void arizona_extcon_hp_clamp(struct arizona_priv *info,
 					 ARIZONA_HP1_TST_CAP_SEL_MASK,
 					 cap_sel);
 		if (ret != 0)
-			dev_warn(arizona->dev,
-				 "Failed to set TST_CAP_SEL: %d\n", ret);
+			dev_warn(arizona->dev, "Failed to set TST_CAP_SEL: %d\n", ret);
 		break;
 	default:
 		mask = ARIZONA_RMV_SHRT_HP1L;
@@ -145,23 +144,19 @@ static void arizona_extcon_hp_clamp(struct arizona_priv *info,
 					 ARIZONA_OUT1L_ENA |
 					 ARIZONA_OUT1R_ENA, 0);
 		if (ret != 0)
-			dev_warn(arizona->dev,
-				"Failed to disable headphone outputs: %d\n",
-				 ret);
+			dev_warn(arizona->dev, "Failed to disable headphone outputs: %d\n", ret);
 	}
 
 	if (mask) {
 		ret = regmap_update_bits(arizona->regmap, ARIZONA_HP_CTRL_1L,
 					 mask, val);
 		if (ret != 0)
-			dev_warn(arizona->dev, "Failed to do clamp: %d\n",
-				 ret);
+			dev_warn(arizona->dev, "Failed to do clamp: %d\n", ret);
 
 		ret = regmap_update_bits(arizona->regmap, ARIZONA_HP_CTRL_1R,
 					 mask, val);
 		if (ret != 0)
-			dev_warn(arizona->dev, "Failed to do clamp: %d\n",
-				 ret);
+			dev_warn(arizona->dev, "Failed to do clamp: %d\n", ret);
 	}
 
 	/* Restore the desired state while not doing the clamp */
@@ -171,9 +166,7 @@ static void arizona_extcon_hp_clamp(struct arizona_priv *info,
 					 ARIZONA_OUT1L_ENA |
 					 ARIZONA_OUT1R_ENA, arizona->hp_ena);
 		if (ret != 0)
-			dev_warn(arizona->dev,
-				 "Failed to restore headphone outputs: %d\n",
-				 ret);
+			dev_warn(arizona->dev, "Failed to restore headphone outputs: %d\n", ret);
 	}
 
 	snd_soc_dapm_mutex_unlock(arizona->dapm);
@@ -224,16 +217,14 @@ static void arizona_extcon_pulse_micbias(struct arizona_priv *info)
 
 	ret = snd_soc_component_force_enable_pin(component, widget);
 	if (ret != 0)
-		dev_warn(arizona->dev, "Failed to enable %s: %d\n",
-			 widget, ret);
+		dev_warn(arizona->dev, "Failed to enable %s: %d\n", widget, ret);
 
 	snd_soc_dapm_sync(dapm);
 
 	if (!arizona->pdata.micd_force_micbias) {
 		ret = snd_soc_component_disable_pin(component, widget);
 		if (ret != 0)
-			dev_warn(arizona->dev, "Failed to disable %s: %d\n",
-				 widget, ret);
+			dev_warn(arizona->dev, "Failed to disable %s: %d\n", widget, ret);
 
 		snd_soc_dapm_sync(dapm);
 	}
@@ -251,18 +242,13 @@ static void arizona_start_mic(struct arizona_priv *info)
 
 	if (info->detecting) {
 		ret = regulator_allow_bypass(info->micvdd, false);
-		if (ret != 0) {
-			dev_err(arizona->dev,
-				"Failed to regulate MICVDD: %d\n",
-				ret);
-		}
+		if (ret != 0)
+			dev_err(arizona->dev, "Failed to regulate MICVDD: %d\n", ret);
 	}
 
 	ret = regulator_enable(info->micvdd);
-	if (ret != 0) {
-		dev_err(arizona->dev, "Failed to enable MICVDD: %d\n",
-			ret);
-	}
+	if (ret != 0)
+		dev_err(arizona->dev, "Failed to enable MICVDD: %d\n", ret);
 
 	if (info->micd_reva) {
 		const struct reg_sequence reva[] = {
@@ -313,9 +299,7 @@ static void arizona_stop_mic(struct arizona_priv *info)
 
 	ret = snd_soc_component_disable_pin(component, widget);
 	if (ret != 0)
-		dev_warn(arizona->dev,
-			 "Failed to disable %s: %d\n",
-			 widget, ret);
+		dev_warn(arizona->dev, "Failed to disable %s: %d\n", widget, ret);
 
 	snd_soc_dapm_sync(dapm);
 
@@ -330,10 +314,8 @@ static void arizona_stop_mic(struct arizona_priv *info)
 	}
 
 	ret = regulator_allow_bypass(info->micvdd, true);
-	if (ret != 0) {
-		dev_err(arizona->dev, "Failed to bypass MICVDD: %d\n",
-			ret);
-	}
+	if (ret != 0)
+		dev_err(arizona->dev, "Failed to bypass MICVDD: %d\n", ret);
 
 	if (change) {
 		regulator_disable(info->micvdd);
@@ -372,16 +354,14 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 
 	ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2, &val);
 	if (ret != 0) {
-		dev_err(arizona->dev, "Failed to read HPDET status: %d\n",
-			ret);
+		dev_err(arizona->dev, "Failed to read HPDET status: %d\n", ret);
 		return ret;
 	}
 
 	switch (info->hpdet_ip_version) {
 	case 0:
 		if (!(val & ARIZONA_HP_DONE)) {
-			dev_err(arizona->dev, "HPDET did not complete: %x\n",
-				val);
+			dev_err(arizona->dev, "HPDET did not complete: %x\n", val);
 			return -EAGAIN;
 		}
 
@@ -390,15 +370,13 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 
 	case 1:
 		if (!(val & ARIZONA_HP_DONE_B)) {
-			dev_err(arizona->dev, "HPDET did not complete: %x\n",
-				val);
+			dev_err(arizona->dev, "HPDET did not complete: %x\n", val);
 			return -EAGAIN;
 		}
 
 		ret = regmap_read(arizona->regmap, ARIZONA_HP_DACVAL, &val);
 		if (ret != 0) {
-			dev_err(arizona->dev, "Failed to read HP value: %d\n",
-				ret);
+			dev_err(arizona->dev, "Failed to read HP value: %d\n", ret);
 			return -EAGAIN;
 		}
 
@@ -411,8 +389,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 		    (val < arizona_hpdet_b_ranges[range].threshold ||
 		     val >= ARIZONA_HPDET_B_RANGE_MAX)) {
 			range++;
-			dev_dbg(arizona->dev, "Moving to HPDET range %d\n",
-				range);
+			dev_dbg(arizona->dev, "Moving to HPDET range %d\n", range);
 			regmap_update_bits(arizona->regmap,
 					   ARIZONA_HEADPHONE_DETECT_1,
 					   ARIZONA_HP_IMPEDANCE_RANGE_MASK,
@@ -428,8 +405,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 			return ARIZONA_HPDET_MAX;
 		}
 
-		dev_dbg(arizona->dev, "HPDET read %d in range %d\n",
-			val, range);
+		dev_dbg(arizona->dev, "HPDET read %d in range %d\n", val, range);
 
 		val = arizona_hpdet_b_ranges[range].factor_b
 			/ ((val * 100) -
@@ -438,8 +414,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 
 	case 2:
 		if (!(val & ARIZONA_HP_DONE_B)) {
-			dev_err(arizona->dev, "HPDET did not complete: %x\n",
-				val);
+			dev_err(arizona->dev, "HPDET did not complete: %x\n", val);
 			return -EAGAIN;
 		}
 
@@ -475,8 +450,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 		break;
 
 	default:
-		dev_warn(arizona->dev, "Unknown HPDET IP revision %d\n",
-			 info->hpdet_ip_version);
+		dev_warn(arizona->dev, "Unknown HPDET IP revision %d\n", info->hpdet_ip_version);
 		return -EINVAL;
 	}
 
@@ -665,8 +639,7 @@ static void arizona_identify_headphone(struct arizona_priv *info)
 	ret = regmap_update_bits(arizona->regmap, ARIZONA_HEADPHONE_DETECT_1,
 				 ARIZONA_HP_POLL, ARIZONA_HP_POLL);
 	if (ret != 0) {
-		dev_err(arizona->dev, "Can't start HPDETL measurement: %d\n",
-			ret);
+		dev_err(arizona->dev, "Can't start HPDETL measurement: %d\n", ret);
 		goto err;
 	}
 
@@ -717,9 +690,7 @@ static void arizona_start_hpdet_acc_id(struct arizona_priv *info)
 					 ARIZONA_HEADPHONE_DETECT_1,
 					 ARIZONA_HP_POLL, ARIZONA_HP_POLL);
 		if (ret != 0) {
-			dev_err(arizona->dev,
-				"Can't start HPDETL measurement: %d\n",
-				ret);
+			dev_err(arizona->dev, "Can't start HPDETL measurement: %d\n", ret);
 			goto err;
 		}
 	} else {
@@ -765,8 +736,7 @@ static int arizona_micd_adc_read(struct arizona_priv *info)
 
 	ret = regmap_read(arizona->regmap, ARIZONA_MIC_DETECT_4, &val);
 	if (ret != 0) {
-		dev_err(arizona->dev,
-			"Failed to read MICDET_ADCVAL: %d\n", ret);
+		dev_err(arizona->dev, "Failed to read MICDET_ADCVAL: %d\n", ret);
 		return ret;
 	}
 
@@ -799,16 +769,14 @@ static int arizona_micd_read(struct arizona_priv *info)
 	for (i = 0; i < 10 && !(val & MICD_LVL_0_TO_8); i++) {
 		ret = regmap_read(arizona->regmap, ARIZONA_MIC_DETECT_3, &val);
 		if (ret != 0) {
-			dev_err(arizona->dev,
-				"Failed to read MICDET: %d\n", ret);
+			dev_err(arizona->dev, "Failed to read MICDET: %d\n", ret);
 			return ret;
 		}
 
 		dev_dbg(arizona->dev, "MICDET: %x\n", val);
 
 		if (!(val & ARIZONA_MICD_VALID)) {
-			dev_warn(arizona->dev,
-				 "Microphone detection state invalid\n");
+			dev_warn(arizona->dev, "Microphone detection state invalid\n");
 			return -EINVAL;
 		}
 	}
@@ -857,8 +825,7 @@ static int arizona_micdet_reading(void *priv)
 		/* Don't need to regulate for button detection */
 		ret = regulator_allow_bypass(info->micvdd, true);
 		if (ret != 0) {
-			dev_err(arizona->dev, "Failed to bypass MICVDD: %d\n",
-				ret);
+			dev_err(arizona->dev, "Failed to bypass MICVDD: %d\n", ret);
 		}
 
 		return 0;
@@ -941,8 +908,7 @@ static int arizona_button_reading(void *priv)
 				dev_err(arizona->dev, "Button out of range\n");
 			}
 		} else {
-			dev_warn(arizona->dev, "Button with no mic: %x\n",
-				 val);
+			dev_warn(arizona->dev, "Button with no mic: %x\n", val);
 		}
 	} else {
 		dev_dbg(arizona->dev, "Mic button released\n");
@@ -1025,8 +991,7 @@ static int arizona_hpdet_wait(struct arizona_priv *info)
 		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2,
 				&val);
 		if (ret) {
-			dev_err(arizona->dev,
-				"Failed to read HPDET state: %d\n", ret);
+			dev_err(arizona->dev, "Failed to read HPDET state: %d\n", ret);
 			return ret;
 		}
 
@@ -1077,8 +1042,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 	ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
 	if (ret != 0) {
-		dev_err(arizona->dev, "Failed to read jackdet status: %d\n",
-			ret);
+		dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
 		mutex_unlock(&info->lock);
 		pm_runtime_put_autosuspend(arizona->dev);
 		return IRQ_NONE;
@@ -1248,8 +1212,7 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 		pdata->hpdet_channel = val;
 		break;
 	default:
-		dev_err(arizona->dev,
-			"Wrong wlf,hpdet-channel DT value %d\n", val);
+		dev_err(arizona->dev, "Wrong wlf,hpdet-channel DT value %d\n", val);
 		pdata->hpdet_channel = ARIZONA_ACCDET_MODE_HPL;
 	}
 
@@ -1303,7 +1266,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	info->micvdd = devm_regulator_get(dev, "MICVDD");
 	if (IS_ERR(info->micvdd)) {
 		ret = PTR_ERR(info->micvdd);
-		dev_err(arizona->dev, "Failed to get MICVDD: %d\n", ret);
+		dev_err_probe(arizona->dev, ret, "getting MICVDD\n");
 		return ret;
 	}
 
@@ -1391,9 +1354,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 							 mode);
 		if (IS_ERR(info->micd_pol_gpio)) {
 			ret = PTR_ERR(info->micd_pol_gpio);
-			dev_err(arizona->dev,
-				"Failed to get microphone polarity GPIO: %d\n",
-				ret);
+			dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
 			return ret;
 		}
 	}
-- 
2.28.0

