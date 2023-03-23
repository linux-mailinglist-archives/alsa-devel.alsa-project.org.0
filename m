Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B416C5EFC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:35:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7ADED1;
	Thu, 23 Mar 2023 06:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7ADED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549738;
	bh=aNL2KliVK/W0PGGaQa+13McnVurhskx2OOU+yOO7uSY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BFWm8WiqNAXSrBucVJ0ufjJHCNVuc7OhlF/I+C9i9hOjyT6NYJEp/vKKb39QBCkaY
	 scrz/nIFhq+VXsvGgw1wbDlheB0+JTJGhXjF/Qyz3B4UiYK38EWuRL6q/20iIW/W0H
	 LgeQmcwqGMXbZSJGsbNBy1eT3e4ap3s/Xta4EaDc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60DC2F8056F;
	Thu, 23 Mar 2023 06:32:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDD5FF80527; Thu, 23 Mar 2023 06:30:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C400CF8053B
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C400CF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BsZQB9SO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549427; x=1711085427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aNL2KliVK/W0PGGaQa+13McnVurhskx2OOU+yOO7uSY=;
  b=BsZQB9SOIi2/VHr5WxwK2lH3l+bRSMa985S8nuZwDyxImEGitJCuvrjv
   tsdfAjpH4dsV4K6S5kdB6SwSQtMRHkK6cx36OwlDiGa4xjdu2oZObeOE/
   qb4oCfgRiiS2R//NZTS2vjLy5v2P0vC1BUZLJQojC5h0mbZ9Qrac5EDBS
   whMIZCm9zpcx8aTgV3nRHjDYxe1KL5j38bCILzJ0NCl5JOHoDPPEi9eiu
   2ymCb6zFm8E7wMErT2byg0A0rcDdOCwVvPSm1i1SAg5yuaqMlhUigWRHc
   ZHwOiDJP3cMyo41jggLsUBfSZdWQGkSRySEpHtn+4qdS7gAqbfKwY8Lk+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779424"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779424"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567132"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567132"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 12/20] soundwire: intel_ace2x: set SYNCPRD before powering-up
Date: Thu, 23 Mar 2023 13:44:44 +0800
Message-Id: <20230323054452.1543233-13-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VLARTQMHJ64S5JJG4WEJKIPVZTOGXUI4
X-Message-ID-Hash: VLARTQMHJ64S5JJG4WEJKIPVZTOGXUI4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLARTQMHJ64S5JJG4WEJKIPVZTOGXUI4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The registers used for multi-link synchronization are no longer in the
SHIM but in the HDaudio multi-link capability space. Use helpers to
configure the SYNCPRD value, and wait for SYNCPU to change after
powering-up.

Note that the SYNCPRD value is shared between all sublinks, for
obvious reasons if those links are supposed to be synchronized. The
value of SYNCPRD is programmed only once for all sublinks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 42 +++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 5b6a608e63ba..01668246b7ba 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -17,17 +17,51 @@
 
 static int intel_link_power_up(struct sdw_intel *sdw)
 {
+	struct sdw_bus *bus = &sdw->cdns.bus;
+	struct sdw_master_prop *prop = &bus->prop;
+	u32 *shim_mask = sdw->link_res->shim_mask;
+	unsigned int link_id = sdw->instance;
+	u32 syncprd;
 	int ret;
 
 	mutex_lock(sdw->link_res->shim_lock);
 
-	ret = hdac_bus_eml_sdw_power_up_unlocked(sdw->link_res->hbus, sdw->instance);
+	if (!*shim_mask) {
+		/* we first need to program the SyncPRD/CPU registers */
+		dev_dbg(sdw->cdns.dev, "first link up, programming SYNCPRD\n");
+
+		if (prop->mclk_freq % 6000000)
+			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_38_4;
+		else
+			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24;
+
+		ret =  hdac_bus_eml_sdw_set_syncprd_unlocked(sdw->link_res->hbus, syncprd);
+		if (ret < 0) {
+			dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_set_syncprd failed: %d\n",
+				__func__, ret);
+			goto out;
+		}
+	}
+
+	ret = hdac_bus_eml_sdw_power_up_unlocked(sdw->link_res->hbus, link_id);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_up failed: %d\n",
 			__func__, ret);
 		goto out;
 	}
 
+	if (!*shim_mask) {
+		/* SYNCPU will change once link is active */
+		ret =  hdac_bus_eml_sdw_wait_syncpu_unlocked(sdw->link_res->hbus);
+		if (ret < 0) {
+			dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_wait_syncpu failed: %d\n",
+				__func__, ret);
+			goto out;
+		}
+	}
+
+	*shim_mask |= BIT(link_id);
+
 	sdw->cdns.link_up = true;
 out:
 	mutex_unlock(sdw->link_res->shim_lock);
@@ -37,13 +71,17 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 
 static int intel_link_power_down(struct sdw_intel *sdw)
 {
+	u32 *shim_mask = sdw->link_res->shim_mask;
+	unsigned int link_id = sdw->instance;
 	int ret;
 
 	mutex_lock(sdw->link_res->shim_lock);
 
 	sdw->cdns.link_up = false;
 
-	ret = hdac_bus_eml_sdw_power_down_unlocked(sdw->link_res->hbus, sdw->instance);
+	*shim_mask &= ~BIT(link_id);
+
+	ret = hdac_bus_eml_sdw_power_down_unlocked(sdw->link_res->hbus, link_id);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_down failed: %d\n",
 			__func__, ret);
-- 
2.25.1

