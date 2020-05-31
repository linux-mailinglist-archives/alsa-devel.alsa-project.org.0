Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C421E9E02
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 08:20:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30AE916FD;
	Mon,  1 Jun 2020 08:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30AE916FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590992403;
	bh=6d1nwMMhSZFP/DxO1bAeh2YvRwE4yo99ESMXAD+y4bU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFE0d1dV+spsGCuaF/PYkFVWsG2YXa0cSz7wAFIQwAyJINQYu1UF15a4lnoTyunC3
	 eyR1RoqGf9E6Rj5x2+xV+Od2ARAzh7Hduh71pu4XGSyscL4pv+dDaqU1ZhaPOebpY1
	 aaxJjJR826QB+6Yxrf9TodUOaEPT6OoNudqGstRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F5FAF802C2;
	Mon,  1 Jun 2020 08:16:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69971F802BC; Mon,  1 Jun 2020 08:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12322F8029B
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 08:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12322F8029B
IronPort-SDR: uFaauVCeBvD6Dkui4GVT81Dp3fGGs/sFXBWY2Hg7Gu4qpEx3YiUaPPRN0+N90Z8o9IPIy5bExl
 nSavAptHziAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 23:15:58 -0700
IronPort-SDR: nmadn5veDRO5Dv6gVAXiuAbigDySDzXCE866r6js5rSatxxVjSRwGTEPx6Ygr+XH/v6QcUcxgT
 JTLQzeas+k2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="470208739"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 31 May 2020 23:15:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/6] soundwire: intel_init: use devm_ allocation
Date: Mon,  1 Jun 2020 02:21:00 +0800
Message-Id: <20200531182102.27840-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200531182102.27840-1-yung-chuan.liao@linux.intel.com>
References: <20200531182102.27840-1-yung-chuan.liao@linux.intel.com>
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

Make error handling simpler with devm_ allocation.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index e87f17240547..f9d190157c47 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -42,9 +42,6 @@ static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
 		link++;
 	}
 
-	kfree(ctx->links);
-	ctx->links = NULL;
-
 	return 0;
 }
 
@@ -96,14 +93,15 @@ static struct sdw_intel_ctx
 
 	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
 
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(&adev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return NULL;
 
 	ctx->count = count;
-	ctx->links = kcalloc(ctx->count, sizeof(*ctx->links), GFP_KERNEL);
+	ctx->links = devm_kcalloc(&adev->dev, ctx->count,
+				  sizeof(*ctx->links), GFP_KERNEL);
 	if (!ctx->links)
-		goto link_err;
+		return NULL;
 
 	link = ctx->links;
 
@@ -146,9 +144,8 @@ static struct sdw_intel_ctx
 	return ctx;
 
 pdev_err:
+	ctx->count = i;
 	sdw_intel_cleanup_pdev(ctx);
-link_err:
-	kfree(ctx);
 	return NULL;
 }
 
@@ -216,7 +213,6 @@ void *sdw_intel_init(acpi_handle *parent_handle, struct sdw_intel_res *res)
 void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 {
 	sdw_intel_cleanup_pdev(ctx);
-	kfree(ctx);
 }
 EXPORT_SYMBOL(sdw_intel_exit);
 
-- 
2.17.1

