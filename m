Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137B75C7B3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83502206;
	Fri, 21 Jul 2023 15:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83502206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689945839;
	bh=0CZiEl7v0jcssUi9ky86zE5jC8pEFB7mbL8Ud0Hmg8A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HSuTxr642gs5MvBV+dgaEfU5y8QANITSHWs+VHFXDPaKogIZVhmTstqyQy+O/Rd4H
	 u1zOABMOEq/DCmnJzAzg+yEbDBmBOpC4EXqTYe2DGJDBpCJVaW4SZIpP57eoNqcLwl
	 GU65nmO5vW8DmFxYsk/D9phWChTfpgvbqlNssqNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB99F80587; Fri, 21 Jul 2023 15:22:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18F89F805A0;
	Fri, 21 Jul 2023 15:22:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D7BEF80580; Fri, 21 Jul 2023 15:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B37CF804DA
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B37CF804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cgMWuWNs
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36L7lwWo024208;
	Fri, 21 Jul 2023 08:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=d24txq3X40ekaaMLfr0wRdxBZt1k3g1fkYDyvpeNNiA=; b=
	cgMWuWNsWBDoJiQz4J3K+U8OiIxx4F00vWRJBPtKyL/VE/ddZPta0yL2He83A38e
	aTDO0d3XvWu49VkNJPC5bavHLiquXLQUc0u4UDAO+M6F8oNwU0ioI5ODhS6SXMNW
	R4Ehah2dQQODeP+MEEX8aSFv0s6JC/vqlBBhlAhiGmyNXNrnqdAXiW+aYclF370M
	EP6yOBgHLtwwscJTzGaq/4QCpCWFYeQy1q1OqkwGFYqRUVjapu85H7P+SSMqg9sz
	URem7+6JeDNdM521LbRq7hivG8RvCVEb2yU425luzmX7Ooz/0f/90uJB6QFFNaQs
	k3sqhlRH7KbNuULaV2T4YQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gyj2u-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 08:21:28 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 14:21:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 21 Jul 2023 14:21:25 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.172])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7412F3560;
	Fri, 21 Jul 2023 13:21:25 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v5 05/11] ASoC: cs35l56: Move runtime suspend/resume to shared
 library
Date: Fri, 21 Jul 2023 14:21:14 +0100
Message-ID: <20230721132120.5523-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230721132120.5523-1-rf@opensource.cirrus.com>
References: <20230721132120.5523-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: c3e3QzN-riEyPKe6jAHY_Yr1Zl05xCBb
X-Proofpoint-GUID: c3e3QzN-riEyPKe6jAHY_Yr1Zl05xCBb
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: X6CQVNAVJGCUHHYLOYL74TGGVLNEIDQM
X-Message-ID-Hash: X6CQVNAVJGCUHHYLOYL74TGGVLNEIDQM
X-MailFrom: prvs=25664d1566=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6CQVNAVJGCUHHYLOYL74TGGVLNEIDQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The majority of runtime_suspend and runtime_resume handling
doesn't have anything specific to the ASoC driver, so can be
shared by the HDA driver. Move this code into the shared
library.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 include/sound/cs35l56.h           |   2 +
 sound/soc/codecs/cs35l56-sdw.c    |   4 +-
 sound/soc/codecs/cs35l56-shared.c | 118 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 120 +-----------------------------
 sound/soc/codecs/cs35l56.h        |   2 -
 5 files changed, 126 insertions(+), 120 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 3d2875094a21..e48f662dcbce 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -281,6 +281,8 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire);
 int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq);
 irqreturn_t cs35l56_irq(int irq, void *data);
 int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base);
+int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base);
+int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_soundwire);
 int cs35l56_get_bclk_freq_id(unsigned int freq);
 void cs35l56_fill_supply_names(struct regulator_bulk_data *data);
 
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 98be005b8787..b433266b7844 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -424,7 +424,7 @@ static int __maybe_unused cs35l56_sdw_runtime_suspend(struct device *dev)
 	if (!cs35l56->base.init_done)
 		return 0;
 
-	return cs35l56_runtime_suspend(dev);
+	return cs35l56_runtime_suspend_common(&cs35l56->base);
 }
 
 static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
@@ -441,7 +441,7 @@ static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	ret = cs35l56_runtime_resume_common(cs35l56);
+	ret = cs35l56_runtime_resume_common(&cs35l56->base, true);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index d22aede1ee8d..737a9ea27495 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -403,6 +403,124 @@ int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_is_fw_reload_needed, SND_SOC_CS35L56_SHARED);
 
