Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D963188AFB
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 17:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B551898;
	Tue, 17 Mar 2020 17:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B551898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584463599;
	bh=tRRCHiaXiL1AJfLYwkv/zi1Bm2YdyQJverJdhQNd3H8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1+Wa9F5C5KL5x/tI44nRkx3B0T+5wVbNnaThfASicAngY/zZusp7K5D/DAcKsJFG
	 Vr/kB5zxQMVCPfX7LvCzCa6w1/QPZCTTPpJgFQEC3V0qwvHamgqW+AKykeQHsqPbNC
	 LdcTmZT3Zc+Q44kZGXZipvsA7mA0IT5+MBni7OeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC1AF8031A;
	Tue, 17 Mar 2020 17:37:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DBB2F80299; Tue, 17 Mar 2020 17:36:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68679F800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 17:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68679F800CD
IronPort-SDR: vNFcxEEX/zg6zouxi8+NdEiIN1t/UYYHtS8W0E6aVO22UFccgNotmD2M+dc2ZpggVmZBSlXwfr
 pIvtiUJESWrw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 09:34:24 -0700
IronPort-SDR: EvGcPCRaHvMLRJWlBcqHnLpKZh+3Q+CvG+L67zvrllcDBDb/KiR7P1WA5K5FVodLbrnbIJ9WUL
 sXX0x/UQz+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,565,1574150400"; d="scan'208";a="244533182"
Received: from aavila-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.36.39])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 09:34:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/17] soundwire: cadence: mask Slave interrupt before
 stopping clock
Date: Tue, 17 Mar 2020 11:33:19 -0500
Message-Id: <20200317163329.25501-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
References: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
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

Intel QA reported a very rare case, possibly hardware-dependent, where
a Slave can become UNATTACHED during a clock stop sequence, which
leads to timeouts and failed suspend sequences.

This patch suppresses the handling of all Slave events while this
transition happens. The two cases that matter are:

a) alerts: if the Slave wants to signal an alert condition, it can do
so using the in-band wake, so there's almost no impact with this
patch.

b) sync loss or imp-def reset: in those cases, bringing back the Slave
to functional state requires a complete re-enumeration. It's better to
just ignore this case and restart cleanly, rather than attempt a
'clean' suspend.

Validation results show the timeouts no longer visible with this patch.

GitHub issue: https://github.com/thesofproject/linux/issues/1678
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 37e16199933c..613c63359413 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -865,6 +865,24 @@ int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
 }
 EXPORT_SYMBOL(sdw_cdns_exit_reset);
 
+/**
+ * sdw_cdns_enable_slave_interrupt() - Enable SDW slave interrupts
+ * @cdns: Cadence instance
+ * @state: boolean for true/false
+ */
+static void cdns_enable_slave_interrupts(struct sdw_cdns *cdns, bool state)
+{
+	u32 mask;
+
+	mask = cdns_readl(cdns, CDNS_MCP_INTMASK);
+	if (state)
+		mask |= CDNS_MCP_INT_SLAVE_MASK;
+	else
+		mask &= ~CDNS_MCP_INT_SLAVE_MASK;
+
+	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
+}
+
 /**
  * sdw_cdns_enable_interrupt() - Enable SDW interrupts
  * @cdns: Cadence instance
@@ -1262,6 +1280,13 @@ int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
 		return 0;
 	}
 
+	/*
+	 * Before entering clock stop we mask the Slave
+	 * interrupts. This helps avoid having to deal with e.g. a
+	 * Slave becoming UNATTACHED while the clock is being stopped
+	 */
+	cdns_enable_slave_interrupts(cdns, false);
+
 	/*
 	 * For specific platforms, it is required to be able to put
 	 * master into a state in which it ignores wake-up trials
@@ -1339,6 +1364,9 @@ int sdw_cdns_clock_restart(struct sdw_cdns *cdns, bool bus_reset)
 {
 	int ret;
 
+	/* unmask Slave interrupts that were masked when stopping the clock */
+	cdns_enable_slave_interrupts(cdns, true);
+
 	ret = cdns_clear_bit(cdns, CDNS_MCP_CONTROL,
 			     CDNS_MCP_CONTROL_CLK_STOP_CLR);
 	if (ret < 0) {
-- 
2.20.1

