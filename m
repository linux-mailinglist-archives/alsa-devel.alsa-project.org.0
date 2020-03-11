Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD1182493
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 23:15:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CDFB16B5;
	Wed, 11 Mar 2020 23:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CDFB16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583964948;
	bh=sxsvCNRVVY1NDTxjf8c2Lot0WW0I82e8JeDqfl7e6Hs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkXTa0zEQH48kiZMPloBcAE3yqPmWCxZBwBs8Lti/3AYn3+JTs4w4A7qoYG/2eyG+
	 RFQkYC4TRsgDWtUlmwfPJNkszN2AAoJSemBkhMHz9iSV3laqlPo83tr4jkETUz8GyU
	 okNzNXCyXQoowAZl/Wxj1QZd7Y0TGzGO8HCpzrwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C10EF802BE;
	Wed, 11 Mar 2020 23:11:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C973F800B5; Wed, 11 Mar 2020 23:10:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3E10F8021D
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 23:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E10F8021D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 15:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,542,1574150400"; d="scan'208";a="277550609"
Received: from fjan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.25.157])
 by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2020 15:10:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] soundwire: intel: follow documentation sequences for SHIM
 registers
Date: Wed, 11 Mar 2020 17:10:24 -0500
Message-Id: <20200311221026.18174-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

Somehow the existing code is not aligned with the steps described in
the documentation, refactor code and make sure the register
programming sequences are correct.

This includes making sure SHIM_SYNC is programmed only once, before
the first link is powered on.

Note that the SYNCPRD value is tied only to the XTAL value and not the
current bus frequency or the frame rate.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 186 ++++++++++++++++++++++++++++----------
 1 file changed, 139 insertions(+), 47 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 3c271a8044b8..9c6514fe1284 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -46,7 +46,8 @@
 #define SDW_SHIM_LCTL_SPA		BIT(0)
 #define SDW_SHIM_LCTL_CPA		BIT(8)
 
-#define SDW_SHIM_SYNC_SYNCPRD_VAL	0x176F
+#define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 / SDW_CADENCE_GSYNC_KHZ - 1)
+#define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 / SDW_CADENCE_GSYNC_KHZ - 1)
 #define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
 #define SDW_SHIM_SYNC_SYNCCPU		BIT(15)
 #define SDW_SHIM_SYNC_CMDSYNC_MASK	GENMASK(19, 16)
@@ -283,11 +284,48 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 {
 	unsigned int link_id = sdw->instance;
 	void __iomem *shim = sdw->link_res->shim;
+	u32 *shim_mask = sdw->link_res->shim_mask;
+	struct sdw_bus *bus = &sdw->cdns.bus;
+	struct sdw_master_prop *prop = &bus->prop;
 	int spa_mask, cpa_mask;
-	int link_control, ret;
+	int link_control;
+	int ret = 0;
+	u32 syncprd;
+	u32 sync_reg;
 
 	mutex_lock(sdw->link_res->shim_lock);
 
+	/*
+	 * The hardware relies on an internal counter,
+	 * typically 4kHz, to generate the SoundWire SSP -
+	 * which defines a 'safe' synchronization point
+	 * between commands and audio transport and allows for
+	 * multi link synchronization. The SYNCPRD value is
+	 * only dependent on the oscillator clock provided to
+	 * the IP, so adjust based on _DSD properties reported
+	 * in DSDT tables. The values reported are based on
+	 * either 24MHz (CNL/CML) or 38.4 MHz (ICL/TGL+).
+	 */
+	if (prop->mclk_freq % 6000000)
+		syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_38_4;
+	else
+		syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24;
+
+	if (!*shim_mask) {
+		/* we first need to program the SyncPRD/CPU registers */
+		dev_dbg(sdw->cdns.dev,
+			"%s: first link up, programming SYNCPRD\n", __func__);
+
+		/* set SyncPRD period */
+		sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
+		sync_reg |= (syncprd <<
+			     SDW_REG_SHIFT(SDW_SHIM_SYNC_SYNCPRD));
+
+		/* Set SyncCPU bit */
+		sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
+		intel_writel(shim, SDW_SHIM_SYNC, sync_reg);
+	}
+
 	/* Link power up sequence */
 	link_control = intel_readl(shim, SDW_SHIM_LCTL);
 	spa_mask = (SDW_SHIM_LCTL_SPA << link_id);
@@ -295,73 +333,118 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 	link_control |=  spa_mask;
 
 	ret = intel_set_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
-	mutex_unlock(sdw->link_res->shim_lock);
+	if (ret < 0) {
+		dev_err(sdw->cdns.dev, "Failed to power up link: %d\n", ret);
+		goto out;
+	}
 
-	if (ret < 0)
-		return ret;
+	if (!*shim_mask) {
+		/* SyncCPU will change once link is active */
+		ret = intel_wait_bit(shim, SDW_SHIM_SYNC,
+				     SDW_SHIM_SYNC_SYNCCPU, 0);
+		if (ret < 0) {
+			dev_err(sdw->cdns.dev,
+				"Failed to set SHIM_SYNC: %d\n", ret);
+			goto out;
+		}
+	}
+
+	*shim_mask |= BIT(link_id);
 
 	sdw->cdns.link_up = true;
-	return 0;
+out:
+	mutex_unlock(sdw->link_res->shim_lock);
+
+	return ret;
 }
 
