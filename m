Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2361206BCB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 07:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8863217EA;
	Wed, 24 Jun 2020 07:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8863217EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592976919;
	bh=kVR+J/tUxx71xlMbiuF2O7AmytkaCUNXJyUo0LqkcdY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gwb6o2VobAEK0Vm6uZnHxgalnKRfcfRBnmdZZcgGP6MFtmmkzUCdp3jVWVDS+muVe
	 gIC/+FOa5Qw5uP6Gi/CCT0pDop3avYchHEK8ysMUsDxyZlB7lErxhF/S1n5dlAal99
	 xJO6KblRXgTxQ606A33Vd/z8VnxTOE3ucwyS00uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97439F802E8;
	Wed, 24 Jun 2020 07:30:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89090F802E8; Wed, 24 Jun 2020 07:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2993BF80268
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 07:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2993BF80268
IronPort-SDR: +o4gTL6iKw6OguEeYCwK4EI0O+LI+Mrd3G4vUkMHrcwBloIRP2w4erho9+LauM8VjWiccUozv2
 /vhpcPQK1aWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="124007090"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="124007090"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 22:30:16 -0700
IronPort-SDR: O44QHjD7Jj0ESHuJiFKj1pAFKeLXQVMNtQZpIIw4xWGLEqJW96BGJ4WzFalrV2Neg4mGCWefyS
 Vg97XyNOpRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="452513423"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005.jf.intel.com with ESMTP; 23 Jun 2020 22:30:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/9] soundwire: intel: introduce helper for link
 synchronization
Date: Wed, 24 Jun 2020 01:35:41 +0800
Message-Id: <20200623173546.21870-5-yung-chuan.liao@linux.intel.com>
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

After arming the synchronization, the SYNCGO field controls the
hardware-based synchronization between links.

Move the programming and wait for clear of SYNCGO to dedicated helper.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 6a745602c9cc..0a4fc7f65743 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -512,6 +512,31 @@ static void intel_shim_sync_arm(struct sdw_intel *sdw)
 	mutex_unlock(sdw->link_res->shim_lock);
 }
 
+static int intel_shim_sync_go_unlocked(struct sdw_intel *sdw)
+{
+	void __iomem *shim = sdw->link_res->shim;
+	u32 sync_reg;
+	int ret;
+
+	/* Read SYNC register */
+	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
+
+	/*
+	 * Set SyncGO bit to synchronously trigger a bank switch for
+	 * all the masters. A write to SYNCGO bit clears CMDSYNC bit for all
+	 * the Masters.
+	 */
+	sync_reg |= SDW_SHIM_SYNC_SYNCGO;
+
+	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
+			      SDW_SHIM_SYNC_SYNCGO);
+
+	if (ret < 0)
+		dev_err(sdw->cdns.dev, "SyncGO clear failed: %d\n", ret);
+
+	return ret;
+}
+
 /*
  * PDI routines
  */
@@ -763,15 +788,8 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
 		ret = 0;
 		goto unlock;
 	}
-	/*
-	 * Set SyncGO bit to synchronously trigger a bank switch for
-	 * all the masters. A write to SYNCGO bit clears CMDSYNC bit for all
-	 * the Masters.
-	 */
-	sync_reg |= SDW_SHIM_SYNC_SYNCGO;
 
-	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
-			      SDW_SHIM_SYNC_SYNCGO);
+	ret = intel_shim_sync_go_unlocked(sdw);
 unlock:
 	mutex_unlock(sdw->link_res->shim_lock);
 
-- 
2.17.1

