Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 159943288EF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:49:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96EEE168C;
	Mon,  1 Mar 2021 18:49:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96EEE168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614620991;
	bh=xDnWmsPB7eNkquy/dMopWBFnoDfFVV9JpIadZW3dQ6Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vf19aVJd+iDgPyvCz/jdYXN1AI6AnrT37A9HHu/8Jdu4WMvb1p/C/sXDYy3oku040
	 NOWi4nuClJT+AEK3ilZ3n13wSy/vHMIAT4AcmDUhmeoaut7xZEp65ZfuPF/OFZVpu+
	 6sERoc8Hv2fat04y8V8CwXmtBfs2y/+zYP+DJbCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393BCF804A9;
	Mon,  1 Mar 2021 18:47:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2222F8049C; Mon,  1 Mar 2021 18:47:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24015F80431
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24015F80431
IronPort-SDR: YlLVDhud2RAQi+cmqiWmM2O5mIIQ2zj9GWEbL0FGncriRT8ClS9pN41gqGj59GRTgYP8i90q87
 YdFf099xctkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186598121"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="186598121"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 09:47:23 -0800
IronPort-SDR: WICg7SInxXqGc6GeO2aaqo9X8Q/9IuQhopX2ZmY5ajJc9VQgCoYDX6EkxqTjRSe5NmCrEgVu21
 obytjI+Dq2mQ==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="434363295"
Received: from mhuang8-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.25.220])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 09:47:22 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] soundwire: cadence_master: fix kernel-doc
Date: Mon,  1 Mar 2021 11:47:14 -0600
Message-Id: <20210301174714.117172-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

v5.12-rc1 flags new warnings with make W=1, fix missing or broken
function descriptors.

drivers/soundwire/cadence_master.c:914: warning: expecting prototype
for To update slave status in a work since we will need to
handle(). Prototype was for cdns_update_slave_status_work() instead

drivers/soundwire/cadence_master.c:976: warning: expecting prototype
for sdw_cdns_enable_slave_interrupt(). Prototype was for
cdns_enable_slave_interrupts() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index d05442e646a3..e5c3f304b8f6 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -905,7 +905,7 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 EXPORT_SYMBOL(sdw_cdns_irq);
 
 /**
- * To update slave status in a work since we will need to handle
+ * cdns_update_slave_status_work - update slave status in a work since we will need to handle
  * other interrupts eg. CDNS_MCP_INT_RX_WL during the update slave
  * process.
  * @work: cdns worker thread
@@ -968,7 +968,7 @@ int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
 EXPORT_SYMBOL(sdw_cdns_exit_reset);
 
 /**
- * sdw_cdns_enable_slave_interrupt() - Enable SDW slave interrupts
+ * cdns_enable_slave_interrupts() - Enable SDW slave interrupts
  * @cdns: Cadence instance
  * @state: boolean for true/false
  */
-- 
2.25.1

