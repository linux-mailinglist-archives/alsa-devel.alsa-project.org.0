Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A56517077FF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 04:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6307200;
	Thu, 18 May 2023 04:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6307200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684376537;
	bh=CGSJ6BYZ+N5oz7mWJkH8v8GmgIqzQ0Y1D731giuwafc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MMLBYRENozv5Kw5RGYWltVgoiO/gaGJX049ASqeYau/l8dw2EFzfoLitXf6d9LKlw
	 1HtcWIsfhVXPtNaIltvHx+7r4OwHRDx8fdx/bF0fYubxXdkNla+XoMYgULXQvGUtGq
	 c5BmxY/6HkrEbwho1uo7IsaezL8TtLlJUClZI5gQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ABB7F8055C; Thu, 18 May 2023 04:20:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AAF2F80542;
	Thu, 18 May 2023 04:20:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D556F80557; Thu, 18 May 2023 04:20:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E4F7F8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 04:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E4F7F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MpISvLYr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684376441; x=1715912441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CGSJ6BYZ+N5oz7mWJkH8v8GmgIqzQ0Y1D731giuwafc=;
  b=MpISvLYrGaaHw4eF68lBC1ySVTggLRi3VWQjUc1SNeaAsCvL2uE06h8m
   EO5iks8D4Pg3I6ML3vQEM0//AaTpnR5hPe9E0jgiBUc3/dqDDKaiJqa5h
   E7MyBlKGNLj1I0IYvoDtKdR1ajkViQ1ea17I3njPaPlDnZJhv9ltbjfp+
   BkLt21LD9ohVMvtcX5wYiweOSRRHhZKKfkgLbhx6n0aEBWMlBWWzGoqFg
   yR5bGv0AEc0syJKT/C6fVEii5YmODPEhFPhGynu+vwnlvlh2tRu3lt4Rk
   YhpsFpwlSRfvdWb0uo9a0T7ffAjV3g+/6GRImmqZB5QuDoUbQqDhhP2ZE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336504775"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="336504775"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="826195219"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="826195219"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:20:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/3] soundwire: intel/cadence: update hardware reset sequence
Date: Thu, 18 May 2023 10:41:18 +0800
Message-Id: <20230518024119.164160-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518024119.164160-1-yung-chuan.liao@linux.intel.com>
References: <20230518024119.164160-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RVXAIF26LBDHTJEDRMKAAPXIC2XUJGVG
X-Message-ID-Hash: RVXAIF26LBDHTJEDRMKAAPXIC2XUJGVG
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVXAIF26LBDHTJEDRMKAAPXIC2XUJGVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Combining hardware reset with the multi-link mode leads to a shortened
hardware reset pattern observed on the bus.

The updated hardware programming sequence is to first enable the clock
with the sync_arm/sync_go pattern, and only in a second step to issue
the hardware reset sequence. Since there is no longer a dependency
between sync_arm/sync_go and hw_reset, the behavior of
sdw_cdns_exit_reset() is changed to wait for the self-clearing
CONFIG_UPDATE to go back to zero,

Link: https://github.com/thesofproject/linux/issues/4170
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c   | 31 ++++++++++++++++++------
 drivers/soundwire/cadence_master.h   |  3 +++
 drivers/soundwire/intel_bus_common.c | 36 ++++++++++++++++++++--------
 3 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 39502bc75712..58686ae50bbf 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -283,6 +283,29 @@ static int cdns_config_update(struct sdw_cdns *cdns)
 	return ret;
 }
 
+/**
+ * sdw_cdns_config_update() - Update configurations
+ * @cdns: Cadence instance
+ */
+void sdw_cdns_config_update(struct sdw_cdns *cdns)
+{
+	/* commit changes */
+	cdns_writel(cdns, CDNS_MCP_CONFIG_UPDATE, CDNS_MCP_CONFIG_UPDATE_BIT);
+}
+EXPORT_SYMBOL(sdw_cdns_config_update);
+
+/**
+ * sdw_cdns_config_update_set_wait() - wait until configuration update bit is self-cleared
+ * @cdns: Cadence instance
+ */
+int sdw_cdns_config_update_set_wait(struct sdw_cdns *cdns)
+{
+	/* the hardware recommendation is to wait at least 300us */
+	return cdns_set_wait(cdns, CDNS_MCP_CONFIG_UPDATE,
+			     CDNS_MCP_CONFIG_UPDATE_BIT, 0);
+}
+EXPORT_SYMBOL(sdw_cdns_config_update_set_wait);
+
 /*
  * debugfs
  */
