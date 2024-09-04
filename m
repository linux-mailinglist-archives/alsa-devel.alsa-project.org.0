Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D823296C1AA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 17:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CDD7E68;
	Wed,  4 Sep 2024 17:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CDD7E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725462198;
	bh=x5Nx4ct5hyK2L8F01Nx8EJBqGAXRQ7rz8KD9xZv3ed8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J3/HpjCjSx85DXjzCzwDQjQ0MLcsoYLL7ar6uj+7RlSu0anBmi1AHekAzNhw7ZD8y
	 hL6o+F45ODXMnCOY4rkn8N7UlTIRHW+XkNa4oy9uCmlm7XRGWusJx+LDaP+xIwp+FF
	 i6VE1PmEj4TZt82gh6SpmBpUKVnCA2McpMFYeAP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21688F8032D; Wed,  4 Sep 2024 17:02:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFFEF805AE;
	Wed,  4 Sep 2024 17:02:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54834F80199; Wed,  4 Sep 2024 17:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21D95F800E9
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 17:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21D95F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WQVXoPeM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48460H9o006762;
	Wed, 4 Sep 2024 07:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=bKSRV2sIZekglWVM
	oUOEpC8VA+MWNg300xODnmmnZFY=; b=WQVXoPeMXfQylkt1duq4Kcc10Vi3LYXz
	0zEH86JhU1rD7aInW+F3OGGGhE0a1de4RLvMaQcHDr8hqf0FRK50kZ2HjUgh0DFE
	NZvW8dDiBEcP/Zq7OYwg4d33YsXsEgDvIYD/zoPL4zuBsOeQWOvgGcP3wKJqiyed
	RKQMu2JwjE6t6ncCRRgeeVkQQDYkLcx0ro2c9IFwBOPVlko0qXMa6ReOe5xcaK52
	KOkbcE1mqTWY0hZwhdtMswaIqz2mUMn/PdMePiZJ2gCLToXQRr/svoVv3f9LExTK
	fS8L7n/DifBnN77Wht2pSuXZ/jnFFDdIk/lOQLBLUKfPkGdchH++Wg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41c0jxcjka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 07:07:08 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 13:07:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 4 Sep 2024 13:07:05 +0100
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com
 [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 35B81820249;
	Wed,  4 Sep 2024 12:07:05 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC/HDA cs35l56: Remove redundant IRQ handling
Date: Wed, 4 Sep 2024 12:07:00 +0000
Message-ID: <20240904120700.188644-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Xq1YhtP0X_u3NK8h_9aeeY9SRifmE9mT
X-Proofpoint-GUID: Xq1YhtP0X_u3NK8h_9aeeY9SRifmE9mT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VSYRVCBKHTB6LGTRAVYQ5KBGK6PMAIAW
X-Message-ID-Hash: VSYRVCBKHTB6LGTRAVYQ5KBGK6PMAIAW
X-MailFrom: prvs=6977ef6907=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSYRVCBKHTB6LGTRAVYQ5KBGK6PMAIAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The IRQ handling in the cs35l56 driver was purely informational. It was
not necessary to support the HDA or ASoC driver functionality and added
unnecessary complexity to the drivers.

As the IRQ signal GPIO line could be connected and shared with other
components the handling is replaced with a regmap patch to ensure the
cs35l56 IRQ sources are masked and will not generate interrupts that go
unhandled.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
v1 - As this changes both the ASoC and HDA cs35l56 device drivers we
     considered a series of patches that stepped through the removal of
     the common code but thought that the co-ordination would be
     unnecessarily complicated so we initially offer a combined patch
     that that applies to both Mark and Takashi's for-next branches so
     that either route can be taken.

 include/sound/cs35l56.h           |   4 --
 sound/pci/hda/cs35l56_hda.c       |  53 +--------------
 sound/pci/hda/cs35l56_hda_i2c.c   |   9 +--
 sound/pci/hda/cs35l56_hda_spi.c   |   9 +--
 sound/soc/codecs/cs35l56-i2c.c    |   2 -
 sound/soc/codecs/cs35l56-sdw.c    | 104 +-----------------------------
 sound/soc/codecs/cs35l56-shared.c | 101 +----------------------------
 sound/soc/codecs/cs35l56-spi.c    |   2 -
 sound/soc/codecs/cs35l56.c        |  92 ++------------------------
 sound/soc/codecs/cs35l56.h        |  10 ---
 10 files changed, 14 insertions(+), 372 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 94e8185c4795..acc43d85f5df 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -257,8 +257,6 @@
 struct cs35l56_base {
 	struct device *dev;
 	struct regmap *regmap;
-	int irq;
-	struct mutex irq_lock;
 	u8 type;
 	u8 rev;
 	bool init_done;
@@ -298,8 +296,6 @@ int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base);
 void cs35l56_wait_control_port_ready(void);
 void cs35l56_wait_min_reset_pulse(void);
 void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire);
