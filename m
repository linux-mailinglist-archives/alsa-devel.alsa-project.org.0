Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE68C2293C5
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A8AC852;
	Wed, 22 Jul 2020 10:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A8AC852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595407244;
	bh=3FGmPv+2XnfKYo8DyJOb/4V2EI3RuwE0xSPuGuPNCew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqc6ktZx5e5s9KY5DWR0seb5woaWmMNGuHCm0GXIqnLJdonfPiX+pKIsxDjvpI/eW
	 ffQz8GcKsD6EnM7QS6UtXtd4wx/a7VyaloeVdTtHo7zpttDzIVAjKwYfcOZgPTpFFm
	 ifuyDVrSQdCe49sh5KEVwiqOCH88DxeWHlQMwQqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B981F80337;
	Wed, 22 Jul 2020 10:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3C99F80335; Wed, 22 Jul 2020 10:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63E16F8031A
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E16F8031A
IronPort-SDR: tTvuAfkMMaAssm+B9DWx5kOh1TjlMTAprHP71nfKYsPhTXvqvZI5QcqNOf/Vk/iJPO4M6ytsnM
 hi/m7FMorr2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="149457319"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="149457319"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:35 -0700
IronPort-SDR: krbOO7+lmqF4g73YcVA+e5DPl07IsuE8oF2t9yOYd/7uBom9AsZPCv9xgnQV6hY3cfq6Hca39+
 S+QsAHSk//Og==
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="432303389"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:28 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 11/13] soundwire: intel_init: handle power rail dependencies
 for clock stop mode
Date: Wed, 22 Jul 2020 04:37:21 +0800
Message-Id: <20200721203723.18305-12-yung-chuan.liao@linux.intel.com>
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

When none of the clock stop quirks is specified, the Master IP will
assume the context is preserved and will not reset the Bus and restart
enumeration. Due to power rail dependencies, the HDaudio controller
needs to remain powered and prevented from executing its pm_runtime
suspend routine.

This choice of course has a power impact, and this mode should only be
selected when latency requirements are critical or the parent device
can enter D0ix modes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 96c9af15c308..c0fddf76a6dc 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw_intel.h>
+#include <linux/pm_runtime.h>
 #include "cadence_master.h"
 #include "intel.h"
 
@@ -72,6 +73,9 @@ static int sdw_intel_cleanup(struct sdw_intel_ctx *ctx)
 			pm_runtime_disable(&link->pdev->dev);
 			platform_device_unregister(link->pdev);
 		}
+
+		if (!link->clock_stop_quirks)
+			pm_runtime_put_noidle(link->dev);
 	}
 
 	return 0;
@@ -337,6 +341,16 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 			continue;
 
 		intel_master_startup(link->pdev);
+
+		if (!link->clock_stop_quirks) {
+			/*
+			 * we need to prevent the parent PCI device
+			 * from entering pm_runtime suspend, so that
+			 * power rails to the SoundWire IP are not
+			 * turned off.
+			 */
+			pm_runtime_get_noresume(link->dev);
+		}
 	}
 
 	return 0;
-- 
2.17.1

