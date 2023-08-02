Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B27476D235
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:38:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D13414E;
	Wed,  2 Aug 2023 17:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D13414E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990680;
	bh=EZyCgKdSR3540GKvUB7qA9zXSwTteYue0NtQh+qrIgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kolDTL0wedn0UA3oDQbRoQjy56QHNsPel/+2jhDL+3E7/iOhQqfe4M1nSzMJSFFz6
	 3Con8iESdUJbVy78ZdyGfT5C98nJRmUNJqPrFjgN56Ejo/8l1KyXooS/izaSqTwUxk
	 0TA8zg/O/d9ncLGra151lj5AS+KGIpteUPe2mrjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1D53F80552; Wed,  2 Aug 2023 17:37:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72DA8F80558;
	Wed,  2 Aug 2023 17:37:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D594F80553; Wed,  2 Aug 2023 17:37:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AD76F8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AD76F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=igfJ3W/c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990617; x=1722526617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EZyCgKdSR3540GKvUB7qA9zXSwTteYue0NtQh+qrIgw=;
  b=igfJ3W/c6d6GAPlpX6kgF0070S25ZCNDewMC50t+3mL4zc1KfP/9QQgI
   xKuegZVAIS9r066jraO0RSP4lW9OJkdBYkTWvxmFjrI2zkYKumXDGodfE
   Uhc9jLA82qNbixOv3oUMSoAaucc/2TDROn8UqOI97dIEpyDvvuU/FfyB1
   q0K9BDYRY1WLiymyAHjTmmSgpbC8NxM3FKRnbQoRF0Wsx3QoXjN1kYY5B
   I2kG0W1PnPLFuTHgNuqkUKLl5YFCMq5tI7ah9HmM9+YsYx0gl8XOoj7EI
   Y6Pm040DDoDV9K503liJbAy96n+lPnvSSlRbcNnjgWgX6341cdqhKabKm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350750"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350750"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722886953"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722886953"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 03/16] ASoC: rt5682-sdw: make regmap cache-only in probe
Date: Wed,  2 Aug 2023 10:36:16 -0500
Message-Id: <20230802153629.53576-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YE2ZLWZ3MPR4U4QRFV25THXIDNSWM2BG
X-Message-ID-Hash: YE2ZLWZ3MPR4U4QRFV25THXIDNSWM2BG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YE2ZLWZ3MPR4U4QRFV25THXIDNSWM2BG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The RT5682 needs specific attention: there are two regmap in
rt5682_priv struct, one is sdw_regmap which is for IO transfer, and
the other is used for registers control.

We need to set both regmaps when we set cache only. Because if we set
rt5682->sdw_regmap only, rt5682->regmap won't set/get the right value
when it call regmap_write/read(rt5682->sdw_regmap, ...). If we set
rt5682->regmap only, regmap_write(rt5682->sdw_regmap, ...) is used
in rt5682_clock_config which will be called by the ..bus_config ops.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 7d53dd62ce17..6726458cf329 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -322,6 +322,9 @@ static int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+	regcache_cache_only(rt5682->sdw_regmap, true);
+	regcache_cache_only(rt5682->regmap, true);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -352,6 +355,11 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt5682->hw_init)
 		return 0;
 
+	regcache_cache_only(rt5682->sdw_regmap, false);
+	regcache_cache_only(rt5682->regmap, false);
+	if (rt5682->first_hw_init)
+		regcache_cache_bypass(rt5682->regmap, true);
+
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
 	 */
@@ -371,11 +379,6 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
-	if (rt5682->first_hw_init) {
-		regcache_cache_only(rt5682->regmap, false);
-		regcache_cache_bypass(rt5682->regmap, true);
-	}
-
 	while (loop > 0) {
 		regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
 		if (val == DEVICE_ID)
@@ -705,6 +708,7 @@ static int __maybe_unused rt5682_dev_suspend(struct device *dev)
 
 	cancel_delayed_work_sync(&rt5682->jack_detect_work);
 
+	regcache_cache_only(rt5682->sdw_regmap, true);
 	regcache_cache_only(rt5682->regmap, true);
 	regcache_mark_dirty(rt5682->regmap);
 
@@ -769,6 +773,7 @@ static int __maybe_unused rt5682_dev_resume(struct device *dev)
 
 regmap_sync:
 	slave->unattach_request = 0;
+	regcache_cache_only(rt5682->sdw_regmap, false);
 	regcache_cache_only(rt5682->regmap, false);
 	regcache_sync(rt5682->regmap);
 
-- 
2.39.2

