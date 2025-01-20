Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C7CA16661
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 06:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E96006021B;
	Mon, 20 Jan 2025 06:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E96006021B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737351159;
	bh=EiTbnRHW/FJFwriXXqCKMJPz6e6/OTUmyT33K+p2BI8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QiZH5s7j2FNd0mKJUicHLDDZ0xhC/3gEdXozRKoyMj0SjnRF9eZbeo9U8TbH8cTVS
	 8JU1WJZHmNcLsubehfqU+ZkoDxrIElPX7YPaomeOrFCFcbbskeWyrS3vh0l8zC/uWN
	 14gZO4edYc00CFNU3rGe89l+QjjmkPOWvVZVq8pc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F12F80602; Mon, 20 Jan 2025 06:31:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C557FF805F8;
	Mon, 20 Jan 2025 06:31:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1D7BF80424; Mon, 20 Jan 2025 06:31:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4A1AF80482
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 06:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4A1AF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=cTdiC5cq
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50K5UbP4590233
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 19 Jan 2025 23:30:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737351037;
	bh=dXK5EfA1r53KXKL7r7BC5zEC1N2wLyoS2nqxujGD4do=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cTdiC5cq7A3WZmN2DEFApQ3hRYyj3FHkQPRSqL2swNbYVEldKQw+M18nRcZeQSScT
	 zFd3FbrAUnEq/AuIOWFN/SsZDqM0ZcJvOvh/EqheCNj2Wm7MSwXiXNw0pR6fTUjAkR
	 8cMFfmgpYvOLZ5JF/ls/Eh71xu9IEEJqFI/KS4PA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50K5Ubuk079839;
	Sun, 19 Jan 2025 23:30:37 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 19
 Jan 2025 23:30:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 19 Jan 2025 23:30:37 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.124])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50K5URNO130674;
	Sun, 19 Jan 2025 23:30:34 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1 3/3] ASoC: tas2781: Support dsp firmware Alpha and Beta
 seaies
Date: Mon, 20 Jan 2025 13:30:23 +0800
Message-ID: <20250120053023.715-3-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250120053023.715-1-shenghao-ding@ti.com>
References: <20250120053023.715-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: EX3XTF5CNSFI7TWQSS35NS3NVQIHU3DD
X-Message-ID-Hash: EX3XTF5CNSFI7TWQSS35NS3NVQIHU3DD
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EX3XTF5CNSFI7TWQSS35NS3NVQIHU3DD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For calibration, basic version does not contain any calibration addresses,
it depends on calibration tool to convery the addresses to the driver.
Since Alpha and Beta firmware, all the calibration addresses are saved
into the firmware. In order to fallback the BASIC or older version, code
was added an extra branch to handle Alpha and Beta version.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - update the year from 2024 to 2025.
 - Add an extra branch to handle calibration address for TASDEV_ALPHA
   and TASDEV_BETA firmware.
---
 sound/soc/codecs/tas2781-i2c.c | 209 +++++++++++++++++++++++++--------
 1 file changed, 160 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 728bf78ae71f..0eceb809350f 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2563/TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2025 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2563/TAS2781 driver implements a flexible and configurable
@@ -349,13 +349,31 @@ static int calib_data_get(struct tasdevice_priv *tas_priv, int reg,
 	return rc;
 }
 
