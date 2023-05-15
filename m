Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2626270256D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA9F86E;
	Mon, 15 May 2023 08:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA9F86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133595;
	bh=aAq1nEu0w9jquwDbM8Ql9Dgc92dfowXErHtU9iHqtg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bQPxPZ3JS6lkOnZZizcQTuzUFzp/rmgTWWLs5N83Ipsn47+54WggPK1UHEpTTCRoU
	 5o5qthP/P6f2oY3yF/ELISrWMBGZJ4f/ZRLzUkZ6MU7xnWEyANt63pLd6fyFTJlzRn
	 tOFDf5IE9uH/Wwd5RfGxlqSzVywrxDT8pJiA9Juw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D996F805B1; Mon, 15 May 2023 08:50:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EFEF805B1;
	Mon, 15 May 2023 08:50:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CF89F805A0; Mon, 15 May 2023 08:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2EAFF80431
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2EAFF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fKy10Txs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133439; x=1715669439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aAq1nEu0w9jquwDbM8Ql9Dgc92dfowXErHtU9iHqtg8=;
  b=fKy10TxsxDjk69hi2vah+GFJaHoYp1MO6i+ZcGI752UfE2nRvm4y/b75
   9FzbrKf4SfdmwhlIbJaUP3ABbTfU9lbwiVga04R15pd5e/RdTjJvC0UhH
   kyhkkA8xNEsZLX3VhxoQjnah3y+zk1k1i1+3fqsTyFBHzCJuzMoaeOcmM
   0ah8lPLREJrRCvCvepI0ntACob9pwyVZ3LlfUjYiZ1m4sDTEpmWsvzDZR
   47LFueI6mIP7r2sX0GE5aTjqWmQuezMxpKbJlBHRXqF1OAIAZIAdlXfjg
   L9c0TZHvpmSE1zJ+o6YR5rUEP4XpRQcvNUQsiKUmWyXtXDFOJgkVrk7CY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966323"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966323"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908635"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908635"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:33 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 06/26] ASoC/soundwire: intel: pass hdac_bus pointer for
 link management
Date: Mon, 15 May 2023 15:10:22 +0800
Message-Id: <20230515071042.2038-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FPKNA243XDK6NT5PNLMHNBZBKQECWMF4
X-Message-ID-Hash: FPKNA243XDK6NT5PNLMHNBZBKQECWMF4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPKNA243XDK6NT5PNLMHNBZBKQECWMF4/>
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
Acked-by: Mark Brown <broonie@kernel.org>
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
index 793baf60c78b..4d48f4018617 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -189,6 +189,7 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 	res.ops = &sdw_callback;
 	res.dev = sdev->dev;
 	res.clock_stop_quirks = sdw_clock_stop_quirks;
+	res.hbus = sof_to_bus(sdev);
 
 	/*
 	 * ops and arg fields are not populated for now,
-- 
2.25.1

