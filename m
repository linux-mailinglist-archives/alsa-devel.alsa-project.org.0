Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 098866C5F04
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:37:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 802DCEC5;
	Thu, 23 Mar 2023 06:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 802DCEC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549827;
	bh=zulnEGWCaE/ce7on2AHJOrEISXuutjX2aua9tmM2yVE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N9+3B58jpXAXmZrqo0jPlA3wWhYqOJOC2m0kBlEGxyYjrlejcvNwiqqI7Q+KesZXX
	 Mqd1w+ZiKvUtTXSpA5UgTDRW/s1I+Ign0BgAwZpLuCxAjYM9SX3uyNdZ3D1Odp0mn6
	 pUKyqTXU3JVDtN0o9K5kefErZ0sKxqIcQg8GRAmY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53080F805A9;
	Thu, 23 Mar 2023 06:33:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 898FDF804FE; Thu, 23 Mar 2023 06:31:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94CB4F80548
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94CB4F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=khf62RCG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549437; x=1711085437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zulnEGWCaE/ce7on2AHJOrEISXuutjX2aua9tmM2yVE=;
  b=khf62RCGSszGZFjzhh9Trkh6RI/TsHKTPey3jVzvmx/UutdnI8m/fsOz
   KyRM3uY1YQ6K78R9QxhuDqlaGcwDf/yu1bWMml36r5tqfWaSSyFxIxclH
   eeKdFz76OSh0N6xrdJJdcTr923KS4PdexMYFBy4jTIkuCHOqdtXaBEudZ
   2RmcvNysHVHyV+2FS6Gkpvu0Cf59yAtLAUEx43LFVtH71lJ7ooLIndBDU
   lGtZESPz+yZUStcmUnHuXwcrsJuuiU/VVIU+0xv27UNe4eycYFDv3DWmN
   8T3q4vrVO9xluHlZpWJXmt3VSqupMZxZFZn2nIiVEuQwmXDNRUhAHNHxG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779482"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779482"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567238"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567238"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 17/20] soundwire: intel_ace2x: enable wake support
Date: Thu, 23 Mar 2023 13:44:49 +0800
Message-Id: <20230323054452.1543233-18-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OWVRTNXUDPIKNANVOJZYEX6YV2CEXN57
X-Message-ID-Hash: OWVRTNXUDPIKNANVOJZYEX6YV2CEXN57
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OWVRTNXUDPIKNANVOJZYEX6YV2CEXN57/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The WAKEEN and WAKESTS registers were moved to the per-link SHIM_VS
area.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 2e33e8a00b55..fe950b3ea3bc 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -31,6 +31,41 @@ static void intel_shim_vs_init(struct sdw_intel *sdw)
 	usleep_range(10, 15);
 }
 
+static int intel_shim_check_wake(struct sdw_intel *sdw)
+{
+	void __iomem *shim_vs;
+	u16 wake_sts;
+
+	shim_vs = sdw->link_res->shim_vs;
+	wake_sts = intel_readw(shim_vs, SDW_SHIM2_INTEL_VS_WAKESTS);
+
+	return wake_sts & SDW_SHIM2_INTEL_VS_WAKEEN_PWS;
+}
+
+static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
+{
+	void __iomem *shim_vs = sdw->link_res->shim_vs;
+	u16 wake_en;
+	u16 wake_sts;
+
+	wake_en = intel_readw(shim_vs, SDW_SHIM2_INTEL_VS_WAKEEN);
+
+	if (wake_enable) {
+		/* Enable the wakeup */
+		wake_en |= SDW_SHIM2_INTEL_VS_WAKEEN_PWE;
+		intel_writew(shim_vs, SDW_SHIM2_INTEL_VS_WAKEEN, wake_en);
+	} else {
+		/* Disable the wake up interrupt */
+		wake_en &= ~SDW_SHIM2_INTEL_VS_WAKEEN_PWE;
+		intel_writew(shim_vs, SDW_SHIM2_INTEL_VS_WAKEEN, wake_en);
+
+		/* Clear wake status (W1C) */
+		wake_sts = intel_readw(shim_vs, SDW_SHIM2_INTEL_VS_WAKESTS);
+		wake_sts |= SDW_SHIM2_INTEL_VS_WAKEEN_PWS;
+		intel_writew(shim_vs, SDW_SHIM2_INTEL_VS_WAKESTS, wake_sts);
+	}
+}
+
 static int intel_link_power_up(struct sdw_intel *sdw)
 {
 	struct sdw_bus *bus = &sdw->cdns.bus;
@@ -325,6 +360,9 @@ const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 	.link_power_up = intel_link_power_up,
 	.link_power_down = intel_link_power_down,
 
+	.shim_check_wake = intel_shim_check_wake,
+	.shim_wake = intel_shim_wake,
+
 	.sync_arm = intel_sync_arm,
 	.sync_go_unlocked = intel_sync_go_unlocked,
 	.sync_go = intel_sync_go,
-- 
2.25.1

