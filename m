Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F484262497
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 03:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A19616ED;
	Wed,  9 Sep 2020 03:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A19616ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599615772;
	bh=bKPuDB00ZV4IeF1N/dDDpZ/MBlzmAEFTv/xARQJKWzo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nTkKZgZlnWTtRUkuIf9mPdhMvWg8Metxfn4dhpklVAx72D86ihZEs7CqaNHYeOD8N
	 BOpqYJM9d3q5YyTbaupNblf23J7vhmexzny1u8LC8D9sUgjC/hRtRjG+Vt3SOyvjAU
	 Cs57WyWKSW0t4Btb157d3S1kjAUK9rVtA5VkPRFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62784F802E8;
	Wed,  9 Sep 2020 03:39:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81CA0F802C4; Wed,  9 Sep 2020 03:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65EA7F800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 03:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65EA7F800FD
IronPort-SDR: k8yi2nUAnaSCrPfZnqVfNQN9rmeJ1ppKyrnxwVnF1GsBHZhzQ0mmKBS13TsOVhAWYPpMNhnQja
 zcqYL69+Nseg==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222458466"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="222458466"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:16 -0700
IronPort-SDR: 7RF5Z3PBb7SaRSvPW3MJMfRXSJIZ9/jDAZJoW59yO/oNkXDjLciFB9oGZgctHXt+Gmh4Arsl6S
 gN/kc10MVxBA==
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="449018099"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 3/7] soundwire: slave: add first_interrupt_done status
Date: Tue,  8 Sep 2020 21:45:17 +0800
Message-Id: <20200908134521.6781-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
References: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
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
index 029818b1f568..30b0bed16630 100644
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
index 2191dd6e7aa4..4a250d33de5d 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -58,6 +58,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev_num = 0;
 	init_completion(&slave->probe_complete);
 	slave->probed = false;
+	slave->first_interrupt_done = false;
 
 	for (i = 0; i < SDW_MAX_PORTS; i++)
 		init_completion(&slave->port_ready[i]);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 9d94cdf6346f..2b93a8ef7fad 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -616,6 +616,8 @@ struct sdw_slave_ops {
  * between the Master suspending and the codec resuming, and make sure that
  * when the Master triggered a reset the Slave is properly enumerated and
  * initialized
+ * @first_interrupt_done: status flag tracking if the interrupt handling
+ * for a Slave happens for the first time after enumeration
  */
 struct sdw_slave {
 	struct sdw_slave_id id;
@@ -637,6 +639,7 @@ struct sdw_slave {
 	struct completion enumeration_complete;
 	struct completion initialization_complete;
 	u32 unattach_request;
+	bool first_interrupt_done;
 };
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
-- 
2.17.1

