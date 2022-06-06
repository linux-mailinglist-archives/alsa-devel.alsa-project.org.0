Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3211053F015
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E3A1B3E;
	Mon,  6 Jun 2022 22:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E3A1B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654548075;
	bh=jrEjeelyT5LyWC/BU9wUwZyVpV3V3HPCSyA1LbvPP/E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghinserXyH/QdeRRnUr/KSEjpekJkcgaYTrA6nBwRwUjjAX5tqt6zLO34HONBYyKj
	 dKVaeYncsgueH2pQABY/HyvAD2IbWG7k9lHH8urX0xa05T3e2wUpfMaruQELhvgqnY
	 1hUef4EVQWF5SecqM0ngeWJzLy3aMhzgxio0pwiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D54F80549;
	Mon,  6 Jun 2022 22:38:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0E63F80538; Mon,  6 Jun 2022 22:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CACF0F80526
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CACF0F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CsGTyk9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654547892; x=1686083892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jrEjeelyT5LyWC/BU9wUwZyVpV3V3HPCSyA1LbvPP/E=;
 b=CsGTyk9pZ358jTneCjSuOyytLssTRmrj3I736fblv6F3cfP76HNjjSYj
 XiosG5xgNRf6e1OTg9bOqMLeaiymLyTEyyva4pciv080urI3EJVyE6WWw
 IVm547810LtWA3nVukNvZ3bLKrfZrhss9Mtiqpm0Q2bm5hkOIn585cWcQ
 PD9QxQKeIw9OJ2F7v69yBve285paC7EiwKjvDUCEBIutL5OwOhln/7KFU
 obRjmyCodzwnY1fgevJCQRWZmVLgVRwpiFKK6GEc1svpsSBZb1AtbwXf1
 YPUYdYtGDOUmJTDCk+ZlbequqEx6P1RlGcZEp1J3E9OOyMTk41uCUhj8H Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276730869"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="276730869"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="647728103"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ASoC: codecs: rt700/rt711/rt711-sdca: resume bus/codec in
 .set_jack_detect
Date: Mon,  6 Jun 2022 15:37:52 -0500
Message-Id: <20220606203752.144159-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
References: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The .set_jack_detect() codec component callback is invoked during card
registration, which happens when the machine driver is probed.

The issue is that this callback can race with the bus suspend/resume,
and IO timeouts can happen. This can be reproduced very easily if the
machine driver is 'blacklisted' and manually probed after the bus
suspends. The bus and codec need to be re-initialized using pm_runtime
helpers.

Previous contributions tried to make sure accesses to the bus during
the .set_jack_detect() component callback only happen when the bus is
active. This was done by changing the regcache status on a component
remove. This is however a layering violation, the regcache status
should only be modified on device probe, suspend and resume. The
component probe/remove should not modify how the device regcache is
handled. This solution also didn't handle all the possible race
conditions, and the RT700 headset codec was not handled.

This patch tries to resume the codec device before handling the jack
initializations. In case the codec has not yet been initialized,
pm_runtime may not be enabled yet, so we don't squelch the -EACCES
error code and only stop the jack information. When the codec reports
as attached, the jack initialization will proceed as usual.

