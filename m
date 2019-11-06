Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B912F1ECF
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:32:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA9091683;
	Wed,  6 Nov 2019 20:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA9091683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573068735;
	bh=jtSmIzsCl+Qq/mcOcV37kwfEw9hl7Vn+OA0As0Dbml0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ISyXxZbmxKdGqICGBbyda/M1EnQIFSkxv1FlBizKDKnyCIHQyOh088jeDkihWTtLG
	 RllRUv5pSYARZXFluzUE8Sa6YR/7maGsgcRW6WCp0O6gzUWG8rN99OPNef8PD8nMHk
	 Lj52YhOju9cd0guxEys2RBImcUhhSvSu8qdC32Mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A3E9F806F0;
	Wed,  6 Nov 2019 20:22:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98622F80659; Wed,  6 Nov 2019 20:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C11AF80611
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C11AF80611
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 11:22:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="403835112"
Received: from vidhipat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.33.70])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 11:22:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 13:22:12 -0600
Message-Id: <20191106192223.6003-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
References: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 08/19] soundwire: intel: reset pm_runtime
	status during system resume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The system resume does the entire bus re-initialization and brings it
to full-power. If the device was pm_runtime suspended, there is no
need to run the pm_runtime resume sequence after the system runtime.

Follow the documentation from runtime_pm.rst, and conditionally
disable, set_active and re-enable the device on system resume.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c     | 30 ++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 650581348732..c3cd7d2d5a34 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1298,6 +1298,7 @@ static int intel_master_remove(struct sdw_master_device *md)
 
 static int intel_suspend(struct device *dev)
 {
+	struct sdw_master_device *md = to_sdw_master_device(dev);
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	int ret;
@@ -1308,6 +1309,20 @@ static int intel_suspend(struct device *dev)
 		return 0;
 	}
 
+	if (pm_runtime_status_suspended(dev)) {
+		dev_dbg(dev,
+			"%s: pm_runtime status: suspended\n",
+			__func__);
+
+		/*
+		 * keep track of the state for the system resume, where
+		 * we will need to reset the pm_runtime status to active
+		 */
+		md->pm_runtime_suspended = true;
+
+		return 0;
+	}
+
 	ret = sdw_cdns_enable_interrupt(cdns, false);
 	if (ret < 0) {
 		dev_err(dev, "cannot disable interrupts on suspend\n");
@@ -1356,6 +1371,7 @@ static int intel_suspend_runtime(struct device *dev)
 
 static int intel_resume(struct device *dev)
 {
+	struct sdw_master_device *md = to_sdw_master_device(dev);
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	int ret;
@@ -1366,6 +1382,20 @@ static int intel_resume(struct device *dev)
 		return 0;
 	}
 
+	if (md->pm_runtime_suspended) {
+		dev_dbg(dev,
+			"%s: pm_runtime status was suspended, forcing active\n",
+			__func__);
+
+		/* follow required sequence from runtime_pm.rst */
+		pm_runtime_disable(dev);
+		pm_runtime_set_active(dev);
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_enable(dev);
+
+		md->pm_runtime_suspended = false;
+	}
+
 	ret = intel_init(sdw);
 	if (ret) {
 		dev_err(dev, "%s failed: %d", __func__, ret);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 17ec786d3a15..c06c515abad9 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -583,6 +583,7 @@ struct sdw_master_device {
 	struct device dev;
 	int link_id;
 	struct sdw_md_driver *driver;
+	bool pm_runtime_suspended;
 	void *pdata; /* core does not touch */
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