+static int partial_cali_data_update(int *reg, int j)
+{
+	switch (tas2781_cali_start_reg[j].reg) {
+	case 0:
+		return reg[0];
+	case TAS2781_PRM_PLT_FLAG_REG:
+		return reg[1];
+	case TAS2781_PRM_SINEGAIN_REG:
+		return reg[2];
+	case TAS2781_PRM_SINEGAIN2_REG:
+		return reg[3];
+	default:
+		return 0;
+	}
+}
+
 static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
 	int *reg, unsigned char *dat)
 {
 	struct tasdevice *tasdev = tas_priv->tasdevice;
 	struct bulk_reg_val *p = tasdev[i].cali_data_backup;
+	struct bulk_reg_val *t = &tasdev[i].alp_cali_bckp;
 	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
-	int j;
+	unsigned char val[4];
+	int j, r;
 
 	if (p == NULL)
 		return;
@@ -370,30 +388,23 @@ static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
 			tasdevice_dev_read(tas_priv, i, p[j].reg,
 				(int *)&p[j].val[0]);
 		} else {
-			switch (tas2781_cali_start_reg[j].reg) {
-			case 0: {
-				if (!reg[0])
-					continue;
-				p[j].reg = reg[0];
+			if (!tas_priv->dspbin_typ) {
+				r = partial_cali_data_update(reg, j);
+				if (r)
+					p[j].reg = r;
 			}
-				break;
-			case TAS2781_PRM_PLT_FLAG_REG:
-			p[j].reg = reg[1];
-				break;
-			case TAS2781_PRM_SINEGAIN_REG:
-			p[j].reg = reg[2];
-				break;
-			case TAS2781_PRM_SINEGAIN2_REG:
-			p[j].reg = reg[3];
-				break;
-			}
-			tasdevice_dev_bulk_read(tas_priv, i, p[j].reg,
-				p[j].val, 4);
+
+			if (p[j].reg)
+				tasdevice_dev_bulk_read(tas_priv, i, p[j].reg,
+					p[j].val, 4);
 		}
 	}
 
+	if (tas_priv->dspbin_typ == TASDEV_ALPHA)
+		tasdevice_dev_bulk_read(tas_priv, i, t->reg, t->val, 4);
+
 	/* Update the setting for calibration */
-	for (j = 0; j < sum - 2; j++) {
+	for (j = 0; j < sum - 4; j++) {
 		if (p[j].val_len == 1) {
 			if (p[j].is_locked)
 				tasdevice_dev_write(tas_priv, i,
@@ -401,17 +412,33 @@ static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
 					TAS2781_TEST_PAGE_UNLOCK);
 			tasdevice_dev_write(tas_priv, i, p[j].reg,
 				tas2781_cali_start_reg[j].val[0]);
-		} else {
-			if (!p[j].reg)
-				continue;
-			tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
-				(unsigned char *)
-				tas2781_cali_start_reg[j].val, 4);
 		}
 	}
 
-	tasdevice_dev_bulk_write(tas_priv, i, p[j].reg, &dat[1], 4);
-	tasdevice_dev_bulk_write(tas_priv, i, p[j + 1].reg, &dat[5], 4);
+	if (tas_priv->dspbin_typ == TASDEV_ALPHA) {
+		val[0] = 0x00;
+		val[1] = 0x00;
+		val[2] = 0x21;
+		val[3] = 0x8e;
+	} else {
+		val[0] = tas2781_cali_start_reg[j].val[0];
+		val[1] = tas2781_cali_start_reg[j].val[1];
+		val[2] = tas2781_cali_start_reg[j].val[2];
+		val[3] = tas2781_cali_start_reg[j].val[3];
+	}
+	tasdevice_dev_bulk_write(tas_priv, i, p[j].reg, val, 4);
+	tasdevice_dev_bulk_write(tas_priv, i, p[j + 1].reg,
+		(unsigned char *)tas2781_cali_start_reg[j + 1].val, 4);
+	tasdevice_dev_bulk_write(tas_priv, i, p[j + 2].reg, &dat[1], 4);
+	tasdevice_dev_bulk_write(tas_priv, i, p[j + 3].reg, &dat[5], 4);
+	if (tas_priv->dspbin_typ == TASDEV_ALPHA) {
+		val[0] = 0x00;
+		val[1] = 0x00;
+		val[2] = 0x2a;
+		val[3] = 0x0b;
+
+		tasdevice_dev_bulk_read(tas_priv, i, t->reg, val, 4);
+	}
 }
 
 static int tas2781_calib_start_put(struct snd_kcontrol *kcontrol,
@@ -460,6 +487,7 @@ static void tas2781_calib_stop_put(struct tasdevice_priv *tas_priv)
 	for (i = 0; i < tas_priv->ndev; i++) {
 		struct tasdevice *tasdev = tas_priv->tasdevice;
 		struct bulk_reg_val *p = tasdev[i].cali_data_backup;
+		struct bulk_reg_val *t = &tasdev[i].alp_cali_bckp;
 
 		if (p == NULL)
 			continue;
@@ -479,6 +507,10 @@ static void tas2781_calib_stop_put(struct tasdevice_priv *tas_priv)
 					p[j].val, 4);
 			}
 		}
