Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4312ACAAD
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 02:50:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B067316AB;
	Tue, 10 Nov 2020 02:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B067316AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604973018;
	bh=mbJC1xOKY6HsJLO8WTJyVbSMRpj6qzKiVSL0gJt1wts=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MjCkK62AcHL9JpI8A2Gt+aKBcgbkIM0hsLuYjKjiiRsJpOT1VLbRYnZDznAFlTmFD
	 xS5sXSEJ3A5tXTuUn8N3p2tcnEWDuMo1kgRs+fZFH1zqi/ra2cgzZq7Wen2y31/MHV
	 iWcBngghuep/QvP0DqABiFx6zRYEcj7RY6qF7XHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5131EF8022B;
	Tue, 10 Nov 2020 02:48:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A656F8020C; Tue, 10 Nov 2020 02:48:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21BCDF80059
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 02:48:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21BCDF80059
IronPort-SDR: uX5XlL2PSQG15dKqaRwa48fOWmg+tm8EUWr3TeP/0R7WgQHHNqH+efqP+B8lOsPqxkDxkf91YB
 YVFP8WNYRN+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="234067604"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="234067604"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 17:48:30 -0800
IronPort-SDR: Ko2VTPYSBasM+sotCHtedRYAZwYPgrPgJ/nuHYcE7IOA5ZCLr7bVPc+wcUw6rUHuhGbakrOIpz
 7DgUGWtk5yLg==
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="541125879"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 17:48:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [RFC] ASoC: max98373: don't access volatile registers in bias level
 off
Date: Mon,  9 Nov 2020 21:55:43 +0800
Message-Id: <20201109135543.7862-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, ryans.lee@maximintegrated.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com
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

We will set regcache_cache_only true in suspend. As a result, regmap_read
will return error when we try to read volatile registers in suspend.
Besides, it doesn't make sense to read feedback data when codec is not
active. To avoid the regmap_read error, this patch try to return a fake
value when kcontrol _get is called in suspend.
However, the question is what is the "correct" behavior when we try to
read a volatile register when cache only is set.
1. return an error code to signal codec is not available as what we have
now.
2. return a fake value like what this patch do.
3. wake-up the codec and always return a valid value.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/max98373.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 929bb1798c43..07494e40c296 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -168,6 +168,23 @@ static SOC_ENUM_SINGLE_DECL(max98373_adc_samplerate_enum,
 			    MAX98373_R2051_MEAS_ADC_SAMPLING_RATE, 0,
 			    max98373_ADC_samplerate_text);
 
+static int max98373_feedback_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+
+	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		/*
+		 * We can't get the feedback data when codec is off, set
+		 * value = 0 and return 0 to avoid error.
+		 */
+		ucontrol->value.integer.value[0] = 0;
+		return 0;
+	}
+
+	return snd_soc_put_volsw(kcontrol, ucontrol);
+}
+
 static const struct snd_kcontrol_new max98373_snd_controls[] = {
 SOC_SINGLE("Digital Vol Sel Switch", MAX98373_R203F_AMP_DSP_CFG,
 	MAX98373_AMP_VOL_SEL_SHIFT, 1, 0),
@@ -209,8 +226,10 @@ SOC_SINGLE("ADC PVDD FLT Switch", MAX98373_R2052_MEAS_ADC_PVDD_FLT_CFG,
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
@@ -226,7 +245,8 @@ SOC_SINGLE("BDE LVL1 Thresh", MAX98373_R2097_BDE_L1_THRESH, 0, 0xFF, 0),
 SOC_SINGLE("BDE LVL2 Thresh", MAX98373_R2098_BDE_L2_THRESH, 0, 0xFF, 0),
 SOC_SINGLE("BDE LVL3 Thresh", MAX98373_R2099_BDE_L3_THRESH, 0, 0xFF, 0),
 SOC_SINGLE("BDE LVL4 Thresh", MAX98373_R209A_BDE_L4_THRESH, 0, 0xFF, 0),
-SOC_SINGLE("BDE Active Level", MAX98373_R20B6_BDE_CUR_STATE_READBACK, 0, 8, 0),
+SOC_SINGLE_EXT("BDE Active Level", MAX98373_R20B6_BDE_CUR_STATE_READBACK, 0, 8, 0,
+	max98373_feedback_get, NULL),
 SOC_SINGLE("BDE Clip Mode Switch", MAX98373_R2092_BDE_CLIPPER_MODE, 0, 1, 0),
 SOC_SINGLE("BDE Thresh Hysteresis", MAX98373_R209B_BDE_THRESH_HYST, 0, 0xFF, 0),
 SOC_SINGLE("BDE Hold Time", MAX98373_R2090_BDE_LVL_HOLD, 0, 0xFF, 0),
-- 
2.17.1

