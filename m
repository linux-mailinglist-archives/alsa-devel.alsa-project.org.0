Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC22599C49
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B55301687;
	Fri, 19 Aug 2022 14:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B55301687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913794;
	bh=Ifqjzvby5WnUB+w1adm0h3yHL08RI39kaWQ+suT5Mu0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXU8FEfBfBO1hLGcJkEt2i/DK96sZPdffxRHeWevdW6tGqUV/iXOeWKdhqrVp+94S
	 5LPzpP5wx5e0jGhQpXjmup/zKzJ9DbkuuP33RAXX3fgrvFZCwOWtmSQrmwObEgs9dw
	 I3i7gIdVFUZWbBxYIwTNkr7CpzSlM3bJ33O3b0RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF701F8057A;
	Fri, 19 Aug 2022 14:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 672FCF80525; Fri, 19 Aug 2022 14:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E71F80536
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E71F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TS/8sl1l"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J5opPu018534;
 Fri, 19 Aug 2022 07:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=gK6+4+wdJ9G6qdOUweYveTrtoslYy4n8rVAMQAoDT80=;
 b=TS/8sl1lkdTTP448M2fS4ZUpDcmLQVJo9jfxv8DRFpecRo5NiK6LeSqZ0IKnHNdowN3H
 xI62ZboJCVA7uomqo3CcuPi2Wm+Wkn0g+o+FWlmaDct+SnPSxE42FkCg2cuqmrifks9l
 ucjbEMApdTuwPu5myGJe7jKdxRwO47RPA94Y2J567YoXFA3LbhTj6q46mxWK1ITR1IEB
 CoNrvM4cdajrvJc4LA87PqXEykV2VcQCsMEWx9DTBy37BY0HuBo3hAKvN9BmhtsfD1fG
 bWTQfxZq6tI1pIl0yZ4Aar3SsNYuYzMdMNJ2nBNqF9sN1N+izul55eNYG7uF4+/2OniI zg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hx9c1yrtp-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 07:52:46 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 19 Aug
 2022 07:52:35 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 19 Aug 2022 07:52:35 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2BF2311DA;
 Fri, 19 Aug 2022 12:52:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 12/12] ASoC: cs42l42: Add support for Soundwire interrupts
Date: Fri, 19 Aug 2022 13:52:30 +0100
Message-ID: <20220819125230.42731-13-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819125230.42731-1-rf@opensource.cirrus.com>
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1KuQ84OFZmYMzgHL1qMs9r8dp6A6aMPj
X-Proofpoint-GUID: 1KuQ84OFZmYMzgHL1qMs9r8dp6A6aMPj
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

This adds support for using the Soundwire interrupt mechanism to
handle CS42L42 chip interrupts.

Soundwire interrupts are used if a hard INT line is not declared.

Wake-from-clock-stop is not used. The CS42L42 has limited wake
capability, but clock-stop is already disabled when a snd_soc_jack is
registered to prevent the host controller issuing a bus-reset on exit
from clock stop mode, which would clear the interrupt status and break
jack and button detection.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42-sdw.c | 90 +++++++++++++++++++++++++++++++++-
 sound/soc/codecs/cs42l42.h     |  3 ++
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index ed69a0a44d8c..1bdeed93587d 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -14,6 +14,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/workqueue.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -26,6 +27,8 @@
 /* Register addresses are offset when sent over Soundwire */
 #define CS42L42_SDW_ADDR_OFFSET		0x8000
 
+#define CS42L42_SDW_GEN_INT_STATUS_1	0xc0
+#define CS42L42_SDW_GEN_INT_MASK_1	0xc1
 #define CS42L42_SDW_MEM_ACCESS_STATUS	0xd0
 #define CS42L42_SDW_MEM_READ_DATA	0xd8
 
@@ -33,6 +36,11 @@
 #define CS42L42_SDW_CMD_IN_PROGRESS	BIT(2)
 #define CS42L42_SDW_RDATA_RDY		BIT(0)
 
