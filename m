Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0537188A88
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 17:39:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7003D180A;
	Tue, 17 Mar 2020 17:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7003D180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584463169;
	bh=M1gvlAPGdSPXektvIuNGwHKONIPhvrYcOOe3aIRzAto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UBwG/2KhQF14lgbzqVn8+LHQwOPjD0k4GT7u+cFlGhnrtXDOGbZ/nekq1blN3qEnX
	 Ik+PLrwxO80Y+yK6VALgmGrZhFy7CqiTl7o1UqfWSuxFYr78vKKxVru1+WPlZkIps7
	 H1TRDAgojnqYDAROk68tBhSJnKRgjCw0JBnlCeLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 069FEF800CD;
	Tue, 17 Mar 2020 17:36:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAE05F8023E; Tue, 17 Mar 2020 17:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4775BF80232
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 17:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4775BF80232
IronPort-SDR: g0+Jt64zVy6rEWxrZZ+ww2zniPmu41tpWZMA5NwHERcUa6wMUgnLddRn7dZHGeizlwdG5PuqHm
 iRG17vuXYQZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 09:34:13 -0700
IronPort-SDR: 9Sh7qCZdtwQavnDgqSRizJyeLKpbru1aoWPI5pNznFIT7CefrBg8og90MV2U/ATKZZ6bUMT+hY
 SmZce7yrMGmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,565,1574150400"; d="scan'208";a="244533129"
Received: from aavila-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.36.39])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 09:34:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/17] soundwire: cadence: add interface to check clock
 status
Date: Tue, 17 Mar 2020 11:33:15 -0500
Message-Id: <20200317163329.25501-4-pierre-louis.bossart@linux.intel.com>
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
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
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

From: Rander Wang <rander.wang@intel.com>

If master is in clock stop state, driver can't modify registers
in master except the registers for clock stop setting.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 11 +++++++++++
 drivers/soundwire/cadence_master.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 941809ea00a8..1bfdc1d4fcb1 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1207,6 +1207,17 @@ static const struct sdw_master_port_ops cdns_port_ops = {
 	.dpn_port_enable_ch = cdns_port_enable,
 };
 
+/**
+ * sdw_cdns_is_clock_stop: Check clock status
+ *
+ * @cdns: Cadence instance
+ */
+bool sdw_cdns_is_clock_stop(struct sdw_cdns *cdns)
+{
+	return !!(cdns_readl(cdns, CDNS_MCP_STAT) & CDNS_MCP_STAT_CLK_STOP);
+}
+EXPORT_SYMBOL(sdw_cdns_is_clock_stop);
+
 /**
  * sdw_cdns_probe() - Cadence probe routine
  * @cdns: Cadence instance
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 44e802bba702..691faa386889 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -144,6 +144,8 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
 int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state);
 
+bool sdw_cdns_is_clock_stop(struct sdw_cdns *cdns);
+
 #ifdef CONFIG_DEBUG_FS
 void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
 #endif
-- 
2.20.1