+static const struct reg_sequence cs35l56_hibernate_seq[] = {
+	/* This must be the last register access */
+	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_HIBERNATE_NOW),
+};
+
+static const struct reg_sequence cs35l56_hibernate_wake_seq[] = {
+	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_WAKEUP),
+};
+
+int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base)
+{
+	unsigned int val;
+	int ret;
+
+	if (!cs35l56_base->init_done)
+		return 0;
+
+	/* Firmware must have entered a power-save state */
+	ret = regmap_read_poll_timeout(cs35l56_base->regmap,
+				       CS35L56_TRANSDUCER_ACTUAL_PS,
+				       val, (val >= CS35L56_PS3),
+				       CS35L56_PS3_POLL_US,
+				       CS35L56_PS3_TIMEOUT_US);
+	if (ret)
+		dev_warn(cs35l56_base->dev, "PS3 wait failed: %d\n", ret);
+
+	/* Clear BOOT_DONE so it can be used to detect a reboot */
+	regmap_write(cs35l56_base->regmap, CS35L56_IRQ1_EINT_4, CS35L56_OTP_BOOT_DONE_MASK);
+
+	if (!cs35l56_base->can_hibernate) {
+		regcache_cache_only(cs35l56_base->regmap, true);
+		dev_dbg(cs35l56_base->dev, "Suspended: no hibernate");
+
+		return 0;
+	}
+
+	/*
+	 * Enable auto-hibernate. If it is woken by some other wake source
+	 * it will automatically return to hibernate.
+	 */
+	cs35l56_mbox_send(cs35l56_base, CS35L56_MBOX_CMD_ALLOW_AUTO_HIBERNATE);
+
+	/*
+	 * Must enter cache-only first so there can't be any more register
+	 * accesses other than the controlled hibernate sequence below.
+	 */
+	regcache_cache_only(cs35l56_base->regmap, true);
+
+	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+					cs35l56_hibernate_seq,
+					ARRAY_SIZE(cs35l56_hibernate_seq));
+
+	dev_dbg(cs35l56_base->dev, "Suspended: hibernate");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_suspend_common, SND_SOC_CS35L56_SHARED);
+
+int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_soundwire)
+{
+	unsigned int val;
+	int ret;
+
+	if (!cs35l56_base->init_done)
+		return 0;
+
+	if (!cs35l56_base->can_hibernate)
+		goto out_sync;
+
+	if (!is_soundwire) {
+		/*
+		 * Dummy transaction to trigger I2C/SPI auto-wake. This will NAK on I2C.
+		 * Must be done before releasing cache-only.
+		 */
+		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+						cs35l56_hibernate_wake_seq,
+						ARRAY_SIZE(cs35l56_hibernate_wake_seq));
+
+		usleep_range(CS35L56_CONTROL_PORT_READY_US,
+			     CS35L56_CONTROL_PORT_READY_US + 400);
+	}
+
+out_sync:
+	regcache_cache_only(cs35l56_base->regmap, false);
+
+	ret = cs35l56_wait_for_firmware_boot(cs35l56_base);
+	if (ret) {
+		dev_err(cs35l56_base->dev, "Hibernate wake failed: %d\n", ret);
+		goto err;
+	}
+
+	ret = cs35l56_mbox_send(cs35l56_base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
+	if (ret)
+		goto err;
+
+	/* BOOT_DONE will be 1 if the amp reset */
+	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_EINT_4, &val);
+	if (val & CS35L56_OTP_BOOT_DONE_MASK) {
+		dev_dbg(cs35l56_base->dev, "Registers reset in suspend\n");
+		regcache_mark_dirty(cs35l56_base->regmap);
+	}
+
+	regcache_sync(cs35l56_base->regmap);
+
+	dev_dbg(cs35l56_base->dev, "Resumed");
+
+	return 0;
+
+err:
+	regmap_write(cs35l56_base->regmap, CS35L56_DSP_VIRTUAL1_MBOX_1,
+		     CS35L56_MBOX_CMD_HIBERNATE_NOW);
+
+	regcache_cache_only(cs35l56_base->regmap, true);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_resume_common, SND_SOC_CS35L56_SHARED);
+
 const struct cs_dsp_region cs35l56_dsp1_regions[] = {
 	{ .type = WMFW_HALO_PM_PACKED,	.base = CS35L56_DSP1_PMEM_0 },
 	{ .type = WMFW_HALO_XM_PACKED,	.base = CS35L56_DSP1_XMEM_PACKED_0 },
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 5598000187a7..701f1072a609 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -849,132 +849,20 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l56 = {
 	.suspend_bias_off = 1, /* see cs35l56_system_resume() */
 };
 
-static const struct reg_sequence cs35l56_hibernate_seq[] = {
-	/* This must be the last register access */
-	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_HIBERNATE_NOW),
-};
-
-static const struct reg_sequence cs35l56_hibernate_wake_seq[] = {
-	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_WAKEUP),
-};
-
-int cs35l56_runtime_suspend(struct device *dev)
+static int __maybe_unused cs35l56_runtime_suspend_i2c_spi(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
-	unsigned int val;
-	int ret;
 
-	if (!cs35l56->base.init_done)
-		return 0;
-
-	/* Firmware must have entered a power-save state */
-	ret = regmap_read_poll_timeout(cs35l56->base.regmap,
-				       CS35L56_TRANSDUCER_ACTUAL_PS,
-				       val, (val >= CS35L56_PS3),
-				       CS35L56_PS3_POLL_US,
-				       CS35L56_PS3_TIMEOUT_US);
-	if (ret)
-		dev_warn(cs35l56->base.dev, "PS3 wait failed: %d\n", ret);
-
-	/* Clear BOOT_DONE so it can be used to detect a reboot */
-	regmap_write(cs35l56->base.regmap, CS35L56_IRQ1_EINT_4, CS35L56_OTP_BOOT_DONE_MASK);
-
-	if (!cs35l56->base.can_hibernate) {
-		regcache_cache_only(cs35l56->base.regmap, true);
-		dev_dbg(dev, "Suspended: no hibernate");
-
-		return 0;
-	}
-
-	/*
-	 * Enable auto-hibernate. If it is woken by some other wake source
-	 * it will automatically return to hibernate.
-	 */
-	cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_ALLOW_AUTO_HIBERNATE);
-
-	/*
-	 * Must enter cache-only first so there can't be any more register
-	 * accesses other than the controlled hibernate sequence below.
-	 */
-	regcache_cache_only(cs35l56->base.regmap, true);
-
-	regmap_multi_reg_write_bypassed(cs35l56->base.regmap,
-					cs35l56_hibernate_seq,
-					ARRAY_SIZE(cs35l56_hibernate_seq));
-
-	dev_dbg(dev, "Suspended: hibernate");
-
-	return 0;
+	return cs35l56_runtime_suspend_common(&cs35l56->base);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_suspend, SND_SOC_CS35L56_CORE);
 
 static int __maybe_unused cs35l56_runtime_resume_i2c_spi(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
 
-	if (!cs35l56->base.init_done)
-		return 0;
-
-	return cs35l56_runtime_resume_common(cs35l56);
+	return cs35l56_runtime_resume_common(&cs35l56->base, false);
 }
 
