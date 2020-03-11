Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D46182489
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 23:14:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADC516A5;
	Wed, 11 Mar 2020 23:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADC516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583964864;
	bh=0E+KLM4iX7FVs/CDB/tksPDYHm7M8eZRstRc0NyeTIY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aeF+p6bJUJ6clbCF8Qwi39iJseDEXwx08h/kEq0aADSoc7n2vKm1NrJgSHB9h0oOL
	 HJqW/TPVIyhHdDACWBR4EI3e9J2rH7svT4Zr/P0lZ113YbJSFeKnEB9Qx08mzNVi/V
	 QNAxiRx2e+wXTLKVpaSRPcI7q5ModueZ68SJn9L4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 591BBF802A0;
	Wed, 11 Mar 2020 23:11:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFF29F8026F; Wed, 11 Mar 2020 23:10:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1638FF801F8
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 23:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1638FF801F8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 15:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,542,1574150400"; d="scan'208";a="277550577"
Received: from fjan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.25.157])
 by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2020 15:10:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] soundwire: intel: add mutex to prevent concurrent access
 to SHIM registers
Date: Wed, 11 Mar 2020 17:10:22 -0500
Message-Id: <20200311221026.18174-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Some of the SHIM registers exposed fields that are link specific, and
in addition some of the power-related registers (SPA/CPA) take time to
be updated. Uncontrolled access leads to timeouts or errors.

Add a mutex, shared by all links, so that all accesses to such
registers are serialized, and follow a pattern of read-modify-write.

The mutex initialization is done at the higher layer since the same
mutex is used for all links.

GitHub issue: https://github.com/thesofproject/linux/issues/1555
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 37 +++++++++++++++++++++++++++++++------
 drivers/soundwire/intel.h |  2 ++
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 1a3b828b03a1..3c271a8044b8 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -286,6 +286,8 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 	int spa_mask, cpa_mask;
 	int link_control, ret;
 
+	mutex_lock(sdw->link_res->shim_lock);
+
 	/* Link power up sequence */
 	link_control = intel_readl(shim, SDW_SHIM_LCTL);
 	spa_mask = (SDW_SHIM_LCTL_SPA << link_id);
@@ -293,6 +295,8 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 	link_control |=  spa_mask;
 
 	ret = intel_set_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
+	mutex_unlock(sdw->link_res->shim_lock);
+
 	if (ret < 0)
 		return ret;
 
@@ -307,6 +311,8 @@ static int intel_shim_init(struct sdw_intel *sdw)
 	int sync_reg, ret;
 	u16 ioctl = 0, act = 0;
 
+	mutex_lock(sdw->link_res->shim_lock);
+
 	/* Initialize Shim */
 	ioctl |= SDW_SHIM_IOCTL_BKE;
 	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
@@ -351,6 +357,8 @@ static int intel_shim_init(struct sdw_intel *sdw)
 	sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
 	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
 			      SDW_SHIM_SYNC_SYNCCPU);
+	mutex_unlock(sdw->link_res->shim_lock);
+
 	if (ret < 0)
 		dev_err(sdw->cdns.dev, "Failed to set sync period: %d\n", ret);
 
@@ -363,13 +371,15 @@ static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 	unsigned int link_id = sdw->instance;
 	u16 wake_en, wake_sts;
 
+	mutex_lock(sdw->link_res->shim_lock);
+	wake_en = intel_readw(shim, SDW_SHIM_WAKEEN);
+
 	if (wake_enable) {
 		/* Enable the wakeup */
-		intel_writew(shim, SDW_SHIM_WAKEEN,
-			     (SDW_SHIM_WAKEEN_ENABLE << link_id));
+		wake_en |= (SDW_SHIM_WAKEEN_ENABLE << link_id);
+		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
 	} else {
 		/* Disable the wake up interrupt */
-		wake_en = intel_readw(shim, SDW_SHIM_WAKEEN);
 		wake_en &= ~(SDW_SHIM_WAKEEN_ENABLE << link_id);
 		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
 
@@ -378,6 +388,7 @@ static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 		wake_sts |= (SDW_SHIM_WAKEEN_ENABLE << link_id);
 		intel_writew(shim, SDW_SHIM_WAKESTS_STATUS, wake_sts);
 	}
+	mutex_unlock(sdw->link_res->shim_lock);
 }
 
 static int intel_link_power_down(struct sdw_intel *sdw)
@@ -387,6 +398,8 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 	void __iomem *shim = sdw->link_res->shim;
 	u16 ioctl;
 
+	mutex_lock(sdw->link_res->shim_lock);
+
 	/* Glue logic */
 	ioctl = intel_readw(shim, SDW_SHIM_IOCTL(link_id));
 	ioctl |= SDW_SHIM_IOCTL_BKE;
@@ -403,6 +416,8 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 	link_control &=  spa_mask;
 
 	ret = intel_clear_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
+	mutex_unlock(sdw->link_res->shim_lock);
+
 	if (ret < 0)
 		return ret;
 
@@ -630,11 +645,15 @@ static int intel_pre_bank_switch(struct sdw_bus *bus)
 	if (!bus->multi_link)
 		return 0;
 
+	mutex_lock(sdw->link_res->shim_lock);
+
 	/* Read SYNC register */
 	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
 	sync_reg |= SDW_SHIM_SYNC_CMDSYNC << sdw->instance;
 	intel_writel(shim, SDW_SHIM_SYNC, sync_reg);
 
+	mutex_unlock(sdw->link_res->shim_lock);
+
 	return 0;
 }
 
@@ -649,6 +668,8 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
 	if (!bus->multi_link)
 		return 0;
 
+	mutex_lock(sdw->link_res->shim_lock);
+
 	/* Read SYNC register */
 	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
 
@@ -660,9 +681,10 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
 	 *
 	 * So, set the SYNCGO bit only if CMDSYNC bit is set for any Master.
 	 */
-	if (!(sync_reg & SDW_SHIM_SYNC_CMDSYNC_MASK))
-		return 0;
-
+	if (!(sync_reg & SDW_SHIM_SYNC_CMDSYNC_MASK)) {
+		ret = 0;
+		goto unlock;
+	}
 	/*
 	 * Set SyncGO bit to synchronously trigger a bank switch for
 	 * all the masters. A write to SYNCGO bit clears CMDSYNC bit for all
@@ -672,6 +694,9 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
 
 	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
 			      SDW_SHIM_SYNC_SYNCGO);
+unlock:
+	mutex_unlock(sdw->link_res->shim_lock);
+
 	if (ret < 0)
 		dev_err(sdw->cdns.dev, "Post bank switch failed: %d\n", ret);
 
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 38b7c125fb10..568c84a80d79 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -15,6 +15,7 @@
  * @irq: Interrupt line
  * @ops: Shim callback ops
  * @dev: device implementing hw_params and free callbacks
+ * @shim_lock: mutex to handle access to shared SHIM registers
  */
 struct sdw_intel_link_res {
 	struct platform_device *pdev;
@@ -25,6 +26,7 @@ struct sdw_intel_link_res {
 	int irq;
 	const struct sdw_intel_ops *ops;
 	struct device *dev;
+	struct mutex *shim_lock; /* protect shared registers */
 };
 
 #endif /* __SDW_INTEL_LOCAL_H */
-- 
2.20.1

