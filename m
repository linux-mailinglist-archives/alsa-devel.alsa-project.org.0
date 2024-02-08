Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9149884E0CE
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 13:38:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC9AF85D;
	Thu,  8 Feb 2024 13:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC9AF85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707395932;
	bh=HZzncMa1loKAptgv6gflUpOFjRo79b9uJM1kXN47xGc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i5dRciLgca/8rvImQ3V2Ttjx2d6xGz0BTHJjN6Z1aJkux9UMko2BILsRQDLUXJdgd
	 IgLPaeRTeKSC5tV+On/BHVFKXT4/bTPOaqZMWP9qvwTs0RzrgQrT1aPj2q0L/X41oy
	 bpE4HKkCpjr7a+zFqPzRzFYSZAnuWOgP3WWKB0hs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9476F80587; Thu,  8 Feb 2024 13:38:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1908CF805A0;
	Thu,  8 Feb 2024 13:38:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47792F801EB; Thu,  8 Feb 2024 13:38:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88335F800EE
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 13:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88335F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bDjnh/MN
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4186JW3N008734;
	Thu, 8 Feb 2024 06:37:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=7
	4XCr7k1XvhAmhVcog1O5kNHi22exXfgDeHijOgc4xY=; b=bDjnh/MN29+klW2+e
	Ew+M9lPoQZTWpD7dAijxTDK3j51ix1yw542icHT4JnmCmjnTy/DAnEBs7Zgnnos8
	1W8nErV5Bj2IrQL/yAMFSuTgBNGMuXbAVzd5bvBtOds0TchdSWad2um66V5fKmPJ
	L9IgQX/aufrhe4KiYatryn1ODFyE9YL22/y5eq6gKDwB1mRqlt2IAQheGOsVzRR3
	FrlODMi9qZwzfTabB8akyp4vE7B20teBQKs3NiyRmGEvLksmaCu3uqc/HzJS06Sw
	8rFFNaQhXWir/MugUVEXU8I6ycD+Db++iRP2SQLFhUCxYhTTeNnUmYnLmclvEvPC
	G0saA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2efqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 06:37:45 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 8 Feb
 2024 12:37:43 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 8 Feb 2024 12:37:43 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 03891820243;
	Thu,  8 Feb 2024 12:37:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: cs35l56: Fix deadlock in ASP1 mixer register
 initialization
Date: Thu, 8 Feb 2024 12:37:42 +0000
Message-ID: <20240208123742.1278104-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OhepnhnjI61Oe4jBOFSHOemIu85yXJzc
X-Proofpoint-ORIG-GUID: OhepnhnjI61Oe4jBOFSHOemIu85yXJzc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XRKN4AFZIHTT7GQJKJSSG2VOVCEBFMTU
X-Message-ID-Hash: XRKN4AFZIHTT7GQJKJSSG2VOVCEBFMTU
X-MailFrom: prvs=9768041b6e=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRKN4AFZIHTT7GQJKJSSG2VOVCEBFMTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rewrite the handling of ASP1 TX mixer mux initialization to prevent a
deadlock during component_remove().

The firmware can overwrite the ASP1 TX mixer registers with
system-specific settings. This is mainly for hardware that uses the
ASP as a chip-to-chip link controlled by the firmware. Because of this
the driver cannot know the starting state of the ASP1 mixer muxes until
the firmware has been downloaded and rebooted.

The original workaround for this was to queue a work function from the
dsp_work() job. This work then read the register values (populating the
regmap cache the first time around) and then called
snd_soc_dapm_mux_update_power(). The problem with this is that it was
ultimately triggered by cs35l56_component_probe() queueing dsp_work,
which meant that it would be running in parallel with the rest of the
ASoC component and card initialization. To prevent accessing DAPM before
it was fully initialized the work function took the card mutex. But this
would deadlock if cs35l56_component_remove() was called before the work job
had completed, because ASoC calls component_remove() with the card mutex
held.

This new version removes the work function. Instead the regmap cache and
DAPM mux widgets are initialized the first time any of the associated ALSA
controls is read or written.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 07f7d6e7a124 ("ASoC: cs35l56: Fix for initializing ASP1 mixer registers")
---
Change from V1:
Move the check of asp1_mixer_widgets_initialized into
cs35l56_sync_asp1_mixer_widgets_with_firmware().
---
 sound/soc/codecs/cs35l56.c | 157 +++++++++++++++++--------------------
 sound/soc/codecs/cs35l56.h |   2 +-
 2 files changed, 75 insertions(+), 84 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index ebed5ab1245b..98d3957c66e7 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -68,6 +68,66 @@ static const char * const cs35l56_asp1_mux_control_names[] = {
 	"ASP1 TX1 Source", "ASP1 TX2 Source", "ASP1 TX3 Source", "ASP1 TX4 Source"
 };
 