@@ -1116,13 +1139,7 @@ int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
 		     CDNS_MCP_CONTROL_HW_RST);
 
 	/* commit changes */
-	cdns_updatel(cdns, CDNS_MCP_CONFIG_UPDATE,
-		     CDNS_MCP_CONFIG_UPDATE_BIT,
-		     CDNS_MCP_CONFIG_UPDATE_BIT);
-
-	/* don't wait here */
-	return 0;
-
+	return cdns_config_update(cdns);
 }
 EXPORT_SYMBOL(sdw_cdns_exit_reset);
 
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 27c56274217f..8e328ba01c0a 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -197,4 +197,7 @@ int cdns_set_sdw_stream(struct snd_soc_dai *dai,
 void sdw_cdns_check_self_clearing_bits(struct sdw_cdns *cdns, const char *string,
 				       bool initial_delay, int reset_iterations);
 
+void sdw_cdns_config_update(struct sdw_cdns *cdns);
+int sdw_cdns_config_update_set_wait(struct sdw_cdns *cdns);
+
 #endif /* __SDW_CADENCE_H */
diff --git a/drivers/soundwire/intel_bus_common.c b/drivers/soundwire/intel_bus_common.c
index 901d4f5736c1..be0c93106fc8 100644
--- a/drivers/soundwire/intel_bus_common.c
+++ b/drivers/soundwire/intel_bus_common.c
@@ -29,11 +29,7 @@ int intel_start_bus(struct sdw_intel *sdw)
 		return ret;
 	}
 
-	ret = sdw_cdns_exit_reset(cdns);
-	if (ret < 0) {
-		dev_err(dev, "%s: unable to exit bus reset sequence: %d\n", __func__, ret);
-		return ret;
-	}
+	sdw_cdns_config_update(cdns);
 
 	if (bus->multi_link) {
 		ret = sdw_intel_sync_go(sdw);
@@ -43,6 +39,18 @@ int intel_start_bus(struct sdw_intel *sdw)
 		}
 	}
 
+	ret = sdw_cdns_config_update_set_wait(cdns);
+	if (ret < 0) {
+		dev_err(dev, "%s: CONFIG_UPDATE BIT still set\n", __func__);
+		return ret;
+	}
+
+	ret = sdw_cdns_exit_reset(cdns);
+	if (ret < 0) {
+		dev_err(dev, "%s: unable to exit bus reset sequence: %d\n", __func__, ret);
+		return ret;
+	}
+
 	ret = sdw_cdns_enable_interrupt(cdns, true);
 	if (ret < 0) {
 		dev_err(dev, "%s: cannot enable interrupts: %d\n", __func__, ret);
@@ -112,11 +120,7 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw)
 	}
 
 	if (!clock_stop0) {
-		ret = sdw_cdns_exit_reset(cdns);
-		if (ret < 0) {
-			dev_err(dev, "unable to exit bus reset sequence during resume\n");
-			return ret;
-		}
+		sdw_cdns_config_update(cdns);
 
 		if (bus->multi_link) {
 			ret = sdw_intel_sync_go(sdw);
@@ -126,6 +130,18 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw)
 			}
 		}
 
+		ret = sdw_cdns_config_update_set_wait(cdns);
+		if (ret < 0) {
+			dev_err(dev, "%s: CONFIG_UPDATE BIT still set\n", __func__);
+			return ret;
+		}
+
+		ret = sdw_cdns_exit_reset(cdns);
+		if (ret < 0) {
+			dev_err(dev, "unable to exit bus reset sequence during resume\n");
+			return ret;
+		}
+
 		ret = sdw_cdns_enable_interrupt(cdns, true);
 		if (ret < 0) {
 			dev_err(dev, "cannot enable interrupts during resume\n");
-- 
2.25.1

