Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A202A3294D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2025 15:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE0B60275;
	Wed, 12 Feb 2025 15:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE0B60275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739372239;
	bh=PjVWeF0mZIazOaHmjdO9frZsMIS3glxRj/GsiYqWALk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gk3QUdctAv8DzUQIgUJFbZwYaiwVxhfTgvabb252GL3rGT9JWYwLXIeVc+UcCWGpP
	 MukeZShu/NEkXSWnCKLPJN12B1yANK7r0++HGr7V18Bgzdfdtl7ZmvEAdirWGjp5KM
	 CJOyQQaDGWJkJr0NN1xQEPzdzOCjRnmOIK+xS1vE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AF5DF805BD; Wed, 12 Feb 2025 15:56:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14A57F805B6;
	Wed, 12 Feb 2025 15:56:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0ABFF80553; Wed, 12 Feb 2025 15:56:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BBA7F80134
	for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2025 15:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BBA7F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=n5FOzmne
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CEuAtK3819156
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 08:56:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739372170;
	bh=aTJNkv8Nfy0Dcphe4lAbgiZlIG8otTNJA5hat01z8wI=;
	h=From:To:CC:Subject:Date;
	b=n5FOzmnezjvOPW1w4WoXtDaZhF0ywQDmoun+ukKK7/11oTJ0cj9aYYz9LTHqmyNj1
	 c3kjmO9UQdYW8932QfQ4++sPipaHcz9DM9qIfsYTDCJ2XQ49w/fhAj/0aGA0UeYnDU
	 M1KYdF/R+0K7KWvp02/eMavNPKej07T4fpFd5LUw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CEuARA034925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 08:56:10 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 08:56:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 08:56:08 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.127])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CEu5DH069046;
	Wed, 12 Feb 2025 08:56:06 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>, <tiwai@suse.de>,
        <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1 1/3] ASoC: tas2781: Support dsp firmware Alpha and Beta
 seaies
Date: Wed, 12 Feb 2025 22:55:58 +0800
Message-ID: <20250212145601.1279-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: FJN5KCGEVJNO6VQQBA36W6O2MEWRG7DU
X-Message-ID-Hash: FJN5KCGEVJNO6VQQBA36W6O2MEWRG7DU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJN5KCGEVJNO6VQQBA36W6O2MEWRG7DU/>
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
v1:
 - update the year from 2024 to 2025.
 - Add dspbin_type to distinguish different dspbin types, such as
   TASDEV_BASIC, TASDEV_ALPHA, and TASDEV_BETA.
 - Add struct bulk_reg_val alp_cali_bckp to store the value of pilot
   tone threshold only for TASDEV_ALPHA & TASDEV_BETA firmware.
 - Add the declaration of (*fw_parse_fct_param_address)() to parse
   the addresses of calibration params.
 - Add the minimum version of TASDEV_ALPHA and TASDEV_BETA firmware.
 - Add the definition of struct fct_param_address.
---
 include/sound/tas2781-dsp.h | 26 +++++++++++++++++++++++---
 include/sound/tas2781.h     | 13 ++++++++++++-
 2 files changed, 35 insertions(+), 4 deletions(-)

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
index 0f1e585635bb..f2eda8ac66e8 100644
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
@@ -170,6 +177,7 @@ struct tasdevice_priv {
 	unsigned char dev_name[32];
 	const char *name_prefix;
 	unsigned char ndev;
+	unsigned int dspbin_typ;
 	unsigned int magic_num;
 	unsigned int chip_id;
 	unsigned int sysclk;
@@ -195,6 +203,9 @@ struct tasdevice_priv {
 	int (*fw_parse_configuration_data)(struct tasdevice_priv *tas_priv,
 		struct tasdevice_fw *tas_fmw,
 		const struct firmware *fmw, int offset);
+	int (*fw_parse_fct_param_address)(struct tasdevice_priv *tas_priv,
+		struct tasdevice_fw *tas_fmw,
+		const struct firmware *fmw, int offset);
 	int (*tasdevice_load_block)(struct tasdevice_priv *tas_priv,
 		struct tasdev_blk *block);
 
-- 
2.34.1