-int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq);
-irqreturn_t cs35l56_irq(int irq, void *data);
 int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base);
 int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base);
 int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_soundwire);
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 31cc92bac89a..8ec06a3f4765 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -626,8 +626,6 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		goto err_fw_release;
 	}
 
-	mutex_lock(&cs35l56->base.irq_lock);
-
 	/*
 	 * If the firmware hasn't been patched it must be shutdown before
 	 * doing a full patch and reset afterwards. If it is already
@@ -637,14 +635,14 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
 		ret = cs35l56_firmware_shutdown(&cs35l56->base);
 		if (ret)
-			goto err;
+			goto err_fw_release;
 	}
 
 	ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
 			      coeff_firmware, coeff_filename, "misc");
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
-		goto err;
+		goto err_fw_release;
 	}
 
 	if (wmfw_filename)
@@ -687,8 +685,6 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 err_powered_up:
 	if (!cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
-err:
-	mutex_unlock(&cs35l56->base.irq_lock);
 err_fw_release:
 	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
 					   coeff_firmware, coeff_filename);
@@ -778,15 +774,6 @@ static int cs35l56_hda_system_suspend(struct device *dev)
 
 	cs35l56->suspended = true;
 
-	/*
-	 * The interrupt line is normally shared, but after we start suspending
-	 * we can't check if our device is the source of an interrupt, and can't
-	 * clear it. Prevent this race by temporarily disabling the parent irq
-	 * until we reach _no_irq.
-	 */
-	if (cs35l56->base.irq)
-		disable_irq(cs35l56->base.irq);
-
 	return pm_runtime_force_suspend(dev);
 }
 
@@ -806,34 +793,6 @@ static int cs35l56_hda_system_suspend_late(struct device *dev)
 	return 0;
 }
 
-static int cs35l56_hda_system_suspend_no_irq(struct device *dev)
-{
-	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
-
-	/* Handlers are now disabled so the parent IRQ can safely be re-enabled. */
-	if (cs35l56->base.irq)
-		enable_irq(cs35l56->base.irq);
-
-	return 0;
-}
-
-static int cs35l56_hda_system_resume_no_irq(struct device *dev)
-{
-	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
-
-	/*
-	 * WAKE interrupts unmask if the CS35L56 hibernates, which can cause
-	 * spurious interrupts, and the interrupt line is normally shared.
-	 * We can't check if our device is the source of an interrupt, and can't
-	 * clear it, until it has fully resumed. Prevent this race by temporarily
-	 * disabling the parent irq until we complete resume().
-	 */
-	if (cs35l56->base.irq)
-		disable_irq(cs35l56->base.irq);
-
-	return 0;
-}
-
 static int cs35l56_hda_system_resume_early(struct device *dev)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
@@ -856,11 +815,8 @@ static int cs35l56_hda_system_resume(struct device *dev)
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
 	int ret;
 
-	/* Undo pm_runtime_force_suspend() before re-enabling the irq */
+	/* Undo pm_runtime_force_suspend() */
 	ret = pm_runtime_force_resume(dev);
-	if (cs35l56->base.irq)
-		enable_irq(cs35l56->base.irq);
-
 	if (ret)
 		return ret;
 
