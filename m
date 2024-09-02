Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3F967F47
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2024 08:21:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F2485D;
	Mon,  2 Sep 2024 08:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F2485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725258099;
	bh=cbBrlr3tWYxf94Zb/E71RlOmpuPcAi3Tj/ZVgHdaK+4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q+9O944mWwIf3AalFi3j+Av4Qeerw0ziiPmocZd0gE1EpCzmEOnwB9pxA65Zzaw0x
	 6+8KoxtWGy2qf9W9eaFRCwNB0cdS3Klm1wiGRd9NIxzGw73CC3sIDKnUSFc0XZug1E
	 sNAom54/8MKve9JXw8bHS6l73dCTjtiRPVQzEQbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F9D4F805BB; Mon,  2 Sep 2024 08:21:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB57BF805A8;
	Mon,  2 Sep 2024 08:21:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68DD5F80217; Mon,  2 Sep 2024 08:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7E5DF80152
	for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2024 08:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E5DF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=qf1gxAl0
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4826Kk0l086814;
	Mon, 2 Sep 2024 01:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725258046;
	bh=0PsvTXZkaaBt1oevuycsZuX//d/Au8segBo+kRprcR8=;
	h=From:To:CC:Subject:Date;
	b=qf1gxAl0AabeLFye4LHi88XhB9a11sSZzjuho1fNtXMG2K8buFZLbU8lEOJKYHElr
	 Zd77e/Y1KhwelQfV1MFM531ugooPlxpwVlxmmXexgXVZ1Nz2mDx7Lte72gPmR07P4+
	 RroMBoQToAVz6C+0y5KTjM0/Dh4aSz/AgHj3b9Sw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4826Kkqw032482
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Sep 2024 01:20:46 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Sep 2024 01:20:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Sep 2024 01:20:45 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.180])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4826KZYM123036;
	Mon, 2 Sep 2024 01:20:36 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>, <antheas.dk@gmail.com>,
        <Jerry2.Huang@lcfuturecenter.com>, <jim.shil@goertek.com>,
        <jeep.wang@goertek.com>, <will-wang@ti.com>,
        Shenghao
 Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ASoC: tas2781: Add Calibration Kcontrols for Chromebook
Date: Mon, 2 Sep 2024 14:20:27 +0800
Message-ID: <20240902062029.983-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: V4TDJ3SKOOGF75TT4S5QYHDPTH2JJDDS
X-Message-ID-Hash: V4TDJ3SKOOGF75TT4S5QYHDPTH2JJDDS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4TDJ3SKOOGF75TT4S5QYHDPTH2JJDDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add calibration related kcontrol for speaker impedance calibration and
speaker leakage check for Chromebook

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Add channel no into the log for error debug
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202407131659.uSVINfrZ-lkp@intel.com/__;!!G3vK!QyZeGtz-H
 - renamae tasdevice_chn_switch to put it in a single line
 - With inverted check this entire function becomes neater in
   tasdev_chn_switch.
 - Add registers for TAS2563 and TAS2781 calibration.
 - Add cali_data_backup for regsiter restore after calibration.
 - Add is_user_space_calidata to store the flag where the calibrated
   from, user space or bin file from driver parsing.
 - tasdevice_chn_switch for chip switch among multiple chips(tas2563
   or tas2781)
 - Add loading the calibrated values from user space in
   tasdev_load_calibrated_data
 - Correct no dsp no work, it can still work in bypass mode.
 - Add calibrated register setting for tas2563&tas2781.
 - Define tas2781_cali_control and tas2563_cali_control for calibration
---
 include/sound/tas2781.h           |  68 +++
 sound/soc/codecs/tas2781-comlib.c |  26 +
 sound/soc/codecs/tas2781-fmwlib.c |  60 +-
 sound/soc/codecs/tas2781-i2c.c    | 961 +++++++++++++++++++++++++++++-
 4 files changed, 1104 insertions(+), 11 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index dbda552398b5..a9ccbbd1945c 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -49,12 +49,59 @@
 /*I2C Checksum */
 #define TASDEVICE_I2CChecksum		TASDEVICE_REG(0x0, 0x0, 0x7E)
 
+/* XM_340 */
+#define	TASDEVICE_XM_A1_REG	TASDEVICE_REG(0x64, 0x02, 0x4c)
+/* XM_341 */
+#define	TASDEVICE_XM_A2_REG	TASDEVICE_REG(0x64, 0x02, 0x64)
+
 /* Volume control */
 #define TAS2563_DVC_LVL			TASDEVICE_REG(0x00, 0x02, 0x0C)
 #define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1A)
 #define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
 #define TAS2781_AMP_LEVEL_MASK		GENMASK(5, 1)
 
