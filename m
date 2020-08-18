Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E4F2492AE
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 04:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACBC717E3;
	Wed, 19 Aug 2020 04:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACBC717E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597802620;
	bh=o1djwyXk/r4Vvn8sX694HWa33X6NASZt0Z+0lmspHfU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GhzAFNPMsSDAumrhWntSE6Ldcjyg1WbylarbxODCmZash8eXBv7qU3oAPp5pTRkTK
	 b40nKG+7fsK2vp9l3OWDUqlkCFcpufn2P+YUr/CfSCKrYbUZyr1y/SlslGx7b1CJLs
	 UqeGQSFjeG1OM6lMtnL0+4bL7EVC877chG/oKD28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA0AF802C3;
	Wed, 19 Aug 2020 04:01:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0374F802A8; Wed, 19 Aug 2020 04:01:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8077EF80255
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 04:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8077EF80255
IronPort-SDR: m0J958BngjbJV2nZon1BB2cGTapmmXhNTB/34uvlxFOG5ff4SvUXXfEWCRu228vYRKJUpQvPTL
 lqAj1pggZ2xA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="239865530"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="239865530"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:00:55 -0700
IronPort-SDR: HFiMK+71vzfjaqILvMSnlPx1j6EU1tA9p1crHxcCqaYooaBg6YhuRwu297xKIyqYq9zUP5EMNm
 Kf01NPYtBPSg==
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="279565085"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:00:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/7] soundwire: slave: add first_interrupt_done status
Date: Tue, 18 Aug 2020 22:06:52 +0800
Message-Id: <20200818140656.29014-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
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

Some Slaves report incorrect information in their interrupt status
registers after a master/bus reset, track the initial interrupt
handling so that quirks can be introduced to filter out incorrect
information while keeping interrupts enabled in steady state.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 7 ++++++-
 drivers/soundwire/slave.c     | 1 +
 include/linux/soundwire/sdw.h | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 9e5bcd0dd115..cddf39e3adfc 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1472,6 +1472,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			goto io_err;
 		}
 
+		/* at this point all initial interrupt sources were handled */
+		slave->first_interrupt_done = true;
+
 		/*
 		 * Read status again to ensure no new interrupts arrived
 		 * while servicing interrupts.
@@ -1674,8 +1677,10 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 		if (!slave)
 			continue;
 
-		if (slave->status != SDW_SLAVE_UNATTACHED)
+		if (slave->status != SDW_SLAVE_UNATTACHED) {
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
+			slave->first_interrupt_done = false;
+		}
 
 		/* keep track of request, used in pm_runtime resume */
 		slave->unattach_request = request;
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 0839445ee07b..755d43eba63b 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -57,6 +57,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev_num = 0;
 	init_completion(&slave->probe_complete);
 	slave->probed = false;
+	slave->first_interrupt_done = false;
 
 	mutex_lock(&bus->bus_lock);
 	list_add_tail(&slave->node, &bus->slaves);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 6d91f2ca20b2..3550ab530c43 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -608,6 +608,8 @@ struct sdw_slave_ops {
  * between the Master suspending and the codec resuming, and make sure that
  * when the Master triggered a reset the Slave is properly enumerated and
  * initialized
+ * @first_interrupt_done: status flag tracking if the interrupt handling
+ * for a Slave happens for the first time after enumeration
  */
 struct sdw_slave {
 	struct sdw_slave_id id;
@@ -629,6 +631,7 @@ struct sdw_slave {
 	struct completion enumeration_complete;
 	struct completion initialization_complete;
 	u32 unattach_request;
+	bool first_interrupt_done;
 };
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
-- 
2.17.1

