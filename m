Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99666206BBA
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 07:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9F617E7;
	Wed, 24 Jun 2020 07:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9F617E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592976778;
	bh=JbNrFgLqa1UhOPk0L1v+djmi6G0BCDkKVoP23gx0kzU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j9NG3IrGe036dY4SV5YG587ITyTjRX6p9OPA02LL8Wz/+jMA1GJ2CsLzCN4SRXYaa
	 Qbia8pMoCCdz4CAbpxklch1Q+fil92wQaQBGnVNSPLVRqNNO10M4R6PKTVTseBiSJh
	 2TB3WbJorQUwD39UsQ9kHG417nvICIYt/ZgfNNJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E60EF802A8;
	Wed, 24 Jun 2020 07:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECA2EF802A2; Wed, 24 Jun 2020 07:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5831F80268
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 07:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5831F80268
IronPort-SDR: 7BZLMg8z/xoFOYJiYVY86DXE/VEUug8Xk/VcjSQaYOyps4Su1o98or/TL46jGpTwSfSoZPc4WZ
 dO7WsAaXaqZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="131775981"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="131775981"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 22:30:11 -0700
IronPort-SDR: 6qCjaBh756XqDD1clRqa/Sk30co5NJU1FxK+EtZTZG0fuOjWw3u9OXaRJ1EeSpKMRh/1iux4nc
 DkmZlTqqFcrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="452513392"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005.jf.intel.com with ESMTP; 23 Jun 2020 22:30:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/9] soundwire: intel: introduce a helper to arm link
 synchronization
Date: Wed, 24 Jun 2020 01:35:40 +0800
Message-Id: <20200623173546.21870-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

Move code from pre_bank_switch to dedicated helper, will be used in
follow-up patches as recommended by programming flows.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 4792613e8e5a..6a745602c9cc 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -497,6 +497,21 @@ static int __maybe_unused intel_link_power_down(struct sdw_intel *sdw)
 	return 0;
 }
 
+static void intel_shim_sync_arm(struct sdw_intel *sdw)
+{
+	void __iomem *shim = sdw->link_res->shim;
+	u32 sync_reg;
+
+	mutex_lock(sdw->link_res->shim_lock);
+
+	/* update SYNC register */
+	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
+	sync_reg |= (SDW_SHIM_SYNC_CMDSYNC << sdw->instance);
+	intel_writel(shim, SDW_SHIM_SYNC, sync_reg);
+
+	mutex_unlock(sdw->link_res->shim_lock);
+}
+
 /*
  * PDI routines
  */
@@ -710,21 +725,12 @@ static int intel_pre_bank_switch(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
-	void __iomem *shim = sdw->link_res->shim;
-	int sync_reg;
 
 	/* Write to register only for multi-link */
 	if (!bus->multi_link)
 		return 0;
 
-	mutex_lock(sdw->link_res->shim_lock);
-
-	/* Read SYNC register */
-	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
-	sync_reg |= SDW_SHIM_SYNC_CMDSYNC << sdw->instance;
-	intel_writel(shim, SDW_SHIM_SYNC, sync_reg);
-
-	mutex_unlock(sdw->link_res->shim_lock);
+	intel_shim_sync_arm(sdw);
 
 	return 0;
 }
-- 
2.17.1

