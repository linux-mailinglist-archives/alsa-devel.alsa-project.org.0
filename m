Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2CA4C263
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Mar 2025 14:50:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 236786025F;
	Mon,  3 Mar 2025 14:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 236786025F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741009859;
	bh=XcCjbjz1KuenJfbs5V1QXx2d73pfcj7gtdsEjCJnzgU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cxU+O+w9RkmbjRCs4b6FXoN4mIreQGBY8GLpJAzBacjCWbQszYm8yi55GrCYeaJQ4
	 kwyh9Nd09uQlCgigpakT4CwVYPgY2F7bVMJBmdKNpFtDqEfyRUv/Ic3aCKJz0k1B+T
	 F2YFy4bYF4xLhP+9qOK6LmxhERlFcuU+VjxjVBrc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0132CF805B3; Mon,  3 Mar 2025 14:50:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3025F805BD;
	Mon,  3 Mar 2025 14:50:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AAFDF800FA; Mon,  3 Mar 2025 14:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14BF3F800FA
	for <alsa-devel@alsa-project.org>; Mon,  3 Mar 2025 14:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BF3F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=kzkAuAQS
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 523Do0bX3286965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Mar 2025 07:50:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741009800;
	bh=AjTND8vN2lZt/zTARU6FmPXg0acY0/eb4a9t7c7dijg=;
	h=From:To:CC:Subject:Date;
	b=kzkAuAQSMzAzcSMrXG7Yu33VAq2FH2ndiVPyKe0zPqG87sQEvOfsQPTCx7+9VMln/
	 KcAUjlr4l56cM4hk6Y5KBAdhKBDn3jjlIVVkt6TAYw3tMlhs1Qk7pNalh0HMACdYze
	 uznjPILbWRzy35QXk83rtzUIGu/ON0H/7gBhT3+A=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523Do0js094158;
	Mon, 3 Mar 2025 07:50:00 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 07:49:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 07:49:59 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.186])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523DntFi087907;
	Mon, 3 Mar 2025 07:49:56 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v5] ASoC: tas2781: Support dsp firmware Alpha and Beta seaies
Date: Mon, 3 Mar 2025 21:49:52 +0800
Message-ID: <20250303134952.1186-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: 5AX74Q7WHOHE5OCAUJJF2QHRZJRUCXLA
X-Message-ID-Hash: 5AX74Q7WHOHE5OCAUJJF2QHRZJRUCXLA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5AX74Q7WHOHE5OCAUJJF2QHRZJRUCXLA/>
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
v5:
 - Instead of the lengthy approach, just replace if-continue with else if,
   has reduced this by 2/3 of LoCs
 - Use proper error code in fw_parse_fct_param_address()
 - return directly in tasdevice_dspfw_ready()
 - drop Unneeded assignment
v4:
 - drop unnecceary "unsigned short size;" and "char *data;" in
   struct fct_param_address
 - replace strstr() with strncmp() in fct_param_address_parser()
 - replace hex_parse_u8() with memcpy()
 - replace hex_parse_u24() with direct assignment
 - drop hex_parse_u8() & hex_parse_u24()
 - Just return directly and use proper error codes and drop "goto out"
   and "out:" label in fw_parse_fct_param_address
 - fixed indentation issues in cali_reg_update
 - fixed the logical splits in tas2781_calib_stop_put()
 - return -ENOMEM if kmemdup fails in fw_parse_fct_param_address()
 - remove unnecessary "out:" label
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
 include/sound/tas2781-dsp.h       |  30 ++++-
 include/sound/tas2781.h           |  11 ++
 sound/pci/hda/tas2781_spi_fwlib.c |   8 +-
 sound/soc/codecs/tas2781-fmwlib.c | 190 ++++++++++++++++++++++----
 sound/soc/codecs/tas2781-i2c.c    | 215 ++++++++++++++++++++++--------
 5 files changed, 368 insertions(+), 86 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index 3cda9da14f6d..c3a9efa73d5d 100644
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
 
@@ -106,6 +108,27 @@ struct tasdevice_calibration {
 	struct tasdevice_data dev_data;
 };
 
