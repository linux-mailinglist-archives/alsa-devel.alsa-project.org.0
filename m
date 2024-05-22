Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8CB8CC049
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 13:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48BE1828;
	Wed, 22 May 2024 13:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48BE1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716377469;
	bh=P3frd8Q489x0F14hHLud6Tlchf7MYW0TrgW00AUBYqc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bJM30yP9AE1t5aEchUyN9ty//029WWf7vfzyF4/5t+ANEtZLllbtma5jlDHRdHRMM
	 EK1Il7XSaQuIIEkgK2FY55Q1CkwFHKHgTHbRhuAfhR4htDO0+FMBfnjMgDKOfG/To5
	 lxGCuKbHvlo851hOJd1hHzQBKmWOnuR8kChM1z+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB3DEF80578; Wed, 22 May 2024 13:30:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB4A3F8042F;
	Wed, 22 May 2024 13:30:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 874BEF8026A; Wed, 22 May 2024 13:30:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3594F80051
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 13:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3594F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=TOvl1DUb
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44MBTu2G101682;
	Wed, 22 May 2024 06:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716377396;
	bh=vgc2nn7/cvEg/PhJTQYuSVrzQeQ/BytvisbtbEKfm9Q=;
	h=From:To:CC:Subject:Date;
	b=TOvl1DUbcxf0zuqtbQZ4Wk15k0k2KSaFoCmqLmnk+QZ1jI9hKDMfbSOUTGcFQAHQR
	 2ePWv+MJc8OC1uhVsuoJkzP99ufgliTc26/yC1MA1AtiKia45sEsvuGMVdhM0b624a
	 4bwPTl6pouOKIbmWW8r4IJNZxiIeEOgwqrIqLUkc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44MBTuqx002002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 06:29:56 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 06:29:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 06:29:56 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44MBTlKd069105;
	Wed, 22 May 2024 06:29:48 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <judyhsiao@google.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <linux-kernel@vger.kernel.org>, <j-chadha@ti.com>,
        <liam.r.girdwood@intel.com>, <bard.liao@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>, <kevin-lu@ti.com>,
        <yuhsuan@google.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <soyer@irl.hu>, <Baojun.Xu@fpt.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoc: tas2781: Add Calibration Kcontrols and tas2563
 digtial gain for Chromebook
Date: Wed, 22 May 2024 19:29:41 +0800
Message-ID: <20240522112942.994-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: TE5QOJW36G2FKKIQ77MNWMNNENER2ASJ
X-Message-ID-Hash: TE5QOJW36G2FKKIQ77MNWMNNENER2ASJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TE5QOJW36G2FKKIQ77MNWMNNENER2ASJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Calibrated data will be set to default after loading DSP config params,
which will cause speaker protection work abnormally. Reload calibrated
data after loading DSP config params.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Changed the copyright year to 2024 in the related files.
 - Add CAL_DAT_SZ for calibrated data size.
 - Add TAS2563_DVC_LVL for digtial gain kcontrol.
 - Add registers for TAS2563 and TAS2781 calibration.
 - Add cali_data_restore for regsiter restore after calibration.
 - Add is_user_space_calidata to store the flag where the calibrated
   from, user space or bin file from driver parsing.
 - Add TASDEVICE_RCA_FW_OK to support only register setting bin in the
   device.
 - Add tas2563_dvc_table for relationship between tas2563 digtial gains
   and register values.
 - Correct the filename in the header comments of tas2781-comlib.c,
   tas2781-lib.c --> tas2781-comlib.c.
 - tasdevice_chn_switch for chip switch among multiple chips(tas2563
   or tas2781)
 - Add loading the calibrated values from user space in
   tasdev_load_calibrated_data
 - Correct no dsp no work, it can still work in bypass mode.
 - Add calibrated register setting for tas2563&tas2781.
 - Add mutex into each kcontrol.
 - rename tas2781_force_fwload_get, tas2781_force_fwload_put-->
   tasdev_force_fwload_get, tasdev_force_fwload_put
 - rename tas2781_codec --> tasdev_codec
 - define tas2781_snd_control and tas2563_snd_control for volume
 - define tas2781_cali_control and tas2563_cali_control for calibration
---
 include/sound/tas2781-dsp.h       |   1 +
 include/sound/tas2781.h           |  92 ++-
 sound/soc/codecs/tas2781-comlib.c |  35 +-
 sound/soc/codecs/tas2781-fmwlib.c |  51 +-
 sound/soc/codecs/tas2781-i2c.c    | 941 +++++++++++++++++++++++++++++-
 5 files changed, 1061 insertions(+), 59 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index 7fba7ea26a4b..74ab6f113029 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -121,6 +121,7 @@ enum tasdevice_dsp_fw_state {
 	TASDEVICE_DSP_FW_NONE = 0,
 	TASDEVICE_DSP_FW_PENDING,
 	TASDEVICE_DSP_FW_FAIL,
+	TASDEVICE_RCA_FW_OK,
 	TASDEVICE_DSP_FW_ALL_OK,
 };
 
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 99ca3e401fd1..2fb3d03d0040 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2563/TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2023 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2563/TAS2781 driver implements a flexible and configurable
@@ -23,6 +23,8 @@
 #define SMARTAMP_MODULE_NAME		"tas2781"
 #define TAS2781_GLOBAL_ADDR	0x40
 #define TAS2563_GLOBAL_ADDR	0x48
+#define CAL_DAT_SZ		20
+
 #define TASDEVICE_RATES			(SNDRV_PCM_RATE_44100 |\
 	SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |\
 	SNDRV_PCM_RATE_88200)
@@ -31,6 +33,11 @@
 	SNDRV_PCM_FMTBIT_S24_LE | \
 	SNDRV_PCM_FMTBIT_S32_LE)
 
+#define TASDEVICE_CMD_SING_W		0x1
+#define TASDEVICE_CMD_BURST		0x2
+#define TASDEVICE_CMD_DELAY		0x3
+#define TASDEVICE_CMD_FIELD_W		0x4
+
 /*PAGE Control Register (available in page0 of each book) */
 #define TASDEVICE_PAGE_SELECT		0x00
 #define TASDEVICE_BOOKCTL_PAGE		0x00
