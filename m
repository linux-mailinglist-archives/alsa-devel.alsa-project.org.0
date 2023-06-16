Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B878732CCA
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B29B083B;
	Fri, 16 Jun 2023 12:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B29B083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686909845;
	bh=/SrPvf22NQSBPFIMA709/BzWKL29SuvAijCsgY836Cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W9SNZpS+hiBgv1pqHs1r/q9Sf5wB5WENFg0NKGc+l8FfyAI28yv3vbMlmXzdEjR86
	 arQ/Wpb+kn1AWON9/xRwd6lD5nH68zgsALX/PdGtKbhzfi9X+5VWxtHQjIdlpjhQUV
	 /zj72pB1P7DKNFN7UDVkioB3mFOhn1s4Cl8uhPPI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36832F805B1; Fri, 16 Jun 2023 12:01:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1570BF805B1;
	Fri, 16 Jun 2023 12:01:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62AC0F805BF; Fri, 16 Jun 2023 12:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BEB6F80558
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEB6F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jbUK6QV6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909683; x=1718445683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/SrPvf22NQSBPFIMA709/BzWKL29SuvAijCsgY836Cg=;
  b=jbUK6QV6L3wpue2++XmWCUMlc9rRvugy5V6MqkA2hXZAzoYoaKmRGbM2
   DxnjEsZ8d8ho0+MRrrh55igmMmfrenpoBRBL5BFRJKfpXMSJ8XmVXjMGy
   Y9t7CccgfUelmYLacorewPOY4dJVP6uGqpZOVwKBx1X55aEO6DJwXxK7X
   hHLOaG28QBfhS29sG4KdGxsXnZLz6JDt66gnZfDeZWTdPyFrAmj3KQo4d
   XMf/vUtDujSQ/xjxA7hMLT55txJGA0NhvLoZLGI1zZsHe4/VqJH7iXezT
   7CyJMb8Ow3VpQvAN320bLz7lOLUsLPiHLijk85eq7XcnIcdTw0UGd1lHE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362591711"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="362591711"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825689454"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="825689454"
Received: from kjaffe-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.114.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Paul Olaru <olarupaulstelian97@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 7/8] ASoC: SOF: pm: Remove duplicated code in sof_suspend
Date: Fri, 16 Jun 2023 12:00:38 +0200
Message-Id: <20230616100039.378150-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
References: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GBOZUC7IZLWIIJBHVFQ4IXBJMMRQQ3V3
X-Message-ID-Hash: GBOZUC7IZLWIIJBHVFQ4IXBJMMRQQ3V3
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBOZUC7IZLWIIJBHVFQ4IXBJMMRQQ3V3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Over time the function has changed and now there is no need to have the
duplicated sof_fw_trace_suspend() and sof_suspend_clients() in the
if (target_state == SOF_DSP_PM_D0) branch.

Remove it and add a simple check with a single goto statement.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <olarupaulstelian97@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 2b232442e84b..704b21413c71 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -234,20 +234,16 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	pm_state.event = target_state;
 
-	/* Skip to platform-specific suspend if DSP is entering D0 */
-	if (target_state == SOF_DSP_PM_D0) {
-		sof_fw_trace_suspend(sdev, pm_state);
-		/* Notify clients not managed by pm framework about core suspend */
-		sof_suspend_clients(sdev, pm_state);
-		goto suspend;
-	}
-
 	/* suspend DMA trace */
 	sof_fw_trace_suspend(sdev, pm_state);
 
 	/* Notify clients not managed by pm framework about core suspend */
 	sof_suspend_clients(sdev, pm_state);
 
+	/* Skip to platform-specific suspend if DSP is entering D0 */
+	if (target_state == SOF_DSP_PM_D0)
+		goto suspend;
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
 	/* cache debugfs contents during runtime suspend */
 	if (runtime_suspend)
-- 
2.37.2

