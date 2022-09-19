Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AFD5BD421
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:52:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D2D868;
	Mon, 19 Sep 2022 19:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D2D868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663609965;
	bh=5FyW8xBbXeJkum8aRiIIbDtkh2gfMubt0it9/PXMLG8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGJSKDQ9JyI0iE1OyxjIm/pwok6oFnysZJuUNJdGe2/nhCaRYOImKmldPV/vhKayz
	 C9H7HVpLMVp13ZqfUOLMHXVYOHvQAgXbuLKzGM1ynKiEItpKGcYEKtY+jBd7AGiOUG
	 PYwZG7ZQiuF1p9gzXuZM2u1JosqF+kaylIZQEv44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 556F9F80551;
	Mon, 19 Sep 2022 19:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D62DCF80552; Mon, 19 Sep 2022 19:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6980AF8032B
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6980AF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DXmTLNAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609855; x=1695145855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5FyW8xBbXeJkum8aRiIIbDtkh2gfMubt0it9/PXMLG8=;
 b=DXmTLNAzadkvzW0o8iVeMKaVNgGRQpgXL9fLKhAS3qUxEkDqarNEdz12
 SW+zJaPm9ckSSR9TUY1KSwJLajmnMyKJzFJjwwFzquUXF1BvDzqkIpN6d
 sfBERyPze3DJgbu4BMKCBhdMhu7DM3fWOW3ahwvJiP0P3K0mHKrWY5qG/
 XE1cnd0I36BQqB9XUc1L5Cx5dl1S6aQYxsbqDpIhNxxeVNqJn+4hErT84
 CN3y+s5fzEos4yVtL9DBjhoxgNa/WWw+XqqrfWqeaisdp/iKgtqwtkIqE
 6qVV5m8SPz/ku/2XYucO141kyHEqhmrjFY4BXYk92cnntpnYrY0gyxHZi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498745"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498745"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658448"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 06/11] soundwire: intel: move shim initialization before power
 up/down
Date: Tue, 20 Sep 2022 01:57:16 +0800
Message-Id: <20220919175721.354679-7-yung-chuan.liao@linux.intel.com>
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

Move code around before additional simplification. No functionality
change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 231 +++++++++++++++++++-------------------
 1 file changed, 115 insertions(+), 116 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 2d828d98e153..140cf36eb407 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -260,6 +260,121 @@ static void intel_debugfs_exit(struct sdw_intel *sdw) {}
 /*
  * shim ops
  */
+/* this needs to be called with shim_lock */
+static void intel_shim_glue_to_master_ip(struct sdw_intel *sdw)
+{
+	void __iomem *shim = sdw->link_res->shim;
+	unsigned int link_id = sdw->instance;
+	u16 ioctl;
+
+	/* Switch to MIP from Glue logic */
+	ioctl = intel_readw(shim,  SDW_SHIM_IOCTL(link_id));
+
+	ioctl &= ~(SDW_SHIM_IOCTL_DOE);
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	ioctl &= ~(SDW_SHIM_IOCTL_DO);
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	ioctl |= (SDW_SHIM_IOCTL_MIF);
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	ioctl &= ~(SDW_SHIM_IOCTL_BKE);
+	ioctl &= ~(SDW_SHIM_IOCTL_COE);
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	/* at this point Master IP has full control of the I/Os */
+}
+
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
+static int intel_shim_init(struct sdw_intel *sdw)
+{
+	void __iomem *shim = sdw->link_res->shim;
+	unsigned int link_id = sdw->instance;
+	int ret = 0;
+	u16 ioctl = 0, act = 0;
+
+	mutex_lock(sdw->link_res->shim_lock);
+
+	/* Initialize Shim */
+	ioctl |= SDW_SHIM_IOCTL_BKE;
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	ioctl |= SDW_SHIM_IOCTL_WPDD;
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	ioctl |= SDW_SHIM_IOCTL_DO;
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	ioctl |= SDW_SHIM_IOCTL_DOE;
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	intel_shim_glue_to_master_ip(sdw);
+
+	u16p_replace_bits(&act, 0x1, SDW_SHIM_CTMCTL_DOAIS);
+	act |= SDW_SHIM_CTMCTL_DACTQE;
+	act |= SDW_SHIM_CTMCTL_DODS;
+	intel_writew(shim, SDW_SHIM_CTMCTL(link_id), act);
+	usleep_range(10, 15);
+
+	mutex_unlock(sdw->link_res->shim_lock);
+
+	return ret;
+}
+
+static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
+{
+	void __iomem *shim = sdw->link_res->shim;
+	unsigned int link_id = sdw->instance;
+	u16 wake_en, wake_sts;
+
+	mutex_lock(sdw->link_res->shim_lock);
+	wake_en = intel_readw(shim, SDW_SHIM_WAKEEN);
+
+	if (wake_enable) {
+		/* Enable the wakeup */
+		wake_en |= (SDW_SHIM_WAKEEN_ENABLE << link_id);
+		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
+	} else {
+		/* Disable the wake up interrupt */
+		wake_en &= ~(SDW_SHIM_WAKEEN_ENABLE << link_id);
+		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
+
+		/* Clear wake status */
+		wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
+		wake_sts |= (SDW_SHIM_WAKESTS_STATUS << link_id);
+		intel_writew(shim, SDW_SHIM_WAKESTS, wake_sts);
+	}
+	mutex_unlock(sdw->link_res->shim_lock);
+}
 
 static int intel_link_power_up(struct sdw_intel *sdw)
 {
@@ -340,122 +455,6 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 	return ret;
 }
 