@@ -987,7 +943,6 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 {
 	int ret;
 
-	mutex_init(&cs35l56->base.irq_lock);
 	dev_set_drvdata(cs35l56->base.dev, cs35l56);
 
 	INIT_WORK(&cs35l56->dsp_work, cs35l56_hda_dsp_work);
@@ -1120,8 +1075,6 @@ const struct dev_pm_ops cs35l56_hda_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(cs35l56_hda_system_suspend, cs35l56_hda_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_hda_system_suspend_late,
 				 cs35l56_hda_system_resume_early)
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l56_hda_system_suspend_no_irq,
-				  cs35l56_hda_system_resume_no_irq)
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_hda_pm_ops, SND_HDA_SCODEC_CS35L56);
 
diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
index 40f2f97944d5..822c1251f703 100644
--- a/sound/pci/hda/cs35l56_hda_i2c.c
+++ b/sound/pci/hda/cs35l56_hda_i2c.c
@@ -34,14 +34,7 @@ static int cs35l56_hda_i2c_probe(struct i2c_client *clt)
 		return ret;
 	}
 
-	ret = cs35l56_hda_common_probe(cs35l56, id->driver_data, clt->addr);
-	if (ret)
-		return ret;
-	ret = cs35l56_irq_request(&cs35l56->base, clt->irq);
-	if (ret < 0)
-		cs35l56_hda_remove(cs35l56->base.dev);
-
-	return ret;
+	return cs35l56_hda_common_probe(cs35l56, id->driver_data, clt->addr);
 }
 
 static void cs35l56_hda_i2c_remove(struct i2c_client *clt)
diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/pci/hda/cs35l56_hda_spi.c
index 7f02155fe61e..37a159546e59 100644
--- a/sound/pci/hda/cs35l56_hda_spi.c
+++ b/sound/pci/hda/cs35l56_hda_spi.c
@@ -34,14 +34,7 @@ static int cs35l56_hda_spi_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	ret = cs35l56_hda_common_probe(cs35l56, id->driver_data, spi_get_chipselect(spi, 0));
-	if (ret)
-		return ret;
-	ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
-	if (ret < 0)
-		cs35l56_hda_remove(cs35l56->base.dev);
-
-	return ret;
+	return cs35l56_hda_common_probe(cs35l56, id->driver_data, spi_get_chipselect(spi, 0));
 }
 
 static void cs35l56_hda_spi_remove(struct spi_device *spi)
diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 2bd2ff75cd50..4419a94c5e73 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -41,8 +41,6 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 		return ret;
 
 	ret = cs35l56_init(cs35l56);
-	if (ret == 0)
-		ret = cs35l56_irq_request(&cs35l56->base, client->irq);
 	if (ret < 0)
 		cs35l56_remove(cs35l56);
 
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 7c9a17fe2195..134631eff861 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -266,75 +266,14 @@ static void cs35l56_sdw_init(struct sdw_slave *peripheral)
 	}
 
 	ret = cs35l56_init(cs35l56);
-	if (ret < 0) {
+	if (ret < 0)
 		regcache_cache_only(cs35l56->base.regmap, true);
-		goto out;
-	}
-
-	/*
-	 * cs35l56_init can return with !init_done if it triggered
-	 * a soft reset.
-	 */
-	if (cs35l56->base.init_done) {
-		/* Enable SoundWire interrupts */
-		sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
-	}
 
 out:
 	pm_runtime_mark_last_busy(cs35l56->base.dev);
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
 