+struct fct_param_address {
+	/* Thermal data for PG 1.0 device */
+	unsigned char thr[3];
+	/* Thermal data for PG 2.0 device */
+	unsigned char thr2[3];
+	/* Pilot tone enable flag, usually the sine wave */
+	unsigned char plt_flg[3];
+	/* Pilot tone gain for calibration */
+	unsigned char sin_gn[3];
+	/* Pilot tone gain for calibration */
+	unsigned char sin_gn2[3];
+	/* high 32-bit of real-time spk impedance */
+	unsigned char r0_reg[3];
+	/* check spk connection */
+	unsigned char tf_reg[3];
+	/* check spk resonant frequency */
+	unsigned char a1_reg[3];
+	/* check spk resonant frequency */
+	unsigned char a2_reg[3];
+};
+
 struct tasdevice_fw {
 	struct tasdevice_dspfw_hdr fw_hdr;
 	unsigned short nr_programs;
@@ -114,6 +137,7 @@ struct tasdevice_fw {
 	struct tasdevice_config *configs;
 	unsigned short nr_calibrations;
 	struct tasdevice_calibration *calibrations;
+	struct fct_param_address fct_par_addr;
 	struct device *dev;
 };
 
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 4d9a37544354..eff011444cc8 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -113,6 +113,12 @@ enum audio_device {
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
@@ -127,6 +133,7 @@ struct bulk_reg_val {
 
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
index 0e2acbc3c900..19a693d58ee8 100644
--- a/sound/pci/hda/tas2781_spi_fwlib.c
+++ b/sound/pci/hda/tas2781_spi_fwlib.c
@@ -2,7 +2,7 @@
 //
 // TAS2781 HDA SPI driver
 //
-// Copyright 2024 Texas Instruments, Inc.
+// Copyright 2024 - 2025 Texas Instruments, Inc.
 //
 // Author: Baojun Xu <baojun.xu@ti.com>
 
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
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index bc2f68bd9846..13a197468193 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -390,10 +390,10 @@ static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
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
@@ -560,6 +560,124 @@ static int fw_parse_configuration_data_kernel(
 	return offset;
 }
 
+static void fct_param_address_parser(struct cali_reg *r,
+	struct tasdevice_fw *tas_fmw, const unsigned char *data)
+{
+	struct fct_param_address *p = &tas_fmw->fct_par_addr;
+	unsigned int i;
+
+	/*
+	 * Calibration parameters locations and data schema in dsp firmware.
+	 * The number of items are flexible, but not more than 20. The dsp tool
+	 * will reseve 20*24-byte space for fct params. In some cases, the
+	 * number of fct param is less than 20, the data will be saved from the
+	 * beginning, the rest part will be stuffed with zero.
+	 *
+	 *	fct_param_num (not more than 20)
+	 *	for (i = 0; i < fct_param_num; i++) {
+	 *		Alias of fct param (20 bytes)
+	 *		Book (1 byte)
+	 *		Page (1 byte)
+	 *		Offset (1 byte)
+	 *		CoeffLength (1 byte) = 0x1
+	 *	}
+	 *	if (20 - fct_param_num)
+	 *		24*(20 - fct_param_num) pieces of '0' as stuffing
+	 *
+	 * As follow:
+	 * umg_SsmKEGCye	 = Book, Page, Offset, CoeffLength
+	 * iks_E0		 = Book, Page, Offset, CoeffLength
+	 * yep_LsqM0		 = Book, Page, Offset, CoeffLength
+	 * oyz_U0_ujx		 = Book, Page, Offset, CoeffLength
+	 * iks_GC_GMgq		 = Book, Page, Offset, CoeffLength
+	 * gou_Yao		 = Book, Page, Offset, CoeffLength
+	 * kgd_Wsc_Qsbp		 = Book, Page, Offset, CoeffLength
+	 * yec_CqseSsqs		 = Book, Page, Offset, CoeffLength
+	 * iks_SogkGgog2	 = Book, Page, Offset, CoeffLength
+	 * yec_Sae_Y		 = Book, Page, Offset, CoeffLength
+	 * Re_Int		 = Book, Page, Offset, CoeffLength
+	 * SigFlag		 = Book, Page, Offset, CoeffLength
+	 * a1_Int		 = Book, Page, Offset, CoeffLength
+	 * a2_Int		 = Book, Page, Offset, CoeffLength
+	 */
+	for (i = 0; i < 20; i++) {
+		const unsigned char *dat = &data[24 * i];
+
+		/*
+		 * check whether current fct param is empty.
+		 */
+		if (dat[23] != 1)
+			break;
+
+		if (!strncmp(dat, "umg_SsmKEGCye", 20))
+			r->pow_reg = TASDEVICE_REG(dat[20], dat[21], dat[22]);
+		/* high 32-bit of real-time spk impedance */
+		else if (!strncmp(dat, "iks_E0", 20))
+			r->r0_reg = TASDEVICE_REG(dat[20], dat[21], dat[22]);
+		/* inverse of real-time spk impedance */
+		else if (!strncmp(dat, "yep_LsqM0", 20))
+			r->invr0_reg =
+				TASDEVICE_REG(dat[20], dat[21], dat[22]);
+		/* low 32-bit of real-time spk impedance */
+		else if (!strncmp(dat, "oyz_U0_ujx", 20))
+			r->r0_low_reg =
+				TASDEVICE_REG(dat[20], dat[21], dat[22]);
+		/* Delta Thermal Limit */
+		else if (!strncmp(dat, "iks_GC_GMgq", 20))
+			r->tlimit_reg =
+				TASDEVICE_REG(dat[20], dat[21], dat[22]);
+		/* Thermal data for PG 1.0 device */
+		else if (!strncmp(dat, "gou_Yao", 20))
+			memcpy(p->thr, &dat[20], 3);
+		/* Pilot tone enable flag, usually the sine wave */
+		else if (!strncmp(dat, "kgd_Wsc_Qsbp", 20))
+			memcpy(p->plt_flg, &dat[20], 3);
+		/* Pilot tone gain for calibration */
+		else if (!strncmp(dat, "yec_CqseSsqs", 20))
+			memcpy(p->sin_gn, &dat[20], 3);
+		/* Pilot tone gain for calibration, useless in PG 2.0 */
+		else if (!strncmp(dat, "iks_SogkGgog2", 20))
+			memcpy(p->sin_gn2, &dat[20], 3);
+		/* Thermal data for PG 2.0 device */
+		else if (!strncmp(dat, "yec_Sae_Y", 20))
+			memcpy(p->thr2, &dat[20], 3);
+		/* Spk Equivalent Resistance in fixed-point format */
+		else if (!strncmp(dat, "Re_Int", 20))
+			memcpy(p->r0_reg, &dat[20], 3);
+		/* Check whether the spk connection is open */
+		else if (!strncmp(dat, "SigFlag", 20))
+			memcpy(p->tf_reg, &dat[20], 3);
+		/* check spk resonant frequency */
+		else if (!strncmp(dat, "a1_Int", 20))
+			memcpy(p->a1_reg, &dat[20], 3);
+		/* check spk resonant frequency */
+		else if (!strncmp(dat, "a2_Int", 20))
+			memcpy(p->a2_reg, &dat[20], 3);
+	}
+}
+
+static int fw_parse_fct_param_address(struct tasdevice_priv *tas_priv,
+	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
+{
+	struct calidata *cali_data = &tas_priv->cali_data;
+	struct cali_reg *r = &cali_data->cali_reg_array;
+	const unsigned char *data = fmw->data;
+
+	if (offset + 520 > fmw->size) {
+		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
+		return -EINVAL;
+	}
+
+	/* skip reserved part */
+	offset += 40;
+
+	fct_param_address_parser(r, tas_fmw, &data[offset]);
+
+	offset += 480;
+
+	return offset;
+}
+
 static int fw_parse_variable_header_kernel(
 	struct tasdevice_priv *tas_priv, const struct firmware *fmw,
 	int offset)
@@ -1687,13 +1805,29 @@ static int tasdevice_load_block(struct tasdevice_priv *tas_priv,
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
@@ -1702,6 +1836,7 @@ static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 				fw_parse_configuration_data_kernel;
 			tas_priv->tasdevice_load_block =
 				tasdevice_load_block_kernel;
+			dspbin_type_check(tas_priv, ppcver);
 		} else {
 			switch (ppcver) {
 			case 0x00:
@@ -1717,7 +1852,7 @@ static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 			default:
 				dev_err(tas_priv->dev,
 					"%s: PPCVer must be 0x0 or 0x%02x",
-					__func__, PPC3_VERSION);
+					__func__, PPC3_VERSION_BASE);
 				dev_err(tas_priv->dev, " Current:0x%02x\n",
 					ppcver);
 				rc = -EINVAL;
@@ -1953,28 +2088,25 @@ static int tasdevice_dspfw_ready(const struct firmware *fmw,
 	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr;
 	struct tasdevice_fw *tas_fmw;
 	int offset = 0;
-	int ret = 0;
+	int ret;
 
 	if (!fmw || !fmw->data) {
 		dev_err(tas_priv->dev, "%s: Failed to read firmware %s\n",
 			__func__, tas_priv->coef_binaryname);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	tas_priv->fmw = kzalloc(sizeof(struct tasdevice_fw), GFP_KERNEL);
-	if (!tas_priv->fmw) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!tas_priv->fmw)
+		return -ENOMEM;
+
 	tas_fmw = tas_priv->fmw;
 	tas_fmw->dev = tas_priv->dev;
 	offset = fw_parse_header(tas_priv, tas_fmw, fmw, offset);
 
-	if (offset == -EINVAL) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (offset == -EINVAL)
+		return -EINVAL;
+
 	fw_fixed_hdr = &(tas_fmw->fw_hdr.fixed_hdr);
 	/* Support different versions of firmware */
 	switch (fw_fixed_hdr->drv_ver) {
@@ -2007,28 +2139,32 @@ static int tasdevice_dspfw_ready(const struct firmware *fmw,
 		ret = dspfw_default_callback(tas_priv,
 			fw_fixed_hdr->drv_ver, fw_fixed_hdr->ppcver);
 		if (ret)
-			goto out;
+			return ret;
 		break;
 	}
 
 	offset = tas_priv->fw_parse_variable_header(tas_priv, fmw, offset);
-	if (offset < 0) {
-		ret = offset;
-		goto out;
-	}
+	if (offset < 0)
+		return offset;
+
 	offset = tas_priv->fw_parse_program_data(tas_priv, tas_fmw, fmw,
 		offset);
-	if (offset < 0) {
-		ret = offset;
-		goto out;
-	}
+	if (offset < 0)
+		return offset;
+
 	offset = tas_priv->fw_parse_configuration_data(tas_priv,
 		tas_fmw, fmw, offset);
 	if (offset < 0)
-		ret = offset;
+		return offset;
 
-out:
-	return ret;
+	if (tas_priv->fw_parse_fct_param_address) {
+		offset = tas_priv->fw_parse_fct_param_address(tas_priv,
+			tas_fmw, fmw, offset);
+		if (offset < 0)
+			return offset;
+	}
+
+	return 0;
 }
 
 int tasdevice_dsp_parser(void *context)
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 90c5b2e74d12..b950914b7d48 100644
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
@@ -452,14 +479,15 @@ static int tas2781_calib_start_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static void tas2781_calib_stop_put(struct tasdevice_priv *tas_priv)
+static void tas2781_calib_stop_put(struct tasdevice_priv *priv)
 {
 	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
 	int i, j;
 
-	for (i = 0; i < tas_priv->ndev; i++) {
-		struct tasdevice *tasdev = tas_priv->tasdevice;
+	for (i = 0; i < priv->ndev; i++) {
+		struct tasdevice *tasdev = priv->tasdevice;
 		struct bulk_reg_val *p = tasdev[i].cali_data_backup;
+		struct bulk_reg_val *t = &tasdev[i].alp_cali_bckp;
 
 		if (p == NULL)
 			continue;
@@ -467,18 +495,21 @@ static void tas2781_calib_stop_put(struct tasdevice_priv *tas_priv)
 		for (j = 0; j < sum; j++) {
 			if (p[j].val_len == 1) {
 				if (p[j].is_locked)
-					tasdevice_dev_write(tas_priv, i,
+					tasdevice_dev_write(priv, i,
 						TAS2781_TEST_UNLOCK_REG,
 						TAS2781_TEST_PAGE_UNLOCK);
-				tasdevice_dev_write(tas_priv, i, p[j].reg,
+				tasdevice_dev_write(priv, i, p[j].reg,
 					p[j].val[0]);
 			} else {
 				if (!p[j].reg)
 					continue;
-				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+				tasdevice_dev_bulk_write(priv, i, p[j].reg,
 					p[j].val, 4);
 			}
 		}
+
+		if (priv->dspbin_typ == TASDEV_ALPHA)
+			tasdevice_dev_bulk_write(priv, i, t->reg, t->val, 4);
 	}
 }
 
@@ -590,16 +621,20 @@ static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
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
@@ -646,12 +681,19 @@ static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
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
@@ -666,12 +708,19 @@ static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
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
@@ -705,11 +754,16 @@ static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
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
@@ -720,11 +774,16 @@ static int tasdev_XMA2_data_get(struct snd_kcontrol *kcontrol,
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
@@ -1172,10 +1231,51 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 		nr_controls < mix_index ? nr_controls : mix_index);
 }
 
+static void cali_reg_update(struct bulk_reg_val *p,
+	struct fct_param_address *t)
+{
+	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
+	int reg, j;
+
+	for (j = 0; j < sum; j++) {
+		switch (tas2781_cali_start_reg[j].reg) {
+		case 0:
+			reg = TASDEVICE_REG(t->thr[0], t->thr[1], t->thr[2]);
+			break;
+		case TAS2781_PRM_PLT_FLAG_REG:
+			reg = TASDEVICE_REG(t->plt_flg[0], t->plt_flg[1],
+				t->plt_flg[2]);
+			break;
+		case TAS2781_PRM_SINEGAIN_REG:
+			reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1],
+				t->sin_gn[2]);
+			break;
+		case TAS2781_PRM_SINEGAIN2_REG:
+			reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1],
+				t->sin_gn[2]);
+			break;
+		default:
+			reg = 0;
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

