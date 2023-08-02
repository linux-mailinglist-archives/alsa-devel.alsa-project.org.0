Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9D76D24F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:41:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4CFF827;
	Wed,  2 Aug 2023 17:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4CFF827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990879;
	bh=Dkdk1gWK1nvzm65LaLxZFcZrOjkvrCxPPcuYGcazTYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rRcR4F2CUmo9OyfxVyKZ4jIj86RP4mHe6Ls/fj5gdQxjxLjg61zZ1vY8Fu6Px3nS7
	 f5KkWuLsju8V9K6YteHxeA+oCp+lqjGwkpvUyAA9lzvEw6R6TIfnvLkGyZ0aiOZ2nH
	 IlqngGKojmqOSnXtvg97+wtzgNRaIJ0wDW8DRCcM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDF99F805F8; Wed,  2 Aug 2023 17:37:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4718F805F1;
	Wed,  2 Aug 2023 17:37:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76E10F805BA; Wed,  2 Aug 2023 17:37:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F3E5F8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F3E5F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FFLXlGns
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990625; x=1722526625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dkdk1gWK1nvzm65LaLxZFcZrOjkvrCxPPcuYGcazTYA=;
  b=FFLXlGns3nepmNEkya78t0IO5YpyZOtstALZ/s5ZZMxC8+q4Ep0irCKC
   VUFtwXXRMyNQKCEQaJLd6gs2+hHnlyyPBFfdflMsvy/htPolOlRmgsKXF
   DxobzX+/zKtAm5cbFpOQc5gd8LQJVjPHf921PRb8+aq75kwWwrF1UHC+F
   6CsMSZvKeLQ9oIg+D05TkvGXqRuoUYNeWj3FUvNJBQursuTggktZgs6xS
   4cDwa0Ii+AGS3puw0zqdIbSdUe1ju6DGhPRqn0G33w2BcAbUzxedGgq58
   AVX40RUjgARi2SWzhgDPEfnUv5Oo9EV2NvWpY9AsQXqtgLr4tR48FjDYL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350855"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887215"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887215"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 13/16] ASoC: rt1318-sdw: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:26 -0500
Message-Id: <20230802153629.53576-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MLRMV7XWPCOUQ4VG7AJE2K3UQCUZXJRS
X-Message-ID-Hash: MLRMV7XWPCOUQ4VG7AJE2K3UQCUZXJRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLRMV7XWPCOUQ4VG7AJE2K3UQCUZXJRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch suggests enabling pm_runtime during the probe, but marking the
device as 'active' only after it is enumerated. That will force a
dependency between the card and the codec, pm_runtime_get_sync() will
have to wait for the codec device to resume and hence implicitly wait
for the enumeration/initialization to be completed. In the nominal
case where the codec device is already active the get_sync() would
only perform a ref-count increase.

The changes are directly inspired by RT711 and RT711-sdca changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt1318-sdw.c | 39 +++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index d7803342f5c2..ff364bde4a08 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -413,20 +413,10 @@ static int rt1318_io_init(struct device *dev, struct sdw_slave *slave)
 		regcache_cache_bypass(rt1318->regmap, true);
 	} else {
 		/*
-		 * PM runtime is only enabled when a Slave reports as Attached
+		 * PM runtime status is marked as 'active' only when a Slave reports as Attached
 		 */
-
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
-
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
 	}
 
 	pm_runtime_get_noresume(&slave->dev);
@@ -686,6 +676,9 @@ static int rt1318_sdw_component_probe(struct snd_soc_component *component)
 
 	rt1318->component = component;
 
+	if (!rt1318->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	dev_dbg(&rt1318->sdw_slave->dev, "%s pm_runtime_resume, ret=%d", __func__, ret);
 	if (ret < 0 && ret != -EACCES)
@@ -765,8 +758,25 @@ static int rt1318_sdw_init(struct device *dev, struct regmap *regmap,
 				&soc_component_sdw_rt1318,
 				rt1318_sdw_dai,
 				ARRAY_SIZE(rt1318_sdw_dai));
+	if (ret < 0)
+		return ret;
 
-	dev_dbg(&slave->dev, "%s\n", __func__);
+	/* set autosuspend parameters */
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+
+	/* make sure the device does not suspend immediately */
+	pm_runtime_mark_last_busy(dev);
+
+	pm_runtime_enable(dev);
+
+	/* important note: the device is NOT tagged as 'active' and will remain
+	 * 'suspended' until the hardware is enumerated/initialized. This is required
+	 * to make sure the ASoC framework use of pm_runtime_get_sync() does not silently
+	 * fail with -EACCESS because of race conditions between card creation and enumeration
+	 */
+
+	dev_dbg(dev, "%s\n", __func__);
 
 	return ret;
 }
@@ -786,10 +796,7 @@ static int rt1318_sdw_probe(struct sdw_slave *slave,
 
 static int rt1318_sdw_remove(struct sdw_slave *slave)
 {
-	struct rt1318_sdw_priv *rt1318 = dev_get_drvdata(&slave->dev);
-
-	if (rt1318->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
-- 
2.39.2