+#define TAS2563_IDLE		TASDEVICE_REG(0x00, 0x00, 0x3e)
+#define TAS2563_PRM_R0_REG		TASDEVICE_REG(0x00, 0x0f, 0x34)
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
+
 #define TASDEVICE_CMD_SING_W		0x1
 #define TASDEVICE_CMD_BURST		0x2
 #define TASDEVICE_CMD_DELAY		0x3
@@ -70,7 +117,15 @@ enum device_catlog_id {
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
+	struct bulk_reg_val *cali_data_backup;
 	struct tasdevice_fw *cali_data_fmw;
 	unsigned int dev_addr;
 	unsigned int err_code;
@@ -81,9 +136,19 @@ struct tasdevice {
 	bool is_loaderr;
 };
 
+struct cali_reg {
+	unsigned int r0_reg;
+	unsigned int r0_low_reg;
+	unsigned int invr0_reg;
+	unsigned int pow_reg;
+	unsigned int tlimit_reg;
+};
+
 struct calidata {
 	unsigned char *data;
 	unsigned long total_sz;
+	struct cali_reg cali_reg_array;
+	unsigned int cali_dat_sz_per_dev;
 };
 
 struct tasdevice_priv {
@@ -119,6 +184,7 @@ struct tasdevice_priv {
 	bool force_fwload_status;
 	bool playback_started;
 	bool isacpi;
+	bool is_user_space_calidata;
 	unsigned int global_addr;
 
 	int (*fw_parse_variable_header)(struct tasdevice_priv *tas_priv,
@@ -145,6 +211,8 @@ int tasdevice_init(struct tasdevice_priv *tas_priv);
 void tasdevice_remove(struct tasdevice_priv *tas_priv);
 int tasdevice_save_calibration(struct tasdevice_priv *tas_priv);
 void tasdevice_apply_calibration(struct tasdevice_priv *tas_priv);
+int tasdev_chn_switch(struct tasdevice_priv *tas_priv,
+	unsigned short chn);
 int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 	unsigned short chn, unsigned int reg, unsigned int *value);
 int tasdevice_dev_write(struct tasdevice_priv *tas_priv,
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 664c371796d6..1e0b3aa95749 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -88,6 +88,32 @@ static int tasdevice_change_chn_book(struct tasdevice_priv *tas_priv,
 	return ret;
 }
 
+int tasdev_chn_switch(struct tasdevice_priv *tas_priv,
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
+			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			return ret;
+		}
+		return 1;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tasdev_chn_switch);
+
 int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 	unsigned short chn, unsigned int reg, unsigned int *val)
 {
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index f3a7605f0710..3de0132c345d 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2151,20 +2151,61 @@ static int tasdevice_load_data(struct tasdevice_priv *tas_priv,
 
 static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
 {
+	struct tasdevice_fw *cal_fmw = priv->tasdevice[i].cali_data_fmw;
+	struct calidata *cali_data = &priv->cali_data;
+	struct cali_reg *p = &cali_data->cali_reg_array;
+	unsigned char *data = cali_data->data;
 	struct tasdevice_calibration *cal;
-	struct tasdevice_fw *cal_fmw;
+	int k = i * (cali_data->cali_dat_sz_per_dev + 1);
+	int rc;
 
-	cal_fmw = priv->tasdevice[i].cali_data_fmw;
+	/* Load the calibrated data from cal bin file */
+	if (!priv->is_user_space_calidata && cal_fmw) {
+		cal = cal_fmw->calibrations;
 
-	/* No calibrated data for current devices, playback will go ahead. */
-	if (!cal_fmw)
+		if (cal)
+			load_calib_data(priv, &cal->dev_data);
 		return;
-
-	cal = cal_fmw->calibrations;
-	if (!cal)
+	}
+	if (!priv->is_user_space_calidata)
+		return;
+	/* load calibrated data from user space */
+	if (data[k] != i) {
+		dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
+			__func__, i);
 		return;
+	}
+	k++;
 
-	load_calib_data(priv, &cal->dev_data);
+	rc = tasdevice_dev_bulk_write(priv, i, p->r0_reg, &(data[k]), 4);
+	if (rc < 0) {
+		dev_err(priv->dev, "chn %d r0_reg bulk_wr err = %d\n", i, rc);
+		return;
+	}
+	k += 4;
+	rc = tasdevice_dev_bulk_write(priv, i, p->r0_low_reg, &(data[k]), 4);
+	if (rc < 0) {
+		dev_err(priv->dev, "chn %d r0_low_reg err = %d\n", i, rc);
+		return;
+	}
+	k += 4;
+	rc = tasdevice_dev_bulk_write(priv, i, p->invr0_reg, &(data[k]), 4);
+	if (rc < 0) {
+		dev_err(priv->dev, "chn %d invr0_reg err = %d\n", i, rc);
+		return;
+	}
+	k += 4;
+	rc = tasdevice_dev_bulk_write(priv, i, p->pow_reg, &(data[k]), 4);
+	if (rc < 0) {
+		dev_err(priv->dev, "chn %d pow_reg bulk_wr err = %d\n", i, rc);
+		return;
+	}
+	k += 4;
+	rc = tasdevice_dev_bulk_write(priv, i, p->tlimit_reg, &(data[k]), 4);
+	if (rc < 0) {
+		dev_err(priv->dev, "chn %d tlimit_reg err = %d\n", i, rc);
+		return;
+	}
 }
 
 int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
@@ -2259,9 +2300,10 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 				tas_priv->tasdevice[i].cur_conf = cfg_no;
 			}
 		}
-	} else
+	} else {
 		dev_dbg(tas_priv->dev, "%s: Unneeded loading dsp conf %d\n",
 			__func__, cfg_no);
+	}
 
 	status |= cfg_info[rca_conf_no]->active_dev;
 
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 59fcce7fef7b..ebd71c7eaa59 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -33,6 +33,143 @@
 #include <sound/tas2781-tlv.h>
 #include <asm/unaligned.h>
 
