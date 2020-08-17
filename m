Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05915247CDD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 05:31:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 942451719;
	Tue, 18 Aug 2020 05:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 942451719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597721487;
	bh=Io6vQEVDAWU4W8EExPJL8cD679O7fRxbs8iijOnp+CA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CewX6ERUD53ztB9xSpKJWMbXFGr6m59+N/kArPdBcF0xCnuEoeb7hoO4Bbo5AK9UE
	 ye9HD3D1judoBTkS2AQuUFCtDg0MzCcFwaqzYld2TX8TQFe7nN8CQpkW8vEqpio7Yi
	 OBm57pvuG0uDacvDq2cxL7468HecTFDGxoXjQkJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FDAFF80338;
	Tue, 18 Aug 2020 05:24:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59EBAF80333; Tue, 18 Aug 2020 05:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F2EF80323
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 05:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F2EF80323
IronPort-SDR: vkgK3UoCNK1Ch4nmjC028GMzvKr5VTeaqUwgPcmaJfIA8csDY2AGyeeuuFG1HteEdyddlEKcXL
 ls2uUCRWf5Vg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152243057"
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; d="scan'208";a="152243057"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 20:23:55 -0700
IronPort-SDR: Q+QqcoK+Bker8MNOYqS3hil+CAUtyILXtnWbNRFRWZJy3nkPkZPLk5+eMXDGJzmgfxPQzZways
 Vlt6KSDC6NaQ==
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; d="scan'208";a="441084692"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 20:23:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 11/12] soundwire: intel: support clock_stop mode without
 quirks
Date: Mon, 17 Aug 2020 23:29:22 +0800
Message-Id: <20200817152923.3259-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
References: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
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

In this mode, on restart the bus restarts immediately, the Slaves
remain synchronized and all context is kept intact.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 95b14c034ea7..2899445e2649 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1595,7 +1595,8 @@ static int intel_suspend_runtime(struct device *dev)
 
 		intel_shim_wake(sdw, false);
 
-	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
+	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET ||
+		   !clock_stop_quirks) {
 		ret = sdw_cdns_clock_stop(cdns, true);
 		if (ret < 0) {
 			dev_err(dev, "cannot enable clock stop on suspend\n");
@@ -1755,6 +1756,24 @@ static int intel_resume_runtime(struct device *dev)
 			dev_err(dev, "unable to restart clock during resume\n");
 			return ret;
 		}
+	} else if (!clock_stop_quirks) {
+		ret = intel_init(sdw);
+		if (ret) {
+			dev_err(dev, "%s failed: %d", __func__, ret);
+			return ret;
+		}
+
+		ret = sdw_cdns_enable_interrupt(cdns, true);
+		if (ret < 0) {
+			dev_err(dev, "cannot enable interrupts during resume\n");
+			return ret;
+		}
+
+		ret = sdw_cdns_clock_restart(cdns, false);
+		if (ret < 0) {
+			dev_err(dev, "unable to resume master during resume\n");
+			return ret;
+		}
 	} else {
 		dev_err(dev, "%s clock_stop_quirks %x unsupported\n",
 			__func__, clock_stop_quirks);
-- 
2.17.1

