Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A129AFC5F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2024 10:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFA193A;
	Fri, 25 Oct 2024 10:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFA193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729844505;
	bh=F+8EYrYfCSov3vYJvjIGwMMAlrlWyYadM7OBoaLYkxg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kpPAqXsXAnHOFe1iSO6+2CnV/XlqV3vrBFePqU8lulhoVKq11QKPDRpoHMrlj36Dj
	 Y/JUpWVYoD3EAj7bFzXqg9dZKWdqoDhsC0TzBBb63yLW24Ejlh9+53mfdMNeykmur6
	 UXeiceKJB9atv/TeiWyx9Yna4PtdN7/8wbFn89OM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69089F805A9; Fri, 25 Oct 2024 10:21:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 351E7F8016C;
	Fri, 25 Oct 2024 10:21:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90B09F8016C; Fri, 25 Oct 2024 10:21:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from cmccmta2.chinamobile.com (cmccmta4.chinamobile.com
 [111.22.67.137])
	by alsa1.perex.cz (Postfix) with ESMTP id A70A0F8014C
	for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2024 10:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A70A0F8014C
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee8671b54e746b-b64ab;
	Fri, 25 Oct 2024 16:20:58 +0800 (CST)
X-RM-TRANSID: 2ee8671b54e746b-b64ab
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from leadsec.example.com.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea671b54e6a90-2f5f8;
	Fri, 25 Oct 2024 16:20:58 +0800 (CST)
X-RM-TRANSID: 2eea671b54e6a90-2f5f8
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: tas2781: Fix redundant logical jump
Date: Fri, 25 Oct 2024 16:20:42 +0800
Message-Id: <20241025082042.2872-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2X7XHL6ZR4CCNH6ZTDK4H5T2EH43632S
X-Message-ID-Hash: 2X7XHL6ZR4CCNH6ZTDK4H5T2EH43632S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2X7XHL6ZR4CCNH6ZTDK4H5T2EH43632S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In these functions, some logical jump of "goto" and variable
are redundant, thus remove them.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/codecs/tas2781-i2c.c | 68 +++++++++++++---------------------
 1 file changed, 25 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 68887799e..27f2f84a4 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -489,14 +489,11 @@ static int tas2563_calib_start_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
 	const int sum = ARRAY_SIZE(tas2563_cali_start_reg);
-	int rc = 1;
 	int i, j;
 
 	guard(mutex)(&tas_priv->codec_lock);
-	if (tas_priv->chip_id != TAS2563) {
-		rc = -1;
-		goto out;
-	}
+	if (tas_priv->chip_id != TAS2563)
+		return -1;
 
 	for (i = 0; i < tas_priv->ndev; i++) {
 		struct tasdevice *tasdev = tas_priv->tasdevice;
@@ -523,8 +520,8 @@ static int tas2563_calib_start_put(struct snd_kcontrol *kcontrol,
 					q[j].val, 4);
 		}
 	}
-out:
-	return rc;
+
+	return 1;
 }
 
 static void tas2563_calib_stop_put(struct tasdevice_priv *tas_priv)
@@ -576,7 +573,7 @@ static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
 	struct cali_reg *p = &cali_data->cali_reg_array;
 	unsigned char *src = ucontrol->value.bytes.data;
 	unsigned char *dst = cali_data->data;
-	int rc = 1, i = 0;
+	int i = 0;
 	int j;
 
 	guard(mutex)(&priv->codec_lock);
@@ -605,7 +602,7 @@ static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
 	i += 3;
 
 	memcpy(dst, &src[i], cali_data->total_sz);
-	return rc;
+	return 1;
 }
 
 static int tas2781_latch_reg_get(struct snd_kcontrol *kcontrol,
@@ -1115,25 +1112,21 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 	char *conf_name, *prog_name;
 	int nr_controls = 4;
 	int mix_index = 0;
-	int ret;
 
 	/* Alloc kcontrol via devm_kzalloc, which don't manually
 	 * free the kcontrol
 	 */
 	dsp_ctrls = devm_kcalloc(tas_priv->dev, nr_controls,
 		sizeof(dsp_ctrls[0]), GFP_KERNEL);
-	if (!dsp_ctrls) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dsp_ctrls)
+		return -ENOMEM;
 
 	/* Create mixer items for selecting the active Program and Config */
 	prog_name = devm_kstrdup(tas_priv->dev, "Speaker Program Id",
 		GFP_KERNEL);
-	if (!prog_name) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!prog_name)
+		return -ENOMEM;
+
 	dsp_ctrls[mix_index].name = prog_name;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_programs;
@@ -1143,10 +1136,9 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 
 	conf_name = devm_kstrdup(tas_priv->dev, "Speaker Config Id",
 		GFP_KERNEL);
-	if (!conf_name) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!conf_name)
+		return -ENOMEM;
+
 	dsp_ctrls[mix_index].name = conf_name;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_configurations;
@@ -1156,10 +1148,9 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 
 	active_dev_num = devm_kstrdup(tas_priv->dev, "Activate Tasdevice Num",
 		GFP_KERNEL);
-	if (!active_dev_num) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!active_dev_num)
+		return -ENOMEM;
+
 	dsp_ctrls[mix_index].name = active_dev_num;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_active_num;
@@ -1168,21 +1159,17 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 	mix_index++;
 
 	chip_id = devm_kstrdup(tas_priv->dev, "Tasdevice Chip Id", GFP_KERNEL);
-	if (!chip_id) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!chip_id)
+		return -ENOMEM;
+
 	dsp_ctrls[mix_index].name = chip_id;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_chip_id;
 	dsp_ctrls[mix_index].get = tasdevice_get_chip_id;
 	mix_index++;
 
-	ret = snd_soc_add_component_controls(tas_priv->codec, dsp_ctrls,
+	return snd_soc_add_component_controls(tas_priv->codec, dsp_ctrls,
 		nr_controls < mix_index ? nr_controls : mix_index);
-
-out:
-	return ret;
 }
 
 static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
@@ -1469,7 +1456,6 @@ static int tasdevice_hw_params(struct snd_pcm_substream *substream,
 	unsigned int slot_width;
 	unsigned int fsrate;
 	int bclk_rate;
-	int rc = 0;
 
 	fsrate = params_rate(params);
 	switch (fsrate) {
@@ -1479,8 +1465,7 @@ static int tasdevice_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(tas_priv->dev, "%s: incorrect sample rate = %u\n",
 			__func__, fsrate);
-		rc = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	slot_width = params_width(params);
@@ -1493,20 +1478,17 @@ static int tasdevice_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(tas_priv->dev, "%s: incorrect slot width = %u\n",
 			__func__, slot_width);
-		rc = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	bclk_rate = snd_soc_params_to_bclk(params);
 	if (bclk_rate < 0) {
 		dev_err(tas_priv->dev, "%s: incorrect bclk rate = %d\n",
 			__func__, bclk_rate);
-		rc = bclk_rate;
-		goto out;
+		return bclk_rate;
 	}
 
-out:
-	return rc;
+	return 0;
 }
 
 static int tasdevice_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-- 
2.33.0



