Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 968EAA3B176
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2025 07:12:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D3D860493;
	Wed, 19 Feb 2025 07:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D3D860493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739945536;
	bh=gIRH7E8TZ7XrMiW2TE34BPlafCk//RbEOXitjC5zzuo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PyY2hkLwCtQE1HhSqwR8MDEO1zVvcVX+pCK7wNT/lB/NcA3dYH/+ttQj/+fPCQ+5U
	 k9zBEISpPkfhvgZJyHnl+Zhk8QnY4xmTRU6cRUqDm5pltnCCf1PmEP1ZU+C3Cao31X
	 nrd4iJwh6UFjEOYKVGjPeeIxSEuxMSWYl6mf2das=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59D8AF805CB; Wed, 19 Feb 2025 07:11:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6772F805C5;
	Wed, 19 Feb 2025 07:11:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D088F8014B; Wed, 19 Feb 2025 07:11:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9567FF800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2025 07:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9567FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=jfyVFUgE
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51J6BCwq1881631
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Feb 2025 00:11:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739945472;
	bh=Jc3v2MpbmeeuPAbjOWCDa9Wj+knDNedPUtsKhDgICs8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jfyVFUgEzDvbaRydluIFVbkxXQYyl61BTY6hSdUJ5+Ru1meteu8iTzuqD+bbPFJ2M
	 GrzMejX/3HbVvG+hygmPolg79Xj5MYSHir0Dm09dBnu82EIGjO23lbT04hLp3b+PUd
	 NgGhLFFoDupBIvUVhKe5q/fElPiTCRiKZ0onSX9E=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J6BC2f099861;
	Wed, 19 Feb 2025 00:11:12 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 00:11:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 00:11:12 -0600
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.207])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J6B2Zw062304;
	Wed, 19 Feb 2025 00:11:09 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2 3/4] ASoC: tas2781: Support dsp firmware Alpha and Beta
 seaies
Date: Wed, 19 Feb 2025 14:10:56 +0800
Message-ID: <20250219061057.714-3-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250219061057.714-1-shenghao-ding@ti.com>
References: <20250219061057.714-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: U6E5MANUNE2E2KJTNHDE3KDOYL4BOE57
X-Message-ID-Hash: U6E5MANUNE2E2KJTNHDE3KDOYL4BOE57
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6E5MANUNE2E2KJTNHDE3KDOYL4BOE57/>
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
v2:
 - No further update
v1:
 - update the year from 2024 to 2025.
 - Add an extra branch to handle calibration address for TASDEV_ALPHA
   and TASDEV_BETA firmware.
---
 sound/soc/codecs/tas2781-i2c.c | 203 +++++++++++++++++++++++++--------
 1 file changed, 157 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 90c5b2e74d12..8eb9fee27a42 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
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
 
@@ -590,16 +622,20 @@ static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
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
 	return 1;
@@ -646,12 +682,19 @@ static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
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
@@ -666,12 +709,19 @@ static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
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
@@ -705,11 +755,16 @@ static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
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
@@ -720,11 +775,16 @@ static int tasdev_XMA2_data_get(struct snd_kcontrol *kcontrol,
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
@@ -1172,10 +1232,50 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 		nr_controls < mix_index ? nr_controls : mix_index);
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
@@ -1191,14 +1291,25 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
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