+static const struct bulk_reg_val tas2563_cali_start_reg[] = {
+	{
+		.reg = TAS2563_IDLE,
+		.val_len = 1,
+		.val = { 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_ENFF_REG,
+		.val_len = 4,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_DISTCK_REG,
+		.val_len = 4,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_TE_SCTHR_REG,
+		.val_len = 4,
+		.val = { 0x7f, 0xff, 0xff, 0xff },
+	},
+	{
+		.reg = TAS2563_PRM_PLT_FLAG_REG,
+		.val_len = 4,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+	},
+	{
+		.reg = TAS2563_PRM_SINEGAIN_REG,
+		.val_len = 4,
+		.val = { 0x0a, 0x3d, 0x70, 0xa4 },
+	},
+	{
+		.reg = TAS2563_TE_TA1_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_TA1_AT_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_TA2_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x06, 0xd3, 0x72 },
+	},
+	{
+		.reg = TAS2563_TE_AT_REG,
+		.val_len = 4,
+		.val = { 0x00, 0x36, 0x91, 0x5e },
+	},
+	{
+		.reg = TAS2563_TE_DT_REG,
+		.val_len = 4,
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
+		.reg = 0,
+		.val = { 0x00, 0x00, 0x00, 0x56 }, // 1mA
+		.val_len = 4,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_PLT_FLAG_REG,
+		.val = { 0x40, 0x00, 0x00, 0x00 },
+		.val_len = 4,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_SINEGAIN_REG,
+		.val_len = 4,
+		.is_locked = false
+	},
+	{
+		.reg = TAS2781_PRM_SINEGAIN2_REG,
+		.val_len = 4,
+		.is_locked = false
+	},
+};
+
 static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas2563", TAS2563 },
 	{ "tas2781", TAS2781 },