-static int cs35l56_sdw_interrupt(struct sdw_slave *peripheral,
-				 struct sdw_slave_intr_status *status)
-{
-	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
-
-	/* SoundWire core holds our pm_runtime when calling this function. */
-
-	dev_dbg(cs35l56->base.dev, "int control_port=%#x\n", status->control_port);
-
-	if ((status->control_port & SDW_SCP_INT1_IMPL_DEF) == 0)
-		return 0;
-
-	/*
-	 * Prevent bus manager suspending and possibly issuing a
-	 * bus-reset before the queued work has run.
-	 */
-	pm_runtime_get_noresume(cs35l56->base.dev);
-
-	/*
-	 * Mask and clear until it has been handled. The read of GEN_INT_STAT_1
-	 * is required as per the SoundWire spec for interrupt status bits
-	 * to clear. GEN_INT_MASK_1 masks the _inputs_ to GEN_INT_STAT1.
-	 * None of the interrupts are time-critical so use the
-	 * power-efficient queue.
-	 */
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-	queue_work(system_power_efficient_wq, &cs35l56->sdw_irq_work);
-
-	return 0;
-}
-
-static void cs35l56_sdw_irq_work(struct work_struct *work)
-{
-	struct cs35l56_private *cs35l56 = container_of(work,
-						       struct cs35l56_private,
-						       sdw_irq_work);
-
-	cs35l56_irq(-1, &cs35l56->base);
-
-	/* unmask interrupts */
-	if (!cs35l56->sdw_irq_no_unmask)
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
-
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
-}
-
 static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
@@ -349,7 +288,7 @@ static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 	prop->sink_ports = BIT(CS35L56_SDW1_PLAYBACK_PORT);
 	prop->paging_support = true;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
-	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY | SDW_SCP_INT1_IMPL_DEF;
+	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
 	/* DP1 - playback */
 	ports[0].num = CS35L56_SDW1_PLAYBACK_PORT;
@@ -406,7 +345,6 @@ static int __maybe_unused cs35l56_sdw_clk_stop(struct sdw_slave *peripheral,
 
 static const struct sdw_slave_ops cs35l56_sdw_ops = {
 	.read_prop = cs35l56_sdw_read_prop,
-	.interrupt_callback = cs35l56_sdw_interrupt,
 	.update_status = cs35l56_sdw_update_status,
 #ifdef DEBUG
 	.clk_stop = cs35l56_sdw_clk_stop,
@@ -465,10 +403,6 @@ static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	/* Re-enable SoundWire interrupts */
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-			CS35L56_SDW_INT_MASK_CODEC_IRQ);
-
 	return 0;
 }
 
@@ -479,32 +413,9 @@ static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
 	if (!cs35l56->base.init_done)
 		return 0;
 
-	/*
-	 * Disable SoundWire interrupts.
-	 * Flush - don't cancel because that could leave an unbalanced pm_runtime_get.
-	 */
-	cs35l56->sdw_irq_no_unmask = true;
-	flush_work(&cs35l56->sdw_irq_work);
-
-	/* Mask interrupts and flush in case sdw_irq_work was queued again */
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-	flush_work(&cs35l56->sdw_irq_work);
-
 	return cs35l56_system_suspend(dev);
 }
 
