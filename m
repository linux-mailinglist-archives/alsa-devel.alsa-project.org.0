Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B048B89E9
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 14:24:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A9EF868;
	Wed,  1 May 2024 14:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A9EF868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714566248;
	bh=QQttAjkWsqg4VXZTAH5YeoEfGOe259wZhk6ldrPF234=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HXG7Kx/xK8IlAvmDhzLiR2PuNClAUWT3kYNGviQ9gBCj9pO6yF3yZAo5W/n2cBV8U
	 P1kF9n2O8fIo+EU34GAZodyRfw0O8d+YQemcPSwPBEhf3qBIF2LxoCIZs5rcbZILOG
	 fdAIPeMr46YzHTshbJRRKdlieuZ66EcyheRaSl5o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 007F5F80578; Wed,  1 May 2024 14:23:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7766BF805A1;
	Wed,  1 May 2024 14:23:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DAEFF80266; Wed,  1 May 2024 14:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AB62F800E2
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 14:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB62F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=YpaItMYL
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441CN8m8071177;
	Wed, 1 May 2024 07:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714566188;
	bh=LzZ/t7t/FM96l7qsRcnfi3T22p23/zeE2lnAV0eULX0=;
	h=From:To:CC:Subject:Date;
	b=YpaItMYLGpPIdyeRT+MWR16VgCnXowS/1u1bq3OMnGT2vsRf8H1Fh47HcdqjKOm9/
	 UntQFWn7swM7fsFog8+OH+nQTTXQUrQC62fwPt2mmo9EiM7O4sI9lkr/gu2uNdy3RM
	 BEh76JnFXeVIbzs627Wf0tt6VJChwdC2MLaY/9hE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441CN8vi092019
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 May 2024 07:23:08 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 07:23:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 07:23:08 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.109])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441CN1EP113570;
	Wed, 1 May 2024 07:23:02 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <mimperial@lenovo.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <liam.r.girdwood@intel.com>, <bard.liao@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kevin-lu@ti.com>,
        <cameron.berkenpas@gmail.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <soyer@irl.hu>, <Baojun.Xu@fpt.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ALSA: ASoc/tas2781: Fix wrong loading calibrated data
 sequence
Date: Wed, 1 May 2024 20:22:50 +0800
Message-ID: <20240501122252.1215-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: IXIAP7WBMBXUJ3CYU5CVUXIRVTJQVFPS
X-Message-ID-Hash: IXIAP7WBMBXUJ3CYU5CVUXIRVTJQVFPS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IXIAP7WBMBXUJ3CYU5CVUXIRVTJQVFPS/>
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

'Fixes: 0a0877812628 ("ASoc: tas2781: Fix spelling mistake "calibraiton"
 -> "calibration"")'
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - In the Subject, fixed --> Fix
 - In tas2781-fmwlib.c, tasdevice-fmw.c ---> tas2781-fmwlib.c
 - dsp --> DSP
 - Remove unneeded parentheses for & (dereference) operator
 - Add Fixes tag
 - Changed the copyright year to 2024 in the related files
 - In tas2781-dsp.h, __TASDEVICE_DSP_H__ --> __TAS2781_DSP_H__
v1:
 - Download calibrated data after loading the new DSP config params
 - call tasdevice_prmg_load instead of tasdevice_prmg_calibdata_load, it
   is unnecessary to load calibrated data after loading DSP program. Load
   it after loading DSP config params each time.
 - Remove tasdevice_prmg_calibdata_load, because it is unnecessary to load
   calibrated data after loading DSP program.
---
 include/sound/tas2781-dsp.h       |  7 +--
 sound/soc/codecs/tas2781-fmwlib.c | 99 +++++++------------------------
 sound/soc/codecs/tas2781-i2c.c    |  4 +-
 3 files changed, 28 insertions(+), 82 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index ea9af2726a53..7fba7ea26a4b 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2023 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2781 driver implements a flexible and configurable
@@ -13,8 +13,8 @@
 // Author: Kevin Lu <kevin-lu@ti.com>
 //
 
-#ifndef __TASDEVICE_DSP_H__
-#define __TASDEVICE_DSP_H__
+#ifndef __TAS2781_DSP_H__
+#define __TAS2781_DSP_H__
 
 #define MAIN_ALL_DEVICES			0x0d
 #define MAIN_DEVICE_A				0x01
@@ -180,7 +180,6 @@ void tasdevice_calbin_remove(void *context);
 int tasdevice_select_tuningprm_cfg(void *context, int prm,
 	int cfg_no, int rca_conf_no);
 int tasdevice_prmg_load(void *context, int prm_no);
-int tasdevice_prmg_calibdata_load(void *context, int prm_no);
 void tasdevice_tuning_switch(void *context, int state);
 int tas2781_load_calibration(void *context, char *file_name,
 	unsigned short i);
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 45760fe19523..5a4095c6a954 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2,7 +2,7 @@
 //
 // tasdevice-fmw.c -- TASDEVICE firmware support
 //
-// Copyright 2023 Texas Instruments, Inc.
+// Copyright 2023 - 2024 Texas Instruments, Inc.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
@@ -2151,6 +2151,20 @@ static int tasdevice_load_data(struct tasdevice_priv *tas_priv,
 	return ret;
 }
 
