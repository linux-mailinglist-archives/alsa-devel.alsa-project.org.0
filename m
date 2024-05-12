Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 780A58C34E5
	for <lists+alsa-devel@lfdr.de>; Sun, 12 May 2024 04:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD40085D;
	Sun, 12 May 2024 04:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD40085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715482422;
	bh=I351u7aT7I6ouH4KN0hZjNx1w49MRdZV/3oL7OssEN0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gJwngxvx6wSsEh5+Jx4tUOMTKNHp8JVJSgIqGcOVICeSke3Vn6nyBQs9RFa7u9pxY
	 YWpcnZlRezvaxwaeazx+Ej0teMmvmXYVLm/1EowmoQvjWL003/6iY2odNYPJHCHIJv
	 vMgxceAZl37qhiLmLAEXkbhqO2D5tgdKwdoUQ5sg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC1A6F805B0; Sun, 12 May 2024 04:53:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB147F8059F;
	Sun, 12 May 2024 04:53:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDC2BF8025F; Sun, 12 May 2024 04:51:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A208CF800F5
	for <alsa-devel@alsa-project.org>; Sun, 12 May 2024 04:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A208CF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ffhwuBoj
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44C2p1O6130087;
	Sat, 11 May 2024 21:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715482261;
	bh=v/JP+TebD92PX87mV21Jf/D0L7YhRppUzC72Kr69hSk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ffhwuBoj8AF1Vm44ZoTPhyVNw4MQNI6hTYnRYzHbONQ2K7BTVExC1VltNo4njogVT
	 6uPTCDmSX4uQOL2xWcVhNfIQT2iQCyU/xLzaCYQEsl/gzjWRA5B870W67sRJEazohf
	 9KZPx6U8LSninL3GP++S2Q2XbcSs1jPs308B7WWM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44C2p1cB062281
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 11 May 2024 21:51:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 21:51:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 21:51:00 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.109])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44C2ojfQ039978;
	Sat, 11 May 2024 21:50:54 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <bard.liao@intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kevin-lu@ti.com>, <cameron.berkenpas@gmail.com>, <tiwai@suse.de>,
        <baojun.xu@ti.com>, <soyer@irl.hu>, <Baojun.Xu@fpt.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v5 2/3] ASoC: tas2781: Fix wrong loading calibrated data
 sequence
Date: Sun, 12 May 2024 10:50:38 +0800
Message-ID: <20240512025040.1276-2-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20240512025040.1276-1-shenghao-ding@ti.com>
References: <20240512025040.1276-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: C6HUHACY6EBDVQLJCOQF5OOUEWTODZDU
X-Message-ID-Hash: C6HUHACY6EBDVQLJCOQF5OOUEWTODZDU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6HUHACY6EBDVQLJCOQF5OOUEWTODZDU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Calibrated data will be set to default after loading DSP config params,
which will cause speaker protection work abnormally. Reload calibrated
data after loading DSP config params.

Fixes: ef3bcde75d06 ("ASoc: tas2781: Add tas2781 driver")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v5:
 - No change.
v4:
 - Use the the culprit of the bug itself as the fixes tag.
 - Better variant for tasdev_load_calibrated_data in order to much easier
   to read and understand and maintain, as it makes harder to squeeze the
   code.
 - Fix the indentation and move operator to the previous line.
v3:
 - Remove redundant return in tasdev_load_calibrated_data
 - Put the second function parameter into the previous line for
   tasdev_load_calibrated_data
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes: https://lore.kernel.org/oe-kbuild-all/202405021200.YHInjV43-lkp@intel.com/
v2:
 - In the Subject, fixed --> Fix
 - In tas2781-fmwlib.c, tasdevice-fmw.c ---> tas2781-fmwlib.c
 - dsp --> DSP
 - Remove unneeded parentheses for & (dereference) operator
 - Add Fixes tag
v1:
 - Download calibrated data after loading the new DSP config params
 - call tasdevice_prmg_load instead of tasdevice_prmg_calibdata_load, it
   is unnecessary to load calibrated data after loading DSP program. Load
   it after loading DSP config params each time.
 - Remove tasdevice_prmg_calibdata_load, because it is unnecessary to load
   calibrated data after loading DSP program.
---
 sound/soc/codecs/tas2781-fmwlib.c | 103 ++++++++----------------------
 1 file changed, 27 insertions(+), 76 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index a6be81adcb83..265a8ca25cbb 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2151,6 +2151,24 @@ static int tasdevice_load_data(struct tasdevice_priv *tas_priv,
 	return ret;
 }
 
+static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
+{
+	struct tasdevice_calibration *cal;
+	struct tasdevice_fw *cal_fmw;
+
+	cal_fmw = priv->tasdevice[i].cali_data_fmw;
+
+	/* No calibrated data for current devices, playback will go ahead. */
+	if (!cal_fmw)
+		return;
+
+	cal = cal_fmw->calibrations;
+	if (cal)
+		return;
+
+	load_calib_data(priv, &cal->dev_data);
+}
+
 int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 	int cfg_no, int rca_conf_no)
 {
@@ -2210,21 +2228,9 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
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
+			if (tas_priv->tasdevice[i].is_loaderr == false &&
+				tas_priv->tasdevice[i].is_loading == true)
 				tas_priv->tasdevice[i].cur_prog = prm_no;
-			}
 		}
 	}
 
@@ -2245,11 +2251,15 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 		tasdevice_load_data(tas_priv, &(conf->dev_data));
 		for (i = 0; i < tas_priv->ndev; i++) {
 			if (tas_priv->tasdevice[i].is_loaderr == true) {
-				status |= 1 << (i + 4);
+				status |= BIT(i + 4);
 				continue;
-			} else if (tas_priv->tasdevice[i].is_loaderr == false
-				&& tas_priv->tasdevice[i].is_loading == true)
+			}
+
+			if (tas_priv->tasdevice[i].is_loaderr == false &&
+				tas_priv->tasdevice[i].is_loading == true) {
+				tasdev_load_calibrated_data(tas_priv, i);
 				tas_priv->tasdevice[i].cur_conf = cfg_no;
+			}
 		}
 	} else
 		dev_dbg(tas_priv->dev, "%s: Unneeded loading dsp conf %d\n",
@@ -2308,65 +2318,6 @@ int tasdevice_prmg_load(void *context, int prm_no)
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
-- 
2.34.1

