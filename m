Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C465D34F5B0
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 03:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9EB1682;
	Wed, 31 Mar 2021 03:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9EB1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617152709;
	bh=iX2kwWgSk1/QC87XkRwNrdEmKai8Hhjb6rIW8C4dOPc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oHDTHe+29LkoydLWBnz0jSpZcmn8JTM0n+ahjl7iX9IKqHw/ul3ZTBAbc/HWrjKNL
	 FoSoB34qy/v2tXjiGxX+cjyute/qNv6XVNvh9pqGg7ep6L/XqNiieCnbTNhJe5C8Rf
	 yr4/Hf26zplNqlJ4zVNLF7NBC66oMRxd7KT7NHh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A55BF8026B;
	Wed, 31 Mar 2021 03:03:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A315F80240; Wed, 31 Mar 2021 03:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76F55F80141
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 03:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76F55F80141
IronPort-SDR: BzfYW5oJ1qSGzyL5+GBjNcVNaH/T9ys9uttx+XbOpu9wxoCqN6IG5vqHEuWxRtR59ZcMZ4AA68
 M0pWnoLAixZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="188628359"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="188628359"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 18:03:01 -0700
IronPort-SDR: W1H3FstvuZ72pE56Mky52VbKZbMWhYDK+3MgGyltDYYnwwU8LDJ+6sWPg9quL2uj7xLN6c8Wm4
 ClcYGJk2KMNQ==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="411887968"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 18:02:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: intel_init: test link->cdns
Date: Wed, 31 Mar 2021 09:02:50 +0800
Message-Id: <20210331010250.14151-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

intel_link_probe() could return error and dev_get_drvdata() will return
null in such case. So we have to test link->cdns after
link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
Otherwise, we will meet the "kernel NULL pointer dereference" error.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 5b32a2ffd376..5ef5bd0defab 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -250,6 +250,15 @@ static struct sdw_intel_ctx
 		link = &ldev->link_res;
 		link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
 
+		if (!link->cdns) {
+			dev_err(&adev->dev, "failed to get link->cdns\n");
+			/*
+			 * 1 will be subtracted from i in the err label, but we need to call
+			 * intel_link_dev_unregister for this ldev, so plus 1 now
+			 */
+			i++;
+			goto err;
+		}
 		list_add_tail(&link->list, &ctx->link_list);
 		bus = &link->cdns->bus;
 		/* Calculate number of slaves */
-- 
2.17.1