-static int __maybe_unused cs35l56_sdw_system_resume(struct device *dev)
-{
-	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
-
-	cs35l56->sdw_irq_no_unmask = false;
-	/* runtime_resume re-enables the interrupt */
-
-	return cs35l56_system_resume(dev);
-}
-
 static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_device_id *id)
 {
 	struct device *dev = &peripheral->dev;
@@ -517,7 +428,6 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 
 	cs35l56->base.dev = dev;
 	cs35l56->sdw_peripheral = peripheral;
-	INIT_WORK(&cs35l56->sdw_irq_work, cs35l56_sdw_irq_work);
 
 	dev_set_drvdata(dev, cs35l56);
 
@@ -542,13 +452,6 @@ static int cs35l56_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
 
-	/* Disable SoundWire interrupts */
-	cs35l56->sdw_irq_no_unmask = true;
-	cancel_work_sync(&cs35l56->sdw_irq_work);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-
 	cs35l56_remove(cs35l56);
 
 	return 0;
@@ -556,9 +459,8 @@ static int cs35l56_sdw_remove(struct sdw_slave *peripheral)
 
 static const struct dev_pm_ops cs35l56_sdw_pm = {
 	SET_RUNTIME_PM_OPS(cs35l56_sdw_runtime_suspend, cs35l56_sdw_runtime_resume, NULL)
-	SYSTEM_SLEEP_PM_OPS(cs35l56_sdw_system_suspend, cs35l56_sdw_system_resume)
+	SYSTEM_SLEEP_PM_OPS(cs35l56_sdw_system_suspend, cs35l56_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
-	/* NOIRQ stage not needed, SoundWire doesn't use a hard IRQ */
 };
 
 static const struct sdw_device_id cs35l56_sdw_id[] = {
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e45e9ae01bc6..55adbc3d26ae 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -37,6 +37,7 @@ static const struct reg_sequence cs35l56_patch[] = {
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
 	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
 	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
+	{ CS35L56_IRQ1_MASK_20,			0x15fff19c },
 
 	/* These are not reset by a soft-reset, so patch to defaults. */
 	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
@@ -70,12 +71,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
 	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
-	{ CS35L56_IRQ1_MASK_1,			0x83ffffff },
-	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
-	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
-	{ CS35L56_IRQ1_MASK_8,			0xfc000fff },
-	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
-	{ CS35L56_IRQ1_MASK_20,			0x15c00000 },
 	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
 	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
 	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
@@ -329,91 +324,6 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_system_reset, SND_SOC_CS35L56_SHARED);
 
-int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq)
-{
-	int ret;
-
-	if (irq < 1)
-		return 0;
-
-	ret = devm_request_threaded_irq(cs35l56_base->dev, irq, NULL, cs35l56_irq,
-					IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW,
-					"cs35l56", cs35l56_base);
-	if (!ret)
-		cs35l56_base->irq = irq;
-	else
-		dev_err(cs35l56_base->dev, "Failed to get IRQ: %d\n", ret);
-
-	return ret;
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_irq_request, SND_SOC_CS35L56_SHARED);
-
-irqreturn_t cs35l56_irq(int irq, void *data)
-{
-	struct cs35l56_base *cs35l56_base = data;
-	unsigned int status1 = 0, status8 = 0, status20 = 0;
-	unsigned int mask1, mask8, mask20;
-	unsigned int val;
-	int rv;
-
-	irqreturn_t ret = IRQ_NONE;
-
-	if (!cs35l56_base->init_done)
-		return IRQ_NONE;
-
-	mutex_lock(&cs35l56_base->irq_lock);
-
-	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
-	if (rv < 0) {
-		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
-	}
-
-	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
-	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
-		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
-		goto err;
-	}
-
-	/* Ack interrupts */
-	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_EINT_1, &status1);
-	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_MASK_1, &mask1);
-	status1 &= ~mask1;
-	regmap_write(cs35l56_base->regmap, CS35L56_IRQ1_EINT_1, status1);
-
-	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_EINT_8, &status8);
-	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_MASK_8, &mask8);
-	status8 &= ~mask8;
-	regmap_write(cs35l56_base->regmap, CS35L56_IRQ1_EINT_8, status8);
-
-	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_EINT_20, &status20);
-	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_MASK_20, &mask20);
-	status20 &= ~mask20;
-	/* We don't want EINT20 but they default to unmasked: force mask */
-	regmap_write(cs35l56_base->regmap, CS35L56_IRQ1_MASK_20, 0xffffffff);
-
-	dev_dbg(cs35l56_base->dev, "%s: %#x %#x\n", __func__, status1, status8);
-
-	/* Check to see if unmasked bits are active */
-	if (!status1 && !status8 && !status20)
-		goto err;
-
-	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
-		dev_crit(cs35l56_base->dev, "Amp short error\n");
-
-	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
-		dev_crit(cs35l56_base->dev, "Overtemp error\n");
-
-	ret = IRQ_HANDLED;
-
-err:
-	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_irq, SND_SOC_CS35L56_SHARED);
 
 int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 {
@@ -763,15 +673,6 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 		 cs35l56_base->type, cs35l56_base->secured ? "s" : "", cs35l56_base->rev, otpid,
 		 fw_ver >> 16, (fw_ver >> 8) & 0xff, fw_ver & 0xff, !fw_missing);
 
