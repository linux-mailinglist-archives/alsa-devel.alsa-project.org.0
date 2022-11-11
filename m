Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C3625284
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667BE1652;
	Fri, 11 Nov 2022 05:27:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667BE1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140876;
	bh=fudGHXfFeW/SgWmmWXPOO07+6VgSMIOdTVYH/lYOqHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9GAEcz1rG0wA5wLGb34WI6S6xS6pkMFu8fW22xI/uoT4S7xRlj1f+1X6zmza1qhG
	 AUMZ3QROPGQUo4axg4JuNG5Eof8m0e4DuGi/gSzbB44jfHPne6d+N5sOFlbqGp9pQ8
	 KUOr1yjClIBcDG+zJUNhYKQp4lvl7XYw6mH9KaMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D7AF80587;
	Fri, 11 Nov 2022 05:25:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 973D0F80580; Fri, 11 Nov 2022 05:25:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC230F80568
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC230F80568
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iyknNSMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140724; x=1699676724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fudGHXfFeW/SgWmmWXPOO07+6VgSMIOdTVYH/lYOqHI=;
 b=iyknNSMnFzfQf3lrNbfIn2tgXTgNWjDzi0CmvhFm+k5zcsw9MZGLyxd0
 QsQG/9WOuYnqH4A20AcjhiWjzGvbZ5UuUQSK/L2+gTpO/6aC+MRuNv2Iq
 o2CPuALrmA8ClVCMhU1tA8cpxx4YlackFcsl2gW5EcJgWjfof+ijM32IE
 1SwXLc/JPOKpfPwf93Ci1Izk0YM06eOuxBKx94zkN/5YqDqSHgIK88D/J
 PTbzfoZ1mB1roXH14S+Bmp6xQHh265VszKMgvfAz8cyq8ReqEhtIbV+uN
 eEagh9WueA5uh2tRhpLk0OkCLocijg96INM0l4zRkfa4qkqLxA7tBGln1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923768"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923768"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440792"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440792"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:19 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 7/8] soundwire: intel_init: remove check on number of links
Date: Fri, 11 Nov 2022 12:26:52 +0800
Message-Id: <20221111042653.45520-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
References: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

The number of links is checked with a chip-dependent helper in the
caller, remove the check in drivers/soundwire/intel_init.c

This change makes intel_init.c hardware-agnostic - which is quite
fitting for a layer that only creates auxiliary devices.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 0df3cdd85793..d6842925de61 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -272,24 +272,12 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 {
 	struct acpi_device *adev = acpi_fetch_acpi_dev(ctx->handle);
 	struct sdw_intel_link_dev *ldev;
-	u32 caps;
 	u32 link_mask;
 	int i;
 
 	if (!adev)
 		return -EINVAL;
 
-	/* Check SNDWLCAP.LCOUNT */
-	caps = ioread32(ctx->mmio_base + ctx->shim_base + SDW_SHIM_LCAP);
-	caps &= SDW_SHIM_LCAP_LCOUNT_MASK;
-
-	/* Check HW supported vs property value */
-	if (caps < ctx->count) {
-		dev_err(&adev->dev,
-			"BIOS master count is larger than hardware capabilities\n");
-		return -EINVAL;
-	}
-
 	if (!ctx->ldev)
 		return -EINVAL;
 
-- 
2.25.1

