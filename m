Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F65FB4AF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 16:38:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 839B33DFF;
	Tue, 11 Oct 2022 16:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 839B33DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665499108;
	bh=r5cS6hq6PwO4NDcNA80jD7cJSb8F0DPpYCNz+6TvrmM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+f8LRglRE1opjHRs9tNYmkf+stga8EXP2poIymVEUva0E90tF3Rx3p6QUuYiN5W4
	 i+kL5ITUlzyc0yMfXq2BRGE4eeChGXs8UB7FQ7WJRazRsFAkVcEBpqYWHfPELB51Yk
	 TFBdEiW77NP0xbzUmvtGFI42LmCKcqfhfwvwbVig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 877F4F80553;
	Tue, 11 Oct 2022 16:36:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E1FF801D5; Tue, 11 Oct 2022 16:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A10BF802E8
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 16:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A10BF802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="M34IC+jC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B5tp64002064;
 Tue, 11 Oct 2022 09:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=T50Al95xo16TE632hM1pPOnnhfkBsFzckULNsLl5Dg0=;
 b=M34IC+jCMj3DEhiz5bNE+bbPbhR8XDhL32+jaqpB1G2vVphaxM/8nm/wO5PiYmxDDNH7
 gQUFsig7VsXxUu9cpPsyhfv444H/WmW0UGhLQfwOmLjBg8Usia1an6fMbtoEADMcdHg3
 xRt1rhfjnF2fdIz/kYCQxZrNgy+v9XecBr79zDlYw6HyyA1urjeqfuwNkJyhfSoHaABP
 Vo0l+pT11013gAKrznZQZV2dFDJD71V4F9S+KR6x9wLqmSDDkb4dZTHZuIjwOHPTEwTi
 2VwfdzLGbqyMu41L4hLAAtKQfN6nYzbaQ1iKMqD8vd53tgbI/2a5+sF+9ooEq4/dlkMD 5A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3k36m1uhph-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 09:36:16 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 11 Oct
 2022 09:36:13 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Tue, 11 Oct 2022 09:36:13 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8D7AD11DC;
 Tue, 11 Oct 2022 14:36:13 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 5/5] ALSA: hda: cs35l41: Support System Suspend
Date: Tue, 11 Oct 2022 15:35:52 +0100
Message-ID: <20221011143552.621792-6-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011143552.621792-1-sbinding@opensource.cirrus.com>
References: <20221011143552.621792-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QRUy-4emuWVfetDBlGVdFjtxyuPQq2jk
X-Proofpoint-ORIG-GUID: QRUy-4emuWVfetDBlGVdFjtxyuPQq2jk
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for system suspend into the CS35L41 HDA Driver.
Since S4 suspend may power off the system, it is required
that the driver ensure the part is safe to be shutdown before
system suspend, as well as ensuring that the firmware is
unloaded before shutdown. The part must then be restored
on system resume, including re-downloading the firmware.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 160 ++++++++++++++++++++++++++++++------
 1 file changed, 136 insertions(+), 24 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 89f6b4a28d3d7..e5f0549bf06d0 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -461,9 +461,12 @@ static void cs35l41_remove_dsp(struct cs35l41_hda *cs35l41)
 	struct cs_dsp *dsp = &cs35l41->cs_dsp;
 
 	cancel_work_sync(&cs35l41->fw_load_work);
+
+	mutex_lock(&cs35l41->fw_mutex);
 	cs35l41_shutdown_dsp(cs35l41);
 	cs_dsp_remove(dsp);
 	cs35l41->halo_initialized = false;
+	mutex_unlock(&cs35l41->fw_mutex);
 }
 
 /* Protection release cycle to get the speaker out of Safe-Mode */
@@ -570,45 +573,148 @@ static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsi
 				    rx_slot);
 }
 