-int cs35l56_runtime_resume_common(struct cs35l56_private *cs35l56)
-{
-	unsigned int val;
-	int ret;
-
-	if (!cs35l56->base.can_hibernate)
-		goto out_sync;
-
-	if (!cs35l56->sdw_peripheral) {
-		/*
-		 * Dummy transaction to trigger I2C/SPI auto-wake. This will NAK on I2C.
-		 * Must be done before releasing cache-only.
-		 */
-		regmap_multi_reg_write_bypassed(cs35l56->base.regmap,
-						cs35l56_hibernate_wake_seq,
-						ARRAY_SIZE(cs35l56_hibernate_wake_seq));
-
-		usleep_range(CS35L56_CONTROL_PORT_READY_US,
-			     CS35L56_CONTROL_PORT_READY_US + 400);
-	}
-
-out_sync:
-	regcache_cache_only(cs35l56->base.regmap, false);
-
-	ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
-	if (ret) {
-		dev_err(cs35l56->base.dev, "Hibernate wake failed: %d\n", ret);
-		goto err;
-	}
-
-	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
-	if (ret)
-		goto err;
-
-	/* BOOT_DONE will be 1 if the amp reset */
-	regmap_read(cs35l56->base.regmap, CS35L56_IRQ1_EINT_4, &val);
-	if (val & CS35L56_OTP_BOOT_DONE_MASK) {
-		dev_dbg(cs35l56->base.dev, "Registers reset in suspend\n");
-		regcache_mark_dirty(cs35l56->base.regmap);
-	}
-
-	regcache_sync(cs35l56->base.regmap);
-
-	dev_dbg(cs35l56->base.dev, "Resumed");
-
-	return 0;
-
-err:
-	regmap_write(cs35l56->base.regmap, CS35L56_DSP_VIRTUAL1_MBOX_1,
-		     CS35L56_MBOX_CMD_HIBERNATE_NOW);
-
-	regcache_cache_only(cs35l56->base.regmap, true);
-
-	return ret;
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_resume_common, SND_SOC_CS35L56_CORE);
-
 int cs35l56_system_suspend(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
@@ -1414,7 +1302,7 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 EXPORT_SYMBOL_NS_GPL(cs35l56_remove, SND_SOC_CS35L56_CORE);
 
 const struct dev_pm_ops cs35l56_pm_ops_i2c_spi = {
-	SET_RUNTIME_PM_OPS(cs35l56_runtime_suspend, cs35l56_runtime_resume_i2c_spi, NULL)
+	SET_RUNTIME_PM_OPS(cs35l56_runtime_suspend_i2c_spi, cs35l56_runtime_resume_i2c_spi, NULL)
 	SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend, cs35l56_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_no_irq, cs35l56_system_resume_no_irq)
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index f39f8fa9e37e..8159c3e217d9 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -55,8 +55,6 @@ struct cs35l56_private {
 
 extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
 
-int cs35l56_runtime_suspend(struct device *dev);
-int cs35l56_runtime_resume_common(struct cs35l56_private *cs35l56);
 int cs35l56_system_suspend(struct device *dev);
 int cs35l56_system_suspend_late(struct device *dev);
 int cs35l56_system_suspend_no_irq(struct device *dev);
-- 
2.30.2

