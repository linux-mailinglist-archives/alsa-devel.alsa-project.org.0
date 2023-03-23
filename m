Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C786C5EFD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:35:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E942EE6;
	Thu, 23 Mar 2023 06:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E942EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549744;
	bh=zfPDFAUHD0yEFTAl6FmNYsvKI40bPenFTeUs36GSzIY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uqWt8KumpCt1ntYHbbHLqemClQhv/SPbM0LZyci5ZMxhBFqerqUcLNqMAIubTjP4G
	 0Mx+e2dhF4PP25LuUNdQIXCMBl1rxSPv1Rt9xfqLYxVXMlvHxZF+A9DVhlmtBYat0R
	 NTP61yMi2dAsHaef3uuIEsUjlNuoFV6tUEjNv+9w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2C3DF80563;
	Thu, 23 Mar 2023 06:32:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F7C9F8052E; Thu, 23 Mar 2023 06:30:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9413DF80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9413DF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XxALgGX7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549426; x=1711085426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfPDFAUHD0yEFTAl6FmNYsvKI40bPenFTeUs36GSzIY=;
  b=XxALgGX7SEmjID1HGr2Ndus3d80YaqLybJfdTtkXg3VU7tYf8f5+5A9w
   F+0o71/ylESRpzN1Is8/7eejRoJ2qNOGsGR1zdA0Mnlyf41LsxuG1CIRT
   QVh87rffX5SfcjwRkc22UzFI7aPGX5XvHj916AbIK6Am8gy/2nsN1GMIN
   xfkjaHV5hV4llWKG6UpLk0w2Ltd4oDpVCMdJr8YEWZkOTvXyc7mOmBFQT
   WTLRZSwTk538A+SebSYIzsOK0aXuMQ+ZfszDzHLG7yOwjNh1JVkhzoCGM
   bEZ3IfAw6B/6Ju0v7wdWLyYuwAgb7AyEjWGAFmdHKNf3BpTDzs6nEdGEj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779410"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779410"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567117"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567117"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 11/20] soundwire: intel_ace2x: add link power-up/down helpers
Date: Thu, 23 Mar 2023 13:44:43 +0800
Message-Id: <20230323054452.1543233-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OY75RKOWOT4WG7CFJRGU577QOBGZCFAG
X-Message-ID-Hash: OY75RKOWOT4WG7CFJRGU577QOBGZCFAG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OY75RKOWOT4WG7CFJRGU577QOBGZCFAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

only power-up/down for now, the frequency is not set.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 50 +++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 1c47bb2adb93..5b6a608e63ba 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -10,12 +10,62 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
+#include <sound/hda-mlink.h>
 #include "cadence_master.h"
 #include "bus.h"
 #include "intel.h"
 
+static int intel_link_power_up(struct sdw_intel *sdw)
+{
+	int ret;
+
+	mutex_lock(sdw->link_res->shim_lock);
+
+	ret = hdac_bus_eml_sdw_power_up_unlocked(sdw->link_res->hbus, sdw->instance);
+	if (ret < 0) {
+		dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_up failed: %d\n",
+			__func__, ret);
+		goto out;
+	}
+
+	sdw->cdns.link_up = true;
+out:
+	mutex_unlock(sdw->link_res->shim_lock);
+
+	return ret;
+}
+
+static int intel_link_power_down(struct sdw_intel *sdw)
+{
+	int ret;
+
+	mutex_lock(sdw->link_res->shim_lock);
+
+	sdw->cdns.link_up = false;
+
+	ret = hdac_bus_eml_sdw_power_down_unlocked(sdw->link_res->hbus, sdw->instance);
+	if (ret < 0) {
+		dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_down failed: %d\n",
+			__func__, ret);
+
+		/*
+		 * we leave the sdw->cdns.link_up flag as false since we've disabled
+		 * the link at this point and cannot handle interrupts any longer.
+		 */
+	}
+
+	mutex_unlock(sdw->link_res->shim_lock);
+
+	return ret;
+}
+
 const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 	.debugfs_init = intel_ace2x_debugfs_init,
 	.debugfs_exit = intel_ace2x_debugfs_exit,
+
+	.link_power_up = intel_link_power_up,
+	.link_power_down = intel_link_power_down,
 };
 EXPORT_SYMBOL_NS(sdw_intel_lnl_hw_ops, SOUNDWIRE_INTEL);
+
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
-- 
2.25.1

