Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D48E34550A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 02:38:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2DE915E5;
	Tue, 23 Mar 2021 02:38:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2DE915E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616463538;
	bh=OgFFVs2DcNShOoKxTuimqFbC96ZJKNwPVblRwGQwrJs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=llXQ3pdV+PquVlGfxpJf0GVbBhs0ZeIa/D+vkvlr5NEYVWtloy0njsJG9is7OMHTu
	 1cMCh0CtDbK4zTjO+BmuIFCei8iu0ZIkE0Ie+tn2KS0jCyQ6dp6v448jdDlR3/yVm9
	 sMWnp51gNue/Y2UWsq31LaWivKyZyjJKFSkfMMWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2095BF80107;
	Tue, 23 Mar 2021 02:37:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDB29F8016B; Tue, 23 Mar 2021 02:37:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53F45F80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 02:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F45F80155
IronPort-SDR: xh9K23XXpL5ufXFtbnRV3EXk9lhO2/YEeBSiWehw9lcs6KuyKs6qQUzfTVHte+GJSNrK5m7hoc
 FYrjup1FkQmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210457997"
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="210457997"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:37:18 -0700
IronPort-SDR: LueoOJ57yC2M11WdP6HPLUdVCcQLqXPql8W9NOXNUZYp5PE2gecktI2IXUFwLsiEYUXHBHABtb
 kq3yvkGYnABQ==
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="408068969"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:37:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: cadence: only prepare attached devices on clock
 stop
Date: Tue, 23 Mar 2021 09:37:07 +0800
Message-Id: <20210323013707.21455-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

We sometimes see COMMAND_IGNORED responses during the clock stop
sequence. It turns out we already have information if devices are
present on a link, so we should only prepare those when they
are attached.

In addition, even when COMMAND_IGNORED are received, we should still
proceed with the clock stop. The device will not be prepared but
that's not a problem.

The only case where the clock stop will fail is if the Cadence IP
reports an error (including a timeout), or if the devices throw a
COMMAND_FAILED response.

BugLink: https://github.com/thesofproject/linux/issues/2621
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index d05442e646a3..57c59a33ce61 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1450,10 +1450,12 @@ int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
 	}
 
 	/* Prepare slaves for clock stop */
-	ret = sdw_bus_prep_clk_stop(&cdns->bus);
-	if (ret < 0) {
-		dev_err(cdns->dev, "prepare clock stop failed %d", ret);
-		return ret;
+	if (slave_present) {
+		ret = sdw_bus_prep_clk_stop(&cdns->bus);
+		if (ret < 0 && ret != -ENODATA) {
+			dev_err(cdns->dev, "prepare clock stop failed %d\n", ret);
+			return ret;
+		}
 	}
 
 	/*
-- 
2.17.1