+static void cs35l41_ready_for_reset(struct cs35l41_hda *cs35l41)
+{
+	mutex_lock(&cs35l41->fw_mutex);
+	if (cs35l41->firmware_running) {
+
+		regcache_cache_only(cs35l41->regmap, false);
+
+		cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
+		cs35l41_shutdown_dsp(cs35l41);
+		cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
+
+		regcache_cache_only(cs35l41->regmap, true);
+		regcache_mark_dirty(cs35l41->regmap);
+	}
+	mutex_unlock(&cs35l41->fw_mutex);
+}
+
+static int cs35l41_system_suspend(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	int ret;
+
+	dev_dbg(cs35l41->dev, "System Suspend\n");
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
+		dev_err(cs35l41->dev, "System Suspend not supported\n");
+		return -EINVAL;
+	}
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	/* Shutdown DSP before system suspend */
+	cs35l41_ready_for_reset(cs35l41);
+
+	/*
+	 * Reset GPIO may be shared, so cannot reset here.
+	 * However beyond this point, amps may be powered down.
+	 */
+	return 0;
+}
+
+static int cs35l41_system_resume(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	int ret;
+
+	dev_dbg(cs35l41->dev, "System Resume\n");
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
+		dev_err(cs35l41->dev, "System Resume not supported\n");
+		return -EINVAL;
+	}
+
+	if (cs35l41->reset_gpio) {
+		usleep_range(2000, 2100);
+		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
+	}
+
+	usleep_range(2000, 2100);
+
+	ret = pm_runtime_force_resume(dev);
+
+	mutex_lock(&cs35l41->fw_mutex);
+	if (!ret && cs35l41->request_fw_load && !cs35l41->fw_request_ongoing) {
+		cs35l41->fw_request_ongoing = true;
+		schedule_work(&cs35l41->fw_load_work);
+	}
+	mutex_unlock(&cs35l41->fw_mutex);
+
+	return ret;
+}
+
 static int cs35l41_runtime_suspend(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	int ret = 0;
 
-	dev_dbg(cs35l41->dev, "Suspend\n");
+	dev_dbg(cs35l41->dev, "Runtime Suspend\n");
 
-	if (!cs35l41->firmware_running)
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
+		dev_dbg(cs35l41->dev, "Runtime Suspend not supported\n");
 		return 0;
+	}
 
-	if (cs35l41_enter_hibernate(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type) < 0)
-		return 0;
+	mutex_lock(&cs35l41->fw_mutex);
+
+	if (cs35l41->playback_started) {
+		regmap_multi_reg_write(cs35l41->regmap, cs35l41_hda_mute,
+				       ARRAY_SIZE(cs35l41_hda_mute));
+		cs35l41_global_enable(cs35l41->regmap, cs35l41->hw_cfg.bst_type, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
+				   CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
+		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
+			regmap_write(cs35l41->regmap, CS35L41_GPIO1_CTRL1, 0x00000001);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
+				   CS35L41_VMON_EN_MASK | CS35L41_IMON_EN_MASK,
+				   0 << CS35L41_VMON_EN_SHIFT | 0 << CS35L41_IMON_EN_SHIFT);
+		cs35l41->playback_started = false;
+	}
+
+	if (cs35l41->firmware_running) {
+		ret = cs35l41_enter_hibernate(cs35l41->dev, cs35l41->regmap,
+					      cs35l41->hw_cfg.bst_type);
+		if (ret)
+			goto err;
+	} else {
+		cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
+	}
 
 	regcache_cache_only(cs35l41->regmap, true);
 	regcache_mark_dirty(cs35l41->regmap);
 
-	return 0;
+err:
+	mutex_unlock(&cs35l41->fw_mutex);
+
+	return ret;
 }
 
 static int cs35l41_runtime_resume(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
-	int ret;
+	int ret = 0;
 
-	dev_dbg(cs35l41->dev, "Resume.\n");
+	dev_dbg(cs35l41->dev, "Runtime Resume\n");
 
 	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
-		dev_dbg(cs35l41->dev, "System does not support Resume\n");
+		dev_dbg(cs35l41->dev, "Runtime Resume not supported\n");
 		return 0;
 	}
 
-	if (!cs35l41->firmware_running)
-		return 0;
+	mutex_lock(&cs35l41->fw_mutex);
 
 	regcache_cache_only(cs35l41->regmap, false);
 
