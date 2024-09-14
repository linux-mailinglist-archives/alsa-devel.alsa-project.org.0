Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69E978ED8
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Sep 2024 09:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 267DEDEE;
	Sat, 14 Sep 2024 09:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 267DEDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726298703;
	bh=VkMGAtffLbvdQYgO/+tFo8X5yq65AjvU2bRStlj604g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jsFEjpN+qv/A4fNdG/0oSnCOAthfOBV8iyAvO2fd2YTNWWvTmjCfblUzCccrVAp31
	 lfv20E4ptGN4XDNtFMuNSHIpuemcfpd/S7lCB6osvvBn7wKDaQBM0Yea2YqAaxrMSA
	 tCtlIgnsGCqVCc/1W4nYh+puRbbLf87HraCKSuuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85BD8F80272; Sat, 14 Sep 2024 09:24:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EE4FF80527;
	Sat, 14 Sep 2024 09:24:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C512BF801F5; Sat, 14 Sep 2024 09:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [111.22.67.135])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB6FF80107
	for <alsa-devel@alsa-project.org>; Sat, 14 Sep 2024 09:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB6FF80107
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee766e53a1c0c6-390cc;
	Sat, 14 Sep 2024 15:24:13 +0800 (CST)
X-RM-TRANSID: 2ee766e53a1c0c6-390cc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from leadsec.example.com.localdomain (unknown[10.54.5.252])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee766e53a1344e-94fe4;
	Sat, 14 Sep 2024 15:24:12 +0800 (CST)
X-RM-TRANSID: 2ee766e53a1344e-94fe4
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: tas2781: Fix redundant parameter assignment
Date: Sat, 14 Sep 2024 15:23:52 +0800
Message-Id: <20240914072352.2997-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HV5ASNWENGCJTJ4JIDM4TACJBYX7V4OY
X-Message-ID-Hash: HV5ASNWENGCJTJ4JIDM4TACJBYX7V4OY
X-MailFrom: tangbin@cmss.chinamobile.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HV5ASNWENGCJTJ4JIDM4TACJBYX7V4OY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In these functions, the variable 'rc' is redundant,
thus remove it.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/codecs/tas2781-i2c.c | 35 ++++++++--------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 8a8d97dd7..68887799e 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -650,7 +650,6 @@ static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
 	unsigned int reg;
-	int rc = -1;
 
 	if (tas_priv->chip_id == TAS2781)
 		reg = TAS2781_RUNTIME_RE_REG_TF;
@@ -659,9 +658,7 @@ static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
 
 	guard(mutex)(&tas_priv->codec_lock);
 	dst[0] = bytes_ext->max;
-	rc = calib_data_get(tas_priv, reg, &dst[1]);
-
-	return rc;
+	return calib_data_get(tas_priv, reg, &dst[1]);
 }
 
 static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
@@ -673,7 +670,6 @@ static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
 	unsigned int reg;
-	int rc = -1;
 
 	if (tas_priv->chip_id == TAS2781)
 		reg = TAS2781_RUNTIME_RE_REG;
@@ -681,9 +677,7 @@ static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
 		reg = TAS2563_RUNTIME_RE_REG;
 	guard(mutex)(&tas_priv->codec_lock);
 	dst[0] = bytes_ext->max;
-	rc = calib_data_get(tas_priv, reg, &dst[1]);
-
-	return rc;
+	return calib_data_get(tas_priv, reg, &dst[1]);
 }
 
 static int tasdev_r0_data_get(struct snd_kcontrol *kcontrol,
@@ -696,7 +690,6 @@ static int tasdev_r0_data_get(struct snd_kcontrol *kcontrol,
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
 	unsigned int reg;
-	int rc = -1;
 
 	guard(mutex)(&tas_priv->codec_lock);
 
@@ -707,9 +700,7 @@ static int tasdev_r0_data_get(struct snd_kcontrol *kcontrol,
 	else
 		return -1;
 	dst[0] = bytes_ext->max;
-	rc = calib_data_get(tas_priv, reg, &dst[1]);
-
-	return rc;
+	return calib_data_get(tas_priv, reg, &dst[1]);
 }
 
 static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
@@ -721,13 +712,10 @@ static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
 	unsigned int reg = TASDEVICE_XM_A1_REG;
-	int rc = -1;
 
 	guard(mutex)(&tas_priv->codec_lock);
 	dst[0] = bytes_ext->max;
-	rc = calib_data_get(tas_priv, reg, &dst[1]);
-
-	return rc;
+	return calib_data_get(tas_priv, reg, &dst[1]);
 }
 
 static int tasdev_XMA2_data_get(struct snd_kcontrol *kcontrol,
@@ -739,13 +727,10 @@ static int tasdev_XMA2_data_get(struct snd_kcontrol *kcontrol,
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
 	unsigned int reg = TASDEVICE_XM_A2_REG;
-	int rc = -1;
 
 	guard(mutex)(&tas_priv->codec_lock);
 	dst[0] = bytes_ext->max;
-	rc = calib_data_get(tas_priv, reg, &dst[1]);
-
-	return rc;
+	return calib_data_get(tas_priv, reg, &dst[1]);
 }
 
 static int tasdev_nop_get(
@@ -1115,14 +1100,12 @@ static int tasdevice_active_num_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	int dev_id = ucontrol->value.integer.value[0];
-	int max = tas_priv->ndev - 1, rc;
+	int max = tas_priv->ndev - 1;
 
 	dev_id = clamp(dev_id, 0, max);
 
 	guard(mutex)(&tas_priv->codec_lock);
-	rc = tasdev_chn_switch(tas_priv, dev_id);
-
-	return rc;
+	return tasdev_chn_switch(tas_priv, dev_id);
 }
 
 static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
@@ -1339,10 +1322,8 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 		i++;
 	}
 
-	rc = snd_soc_add_component_controls(priv->codec, cali_ctrls,
+	return snd_soc_add_component_controls(priv->codec, cali_ctrls,
 		nctrls < i ? nctrls : i);
-
-	return rc;
 }
 
 static void tasdevice_fw_ready(const struct firmware *fmw,
-- 
2.33.0