+static int cs35l56_sync_asp1_mixer_widgets_with_firmware(struct cs35l56_private *cs35l56)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cs35l56->component);
+	const char *prefix = cs35l56->component->name_prefix;
+	char full_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	const char *name;
+	struct snd_kcontrol *kcontrol;
+	struct soc_enum *e;
+	unsigned int val[4];
+	int i, item, ret;
+
+	if (cs35l56->asp1_mixer_widgets_initialized)
+		return 0;
+
+	/*
+	 * Resume so we can read the registers from silicon if the regmap
+	 * cache has not yet been populated.
+	 */
+	ret = pm_runtime_resume_and_get(cs35l56->base.dev);
+	if (ret < 0)
+		return ret;
+
+	/* Wait for firmware download and reboot */
+	cs35l56_wait_dsp_ready(cs35l56);
+
+	ret = regmap_bulk_read(cs35l56->base.regmap, CS35L56_ASP1TX1_INPUT,
+			       val, ARRAY_SIZE(val));
+
+	pm_runtime_mark_last_busy(cs35l56->base.dev);
+	pm_runtime_put_autosuspend(cs35l56->base.dev);
+
+	if (ret) {
+		dev_err(cs35l56->base.dev, "Failed to read ASP1 mixer regs: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cs35l56_asp1_mux_control_names); ++i) {
+		name = cs35l56_asp1_mux_control_names[i];
+
+		if (prefix) {
+			snprintf(full_name, sizeof(full_name), "%s %s", prefix, name);
+			name = full_name;
+		}
+
+		kcontrol = snd_soc_card_get_kcontrol(dapm->card, name);
+		if (!kcontrol) {
+			dev_warn(cs35l56->base.dev, "Could not find control %s\n", name);
+			continue;
+		}
+
+		e = (struct soc_enum *)kcontrol->private_value;
+		item = snd_soc_enum_val_to_item(e, val[i] & CS35L56_ASP_TXn_SRC_MASK);
+		snd_soc_dapm_mux_update_power(dapm, kcontrol, item, e, NULL);
+	}
+
+	cs35l56->asp1_mixer_widgets_initialized = true;
+
+	return 0;
+}
+
 static int cs35l56_dspwait_asp1tx_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
