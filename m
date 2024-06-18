Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788190D497
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A58B8845;
	Tue, 18 Jun 2024 16:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A58B8845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718720592;
	bh=owgvG94ctLRlxd224fF3qsnsskhj3HpX39bUjrr4YHQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o6FZrTmFxlzzvZvAi93dES49perR1RvXh6f9+Si4Zhjr1h6q4LEhyHLjExUoU2swt
	 lsSzkRYcCN4bin0pQnWvy4WvNkWENTOdEOP5aBuMDm8GWQ4O5w7aJ/GwO0ffeBWQ2o
	 Lto7C6NMXxDyTA/M68f8KhTWu+OE5OPoatb8y1/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 094E4F805D5; Tue, 18 Jun 2024 16:22:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A812CF805D8;
	Tue, 18 Jun 2024 16:22:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 653C7F800FA; Tue, 18 Jun 2024 15:49:13 +0200 (CEST)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67463F80269
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 15:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67463F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ubxrx2y8
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45I58kjm021062;
	Tue, 18 Jun 2024 07:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=upCJVoWEOu4dqc4l
	0kBAqZ+Zb/2+gNN0VMkcDlM9czc=; b=Ubxrx2y88sy57/cUrIQYLJyKkUa+d3yS
	qVme9VU/c2rG4uqRuu55FLyDd1AwxvKtpZY6zui31ufGJaDQ6FCkdn5tkOlQYqMP
	ZsN9UZfP061Sld43h6LbBxbVKf+wiP1yNuom5HvDYObIbUVW1ArIst65k5hztUpg
	Ny5enlbduvuUp8CVZpRPIzJCIeOThWzJo6ZRYwxWUc6hHO/XDKm0I+uMdAEIHuH4
	/9zE/pCq6gdedGXG3LtQhMwJ3HJvlIyyOqXpFFI1aYPIZ9FgBSmqN9XYA4j++V7O
	2mXJMxbWX+wra5b5Xa6eKSp2optHpOlufb+bZ+Wa/rwLAhCdn2ukhA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by39xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:53:46 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 13:53:43 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 18 Jun 2024 13:53:43 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.31])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 39F8A820248;
	Tue, 18 Jun 2024 12:53:43 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Perform firmware download in the
 background
Date: Tue, 18 Jun 2024 13:53:25 +0100
Message-ID: <20240618125325.61173-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zXNTveN5j-yNgDuGxyjTlpfDylTt_m80
X-Proofpoint-GUID: zXNTveN5j-yNgDuGxyjTlpfDylTt_m80
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JVOWN2J7VUZ72WWQE4L47MB3RVKHLOHQ
X-Message-ID-Hash: JVOWN2J7VUZ72WWQE4L47MB3RVKHLOHQ
X-MailFrom: prvs=3899536243=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JVOWN2J7VUZ72WWQE4L47MB3RVKHLOHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is possible that during system boot when there multiple devices
attempting simultaneous initialization on a slow control bus the
download of firmware and tuning data may take a user perceivable amount
of time (a slow I2C bus with 4 amps this work could take over 2
seconds).

Adopt a pattern used in the ASoC driver and perform this activity in a
background thread so that interactive performance is not impaired. The
system_long_wq is a parallel workqueue and driver instances will perform
their firmware downloads in parallel to make best use of available bus
bandwidth.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 90 ++++++++++++++++++++++++++++++-------
 sound/pci/hda/cs35l56_hda.h |  3 ++
 2 files changed, 76 insertions(+), 17 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index cc4aa90db1d1..96d3f13c5abf 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -50,11 +50,19 @@ static const struct reg_sequence cs35l56_hda_dai_config[] = {
 
 };
 