@@ -141,6 +278,556 @@ static int tasdev_force_fwload_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
+static int tasdev_cali_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	struct calidata *cali_data = &priv->cali_data;
+	struct cali_reg *p = &cali_data->cali_reg_array;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned char *data = cali_data->data;
+	unsigned int i = 0;
+	unsigned int j, k;
+	int rc;
+
+	guard(mutex)(&priv->codec_lock);
+	if (!priv->is_user_space_calidata)
+		return -1;
+
+	if (!p->r0_reg)
+		return -1;
+
+	dst[i++] = bytes_ext->max;
+	dst[i++] = 'r';
+
+	dst[i++] = TASDEVICE_BOOK_ID(p->r0_reg);
+	dst[i++] = TASDEVICE_PAGE_ID(p->r0_reg);
+	dst[i++] = TASDEVICE_PAGE_REG(p->r0_reg);
+
+	dst[i++] = TASDEVICE_BOOK_ID(p->r0_low_reg);
+	dst[i++] = TASDEVICE_PAGE_ID(p->r0_low_reg);
+	dst[i++] = TASDEVICE_PAGE_REG(p->r0_low_reg);
+
+	dst[i++] = TASDEVICE_BOOK_ID(p->invr0_reg);
+	dst[i++] = TASDEVICE_PAGE_ID(p->invr0_reg);
+	dst[i++] = TASDEVICE_PAGE_REG(p->invr0_reg);
+
+	dst[i++] = TASDEVICE_BOOK_ID(p->pow_reg);
+	dst[i++] = TASDEVICE_PAGE_ID(p->pow_reg);
+	dst[i++] = TASDEVICE_PAGE_REG(p->pow_reg);
+
+	dst[i++] = TASDEVICE_BOOK_ID(p->tlimit_reg);
+	dst[i++] = TASDEVICE_PAGE_ID(p->tlimit_reg);
+	dst[i++] = TASDEVICE_PAGE_REG(p->tlimit_reg);
+
+	for (j = 0, k = 0; j < priv->ndev; j++) {
+		if (j == data[k]) {
+			dst[i++] = j;
+			k++;
+		} else {
+			dev_err(priv->dev, "chn %d device %u not match\n",
+				j, data[k]);
+			k += 21;
+			continue;
+		}
+		rc = tasdevice_dev_bulk_read(priv, j, p->r0_reg, &dst[i], 4);
+		if (rc < 0) {
+			dev_err(priv->dev, "chn %d r0_reg bulk_rd err = %d\n",
+				j, rc);
+			i += 20;
+			k += 20;
+			continue;
+		}
+		rc = memcmp(&dst[i], &data[k], 4);
+		if (rc != 0)
+			dev_dbg(priv->dev, "chn %d r0_data is not same\n", j);
+		k += 4;
+		i += 4;
+		rc = tasdevice_dev_bulk_read(priv, j, p->r0_low_reg,
+			&dst[i], 4);
+		if (rc < 0) {
+			dev_err(priv->dev, "chn %d r0_low bulk_rd err = %d\n",
+				j, rc);
+			i += 16;
+			k += 16;
+			continue;
+		}
+		rc = memcmp(&dst[i], &data[k], 4);
+		if (rc != 0)
+			dev_dbg(priv->dev, "chn %d r0_low is not same\n", j);
+		i += 4;
+		k += 4;
+		rc = tasdevice_dev_bulk_read(priv, j, p->invr0_reg,
+			&dst[i], 4);
+		if (rc < 0) {
+			dev_err(priv->dev, "chn %d invr0 bulk_rd err = %d\n",
+				j, rc);
+			i += 12;
+			k += 12;
+			continue;
+		}
+		rc = memcmp(&dst[i], &data[k], 4);
+		if (rc != 0)
+			dev_dbg(priv->dev, "chn %d invr0 is not same\n", j);
+		i += 4;
+		k += 4;
+		rc = tasdevice_dev_bulk_read(priv, j, p->pow_reg, &dst[i], 4);
+		if (rc < 0) {
+			dev_err(priv->dev, "chn %d pow_reg bulk_rd err = %d\n",
+				j, rc);
+			i += 8;
+			k += 8;
+			continue;
+		}
+		rc = memcmp(&dst[i], &data[k], 4);
+		if (rc != 0)
+			dev_dbg(priv->dev, "chn %d pow_reg is not same\n", j);
+		i += 4;
+		k += 4;
+		rc = tasdevice_dev_bulk_read(priv, j, p->tlimit_reg,
+			&dst[i], 4);
+		if (rc < 0) {
+			dev_err(priv->dev, "chn %d tlimit bulk_rd err = %d\n",
+				j, rc);
+		}
+		rc = memcmp(&dst[i], &data[k], 4);
+		if (rc != 0)
+			dev_dbg(priv->dev, "chn %d tlimit is not same\n", j);
+		i += 4;
+		k += 4;
+	}
+	return 0;
+}
+
+static int calib_data_get(struct tasdevice_priv *tas_priv, int reg,
+	unsigned char *dst)
+{
+	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	int rc = -1;
+	int i;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		if (clt->addr == tasdev[i].dev_addr) {
+			/* First byte is the device index. */
+			dst[0] = i;
+			rc = tasdevice_dev_bulk_read(tas_priv, i, reg, &dst[1],
+				4);
+			break;
+		}
+	}
+
+	return rc;
+}
+
+static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
+	int *reg, unsigned char *dat)
+{
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	struct bulk_reg_val *p = tasdev[i].cali_data_backup;
+	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
+	int j;
+
+	if (p == NULL)
+		return;
+
+	/* Store the current setting from the chip */
+	for (j = 0; j < sum; j++) {
+		if (p[j].val_len == 1) {
+			if (p[j].is_locked)
+				tasdevice_dev_write(tas_priv, i,
+					TAS2781_TEST_UNLOCK_REG,
+					TAS2781_TEST_PAGE_UNLOCK);
+			tasdevice_dev_read(tas_priv, i, p[j].reg,
+				(int *)&p[j].val[0]);
+		} else {
+			switch (p[j].reg) {
+			case 0:
+			if (!reg[0])
+				continue;
+			p[j].reg = reg[0];
+				break;
+			case TAS2781_PRM_PLT_FLAG_REG:
+			p[j].reg = reg[1];
+				break;
+			case TAS2781_PRM_SINEGAIN_REG:
+			p[j].reg = reg[2];
+				break;
+			case TAS2781_PRM_SINEGAIN2_REG:
+			p[j].reg = reg[3];
+				break;
+			}
+			tasdevice_dev_bulk_read(tas_priv, i, p[j].reg,
+				p[j].val, 4);
+		}
+	}
+
+	/* Update the setting for calibration */
+	for (j = 0; j < sum - 2; j++) {
+		if (p[j].val_len == 1) {
+			if (p[j].is_locked)
+				tasdevice_dev_write(tas_priv, i,
+					TAS2781_TEST_UNLOCK_REG,
+					TAS2781_TEST_PAGE_UNLOCK);
+			tasdevice_dev_write(tas_priv, i, p[j].reg,
+				tas2781_cali_start_reg[j].val[0]);
+		} else {
+			if (!p[j].reg)
+				continue;
+			tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+				(unsigned char *)
+				tas2781_cali_start_reg[j].val, 4);
+		}
+	}
+
+	tasdevice_dev_bulk_write(tas_priv, i, p[j].reg, &dat[1], 4);
+	tasdevice_dev_bulk_write(tas_priv, i, p[j + 1].reg, &dat[5], 4);
+}
+
+static int tas2781_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dat = ucontrol->value.bytes.data;
+	int i, reg[4];
+	int j = 0;
+
+	guard(mutex)(&priv->codec_lock);
+	if (priv->chip_id != TAS2781 || bytes_ext->max != dat[0] ||
+		dat[1] != 'r') {
+		dev_err(priv->dev, "%s: package fmt or chipid incorrect\n",
+			__func__);
+		return 0;
+	}
+	j += 2;
+	/* refresh pilot tone and SineGain register */
+	for (i = 0; i < ARRAY_SIZE(reg); i++) {
+		reg[i] = TASDEVICE_REG(dat[j], dat[j + 1], dat[j + 2]);
+		j += 3;
+	}
+
+	for (i = 0; i < priv->ndev; i++) {
+		int k = i * 9 + j;
+
+		if (dat[k] != i) {
+			dev_err(priv->dev, "%s:no cal-setting for dev %d\n",
+				__func__, i);
+			continue;
+		}
+		sngl_calib_start(priv, i, reg, dat + k);
+	}
+	return 1;
+}
+
+static void tas2781_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
+	int i, j;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_backup;
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
+			} else {
+				if (!p[j].reg)
+					continue;
+				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+					p[j].val, 4);
+			}
+		}
+	}
+}
+
+static int tas2563_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct bulk_reg_val *q = (struct bulk_reg_val *)tas2563_cali_start_reg;
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	const int sum = ARRAY_SIZE(tas2563_cali_start_reg);
+	int rc = 1;
+	int i, j;
+
+	guard(mutex)(&tas_priv->codec_lock);
+	if (tas_priv->chip_id != TAS2563) {
+		rc = -1;
+		goto out;
+	}
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = tas_priv->tasdevice;
+		struct bulk_reg_val *p = tasdev[i].cali_data_backup;
+
+		if (p == NULL)
+			continue;
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1)
+				tasdevice_dev_read(tas_priv,
+					i, p[j].reg,
+					(unsigned int *)&p[j].val[0]);
+			else
+				tasdevice_dev_bulk_read(tas_priv,
+					i, p[j].reg, p[j].val, 4);
+		}
+
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1)
+				tasdevice_dev_write(tas_priv, i, p[j].reg,
+					q[j].val[0]);
+			else
+				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+					q[j].val, 4);
+		}
+	}
+out:
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
+		struct bulk_reg_val *p = tasdev[i].cali_data_backup;
+
+		if (p == NULL)
+			continue;
+
+		for (j = 0; j < sum; j++) {
+			if (p[j].val_len == 1)
+				tasdevice_dev_write(tas_priv, i, p[j].reg,
+					p[j].val[0]);
+			else
+				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
+					p[j].val, 4);
+		}
+	}
+}
+
+static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+
+	guard(mutex)(&priv->codec_lock);
+	if (priv->chip_id == TAS2563)
+		tas2563_calib_stop_put(priv);
+	else
+		tas2781_calib_stop_put(priv);
+
+	return 1;
+}
+
+static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	struct calidata *cali_data = &priv->cali_data;
+	struct cali_reg *p = &cali_data->cali_reg_array;
+	unsigned char *src = ucontrol->value.bytes.data;
+	unsigned char *dst = cali_data->data;
+	int rc = 1, i = 0;
+	int j;
+
+	guard(mutex)(&priv->codec_lock);
+	if (src[0] != bytes_ext->max || src[1] != 'r') {
+		dev_err(priv->dev, "%s: pkg fmt invalid\n", __func__);
+		return 0;
+	}
+	for (j = 0; j < priv->ndev; j++) {
+		if (src[17 + j * 21] != j) {
+			dev_err(priv->dev, "%s: pkg fmt invalid\n", __func__);
+			return 0;
+		}
+	}
+	i += 2;
+	priv->is_user_space_calidata = true;
+
+	p->r0_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+	i += 3;
+	p->r0_low_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+	i += 3;
+	p->invr0_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+	i += 3;
+	p->pow_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+	i += 3;
+	p->tlimit_reg = TASDEVICE_REG(src[i], src[i + 1], src[i + 2]);
+	i += 3;
+
+	memcpy(dst, &src[i], cali_data->total_sz);
+	return rc;
+}
+
+static int tas2781_latch_reg_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	int i, val, rc = -1;
+
+	dst[0] = bytes_ext->max;
+	guard(mutex)(&tas_priv->codec_lock);
+	for (i = 0; i < tas_priv->ndev; i++) {
+		if (clt->addr == tasdev[i].dev_addr) {
+			/* First byte is the device index. */
+			dst[1] = i;
+			rc = tasdevice_dev_read(tas_priv, i,
+				TAS2781_RUNTIME_LATCH_RE_REG, &val);
+			if (rc < 0)
+				dev_err(tas_priv->dev, "%s, get value error\n",
+					__func__);
+			else
+				dst[2] = val;
+
+			break;
+		}
+	}
+
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
+	guard(mutex)(&tas_priv->codec_lock);
+	dst[0] = bytes_ext->max;
+	rc = calib_data_get(tas_priv, reg, &dst[1]);
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
+	guard(mutex)(&tas_priv->codec_lock);
+	dst[0] = bytes_ext->max;
+	rc = calib_data_get(tas_priv, reg, &dst[1]);
+
+	return rc;
+}
+
+static int tasdev_r0_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	struct calidata *cali_data = &tas_priv->cali_data;
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	unsigned int reg;
+	int rc = -1;
+
+	guard(mutex)(&tas_priv->codec_lock);
+
+	if (tas_priv->chip_id == TAS2563)
+		reg = TAS2563_PRM_R0_REG;
+	else if (cali_data->cali_reg_array.r0_reg)
+		reg = cali_data->cali_reg_array.r0_reg;
+	else
+		return -1;
+	dst[0] = bytes_ext->max;
+	rc = calib_data_get(tas_priv, reg, &dst[1]);
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
+	guard(mutex)(&tas_priv->codec_lock);
+	dst[0] = bytes_ext->max;
+	rc = calib_data_get(tas_priv, reg, &dst[1]);
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
+	guard(mutex)(&tas_priv->codec_lock);
+	dst[0] = bytes_ext->max;
+	rc = calib_data_get(tas_priv, reg, &dst[1]);
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
 static int tas2563_digital_gain_get(
 	struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
@@ -241,6 +928,16 @@ static const struct snd_kcontrol_new tasdevice_snd_controls[] = {
 		tasdev_force_fwload_get, tasdev_force_fwload_put),
 };
 
