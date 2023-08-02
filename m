Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF9176D294
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1E03A4E;
	Wed,  2 Aug 2023 17:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1E03A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990969;
	bh=OvAqH+RtASHkuchds9WYDK/Ng2Sb/LvYs6QG1arjcjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MkIjcZbgPXeLW4BLKBHpeVbP05t3UPHxYCoyRZZur3e7FI6su7CuIcQTJ9nFrCSck
	 ZLrEl7fhoBXFpH2L7C18z7X/yth3IPRHeK2OQcT1S7y5plt5BrN+nhbVhCZqLxSrRo
	 LlAUwqkQy/ecXv3yj/r/VNNKu0Y5I+IExPofEstM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F107BF80635; Wed,  2 Aug 2023 17:38:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C295F8057A;
	Wed,  2 Aug 2023 17:38:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B163F8060E; Wed,  2 Aug 2023 17:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C8D3F801D5
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C8D3F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A6JvfHn3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990620; x=1722526620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OvAqH+RtASHkuchds9WYDK/Ng2Sb/LvYs6QG1arjcjk=;
  b=A6JvfHn37h016rM1fAx095k+rHHxqZLvZb6PZRNvMBsTetZkZCcHDR5O
   b3JUEgHzdLOl7c16i683FAG7C/hOtIEVcoveV8SlKT9m9QJjbx2w2dRS7
   LC1KqYve4EMhyY2+i+vusR3C8uWCtIzC+EJYglLJ4NIl4x5RmuR0vS7nR
   +KXOgkSGOhsh9bwg4snps/U7SVuySvMzLdNcbwFH606lWAmoevWTWIOHZ
   yz0HoGVRqJA9Se4/bdOrKwUDYd93cO4kg4+rmYhHKe4X27PuOPsXbdc2Y
   kG/hnGi6GIaUsdXzErd+PW9GlzJ2lO8ElaXZpxBeOCyCEBik1a1CJ7QuQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350778"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887056"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887056"
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
Subject: [PATCH 06/16] ASoC: rt700: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:19 -0500
Message-Id: <20230802153629.53576-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RC4C4EG3QMJILOIZS7KH27LN56DXAEFT
X-Message-ID-Hash: RC4C4EG3QMJILOIZS7KH27LN56DXAEFT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RC4C4EG3QMJILOIZS7KH27LN56DXAEFT/>
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
 sound/soc/codecs/rt700-sdw.c |  3 +--
 sound/soc/codecs/rt700.c     | 39 ++++++++++++++++++++++++------------
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 53e7973e0bf9..52c33d56b143 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -464,8 +464,7 @@ static int rt700_sdw_remove(struct sdw_slave *slave)
 		cancel_delayed_work_sync(&rt700->jack_btn_check_work);
 	}
 
-	if (rt700->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index b774349dfdae..0ebf344a1b60 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -320,6 +320,10 @@ static int rt700_set_jack_detect(struct snd_soc_component *component,
 
 	rt700->hs_jack = hs_jack;
 
+	/* we can only resume if the device was initialized at least once */
+	if (!rt700->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(component->dev);
 	if (ret < 0) {
 		if (ret != -EACCES) {
@@ -823,6 +827,9 @@ static int rt700_probe(struct snd_soc_component *component)
 
 	rt700->component = component;
 
+	if (!rt700->first_hw_init)
+		return 0;
+
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -1119,10 +1126,26 @@ int rt700_init(struct device *dev, struct regmap *sdw_regmap,
 				&soc_codec_dev_rt700,
 				rt700_dai,
 				ARRAY_SIZE(rt700_dai));
+	if (ret < 0)
+		return ret;
 
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
 	dev_dbg(&slave->dev, "%s\n", __func__);
 
-	return ret;
+	return 0;
 }
 
 int rt700_io_init(struct device *dev, struct sdw_slave *slave)
@@ -1141,20 +1164,10 @@ int rt700_io_init(struct device *dev, struct sdw_slave *slave)
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
 	 */
-	if (!rt700->first_hw_init) {
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
-		pm_runtime_use_autosuspend(&slave->dev);
-
-		/* update count of parent 'active' children */
+	if (!rt700->first_hw_init)
+		/* PM runtime status is marked as 'active' only when a Slave reports as Attached */
 		pm_runtime_set_active(&slave->dev);
 
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(&slave->dev);
-
-		pm_runtime_enable(&slave->dev);
-	}
-
 	pm_runtime_get_noresume(&slave->dev);
 
 	/* reset */
-- 
2.39.2

