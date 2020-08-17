Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0032482CF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 12:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50EF11752;
	Tue, 18 Aug 2020 12:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50EF11752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597745966;
	bh=/B+ZgAMOGbYrJxlTwPuV/DiIw03rkYhzSMnDNseyKqE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gGktYD57LStm9XSWrvNm1xMaRjLumD0oD4rgDfKJE3ldWL6VTpfi7h/3DyLVJgJ8h
	 ZYjXqtbMjDcbkiWYt4rYdI0pqJ1Yt7xmA2wXbHvSjdX22c/NGYoCq2yaZxTZBSfkHg
	 JNNSNMDfBDePFtjg+vVd0t4fydORbwyFoHLN+zPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E9AEF80114;
	Tue, 18 Aug 2020 12:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF331F8023F; Tue, 18 Aug 2020 12:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80B94F80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 12:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B94F80114
IronPort-SDR: nOp44wt1aLcMFUmYjmxCL5KnwcYF6MRtxkEDrLbeB1931TrD6uUWQbf39zActkKDMCy3VrcPGK
 l6twNCixLejg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="155956194"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="155956194"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 03:17:26 -0700
IronPort-SDR: +RQdUwcKd0WpF1MV50K77ipSbXSpGk4l5pWDUHQoibQeSGg/cDyEdDflEAxvBYD4/wd4LIkt6S
 d0ZiwUUXD3Xg==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="279363998"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 03:17:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: cadence: fix race condition between suspend and
 Slave device alerts
Date: Tue, 18 Aug 2020 06:23:40 +0800
Message-Id: <20200817222340.18042-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

In system suspend stress cases, the SOF CI reports timeouts. The root
cause is that an alert is generated while the system suspends. The
interrupt handling generates transactions on the bus that will never
be handled because the interrupts are disabled in parallel.

As a result, the transaction never completes and times out on resume.
This error doesn't seem too problematic since it happens in a work
queue, and the system recovers without issues.

Nevertheless, this race condition should not happen. When doing a
system suspend, or when disabling interrupts, we should make sure the
current transaction can complete, and prevent new work from being
queued.

BugLink: https://github.com/thesofproject/linux/issues/2344
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 24 +++++++++++++++++++++++-
 drivers/soundwire/cadence_master.h |  1 +
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 24eafe0aa1c3..1330ffc47596 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -791,7 +791,16 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 			     CDNS_MCP_INT_SLAVE_MASK, 0);
 
 		int_status &= ~CDNS_MCP_INT_SLAVE_MASK;
-		schedule_work(&cdns->work);
+
+		/*
+		 * Deal with possible race condition between interrupt
+		 * handling and disabling interrupts on suspend.
+		 *
+		 * If the master is in the process of disabling
+		 * interrupts, don't schedule a workqueue
+		 */
+		if (cdns->interrupt_enabled)
+			schedule_work(&cdns->work);
 	}
 
 	cdns_writel(cdns, CDNS_MCP_INTSTAT, int_status);
@@ -924,6 +933,19 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state)
 		slave_state = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
 		cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave_state);
 	}
+	cdns->interrupt_enabled = state;
+
+	/*
+	 * Complete any on-going status updates before updating masks,
+	 * and cancel queued status updates.
+	 *
+	 * There could be a race with a new interrupt thrown before
+	 * the 3 mask updates below are complete, so in the interrupt
+	 * we use the 'interrupt_enabled' status to prevent new work
+	 * from being queued.
+	 */
+	if (!state)
+		cancel_work_sync(&cdns->work);
 
 	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0, slave_intmask0);
 	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1, slave_intmask1);
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index fdec62b912d3..4d1aab5b5ec2 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -133,6 +133,7 @@ struct sdw_cdns {
 
 	bool link_up;
 	unsigned int msg_count;
+	bool interrupt_enabled;
 
 	struct work_struct work;
 
-- 
2.17.1