@@ -78,9 +138,9 @@ static int cs35l56_dspwait_asp1tx_get(struct snd_kcontrol *kcontrol,
 	unsigned int addr, val;
 	int ret;
 
-	/* Wait for mux to be initialized */
-	cs35l56_wait_dsp_ready(cs35l56);
-	flush_work(&cs35l56->mux_init_work);
+	ret = cs35l56_sync_asp1_mixer_widgets_with_firmware(cs35l56);
+	if (ret)
+		return ret;
 
 	addr = cs35l56_asp1_mixer_regs[index];
 	ret = regmap_read(cs35l56->base.regmap, addr, &val);
@@ -106,9 +166,9 @@ static int cs35l56_dspwait_asp1tx_put(struct snd_kcontrol *kcontrol,
 	bool changed;
 	int ret;
 
-	/* Wait for mux to be initialized */
-	cs35l56_wait_dsp_ready(cs35l56);
-	flush_work(&cs35l56->mux_init_work);
+	ret = cs35l56_sync_asp1_mixer_widgets_with_firmware(cs35l56);
+	if (ret)
+		return ret;
 
 	addr = cs35l56_asp1_mixer_regs[index];
 	val = snd_soc_enum_item_to_val(e, item);
@@ -124,70 +184,6 @@ static int cs35l56_dspwait_asp1tx_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
-static void cs35l56_mark_asp1_mixer_widgets_dirty(struct cs35l56_private *cs35l56)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cs35l56->component);
-	const char *prefix = cs35l56->component->name_prefix;
-	char full_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	const char *name;
-	struct snd_kcontrol *kcontrol;
-	struct soc_enum *e;
-	unsigned int val[4];
-	int i, item, ret;
-
-	/*
-	 * Resume so we can read the registers from silicon if the regmap
-	 * cache has not yet been populated.
-	 */
-	ret = pm_runtime_resume_and_get(cs35l56->base.dev);
-	if (ret < 0)
-		return;
-
-	ret = regmap_bulk_read(cs35l56->base.regmap, CS35L56_ASP1TX1_INPUT,
-			       val, ARRAY_SIZE(val));
-
-	pm_runtime_mark_last_busy(cs35l56->base.dev);
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
-
-	if (ret) {
-		dev_err(cs35l56->base.dev, "Failed to read ASP1 mixer regs: %d\n", ret);
-		return;
-	}
-
-	snd_soc_card_mutex_lock(dapm->card);
-	WARN_ON(!dapm->card->instantiated);
-
-	for (i = 0; i < ARRAY_SIZE(cs35l56_asp1_mux_control_names); ++i) {
-		name = cs35l56_asp1_mux_control_names[i];
-
-		if (prefix) {
-			snprintf(full_name, sizeof(full_name), "%s %s", prefix, name);
-			name = full_name;
-		}
-
-		kcontrol = snd_soc_card_get_kcontrol(dapm->card, name);
-		if (!kcontrol) {
-			dev_warn(cs35l56->base.dev, "Could not find control %s\n", name);
-			continue;
-		}
-
-		e = (struct soc_enum *)kcontrol->private_value;
-		item = snd_soc_enum_val_to_item(e, val[i] & CS35L56_ASP_TXn_SRC_MASK);
-		snd_soc_dapm_mux_update_power(dapm, kcontrol, item, e, NULL);
-	}
-
-	snd_soc_card_mutex_unlock(dapm->card);
-}
-
-static void cs35l56_mux_init_work(struct work_struct *work)
-{
-	struct cs35l56_private *cs35l56 = container_of(work,
-						       struct cs35l56_private,
-						       mux_init_work);
-
-	cs35l56_mark_asp1_mixer_widgets_dirty(cs35l56);
-}
-
 static DECLARE_TLV_DB_SCALE(vol_tlv, -10000, 25, 0);
 
 static const struct snd_kcontrol_new cs35l56_controls[] = {
@@ -936,14 +932,6 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	else
 		cs35l56_patch(cs35l56, firmware_missing);
 
-
-	/*
-	 * Set starting value of ASP1 mux widgets. Updating a mux takes
-	 * the DAPM mutex. Post this to a separate job so that DAPM
-	 * power-up can wait for dsp_work to complete without deadlocking
-	 * on the DAPM mutex.
-	 */
-	queue_work(cs35l56->dsp_wq, &cs35l56->mux_init_work);
 err:
 	pm_runtime_mark_last_busy(cs35l56->base.dev);
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
@@ -989,6 +977,13 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 	debugfs_create_bool("can_hibernate", 0444, debugfs_root, &cs35l56->base.can_hibernate);
 	debugfs_create_bool("fw_patched", 0444, debugfs_root, &cs35l56->base.fw_patched);
 
+	/*
+	 * The widgets for the ASP1TX mixer can't be initialized
+	 * until the firmware has been downloaded and rebooted.
+	 */
+	regcache_drop_region(cs35l56->base.regmap, CS35L56_ASP1TX1_INPUT, CS35L56_ASP1TX4_INPUT);
+	cs35l56->asp1_mixer_widgets_initialized = false;
+
 	queue_work(cs35l56->dsp_wq, &cs35l56->dsp_work);
 
 	return 0;
@@ -999,7 +994,6 @@ static void cs35l56_component_remove(struct snd_soc_component *component)
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
 
 	cancel_work_sync(&cs35l56->dsp_work);
-	cancel_work_sync(&cs35l56->mux_init_work);
 
 	if (cs35l56->dsp.cs_dsp.booted)
 		wm_adsp_power_down(&cs35l56->dsp);
@@ -1070,10 +1064,8 @@ int cs35l56_system_suspend(struct device *dev)
 
 	dev_dbg(dev, "system_suspend\n");
 
-	if (cs35l56->component) {
+	if (cs35l56->component)
 		flush_work(&cs35l56->dsp_work);
-		cancel_work_sync(&cs35l56->mux_init_work);
-	}
 
 	/*
 	 * The interrupt line is normally shared, but after we start suspending
@@ -1224,7 +1216,6 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 		return -ENOMEM;
 
 	INIT_WORK(&cs35l56->dsp_work, cs35l56_dsp_work);
-	INIT_WORK(&cs35l56->mux_init_work, cs35l56_mux_init_work);
 
 	dsp = &cs35l56->dsp;
 	cs35l56_init_cs_dsp(&cs35l56->base, &dsp->cs_dsp);
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 596b141e3f96..b000e7365e40 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -34,7 +34,6 @@ struct cs35l56_private {
 	struct wm_adsp dsp; /* must be first member */
 	struct cs35l56_base base;
 	struct work_struct dsp_work;
-	struct work_struct mux_init_work;
 	struct workqueue_struct *dsp_wq;
 	struct snd_soc_component *component;
 	struct regulator_bulk_data supplies[CS35L56_NUM_BULK_SUPPLIES];
@@ -52,6 +51,7 @@ struct cs35l56_private {
 	u8 asp_slot_count;
 	bool tdm_mode;
 	bool sysclk_set;
+	bool asp1_mixer_widgets_initialized;
 	u8 old_sdw_clock_scale;
 };
 
-- 
2.30.2