+static void cs35l56_hda_wait_dsp_ready(struct cs35l56_hda *cs35l56)
+{
+	/* Wait for patching to complete */
+	flush_work(&cs35l56->dsp_work);
+}
+
 static void cs35l56_hda_play(struct cs35l56_hda *cs35l56)
 {
 	unsigned int val;
 	int ret;
 
+	cs35l56_hda_wait_dsp_ready(cs35l56);
+
 	pm_runtime_get_sync(cs35l56->base.dev);
 	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_PLAY);
 	if (ret == 0) {
@@ -180,6 +188,8 @@ static int cs35l56_hda_mixer_get(struct snd_kcontrol *kcontrol,
 	unsigned int reg_val;
 	int i;
 
+	cs35l56_hda_wait_dsp_ready(cs35l56);
+
 	regmap_read(cs35l56->base.regmap, kcontrol->private_value, &reg_val);
 	reg_val &= CS35L56_ASP_TXn_SRC_MASK;
 
@@ -203,6 +213,8 @@ static int cs35l56_hda_mixer_put(struct snd_kcontrol *kcontrol,
 	if (item >= CS35L56_NUM_INPUT_SRC)
 		return -EINVAL;
 
+	cs35l56_hda_wait_dsp_ready(cs35l56);
+
 	regmap_update_bits_check(cs35l56->base.regmap, kcontrol->private_value,
 				 CS35L56_INPUT_MASK, cs35l56_tx_input_values[item],
 				 &changed);
@@ -227,6 +239,8 @@ static int cs35l56_hda_posture_get(struct snd_kcontrol *kcontrol,
 	unsigned int pos;
 	int ret;
 
+	cs35l56_hda_wait_dsp_ready(cs35l56);
+
 	ret = regmap_read(cs35l56->base.regmap, CS35L56_MAIN_POSTURE_NUMBER, &pos);
 	if (ret)
 		return ret;
@@ -248,6 +262,8 @@ static int cs35l56_hda_posture_put(struct snd_kcontrol *kcontrol,
 	    (pos > CS35L56_MAIN_POSTURE_MAX))
 		return -EINVAL;
 
+	cs35l56_hda_wait_dsp_ready(cs35l56);
+
 	ret = regmap_update_bits_check(cs35l56->base.regmap,
 				       CS35L56_MAIN_POSTURE_NUMBER,
 				       CS35L56_MAIN_POSTURE_MASK,
@@ -291,6 +307,8 @@ static int cs35l56_hda_vol_get(struct snd_kcontrol *kcontrol,
 	int vol;
 	int ret;
 
+	cs35l56_hda_wait_dsp_ready(cs35l56);
+
 	ret = regmap_read(cs35l56->base.regmap, CS35L56_MAIN_RENDER_USER_VOLUME, &raw_vol);
 
 	if (ret)
@@ -323,6 +341,8 @@ static int cs35l56_hda_vol_put(struct snd_kcontrol *kcontrol,
 	raw_vol = (vol + CS35L56_MAIN_RENDER_USER_VOLUME_MIN) <<
 		  CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT;
 
+	cs35l56_hda_wait_dsp_ready(cs35l56);
+
 	ret = regmap_update_bits_check(cs35l56->base.regmap,
 				       CS35L56_MAIN_RENDER_USER_VOLUME,
 				       CS35L56_MAIN_RENDER_USER_VOLUME_MASK,
@@ -539,8 +559,9 @@ static void cs35l56_hda_release_firmware_files(const struct firmware *wmfw_firmw
 	kfree(coeff_filename);
 }
 
-static void cs35l56_hda_add_dsp_controls(struct cs35l56_hda *cs35l56)
+static void cs35l56_hda_create_dsp_controls_work(struct work_struct *work)
 {
+	struct cs35l56_hda *cs35l56 = container_of(work, struct cs35l56_hda, control_work);
 	struct hda_cs_dsp_ctl_info info;
 
 	info.device_name = cs35l56->amp_name;
@@ -566,7 +587,7 @@ static void cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
 		dev_info(cs35l56->base.dev, "Calibration applied\n");
 }
 
-static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
+static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 {
 	const struct firmware *coeff_firmware = NULL;
 	const struct firmware *wmfw_firmware = NULL;
@@ -574,15 +595,34 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	char *wmfw_filename = NULL;
 	unsigned int preloaded_fw_ver;
 	bool firmware_missing;
-	int ret = 0;
+	bool add_dsp_controls_required = false;
+	int ret;
+
+	/*
+	 * control_work must be flushed before proceeding, but we can't do that
+	 * here as it would create a deadlock on controls_rwsem so it must be
+	 * performed before queuing dsp_work.
+	 */
+	WARN_ON_ONCE(work_busy(&cs35l56->control_work));
 
-	/* Prepare for a new DSP power-up */
+	/*
+	 * Prepare for a new DSP power-up. If the DSP has had firmware
+	 * downloaded previously then it needs to be powered down so that it
+	 * can be updated and if hadn't been patched before then the controls
+	 * will need to be added once firmware download succeeds.
+	 */
 	if (cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
+	else
+		add_dsp_controls_required = true;
 
 	cs35l56->base.fw_patched = false;
 
-	pm_runtime_get_sync(cs35l56->base.dev);
+	ret = pm_runtime_resume_and_get(cs35l56->base.dev);
+	if (ret < 0) {
+		dev_err(cs35l56->base.dev, "Failed to resume and get %d\n", ret);
+		return;
+	}
 
 	/*
 	 * The firmware can only be upgraded if it is currently running
@@ -606,7 +646,6 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	 */
 	if (!coeff_firmware && firmware_missing) {
 		dev_err(cs35l56->base.dev, ".bin file required but not found\n");
-		ret = -ENOENT;
 		goto err_fw_release;
 	}
 
@@ -659,6 +698,15 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 			  CS35L56_FIRMWARE_MISSING);
 	cs35l56->base.fw_patched = true;
 
+	/*
+	 * Adding controls is deferred to prevent a lock inversion - ALSA takes
+	 * the controls_rwsem when adding a control, the get() / put()
+	 * functions of a control are called holding controls_rwsem and those
+	 * that depend on running firmware wait for dsp_work() to complete.
+	 */
+	if (add_dsp_controls_required)
+		queue_work(system_long_wq, &cs35l56->control_work);
+
 	ret = cs_dsp_run(&cs35l56->cs_dsp);
 	if (ret)
 		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
@@ -678,8 +726,13 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 					   coeff_firmware, coeff_filename);
 err_pm_put:
 	pm_runtime_put(cs35l56->base.dev);
+}
 
-	return ret;
+static void cs35l56_hda_dsp_work(struct work_struct *work)
+{
+	struct cs35l56_hda *cs35l56 = container_of(work, struct cs35l56_hda, dsp_work);
+
+	cs35l56_hda_fw_load(cs35l56);
 }
 
 static int cs35l56_hda_bind(struct device *dev, struct device *master, void *master_data)
@@ -687,7 +740,6 @@ static int cs35l56_hda_bind(struct device *dev, struct device *master, void *mas
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
-	int ret;
 
 	comp = hda_component_from_index(parent, cs35l56->index);
 	if (!comp)
@@ -701,12 +753,10 @@ static int cs35l56_hda_bind(struct device *dev, struct device *master, void *mas
 	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 	comp->playback_hook = cs35l56_hda_playback_hook;
 
-	ret = cs35l56_hda_fw_load(cs35l56);
-	if (ret)
-		return ret;
+	flush_work(&cs35l56->control_work);
+	queue_work(system_long_wq, &cs35l56->dsp_work);
 
 	cs35l56_hda_create_controls(cs35l56);
-	cs35l56_hda_add_dsp_controls(cs35l56);
 
 #if IS_ENABLED(CONFIG_SND_DEBUG)
 	cs35l56->debugfs_root = debugfs_create_dir(dev_name(cs35l56->base.dev), sound_debugfs_root);
@@ -724,6 +774,9 @@ static void cs35l56_hda_unbind(struct device *dev, struct device *master, void *
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
 
+	cancel_work_sync(&cs35l56->dsp_work);
+	cancel_work_sync(&cs35l56->control_work);
+
 	cs35l56_hda_remove_controls(cs35l56);
 
 #if IS_ENABLED(CONFIG_SND_DEBUG)
@@ -752,6 +805,9 @@ static int cs35l56_hda_system_suspend(struct device *dev)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
 
+	cs35l56_hda_wait_dsp_ready(cs35l56);
+	flush_work(&cs35l56->control_work);
+
 	if (cs35l56->playing)
 		cs35l56_hda_pause(cs35l56);
 
@@ -850,11 +906,8 @@ static int cs35l56_hda_system_resume(struct device *dev)
 
 	ret = cs35l56_is_fw_reload_needed(&cs35l56->base);
 	dev_dbg(cs35l56->base.dev, "fw_reload_needed: %d\n", ret);
-	if (ret > 0) {
-		ret = cs35l56_hda_fw_load(cs35l56);
-		if (ret)
-			return ret;
-	}
+	if (ret > 0)
+		queue_work(system_long_wq, &cs35l56->dsp_work);
 
 	if (cs35l56->playing)
 		cs35l56_hda_play(cs35l56);
@@ -972,6 +1025,9 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 	mutex_init(&cs35l56->base.irq_lock);
 	dev_set_drvdata(cs35l56->base.dev, cs35l56);
 
+	INIT_WORK(&cs35l56->dsp_work, cs35l56_hda_dsp_work);
+	INIT_WORK(&cs35l56->control_work, cs35l56_hda_create_dsp_controls_work);
+
 	ret = cs35l56_hda_read_acpi(cs35l56, hid, id);
 	if (ret)
 		goto err;
diff --git a/sound/pci/hda/cs35l56_hda.h b/sound/pci/hda/cs35l56_hda.h
index 464e4aa63cd1..c40d159507c2 100644
--- a/sound/pci/hda/cs35l56_hda.h
+++ b/sound/pci/hda/cs35l56_hda.h
@@ -14,6 +14,7 @@
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/firmware/cirrus/wmfw.h>
 #include <linux/regulator/consumer.h>
+#include <linux/workqueue.h>
 #include <sound/cs35l56.h>
 
 struct dentry;
@@ -21,6 +22,8 @@ struct dentry;
 struct cs35l56_hda {
 	struct cs35l56_base base;
 	struct hda_codec *codec;
+	struct work_struct dsp_work;
+	struct work_struct control_work;
 
 	int index;
 	const char *system_name;
-- 
2.34.1

