Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D7B76D265
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF0F846;
	Wed,  2 Aug 2023 17:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF0F846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990924;
	bh=LC1z11csKXep2Ks+8qlabTl4LRvUM6b3i2GdkK5zgJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QaFHI93P0AEsSh+VuTrW4VYr7f+OR2buYw3oBV5arePtKNdvmKpIbgcWSEpwJq2+a
	 BJlCA2bSiqKvEMnyGWKDvMF2KWcauTOpm6hbXn0kezY4r6Kau+DLK0dK+WHnJq3vik
	 9OONM1HwGNhVfPDWEfcXVALSu56xru8z7oJ6LHnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF1ECF80614; Wed,  2 Aug 2023 17:38:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89F13F8060D;
	Wed,  2 Aug 2023 17:38:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37183F805C1; Wed,  2 Aug 2023 17:37:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D14BF80557
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D14BF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=huUxNWXH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990627; x=1722526627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LC1z11csKXep2Ks+8qlabTl4LRvUM6b3i2GdkK5zgJ0=;
  b=huUxNWXHu8urDqtr79x/WQ53/Z/RV6hY1zqJP0H5sE5a+6ylQJqC0j5Y
   +3wOkSYnmveJ4vW10TwYr9eHTsauy/bBIz1M71a00vhzJgB/X4xFDqBgn
   CwYMVznxkMW7YHmwam0neI8uq+7AgoqdKDlg+Hd0EVdqlOB4+3WU0Y0BM
   TONdhEABjBEkfILSKg/38uqyZRvuHRQYVPAeVTnz6o5vReaS5joRVoEvA
   JZKbcBcMLXCo4bDbr1Eoq5ZtljtEuymTdNYZQxocn74/WwNp//XM0dcPl
   NWm6Dsjqe6qTMdX2g43krywnUeaVIfXTGJUgocw6/6JfN3LG/PMEcHDSS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350886"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350886"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722887305"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722887305"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 16/16] ASoC: max98373-sdw: enable pm_runtime in probe,
 keep status as 'suspended'
Date: Wed,  2 Aug 2023 10:36:29 -0500
Message-Id: <20230802153629.53576-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6YLVIRM4QCRVETSKV6NL23MUBT6JALFL
X-Message-ID-Hash: 6YLVIRM4QCRVETSKV6NL23MUBT6JALFL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YLVIRM4QCRVETSKV6NL23MUBT6JALFL/>
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
 sound/soc/codecs/max98373-sdw.c | 40 ++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 92d2b872f9f8..b5cb951af570 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -366,22 +366,12 @@ static int max98373_io_init(struct sdw_slave *slave)
 		regcache_cache_bypass(max98373->regmap, true);
 
 	/*
-	 * PM runtime is only enabled when a Slave reports as Attached
+	 * PM runtime status is marked as 'active' only when a Slave reports as Attached
 	 */
-	if (!max98373->first_hw_init) {
-		/* set autosuspend parameters */
-		pm_runtime_set_autosuspend_delay(dev, 3000);
-		pm_runtime_use_autosuspend(dev);
-
+	if (!max98373->first_hw_init)
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(dev);
 
-		/* make sure the device does not suspend immediately */
-		pm_runtime_mark_last_busy(dev);
-
-		pm_runtime_enable(dev);
-	}
-
 	pm_runtime_get_noresume(dev);
 
 	/* Software Reset */
@@ -774,10 +764,27 @@ static int max98373_init(struct sdw_slave *slave, struct regmap *regmap)
 	ret = devm_snd_soc_register_component(dev, &soc_codec_dev_max98373_sdw,
 					      max98373_sdw_dai,
 					      ARRAY_SIZE(max98373_sdw_dai));
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dev, "Failed to register codec: %d\n", ret);
+		return ret;
+	}
 
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
+	return 0;
 }
 
 static int max98373_update_status(struct sdw_slave *slave,
@@ -835,10 +842,7 @@ static int max98373_sdw_probe(struct sdw_slave *slave,
 
 static int max98373_sdw_remove(struct sdw_slave *slave)
 {
-	struct max98373_priv *max98373 = dev_get_drvdata(&slave->dev);
-
-	if (max98373->first_hw_init)
-		pm_runtime_disable(&slave->dev);
+	pm_runtime_disable(&slave->dev);
 
 	return 0;
 }
-- 
2.39.2

