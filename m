Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3DC3D6E8A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 07:59:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9B31EF0;
	Tue, 27 Jul 2021 07:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9B31EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627365568;
	bh=AamyEww6d6EqbLvs7RcjbwORfe6zbnW0iL1B3trggU0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2QFAyyroCRwP0g76ICsMudmbJp925WGPs28bhgVRBgXwqpBMpCXJ2uxREjiwBEP3
	 VYZ5VLGDParpVUq3ix0nAaWtk9LPyMNrOHrWYUavk4ip1M5Erup7ro/oTWOmcViWXv
	 G+AhC0M1HMDqUAfaxsCJDR/H1nt1TUfpMKTMV00I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92A3F804E4;
	Tue, 27 Jul 2021 07:56:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 922B7F804E5; Tue, 27 Jul 2021 07:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8999DF8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 07:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8999DF8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="276163943"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="276163943"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 22:56:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="474302624"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 22:56:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 3/4] soundwire: intel: exit clock stop mode on system suspend
Date: Tue, 27 Jul 2021 13:56:07 +0800
Message-Id: <20210727055608.30247-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
References: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

Intel validation reported an issue where the HW_RST self-clearing bit
is not cleared in hardware, which as a ripple effect creates issues
with the clock stop mode.

This happens is a specific sequence where the Intel manager is
pm_runtime suspended with the clock-stop mode enabled. During the
system suspend, we currently do nothing, which can lead to potential
issues on system resume and the following pm_runtime suspend,
depending on the hardware state.

This patch suggests a full resume (parent+child devices) if the
clock-stop mode is used. This may require extra time but will make the
suspend/resume flows completely symmetric. This also removes a race
condition where we could not access SHIM registers if the parent was
suspended as well. Resuming the link also resumes the parent by
construction.

BugLink: https://github.com/thesofproject/linux/issues/2606
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 46d1645cb7fe..9d05e158fe0e 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1527,6 +1527,70 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
  * PM calls
  */
 
+static int intel_resume_child_device(struct device *dev, void *data)
+{
+	int ret;
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+
+	if (!slave->probed) {
+		dev_dbg(dev, "%s: skipping device, no probed driver\n", __func__);
+		return 0;
+	}
+	if (!slave->dev_num_sticky) {
+		dev_dbg(dev, "%s: skipping device, never detected on bus\n", __func__);
+		return 0;
+	}
+
+	ret = pm_request_resume(dev);
+	if (ret < 0)
+		dev_err(dev, "%s: pm_request_resume failed: %d\n", __func__, ret);
+
+	return ret;
+}
+
+static int __maybe_unused intel_pm_prepare(struct device *dev)
+{
+	struct sdw_cdns *cdns = dev_get_drvdata(dev);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_bus *bus = &cdns->bus;
+	u32 clock_stop_quirks;
+	int ret = 0;
+
+	if (bus->prop.hw_disabled || !sdw->startup_done) {
+		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
+			bus->link_id);
+		return 0;
+	}
+
+	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
+
+	if ((clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) ||
+	    !clock_stop_quirks) {
+		/*
+		 * Try to resume the entire bus (parent + child devices) to exit
+		 * the clock stop mode. If this fails, we keep going since we don't want
+		 * to prevent system suspend from happening and errors should be recoverable
+		 * on resume.
+		 */
+		ret = device_for_each_child(bus->dev, NULL, intel_resume_child_device);
+
+		if (ret < 0)
+			dev_err(dev, "%s: intel_resume_child_device failed: %d\n", __func__, ret);
+
+		/*
+		 * in the case where a link was started but does not have anything connected,
+		 * we still need to resume to keep link power up/down sequences balanced.
+		 * This is a no-op if a child device was present, since resuming the child
+		 * device would also resume the parent
+		 */
+		ret = pm_request_resume(dev);
+		if (ret < 0)
+			dev_err(dev, "%s: pm_request_resume failed: %d\n", __func__, ret);
+	}
+
+	return 0;
+}
+
 static int __maybe_unused intel_suspend(struct device *dev)
 {
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
@@ -1923,6 +1987,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 }
 
 static const struct dev_pm_ops intel_pm = {
+	.prepare = intel_pm_prepare,
 	SET_SYSTEM_SLEEP_PM_OPS(intel_suspend, intel_resume)
 	SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, NULL)
 };
-- 
2.17.1

