Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA9223185
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 05:10:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7AA1614;
	Fri, 17 Jul 2020 05:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7AA1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594955454;
	bh=8XQrlEWqxzBKSbS9hG/aBEfkCuqV1Npw1VhMIN9PFbE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+NLPUN9EEmVirKod6bueeeKDqa6Ndxq3YfINNSdKo1KK+QtTxxic+GGqvaPSd4/5
	 WHyCCX3PC/ssLvGgawjYuWWPqEDcEz6S23LFyUUa+8aZ1Pf+9G1jtEL8uGROWFs+N6
	 +4Ozno//5YqGk2rxjZVZxeW/FoBnAhHDHx3+aEIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CAFBF80321;
	Fri, 17 Jul 2020 05:04:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B60DAF8031A; Fri, 17 Jul 2020 05:04:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E11FDF80306
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 05:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E11FDF80306
IronPort-SDR: w+ybbw+dg5XVy9de522czb64rIsghVyXVOAwUPLCbOwMe83O4S+3jrBVFGnz4p+1ALXS5euKzY
 snQ3TPiXsxww==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="147518828"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="147518828"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 20:04:39 -0700
IronPort-SDR: T2RKwTAkLJpyJWFnA7zQrkmA/IOU/vUAoTD5L1DP24cZ0+0J2Kr+D4GbwQm23YowDTSaKbjCH5
 AOtfMhqhHN0Q==
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="460699820"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 20:04:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 9/9] Soundwire: intel_init: save Slave(s) _ADR info in
 sdw_intel_ctx
Date: Thu, 16 Jul 2020 23:09:47 +0800
Message-Id: <20200716150947.22119-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716150947.22119-1-yung-chuan.liao@linux.intel.com>
References: <20200716150947.22119-1-yung-chuan.liao@linux.intel.com>
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
index 8d3992f9fcdd..047252a91c9e 100644
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