+#define CS42L42_SDW_M_SCP_IMP_DEF1	BIT(0)
+#define CS42L42_GEN_INT_CASCADE		SDW_SCP_INT1_IMPL_DEF
+
+#define CS42L42_SDW_INT_MASK_CODEC_IRQ	BIT(0)
+
 #define CS42L42_DELAYED_READ_POLL_US	1
 #define CS42L42_DELAYED_READ_TIMEOUT_US	100
 
@@ -306,6 +314,13 @@ static void cs42l42_sdw_init(struct sdw_slave *peripheral)
 	/* Disable internal logic that makes clock-stop conditional */
 	regmap_clear_bits(cs42l42->regmap, CS42L42_PWR_CTL3, CS42L42_SW_CLK_STP_STAT_SEL_MASK);
 
+	/* Enable Soundwire interrupts */
+	if (!cs42l42->irq) {
+		dev_dbg(cs42l42->dev, "Using Soundwire interrupts\n");
+		sdw_write_no_pm(peripheral, CS42L42_SDW_GEN_INT_MASK_1,
+				CS42L42_SDW_INT_MASK_CODEC_IRQ);
+	}
+
 	/*
 	 * pm_runtime is needed to control bus manager suspend, and to
 	 * recover from an unattach_request when the manager suspends.
@@ -319,6 +334,49 @@ static void cs42l42_sdw_init(struct sdw_slave *peripheral)
 	pm_runtime_idle(cs42l42->dev);
 }
 
+static int cs42l42_sdw_interrupt(struct sdw_slave *peripheral,
+				 struct sdw_slave_intr_status *status)
+{
+	struct cs42l42_private *cs42l42 = dev_get_drvdata(&peripheral->dev);
+
+	/* Soundwire core holds our pm_runtime when calling this function. */
+
+	dev_dbg(cs42l42->dev, "int control_port=0x%x\n", status->control_port);
+
+	if ((status->control_port & CS42L42_GEN_INT_CASCADE) == 0)
+		return 0;
+
+	/*
+	 * Clear and mask until it has been handled. The read of GEN_INT_STATUS_1
+	 * is required as per the Soundwire spec for interrupt status bits to clear.
+	 */
+	sdw_write_no_pm(peripheral, CS42L42_SDW_GEN_INT_MASK_1, 0);
+	sdw_read_no_pm(peripheral, CS42L42_SDW_GEN_INT_STATUS_1);
+	sdw_write_no_pm(peripheral, CS42L42_SDW_GEN_INT_STATUS_1, 0xFF);
+	queue_work(system_power_efficient_wq, &cs42l42->sdw_irq_work);
+
+	/* Prevent host controller suspending before we handle the interrupt */
+	pm_runtime_get_noresume(cs42l42->dev);
+
+	return 0;
+}
+
+static void cs42l42_sdw_irq_work(struct work_struct *work)
+{
+	struct cs42l42_private *cs42l42 = container_of(work,
+						       struct cs42l42_private,
+						       sdw_irq_work);
+
+	cs42l42_irq_thread(-1, cs42l42);
+
+	/* unmask interrupt */
+	if (!cs42l42->sdw_irq_no_unmask)
+		sdw_write_no_pm(cs42l42->sdw_peripheral, CS42L42_SDW_GEN_INT_MASK_1,
+				CS42L42_SDW_INT_MASK_CODEC_IRQ);
+
+	pm_runtime_put_autosuspend(cs42l42->dev);
+}
+
 static int cs42l42_sdw_read_prop(struct sdw_slave *peripheral)
 {
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(&peripheral->dev);
@@ -334,6 +392,14 @@ static int cs42l42_sdw_read_prop(struct sdw_slave *peripheral)
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
+	/*
+	 * CS42L42 doesn't have a SDW_SCP_INT1_IMPL_DEF mask bit but it must be
+	 * set in scp_int1_mask else the Soundwire framework won't notify us
+	 * when the IMPL_DEF interrupt is asserted.
+	 */
+	if (!cs42l42->irq)
+		prop->scp_int1_mask |= SDW_SCP_INT1_IMPL_DEF;
+
 	/* DP1 - capture */
 	ports[0].num = CS42L42_SDW_CAPTURE_PORT,
 	ports[0].type = SDW_DPN_FULL,
@@ -403,6 +469,7 @@ static int __maybe_unused cs42l42_sdw_clk_stop(struct sdw_slave *peripheral,
 
 static const struct sdw_slave_ops cs42l42_sdw_ops = {
 	.read_prop = cs42l42_sdw_read_prop,
+	.interrupt_callback = cs42l42_sdw_interrupt,
 	.update_status = cs42l42_sdw_update_status,
 	.bus_config = cs42l42_sdw_bus_config,
 #ifdef DEBUG
@@ -473,6 +540,11 @@ static int __maybe_unused cs42l42_sdw_runtime_resume(struct device *dev)
 	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
 	regcache_sync(cs42l42->regmap);
 
+	/* Re-enable Soundwire interrupts */
+	if (!cs42l42->irq)
+		sdw_write_no_pm(cs42l42->sdw_peripheral, CS42L42_SDW_GEN_INT_MASK_1,
+				CS42L42_SDW_INT_MASK_CODEC_IRQ);
+
 	return 0;
 }
 
@@ -495,6 +567,11 @@ static int __maybe_unused cs42l42_sdw_resume(struct device *dev)
 
 	cs42l42_resume_restore(dev);
 
+	/* Re-enable Soundwire interrupts */
+	if (!cs42l42->irq)
+		sdw_write_no_pm(cs42l42->sdw_peripheral, CS42L42_SDW_GEN_INT_MASK_1,
+				CS42L42_SDW_INT_MASK_CODEC_IRQ);
+
 	return 0;
 }
 
@@ -546,6 +623,7 @@ static int cs42l42_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 	component_drv->dapm_routes = cs42l42_sdw_audio_map;
 	component_drv->num_dapm_routes = ARRAY_SIZE(cs42l42_sdw_audio_map);
 
+	INIT_WORK(&cs42l42->sdw_irq_work, cs42l42_sdw_irq_work);
 	cs42l42->dev = dev;
 	cs42l42->regmap = regmap;
 	cs42l42->sdw_peripheral = peripheral;
@@ -562,8 +640,18 @@ static int cs42l42_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(&peripheral->dev);
 
-	/* Resume so that cs42l42_remove() can access registers */
+	/* Resume so that we can access registers */
 	pm_runtime_get_sync(cs42l42->dev);
+
+	/* Disable Soundwire interrupts */
+	if (!cs42l42->irq) {
+		cs42l42->sdw_irq_no_unmask = true;
+		cancel_work_sync(&cs42l42->sdw_irq_work);
+		sdw_write_no_pm(peripheral, CS42L42_SDW_GEN_INT_MASK_1, 0);
+		sdw_read_no_pm(peripheral, CS42L42_SDW_GEN_INT_STATUS_1);
+		sdw_write_no_pm(peripheral, CS42L42_SDW_GEN_INT_STATUS_1, 0xFF);
+	}
+
 	cs42l42_common_remove(cs42l42);
 	pm_runtime_put(cs42l42->dev);
 	pm_runtime_disable(cs42l42->dev);
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 038db45d95b3..b29126d218c4 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/workqueue.h>
 #include <sound/jack.h>
 #include <sound/cs42l42.h>
 #include <sound/soc-component.h>
@@ -32,6 +33,7 @@ struct  cs42l42_private {
 	struct completion pdn_done;
 	struct snd_soc_jack *jack;
 	struct sdw_slave *sdw_peripheral;
+	struct work_struct sdw_irq_work;
 	struct mutex irq_lock;
 	int irq;
 	int pll_config;
@@ -52,6 +54,7 @@ struct  cs42l42_private {
 	bool hp_adc_up_pending;
 	bool suspended;
 	bool init_done;
+	bool sdw_irq_no_unmask;
 };
 
 extern const struct regmap_config cs42l42_regmap;
-- 
2.30.2

