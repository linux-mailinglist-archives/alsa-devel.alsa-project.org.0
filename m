Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FC8CCBF9
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 08:02:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 395F8828;
	Thu, 23 May 2024 08:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 395F8828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716444171;
	bh=GiC1/29g+riWl9jigqmNj06ehPx8Mc9F/yQNF8jHzww=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MS1KLElndJ7NsaR6VnIwlj9sPUrWosxuNtRE0vwNKCS0+74etEEC5gFy1CFHIBVt1
	 9DN1CF8xHO3QUrc+4NkoL0HtXhFLxpslqCuKA7YJqgeo14DziNrWZyIxkSNF+4EFHw
	 rKpCAx2M9CnBSa+js31sU5gZMy2JtxzTu8IxM3DE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53547F80587; Thu, 23 May 2024 08:02:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 119B6F805A0;
	Thu, 23 May 2024 08:02:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00DF8F8026A; Thu, 23 May 2024 08:01:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74156F800BA
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 08:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74156F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=UBEdAASG
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44N610ce017771;
	Thu, 23 May 2024 01:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716444060;
	bh=flB9YyX59B3W/vLZiFwnfLNmPjVnTHkd549ZfjsYUhQ=;
	h=From:To:CC:Subject:Date;
	b=UBEdAASGRmSJymRWCTcTsHh+sUcR5/imTpFhN2+zWzM8TBo6NQWBjFDiC2KRIJBY0
	 +RGOYsPXYrOoLvmyk9+3RGw48yOcCoa6Yz1dk+Hl92Z6vSyDNkhNsL6kEtbboEnd1E
	 7mtYObwvSL+qytkYnS2mn+oXJDND/Kw2iKaIkoxo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44N610aL110322
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2024 01:01:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 May 2024 01:01:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 May 2024 01:01:00 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44N60p8t109680;
	Thu, 23 May 2024 01:00:52 -0500
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
Subject: [PATCH v1] ASoc: tas2781: Support still work when only RCA binary
 loading well without dsp firmware loading.
Date: Thu, 23 May 2024 14:00:46 +0800
Message-ID: <20240523060047.934-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: BYZ2ID7U5MATLW3UI2GTHKSBXUEYXNKK
X-Message-ID-Hash: BYZ2ID7U5MATLW3UI2GTHKSBXUEYXNKK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYZ2ID7U5MATLW3UI2GTHKSBXUEYXNKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In only RCA binary loading case, only default dsp program will be work
inside the chip.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Split out the different logical changes into different patches.
 - rename tasdevice_dsp_fw_state -> tasdevice_fw_state, the fw are not
   only dsp fw, but also RCA(Reconfigurable data, such as acoustic data
   and register setting, etc).
 - Add TASDEVICE_RCA_FW_OK in tasdevice_fw_state to identify the state
   that only RCA binary file has been download successfully, but dsp fw
   is not loaded or loading failure.
 - Add the this strategy into tasdevice_tuning_switch.
 - If one side of the if/else has a braces both should in
   tasdevice_tuning_switch.
 - Identify whehter both RCA and DSP have been loaded or only RCA has
   been loaded in tasdevice_fw_ready.
 - Add check fw load status in tasdevice_startup.
 - remove ret in tasdevice_startup to make th code neater.
---
 include/sound/tas2781-dsp.h       |  3 ++-
 sound/soc/codecs/tas2781-fmwlib.c | 14 ++++++++++----
 sound/soc/codecs/tas2781-i2c.c    | 30 ++++++++++++++++++------------
 3 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index 7fba7ea26a4b..92d68ca5eafb 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -117,10 +117,11 @@ struct tasdevice_fw {
 	struct device *dev;
 };
 
-enum tasdevice_dsp_fw_state {
+enum tasdevice_fw_state {
 	TASDEVICE_DSP_FW_NONE = 0,
 	TASDEVICE_DSP_FW_PENDING,
 	TASDEVICE_DSP_FW_FAIL,
+	TASDEVICE_RCA_FW_OK,
 	TASDEVICE_DSP_FW_ALL_OK,
 };
 
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 265a8ca25cbb..cfa022ef4a59 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2324,13 +2324,18 @@ void tasdevice_tuning_switch(void *context, int state)
 	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
 	int profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
 
-	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
-		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
+	/*
+	 * Only RCA file loaded can still work with default dsp program inside
+	 * the chip?
+	 */
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
@@ -2340,9 +2345,10 @@ void tasdevice_tuning_switch(void *context, int state)
 
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
index 9350972dfefe..ccb9313ada9b 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -380,23 +380,30 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
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
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
@@ -417,9 +424,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
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
@@ -466,14 +472,14 @@ static int tasdevice_startup(struct snd_pcm_substream *substream,
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
-- 
2.34.1

