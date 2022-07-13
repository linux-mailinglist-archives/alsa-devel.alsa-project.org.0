Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8F15738DC
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6175F16D1;
	Wed, 13 Jul 2022 16:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6175F16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657722658;
	bh=79R+cGH+W8fdanIcU1gar7tgsMfMkUvcNYAcmuJq6rY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YUHwB/iF7+Lp9TvBYZr48KhfZrlOsAmQsly3YAfWuCGdbojBHl8J/nFwmVdJfcT7O
	 OAgEXtRQeU91ok2tAwqk5UoVppCsXu3hgQ7kzJvC++HdnzV+awjaxGcAc89oIBoJuV
	 vTl681fFIFtof8wIuDcXVeWlx/baZ3uQfVTXLyPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCBA8F80254;
	Wed, 13 Jul 2022 16:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2FD2F80310; Wed, 13 Jul 2022 16:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C6C4F8019B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:29:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C6C4F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VlNjHssN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657722592; x=1689258592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79R+cGH+W8fdanIcU1gar7tgsMfMkUvcNYAcmuJq6rY=;
 b=VlNjHssN+MWGm4Ejdk1MMO6jo8aNerFy+1crVcge8Es7e/H2JyXZdWNu
 j/1kdXvY8t5g2e43j6ceXWRcKDAiTBr9gpO+5FObaX4kIevZITZNZXVos
 EOLBnywXHa8UJ7EKQnPyT4LrF6TenLXYYlRG4sbGHrhqJGotAQa8lY+Mi
 F+5dVlF7uZxKqqdyQi17sBv7/JbkJE6dCZFnMYIaH/ao4WrJX1N+XR+k1
 kvN0mERRMD+T83mQP121VJ4zrbqLedXjLFfA7z7a/41fA2YsJMnfu4sg/
 huE09OayUx0TXL62t5vF6VeTvJpqDmRjVZPsD/IlE8ejMsPxA3afOcomK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="285251403"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="285251403"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:29:48 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="622966734"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:29:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/2] soundwire: intel: remove use of __func__ in dev_dbg
Date: Wed, 13 Jul 2022 22:29:37 +0800
Message-Id: <20220713142937.17562-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713142937.17562-1-yung-chuan.liao@linux.intel.com>
References: <20220713142937.17562-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, gregkh@linuxfoundation.org,
 vinod.koul@linaro.org, bard.liao@intel.com, linux-kernel@vger.kernel.org
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 85d4268eea65..25b27cd1be1d 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -293,11 +293,11 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 		syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24;
 
 	if (!*shim_mask) {
-		dev_dbg(sdw->cdns.dev, "%s: powering up all links\n", __func__);
+		dev_dbg(sdw->cdns.dev, "powering up all links\n");
 
 		/* we first need to program the SyncPRD/CPU registers */
 		dev_dbg(sdw->cdns.dev,
-			"%s: first link up, programming SYNCPRD\n", __func__);
+			"first link up, programming SYNCPRD\n");
 
 		/* set SyncPRD period */
 		sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
@@ -479,7 +479,7 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 
 	if (!*shim_mask) {
 
-		dev_dbg(sdw->cdns.dev, "%s: powering down all links\n", __func__);
+		dev_dbg(sdw->cdns.dev, "powering down all links\n");
 
 		/* Link power down sequence */
 		link_control = intel_readl(shim, SDW_SHIM_LCTL);
@@ -1547,11 +1547,11 @@ static int intel_resume_child_device(struct device *dev, void *data)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 
 	if (!slave->probed) {
-		dev_dbg(dev, "%s: skipping device, no probed driver\n", __func__);
+		dev_dbg(dev, "skipping device, no probed driver\n");
 		return 0;
 	}
 	if (!slave->dev_num_sticky) {
-		dev_dbg(dev, "%s: skipping device, never detected on bus\n", __func__);
+		dev_dbg(dev, "skipping device, never detected on bus\n");
 		return 0;
 	}
 
@@ -1637,7 +1637,7 @@ static int __maybe_unused intel_suspend(struct device *dev)
 	}
 
 	if (pm_runtime_suspended(dev)) {
-		dev_dbg(dev, "%s: pm_runtime status: suspended\n", __func__);
+		dev_dbg(dev, "pm_runtime status: suspended\n");
 
 		clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
@@ -1758,7 +1758,7 @@ static int __maybe_unused intel_resume(struct device *dev)
 	multi_link = !(link_flags & SDW_INTEL_MASTER_DISABLE_MULTI_LINK);
 
 	if (pm_runtime_suspended(dev)) {
-		dev_dbg(dev, "%s: pm_runtime status was suspended, forcing active\n", __func__);
+		dev_dbg(dev, "pm_runtime status was suspended, forcing active\n");
 
 		/* follow required sequence from runtime_pm.rst */
 		pm_runtime_disable(dev);
-- 
2.25.1