BugLink: https://github.com/thesofproject/linux/issues/3643
Fixes: 7ad4d237e7c4a ('ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver')
Fixes: 899b12542b089 ('ASoC: rt711: add snd_soc_component remove callback')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt700.c      | 16 +++++++++++++---
 sound/soc/codecs/rt711-sdca.c | 26 ++++++++++++++------------
 sound/soc/codecs/rt711.c      | 24 +++++++++++++-----------
 3 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 7a6cf3434591a..9bceeeb830b15 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -315,17 +315,27 @@ static int rt700_set_jack_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *hs_jack, void *data)
 {
 	struct rt700_priv *rt700 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt700->hs_jack = hs_jack;
 
-	if (!rt700->hw_init) {
-		dev_dbg(&rt700->slave->dev,
-			"%s hw_init not ready yet\n", __func__);
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0) {
+		if (ret != -EACCES) {
+			dev_err(component->dev, "%s: failed to resume %d\n", __func__, ret);
+			return ret;
+		}
+
+		/* pm_runtime not enabled yet */
+		dev_dbg(component->dev,	"%s: skipping jack init for now\n", __func__);
 		return 0;
 	}
 
 	rt700_jack_init(rt700);
 
+	pm_runtime_mark_last_busy(component->dev);
+	pm_runtime_put_autosuspend(component->dev);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 2b3b77577d1fd..dfe3c9299ebde 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -487,16 +487,27 @@ static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *hs_jack, void *data)
 {
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt711->hs_jack = hs_jack;
 
-	if (!rt711->hw_init) {
-		dev_dbg(&rt711->slave->dev,
-			"%s hw_init not ready yet\n", __func__);
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0) {
+		if (ret != -EACCES) {
+			dev_err(component->dev, "%s: failed to resume %d\n", __func__, ret);
+			return ret;
+		}
+
+		/* pm_runtime not enabled yet */
+		dev_dbg(component->dev,	"%s: skipping jack init for now\n", __func__);
 		return 0;
 	}
 
 	rt711_sdca_jack_init(rt711);
+
+	pm_runtime_mark_last_busy(component->dev);
+	pm_runtime_put_autosuspend(component->dev);
+
 	return 0;
 }
 
@@ -1190,14 +1201,6 @@ static int rt711_sdca_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static void rt711_sdca_remove(struct snd_soc_component *component)
-{
-	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
-
-	regcache_cache_only(rt711->regmap, true);
-	regcache_cache_only(rt711->mbq_regmap, true);
-}
-
 static const struct snd_soc_component_driver soc_sdca_dev_rt711 = {
 	.probe = rt711_sdca_probe,
 	.controls = rt711_sdca_snd_controls,
@@ -1207,7 +1210,6 @@ static const struct snd_soc_component_driver soc_sdca_dev_rt711 = {
 	.dapm_routes = rt711_sdca_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(rt711_sdca_audio_map),
 	.set_jack = rt711_sdca_set_jack_detect,
-	.remove = rt711_sdca_remove,
 	.endianness = 1,
 };
 
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5709a6bbe8fc5..9df800abfc2d8 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -457,17 +457,27 @@ static int rt711_set_jack_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *hs_jack, void *data)
 {
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt711->hs_jack = hs_jack;
 
-	if (!rt711->hw_init) {
-		dev_dbg(&rt711->slave->dev,
-			"%s hw_init not ready yet\n", __func__);
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0) {
+		if (ret != -EACCES) {
+			dev_err(component->dev, "%s: failed to resume %d\n", __func__, ret);
+			return ret;
+		}
+
+		/* pm_runtime not enabled yet */
+		dev_dbg(component->dev,	"%s: skipping jack init for now\n", __func__);
 		return 0;
 	}
 
 	rt711_jack_init(rt711);
 
+	pm_runtime_mark_last_busy(component->dev);
+	pm_runtime_put_autosuspend(component->dev);
+
 	return 0;
 }
 
@@ -932,13 +942,6 @@ static int rt711_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static void rt711_remove(struct snd_soc_component *component)
-{
-	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
-
-	regcache_cache_only(rt711->regmap, true);
-}
-
 static const struct snd_soc_component_driver soc_codec_dev_rt711 = {
 	.probe = rt711_probe,
 	.set_bias_level = rt711_set_bias_level,
@@ -949,7 +952,6 @@ static const struct snd_soc_component_driver soc_codec_dev_rt711 = {
 	.dapm_routes = rt711_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(rt711_audio_map),
 	.set_jack = rt711_set_jack_detect,
-	.remove = rt711_remove,
 	.endianness = 1,
 };
 
-- 
2.34.1

