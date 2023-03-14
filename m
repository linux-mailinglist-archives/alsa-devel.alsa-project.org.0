Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D366B87C7
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CB331486;
	Tue, 14 Mar 2023 02:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CB331486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758280;
	bh=pL6YG6BMqzUVh4Kle1zgXWisMHBEcSc8c1jkWgAQStg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eCrpGFG8woU+r5SAjxFM1kGqwc5nGoVdSbovfhmHXRTDdBWMwOd8eHJhCPMA4d+P6
	 DE/I54Dm6ANftt5gcBBUe4NjgsG2MgVWrwHYa+1iLLsriYG+XV2r65QI/xgPG3VZGC
	 JWynPwMoyR+/ZqvTL4K6InQBNTX2rXYMG2F1JI1Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCD32F8055C;
	Tue, 14 Mar 2023 02:41:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F280CF80563; Tue, 14 Mar 2023 02:41:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A40EF80551
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A40EF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lUCd2o8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758089; x=1710294089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pL6YG6BMqzUVh4Kle1zgXWisMHBEcSc8c1jkWgAQStg=;
  b=lUCd2o8BJ7Q1+1AzeN2dr9XEWJrkqSFSH6MnuxqSM5X3yG8P0o2ifo/b
   ksoLoUH7P8NOFxtS/A3ZOmPgjQsBEnyovgQDRFODEKOnqkck8u5k7QA8f
   xw4xyU+1cKQrPZlgiqx4Y2gnXlKnhyH1ev4IGbL9Px+mLwPXhpQGa20vd
   OGP182l4TcyZJJcvpgYl1aPz/26eRRUTT5cLTNzMilaiLApdWNvzv+cZC
   0Xpy/epHswU615QgIK5Rndekfspe5U/VcfpG6EKFTJmPhf/klLkIFJv5Q
   rNom0RnV1BPcdD1oQ5YES0HdFqpwf4IQgYG3GxMKU9R8anTqkvDX/jTxs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949277"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949277"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327475"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327475"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 09/16] soundwire: intel: add abstraction for cmdsync check
Date: Tue, 14 Mar 2023 09:54:03 +0800
Message-Id: <20230314015410.487311-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ONS7HORTKEAWW67SLUZTGVXREQ4P7YVI
X-Message-ID-Hash: ONS7HORTKEAWW67SLUZTGVXREQ4P7YVI
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONS7HORTKEAWW67SLUZTGVXREQ4P7YVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

If we add one more callback, we can have common bank switch sequences
between old and new hardware: the only difference is where the CMDSYNC
register is located.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 24 +++++++++++++-----------
 drivers/soundwire/intel.h           |  7 +++++++
 include/linux/soundwire/sdw_intel.h |  3 +++
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 77d698908595..1131ecb4b5e7 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -325,6 +325,15 @@ static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 	mutex_unlock(sdw->link_res->shim_lock);
 }
 
+static bool intel_check_cmdsync_unlocked(struct sdw_intel *sdw)
+{
+	void __iomem *shim = sdw->link_res->shim;
+	int sync_reg;
+
+	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
+	return !!(sync_reg & SDW_SHIM_SYNC_CMDSYNC_MASK);
+}
+
 static int intel_link_power_up(struct sdw_intel *sdw)
 {
 	unsigned int link_id = sdw->instance;
@@ -695,8 +704,7 @@ static int intel_post_bank_switch(struct sdw_intel *sdw)
 {
 	struct sdw_cdns *cdns = &sdw->cdns;
 	struct sdw_bus *bus = &cdns->bus;
-	void __iomem *shim = sdw->link_res->shim;
-	int sync_reg, ret;
+	int ret = 0;
 
 	/* Write to register only for multi-link */
 	if (!bus->multi_link)
@@ -704,9 +712,6 @@ static int intel_post_bank_switch(struct sdw_intel *sdw)
 
 	mutex_lock(sdw->link_res->shim_lock);
 
-	/* Read SYNC register */
-	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
-
 	/*
 	 * post_bank_switch() ops is called from the bus in loop for
 	 * all the Masters in the steam with the expectation that
@@ -715,13 +720,9 @@ static int intel_post_bank_switch(struct sdw_intel *sdw)
 	 *
 	 * So, set the SYNCGO bit only if CMDSYNC bit is set for any Master.
 	 */
-	if (!(sync_reg & SDW_SHIM_SYNC_CMDSYNC_MASK)) {
-		ret = 0;
-		goto unlock;
-	}
+	if (sdw_intel_sync_check_cmdsync_unlocked(sdw))
+		ret = sdw_intel_sync_go_unlocked(sdw);
 
-	ret = sdw_intel_sync_go_unlocked(sdw);
-unlock:
 	mutex_unlock(sdw->link_res->shim_lock);
 
 	if (ret < 0)
@@ -1147,6 +1148,7 @@ const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
 	.sync_arm = intel_shim_sync_arm,
 	.sync_go_unlocked = intel_shim_sync_go_unlocked,
 	.sync_go = intel_shim_sync_go,
+	.sync_check_cmdsync_unlocked = intel_check_cmdsync_unlocked,
 };
 EXPORT_SYMBOL_NS(sdw_intel_cnl_hw_ops, SOUNDWIRE_INTEL);
 
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index abd1a500defa..7a69cf755954 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -187,6 +187,13 @@ static inline int sdw_intel_sync_go(struct sdw_intel *sdw)
 	return -ENOTSUPP;
 }
 
+static inline bool sdw_intel_sync_check_cmdsync_unlocked(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, sync_check_cmdsync_unlocked))
+		return SDW_INTEL_OPS(sdw, sync_check_cmdsync_unlocked)(sdw);
+	return false;
+}
+
 /* common bus management */
 int intel_start_bus(struct sdw_intel *sdw);
 int intel_start_bus_after_reset(struct sdw_intel *sdw);
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 06fa30929ebd..207701aeeb47 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -313,6 +313,8 @@ struct sdw_intel;
  * @sync_go_unlocked: helper for multi-link synchronization -
  * shim_lock is assumed to be locked at higher level
  * @sync_go: helper for multi-link synchronization
+ * @sync_check_cmdsync_unlocked: helper for multi-link synchronization
+ * and bank switch - shim_lock is assumed to be locked at higher level
  */
 struct sdw_intel_hw_ops {
 	void (*debugfs_init)(struct sdw_intel *sdw);
@@ -338,6 +340,7 @@ struct sdw_intel_hw_ops {
 	void (*sync_arm)(struct sdw_intel *sdw);
 	int (*sync_go_unlocked)(struct sdw_intel *sdw);
 	int (*sync_go)(struct sdw_intel *sdw);
+	bool (*sync_check_cmdsync_unlocked)(struct sdw_intel *sdw);
 };
 
 extern const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops;
-- 
2.25.1

