Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C81C4953A8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 18:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B2952E7E;
	Thu, 20 Jan 2022 18:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B2952E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642701467;
	bh=oAVu90eWvMsfOyzUac2hnJWuM8Eqfkz2xgUQUkXrJFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6SsJrQpdyPxweGlLTPnf4tDGMKFAmo+Fg/yVgVxLbMhnHIjEetiwpmK/8v+mG990
	 HAMCKqK03nyDZD5rCefMm8N3komqc5fSH7Bmp4z9PBMoTXi6s6tNrRlSTUHvg9KCwA
	 fFTc2F3P+xMSSx2kJsGIwX4ba/wct2T9sYtMwpwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2359BF804BB;
	Thu, 20 Jan 2022 18:56:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD6C7F80248; Thu, 20 Jan 2022 18:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A187F800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 18:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A187F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FVEuddPr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20K4urv7021640;
 Thu, 20 Jan 2022 11:55:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=XvGB7UycBpGzVQC72iu2qmzvGDvfYND/7pGY61cSEew=;
 b=FVEuddPreuC2YhzhmQ1QaTpD6VdnDatajMnkMfWWRzVYVuuc6+dlc9Ajgne202AoCgbM
 mfHm+VPMurhxIVqpMRfWGixTMHFgj8Dkr6Af6ERLwpANiIQ9R0ztaLAV8bqUZxheuopz
 rSKRnNa4LKk30USK+3+o1EDy+A0v9jsPNNJzSOvvpNGbveKs+46QEQbqawbpL6CXmO6n
 jR7xN1JBkBGmBvZ3CvmSqKp0r4f2viQB+3wXjiPJmC+yRYuHUmPhukJxQhrEO+SpiMQZ
 VhaeqS/c785gH6hgcjxzflW5XNyzQkhDpwpRJLNjRpgCrDbT2Op1xAJ+RGDs8ShJnywe bw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dpms0hh18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Jan 2022 11:55:58 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 17:55:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 20 Jan 2022 17:55:54 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.33])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 33DD711D7;
 Thu, 20 Jan 2022 17:55:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: cs42l42: Handle system suspend
Date: Thu, 20 Jan 2022 17:55:49 +0000
Message-ID: <20220120175549.671831-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120175549.671831-1-rf@opensource.cirrus.com>
References: <20220120175549.671831-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: a_vnEG4sxbh_94GlblzDDpmx9wrfu0q_
X-Proofpoint-GUID: a_vnEG4sxbh_94GlblzDDpmx9wrfu0q_
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Add system suspend functions to handle clean power-down on suspend and
restoring registers on resume.

The jack state could change during suspend. Plug->unplug and unplug->plug
are straightforward because this looks no different from any other plug
state change - there will be a plugged or unplugged interrupt pending.
The jack could be unplugged and a different type of jack plugged, and on
resume the plug state would not have changed. Setting plug_state back to
TS_TRANS (transitioning) will make the next plug interrupt after resume
run a type detection.

During system suspend any jack plug/unplug and button events will not be
reported or generate a system wakeup. If the plug state or headset type
has changed it will be reported after resume.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 139 +++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs42l42.h |   5 ++
 2 files changed, 144 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index f1b95d45af4a..f577b39a2fc0 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1614,6 +1614,10 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	int report = 0;
 
 	mutex_lock(&cs42l42->irq_lock);
