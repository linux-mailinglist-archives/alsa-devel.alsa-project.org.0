Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9731182494
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 23:16:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A345316CF;
	Wed, 11 Mar 2020 23:15:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A345316CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583964968;
	bh=MEisn/MasuBrpLdxtcfBv3X9C/PEfKQ0XRx/oFxvVB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vFkXk1tfKaatpO5yipOCZcsGJOHSftaS6VQwBuhy4vhR/36wakXAMV2f9VtGgTLnt
	 NnQR+SF3Z7GcfD4XNe+qI8iNpoeN0cItHyD/N0xp+ZQZeu7RqsthHrRZr1CYwRBwOL
	 MjP1rcTQ5I+Jd4l+r5sZ5LQUNOQ806TvkPNybkUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E276F802D2;
	Wed, 11 Mar 2020 23:11:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA6FF80217; Wed, 11 Mar 2020 23:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1477F80217
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 23:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1477F80217
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 15:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,542,1574150400"; d="scan'208";a="277550591"
Received: from fjan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.25.157])
 by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2020 15:10:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] soundwire: intel: add definitions for shim_mask
Date: Wed, 11 Mar 2020 17:10:23 -0500
Message-Id: <20200311221026.18174-5-pierre-louis.bossart@linux.intel.com>
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

We want to make sure SHIM register fields such as SYNCPRD are only
programmed once. Since we don't have a controller-level driver, we
need master-level drivers to collaborate: the registers will only be
programmed when the first link is powered-up.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.h           | 2 ++
 include/linux/soundwire/sdw_intel.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 568c84a80d79..cfc83120b8f9 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -16,6 +16,7 @@
  * @ops: Shim callback ops
  * @dev: device implementing hw_params and free callbacks
  * @shim_lock: mutex to handle access to shared SHIM registers
+ * @shim_mask: global pointer to check SHIM register initialization
  */
 struct sdw_intel_link_res {
 	struct platform_device *pdev;
@@ -27,6 +28,7 @@ struct sdw_intel_link_res {
 	const struct sdw_intel_ops *ops;
 	struct device *dev;
 	struct mutex *shim_lock; /* protect shared registers */
+	u32 *shim_mask;
 };
 
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 979b41b5dcb4..120ffddc03d2 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -115,6 +115,7 @@ struct sdw_intel_slave_id {
  * links
  * @link_list: list to handle interrupts across all links
  * @shim_lock: mutex to handle concurrent rmw access to shared SHIM registers.
+ * @shim_mask: flags to track initialization of SHIM shared registers
  */
 struct sdw_intel_ctx {
 	int count;
@@ -126,6 +127,7 @@ struct sdw_intel_ctx {
 	struct sdw_intel_slave_id *ids;
 	struct list_head link_list;
 	struct mutex shim_lock; /* lock for access to shared SHIM registers */
+	u32 shim_mask;
 };
 
 /**
-- 
2.20.1