+
+		if (tas_priv->dspbin_typ == TASDEV_ALPHA)
+			tasdevice_dev_bulk_write(tas_priv, i, t->reg,
+				t->val, 4);
 	}
 }
 
@@ -576,7 +608,7 @@ static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
 	struct cali_reg *p = &cali_data->cali_reg_array;
 	unsigned char *src = ucontrol->value.bytes.data;
 	unsigned char *dst = cali_data->data;
-	int rc = 1, i = 0;
+	int i = 0;
 	int j;
 
 	guard(mutex)(&priv->codec_lock);
@@ -593,19 +625,23 @@ static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
 	i += 2;
 	priv->is_user_space_calidata = true;
 
-	p->r0_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
-	i += 3;
-	p->r0_low_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
-	i += 3;
-	p->invr0_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
-	i += 3;
-	p->pow_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
-	i += 3;
-	p->tlimit_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
-	i += 3;
+	if (priv->dspbin_typ == TASDEV_BASIC) {
+		p->r0_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+		i += 3;
+		p->r0_low_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+		i += 3;
+		p->invr0_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+		i += 3;
+		p->pow_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+		i += 3;
+		p->tlimit_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+		i += 3;
+	} else {
+		i += 15;
+	}
 
 	memcpy(dst, &src[i], cali_data->total_sz);
-	return rc;
+	return 1;
 }
 
 static int tas2781_latch_reg_get(struct snd_kcontrol *kcontrol,
@@ -649,12 +685,19 @@ static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
-	unsigned int reg;
+	unsigned int reg = TAS2781_RUNTIME_RE_REG_TF;
+
+	if (tas_priv->chip_id == TAS2781) {
+		struct tasdevice_fw *tas_fmw = tas_priv->fmw;
+		struct fct_param_address *p = &(tas_fmw->fct_par_addr);
 
-	if (tas_priv->chip_id == TAS2781)
 		reg = TAS2781_RUNTIME_RE_REG_TF;
-	else
+		if (tas_priv->dspbin_typ)
+			reg = TASDEVICE_REG(p->tf_reg[0], p->tf_reg[1],
+				p->tf_reg[2]);
+	} else {
 		reg = TAS2563_RUNTIME_RE_REG_TF;
+	}
 
 	guard(mutex)(&tas_priv->codec_lock);
 	dst[0] = bytes_ext->max;
@@ -669,12 +712,19 @@ static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
-	unsigned int reg;
+	unsigned int reg = TAS2781_RUNTIME_RE_REG;
 
-	if (tas_priv->chip_id == TAS2781)
-		reg = TAS2781_RUNTIME_RE_REG;
-	else
+	if (tas_priv->chip_id == TAS2781) {
+		struct tasdevice_fw *tas_fmw = tas_priv->fmw;
+		struct fct_param_address *p = &(tas_fmw->fct_par_addr);
+
+		if (tas_priv->dspbin_typ)
+			reg = TASDEVICE_REG(p->r0_reg[0], p->r0_reg[1],
+				p->r0_reg[2]);
+	} else {
 		reg = TAS2563_RUNTIME_RE_REG;
+	}
+
 	guard(mutex)(&tas_priv->codec_lock);
 	dst[0] = bytes_ext->max;
 	return calib_data_get(tas_priv, reg, &dst[1]);
@@ -708,11 +758,16 @@ static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
+	struct fct_param_address *p = &(tas_fmw->fct_par_addr);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
 	unsigned int reg = TASDEVICE_XM_A1_REG;
 
+	if (tas_priv->dspbin_typ)
+		reg = TASDEVICE_REG(p->a1_reg[0], p->a1_reg[1], p->a1_reg[2]);
+
 	guard(mutex)(&tas_priv->codec_lock);
 	dst[0] = bytes_ext->max;
 	return calib_data_get(tas_priv, reg, &dst[1]);
@@ -723,11 +778,16 @@ static int tasdev_XMA2_data_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
+	struct fct_param_address *p = &(tas_fmw->fct_par_addr);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
 	unsigned char *dst = ucontrol->value.bytes.data;
 	unsigned int reg = TASDEVICE_XM_A2_REG;
 
+	if (tas_priv->dspbin_typ)
+		reg = TASDEVICE_REG(p->a2_reg[0], p->a2_reg[1], p->a2_reg[2]);
+
 	guard(mutex)(&tas_priv->codec_lock);
 	dst[0] = bytes_ext->max;
 	return calib_data_get(tas_priv, reg, &dst[1]);
@@ -1185,10 +1245,50 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 	return ret;
 }
 
