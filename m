Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2F8CED78
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2024 04:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B1A207;
	Sat, 25 May 2024 04:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B1A207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716602556;
	bh=2JvUH7J9/DkVVaKfG5q6ARdLQpthQ/3j6tmrXGYLLzc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NJmcGmMKGpXCz8WateRt5ZLkAEMdt3tdJUy1KaMH09ZyvQIhfckA98kEiq8MJjsoG
	 MKMUs6k8L3szFaNq/s8fp0d0LYBW+xiPj45YUBedyGbs0dscizfP0/yFXmVHRrCRC6
	 qRfOKUd4SDtYzfNv6Vh4WPp5BrBatIlDGhVSpRVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C129F80525; Sat, 25 May 2024 04:02:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA53CF80589;
	Sat, 25 May 2024 04:02:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC233F8016B; Sat, 25 May 2024 03:51:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28D49F8016B
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 03:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28D49F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=VCfhVrhD
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44P1ljdl102776;
	Fri, 24 May 2024 20:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716601665;
	bh=Djblu/lsT2mpUzxe6vzZWoZIciazpnIHBEObDq+M9fg=;
	h=From:To:CC:Subject:Date;
	b=VCfhVrhD5ii9WwHTYLqIGERiefAvXvTJ6mK4gRK7JCtwTqTM7qavTRPeXydxL6GPu
	 KzGvEw05BrwCYP1JCPsUaC+ldXocP1m+87uLQtZn+UaOcVb8/J6bXyOslIK3W5tQgH
	 JXf0a7ak5HDVbt8fbm3baXlzm2LXDdsYhkxPNMmw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44P1ljuv017883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 May 2024 20:47:45 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 May 2024 20:47:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 May 2024 20:47:45 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.158])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44P1larF057075;
	Fri, 24 May 2024 20:47:37 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <i-salazar@ti.com>, <linux-kernel@vger.kernel.org>, <j-chadha@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>, <kevin-lu@ti.com>,
        <yuhsuan@google.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <soyer@irl.hu>, <Baojun.Xu@fpt.com>, <judyhsiao@google.com>,
        <navada@ti.com>, <cujomalainey@google.com>, <aanya@ti.com>,
        <nayeem.mahmud@ti.com>, Shenghao
 Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ASoc: tas2781: Playback can work when only RCA binary
 loading without dsp firmware loading
Date: Sat, 25 May 2024 09:47:26 +0800
Message-ID: <20240525014727.197-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: D5R6B4YJUY3GHV7Z7EIA3FC3HX4SE6J4
X-Message-ID-Hash: D5R6B4YJUY3GHV7Z7EIA3FC3HX4SE6J4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5R6B4YJUY3GHV7Z7EIA3FC3HX4SE6J4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In only RCA binary loading case, only default dsp program inside the
chip will be work.

Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - correct comment.
 - Add Fixes.
 - Move header file to the first.
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