-	/* Wake source and *_BLOCKED interrupts default to unmasked, so mask them */
-	regmap_write(cs35l56_base->regmap, CS35L56_IRQ1_MASK_20, 0xffffffff);
-	regmap_update_bits(cs35l56_base->regmap, CS35L56_IRQ1_MASK_1,
-			   CS35L56_AMP_SHORT_ERR_EINT1_MASK,
-			   0);
-	regmap_update_bits(cs35l56_base->regmap, CS35L56_IRQ1_MASK_8,
-			   CS35L56_TEMP_ERR_EINT1_MASK,
-			   0);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_hw_init, SND_SOC_CS35L56_SHARED);
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index b07b798b0b45..1382b8903ea7 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -39,8 +39,6 @@ static int cs35l56_spi_probe(struct spi_device *spi)
 		return ret;
 
 	ret = cs35l56_init(cs35l56);
-	if (ret == 0)
-		ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
 	if (ret < 0)
 		cs35l56_remove(cs35l56);
 
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 757ade6373ed..cf2aee6cda6c 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
-#include <linux/interrupt.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/pm.h>
@@ -702,23 +701,9 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 {
 	int ret;
 
-	/*
-	 * Disable SoundWire interrupts to prevent race with IRQ work.
-	 * Setting sdw_irq_no_unmask prevents the handler re-enabling
-	 * the SoundWire interrupt.
-	 */
-	if (cs35l56->sdw_peripheral) {
-		cs35l56->sdw_irq_no_unmask = true;
-		flush_work(&cs35l56->sdw_irq_work);
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-		sdw_read_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-		flush_work(&cs35l56->sdw_irq_work);
-	}
-
 	ret = cs35l56_firmware_shutdown(&cs35l56->base);
 	if (ret)
-		goto err;
+		return;
 
 	/*
 	 * Use wm_adsp to load and apply the firmware patch and coefficient files,
@@ -728,11 +713,9 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	ret = wm_adsp_power_up(&cs35l56->dsp, !!firmware_missing);
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "%s: wm_adsp_power_up ret %d\n", __func__, ret);
-		goto err;
+		return;
 	}
 
-	mutex_lock(&cs35l56->base.irq_lock);
-
 	reinit_completion(&cs35l56->init_completion);
 
 	cs35l56->soft_resetting = true;
@@ -748,10 +731,10 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 						 msecs_to_jiffies(5000))) {
 			dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
 				__func__);
-			goto err_unlock;
+		return;
 		}
 	} else if (cs35l56_init(cs35l56)) {
-		goto err_unlock;
+		return;
 	}
 
 	regmap_clear_bits(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS,
@@ -760,16 +743,6 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 
 	if (cs35l56_write_cal(cs35l56) == 0)
 		cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
-
-err_unlock:
-	mutex_unlock(&cs35l56->base.irq_lock);
-err:
-	/* Re-enable SoundWire interrupts */
-	if (cs35l56->sdw_peripheral) {
-		cs35l56->sdw_irq_no_unmask = false;
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
-	}
 }
 
 static void cs35l56_dsp_work(struct work_struct *work)
@@ -956,15 +929,6 @@ int cs35l56_system_suspend(struct device *dev)
 	if (cs35l56->component)
 		flush_work(&cs35l56->dsp_work);
 
-	/*
-	 * The interrupt line is normally shared, but after we start suspending
-	 * we can't check if our device is the source of an interrupt, and can't
-	 * clear it. Prevent this race by temporarily disabling the parent irq
-	 * until we reach _no_irq.
-	 */
-	if (cs35l56->base.irq)
-		disable_irq(cs35l56->base.irq);
-
 	return pm_runtime_force_suspend(dev);
 }
 EXPORT_SYMBOL_GPL(cs35l56_system_suspend);
