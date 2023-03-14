Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF906B87B3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:44:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E77F71478;
	Tue, 14 Mar 2023 02:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E77F71478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758241;
	bh=gHC1L9M9Gcn75VIlZPVSTJ0/8DWLLL6154TEcRehIwE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EjzFoI0Ac/Ov/ZjszbXSaOcbcMWXplEC4LQ6+w5IzS+KV3n6UJeBCSxZWugIeVR6u
	 RYM+y0d22hQvayUX4Vvo8/YlMGPb2loodUeJ2ZLllDDbA52HVHe6ETeghwpGp8fZPg
	 HpG6UI5Ld8zRrnAPl4PXLkHf4n+TJ04Fs9mJ87S0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81733F8056F;
	Tue, 14 Mar 2023 02:41:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8570F8053B; Tue, 14 Mar 2023 02:41:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B22EF804B1
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B22EF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zq3X9C3l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758082; x=1710294082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHC1L9M9Gcn75VIlZPVSTJ0/8DWLLL6154TEcRehIwE=;
  b=Zq3X9C3lmnAAWq3bv9Jm/94gaO4tqsbLdGG4Y3ZbugR3bcwNAs89WlE/
   tXqV+BQZuu8MJpUieH47/S8bPJpy2UhVaQhbYLGljhkh+FwNxlIddxo5E
   ioLG3IIH0GJOhP1Mno54WU3KpmQZCt2SDy41QC08kSqyI1o76s51NyD0d
   sdYhuLjiBZHwMZeFAN9DHfcm+OCC0cigoHYMVMR+IpGJ50p96GAl2aqwL
   Pp297L2/yE2pALG9ZV9+YY1vWG4lWWhSK24WJfpPlfbTTGn80ZSjE/6/R
   GSpuF5o38NYJIM1ZvKr5amv1IX+V5bsyjA6w3kLKj2UvtvIz+XplNzIw6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949251"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949251"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327422"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327422"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 06/16] soundwire: intel: add sync_arm/sync_go to ops
Date: Tue, 14 Mar 2023 09:54:00 +0800
Message-Id: <20230314015410.487311-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QF6WYEVTCSC5TJLL6F2LUP4OPKXM62MG
X-Message-ID-Hash: QF6WYEVTCSC5TJLL6F2LUP4OPKXM62MG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QF6WYEVTCSC5TJLL6F2LUP4OPKXM62MG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The bus start/stop sequences can be reused between platforms if we add
a couple of new callbacks. In following patches the code will be moved to
a shared file.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 16 ++++++++++------
 drivers/soundwire/intel.h           | 20 ++++++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  8 ++++++++
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 6fdb10117e59..902934cbb27b 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -686,7 +686,7 @@ static int intel_pre_bank_switch(struct sdw_intel *sdw)
 	if (!bus->multi_link)
 		return 0;
 
-	intel_shim_sync_arm(sdw);
+	sdw_intel_sync_arm(sdw);
 
 	return 0;
 }
@@ -720,7 +720,7 @@ static int intel_post_bank_switch(struct sdw_intel *sdw)
 		goto unlock;
 	}
 
-	ret = intel_shim_sync_go_unlocked(sdw);
+	ret = sdw_intel_sync_go_unlocked(sdw);
 unlock:
 	mutex_unlock(sdw->link_res->shim_lock);
 
@@ -1140,7 +1140,7 @@ static int intel_start_bus(struct sdw_intel *sdw)
 	 * gsync is enabled
 	 */
 	if (bus->multi_link)
-		intel_shim_sync_arm(sdw);
+		sdw_intel_sync_arm(sdw);
 
 	ret = sdw_cdns_init(cdns);
 	if (ret < 0) {
@@ -1155,7 +1155,7 @@ static int intel_start_bus(struct sdw_intel *sdw)
 	}
 
 	if (bus->multi_link) {
-		ret = intel_shim_sync_go(sdw);
+		ret = sdw_intel_sync_go(sdw);
 		if (ret < 0) {
 			dev_err(dev, "%s: sync go failed: %d\n", __func__, ret);
 			goto err_interrupt;
@@ -1210,7 +1210,7 @@ static int intel_start_bus_after_reset(struct sdw_intel *sdw)
 		 * timeouts when gsync is enabled
 		 */
 		if (bus->multi_link)
-			intel_shim_sync_arm(sdw);
+			sdw_intel_sync_arm(sdw);
 
 		/*
 		 * Re-initialize the IP since it was powered-off
@@ -1239,7 +1239,7 @@ static int intel_start_bus_after_reset(struct sdw_intel *sdw)
 		}
 
 		if (bus->multi_link) {
-			ret = intel_shim_sync_go(sdw);
+			ret = sdw_intel_sync_go(sdw);
 			if (ret < 0) {
 				dev_err(sdw->cdns.dev, "sync go failed during resume\n");
 				goto err_interrupt;
@@ -1342,6 +1342,10 @@ const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
 
 	.pre_bank_switch = intel_pre_bank_switch,
 	.post_bank_switch = intel_post_bank_switch,
+
+	.sync_arm = intel_shim_sync_arm,
+	.sync_go_unlocked = intel_shim_sync_go_unlocked,
+	.sync_go = intel_shim_sync_go,
 };
 EXPORT_SYMBOL_NS(sdw_intel_cnl_hw_ops, SOUNDWIRE_INTEL);
 
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 089c41babfc1..28b21a92e28b 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -167,4 +167,24 @@ static inline void sdw_intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 		SDW_INTEL_OPS(sdw, shim_wake)(sdw, wake_enable);
 }
 
+static inline void sdw_intel_sync_arm(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, sync_arm))
+		SDW_INTEL_OPS(sdw, sync_arm)(sdw);
+}
+
+static inline int sdw_intel_sync_go_unlocked(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, sync_go_unlocked))
+		return SDW_INTEL_OPS(sdw, sync_go_unlocked)(sdw);
+	return -ENOTSUPP;
+}
+
+static inline int sdw_intel_sync_go(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, sync_go))
+		return SDW_INTEL_OPS(sdw, sync_go)(sdw);
+	return -ENOTSUPP;
+}
+
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 91f0dc564fe5..06fa30929ebd 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -309,6 +309,10 @@ struct sdw_intel;
  * @shim_wake: enable/disable in-band wake management
  * @pre_bank_switch: helper for bus management
  * @post_bank_switch: helper for bus management
+ * @sync_arm: helper for multi-link synchronization
+ * @sync_go_unlocked: helper for multi-link synchronization -
+ * shim_lock is assumed to be locked at higher level
+ * @sync_go: helper for multi-link synchronization
  */
 struct sdw_intel_hw_ops {
 	void (*debugfs_init)(struct sdw_intel *sdw);
@@ -330,6 +334,10 @@ struct sdw_intel_hw_ops {
 
 	int (*pre_bank_switch)(struct sdw_intel *sdw);
 	int (*post_bank_switch)(struct sdw_intel *sdw);
+
+	void (*sync_arm)(struct sdw_intel *sdw);
+	int (*sync_go_unlocked)(struct sdw_intel *sdw);
+	int (*sync_go)(struct sdw_intel *sdw);
 };
 
 extern const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops;
-- 
2.25.1

