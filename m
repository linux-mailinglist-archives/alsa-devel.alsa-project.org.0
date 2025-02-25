Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E206A441B2
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2025 15:04:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76D8460240;
	Tue, 25 Feb 2025 15:04:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76D8460240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740492268;
	bh=wVaEWW/EP8zjgx0iORj78uY3C12Ux1V1z2l8aMIw7EY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hFFe76LA1lS6vJYzyyfPjC414wCQBFXyB+PJ3as2vTQTuM0j2eTt14ztrHUpVjK+u
	 zYWP7bHkQCne4M6073KO1MCD4TsrnwoVswpd07W3aYX2SP9QmQCY1g1nkCMWnUW+bM
	 rPb3cbqX8Q12puBQs8KqmjE6ELZhkm0iX2Y3Z/ss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0110F805BA; Tue, 25 Feb 2025 15:03:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A42C5F805BA;
	Tue, 25 Feb 2025 15:03:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A476BF80526; Tue, 25 Feb 2025 15:03:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D805F8016E
	for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2025 15:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D805F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=vr5ii3kT
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51PE3Pqt1182851
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 08:03:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740492205;
	bh=Y/sKB4xGydUBvqnUp2e4K18JxaFoEkQi1BokHAuPCuI=;
	h=From:To:CC:Subject:Date;
	b=vr5ii3kT8ovhf7UjFnhJI4xoc+2Dko+YuGhCRbJffvoAAhM2Gi7Y9950rKx2WU542
	 67O7//OGfcKIPjlx1bn96+G6EHk/4Jjk31+beX1gedeAEs79U+KtGx4khIsB7OkK0u
	 0HPASDQlcFqNOTgsRMxGWaTUpPovMDLk40OjAhZs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51PE3P82129863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 08:03:25 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 08:03:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 08:03:24 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.186])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PE3La2040283;
	Tue, 25 Feb 2025 08:03:22 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v3] ASoC: tas2781: Support dsp firmware Alpha and Beta seaies
Date: Tue, 25 Feb 2025 22:03:16 +0800
Message-ID: <20250225140316.1049-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: K6CXRLN6CI5DO6IVASOZNTQ72DL5DUCF
X-Message-ID-Hash: K6CXRLN6CI5DO6IVASOZNTQ72DL5DUCF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6CXRLN6CI5DO6IVASOZNTQ72DL5DUCF/>
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
into the firmware.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v3:
 - Merge the 4 patches into one patch
v2:
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes:
   | https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/2025
   | 02160812.P7szOygN-lkp@intel.com/__;!!G3vK!WriwhtbQGlg6p00bcWutlhb-y9vS
   | pDrSu5_g9oOzzGOoABdirEARTntFzyX6Ss3UPRDxi_E-IA$
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes:
   | https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/2025
   | 02160632.u0zxG7yD-lkp@intel.com/__;!!G3vK!VtEdfur3fZklvPVfHFFfFP60Ub2E
   | JYvmjSUZ65lJ6BsQPJDl1fjYRDqh3c6Q5y6sA70ssXDG5g$
v1:
 - update the year from 2024 to 2025 in the files.
 - Add dspbin_type to distinguish different dspbin types, such as
   TASDEV_BASIC, TASDEV_ALPHA, and TASDEV_BETA.
 - Add struct bulk_reg_val alp_cali_bckp to store the value of pilot
   tone threshold only for TASDEV_ALPHA & TASDEV_BETA firmware.
 - Add the declaration of (*fw_parse_fct_param_address)() to parse
   the addresses of calibration params.
 - Add the minimum version of TASDEV_ALPHA and TASDEV_BETA firmware.
 - Add the definition of struct fct_param_address.
 - update the year from 2024 to 2025.
 - release the memory to save calibration addresses in
   tasdevice_dsp_remove().
 - Add TASDEV_ALPHA and TASDEV_BETA firmware checking code.
 - Add fct_param_address_parser for Alpha and Beta firmware.
 - Add an extra branch to handle calibration address for TASDEV_ALPHA
   and TASDEV_BETA firmware.
---
 include/sound/tas2781-dsp.h       |  26 +++-
 include/sound/tas2781.h           |  13 +-
 sound/pci/hda/tas2781_spi_fwlib.c |   6 +-
 sound/soc/codecs/tas2781-comlib.c |   3 +-
 sound/soc/codecs/tas2781-fmwlib.c | 149 +++++++++++++++++++++-
 sound/soc/codecs/tas2781-i2c.c    | 203 +++++++++++++++++++++++-------
 6 files changed, 340 insertions(+), 60 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index 3cda9da14f6d..77a240daaae0 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2025 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2781 driver implements a flexible and configurable
