Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C74507EDF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 04:34:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8420E18DD;
	Wed, 20 Apr 2022 04:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8420E18DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650422079;
	bh=NhcIVk7RjAY/MIh/KHzpjrCZoNRYNyCEFEr4+HwwHNI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VE1Asamf6xHFfPxuECPM2IdTN1+NijUgzCMb/WE2l9IOI/Qe/WEPXFdqsXuRWPOH5
	 AWrN5ftJZKY2osZ6J0J+bJG9GVrmj8Gds138uY5xUkWRAa28MV4RTzsJgCX53Hn47B
	 v41aJm37XHNTSCfJ2dmWNqT3GR7QaJge1SKKdebc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8388F804F1;
	Wed, 20 Apr 2022 04:33:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF10BF804F3; Wed, 20 Apr 2022 04:33:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB357F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 04:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB357F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nPXj75ET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650421987; x=1681957987;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=NhcIVk7RjAY/MIh/KHzpjrCZoNRYNyCEFEr4+HwwHNI=;
 b=nPXj75ETN1Kpw5BSAsjd69Iju1T4z22EHWUG0oJc74/zs+y7kefvmuOd
 l4OXtZuIYqapHBrVsqqfZ9hUGG0Xr15+X1S0CLK7kdn9x1TCbutKPC76K
 v2j4lYTamg5qr+wzgOpBCUNilqp/GpTalZbCk0qZEhoH6oecSg7FM5F6p
 B/Icgm67DZdIyPesH2pXJuHejkY1nq+2IkfYmcFj32/WyEPVUKSUkwuSY
 DarLhuQxJPSVoi+gVdcpoZkDBFf9FmV3msJpRHucRXSUITFs7+4TwDBtj
 4qdFIUN9Nv1c4AoY2w8Cskw1/zzXGg4gKgBxHUfW+viNYFL0UDOHIHn+V g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263384329"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="263384329"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 19:33:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="529554582"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 19:33:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/3] soundwire: bus: pm_runtime_request_resume on peripheral
 attachment
Date: Wed, 20 Apr 2022 10:32:41 +0800
Message-Id: <20220420023241.14335-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220420023241.14335-1-yung-chuan.liao@linux.intel.com>
References: <20220420023241.14335-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

In typical use cases, the peripheral becomes pm_runtime active as a
result of the ALSA/ASoC framework starting up a DAI. The parent/child
hierarchy guarantees that the manager device will be fully resumed
beforehand.

There is however a corner case where the manager device may become
pm_runtime active, but without ALSA/ASoC requesting any functionality
from the peripherals. In this case, the hardware peripheral device
will report as ATTACHED and its initialization routine will be
executed. If this initialization routine initiates any sort of
deferred processing, there is a possibility that the manager could
suspend without the peripheral suspend sequence being invoked: from
the pm_runtime framework perspective, the peripheral is *already*
suspended.

To avoid such disconnects between hardware state and pm_runtime state,
this patch adds an asynchronous pm_request_resume() upon successful
attach/initialization which will result in the proper resume/suspend
sequence to be followed on the peripheral side.

BugLink: https://github.com/thesofproject/linux/issues/3459
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 354d3f89366f..8b7a680f388e 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1838,6 +1838,18 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 				__func__, slave->dev_num);
 
 			complete(&slave->initialization_complete);
+
+			/*
+			 * If the manager became pm_runtime active, the peripherals will be
+			 * restarted and attach, but their pm_runtime status may remain
+			 * suspended. If the 'update_slave_status' callback initiates
+			 * any sort of deferred processing, this processing would not be
+			 * cancelled on pm_runtime suspend.
+			 * To avoid such zombie states, we queue a request to resume.
+			 * This would be a no-op in case the peripheral was being resumed
+			 * by e.g. the ALSA/ASoC framework.
+			 */
+			pm_request_resume(&slave->dev);
 		}
 	}
 
-- 
2.17.1

