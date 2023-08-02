Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32F76D241
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7546384A;
	Wed,  2 Aug 2023 17:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7546384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990757;
	bh=kVHRDeQnJHvOqrZDlqVE1pjyZ8t0xv3jOU8cAdMWiDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J82Jr/MP+R337/1yfNEJawg1MNpVgpgKs3GVrX0P54GUCmuIk+hNAQPqYNeTmCzN4
	 7zOkBSpbryMG0CE2j8sc9FhR3am3tTQtLCrcFGDHQtFzwg6tHHZa70bm8heDCXU1EW
	 GE54vSp6BViVZz+1C5Yn02uiLoNy0ZV4WLPgQ5MY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7977EF805A0; Wed,  2 Aug 2023 17:37:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95806F80588;
	Wed,  2 Aug 2023 17:37:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B7EF8057F; Wed,  2 Aug 2023 17:37:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B0D9AF80520
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D9AF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EZQAM1Cw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990619; x=1722526619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kVHRDeQnJHvOqrZDlqVE1pjyZ8t0xv3jOU8cAdMWiDo=;
  b=EZQAM1CwJIMiJ0c6V7hPn/2HEKQY/tAciGNq43Ff0UYIezixOuWHtgqA
   Qwl+0uCgYdacb2p5cXxrAWxjrRk7NZ5tIb/6OGnZqZ8anG9ZZKVMbDMYw
   DZGCwDeNMPyvbg8jLg1nifXbGHM+ijt9y4oOj2mcw+U8yHcdmjIDFO54B
   g0OKQEsEaxV38fyGiqjWGHCUIj4jySElB8X3XqAsuYv8dc8GhRsCWNMEA
   yw22oHMynf3PxoyAu3N7EfF8eVEvCxYoKUPOcoxZskFPubU3R/ab+ziuG
   wrauPwdy9XTs9qPLwSXx4ijeeYj9ax+MEOp/4bTdGKrOTxWYa/eenvqyY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350765"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350765"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887025"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887025"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 05/16] ASoC: rt711-sdca: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:18 -0500
Message-Id: <20230802153629.53576-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5PRE2HNJ3ULHK2QL6TTDJKLQMR3PRJ7C
X-Message-ID-Hash: 5PRE2HNJ3ULHK2QL6TTDJKLQMR3PRJ7C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PRE2HNJ3ULHK2QL6TTDJKLQMR3PRJ7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In stress cases involving module insertion/removal followed by
playback/capture, it can happen that capture/playback is started
before the codec enumeration completes.

The codec driver registers its components with the ASoC framework
during the probe stage, so there is currently no way for the card
creation to wait for the codec enumeration/initialization to complete.

In addition, when the capture/playback starts, the ASoC framework uses
pm_runtime_get_sync() to properly refcount and power-manage
devices. This is problematic in the SoundWire case because pm_runtime
is enabled during the enumeration/initialization stage, so
pm_runtime_get_sync() will return -EACCESS which is
ignored. Additional errors will happen when setting the pm_runtime
status as 'active' because the parent is not properly resumed,
resulting in an error such as:

"rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
sdw:0:025d:0711:00 but parent (sdw-master-0) is not active"

This patch suggests enabling pm_runtime during the probe, but marking
the device as 'active' only after it is enumerated. That will force a
dependency between the card and the codec, pm_runtime_get_sync() will
have to wait for the codec device to resume and hence implicitly wait
for the enumeration/initialization to be completed. In the nominal
case where the codec device is already active the get_sync() would
only perform a ref-count increase.

Closes: https://github.com/thesofproject/linux/issues/4328
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c |  3 +--
 sound/soc/codecs/rt711-sdca.c     | 40 +++++++++++++++++++++----------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 23f23f714b39..935e597022d3 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -366,8 +366,7 @@ static int rt711_sdca_sdw_remove(struct sdw_slave *slave)
 		cancel_delayed_work_sync(&rt711->jack_btn_check_work);
 	}
 
-	if (rt711->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	mutex_destroy(&rt711->calibrate_mutex);
 	mutex_destroy(&rt711->disable_irq_lock);
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index bd0f5e05874b..447154cb6010 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -507,6 +507,10 @@ static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
 
 	rt711->hs_jack = hs_jack;
 
+	/* we can only resume if the device was initialized at least once */
+	if (!rt711->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(component->dev);
 	if (ret < 0) {
 		if (ret != -EACCES) {
@@ -1215,6 +1219,9 @@ static int rt711_sdca_probe(struct snd_soc_component *component)
 	rt711_sdca_parse_dt(rt711, &rt711->slave->dev);
 	rt711->component = component;
 
+	if (!rt711->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -1434,9 +1441,27 @@ int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 			rt711_sdca_dai,
 			ARRAY_SIZE(rt711_sdca_dai));
 
-	dev_dbg(&slave->dev, "%s\n", __func__);
+	if (ret < 0)
+		return ret;
 
-	return ret;
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
+
+	return 0;
 }
 
 static void rt711_sdca_vd0_io_init(struct rt711_sdca_priv *rt711)
@@ -1511,20 +1536,11 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 		regcache_cache_bypass(rt711->mbq_regmap, true);
 	} else {
 		/*
-		 * PM runtime is only enabled when a Slave reports as Attached
+		 * PM runtime status is marked as 'active' only when a Slave reports as Attached
 		 */
 
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
-- 
2.39.2

