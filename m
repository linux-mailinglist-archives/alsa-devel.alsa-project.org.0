Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3DFCD8E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:29:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FA34168A;
	Thu, 14 Nov 2019 19:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FA34168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573756168;
	bh=364odql/S/5kh3Wcl+H/u9GmWDMKpNuZ18Sy/I7Nabs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pPQimi7wY4nT1doJLNCsq+uUgFdGI8PZWkp5ie6ZyYmwlGBjQJhhIcRxjTVJjxv2g
	 NLDU413Kfm65AyFHcd/Pz6dZkH6ReFWINoiQg2GqBH78vHDhXzH6tjn7tlaIG48lyH
	 WmbpiM4o+H52njeTjjpbvFaWnWDGBjFWUSs5kFxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B56FF8023E;
	Thu, 14 Nov 2019 19:18:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE15F80139; Thu, 14 Nov 2019 19:18:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61B13F80117
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B13F80117
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="195123523"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2019 10:17:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 12:16:54 -0600
Message-Id: <20191114181702.22254-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
References: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 14/22] soundwire: bus: fix race condition by
	tracking UNATTACHED transition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In previous patches, we added enumeration_ and initialization_complete
fields to avoid race conditions. When streaming restarts, the Master
first resumes, then requests all Slaves to renumerate/reinitialized,
and then the Slave devices resume.

Intel validation exposed a corner case where the Slave device may
transition to D3 when streaming stops, but streaming restarts before
the Master transitions to D3. In that case, the Slave status was not
cleared as UNATTACHED, and the wait_for_completion will time out.

The proposed solution is that when the Master clears the Slave(s)
status, the reason for the Slave(s) becoming unattached is
memorized. When the slave resumes, it can check if a Master-initiated
re-enumeration and initialization takes place and skip the
wait_for_completion() if there is no reason to wait.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c   |  5 ++++-
 drivers/soundwire/bus.h   |  8 +++++++-
 drivers/soundwire/intel.c | 16 ++++++++++++----
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 329f35a40649..ddc3042e15e0 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1154,7 +1154,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 }
 EXPORT_SYMBOL(sdw_handle_slave_status);
 
-void sdw_clear_slave_status(struct sdw_bus *bus)
+void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 {
 	struct sdw_slave *slave;
 	int i;
@@ -1174,6 +1174,9 @@ void sdw_clear_slave_status(struct sdw_bus *bus)
 
 		if (slave->status != SDW_SLAVE_UNATTACHED)
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
+
+		/* keep track of request, used in pm_runtime resume */
+		slave->unattach_request = request;
 	}
 }
 EXPORT_SYMBOL(sdw_clear_slave_status);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 4e6fb5d2f5cc..ee362472003a 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -167,6 +167,12 @@ sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 	return sdw_write(slave, addr, tmp);
 }
 
-void sdw_clear_slave_status(struct sdw_bus *bus);
+/*
+ * At the moment we only track Master-initiated hw_reset.
+ * Additional fields can be added as needed
+ */
+#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
+
+void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
 
 #endif /* __SDW_BUS_H */
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index e3741c3afe1c..69b0c8f65ad8 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1402,8 +1402,12 @@ static int intel_resume(struct device *dev)
 		return ret;
 	}
 
-	/* make sure all Slaves are tagged as UNATTACHED */
-	sdw_clear_slave_status(&sdw->cdns.bus);
+	/*
+	 * make sure all Slaves are tagged as UNATTACHED and provide
+	 * reason for reinitialization
+	 */
+	sdw_clear_slave_status(&sdw->cdns.bus,
+			       SDW_UNATTACH_REQUEST_MASTER_RESET);
 
 	ret = sdw_cdns_enable_interrupt(cdns, true);
 	if (ret < 0) {
@@ -1438,8 +1442,12 @@ static int intel_resume_runtime(struct device *dev)
 		return ret;
 	}
 
-	/* make sure all Slaves are tagged as UNATTACHED */
-	sdw_clear_slave_status(&sdw->cdns.bus);
+	/*
+	 * make sure all Slaves are tagged as UNATTACHED and provide
+	 * reason for reinitialization
+	 */
+	sdw_clear_slave_status(&sdw->cdns.bus,
+			       SDW_UNATTACH_REQUEST_MASTER_RESET);
 
 	ret = sdw_cdns_enable_interrupt(cdns, true);
 	if (ret < 0) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
