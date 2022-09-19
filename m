Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5485BD42A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:53:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167CD15C3;
	Mon, 19 Sep 2022 19:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167CD15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663610033;
	bh=JLrBqsp8Ryp2ISD8I4vo0ddVnpHvol6JNhobDsbmiJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSy53ki7q8ULTO2F5vam4886+XCPpyzDw4jf2aP4pDjoARBZO01eGcQpSQKtii5RV
	 sZ09DvSvyg+zIvcPGDfYCFr06DA5i4Xx3xeSRVPCkKXcdSETfKVbGa1cqGkc0uJaH4
	 p8GcRxthMvQCL2RnB2M1kPemrdSZQLopbNZ0qZUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D58F80563;
	Mon, 19 Sep 2022 19:51:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3377EF80552; Mon, 19 Sep 2022 19:51:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BA43F80539
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BA43F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kU700J5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609855; x=1695145855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JLrBqsp8Ryp2ISD8I4vo0ddVnpHvol6JNhobDsbmiJ0=;
 b=kU700J5VmX7lhJrQrBtuOXTB3D1DRCt/ZvWFXUkLrdFaeBzRXcT8eZFq
 K5mxtAwRNP5eDB1JYZE7fwGMW/M4CWcaW7fhNbouEKLfoT0SVAzjxraAy
 jgXe9hZC2fzR9HuL5inmRA4GNtOcKPF0M28nY8SF2t4kKjAbPWx29Md/W
 MpY6fiRgVwf2RTlIwxCyeBBzFW80SncniDDcekxSVKMt2aMSNl8LZcvHg
 47LAoxXymcMoP7jYnm34wSg1JkiQPO3bDoRFCxrZpip4f0c13jHdpWJ6x
 71yms+hl2f4afEk5tITTmYKF9W2MpTH0Pa/c8O6qJaWOlTPXYDysSQcOJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498756"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498756"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658468"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 07/11] soundwire: intel: remove intel_init() wrapper
Date: Tue, 20 Sep 2022 01:57:17 +0800
Message-Id: <20220919175721.354679-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
References: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

We can directly call intel_link_power_up and do power_up+shim_init in
the same function. This simplifies the code with a better symmetry
between power_up and power_down operations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 140cf36eb407..4eeb2b5c1594 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -311,15 +311,13 @@ static void intel_shim_master_ip_to_glue(struct sdw_intel *sdw)
 	/* at this point Integration Glue has full control of the I/Os */
 }
 
-static int intel_shim_init(struct sdw_intel *sdw)
+/* this needs to be called with shim_lock */
+static void intel_shim_init(struct sdw_intel *sdw)
 {
 	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
-	int ret = 0;
 	u16 ioctl = 0, act = 0;
 
-	mutex_lock(sdw->link_res->shim_lock);
-
 	/* Initialize Shim */
 	ioctl |= SDW_SHIM_IOCTL_BKE;
 	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
@@ -344,10 +342,6 @@ static int intel_shim_init(struct sdw_intel *sdw)
 	act |= SDW_SHIM_CTMCTL_DODS;
 	intel_writew(shim, SDW_SHIM_CTMCTL(link_id), act);
 	usleep_range(10, 15);
-
-	mutex_unlock(sdw->link_res->shim_lock);
-
-	return ret;
 }
 
 static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
@@ -449,6 +443,9 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 	*shim_mask |= BIT(link_id);
 
 	sdw->cdns.link_up = true;
+
+	intel_shim_init(sdw);
+
 out:
 	mutex_unlock(sdw->link_res->shim_lock);
 
@@ -1274,16 +1271,6 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.post_bank_switch = intel_post_bank_switch,
 };
 
-static int intel_init(struct sdw_intel *sdw)
-{
-	/* Initialize shim and controller */
-	intel_link_power_up(sdw);
-
-	intel_shim_init(sdw);
-
-	return 0;
-}
-
 /*
  * probe and init (aux_dev_id argument is required by function prototype but not used)
  */
@@ -1384,7 +1371,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	}
 
 	/* Initialize shim, controller */
-	ret = intel_init(sdw);
+	ret = intel_link_power_up(sdw);
 	if (ret)
 		goto err_init;
 
@@ -1773,7 +1760,7 @@ static int __maybe_unused intel_resume(struct device *dev)
 			pm_runtime_idle(dev);
 	}
 
-	ret = intel_init(sdw);
+	ret = intel_link_power_up(sdw);
 	if (ret) {
 		dev_err(dev, "%s failed: %d\n", __func__, ret);
 		return ret;
@@ -1862,7 +1849,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
 	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_TEARDOWN) {
-		ret = intel_init(sdw);
+		ret = intel_link_power_up(sdw);
 		if (ret) {
 			dev_err(dev, "%s failed: %d\n", __func__, ret);
 			return ret;
@@ -1910,7 +1897,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 						  true, INTEL_MASTER_RESET_ITERATIONS);
 
 	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
-		ret = intel_init(sdw);
+		ret = intel_link_power_up(sdw);
 		if (ret) {
 			dev_err(dev, "%s failed: %d\n", __func__, ret);
 			return ret;
@@ -1991,7 +1978,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 		if (!clock_stop0)
 			dev_err(dev, "%s invalid configuration, clock was not stopped", __func__);
 
-		ret = intel_init(sdw);
+		ret = intel_link_power_up(sdw);
 		if (ret) {
 			dev_err(dev, "%s failed: %d\n", __func__, ret);
 			return ret;
-- 
2.25.1

