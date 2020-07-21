Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 442242293C0
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E730B851;
	Wed, 22 Jul 2020 10:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E730B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595407181;
	bh=tlzhTZIr2cJAJwVLfQY5YqtjZAvL+IRam/22FmKU49A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXqeYNyIKaZsFr4Z2sUYldq7H4oiH38WDR9mavX2f0Rshmd0MKKHWeRyqO5k1z8bp
	 s4xmfFr+ttbZ1Aqeq213KQzINlFUsgs1bfaSprVc0IxDsO5uK7ktGsDz+8C5L2VJIF
	 eqVW0v7QlbBDLQmldES4FVs/oMW9e2+qV9Zx8rMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D1EF80334;
	Wed, 22 Jul 2020 10:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DF8AF80329; Wed, 22 Jul 2020 10:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED29AF80322
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED29AF80322
IronPort-SDR: j5v9Fm8+o36BXFdR2zhBtMN84JU9C9A9MSqkDUcrL1wj/8NRp2VE6c7i5KPY6T2Gq+7KHX0HBA
 t5YhK3FAm95Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="214930974"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="214930974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:28 -0700
IronPort-SDR: 4wHHBy9kGnY4WyTp3shCMCD3Qwi4bvpX/+G4zz6Bh8/nZk1zuuTNPpmopChBzJYWfN/WB2n8XK
 WtrRETT+aE5w==
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="432303375"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 10/13] soundwire: intel: add CLK_STOP_NOT_ALLOWED support
Date: Wed, 22 Jul 2020 04:37:20 +0800
Message-Id: <20200721203723.18305-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

In case the clock needs to keep running, we need to prevent the Master
from entering pm_runtime suspend.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 744fc0a4816a..c9d8de65cfd6 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1366,6 +1366,7 @@ int intel_master_startup(struct platform_device *pdev)
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
 	int link_flags;
+	u32 clock_stop_quirks;
 	int ret;
 
 	if (bus->prop.hw_disabled) {
@@ -1422,6 +1423,20 @@ int intel_master_startup(struct platform_device *pdev)
 		pm_runtime_enable(dev);
 	}
 
+	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
+	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_NOT_ALLOWED) {
+		/*
+		 * To keep the clock running we need to prevent
+		 * pm_runtime suspend from happening by increasing the
+		 * reference count.
+		 * This quirk is specified by the parent PCI device in
+		 * case of specific latency requirements. It will have
+		 * no effect if pm_runtime is disabled by the user via
+		 * a module parameter for testing purposes.
+		 */
+		pm_runtime_get_noresume(dev);
+	}
+
 	/*
 	 * The runtime PM status of Slave devices is "Unsupported"
 	 * until they report as ATTACHED. If they don't, e.g. because
@@ -1453,6 +1468,11 @@ static int intel_master_remove(struct platform_device *pdev)
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
 
+	/*
+	 * Since pm_runtime is already disabled, we don't decrease
+	 * the refcount when the clock_stop_quirk is
+	 * SDW_INTEL_CLK_STOP_NOT_ALLOWED
+	 */
 	if (!bus->prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
 		sdw_cdns_enable_interrupt(cdns, false);
-- 
2.17.1