@@ -43,21 +50,73 @@
 					(page * 128)) + reg)
 
 /*Software Reset */
-#define TAS2781_REG_SWRESET		TASDEVICE_REG(0x0, 0X0, 0x01)
-#define TAS2781_REG_SWRESET_RESET	BIT(0)
+#define TASDEVICE_REG_SWRESET		TASDEVICE_REG(0x00, 0X00, 0x01)
+#define TASDEVICE_REG_SWRESET_RESET	BIT(0)
 
 /*I2C Checksum */
-#define TASDEVICE_I2CChecksum		TASDEVICE_REG(0x0, 0x0, 0x7E)
+#define TASDEVICE_I2CChecksum		TASDEVICE_REG(0x00, 0x00, 0x7E)
+
+/* XM_340 */
+#define	TASDEVICE_XM_A1_REG	TASDEVICE_REG(0x64, 0x02, 0x4c)
+/* XM_341 */
+#define	TASDEVICE_XM_A2_REG	TASDEVICE_REG(0x64, 0x02, 0x64)
 
 /* Volume control */
-#define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1A)
-#define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
+#define TAS2563_DVC_LVL			TASDEVICE_REG(0x00, 0x02, 0x0C)
+#define TAS2781_DVC_LVL			TASDEVICE_REG(0x00, 0x00, 0x1A)
+#define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x00, 0x00, 0x03)
 #define TAS2781_AMP_LEVEL_MASK		GENMASK(5, 1)
 