+	if (cs42l42->suspended) {
+		mutex_unlock(&cs42l42->irq_lock);
+		return IRQ_NONE;
+	}
 
 	/* Read sticky registers to clear interurpt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
@@ -2047,6 +2051,136 @@ static int cs42l42_handle_device_data(struct device *dev,
 	return 0;
 }
 
+/* Datasheet suspend sequence */
+static const struct reg_sequence __maybe_unused cs42l42_shutdown_seq[] = {
+	REG_SEQ0(CS42L42_MIC_DET_CTL1,		0x9F),
+	REG_SEQ0(CS42L42_ADC_OVFL_INT_MASK,	0x01),
+	REG_SEQ0(CS42L42_MIXER_INT_MASK,	0x0F),
+	REG_SEQ0(CS42L42_SRC_INT_MASK,		0x0F),
+	REG_SEQ0(CS42L42_ASP_RX_INT_MASK,	0x1F),
+	REG_SEQ0(CS42L42_ASP_TX_INT_MASK,	0x0F),
+	REG_SEQ0(CS42L42_CODEC_INT_MASK,	0x03),
+	REG_SEQ0(CS42L42_SRCPL_INT_MASK,	0x7F),
+	REG_SEQ0(CS42L42_VPMON_INT_MASK,	0x01),
+	REG_SEQ0(CS42L42_PLL_LOCK_INT_MASK,	0x01),
+	REG_SEQ0(CS42L42_TSRS_PLUG_INT_MASK,	0x0F),
+	REG_SEQ0(CS42L42_WAKE_CTL,		0xE1),
+	REG_SEQ0(CS42L42_DET_INT1_MASK,		0xE0),
+	REG_SEQ0(CS42L42_DET_INT2_MASK,		0xFF),
+	REG_SEQ0(CS42L42_MIXER_CHA_VOL,		0x3F),
+	REG_SEQ0(CS42L42_MIXER_ADC_VOL,		0x3F),
+	REG_SEQ0(CS42L42_MIXER_CHB_VOL,		0x3F),
+	REG_SEQ0(CS42L42_HP_CTL,		0x0F),
+	REG_SEQ0(CS42L42_ASP_RX_DAI0_EN,	0x00),
+	REG_SEQ0(CS42L42_ASP_CLK_CFG,		0x00),
+	REG_SEQ0(CS42L42_HSDET_CTL2,		0x00),
+	REG_SEQ0(CS42L42_PWR_CTL1,		0xFE),
+	REG_SEQ0(CS42L42_PWR_CTL2,		0x8C),
+	REG_SEQ0(CS42L42_DAC_CTL2,		0x02),
+	REG_SEQ0(CS42L42_HS_CLAMP_DISABLE,	0x00),
+	REG_SEQ0(CS42L42_MISC_DET_CTL,		0x03),
+	REG_SEQ0(CS42L42_TIPSENSE_CTL,		0x02),
+	REG_SEQ0(CS42L42_HSBIAS_SC_AUTOCTL,	0x03),
+	REG_SEQ0(CS42L42_PWR_CTL1,		0xFF)
+};
+
+static int __maybe_unused cs42l42_suspend(struct device *dev)
+{
+	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
+	unsigned int reg;
+	u8 save_regs[ARRAY_SIZE(cs42l42_shutdown_seq)];
+	int i, ret;
+
+	/*
+	 * Wait for threaded irq handler to be idle and stop it processing
+	 * future interrupts. This ensures a safe disable if the interrupt
+	 * is shared.
+	 */
+	mutex_lock(&cs42l42->irq_lock);
+	cs42l42->suspended = true;
+
+	/* Save register values that will be overwritten by shutdown sequence */
+	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
+		regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
+		save_regs[i] = (u8)reg;
+	}
+
+	/* Shutdown codec */
+	regmap_multi_reg_write(cs42l42->regmap,
+			       cs42l42_shutdown_seq,
+			       ARRAY_SIZE(cs42l42_shutdown_seq));
+
+	/* All interrupt sources are now disabled */
+	mutex_unlock(&cs42l42->irq_lock);
+
+	/* Wait for power-down complete */
+	msleep(CS42L42_PDN_DONE_TIME_MS);
+	ret = regmap_read_poll_timeout(cs42l42->regmap,
+				       CS42L42_CODEC_STATUS, reg,
+				       (reg & CS42L42_PDN_DONE_MASK),
+				       CS42L42_PDN_DONE_POLL_US,
+				       CS42L42_PDN_DONE_TIMEOUT_US);
+	if (ret)
+		dev_warn(dev, "Failed to get PDN_DONE: %d\n", ret);
+
+	/* Discharge FILT+ */
+	regmap_update_bits(cs42l42->regmap, CS42L42_PWR_CTL2,
+			   CS42L42_DISCHARGE_FILT_MASK, CS42L42_DISCHARGE_FILT_MASK);
+	msleep(CS42L42_FILT_DISCHARGE_TIME_MS);
+
+	regcache_cache_only(cs42l42->regmap, true);
+	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
+	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies), cs42l42->supplies);
+
+	/* Restore register values to the regmap cache */
+	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i)
+		regmap_write(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, save_regs[i]);
+
+	/* The cached address page register value is now stale */
+	regcache_drop_region(cs42l42->regmap, CS42L42_PAGE_REGISTER, CS42L42_PAGE_REGISTER);
+
+	dev_dbg(dev, "System suspended\n");
+
+	return 0;
+
+}
+
+static int __maybe_unused cs42l42_resume(struct device *dev)
+{
+	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
+	int ret;
+
+	/*
+	 * If jack was unplugged and re-plugged during suspend it could
+	 * have changed type but the tip-sense state hasn't changed.
+	 * Force a plugged state to be re-evaluated.
+	 */
+	if (cs42l42->plug_state != CS42L42_TS_UNPLUG)
+		cs42l42->plug_state = CS42L42_TS_TRANS;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(cs42l42->supplies), cs42l42->supplies);
+	if (ret != 0) {
+		dev_err(dev, "Failed to enable supplies: %d\n", ret);
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(cs42l42->reset_gpio, 1);
+	usleep_range(CS42L42_BOOT_TIME_US, CS42L42_BOOT_TIME_US * 2);
+
+	regcache_cache_only(cs42l42->regmap, false);
+	regcache_mark_dirty(cs42l42->regmap);
+
+	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
+	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+	regcache_sync(cs42l42->regmap);
+
+	cs42l42->suspended = false;
+
+	dev_dbg(dev, "System resumed\n");
+
+	return 0;
+}
+
 static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 				       const struct i2c_device_id *id)
 {
@@ -2217,6 +2351,10 @@ static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
 	return 0;
 }
 