-	ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
-	if (ret) {
-		regcache_cache_only(cs35l41->regmap, true);
-		return ret;
+	if (cs35l41->firmware_running)	{
+		ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
+		if (ret) {
+			dev_warn(cs35l41->dev, "Unable to exit Hibernate.");
+			goto err;
+		}
 	}
 
 	/* Test key needs to be unlocked to allow the OTP settings to re-apply */
@@ -617,13 +723,16 @@ static int cs35l41_runtime_resume(struct device *dev)
 	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
 	if (ret) {
 		dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
-		return ret;
+		goto err;
 	}
 
 	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
 		cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, &cs35l41->hw_cfg);
 
-	return 0;
+err:
+	mutex_unlock(&cs35l41->fw_mutex);
+
+	return ret;
 }
 
 static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
@@ -673,8 +782,6 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 
 static void cs35l41_load_firmware(struct cs35l41_hda *cs35l41, bool load)
 {
-	pm_runtime_get_sync(cs35l41->dev);
-
 	if (cs35l41->firmware_running && !load) {
 		dev_dbg(cs35l41->dev, "Unloading Firmware\n");
 		cs35l41_shutdown_dsp(cs35l41);
@@ -684,9 +791,6 @@ static void cs35l41_load_firmware(struct cs35l41_hda *cs35l41, bool load)
 	} else {
 		dev_dbg(cs35l41->dev, "Unable to Load firmware.\n");
 	}
-
-	pm_runtime_mark_last_busy(cs35l41->dev);
-	pm_runtime_put_autosuspend(cs35l41->dev);
 }
 
 static int cs35l41_fw_load_ctl_get(struct snd_kcontrol *kcontrol,
@@ -702,16 +806,21 @@ static void cs35l41_fw_load_work(struct work_struct *work)
 {
 	struct cs35l41_hda *cs35l41 = container_of(work, struct cs35l41_hda, fw_load_work);
 
+	pm_runtime_get_sync(cs35l41->dev);
+
 	mutex_lock(&cs35l41->fw_mutex);
 
 	/* Recheck if playback is ongoing, mutex will block playback during firmware loading */
 	if (cs35l41->playback_started)
-		dev_err(cs35l41->dev, "Cannot Load/Unload firmware during Playback\n");
+		dev_err(cs35l41->dev, "Cannot Load/Unload firmware during Playback. Retrying...\n");
 	else
 		cs35l41_load_firmware(cs35l41, cs35l41->request_fw_load);
 
 	cs35l41->fw_request_ongoing = false;
 	mutex_unlock(&cs35l41->fw_mutex);
+
+	pm_runtime_mark_last_busy(cs35l41->dev);
+	pm_runtime_put_autosuspend(cs35l41->dev);
 }
 
 static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
@@ -835,6 +944,8 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	pm_runtime_get_sync(dev);
 
+	mutex_lock(&cs35l41->fw_mutex);
+
 	comps->dev = dev;
 	if (!cs35l41->acpi_subsystem_id)
 		cs35l41->acpi_subsystem_id = kasprintf(GFP_KERNEL, "%.8x",
@@ -847,10 +958,8 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	if (firmware_autostart) {
 		dev_dbg(cs35l41->dev, "Firmware Autostart.\n");
 		cs35l41->request_fw_load = true;
-		mutex_lock(&cs35l41->fw_mutex);
 		if (cs35l41_smart_amp(cs35l41) < 0)
 			dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
-		mutex_unlock(&cs35l41->fw_mutex);
 	} else {
 		dev_dbg(cs35l41->dev, "Firmware Autostart is disabled.\n");
 	}
@@ -859,6 +968,8 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	comps->playback_hook = cs35l41_hda_playback_hook;
 
+	mutex_unlock(&cs35l41->fw_mutex);
+
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
@@ -1426,6 +1537,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l41_hda_remove, SND_HDA_SCODEC_CS35L41);
 
 const struct dev_pm_ops cs35l41_hda_pm_ops = {
 	RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend, cs35l41_system_resume)
 };
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, SND_HDA_SCODEC_CS35L41);
 
-- 
2.34.1