-/* this needs to be called with shim_lock */
-static void intel_shim_glue_to_master_ip(struct sdw_intel *sdw)
-{
-	void __iomem *shim = sdw->link_res->shim;
-	unsigned int link_id = sdw->instance;
-	u16 ioctl;
-
-	/* Switch to MIP from Glue logic */
-	ioctl = intel_readw(shim,  SDW_SHIM_IOCTL(link_id));
-
-	ioctl &= ~(SDW_SHIM_IOCTL_DOE);
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	ioctl &= ~(SDW_SHIM_IOCTL_DO);
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	ioctl |= (SDW_SHIM_IOCTL_MIF);
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	ioctl &= ~(SDW_SHIM_IOCTL_BKE);
-	ioctl &= ~(SDW_SHIM_IOCTL_COE);
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	/* at this point Master IP has full control of the I/Os */
-}
-
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
-static int intel_shim_init(struct sdw_intel *sdw)
-{
-	void __iomem *shim = sdw->link_res->shim;
-	unsigned int link_id = sdw->instance;
-	int ret = 0;
-	u16 ioctl = 0, act = 0;
-
-	mutex_lock(sdw->link_res->shim_lock);
-
-	/* Initialize Shim */
-	ioctl |= SDW_SHIM_IOCTL_BKE;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	ioctl |= SDW_SHIM_IOCTL_WPDD;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	ioctl |= SDW_SHIM_IOCTL_DO;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	ioctl |= SDW_SHIM_IOCTL_DOE;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-	usleep_range(10, 15);
-
-	intel_shim_glue_to_master_ip(sdw);
-
-	u16p_replace_bits(&act, 0x1, SDW_SHIM_CTMCTL_DOAIS);
-	act |= SDW_SHIM_CTMCTL_DACTQE;
-	act |= SDW_SHIM_CTMCTL_DODS;
-	intel_writew(shim, SDW_SHIM_CTMCTL(link_id), act);
-	usleep_range(10, 15);
-
-	mutex_unlock(sdw->link_res->shim_lock);
-
-	return ret;
-}
-
-static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
-{
-	void __iomem *shim = sdw->link_res->shim;
-	unsigned int link_id = sdw->instance;
-	u16 wake_en, wake_sts;
-
-	mutex_lock(sdw->link_res->shim_lock);
-	wake_en = intel_readw(shim, SDW_SHIM_WAKEEN);
-
-	if (wake_enable) {
-		/* Enable the wakeup */
-		wake_en |= (SDW_SHIM_WAKEEN_ENABLE << link_id);
-		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
-	} else {
-		/* Disable the wake up interrupt */
-		wake_en &= ~(SDW_SHIM_WAKEEN_ENABLE << link_id);
-		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
-
-		/* Clear wake status */
-		wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
-		wake_sts |= (SDW_SHIM_WAKESTS_STATUS << link_id);
-		intel_writew(shim, SDW_SHIM_WAKESTS, wake_sts);
-	}
-	mutex_unlock(sdw->link_res->shim_lock);
-}
-
 static int intel_link_power_down(struct sdw_intel *sdw)
 {
 	u32 link_control, spa_mask, cpa_mask;
-- 
2.25.1