+static const struct dev_pm_ops cs42l42_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l42_resume)
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id cs42l42_of_match[] = {
 	{ .compatible = "cirrus,cs42l42", },
@@ -2243,6 +2381,7 @@ MODULE_DEVICE_TABLE(i2c, cs42l42_id);
 static struct i2c_driver cs42l42_i2c_driver = {
 	.driver = {
 		.name = "cs42l42",
+		.pm = &cs42l42_pm_ops,
 		.of_match_table = of_match_ptr(cs42l42_of_match),
 		.acpi_match_table = ACPI_PTR(cs42l42_acpi_match),
 		},
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 53d96287abba..244b24d1f5e9 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -826,6 +826,10 @@
 #define CS42L42_PLL_LOCK_POLL_US	250
 #define CS42L42_PLL_LOCK_TIMEOUT_US	1250
 #define CS42L42_HP_ADC_EN_TIME_US	20000
+#define CS42L42_PDN_DONE_POLL_US	1000
+#define CS42L42_PDN_DONE_TIMEOUT_US	200000
+#define CS42L42_PDN_DONE_TIME_MS	100
+#define CS42L42_FILT_DISCHARGE_TIME_MS	46
 
 static const char *const cs42l42_supply_names[CS42L42_NUM_SUPPLIES] = {
 	"VA",
@@ -860,6 +864,7 @@ struct  cs42l42_private {
 	u8 hs_bias_sense_en;
 	u8 stream_use;
 	bool hp_adc_up_pending;
+	bool suspended;
 };
 
 #endif /* __CS42L42_H__ */
-- 
2.11.0

