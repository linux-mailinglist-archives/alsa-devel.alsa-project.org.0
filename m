Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2118F6C5EFA
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:35:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B101EDE;
	Thu, 23 Mar 2023 06:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B101EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549712;
	bh=yWd/ohEBxlz+ikb3Ien04/YoMLYTHRZPHh64E+lRlNo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oXR2juTd0STDB5/x3B59wVl5Vv+WqvEounpHNho5TJdzS7X/EUq4/yzVhLqQldQWZ
	 KsAKRo4nQgeZxDoxwWZZxrZi0FL21A2WK0pNjynqbvo6FVDiwiuBaXyGhEgZTJI/S6
	 Iuum1iNfMX71h2FndTFZqojbNNpT/AcVk3sXDEJ0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89AFAF80551;
	Thu, 23 Mar 2023 06:32:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBF9AF80552; Thu, 23 Mar 2023 06:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03804F804FE
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03804F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n0UnNwIu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549422; x=1711085422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yWd/ohEBxlz+ikb3Ien04/YoMLYTHRZPHh64E+lRlNo=;
  b=n0UnNwIuuO5nWdXszwaAKc8uqJJv9a8DLHAw3+GbUmNQBaaOdf1q+DN/
   PvILGpZvoSLTV85fkOgbMgO9zDJh8OmkcrEo0T9CrmbY3BCAlT4gmbu/v
   xVrLs5UO8//HsyN+lzFamxDC8hza/MJhePmMECHDhCEmqb3cQoaHTxkWC
   l1FOjv81M1NS1JfK5qlceOOihMlN3ULzI1ks2/tJOYW6uxxVrfEiXiB7Q
   ktPhWsqx15s7TcYcGVlCRkXsAejK88+XF3qCdKDrKutjyUGN71E2xt0D+
   AfeRwKcrVZv5AsPq5hGFFmRsz/tbAh0m3BUf9w+1q7AP5+gOTjps4kmrM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779336"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779336"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567025"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567025"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 06/20] ASoC/soundwire: intel: pass hdac_bus pointer for link
 management
Date: Thu, 23 Mar 2023 13:44:38 +0800
Message-Id: <20230323054452.1543233-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VB2ACAHWO2TKPCFKWZUZ7TK6XQIGYYB5
X-Message-ID-Hash: VB2ACAHWO2TKPCFKWZUZ7TK6XQIGYYB5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VB2ACAHWO2TKPCFKWZUZ7TK6XQIGYYB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The hdac_bus pointer is used to access the extended link information
and handle power management. Pass it from the SOF driver down to the
auxiliary devices.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.h           | 4 ++++
 drivers/soundwire/intel_init.c      | 2 ++
 include/linux/soundwire/sdw_intel.h | 4 ++++
 sound/soc/sof/intel/hda.c           | 1 +
 4 files changed, 11 insertions(+)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 1b23292bb8be..cf9db4906de4 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -4,6 +4,8 @@
 #ifndef __SDW_INTEL_LOCAL_H
 #define __SDW_INTEL_LOCAL_H
 
+struct hdac_bus;
+
 /**
  * struct sdw_intel_link_res - Soundwire Intel link resource structure,
  * typically populated by the controller driver.
@@ -23,6 +25,7 @@
  * @link_mask: global mask needed for power-up/down sequences
  * @cdns: Cadence master descriptor
  * @list: used to walk-through all masters exposed by the same controller
+ * @hbus: hdac_bus pointer, needed for power management
  */
 struct sdw_intel_link_res {
 	const struct sdw_intel_hw_ops *hw_ops;
@@ -42,6 +45,7 @@ struct sdw_intel_link_res {
 	u32 link_mask;
 	struct sdw_cdns *cdns;
 	struct list_head list;
+	struct hdac_bus *hbus;
 };
 
 struct sdw_intel {
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 43d339c6bcee..c918d2b81cc3 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -84,6 +84,8 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 	link->shim_mask = &ctx->shim_mask;
 	link->link_mask = ctx->link_mask;
 
+	link->hbus = res->hbus;
+
 	/* now follow the two-step init/add sequence */
 	ret = auxiliary_device_init(auxdev);
 	if (ret < 0) {
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 88eb5bf98140..c4281aa06e2e 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -269,6 +269,8 @@ struct sdw_intel_slave_id {
 	struct sdw_slave_id id;
 };
 
+struct hdac_bus;
+
 /**
  * struct sdw_intel_ctx - context allocated by the controller
  * driver probe
@@ -324,6 +326,7 @@ struct sdw_intel_ctx {
  * @shim_base: sdw shim base.
  * @alh_base: sdw alh base.
  * @ext: extended HDaudio link support
+ * @hbus: hdac_bus pointer, needed for power management
  */
 struct sdw_intel_res {
 	const struct sdw_intel_hw_ops *hw_ops;
@@ -339,6 +342,7 @@ struct sdw_intel_res {
 	u32 shim_base;
 	u32 alh_base;
 	bool ext;
+	struct hdac_bus *hbus;
 };
 
 /*
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index db103524be4f..22eba57bb3e6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -229,6 +229,7 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 	res.ops = &sdw_callback;
 	res.dev = sdev->dev;
 	res.clock_stop_quirks = sdw_clock_stop_quirks;
+	res.hbus = sof_to_bus(sdev);
 
 	/*
 	 * ops and arg fields are not populated for now,
-- 
2.25.1