-#define TASDEVICE_CMD_SING_W		0x1
-#define TASDEVICE_CMD_BURST		0x2
-#define TASDEVICE_CMD_DELAY		0x3
-#define TASDEVICE_CMD_FIELD_W		0x4
+#define TAS2563_PRM_R0_REG		TASDEVICE_REG(0x00, 0x0f, 0x34)
+#define TAS2563_PRM_R0_LOW_REG		TASDEVICE_REG(0x00, 0x0f, 0x48)
+#define TAS2563_PRM_INVR0_REG		TASDEVICE_REG(0x00, 0x0f, 0x40)
+#define TAS2563_PRM_POW_REG		TASDEVICE_REG(0x00, 0x0d, 0x3c)
+#define TAS2563_PRM_TLIMIT_REG		TASDEVICE_REG(0x00, 0x10, 0x14)
+
+#define TAS2563_RUNTIME_RE_REG_TF	TASDEVICE_REG(0x64, 0x02, 0x70)
+#define TAS2563_RUNTIME_RE_REG		TASDEVICE_REG(0x64, 0x02, 0x48)
+
+#define TAS2563_PRM_ENFF_REG		TASDEVICE_REG(0x00, 0x0d, 0x54)
+#define TAS2563_PRM_DISTCK_REG		TASDEVICE_REG(0x00, 0x0d, 0x58)
+#define TAS2563_PRM_TE_SCTHR_REG	TASDEVICE_REG(0x00, 0x0f, 0x60)
+#define TAS2563_PRM_PLT_FLAG_REG	TASDEVICE_REG(0x00, 0x0d, 0x74)
+#define TAS2563_PRM_SINEGAIN_REG	TASDEVICE_REG(0x00, 0x0d, 0x7c)
+/* prm_Int_B0 */
+#define TAS2563_TE_TA1_REG		TASDEVICE_REG(0x00, 0x10, 0x0c)
+/* prm_Int_A1 */
+#define TAS2563_TE_TA1_AT_REG		TASDEVICE_REG(0x00, 0x10, 0x10)
+/* prm_TE_Beta */
+#define TAS2563_TE_TA2_REG		TASDEVICE_REG(0x00, 0x0f, 0x64)
+/* prm_TE_Beta1 */
+#define TAS2563_TE_AT_REG		TASDEVICE_REG(0x00, 0x0f, 0x68)
+/* prm_TE_1_Beta1 */
+#define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
+
+#define TAS2781_PRM_R0_REG		TASDEVICE_REG(0x00, 0x17, 0x74)
+#define TAS2781_PRM_R0_LOW_REG		TASDEVICE_REG(0x00, 0x18, 0x0c)
+#define TAS2781_PRM_INVR0_REG		TASDEVICE_REG(0x00, 0x18, 0x14)
+#define TAS2781_PRM_POW_REG		TASDEVICE_REG(0x00, 0x13, 0x70)
+#define TAS2781_PRM_TLIMIT_REG		TASDEVICE_REG(0x00, 0x18, 0x7c)
+
+#define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
+#define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
+#define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
+#define TAS2781_PRM_TEST_57_REG		TASDEVICE_REG(0x00, 0xfd, 0x39)
+#define TAS2781_PRM_TEST_62_REG		TASDEVICE_REG(0x00, 0xfd, 0x3e)
+#define TAS2781_PRM_PVDD_UVLO_REG	TASDEVICE_REG(0x00, 0x00, 0x71)
+#define TAS2781_PRM_CHNL_0_REG		TASDEVICE_REG(0x00, 0x00, 0x03)
+#define TAS2781_PRM_NG_CFG0_REG		TASDEVICE_REG(0x00, 0x00, 0x35)
+#define TAS2781_PRM_IDLE_CH_DET_REG	TASDEVICE_REG(0x00, 0x00, 0x66)
+#define TAS2781_PRM_PLT_FLAG_REG	TASDEVICE_REG(0x00, 0x14, 0x38)
+#define TAS2781_PRM_SINEGAIN_REG	TASDEVICE_REG(0x00, 0x14, 0x40)
+#define TAS2781_PRM_SINEGAIN2_REG	TASDEVICE_REG(0x00, 0x14, 0x44)
+
+#define TAS2781_TEST_UNLOCK_REG		TASDEVICE_REG(0x00, 0xFD, 0x0D)
+#define TAS2781_TEST_PAGE_UNLOCK	0x0D
+
+#define TAS2781_RUNTIME_LATCH_RE_REG	TASDEVICE_REG(0x00, 0x00, 0x49)
+#define TAS2781_RUNTIME_RE_REG_TF	TASDEVICE_REG(0x64, 0x62, 0x48)
+#define TAS2781_RUNTIME_RE_REG		TASDEVICE_REG(0x64, 0x63, 0x44)
 
 enum audio_device {
 	TAS2563,
@@ -69,7 +128,15 @@ enum device_catlog_id {
 	OTHERS
 };
 
+struct bulk_reg_val {
+	int reg;
+	unsigned char val[4];
+	unsigned char val_len;
+	bool is_locked;
+};
+
 struct tasdevice {
+	struct bulk_reg_val *cali_data_restore;
 	struct tasdevice_fw *cali_data_fmw;
 	unsigned int dev_addr;
 	unsigned int err_code;
@@ -88,6 +155,8 @@ struct tasdevice_irqinfo {
 struct calidata {
 	unsigned char *data;
 	unsigned long total_sz;
+	unsigned int *reg_array;
+	unsigned int reg_array_sz;
 };
 
 struct tasdevice_priv {
@@ -122,6 +191,7 @@ struct tasdevice_priv {
 	bool force_fwload_status;
 	bool playback_started;
 	bool isacpi;
+	bool is_user_space_calidata;
 	unsigned int global_addr;
 
 	int (*fw_parse_variable_header)(struct tasdevice_priv *tas_priv,
@@ -148,6 +218,8 @@ int tasdevice_init(struct tasdevice_priv *tas_priv);
 void tasdevice_remove(struct tasdevice_priv *tas_priv);
 int tasdevice_save_calibration(struct tasdevice_priv *tas_priv);
 void tasdevice_apply_calibration(struct tasdevice_priv *tas_priv);
+int tasdevice_chn_switch(struct tasdevice_priv *tas_priv,
+	unsigned short chn);
 int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 	unsigned short chn, unsigned int reg, unsigned int *value);
 int tasdevice_dev_write(struct tasdevice_priv *tas_priv,
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 3aa81514dad7..9d7b56663b6b 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// tas2781-lib.c -- TAS2781 Common functions for HDA and ASoC Audio drivers
+// tas2781-comlib.c -- TAS2781 Common functions for HDA and ASoC Audio drivers
 //
-// Copyright 2023 Texas Instruments, Inc.
+// Copyright 2023 - 2024 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
@@ -89,6 +89,33 @@ static int tasdevice_change_chn_book(struct tasdevice_priv *tas_priv,
 	return ret;
 }
 
+int tasdevice_chn_switch(struct tasdevice_priv *tas_priv,
+	unsigned short chn)
+{
+	struct i2c_client *client = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = &tas_priv->tasdevice[chn];
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	if (client->addr != tasdev->dev_addr) {
+		client->addr = tasdev->dev_addr;
+		/* All devices share the same regmap, clear the page
+		 * inside regmap once switching to another device.
+		 * Register 0 at any pages and any books inside tas2781
+		 * is the same one for page-switching.
+		 */
+		ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
+		if (ret < 0) {
+			dev_err(tas_priv->dev, "%s, E=%d\n",
+				__func__, ret);
+			return ret;
+		}
+		return 1;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tasdevice_chn_switch);
+
 int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 	unsigned short chn, unsigned int reg, unsigned int *val)
 {
@@ -254,8 +281,8 @@ void tas2781_reset(struct tasdevice_priv *tas_dev)
 	} else {
 		for (i = 0; i < tas_dev->ndev; i++) {
 			ret = tasdevice_dev_write(tas_dev, i,
-				TAS2781_REG_SWRESET,
-				TAS2781_REG_SWRESET_RESET);
+				TASDEVICE_REG_SWRESET,
+				TASDEVICE_REG_SWRESET_RESET);
 			if (ret < 0)
 				dev_err(tas_dev->dev,
 					"dev %d swreset fail, %d\n",
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 265a8ca25cbb..19a5133083dc 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2153,20 +2153,39 @@ static int tasdevice_load_data(struct tasdevice_priv *tas_priv,
 
 static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
 {
+	struct tasdevice_fw *cal_fmw = priv->tasdevice[i].cali_data_fmw;
+	struct calidata *cali_data = &priv->cali_data;
+	unsigned char *data = cali_data->data;
 	struct tasdevice_calibration *cal;
-	struct tasdevice_fw *cal_fmw;
+	int k = i * (CAL_DAT_SZ + 1);
+	int j, rc;
 
-	cal_fmw = priv->tasdevice[i].cali_data_fmw;
+	if (!priv->is_user_space_calidata &&
+		cal_fmw) {
+		cal = cal_fmw->calibrations;
 
-	/* No calibrated data for current devices, playback will go ahead. */
-	if (!cal_fmw)
+		if (cal)
+			load_calib_data(priv, &cal->dev_data);
 		return;
-
-	cal = cal_fmw->calibrations;
-	if (cal)
+	}
+	if (!priv->is_user_space_calidata)
 		return;
-
-	load_calib_data(priv, &cal->dev_data);
+	/* load calibrated data from user space */
+	if (data[k] != i) {
+		dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
+			__func__, i);
+		return;
+	}
+	for (j = 0; j < cali_data->reg_array_sz; j++) {
+		if (data[k] != j)
+			rc = tasdevice_dev_bulk_write(priv, i,
+				cali_data->reg_array[j],
+				&(data[k + 4 * j]), 4);
+		if (rc < 0)
+			dev_err(priv->dev,
+				"chn %d calib %d bulk_wr err = %d\n",
+				i, j, rc);
+	}
 }
 
 int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
@@ -2261,9 +2280,10 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 				tas_priv->tasdevice[i].cur_conf = cfg_no;
 			}
 		}
-	} else
+	} else {
 		dev_dbg(tas_priv->dev, "%s: Unneeded loading dsp conf %d\n",
 			__func__, cfg_no);
+	}
 
 	status |= cfg_info[rca_conf_no]->active_dev;
 
@@ -2324,13 +2344,15 @@ void tasdevice_tuning_switch(void *context, int state)
 	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
 	int profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
 
-	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
-		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
+	/* Only RCA file loaded still can work without speaker protection */
+	if (!(tas_priv->fw_state == TASDEVICE_RCA_FW_OK ||
+		tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)) {
+		dev_err(tas_priv->dev, "No firmware loaded\n");
 		return;
 	}
 
 	if (state == 0) {
-		if (tas_priv->cur_prog < tas_fmw->nr_programs) {
+		if (tas_fmw && tas_priv->cur_prog < tas_fmw->nr_programs) {
 			/*dsp mode or tuning mode*/
 			profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
 			tasdevice_select_tuningprm_cfg(tas_priv,
@@ -2340,9 +2362,10 @@ void tasdevice_tuning_switch(void *context, int state)
 
 		tasdevice_select_cfg_blk(tas_priv, profile_cfg_id,
 			TASDEVICE_BIN_BLK_PRE_POWER_UP);
-	} else
+	} else {
 		tasdevice_select_cfg_blk(tas_priv, profile_cfg_id,
 			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
+	}
 }
 EXPORT_SYMBOL_NS_GPL(tasdevice_tuning_switch,
 	SND_SOC_TAS2781_FMWLIB);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9350972dfefe..239f3538c558 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -13,6 +13,7 @@
 // Author: Kevin Lu <kevin-lu@ti.com>
 //
 
+#include <asm/unaligned.h>
 #include <linux/crc8.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -31,6 +32,122 @@
 #include <sound/tlv.h>
 #include <sound/tas2781-tlv.h>
 
+static const struct bulk_reg_val tas2563_cali_start_reg[] = {
+	{
+		.reg = TAS2563_PRM_ENFF_REG,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_DISTCK_REG,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_TE_SCTHR_REG,
+		.val = { 0x7f, 0xff, 0xff, 0xff },
+	},
+	{
+		.reg = TAS2563_PRM_PLT_FLAG_REG,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_SINEGAIN_REG,
+		.val = { 0x0a, 0x3d, 0x70, 0xa4 },
+	},
+	{
+		.reg = TAS2563_TE_TA1_REG,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_TA1_AT_REG,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_TA2_REG,
+		.val = { 0x00, 0x06, 0xd3, 0x72 },
+	},
+	{
+		.reg = TAS2563_TE_AT_REG,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_DT_REG,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+};
+
+static const struct bulk_reg_val tas2781_cali_start_reg[] = {
+	{
+		.reg = TAS2781_PRM_INT_MASK_REG,
+		.val = { 0xfe },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_CLK_CFG_REG,
+		.val = { 0xdd },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_RSVD_REG,
+		.val = { 0x20 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_TEST_57_REG,
+		.val = { 0x14 },
+		.val_len = 1,
+		.is_locked = true
+	},
+	{
+		.reg = TAS2781_PRM_TEST_62_REG,
+		.val = { 0x45 },
+		.val_len = 1,
+		.is_locked = true
+	},
+	{
+		.reg = TAS2781_PRM_PVDD_UVLO_REG,
+		.val = { 0x03 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_CHNL_0_REG,
+		.val = { 0xA8 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_NG_CFG0_REG,
+		.val = { 0xb9 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_IDLE_CH_DET_REG,
+		.val = { 0x92 },
+		.val_len = 1,
+		.is_locked = false
+	},
+	{
+		.reg	= TAS2781_PRM_PLT_FLAG_REG,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+		.val_len = 4,
+		.is_locked = false
+	},
+	{
+		.reg	= TAS2781_PRM_SINEGAIN_REG,
+		.val_len = 4,
+		.is_locked = false
+	},
+	{
+		.reg	= TAS2781_PRM_SINEGAIN2_REG,
+		.val_len = 4,
+		.is_locked = false
+	},
+};
+
 static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas2563", TAS2563 },
 	{ "tas2781", TAS2781 },
@@ -47,6 +164,22 @@ static const struct of_device_id tasdevice_of_match[] = {
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
 #endif
 
+static const int tas2563_cali_data_reg[] = {
+	TAS2563_PRM_R0_REG,
+	TAS2563_PRM_R0_LOW_REG,
+	TAS2563_PRM_INVR0_REG,
+	TAS2563_PRM_POW_REG,
+	TAS2563_PRM_TLIMIT_REG,
+};
+
+static const int tas2781_cali_data_reg[] = {
+	TAS2781_PRM_R0_REG,
+	TAS2781_PRM_R0_LOW_REG,
+	TAS2781_PRM_INVR0_REG,
+	TAS2781_PRM_POW_REG,
+	TAS2781_PRM_TLIMIT_REG,
+};
+
 /**
  * tas2781_digital_getvol - get the volum control
  * @kcontrol: control pointer
@@ -65,8 +198,13 @@ static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int rc;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_digital_getvol(tas_priv, ucontrol, mc);
+	mutex_unlock(&tas_priv->codec_lock);
 
-	return tasdevice_digital_getvol(tas_priv, ucontrol, mc);
+	return rc;
 }
 
 static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
@@ -76,8 +214,13 @@ static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int rc;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_digital_putvol(tas_priv, ucontrol, mc);
+	mutex_unlock(&tas_priv->codec_lock);
 
-	return tasdevice_digital_putvol(tas_priv, ucontrol, mc);
+	return rc;
 }
 
 static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
@@ -87,8 +230,13 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int rc;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_amp_getvol(tas_priv, ucontrol, mc);
+	mutex_unlock(&tas_priv->codec_lock);
 
-	return tasdevice_amp_getvol(tas_priv, ucontrol, mc);
+	return rc;
 }
 
 static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
@@ -99,11 +247,16 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 		snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int rc;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_amp_putvol(tas_priv, ucontrol, mc);
+	mutex_unlock(&tas_priv->codec_lock);
 
-	return tasdevice_amp_putvol(tas_priv, ucontrol, mc);
+	return rc;
 }
 
-static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
+static int tasdev_force_fwload_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
@@ -118,7 +271,7 @@ static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
+static int tasdev_force_fwload_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
@@ -127,18 +280,496 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 		snd_soc_component_get_drvdata(component);
 	bool change, val = (bool)ucontrol->value.integer.value[0];
 
+	mutex_lock(&tas_priv->codec_lock);
 	if (tas_priv->force_fwload_status == val)
 		change = false;
 	else {
 		change = true;
 		tas_priv->force_fwload_status = val;
 	}
+	mutex_unlock(&tas_priv->codec_lock);
 	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
 		tas_priv->force_fwload_status ? "ON" : "OFF");
 
 	return change;
 }
 
+static int tasdev_cali_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned char *data = tas_priv->cali_data.data;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (!tas_priv->is_user_space_calidata ||
+		tas_priv->cali_data.total_sz != bytes_ext->max) {
+		goto out;
+	}
+	memcpy(dst, data, bytes_ext->max);
+out:
+	mutex_unlock(&tas_priv->codec_lock);
+	return 0;
+}
+
+static int calib_data_get(struct tasdevice_priv *tas_priv, int reg,
+	unsigned char *dst, int data_len)
+{
+	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	int rc = -1;
+	int i;
+
+	if (data_len != 4)
+		return rc;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		if (clt->addr == tasdev[i].dev_addr) {
+			/* First byte is the device index. */
+			dst[0] = i;
+			tasdevice_dev_bulk_read(tas_priv, i, reg, &dst[1],
+				4);
+			rc = 0;
+			break;
+		}
+	}
+
+	return rc;
+}
+
+static int tas2781_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
+	unsigned char *dat = ucontrol->value.bytes.data;
+	int rc = 1;
+	int i, j;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (tas_priv->chip_id != TAS2781 &&
+		bytes_ext->max != 8 * tas_priv->ndev) {
+		rc = -1;
+		goto out;
+	}
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_restore;
+		int k = i * 9;
+
+		if (p == NULL)
+			continue;
+
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1) {
+				if (p[j].is_locked)
+					tasdevice_dev_write(tas_priv, i,
+						TAS2781_TEST_UNLOCK_REG,
+						TAS2781_TEST_PAGE_UNLOCK);
+				tasdevice_dev_read(tas_priv, i, p[j].reg,
+					(int *)&p[j].val[0]);
+			} else
+				tasdevice_dev_bulk_read(tas_priv, i, p[j].reg,
+					p[j].val, 4);
+		}
+
+		for (j = 0; j < sum - 2; j++) {
+			if (p[j].val_len == 1) {
+				if (p[j].is_locked)
+					tasdevice_dev_write(tas_priv, i,
+						TAS2781_TEST_UNLOCK_REG,
+						TAS2781_TEST_PAGE_UNLOCK);
+				tasdevice_dev_write(tas_priv, i, p[j].reg,
+					tas2781_cali_start_reg[j].val[0]);
+			} else
+				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+					(unsigned char *)
+					tas2781_cali_start_reg[j].val, 4);
+		}
+
+		if (dat[k] != i) {
+			dev_err(tas_priv->dev,
+				"%s: no cal-setting for dev %d\n", __func__,
+				i);
+			continue;
+		}
+		tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+			&dat[i * 9 + 1], 4);
+		tasdevice_dev_bulk_write(tas_priv, i, p[j + 1].reg,
+			&dat[i * 9 + 5], 4);
+	}
+out:
+	mutex_unlock(&tas_priv->codec_lock);
+	return rc;
+}
+
+static void tas2781_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
+	int i, j;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_restore;
+
+		if (p == NULL)
+			continue;
+
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1) {
+				if (p[j].is_locked)
+					tasdevice_dev_write(tas_priv, i,
+						TAS2781_TEST_UNLOCK_REG,
+						TAS2781_TEST_PAGE_UNLOCK);
+				tasdevice_dev_write(tas_priv, i, p[j].reg,
+					p[j].val[0]);
+			} else
+				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+					p[j].val, 4);
+		}
+	}
+}
+
+static int tas2563_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	const int sum = ARRAY_SIZE(tas2563_cali_start_reg);
+	int rc = 1;
+	int i, j;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (tas_priv->chip_id != TAS2563) {
+		rc = -1;
+		goto out;
+	}
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_restore;
+
+		if (p == NULL)
+			continue;
+		for (j = 0; j < sum; j++) {
+			tasdevice_dev_bulk_read(tas_priv, i, p[j].reg,
+				p[j].val, 4);
+		}
+
+		for (j = 0; j < sum; j++) {
+			tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+				(unsigned char *)tas2563_cali_start_reg[j].val,
+				4);
+		}
+	}
+out:
+	mutex_unlock(&tas_priv->codec_lock);
+	return rc;
+}
+
+static void tas2563_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	const int sum = ARRAY_SIZE(tas2563_cali_start_reg);
+	int i, j;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_restore;
+
+		if (p == NULL)
+			continue;
+
+		for (j = 0; j < sum; j++) {
+			tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+				p[j].val, 4);
+		}
+	}
+}
+
+static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (tas_priv->chip_id == TAS2563)
+		tas2563_calib_stop_put(tas_priv);
+	else
+		tas2781_calib_stop_put(tas_priv);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return 1;
+}
+
+static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *data = tas_priv->cali_data.data;
+	int rc = 1;
+
+	mutex_lock(&tas_priv->codec_lock);
+	if (tas_priv->cali_data.total_sz != bytes_ext->max) {
+		rc = -1;
+		goto out;
+	}
+	tas_priv->is_user_space_calidata = true;
+	memcpy(data, ucontrol->value.bytes.data, bytes_ext->max);
+out:
+	mutex_unlock(&tas_priv->codec_lock);
+	return rc;
+}
+
+static int tas2781_latch_reg_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	int i, val, rc = -1;
+
+	mutex_lock(&tas_priv->codec_lock);
+	for (i = 0; i < tas_priv->ndev; i++) {
+		if (clt->addr == tasdev[i].dev_addr) {
+			/* First byte is the device index. */
+			dst[0] = i;
+			tasdevice_dev_read(tas_priv, i,
+				TAS2781_RUNTIME_LATCH_RE_REG, &val);
+			dst[1] = val;
+			rc = 0;
+			break;
+		}
+	}
+	mutex_unlock(&tas_priv->codec_lock);
+	return rc;
+}
+
+static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg;
+	int rc = -1;
+
+	if (tas_priv->chip_id == TAS2781)
+		reg = TAS2781_RUNTIME_RE_REG_TF;
+	else
+		reg = TAS2563_RUNTIME_RE_REG_TF;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg;
+	int rc = -1;
+
+	if (tas_priv->chip_id == TAS2781)
+		reg = TAS2781_RUNTIME_RE_REG;
+	else
+		reg = TAS2563_RUNTIME_RE_REG;
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_r0_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg;
+	int rc = -1;
+
+	if (tas_priv->chip_id == TAS2781)
+		reg = TAS2781_PRM_R0_REG;
+	else
+		reg = TAS2563_PRM_R0_REG;
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg = TASDEVICE_XM_A1_REG;
+	int rc = -1;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_XMA2_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg = TASDEVICE_XM_A2_REG;
+	int rc = -1;
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = calib_data_get(tas_priv, reg, dst, bytes_ext->max - 1);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdev_nop_get(
+	struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	return 0;
+}
+
+static int tas2563_digital_gain_get(
+	struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
+	unsigned int l = 0, r = mc->max;
+	unsigned int target, ar_mid, mid, ar_l, ar_r;
+	unsigned int reg = mc->reg;
+	unsigned char data[4];
+	int ret;
+
+	mutex_lock(&tas_dev->codec_lock);
+	/* Read the primary device */
+	ret =  tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
+	if (ret) {
+		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
+		goto out;
+	}
+
+	target = get_unaligned_be32(&data[0]);
+
+	while (r > 1 + l) {
+		mid = (l + r) / 2;
+		ar_mid = get_unaligned_be32(tas2563_dvc_table[mid]);
+		if (target < ar_mid)
+			r = mid;
+		else
+			l = mid;
+	}
+
+	ar_l = get_unaligned_be32(tas2563_dvc_table[l]);
+	ar_r = get_unaligned_be32(tas2563_dvc_table[r]);
+
+	ucontrol->value.integer.value[0] =
+		abs(target - ar_l) <= abs(target - ar_r) ? l : r;
+out:
+	mutex_unlock(&tas_dev->codec_lock);
+	return 0;
+}
+
+static int tas2563_digital_gain_put(
+	struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
+	unsigned int reg = mc->reg;
+	unsigned int volrd, volwr;
+	int vol = ucontrol->value.integer.value[0];
+	int max = mc->max, i, ret = 1;
+	unsigned char data[4];
+
+	vol = clamp(vol, 0, max);
+	mutex_lock(&tas_dev->codec_lock);
+	/* Read the primary device */
+	ret =  tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
+	if (ret) {
+		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
+		goto out;
+	}
+
+	volrd = get_unaligned_be32(&data[0]);
+	volwr = get_unaligned_be32(tas2563_dvc_table[vol]);
+
+	if (volrd == volwr) {
+		ret = 0;
+		goto out;
+	}
+
+	for (i = 0; i < tas_dev->ndev; i++) {
+		ret = tasdevice_dev_bulk_write(tas_dev, i, reg,
+			(unsigned char *)tas2563_dvc_table[vol], 4);
+		if (ret)
+			dev_err(tas_dev->dev,
+				"%s, set digital vol error in device %d\n",
+				__func__, i);
+	}
+
+out:
+	mutex_unlock(&tas_dev->codec_lock);
+	return ret;
+}
+
+static const struct snd_kcontrol_new tasdevice_snd_controls[] = {
+	SOC_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
+		tasdev_force_fwload_get, tasdev_force_fwload_put),
+};
+
+static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Stop", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tasdev_calib_stop_put),
+	SND_SOC_BYTES_EXT("Amp TF Data", 5, tasdev_tf_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp RE Data", 5, tasdev_re_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp R0 Data", 5, tasdev_r0_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp XMA1 Data", 5, tasdev_XMA1_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp XMA2 Data", 5, tasdev_XMA2_data_get, NULL),
+};
+
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
@@ -146,8 +777,22 @@ static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2781_DVC_LVL,
 		0, 0, 200, 1, tas2781_digital_getvol,
 		tas2781_digital_putvol, dvc_tlv),