+static void tasdev_load_calibrated_data(struct tasdevice_priv *priv,
+	int i)
+{
+	struct tasdevice_fw *cal_fmw = priv->tasdevice[i].cali_data_fmw;
+
+	if (cal_fmw) {
+		struct tasdevice_calibration *cal = cal_fmw->calibrations;
+
+		if (cal)
+			load_calib_data(priv, &cal->dev_data);
+		return;
+	}
+}
+
 int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 	int cfg_no, int rca_conf_no)
 {
@@ -2210,21 +2224,9 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 		for (i = 0; i < tas_priv->ndev; i++) {
 			if (tas_priv->tasdevice[i].is_loaderr == true)
 				continue;
-			else if (tas_priv->tasdevice[i].is_loaderr == false
-				&& tas_priv->tasdevice[i].is_loading == true) {
-				struct tasdevice_fw *cal_fmw =
-					tas_priv->tasdevice[i].cali_data_fmw;
-
-				if (cal_fmw) {
-					struct tasdevice_calibration
-						*cal = cal_fmw->calibrations;
-
-					if (cal)
-						load_calib_data(tas_priv,
-							&(cal->dev_data));
-				}
+			if (tas_priv->tasdevice[i].is_loaderr == false
+				&& tas_priv->tasdevice[i].is_loading == true)
 				tas_priv->tasdevice[i].cur_prog = prm_no;
-			}
 		}
 	}
 
@@ -2247,9 +2249,13 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 			if (tas_priv->tasdevice[i].is_loaderr == true) {
 				status |= 1 << (i + 4);
 				continue;
-			} else if (tas_priv->tasdevice[i].is_loaderr == false
-				&& tas_priv->tasdevice[i].is_loading == true)
+			}
+
+			if (tas_priv->tasdevice[i].is_loaderr == false
+				&& tas_priv->tasdevice[i].is_loading == true) {
+				tasdev_load_calibrated_data(tas_priv, i);
 				tas_priv->tasdevice[i].cur_conf = cfg_no;
+			}
 		}
 	} else
 		dev_dbg(tas_priv->dev, "%s: Unneeded loading dsp conf %d\n",
@@ -2308,65 +2314,6 @@ int tasdevice_prmg_load(void *context, int prm_no)
 }
 EXPORT_SYMBOL_NS_GPL(tasdevice_prmg_load, SND_SOC_TAS2781_FMWLIB);
 
-int tasdevice_prmg_calibdata_load(void *context, int prm_no)
-{
-	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;
-	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
-	struct tasdevice_prog *program;
-	int prog_status = 0;
-	int i;
-
-	if (!tas_fmw) {
-		dev_err(tas_priv->dev, "%s: Firmware is NULL\n", __func__);
-		goto out;
-	}
-
-	if (prm_no >= tas_fmw->nr_programs) {
-		dev_err(tas_priv->dev,
-			"%s: prm(%d) is not in range of Programs %u\n",
-			__func__, prm_no, tas_fmw->nr_programs);
-		goto out;
-	}
-
-	for (i = 0, prog_status = 0; i < tas_priv->ndev; i++) {
-		if (prm_no >= 0 && tas_priv->tasdevice[i].cur_prog != prm_no) {
-			tas_priv->tasdevice[i].cur_conf = -1;
-			tas_priv->tasdevice[i].is_loading = true;
-			prog_status++;
-		}
-		tas_priv->tasdevice[i].is_loaderr = false;
-	}
-
-	if (prog_status) {
-		program = &(tas_fmw->programs[prm_no]);
-		tasdevice_load_data(tas_priv, &(program->dev_data));
-		for (i = 0; i < tas_priv->ndev; i++) {
-			if (tas_priv->tasdevice[i].is_loaderr == true)
-				continue;
-			else if (tas_priv->tasdevice[i].is_loaderr == false
-				&& tas_priv->tasdevice[i].is_loading == true) {
-				struct tasdevice_fw *cal_fmw =
-					tas_priv->tasdevice[i].cali_data_fmw;
-
-				if (cal_fmw) {
-					struct tasdevice_calibration *cal =
-						cal_fmw->calibrations;
-
-					if (cal)
-						load_calib_data(tas_priv,
-							&(cal->dev_data));
-				}
-				tas_priv->tasdevice[i].cur_prog = prm_no;
-			}
-		}
-	}
-
-out:
-	return prog_status;
-}
-EXPORT_SYMBOL_NS_GPL(tasdevice_prmg_calibdata_load,
-	SND_SOC_TAS2781_FMWLIB);
-
 void tasdevice_tuning_switch(void *context, int state)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index b5abff230e43..9350972dfefe 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2563/TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2023 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2563/TAS2781 driver implements a flexible and configurable
@@ -414,7 +414,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 				__func__, tas_priv->cal_binaryname[i]);
 	}
 
-	tasdevice_prmg_calibdata_load(tas_priv, 0);
+	tasdevice_prmg_load(tas_priv, 0);
 	tas_priv->cur_prog = 0;
 out:
 	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
-- 
2.34.1

