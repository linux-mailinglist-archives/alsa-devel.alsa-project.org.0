Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A57C26C5EFE
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:36:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED73DEC9;
	Thu, 23 Mar 2023 06:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED73DEC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549768;
	bh=kjKTx32w9YdnZJ7K83qEoOALY8hrbkCtcZcfoAY0U2Q=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P54bIXPUczLsFEkNI0wtzfIZA/cHvKYqO4wAz/3/eaJRMFDjEGQL/3EPkQJIQTd8y
	 r4Q7eM6Sy+2C97XMhPgrOYD6zkhbVKlOkg1dgqxOaqq3gPMh3RiToS3cIp83O2lKTz
	 8IcweWl7Whpnm1U67a7/XJ9e0q9epiXy+WjB12Zc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F66FF80579;
	Thu, 23 Mar 2023 06:33:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0945F8052E; Thu, 23 Mar 2023 06:31:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 336BAF8053D
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 336BAF8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S30YqFmA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549427; x=1711085427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kjKTx32w9YdnZJ7K83qEoOALY8hrbkCtcZcfoAY0U2Q=;
  b=S30YqFmA5qwYSwccvxBicIiSa+Wtr4r+fc+lDTPBjKIwMxIF7GcolVb7
   XebLz00iWtk92KbadOvZ5EBddno47cx0TirbjLkFNeNMz57HAPzyc0hJt
   +x3J9g4Y2xY2DmuvYPkqNELren6JJzNVugb9/4q3R6BX/vrNbhki2RVbH
   6wVkf1OWd+xai0E3GHDVxdD54ginQFfyQPHeM52Pa6xMRyASCEcDq/3Ix
   J2N5p+md3GNFh34s35AoyIGXBJXh2NMccCclY4cEd3ZWycE8tAa1uOPXa
   k9dP45N1k0nHm5XQ9g2OGZbpCAraYNlB1d0Tjxieq/7SLEMEWOJbT4/oB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779436"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779436"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567149"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567149"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 13/20] soundwire: intel_ace2x: configure link PHY
Date: Thu, 23 Mar 2023 13:44:45 +0800
Message-Id: <20230323054452.1543233-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DRFIZT46KLZAJ7IH5RXXJYDRI7OGUBZZ
X-Message-ID-Hash: DRFIZT46KLZAJ7IH5RXXJYDRI7OGUBZZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRFIZT46KLZAJ7IH5RXXJYDRI7OGUBZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Unlike previous hardware generations, the glue-to-master transition is
not managed by software, instead the transitions are managed as part
of the power-up/down sequences controlled by SPA/CPA bits.

The only thing that's required is to configure the link PHY for
'normal' operation instead of the PHY test mode.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 01668246b7ba..5deff32976f1 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -15,6 +15,22 @@
 #include "bus.h"
 #include "intel.h"
 
+/*
+ * shim vendor-specific (vs) ops
+ */
+
+static void intel_shim_vs_init(struct sdw_intel *sdw)
+{
+	void __iomem *shim_vs = sdw->link_res->shim_vs;
+	u16 act = 0;
+
+	u16p_replace_bits(&act, 0x1, SDW_SHIM2_INTEL_VS_ACTMCTL_DOAIS);
+	act |= SDW_SHIM2_INTEL_VS_ACTMCTL_DACTQE;
+	act |=  SDW_SHIM2_INTEL_VS_ACTMCTL_DODS;
+	intel_writew(shim_vs, SDW_SHIM2_INTEL_VS_ACTMCTL, act);
+	usleep_range(10, 15);
+}
+
 static int intel_link_power_up(struct sdw_intel *sdw)
 {
 	struct sdw_bus *bus = &sdw->cdns.bus;
@@ -63,6 +79,9 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 	*shim_mask |= BIT(link_id);
 
 	sdw->cdns.link_up = true;
+
+	intel_shim_vs_init(sdw);
+
 out:
 	mutex_unlock(sdw->link_res->shim_lock);
 
-- 
2.25.1