@@ -991,40 +955,6 @@ int cs35l56_system_suspend_late(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(cs35l56_system_suspend_late);
 
-int cs35l56_system_suspend_no_irq(struct device *dev)
-{
-	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
-
-	dev_dbg(dev, "system_suspend_no_irq\n");
-
-	/* Handlers are now disabled so the parent IRQ can safely be re-enabled. */
-	if (cs35l56->base.irq)
-		enable_irq(cs35l56->base.irq);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(cs35l56_system_suspend_no_irq);
-
-int cs35l56_system_resume_no_irq(struct device *dev)
-{
-	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
-
-	dev_dbg(dev, "system_resume_no_irq\n");
-
-	/*
-	 * WAKE interrupts unmask if the CS35L56 hibernates, which can cause
-	 * spurious interrupts, and the interrupt line is normally shared.
-	 * We can't check if our device is the source of an interrupt, and can't
-	 * clear it, until it has fully resumed. Prevent this race by temporarily
-	 * disabling the parent irq until we complete resume().
-	 */
-	if (cs35l56->base.irq)
-		disable_irq(cs35l56->base.irq);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(cs35l56_system_resume_no_irq);
-
 int cs35l56_system_resume_early(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
@@ -1065,11 +995,8 @@ int cs35l56_system_resume(struct device *dev)
 	 */
 	cs35l56_wait_control_port_ready();
 
-	/* Undo pm_runtime_force_suspend() before re-enabling the irq */
+	/* Undo pm_runtime_force_suspend() */
 	ret = pm_runtime_force_resume(dev);
-	if (cs35l56->base.irq)
-		enable_irq(cs35l56->base.irq);
-
 	if (ret)
 		return ret;
 
@@ -1267,7 +1194,6 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 	int ret;
 
 	init_completion(&cs35l56->init_completion);
-	mutex_init(&cs35l56->base.irq_lock);
 	cs35l56->base.cal_index = -1;
 	cs35l56->speaker_id = -ENOENT;
 
@@ -1428,13 +1354,6 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 {
 	cs35l56->base.init_done = false;
 
-	/*
-	 * WAKE IRQs unmask if CS35L56 hibernates so free the handler to
-	 * prevent it racing with remove().
-	 */
-	if (cs35l56->base.irq)
-		devm_free_irq(cs35l56->base.dev, cs35l56->base.irq, &cs35l56->base);
-
 	flush_workqueue(cs35l56->dsp_wq);
 	destroy_workqueue(cs35l56->dsp_wq);
 
@@ -1454,7 +1373,6 @@ EXPORT_NS_GPL_DEV_PM_OPS(cs35l56_pm_ops_i2c_spi, SND_SOC_CS35L56_CORE) = {
 	SET_RUNTIME_PM_OPS(cs35l56_runtime_suspend_i2c_spi, cs35l56_runtime_resume_i2c_spi, NULL)
 	SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend, cs35l56_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_no_irq, cs35l56_system_resume_no_irq)
 };
 #endif
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 8a987ec01507..0ebae11c1cd0 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -16,10 +16,6 @@
 #include <sound/cs35l56.h>
 #include "wm_adsp.h"
 
-#define CS35L56_SDW_GEN_INT_STAT_1	0xc0
-#define CS35L56_SDW_GEN_INT_MASK_1	0xc1
-#define CS35L56_SDW_INT_MASK_CODEC_IRQ	BIT(0)
-
 #define CS35L56_SDW_INVALID_BUS_SCALE	0xf
 
 #define CS35L56_RX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
@@ -38,8 +34,6 @@ struct cs35l56_private {
 	struct snd_soc_component *component;
 	struct regulator_bulk_data supplies[CS35L56_NUM_BULK_SUPPLIES];
 	struct sdw_slave *sdw_peripheral;
-	struct work_struct sdw_irq_work;
-	bool sdw_irq_no_unmask;
 	bool soft_resetting;
 	bool sdw_attached;
 	struct completion init_completion;
@@ -57,12 +51,8 @@ extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
 
 int cs35l56_system_suspend(struct device *dev);
 int cs35l56_system_suspend_late(struct device *dev);
-int cs35l56_system_suspend_no_irq(struct device *dev);
-int cs35l56_system_resume_no_irq(struct device *dev);
 int cs35l56_system_resume_early(struct device *dev);
 int cs35l56_system_resume(struct device *dev);
-irqreturn_t cs35l56_irq(int irq, void *data);
-int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq);
 int cs35l56_common_probe(struct cs35l56_private *cs35l56);
 int cs35l56_init(struct cs35l56_private *cs35l56);
 void cs35l56_remove(struct cs35l56_private *cs35l56);
-- 
2.43.0