-static int intel_shim_init(struct sdw_intel *sdw)
+/* this needs to be called with shim_lock */
+static void intel_shim_glue_to_master_ip(struct sdw_intel *sdw)
 {
 	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
-	int sync_reg, ret;
-	u16 ioctl = 0, act = 0;
-
-	mutex_lock(sdw->link_res->shim_lock);
-
-	/* Initialize Shim */
-	ioctl |= SDW_SHIM_IOCTL_BKE;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-
-	ioctl |= SDW_SHIM_IOCTL_WPDD;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-
-	ioctl |= SDW_SHIM_IOCTL_DO;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-
-	ioctl |= SDW_SHIM_IOCTL_DOE;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	u16 ioctl;
 
 	/* Switch to MIP from Glue logic */
 	ioctl = intel_readw(shim,  SDW_SHIM_IOCTL(link_id));
 
 	ioctl &= ~(SDW_SHIM_IOCTL_DOE);
 	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
 
 	ioctl &= ~(SDW_SHIM_IOCTL_DO);
 	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
 
 	ioctl |= (SDW_SHIM_IOCTL_MIF);
 	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
 
 	ioctl &= ~(SDW_SHIM_IOCTL_BKE);
 	ioctl &= ~(SDW_SHIM_IOCTL_COE);
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
 
+	ioctl &= ~(SDW_SHIM_IOCTL_MIF);
 	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	usleep_range(10, 15);
+
+	/* at this point Integration Glue has full control of the I/Os */
+}
+
+static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
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
 
 	act |= 0x1 << SDW_REG_SHIFT(SDW_SHIM_CTMCTL_DOAIS);
 	act |= SDW_SHIM_CTMCTL_DACTQE;
 	act |= SDW_SHIM_CTMCTL_DODS;
 	intel_writew(shim, SDW_SHIM_CTMCTL(link_id), act);
+	usleep_range(10, 15);
 
-	/* Now set SyncPRD period */
-	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
-	sync_reg |= (SDW_SHIM_SYNC_SYNCPRD_VAL <<
-			SDW_REG_SHIFT(SDW_SHIM_SYNC_SYNCPRD));
-
-	/* Set SyncCPU bit */
-	sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
-	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
-			      SDW_SHIM_SYNC_SYNCCPU);
 	mutex_unlock(sdw->link_res->shim_lock);
 
-	if (ret < 0)
-		dev_err(sdw->cdns.dev, "Failed to set sync period: %d\n", ret);
-
 	return ret;
 }
 
@@ -393,21 +476,15 @@ static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 
 static int intel_link_power_down(struct sdw_intel *sdw)
 {
-	int link_control, spa_mask, cpa_mask, ret;
+	int link_control, spa_mask, cpa_mask;
 	unsigned int link_id = sdw->instance;
 	void __iomem *shim = sdw->link_res->shim;
-	u16 ioctl;
+	u32 *shim_mask = sdw->link_res->shim_mask;
+	int ret = 0;
 
 	mutex_lock(sdw->link_res->shim_lock);
 
-	/* Glue logic */
-	ioctl = intel_readw(shim, SDW_SHIM_IOCTL(link_id));
-	ioctl |= SDW_SHIM_IOCTL_BKE;
-	ioctl |= SDW_SHIM_IOCTL_COE;
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
-
-	ioctl &= ~(SDW_SHIM_IOCTL_MIF);
-	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+	intel_shim_master_ip_to_glue(sdw);
 
 	/* Link power down sequence */
 	link_control = intel_readl(shim, SDW_SHIM_LCTL);
@@ -416,6 +493,13 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 	link_control &=  spa_mask;
 
 	ret = intel_clear_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
+
+	if (!(*shim_mask & BIT(link_id)))
+		dev_err(sdw->cdns.dev,
+			"%s: Unbalanced power-up/down calls\n", __func__);
+
+	*shim_mask &= ~BIT(link_id);
+
 	mutex_unlock(sdw->link_res->shim_lock);
 
 	if (ret < 0)
@@ -1144,9 +1228,17 @@ static struct sdw_master_ops sdw_intel_ops = {
 
 static int intel_init(struct sdw_intel *sdw)
 {
+	bool clock_stop;
+
 	/* Initialize shim and controller */
 	intel_link_power_up(sdw);
-	intel_shim_init(sdw);
+
+	clock_stop = sdw_cdns_is_clock_stop(&sdw->cdns);
+
+	intel_shim_init(sdw, clock_stop);
+
+	if (clock_stop)
+		return 0;
 
 	return sdw_cdns_init(&sdw->cdns);
 }
-- 
2.20.1

