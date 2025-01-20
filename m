Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBA2A1665F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 06:32:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6587E601C1;
	Mon, 20 Jan 2025 06:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6587E601C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737351123;
	bh=zS/RfxoGfkQjga/2O34szcQXj5On074OjmX6t1ofdbw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m0yntfQVTiIqXvMlOtMHYjhrw7wIZozDrqUR1XumgtTeixjpZFagDKGEvBPNpGO6F
	 ZE7Tlsp+NzJECrYYFheYSUf/Ig5zjVaEo9aA0sxjmSpj+Ajh1Dt7AkWYmscF48WwO2
	 FhHdiW1gT3Ulq4pBozLbuvO49J/pQjHza83qGK00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A646F805B2; Mon, 20 Jan 2025 06:31:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 812A4F805AB;
	Mon, 20 Jan 2025 06:31:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4634F80517; Mon, 20 Jan 2025 06:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C482DF8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 06:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C482DF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=KEVf2bAu
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50K5UY6e730633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 19 Jan 2025 23:30:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737351034;
	bh=zC/n4lPGt9c4o50+MpQCqKqEPkOebZ1HI1fg/jWmihk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KEVf2bAuFQa5rSilHgppESN0irqtO4tajGaFjW6tVqdXW2ikZrKM4VMkVYsjrnExm
	 dfFRwM8ElqM2aB6NosKOkKO8g11YTF0CBX0pw/TshGo/I0MhZwlUxi4Vx5kG3mcPLk
	 g+ZPrMCwfJDEJ+ovCWW+6Oj8SmnD18vGIozrL9f8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50K5UYdr027269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 Jan 2025 23:30:34 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 19
 Jan 2025 23:30:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 19 Jan 2025 23:30:34 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.124])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50K5URNN130674;
	Sun, 19 Jan 2025 23:30:31 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1 2/3] ASoC: tas2781: Support dsp firmware Alpha and Beta
 seaies
Date: Mon, 20 Jan 2025 13:30:22 +0800
Message-ID: <20250120053023.715-2-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250120053023.715-1-shenghao-ding@ti.com>
References: <20250120053023.715-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: Q6AZ6FZ7RW56EOSEUWNSPYRG7D5GRBBA
X-Message-ID-Hash: Q6AZ6FZ7RW56EOSEUWNSPYRG7D5GRBBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6AZ6FZ7RW56EOSEUWNSPYRG7D5GRBBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For calibration, basic version does not contain any calibration addresses,
it depends on calibration tool to convey the addresses to the driver.
Since Alpha and Beta firmware, all the calibration addresses are saved
into the firmware.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - update the year from 2024 to 2025.
 - release the memory to save calibration addresses in
   tasdevice_dsp_remove().
 - Add TASDEV_ALPHA and TASDEV_BETA firmware checking code.
 - Add fct_param_address_parser for Alpha and Beta firmware.
---
 sound/soc/codecs/tas2781-comlib.c |   3 +-
 sound/soc/codecs/tas2781-fmwlib.c | 149 ++++++++++++++++++++++++++++--
 2 files changed, 145 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 1e0b3aa95749..bba5abe4736f 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -2,7 +2,7 @@
 //
 // TAS2563/TAS2781 Common functions for HDA and ASoC Audio drivers
 //
-// Copyright 2023 - 2024 Texas Instruments, Inc.
+// Copyright 2023 - 2025 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
@@ -429,6 +429,7 @@ void tasdevice_dsp_remove(void *context)
 	if (tas_fmw->configs)
 		tasdev_dsp_cfg_remove(tas_fmw->configs,
 			tas_fmw->nr_configurations);
+	kfree(tas_fmw->fct_par_addr.data);
 	kfree(tas_fmw);
 	tas_dev->fmw = NULL;
 }
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 61d9c220b6a4..2fae7be99454 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2,7 +2,7 @@
 //
 // tas2781-fmwlib.c -- TASDEVICE firmware support
 //
-// Copyright 2023 - 2024 Texas Instruments, Inc.
+// Copyright 2023 - 2025 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
@@ -389,10 +389,10 @@ static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
 	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);
 	unsigned char dev_idx = 0;
 
-	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
+	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781_BASIC_MIN) {
 		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
 		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
-	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
+	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION_BASE) {
 		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
 		n = ARRAY_SIZE(ppc3_mapping_table);
 	}
@@ -559,6 +559,118 @@ static int fw_parse_configuration_data_kernel(
 	return offset;
 }
 
