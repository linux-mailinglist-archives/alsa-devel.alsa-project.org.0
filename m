Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F5059D04B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 06:59:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A8831683;
	Tue, 23 Aug 2022 06:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A8831683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661230792;
	bh=LkEjonl0/2et2qJwC2dIvmsqgJ093c9yFXVqNZmKbQs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLjEGiiuSZBNBeam1pMtjYAcFonreZjFPsowklU8bBL8Sh1bht1Wewzdl60j9Vsaw
	 oHW1YM2o5k9nA+7ZtaDPxa6HVo3EOWE+5w90mDIQfJQXhNSDCAjL7U8kjxbjIio2VR
	 XAcMnLQepw1p56uMbkVlepHjHYOswFMY9qhVN4+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A40F80528;
	Tue, 23 Aug 2022 06:58:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F9B8F80526; Tue, 23 Aug 2022 06:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0688CF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0688CF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g7rP0wus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661230688; x=1692766688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LkEjonl0/2et2qJwC2dIvmsqgJ093c9yFXVqNZmKbQs=;
 b=g7rP0wusynTHY3aHhaWdKmT+4fv6e+GUe66z1IO/JUfu/043Xza5W/8L
 hz2WJCzN/4Lv8ady30AASCagUQlqoEuNp9fgPO1t51e86gvF34YHLxD0N
 Mn3RwEqzQ0dQmE6RYelougNJSX0+GKDXUUPjAANpvG59+1/7wRusjnUtW
 c6b8GltxJUOv3/c3DJc4ZBGkEs/fEWtI3eeCrPRY5WH+vxaG1kTeXcf8r
 1lN47Gj0hKQfUmGAwO6ioEjulL7+bRDAwoM5WaFdq3q1Lg7sbMNYGp3fu
 wNXhnnOTmRRb94nT01wiuqr5Xo5WEyp+oE0s1WyNbT2s6WoTgoZaELOL7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294380456"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="294380456"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:58:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="605536651"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:58:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/2] soundwire: intel: remove use of __func__ in dev_dbg
Date: Tue, 23 Aug 2022 13:01:58 +0800
Message-Id: <20220823050158.2671245-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823050158.2671245-1-yung-chuan.liao@linux.intel.com>
References: <20220823050158.2671245-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org, pierre-louis.bossart@linux.intel.com,
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
index 3e372599a8c3..25ec9c272239 100644
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
@@ -1557,11 +1557,11 @@ static int intel_resume_child_device(struct device *dev, void *data)
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
 
@@ -1647,7 +1647,7 @@ static int __maybe_unused intel_suspend(struct device *dev)
 	}
 
 	if (pm_runtime_suspended(dev)) {
-		dev_dbg(dev, "%s: pm_runtime status: suspended\n", __func__);
+		dev_dbg(dev, "pm_runtime status: suspended\n");
 
 		clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
@@ -1768,7 +1768,7 @@ static int __maybe_unused intel_resume(struct device *dev)
 	multi_link = !(link_flags & SDW_INTEL_MASTER_DISABLE_MULTI_LINK);
 
 	if (pm_runtime_suspended(dev)) {
-		dev_dbg(dev, "%s: pm_runtime status was suspended, forcing active\n", __func__);
+		dev_dbg(dev, "pm_runtime status was suspended, forcing active\n");
 
 		/* follow required sequence from runtime_pm.rst */
 		pm_runtime_disable(dev);
-- 
2.25.1

