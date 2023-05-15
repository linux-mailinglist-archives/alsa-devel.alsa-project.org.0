Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA6A70257C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2027D1EC;
	Mon, 15 May 2023 08:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2027D1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133724;
	bh=q80CBcxn2QOQK8sFpcJ2zT5Gn5sp4JMMdHxIOJazfZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XxaWwOTY83fD3VCDbTkNb4MDxsbemj5x1iVLee5WIbhv7aaGhWtLHqkm6osfTnr2a
	 +RaH+lGoCY1F9si7vnuew1xWtDD2LVUkt99M6KSO84QwbJmCP25+dynNY5soNXf2p9
	 gU4i+24ayGqjfN1fdYZY+NcdV0WSjZ1/A8SfIrvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 675C0F8060A; Mon, 15 May 2023 08:51:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C04C1F80609;
	Mon, 15 May 2023 08:51:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 865D6F805E6; Mon, 15 May 2023 08:51:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4BB9F80272
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4BB9F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KRc9/OEX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133462; x=1715669462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q80CBcxn2QOQK8sFpcJ2zT5Gn5sp4JMMdHxIOJazfZ4=;
  b=KRc9/OEXUVPybQJ+yU07+5/5V+44POMI700rEu7hpiajWeQAt0czMG0S
   E7RkrteswCNLLp0CGdyZskhkTyIYHjWMX2S9cIMcKg4DQeDsdGTHcTZ66
   e0qsPUt3Lf7gsY3uNo2RNuT7QCI1UvY4ewp4PPHAPcX8F8f+bf8dLe+Uu
   b10QTGVasbNAnwmaljz4dOqHyJlXpyQ78f0ePL19Fj2vuI+on9QRvQyl/
   9KO6sf1ATPOhTV9wrdxR8yVNg7nV0151lv8EG2AJhty6ZzcJfgt/zuMf8
   +tYc6LSgd68okb4CZm1NksyS7vKTJik9UeWc0FRDGhuBUZRaSr6DNe57Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966461"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966461"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908742"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908742"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 16/26] soundwire: intel_ace2x: use common helpers for bus
 start/stop
Date: Mon, 15 May 2023 15:10:32 +0800
Message-Id: <20230515071042.2038-17-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IWBW4UM7IRU7CSFT4XAS3KJU6FNEBA5A
X-Message-ID-Hash: IWBW4UM7IRU7CSFT4XAS3KJU6FNEBA5A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWBW4UM7IRU7CSFT4XAS3KJU6FNEBA5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The sequences are so far identical, so the abstraction is a bit
over-engineered. In time we will simplify if there is no need to
special case or work-around programming sequences.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 20b8806f7de6..2e33e8a00b55 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -316,6 +316,12 @@ const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 
 	.register_dai = intel_register_dai,
 
+	.check_clock_stop = intel_check_clock_stop,
+	.start_bus = intel_start_bus,
+	.start_bus_after_reset = intel_start_bus_after_reset,
+	.start_bus_after_clock_stop = intel_start_bus_after_clock_stop,
+	.stop_bus = intel_stop_bus,
+
 	.link_power_up = intel_link_power_up,
 	.link_power_down = intel_link_power_down,
 
-- 
2.25.1

