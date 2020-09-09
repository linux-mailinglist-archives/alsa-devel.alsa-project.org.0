Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE06F262F3F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 15:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 218CC16E8;
	Wed,  9 Sep 2020 15:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 218CC16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599658823;
	bh=9xRmd4QVb0Wnaqs/tbVwKGRXqLfnzGwU/hPo1JFohKI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GQ4+chYOe+kpgukPCOtTnKSG+2FVY18BS3QX+ableTFYJxqUBfbK3xiVHdw8ejB5Y
	 hClZIxhCA0qFSlg3UXSt1Y7UpmcPMeoEMS44mKZx3l7TLdxKcMBDr4WftZ/6My2XMD
	 Kf+2it1sy2fV00y7j4zfaxu2wHvVcIGOMEsVBN/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C7FF800FD;
	Wed,  9 Sep 2020 15:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3878FF80227; Wed,  9 Sep 2020 15:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5194F800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 15:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5194F800FD
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 742603448DFDBD0050E8;
 Wed,  9 Sep 2020 21:37:34 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 21:37:25 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH -next] soundwire: intel: Remove ununsed function
Date: Wed, 9 Sep 2020 21:15:31 +0800
Message-ID: <20200909131531.31380-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
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

If CONFIG_PM is not set, build warns:

drivers/soundwire/intel.c:488:12: warning: 'intel_link_power_down' defined but not used [-Wunused-function]

Move this to #ifdef block.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soundwire/intel.c | 137 +++++++++++++++++++-------------------
 1 file changed, 68 insertions(+), 69 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index e047910d73f5..ea53291c80dd 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -399,27 +399,6 @@ static void intel_shim_glue_to_master_ip(struct sdw_intel *sdw)
 	/* at this point Master IP has full control of the I/Os */
 }
 
-/* this needs to be called with shim_lock */
-static void intel_shim_master_ip_to_glue(struct sdw_intel *sdw)
-{
-	unsigned int link_id = sdw->instance;
-	void __iomem *shim = sdw->link_res->shim;
-	u16 ioctl;
-
-	/* Glue logic */
-	ioctl = intel_readw(shim, SDW_SHIM_IOCTL(link_id));
-	ioctl |= SDW_SHIM_IOCTL_BKE;
-	ioctl |= SDW_SHIM_IOCTL_COE;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	ioctl &= ~(SDW_SHIM_IOCTL_MIF);
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	/* at this point Integration Glue has full control of the I/Os */
-}
-
 static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
 {
 	void __iomem *shim = sdw->link_res->shim;
@@ -485,54 +464,6 @@ static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 	mutex_unlock(sdw->link_res->shim_lock);
 }
 
-static int intel_link_power_down(struct sdw_intel *sdw)
-{
-	u32 link_control, spa_mask, cpa_mask;
-	unsigned int link_id = sdw->instance;
-	void __iomem *shim = sdw->link_res->shim;
-	u32 *shim_mask = sdw->link_res->shim_mask;
-	int ret = 0;
-
-	mutex_lock(sdw->link_res->shim_lock);
-
-	intel_shim_master_ip_to_glue(sdw);
-
-	if (!(*shim_mask & BIT(link_id)))
-		dev_err(sdw->cdns.dev,
-			"%s: Unbalanced power-up/down calls\n", __func__);
-
-	*shim_mask &= ~BIT(link_id);
-
-	if (!*shim_mask) {
-
-		dev_dbg(sdw->cdns.dev, "%s: powering down all links\n", __func__);
-
-		/* Link power down sequence */
-		link_control = intel_readl(shim, SDW_SHIM_LCTL);
-
-		/* only power-down enabled links */
-		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK, ~sdw->link_res->link_mask);
-		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK, sdw->link_res->link_mask);
-
-		link_control &=  spa_mask;
-
-		ret = intel_clear_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
-	}
-
-	link_control = intel_readl(shim, SDW_SHIM_LCTL);
-
-	mutex_unlock(sdw->link_res->shim_lock);
-
-	if (ret < 0) {
-		dev_err(sdw->cdns.dev, "%s: could not power down link\n", __func__);
-
-		return ret;
-	}
-
-	sdw->cdns.link_up = false;
-	return 0;
-}
-
 static void intel_shim_sync_arm(struct sdw_intel *sdw)
 {
 	void __iomem *shim = sdw->link_res->shim;
@@ -1541,6 +1472,74 @@ int intel_master_process_wakeen_event(struct platform_device *pdev)
  */
 
 #ifdef CONFIG_PM
+/* this needs to be called with shim_lock */
+static void intel_shim_master_ip_to_glue(struct sdw_intel *sdw)
+{
+	unsigned int link_id = sdw->instance;
+	void __iomem *shim = sdw->link_res->shim;
+	u16 ioctl;
+
+	/* Glue logic */
+	ioctl = intel_readw(shim, SDW_SHIM_IOCTL(link_id));
+	ioctl |= SDW_SHIM_IOCTL_BKE;
+	ioctl |= SDW_SHIM_IOCTL_COE;
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	ioctl &= ~(SDW_SHIM_IOCTL_MIF);
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	/* at this point Integration Glue has full control of the I/Os */
+}
+
+static int intel_link_power_down(struct sdw_intel *sdw)
+{
+	u32 link_control, spa_mask, cpa_mask;
+	unsigned int link_id = sdw->instance;
+	void __iomem *shim = sdw->link_res->shim;
+	u32 *shim_mask = sdw->link_res->shim_mask;
+	int ret = 0;
+
+	mutex_lock(sdw->link_res->shim_lock);
+
+	intel_shim_master_ip_to_glue(sdw);
+
+	if (!(*shim_mask & BIT(link_id)))
+		dev_err(sdw->cdns.dev,
+			"%s: Unbalanced power-up/down calls\n", __func__);
+
+	*shim_mask &= ~BIT(link_id);
+
+	if (!*shim_mask) {
+
+		dev_dbg(sdw->cdns.dev, "%s: powering down all links\n", __func__);
+
+		/* Link power down sequence */
+		link_control = intel_readl(shim, SDW_SHIM_LCTL);
+
+		/* only power-down enabled links */
+		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK, ~sdw->link_res->link_mask);
+		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK, sdw->link_res->link_mask);
+
+		link_control &=  spa_mask;
+
+		ret = intel_clear_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
+	}
+
+	link_control = intel_readl(shim, SDW_SHIM_LCTL);
+
+	mutex_unlock(sdw->link_res->shim_lock);
+
+	if (ret < 0) {
+		dev_err(sdw->cdns.dev, "%s: could not power down link\n", __func__);
+
+		return ret;
+	}
+
+	sdw->cdns.link_up = false;
+	return 0;
+}
 
 static int __maybe_unused intel_suspend(struct device *dev)
 {
-- 
2.17.1


