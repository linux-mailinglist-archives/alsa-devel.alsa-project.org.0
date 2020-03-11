Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47172182124
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 19:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23D61691;
	Wed, 11 Mar 2020 19:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23D61691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583952457;
	bh=WahYnyPrlfDKwTPO2cBzP6R2343ewm7m4DfN57oPFcw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WgCUeg1jnL21IJ9z7RIvkYcS8trL/h1i1LNbIkJYsThMoD5LrfvJvnVLRIc4CXfh6
	 +JE1xQMi5J5Mu3HuLLEFUzvTpQwknk1I8T6hmMayom8IgY45/Rfq31vCPyRFquqBgj
	 TgnMegt63go+IPLEG3jPY+qYjD5BueLXHWDemsxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 446D9F802DB;
	Wed, 11 Mar 2020 19:42:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CC49F8028F; Wed, 11 Mar 2020 19:41:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 797CCF800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 19:41:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 797CCF800B5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 11:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,541,1574150400"; d="scan'208";a="441776253"
Received: from fjan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.25.157])
 by fmsmga005.fm.intel.com with ESMTP; 11 Mar 2020 11:41:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/16] soundwire: cadence: mask Slave interrupt before
 stopping clock
Date: Wed, 11 Mar 2020 13:41:19 -0500
Message-Id: <20200311184128.4212-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311184128.4212-1-pierre-louis.bossart@linux.intel.com>
References: <20200311184128.4212-1-pierre-louis.bossart@linux.intel.com>
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
index 02f18ce6b7e7..a4ba57f44c1f 100644
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
@@ -1272,6 +1290,13 @@ int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
 		return 1;
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
@@ -1349,6 +1374,9 @@ int sdw_cdns_clock_restart(struct sdw_cdns *cdns, bool bus_reset)
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

