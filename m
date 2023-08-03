Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577C76E02D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 08:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60B197F8;
	Thu,  3 Aug 2023 08:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60B197F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691044048;
	bh=W+Eg75sBaZEQWO5+zNepejl6stQbwCVziILn+2POhMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PoZRSfoQL5C3lno9u+je3otRVJDiYyyw4q1itk6Sp/qdgPd3hPJLx07KPwxuC0Rja
	 0A9TzMSPSMQT+7x6YxLd4r8ZZrKKt6dC2qPmO3fa6L1x0THINodCFvCg0Rrij7ke7l
	 QCmKIODeDcIDWMAL670TfkFulq0fDhHs+b8sWUuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2836EF8053B; Thu,  3 Aug 2023 08:26:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4103F801D5;
	Thu,  3 Aug 2023 08:26:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78BC4F8025A; Thu,  3 Aug 2023 08:25:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7382F8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 08:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7382F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lVaS7XZO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691043897; x=1722579897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W+Eg75sBaZEQWO5+zNepejl6stQbwCVziILn+2POhMQ=;
  b=lVaS7XZOFJhaVBBu9TPVH0DcfJ4wEK14Fodt0MCZ4vctFYpEO//KkP6s
   bgF+DlhYc5lb29kQdZThs2Q+MihU2lE0RyKq1oyNNxxX2bpRzuUZPVfSt
   va+fttx1Jbh9Gn7Pq8g7YK1fwSmEKhZaW2z6o0fL00VPkHNx/WxhHvi+l
   8BT0s6u9ZO4md2SrEHzEZXYR9wSr2IgFuc/x0BWNH00vbhuuDk3yzyx3S
   LUIDn0rjSkoZ487noQYb8L1SrFnhaGdtO10blVk4guq63zLZo+e5TSTNF
   5LzgZUXNpeiF5+rw19RNvc0mehkRZDzShrNj7HDFVB9xvpnA3cAQteRJX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="350075276"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200";
   d="scan'208";a="350075276"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 23:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="1060117891"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200";
   d="scan'208";a="1060117891"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 23:23:59 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/2] soundwire: intel_auxdevice: enable pm_runtime earlier on
 startup
Date: Thu,  3 Aug 2023 14:52:19 +0800
Message-Id: <20230803065220.3823269-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
References: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A46Z7VN5YIFIQRGFGOGDXDCZU27UX4OD
X-Message-ID-Hash: A46Z7VN5YIFIQRGFGOGDXDCZU27UX4OD
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A46Z7VN5YIFIQRGFGOGDXDCZU27UX4OD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

As soon as the bus starts, physical peripheral devices may report as
ATTACHED and set their status with pm_runtime_set_active() in their
update_status()/io_init().

This is problematic with the existing code, since the parent
pm_runtime status is changed to "active" after starting the bus. This
creates a time window where the pm_runtime framework can report an
issue, e.g.

"rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
sdw:0:025d:0711:00 but parent (sdw-master-0) is not active"

This patch enables runtime_pm earlier to make sure the auxiliary
device is pm_runtime active after powering-up, but before starting the
bus.

This problem was exposed by recent changes in the timing of the bus
reset, but was present in this driver since we introduced pm_runtime
support.

Closes: https://github.com/thesofproject/linux/issues/4328
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 0daa6ca9a224..f51c776eeeff 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -248,13 +248,6 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 
 	sdw_intel_debugfs_init(sdw);
 
-	/* start bus */
-	ret = sdw_intel_start_bus(sdw);
-	if (ret) {
-		dev_err(dev, "bus start failed: %d\n", ret);
-		goto err_power_up;
-	}
-
 	/* Enable runtime PM */
 	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME)) {
 		pm_runtime_set_autosuspend_delay(dev,
@@ -266,6 +259,13 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 		pm_runtime_enable(dev);
 	}
 
+	/* start bus */
+	ret = sdw_intel_start_bus(sdw);
+	if (ret) {
+		dev_err(dev, "bus start failed: %d\n", ret);
+		goto err_pm_runtime;
+	}
+
 	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_NOT_ALLOWED) {
 		/*
@@ -293,12 +293,17 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	 * with a delay. A more complete solution would require the
 	 * definition of Master properties.
 	 */
-	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME_IDLE))
+	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME_IDLE)) {
+		pm_runtime_mark_last_busy(dev);
 		pm_runtime_idle(dev);
+	}
 
 	sdw->startup_done = true;
 	return 0;
 
+err_pm_runtime:
+	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME))
+		pm_runtime_disable(dev);
 err_power_up:
 	sdw_intel_link_power_down(sdw);
 err_init:
-- 
2.25.1