@@ -30,8 +30,10 @@
 #define PRE_DEVICE_C				0x12
 #define PRE_DEVICE_D				0x16
 
-#define PPC3_VERSION				0x4100
-#define PPC3_VERSION_TAS2781			0x14600
+#define PPC3_VERSION_BASE			0x4100
+#define PPC3_VERSION_TAS2781_BASIC_MIN		0x14600
+#define PPC3_VERSION_TAS2781_ALPHA_MIN		0x4a00
+#define PPC3_VERSION_TAS2781_BETA_MIN		0x19400
 #define TASDEVICE_DEVICE_SUM			8
 #define TASDEVICE_CONFIG_SUM			64
 
@@ -106,6 +108,23 @@ struct tasdevice_calibration {
 	struct tasdevice_data dev_data;
 };
 
+struct fct_param_address {
+	unsigned char thr[3];
+	unsigned char thr2[3];
+	unsigned char plt_flg[3];
+	unsigned char sin_gn[3];
+	unsigned char sin_gn2[3];
+	/* real-time spk impedance */
+	unsigned char r0_reg[3];
+	/* check spk connection */
+	unsigned char tf_reg[3];
+	/* check spk resonant frequency */
+	unsigned char a1_reg[3];
+	unsigned char a2_reg[3];
+	unsigned short size;
+	char *data;
+};
+
 struct tasdevice_fw {
 	struct tasdevice_dspfw_hdr fw_hdr;
 	unsigned short nr_programs;
@@ -114,6 +133,7 @@ struct tasdevice_fw {
 	struct tasdevice_config *configs;
 	unsigned short nr_calibrations;
 	struct tasdevice_calibration *calibrations;
+	struct fct_param_address fct_par_addr;
 	struct device *dev;
 };
 
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 72d2060904f6..5cfbb9e0a626 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2563/TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2025 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2563/TAS2781 driver implements a flexible and configurable
@@ -112,6 +112,12 @@ enum audio_device {
 	TAS2781,
 };
 
+enum dspbin_type {
+	TASDEV_BASIC,
+	TASDEV_ALPHA,
+	TASDEV_BETA,
+};
+
 enum device_catlog_id {
 	LENOVO = 0,
 	OTHERS
@@ -126,6 +132,7 @@ struct bulk_reg_val {
 
 struct tasdevice {
 	struct bulk_reg_val *cali_data_backup;
+	struct bulk_reg_val alp_cali_bckp;
 	struct tasdevice_fw *cali_data_fmw;
 	unsigned int dev_addr;
 	unsigned int err_code;
@@ -171,6 +178,7 @@ struct tasdevice_priv {
 	unsigned char dev_name[32];
 	const char *name_prefix;
 	unsigned char ndev;
+	unsigned int dspbin_typ;
 	unsigned int magic_num;
 	unsigned int chip_id;
 	unsigned int sysclk;
@@ -196,6 +204,9 @@ struct tasdevice_priv {
 	int (*fw_parse_configuration_data)(struct tasdevice_priv *tas_priv,
 		struct tasdevice_fw *tas_fmw,
 		const struct firmware *fmw, int offset);
+	int (*fw_parse_fct_param_address)(struct tasdevice_priv *tas_priv,
+		struct tasdevice_fw *tas_fmw,
+		const struct firmware *fmw, int offset);
 	int (*tasdevice_load_block)(struct tasdevice_priv *tas_priv,
 		struct tasdev_blk *block);
 
diff --git a/sound/pci/hda/tas2781_spi_fwlib.c b/sound/pci/hda/tas2781_spi_fwlib.c
index 131d9a77d140..c90641119509 100644
--- a/sound/pci/hda/tas2781_spi_fwlib.c
+++ b/sound/pci/hda/tas2781_spi_fwlib.c
@@ -370,10 +370,10 @@ static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
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
@@ -1605,7 +1605,7 @@ static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 	int rc = 0;
 
 	if (drv_ver == 0x100) {
-		if (ppcver >= PPC3_VERSION) {
+		if (ppcver >= PPC3_VERSION_BASE) {
 			tas_priv->fw_parse_variable_header =
 				fw_parse_variable_header_kernel;
 			tas_priv->fw_parse_program_data =
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

