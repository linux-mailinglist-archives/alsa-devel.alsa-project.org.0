Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35AE2487FF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872171765;
	Tue, 18 Aug 2020 16:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872171765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761764;
	bh=bQ2O3tXRTtXgin0JBoVJcBbXpwywCmGbImHvQvRud6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXz1KG5rdAinZG74lJPz3CLjZkGBsGc4HIO7xsCYCjvp14+Q1+G/5GJuF5MhztvdP
	 /mT2B2XxLBTKBR3lGSs9HKu08kG9ug8vpI7n2m5gtRD/mOxy+qJ+BW/s4HpTesmXy3
	 um2wsJGjCCSBAYxTuKXCjNSsbPNbUPNmJf0zgzbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1365AF80328;
	Tue, 18 Aug 2020 16:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD875F80328; Tue, 18 Aug 2020 16:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DADFF80307
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DADFF80307
IronPort-SDR: uSLSEJbmjQPP0vba2nwOt8qBUk9CpKmC2PGmik4rofLtxnI/7HOpRLpXBA4Q2D6nkfJB516Lrv
 K44PyPsTTfsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219223587"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="219223587"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:54 -0700
IronPort-SDR: rZQzk4DF3+xAvZfsyWodrluSh4F2EA7HqkIff5aE6I1tvoej7gQmzrAw+wnYCYMOJ9IH7EKeXN
 k20Ozb9nFSWQ==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830766"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 10/11] soundwire: intel: pass link_mask information to each
 master
Date: Tue, 18 Aug 2020 10:41:19 +0800
Message-Id: <20200818024120.20721-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

While the hardware exposes independent bits to power-up each master,
the recommended sequence is to power all links or none. Idle links can
still use the clock stop mode while the master is powered.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.h      | 2 ++
 drivers/soundwire/intel_init.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 23daab9da329..76820d0b9deb 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -18,6 +18,7 @@
  * @shim_lock: mutex to handle access to shared SHIM registers
  * @shim_mask: global pointer to check SHIM register initialization
  * @clock_stop_quirks: mask defining requested behavior on pm_suspend
+ * @link_mask: global mask needed for power-up/down sequences
  * @cdns: Cadence master descriptor
  * @list: used to walk-through all masters exposed by the same controller
  */
@@ -33,6 +34,7 @@ struct sdw_intel_link_res {
 	struct mutex *shim_lock; /* protect shared registers */
 	u32 *shim_mask;
 	u32 clock_stop_quirks;
+	u32 link_mask;
 	struct sdw_cdns *cdns;
 	struct list_head list;
 };
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index add46d8fc85c..65d9b9bd2106 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -255,6 +255,7 @@ static struct sdw_intel_ctx
 		link->clock_stop_quirks = res->clock_stop_quirks;
 		link->shim_lock = &ctx->shim_lock;
 		link->shim_mask = &ctx->shim_mask;
+		link->link_mask = link_mask;
 
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 
-- 
2.17.1

