Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F522293BB
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:39:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB4815F2;
	Wed, 22 Jul 2020 10:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB4815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595407143;
	bh=crG3iBgofSKt1/ApPYE14LBa3J06qvWgW/LEYJcMZCA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DaRhGrIk1XoEpnPCgD7CDieFj9BOElsN2K3v2Rlrhln/jioCzQgs1MIgSoQ2pSmeM
	 QZPJluZK2LlSBtmZ9aWH1TyrZs8lAzh+W93e9zwpJ5bMRB8EwNu3HtocR0BaeeYVdx
	 uUv5c0oYokBOEGU5XL9z3txOUQAaFu+CIYeyg5Ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B24F8032A;
	Wed, 22 Jul 2020 10:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3398F8032A; Wed, 22 Jul 2020 10:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED260F80321
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED260F80321
IronPort-SDR: epyf9LOYU8PKLV3f5MxdrlvEuutWxKDmpqXhSphdTBktyZ351kmM3xC3Qt/YuA4wSSCn7eZbek
 UCstXPws03ZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="214930970"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="214930970"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:24 -0700
IronPort-SDR: e4NQk+wdFHP7m7aQaEA641O/lNMqGfP3punzwxUF9ZnJYbirtmEy/LaS8Hwp2LOwHXiQpJ4VLl
 SYv39qO0Vymg==
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="432303362"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 09/13] soundwire: intel: add CLK_STOP_BUS_RESET support
Date: Wed, 22 Jul 2020 04:37:19 +0800
Message-Id: <20200721203723.18305-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

Move existing pm_runtime suspend under the CLK_STOP_TEARDOWN case.

In this mode the Master IP will lose all context but in-band wakes are
supported.

On pm_runtime resume a complete re-enumeration will be performed after
a bus reset.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 1954eb48b86c..744fc0a4816a 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1576,6 +1576,26 @@ static int intel_suspend_runtime(struct device *dev)
 
 		intel_shim_wake(sdw, false);
 
+	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
+		ret = sdw_cdns_clock_stop(cdns, true);
+		if (ret < 0) {
+			dev_err(dev, "cannot enable clock stop on suspend\n");
+			return ret;
+		}
+
+		ret = sdw_cdns_enable_interrupt(cdns, false);
+		if (ret < 0) {
+			dev_err(dev, "cannot disable interrupts on suspend\n");
+			return ret;
+		}
+
+		ret = intel_link_power_down(sdw);
+		if (ret) {
+			dev_err(dev, "Link power down failed: %d", ret);
+			return ret;
+		}
+
+		intel_shim_wake(sdw, true);
 	} else {
 		dev_err(dev, "%s clock_stop_quirks %x unsupported\n",
 			__func__, clock_stop_quirks);
@@ -1694,6 +1714,30 @@ static int intel_resume_runtime(struct device *dev)
 			dev_err(dev, "unable to exit bus reset sequence during resume\n");
 			return ret;
 		}
+	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
+		ret = intel_init(sdw);
+		if (ret) {
+			dev_err(dev, "%s failed: %d", __func__, ret);
+			return ret;
+		}
+
+		/*
+		 * make sure all Slaves are tagged as UNATTACHED and
+		 * provide reason for reinitialization
+		 */
+		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
+
+		ret = sdw_cdns_enable_interrupt(cdns, true);
+		if (ret < 0) {
+			dev_err(dev, "cannot enable interrupts during resume\n");
+			return ret;
+		}
+
+		ret = sdw_cdns_clock_restart(cdns, true);
+		if (ret < 0) {
+			dev_err(dev, "unable to restart clock during resume\n");
+			return ret;
+		}
 	} else {
 		dev_err(dev, "%s clock_stop_quirks %x unsupported\n",
 			__func__, clock_stop_quirks);
-- 
2.17.1