-	SOC_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
-		tas2781_force_fwload_get, tas2781_force_fwload_put),
+};
+
+static const struct snd_kcontrol_new tas2781_cali_controls[] = {
+	SND_SOC_BYTES_EXT("Amp Latch Data", 2, tas2781_latch_reg_get, NULL),
+};
+
+static const struct snd_kcontrol_new tas2563_snd_controls[] = {
+	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2563_DVC_LVL, 0,
+		0, ARRAY_SIZE(tas2563_dvc_table) - 1, 0,
+		tas2563_digital_gain_get, tas2563_digital_gain_put,
+		tas2563_dvc_tlv),
+};
+
+static const struct snd_kcontrol_new tas2563_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Start", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tas2563_calib_start_put),
 };
 
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
@@ -167,6 +812,31 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
+static int tasdevice_info_active_id(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = (int)tas_priv->ndev - 1;
+
+	return 0;
+}
+
+static int tasdevice_info_chip_id(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = TAS2563;
+	uinfo->value.integer.max = TAS2781;
+
+	return 0;
+}
+
 static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_info *uinfo)
 {
@@ -223,6 +893,17 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int tasdevice_get_chip_id(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = tas_priv->chip_id;
+
+	return 0;
+}
+
 static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 {
 	struct snd_kcontrol_new *prof_ctrls;
@@ -316,15 +997,54 @@ static int tasdevice_configuration_put(
 	return ret;
 }
 
-static int tasdevice_dsp_create_ctrls(
-	struct tasdevice_priv *tas_priv)
+static int tasdevice_active_id_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	int i;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		if (clt->addr == tasdev[i].dev_addr) {
+			ucontrol->value.integer.value[0] = i;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+static int tasdevice_active_id_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	int nr_dev = ucontrol->value.integer.value[0];
+	int max = tas_priv->ndev - 1, rc;
+
+	nr_dev = clamp(nr_dev, 0, max);
+
+	mutex_lock(&tas_priv->codec_lock);
+	rc = tasdevice_chn_switch(tas_priv, nr_dev);
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return rc;
+}
+
+static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 {
+	char *active_dev_name, *cali_name, *chip_id, *conf_name, *prog_name;
+	struct calidata *cali_data = &tas_priv->cali_data;
 	struct snd_kcontrol_new *dsp_ctrls;
-	char *prog_name, *conf_name;
-	int nr_controls = 2;
+	struct soc_bytes_ext *ext_cali_data;
+	int nr_controls = 5;
 	int mix_index = 0;
 	int ret;
 
+	if (tas_priv->chip_id == TAS2781)
+		nr_controls++;
 	/* Alloc kcontrol via devm_kzalloc, which don't manually
 	 * free the kcontrol
 	 */
@@ -336,11 +1056,20 @@ static int tasdevice_dsp_create_ctrls(
 	}
 
 	/* Create a mixer item for selecting the active profile */
-	prog_name = devm_kzalloc(tas_priv->dev,
+	active_dev_name = devm_kzalloc(tas_priv->dev,
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN, GFP_KERNEL);
+	cali_name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		GFP_KERNEL);
+	chip_id = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		GFP_KERNEL);
+	conf_name = devm_kzalloc(tas_priv->dev,
 		SNDRV_CTL_ELEM_ID_NAME_MAXLEN, GFP_KERNEL);
-	conf_name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+	prog_name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 		GFP_KERNEL);
-	if (!prog_name || !conf_name) {
+	ext_cali_data = devm_kzalloc(tas_priv->dev, sizeof(*ext_cali_data),
+		GFP_KERNEL);
+	if (!active_dev_name || !cali_name || !conf_name || !chip_id ||
+		!ext_cali_data || !prog_name) {
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -363,6 +1092,68 @@ static int tasdevice_dsp_create_ctrls(
 	dsp_ctrls[mix_index].put = tasdevice_configuration_put;
 	mix_index++;
 
+	scnprintf(active_dev_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		"Activate Tasdevice Id");
+	dsp_ctrls[mix_index].name = active_dev_name;
+	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	dsp_ctrls[mix_index].info = tasdevice_info_active_id;
+	dsp_ctrls[mix_index].get = tasdevice_active_id_get;
+	dsp_ctrls[mix_index].put = tasdevice_active_id_put;
+	mix_index++;
+
+	scnprintf(chip_id, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		"Tasdevice Chip Id");
+	dsp_ctrls[mix_index].name = chip_id;
+	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	dsp_ctrls[mix_index].info = tasdevice_info_chip_id;
+	dsp_ctrls[mix_index].get = tasdevice_get_chip_id;
+	mix_index++;
+
+	scnprintf(cali_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		"Speaker Calibrated Data");
+	ext_cali_data->max = tas_priv->ndev * CAL_DAT_SZ;
+	tas_priv->cali_data.total_sz = ext_cali_data->max;
+	tas_priv->cali_data.data = devm_kzalloc(tas_priv->dev,
+		ext_cali_data->max, GFP_KERNEL);
+	dsp_ctrls[mix_index].name = cali_name;
+	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	dsp_ctrls[mix_index].info = snd_soc_bytes_info_ext;
+	dsp_ctrls[mix_index].get = tasdev_cali_data_get;
+	dsp_ctrls[mix_index].put = tasdev_cali_data_put;
+	dsp_ctrls[mix_index].private_value = (unsigned long)ext_cali_data;
+	mix_index++;
+
+	cali_data->data = devm_kzalloc(tas_priv->dev, tas_priv->ndev *
+		(cali_data->reg_array_sz * 4 + 1), GFP_KERNEL);
+	if (!cali_data->data)
+		return -ENOMEM;
+
+	if (tas_priv->chip_id == TAS2781) {
+		struct soc_bytes_ext *ext_cali_start;
+		char *cali_start_name;
+
+		cali_start_name = devm_kzalloc(tas_priv->dev,
+			SNDRV_CTL_ELEM_ID_NAME_MAXLEN, GFP_KERNEL);
+		ext_cali_start = devm_kzalloc(tas_priv->dev,
+			sizeof(*ext_cali_start), GFP_KERNEL);
+		if (!cali_start_name || !ext_cali_start) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		scnprintf(cali_start_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+			"Calibration Start");
+		ext_cali_data->max = tas_priv->ndev * 9;
+		dsp_ctrls[mix_index].name = cali_start_name;
+		dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+		dsp_ctrls[mix_index].info = snd_soc_bytes_info_ext;
+		dsp_ctrls[mix_index].put = tas2781_calib_start_put;
+		dsp_ctrls[mix_index].get = tasdev_nop_get;
+		dsp_ctrls[mix_index].private_value =
+			(unsigned long)ext_cali_start;
+		mix_index++;
+	}
+
 	ret = snd_soc_add_component_controls(tas_priv->codec, dsp_ctrls,
 		nr_controls < mix_index ? nr_controls : mix_index);
 
@@ -370,6 +1161,54 @@ static int tasdevice_dsp_create_ctrls(
 	return ret;
 }
 
+static int tasdevice_create_cali_ctrls(struct tasdevice_priv *tas_priv)
+{
+	struct calidata *cali_data = &tas_priv->cali_data;
+	struct snd_kcontrol_new *cali_ctrls;
+	unsigned int num_controls;
+	int rc;
+
+	rc = snd_soc_add_component_controls(tas_priv->codec,
+		tasdevice_cali_controls, ARRAY_SIZE(tasdevice_cali_controls));
+	if (rc < 0) {
+		dev_err(tas_priv->dev, "%s: Add cali control err rc = %d",
+			__func__, rc);
+		return rc;
+	}
+
+	if (tas_priv->chip_id == TAS2781) {
+		cali_ctrls = (struct snd_kcontrol_new *)tas2781_cali_controls;
+		num_controls = ARRAY_SIZE(tas2781_cali_controls);
+		cali_data->reg_array = (unsigned int *)tas2781_cali_data_reg;
+		cali_data->reg_array_sz = ARRAY_SIZE(tas2781_cali_data_reg);
+	} else {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		int i;
+
+		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
+		num_controls = ARRAY_SIZE(tas2563_cali_controls);
+		cali_data->reg_array = (unsigned int *)tas2563_cali_data_reg;
+		cali_data->reg_array_sz = sizeof(tas2563_cali_data_reg);
+		for (i = 0; i < tas_priv->ndev; i++) {
+			tasdev[i].cali_data_restore =
+				kmemdup(tas2563_cali_start_reg,
+				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_restore)
+				return -ENOMEM;
+		}
+	}
+
+	rc = snd_soc_add_component_controls(tas_priv->codec, cali_ctrls,
+		num_controls);
+	if (rc < 0) {
+		dev_err(tas_priv->dev, "%s: Add control err rc = %d",
+			__func__, rc);
+		return rc;
+	}
+
+	return rc;
+}
+
 static void tasdevice_fw_ready(const struct firmware *fmw,
 	void *context)
 {
@@ -380,23 +1219,36 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	mutex_lock(&tas_priv->codec_lock);
 
 	ret = tasdevice_rca_parser(tas_priv, fmw);
-	if (ret)
+	if (ret) {
+		tasdevice_config_info_remove(tas_priv);
 		goto out;
+	}
 	tasdevice_create_control(tas_priv);
 
 	tasdevice_dsp_remove(tas_priv);
 	tasdevice_calbin_remove(tas_priv);
-	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
+	tas_priv->fw_state = TASDEVICE_RCA_FW_OK;
 	scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
 		tas_priv->dev_name);
+
 	ret = tasdevice_dsp_parser(tas_priv);
 	if (ret) {
 		dev_err(tas_priv->dev, "dspfw load %s error\n",
 			tas_priv->coef_binaryname);
-		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
 		goto out;
 	}
-	tasdevice_dsp_create_ctrls(tas_priv);
+
+	ret = tasdevice_dsp_create_ctrls(tas_priv);
+	if (ret) {
+		dev_err(tas_priv->dev, "dsp controls error\n");
+		goto out;
+	}
+
+	ret = tasdevice_create_cali_ctrls(tas_priv);
+	if (ret) {
+		dev_err(tas_priv->dev, "cali controls error\n");
+		goto out;
+	}
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
@@ -417,9 +1269,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	tasdevice_prmg_load(tas_priv, 0);
 	tas_priv->cur_prog = 0;
 out:
-	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
-		/*If DSP FW fail, kcontrol won't be created */
-		tasdevice_config_info_remove(tas_priv);
+	if (tas_priv->fw_state == TASDEVICE_RCA_FW_OK) {
+		/*If DSP FW fail, DSP kcontrol won't be created */
 		tasdevice_dsp_remove(tas_priv);
 	}
 	mutex_unlock(&tas_priv->codec_lock);
@@ -466,14 +1317,14 @@ static int tasdevice_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *codec = dai->component;
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
-	int ret = 0;
 
-	if (tas_priv->fw_state != TASDEVICE_DSP_FW_ALL_OK) {
-		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
-		ret = -EINVAL;
+	if (!(tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK ||
+		tas_priv->fw_state == TASDEVICE_RCA_FW_OK)) {
+		dev_err(tas_priv->dev, "Bin file not loaded\n");
+		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int tasdevice_hw_params(struct snd_pcm_substream *substream,
@@ -541,7 +1392,7 @@ static const struct snd_soc_dai_ops tasdevice_dai_ops = {
 
 static struct snd_soc_dai_driver tasdevice_dai_driver[] = {
 	{
-		.name = "tas2781_codec",
+		.name = "tasdev_codec",
 		.id = 0,
 		.playback = {
 			.stream_name = "Playback",
@@ -565,13 +1416,41 @@ static struct snd_soc_dai_driver tasdevice_dai_driver[] = {
 static int tasdevice_codec_probe(struct snd_soc_component *codec)
 {
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	int rc;
+
+	if (tas_priv->chip_id == TAS2781) {
+		rc = snd_soc_add_component_controls(codec,
+			tas2781_snd_controls,
+			ARRAY_SIZE(tas2781_snd_controls));
+		if (rc < 0) {
+			dev_err(tas_priv->dev, "%s: Add control err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+	} else {
+		rc = snd_soc_add_component_controls(codec,
+			tas2563_snd_controls,
+			ARRAY_SIZE(tas2563_snd_controls));
+		if (rc < 0) {
+			dev_err(tas_priv->dev, "%s: Add control err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+	}
+
+	rc = tascodec_init(tas_priv, codec, THIS_MODULE, tasdevice_fw_ready);
 
-	return tascodec_init(tas_priv, codec, THIS_MODULE, tasdevice_fw_ready);
+	return rc;
 }
 
 static void tasdevice_deinit(void *context)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	int i;
+
+	for (i = 0; i < tas_priv->ndev; i++)
+		kfree(tasdev[i].cali_data_restore);
 
 	tasdevice_config_info_remove(tas_priv);
 	tasdevice_dsp_remove(tas_priv);
@@ -591,8 +1470,8 @@ static const struct snd_soc_component_driver
 	soc_codec_driver_tasdevice = {
 	.probe			= tasdevice_codec_probe,
 	.remove			= tasdevice_codec_remove,
-	.controls		= tas2781_snd_controls,
-	.num_controls		= ARRAY_SIZE(tas2781_snd_controls),
+	.controls		= tasdevice_snd_controls,
+	.num_controls		= ARRAY_SIZE(tasdevice_snd_controls),
 	.dapm_widgets		= tasdevice_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(tasdevice_dapm_widgets),
 	.dapm_routes		= tasdevice_audio_map,
-- 
2.34.1