+static void cali_reg_update(struct bulk_reg_val *p,
+	struct fct_param_address *t)
+{
+	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
+	int reg = 0;
+	int j;
+
+	for (j = 0; j < sum; j++) {
+		switch (tas2781_cali_start_reg[j].reg) {
+		case 0:
+		reg = TASDEVICE_REG(t->thr[0], t->thr[1], t->thr[2]);
+			break;
+		case TAS2781_PRM_PLT_FLAG_REG:
+		reg = TASDEVICE_REG(t->plt_flg[0], t->plt_flg[1],
+			t->plt_flg[2]);
+			break;
+		case TAS2781_PRM_SINEGAIN_REG:
+		reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1], t->sin_gn[2]);
+			break;
+		case TAS2781_PRM_SINEGAIN2_REG:
+		reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1], t->sin_gn[2]);
+			break;
+		default:
+		reg = 0;
+			break;
+		}
+		if (reg)
+			p[j].reg = reg;
+	}
+}
+
+static void alpa_cali_update(struct bulk_reg_val *p,
+	struct fct_param_address *t)
+{
+	p->is_locked = false;
+	p->reg = TASDEVICE_REG(t->thr2[0], t->thr2[1], t->thr2[2]);
+	p->val_len = 4;
+}
+
 static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 {
 	struct calidata *cali_data = &priv->cali_data;
 	struct tasdevice *tasdev = priv->tasdevice;
+	struct tasdevice_fw *fmw = priv->fmw;
 	struct soc_bytes_ext *ext_cali_data;
 	struct snd_kcontrol_new *cali_ctrls;
 	unsigned int nctrls;
@@ -1204,14 +1304,25 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	}
 
 	if (priv->chip_id == TAS2781) {
+		struct fct_param_address *t = &(fmw->fct_par_addr);
+
 		cali_ctrls = (struct snd_kcontrol_new *)tas2781_cali_controls;
 		nctrls = ARRAY_SIZE(tas2781_cali_controls);
 		for (i = 0; i < priv->ndev; i++) {
-			tasdev[i].cali_data_backup =
+			struct bulk_reg_val *p;
+
+			p = tasdev[i].cali_data_backup =
 				kmemdup(tas2781_cali_start_reg,
 				sizeof(tas2781_cali_start_reg), GFP_KERNEL);
 			if (!tasdev[i].cali_data_backup)
 				return -ENOMEM;
+			if (priv->dspbin_typ) {
+				cali_reg_update(p, t);
+				if (priv->dspbin_typ == TASDEV_ALPHA) {
+					p = &tasdev[i].alp_cali_bckp;
+					alpa_cali_update(p, t);
+				}
+			}
 		}
 	} else {
 		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
-- 
2.34.1

