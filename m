Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D39662427ED
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 11:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73938166B;
	Wed, 12 Aug 2020 11:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73938166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597226080;
	bh=XSZGlvc++BiHwcON+tn3k9hBdCPO6vrV2Z7lx3Y6Yyk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uUkoiYkRn2s8y2fXcNgc4rC29ecSxT10HfxGvfp3+jUhXT3Rk/m1yi1baP0isMYOm
	 kls6LSzJwq0f1WI56NyIhi6GSvdarFp3+prmmwIXpXgwow+ap0JyXLc1E6LTCzanjA
	 y/IBccJ005hsgdwOuLeJsXhbt268jLJPOXCeP/u8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17386F80259;
	Wed, 12 Aug 2020 11:52:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE3CBF802C2; Wed, 12 Aug 2020 11:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26804F80245
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 11:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26804F80245
IronPort-SDR: w0XWlmORHEqtV02e4oV4SnELsrh4cbd5kG2UlzkdhsUu3DXtLmazauQg2nPS0WsfpWxrXwB69d
 llYq+huPkk1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="215446660"
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; d="scan'208";a="215446660"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 02:52:26 -0700
IronPort-SDR: JmEjJ0k1aqHJq3USTBn2lc6XecyCxjsVqOKACqTRUNhbXfSUnYXlStrmdP3NZMZOWXRgRsOQAC
 mGhJZWZMwS3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; d="scan'208";a="290983660"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga003.jf.intel.com with ESMTP; 12 Aug 2020 02:52:23 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
Date: Wed, 12 Aug 2020 17:46:31 +0800
Message-Id: <20200812094631.4698-4-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
References: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
Cc: cezary.rojewski@intel.com, a-estrada@ti.com, andriy.shevchenko@intel.com,
 zakkaye@ti.com, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, dmurphy@ti.com
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

Moving GPIO reset to a later stage and before clock registration to
ensure that the host system and codec clocks are in sync. If the host
register clock values prior to gpio reset, the last configured codec clock
is registered to the host. The codec then gets gpio resetted setting the
codec clocks to their default value, causing a mismatch. Host system will
skip clock setting thinking the codec clocks are already at the requested
rate.

ADC reset is added to ensure the next audio capture does not have
undesired artifacts. It is probably related to the original code
where the probe function resets the ADC prior to 1st record.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 47 ++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 6c2338ea5d8d..8dcea566b375 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -50,6 +50,28 @@ struct aic32x4_priv {
 	struct device *dev;
 };
 
+static int aic32x4_reset_adc(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u32 adc_reg;
+
+	/*
+	 * Workaround: the datasheet does not mention a required programming
+	 * sequence but experiments show the ADC needs to be reset after each
+	 * capture to avoid audible artifacts.
+	 */
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		adc_reg = snd_soc_component_read(component, AIC32X4_ADCSETUP);
+		snd_soc_component_write(component, AIC32X4_ADCSETUP, adc_reg |
+					AIC32X4_LADC_EN | AIC32X4_RADC_EN);
+		snd_soc_component_write(component, AIC32X4_ADCSETUP, adc_reg);
+		break;
+	}
+	return 0;
+};
+
 static int mic_bias_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
@@ -434,6 +456,7 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Mic Bias", AIC32X4_MICBIAS, 6, 0, mic_bias_event,
 			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 
+	SND_SOC_DAPM_POST("ADC Reset", aic32x4_reset_adc),
 
 	SND_SOC_DAPM_OUTPUT("HPL"),
 	SND_SOC_DAPM_OUTPUT("HPR"),
@@ -665,8 +688,8 @@ static int aic32x4_set_processing_blocks(struct snd_soc_component *component,
 }
 
 static int aic32x4_setup_clocks(struct snd_soc_component *component,
-			unsigned int sample_rate, unsigned int channel,
-			unsigned int bit_depth)
+				unsigned int sample_rate, unsigned int channel,
+				unsigned int bit_depth)
 {
 	u8 aosr;
 	u16 dosr;
@@ -958,12 +981,6 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	if (gpio_is_valid(aic32x4->rstn_gpio)) {
-		ndelay(10);
-		gpio_set_value(aic32x4->rstn_gpio, 1);
-		mdelay(1);
-	}
-
 	snd_soc_component_write(component, AIC32X4_RESET, 0x01);
 
 	if (aic32x4->setup)
@@ -1196,10 +1213,6 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		aic32x4->mclk_name = "mclk";
 	}
 
-	ret = aic32x4_register_clocks(dev, aic32x4->mclk_name);
-	if (ret)
-		return ret;
-
 	if (gpio_is_valid(aic32x4->rstn_gpio)) {
 		ret = devm_gpio_request_one(dev, aic32x4->rstn_gpio,
 				GPIOF_OUT_INIT_LOW, "tlv320aic32x4 rstn");
@@ -1221,6 +1234,16 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		return ret;
 	}
 
+	if (gpio_is_valid(aic32x4->rstn_gpio)) {
+		ndelay(10);
+		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
+		mdelay(1);
+	}
+
+	ret = aic32x4_register_clocks(dev, aic32x4->mclk_name);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL(aic32x4_probe);
-- 
2.17.1

