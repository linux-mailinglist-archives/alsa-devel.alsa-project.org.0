Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD1206BCF
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 07:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54C4717FD;
	Wed, 24 Jun 2020 07:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54C4717FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592977020;
	bh=+TqtpxHwDdwRayDvpnkIJz8gH90uE1LFJcextAX3h5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B42vRrZDlDrslT2XnmC7ual4DK9oDLLRLk0+LBWnZBNouR0e8q62OPFUE5AQq6AW9
	 wV+BzLxH04F4bVQDtB2w/AJqR3efm0OYZB78IiiHsjSDh9b9NaTjKQ9pfLgLuX2r2z
	 9qEVOpcuAwPFX8lR9x5HYXD1m72fa4Z14VOraXNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAF48F80306;
	Wed, 24 Jun 2020 07:31:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C613BF802E9; Wed, 24 Jun 2020 07:30:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65A1AF802E3
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 07:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A1AF802E3
IronPort-SDR: rpY2YDHNmLV3AiyLpNrMn7/WX4B4qjSIMqNJQY9X3HnvAlrNMw0rUWYWf8uxYm7J0qE950WRZ6
 D21qk+30g4dA==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="131776245"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="131776245"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 22:30:43 -0700
IronPort-SDR: YHZbXwFMmJMd1fC8ZZkZVKSQwJO+OCQaDr50XMc5njX1ODc/gEjJ9ey/TZZbyFPUHvGqSGvqtv
 TN22WHx0/Zdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="452513619"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005.jf.intel.com with ESMTP; 23 Jun 2020 22:30:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 9/9] Soundwire: intel_init: save Slave(s) _ADR info in
 sdw_intel_ctx
Date: Wed, 24 Jun 2020 01:35:46 +0800
Message-Id: <20200623173546.21870-10-yung-chuan.liao@linux.intel.com>
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

Save ACPI information in context so that we can match machine driver
with sdw _ADR matching tables.

Suggested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index eff4e385bb59..6502a5e82229 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -188,7 +188,11 @@ static struct sdw_intel_ctx
 	struct sdw_intel_link_res *link;
 	struct sdw_intel_ctx *ctx;
 	struct acpi_device *adev;
+	struct sdw_slave *slave;
+	struct list_head *node;
+	struct sdw_bus *bus;
 	u32 link_mask;
+	int num_slaves = 0;
 	int count;
 	int i;
 
@@ -265,6 +269,26 @@ static struct sdw_intel_ctx
 		link->cdns = platform_get_drvdata(pdev);
 
 		list_add_tail(&link->list, &ctx->link_list);
+		bus = &link->cdns->bus;
+		/* Calculate number of slaves */
+		list_for_each(node, &bus->slaves)
+			num_slaves++;
+	}
+
+	ctx->ids = devm_kcalloc(&adev->dev, num_slaves,
+				sizeof(*ctx->ids), GFP_KERNEL);
+	if (!ctx->ids)
+		goto err;
+
+	ctx->num_slaves = num_slaves;
+	i = 0;
+	list_for_each_entry(link, &ctx->link_list, list) {
+		bus = &link->cdns->bus;
+		list_for_each_entry(slave, &bus->slaves, node) {
+			ctx->ids[i].id = slave->id;
+			ctx->ids[i].link_id = bus->link_id;
+			i++;
+		}
 	}
 
 	return ctx;
-- 
2.17.1