+static void hex_parse_u8(unsigned char *item, const unsigned char *val,
+	int len)
+{
+	for (int i = 0; i < len; i++)
+		item[i] = val[i];
+}
+
+static void hex_parse_u24(unsigned int *item, const unsigned char *val)
+{
+	*item = TASDEVICE_REG(val[0], val[1], val[2]);
+}
+
+static void fct_param_address_parser(struct cali_reg *r,
+	struct tasdevice_fw *tas_fmw)
+{
+	struct fct_param_address *p = &(tas_fmw->fct_par_addr);
+	int i;
+
+	for (i = 0; i < 20; i++) {
+		const unsigned char *dat = &p->data[24 * i];
+
+		if (dat[23] != 1)
+			break;
+
+		if (strstr(dat, "umg_SsmKEGCye") != NULL) {
+			hex_parse_u24(&r->pow_reg, &dat[20]);
+			continue;
+		}
+		if (strstr(dat, "iks_E0") != NULL) {
+			hex_parse_u24(&r->r0_reg, &dat[20]);
+			continue;
+		}
+		if (strstr(dat, "yep_LsqM0") != NULL) {
+			hex_parse_u24(&r->invr0_reg, &dat[20]);
+			continue;
+		}
+		if (strstr(dat, "oyz_U0_ujx") != NULL) {
+			hex_parse_u24(&r->r0_low_reg, &dat[20]);
+			continue;
+		}
+		if (strstr(dat, "iks_GC_GMgq") != NULL) {
+			hex_parse_u24(&r->tlimit_reg, &dat[20]);
+			continue;
+		}
+		if (strstr(dat, "gou_Yao") != NULL) {
+			hex_parse_u8(p->thr, &dat[20], 3);
+			continue;
+		}
+		if (strstr(dat, "kgd_Wsc_Qsbp") != NULL) {
+			hex_parse_u8(p->plt_flg, &dat[20], 3);
+			continue;
+		}
+		if (strstr(dat, "yec_CqseSsqs") != NULL) {
+			hex_parse_u8(p->sin_gn, &dat[20], 3);
+			continue;
+		}
+		if (strstr(dat, "iks_SogkGgog2") != NULL) {
+			hex_parse_u8(p->sin_gn2, &dat[20], 3);
+			continue;
+		}
+		if (strstr(dat, "yec_Sae_Y") != NULL) {
+			hex_parse_u8(p->thr2, &dat[20], 3);
+			continue;
+		}
+		if (strstr(dat, "Re_Int") != NULL) {
+			hex_parse_u8(p->r0_reg, &dat[20], 3);
+			continue;
+		}
+		/* Check whether the spk connection is open */
+		if (strstr(dat, "SigFlag") != NULL) {
+			hex_parse_u8(p->tf_reg, &dat[20], 3);
+			continue;
+		}
+		if (strstr(dat, "a1_Int") != NULL) {
+			hex_parse_u8(p->a1_reg, &dat[20], 3);
+			continue;
+		}
+		if (strstr(dat, "a2_Int") != NULL) {
+			hex_parse_u8(p->a2_reg, &dat[20], 3);
+			continue;
+		}
+	}
+}
+
+static int fw_parse_fct_param_address(struct tasdevice_priv *tas_priv,
+	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
+{
+	struct fct_param_address *p = &(tas_fmw->fct_par_addr);
+	struct calidata *cali_data = &tas_priv->cali_data;
+	struct cali_reg *r = &cali_data->cali_reg_array;
+	const unsigned char *data = fmw->data;
+
+	if (offset + 520 > fmw->size) {
+		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
+		offset = -1;
+		goto out;
+	}
+
+	/* skip reserved part */
+	offset += 40;
+	p->size = 480;
+	p->data = kmemdup(&data[offset], 480, GFP_KERNEL);
+	if (!p->data) {
+		offset = -1;
+		goto out;
+	}
+	offset += 480;
+	fct_param_address_parser(r, tas_fmw);
+out:
+	return offset;
+}
+
 static int fw_parse_variable_header_kernel(
 	struct tasdevice_priv *tas_priv, const struct firmware *fmw,
 	int offset)
@@ -1686,13 +1798,29 @@ static int tasdevice_load_block(struct tasdevice_priv *tas_priv,
 	return rc;
 }
 
+static void dspbin_type_check(struct tasdevice_priv *tas_priv,
+	unsigned int ppcver)
+{
+	if (ppcver >= PPC3_VERSION_TAS2781_ALPHA_MIN) {
+		if (ppcver >= PPC3_VERSION_TAS2781_BETA_MIN)
+			tas_priv->dspbin_typ = TASDEV_BETA;
+		else if (ppcver >= PPC3_VERSION_TAS2781_BASIC_MIN)
+			tas_priv->dspbin_typ = TASDEV_BASIC;
+		else
+			tas_priv->dspbin_typ = TASDEV_ALPHA;
+	}
+	if (tas_priv->dspbin_typ != TASDEV_BASIC)
+		tas_priv->fw_parse_fct_param_address =
+			fw_parse_fct_param_address;
+}
+
 static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 	unsigned int drv_ver, unsigned int ppcver)
 {
 	int rc = 0;
 
 	if (drv_ver == 0x100) {
-		if (ppcver >= PPC3_VERSION) {
+		if (ppcver >= PPC3_VERSION_BASE) {
 			tas_priv->fw_parse_variable_header =
 				fw_parse_variable_header_kernel;
 			tas_priv->fw_parse_program_data =
@@ -1701,6 +1829,7 @@ static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 				fw_parse_configuration_data_kernel;
 			tas_priv->tasdevice_load_block =
 				tasdevice_load_block_kernel;
+			dspbin_type_check(tas_priv, ppcver);
 		} else {
 			switch (ppcver) {
 			case 0x00:
@@ -1716,7 +1845,7 @@ static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 			default:
 				dev_err(tas_priv->dev,
 					"%s: PPCVer must be 0x0 or 0x%02x",
-					__func__, PPC3_VERSION);
+					__func__, PPC3_VERSION_BASE);
 				dev_err(tas_priv->dev, " Current:0x%02x\n",
 					ppcver);
 				rc = -EINVAL;
@@ -2023,9 +2152,17 @@ static int tasdevice_dspfw_ready(const struct firmware *fmw,
 	}
 	offset = tas_priv->fw_parse_configuration_data(tas_priv,
 		tas_fmw, fmw, offset);
-	if (offset < 0)
+	if (offset < 0) {
 		ret = offset;
+		goto out;
+	}
 
+	if (tas_priv->fw_parse_fct_param_address) {
+		offset = tas_priv->fw_parse_fct_param_address(tas_priv,
+			tas_fmw, fmw, offset);
+		if (offset < 0)
+			ret = offset;
+	}
 out:
 	return ret;
 }
-- 
2.34.1

