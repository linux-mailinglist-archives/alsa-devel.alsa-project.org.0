Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D77702574
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EAD982C;
	Mon, 15 May 2023 08:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EAD982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133644;
	bh=zfPDFAUHD0yEFTAl6FmNYsvKI40bPenFTeUs36GSzIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j4v1o4P1glgvt0GupebkafKO3b64XmedNvDcqoEiYsPevndviCwBvblm60riPkwmG
	 YOjMp8jovLjCYFR5ejXNJyje6GV02EQSs+zXkOPQHKzPL1KZzU0vIyVb9QZr2KR0N5
	 UATUkK/5XwzcK00CzSpU7ZTc/rlxNj2IJmSrqQO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91148F805E1; Mon, 15 May 2023 08:51:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF9ADF805DA;
	Mon, 15 May 2023 08:51:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B931F805A0; Mon, 15 May 2023 08:50:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08FB0F805A0
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FB0F805A0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mPfbjfhR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133449; x=1715669449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfPDFAUHD0yEFTAl6FmNYsvKI40bPenFTeUs36GSzIY=;
  b=mPfbjfhREhi2QhwXGFsDCYYbEnQD7TiTnXKwnfwmK+3VxvT6hg+xmBNJ
   IHJZqohxWZWwffohI+qA7gpM/phaR3kQxX4nkx/Km23fTiX3TfyWcEyfd
   ry+ry4uPHeXNO6mmKKajzJFxAZbUu1IDwORTMJIhfb3gSty5OxkMGVumn
   e+7YIMHr5EbJgRzgrwrdO6hUfX+LuDVAfk5Wc43j6bO+QcQMTYgpMzuNJ
   jmR1Usmc6OWlFLrc2nF58ingEYu8BgFjbKWtFLB6xb1QCPv6/TAF2SJ06
   i1AsXP7egsZ1x/WxsqbnVXVAIfeNB3NseWMd7mOu9VhaiJalLID6tOktw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966380"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966380"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908697"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908697"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 11/26] soundwire: intel_ace2x: add link power-up/down
 helpers
Date: Mon, 15 May 2023 15:10:27 +0800
Message-Id: <20230515071042.2038-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6U3MHJROYYZSPLWINQ2TZYO65DB3EXK
X-Message-ID-Hash: Q6U3MHJROYYZSPLWINQ2TZYO65DB3EXK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6U3MHJROYYZSPLWINQ2TZYO65DB3EXK/>
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