+static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Stop", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tasdev_calib_stop_put),
+	SND_SOC_BYTES_EXT("Amp TF Data", 6, tasdev_tf_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp RE Data", 6, tasdev_re_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp R0 Data", 6, tasdev_r0_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp XMA1 Data", 6, tasdev_XMA1_data_get, NULL),
+	SND_SOC_BYTES_EXT("Amp XMA2 Data", 6, tasdev_XMA2_data_get, NULL),
+};
+
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
@@ -250,6 +947,10 @@ static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 		tas2781_digital_putvol, dvc_tlv),
 };
 
+static const struct snd_kcontrol_new tas2781_cali_controls[] = {
+	SND_SOC_BYTES_EXT("Amp Latch Data", 3, tas2781_latch_reg_get, NULL),
+};
+
 static const struct snd_kcontrol_new tas2563_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS2563_DVC_LVL, 0,
 		0, ARRAY_SIZE(tas2563_dvc_table) - 1, 0,
@@ -257,6 +958,11 @@ static const struct snd_kcontrol_new tas2563_snd_controls[] = {
 		tas2563_dvc_tlv),
 };
 
+static const struct snd_kcontrol_new tas2563_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Start", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tas2563_calib_start_put),
+};
+
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -274,6 +980,31 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
+static int tasdevice_info_active_num(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->ndev - 1;
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
@@ -330,6 +1061,17 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
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
@@ -421,11 +1163,47 @@ static int tasdevice_configuration_put(
 	return ret;
 }
 
+static int tasdevice_active_num_get(struct snd_kcontrol *kcontrol,
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
+static int tasdevice_active_num_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	int dev_id = ucontrol->value.integer.value[0];
+	int max = tas_priv->ndev - 1, rc;
+
+	dev_id = clamp(dev_id, 0, max);
+
+	guard(mutex)(&tas_priv->codec_lock);
+	rc = tasdev_chn_switch(tas_priv, dev_id);
+
+	return rc;
+}
+
 static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 {
 	struct snd_kcontrol_new *dsp_ctrls;
-	char *prog_name, *conf_name;
-	int nr_controls = 2;
+	char *active_dev_num, *chip_id;
+	char *conf_name, *prog_name;
+	int nr_controls = 4;
 	int mix_index = 0;
 	int ret;
 
@@ -466,6 +1244,30 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 	dsp_ctrls[mix_index].put = tasdevice_configuration_put;
 	mix_index++;
 
+	active_dev_num = devm_kstrdup(tas_priv->dev, "Activate Tasdevice Num",
+		GFP_KERNEL);
+	if (!active_dev_num) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	dsp_ctrls[mix_index].name = active_dev_num;
+	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	dsp_ctrls[mix_index].info = tasdevice_info_active_num;
+	dsp_ctrls[mix_index].get = tasdevice_active_num_get;
+	dsp_ctrls[mix_index].put = tasdevice_active_num_put;
+	mix_index++;
+
+	chip_id = devm_kstrdup(tas_priv->dev, "Tasdevice Chip Id", GFP_KERNEL);
+	if (!chip_id) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	dsp_ctrls[mix_index].name = chip_id;
+	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	dsp_ctrls[mix_index].info = tasdevice_info_chip_id;
+	dsp_ctrls[mix_index].get = tasdevice_get_chip_id;
+	mix_index++;
+
 	ret = snd_soc_add_component_controls(tas_priv->codec, dsp_ctrls,
 		nr_controls < mix_index ? nr_controls : mix_index);
 
@@ -473,6 +1275,150 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 	return ret;
 }
 
+static int tasdevice_create_cali_ctrls(struct tasdevice_priv *tas_priv)
+{
+	struct calidata *cali_data = &tas_priv->cali_data;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	struct soc_bytes_ext *ext_cali_data;
+	struct snd_kcontrol_new *cali_ctrls;
+	unsigned int num_controls;
+	char *cali_name;
+	int rc, i;
+
+	rc = snd_soc_add_component_controls(tas_priv->codec,
+		tasdevice_cali_controls, ARRAY_SIZE(tasdevice_cali_controls));
+	if (rc < 0) {
+		dev_err(tas_priv->dev, "%s: Add cali controls err rc = %d",
+			__func__, rc);
+		return rc;
+	}
+
+	if (tas_priv->chip_id == TAS2781) {
+		cali_ctrls = (struct snd_kcontrol_new *)tas2781_cali_controls;
+		num_controls = ARRAY_SIZE(tas2781_cali_controls);
+		for (i = 0; i < tas_priv->ndev; i++) {
+			tasdev[i].cali_data_backup =
+				kmemdup(tas2781_cali_start_reg,
+				sizeof(tas2781_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_backup)
+				return -ENOMEM;
+		}
+	} else {
+		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
+		num_controls = ARRAY_SIZE(tas2563_cali_controls);
+		for (i = 0; i < tas_priv->ndev; i++) {
+			tasdev[i].cali_data_backup =
+				kmemdup(tas2563_cali_start_reg,
+				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_backup)
+				return -ENOMEM;
+		}
+	}
+
+	rc = snd_soc_add_component_controls(tas_priv->codec, cali_ctrls,
+		num_controls);
+	if (rc < 0) {
+		dev_err(tas_priv->dev, "%s: Add chip cali ctrls err rc = %d",
+			__func__, rc);
+		return rc;
+	}
+
+	/* index for cali_ctrls */
+	i = 0;
+	if (tas_priv->chip_id == TAS2781)
+		num_controls = 2;
+	else
+		num_controls = 1;
+
+	/*
+	 * Alloc kcontrol via devm_kzalloc, which don't manually
+	 * free the kcontrol
+	 */
+	cali_ctrls = devm_kcalloc(tas_priv->dev, num_controls,
+		sizeof(cali_ctrls[0]), GFP_KERNEL);
+	if (!cali_ctrls)
+		return -ENOMEM;
+
+	ext_cali_data = devm_kzalloc(tas_priv->dev, sizeof(*ext_cali_data),
+		GFP_KERNEL);
+	if (!ext_cali_data)
+		return -ENOMEM;
+
+	cali_name = devm_kstrdup(tas_priv->dev, "Speaker Calibrated Data",
+		GFP_KERNEL);
+	if (!cali_name)
+		return -ENOMEM;
+	/* the number of calibrated data per tas2563/tas2781 */
+	cali_data->cali_dat_sz_per_dev = 20;
+	/*
+	 * Data structure for tas2563/tas2781 calibrated data:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register array for calibrated data (15 bytes)
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Calibrated data for Device #i (20 bytes)
+	 *	}
+	 */
+	ext_cali_data->max = tas_priv->ndev *
+		(cali_data->cali_dat_sz_per_dev + 1) + 1 + 15 + 1;
+	tas_priv->cali_data.total_sz = tas_priv->ndev *
+		(cali_data->cali_dat_sz_per_dev + 1);
+	tas_priv->cali_data.data = devm_kzalloc(tas_priv->dev,
+		ext_cali_data->max, GFP_KERNEL);
+	cali_ctrls[i].name = cali_name;
+	cali_ctrls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrls[i].info = snd_soc_bytes_info_ext;
+	cali_ctrls[i].get = tasdev_cali_data_get;
+	cali_ctrls[i].put = tasdev_cali_data_put;
+	cali_ctrls[i].private_value = (unsigned long)ext_cali_data;
+	i++;
+
+	cali_data->data = devm_kzalloc(tas_priv->dev, cali_data->total_sz,
+		GFP_KERNEL);
+	if (!cali_data->data)
+		return -ENOMEM;
+
+	if (tas_priv->chip_id == TAS2781) {
+		struct soc_bytes_ext *ext_cali_start;
+		char *cali_start_name;
+
+		ext_cali_start = devm_kzalloc(tas_priv->dev,
+			sizeof(*ext_cali_start), GFP_KERNEL);
+		if (!ext_cali_start)
+			return -ENOMEM;
+
+		cali_start_name = devm_kstrdup(tas_priv->dev,
+			"Calibration Start", GFP_KERNEL);
+		if (!cali_start_name)
+			return -ENOMEM;
+		/*
+		 * package structure for tas2781 ftc start:
+		 *	Pkg len (1 byte)
+		 *	Reg id (1 byte, constant 'r')
+		 *	book, page, register for pilot threshold, pilot tone
+		 *		and sine gain (12 bytes)
+		 *	for (i = 0; i < Device-Sum; i++) {
+		 *		Device #i index_info (1 byte)
+		 *		Sine gain for Device #i (8 bytes)
+		 *	}
+		 */
+		ext_cali_data->max = 14 + tas_priv->ndev * 9;
+		cali_ctrls[i].name = cali_start_name;
+		cali_ctrls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+		cali_ctrls[i].info = snd_soc_bytes_info_ext;
+		cali_ctrls[i].put = tas2781_calib_start_put;
+		cali_ctrls[i].get = tasdev_nop_get;
+		cali_ctrls[i].private_value = (unsigned long)ext_cali_start;
+		i++;
+	}
+
+	rc = snd_soc_add_component_controls(tas_priv->codec, cali_ctrls,
+		num_controls < i ? num_controls : i);
+
+	return rc;
+}
+
 static void tasdevice_fw_ready(const struct firmware *fmw,
 	void *context)
 {
@@ -519,6 +1465,12 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		goto out;
 	}
 
+	ret = tasdevice_create_cali_ctrls(tas_priv);
+	if (ret) {
+		dev_err(tas_priv->dev, "cali controls error\n");
+		goto out;
+	}
+
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
 	/* If calibrated data occurs error, dsp will still works with default
@@ -720,6 +1672,11 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 static void tasdevice_deinit(void *context)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;
+	struct tasdevice *tasdev = tas_priv->tasdevice;
+	int i;
+
+	for (i = 0; i < tas_priv->ndev; i++)
+		kfree(tasdev[i].cali_data_backup);
 
 	tasdevice_config_info_remove(tas_priv);
 	tasdevice_dsp_remove(tas_priv);
-- 
2.35.7

