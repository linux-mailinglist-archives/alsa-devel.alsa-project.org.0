Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF5D70258A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0374E84;
	Mon, 15 May 2023 08:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0374E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133858;
	bh=7HU4GkkFBUz3CDwO3kK4aBa3k7/H20TmG32LVN6IOSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HUivFfjU47MfOUxgEzO0t2VwjAFwp0KAvVjGcNwfdhZ43u3nz6oddeS8JFh1CpUwi
	 OcMIe8b9P0A9mdur6wBlB0SxQVW97murpJxdevh7zP96CF3++8YFgWlXJ1LRTQtl5E
	 oQ7gzAu4GnxcKKlDf7iB+U18zj0vqUIqyI0ZYd7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFB21F80682; Mon, 15 May 2023 08:51:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67C8BF80678;
	Mon, 15 May 2023 08:51:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1E3AF80633; Mon, 15 May 2023 08:51:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 072D6F80611
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 072D6F80611
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K76icFZB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133482; x=1715669482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7HU4GkkFBUz3CDwO3kK4aBa3k7/H20TmG32LVN6IOSQ=;
  b=K76icFZBa6Q1/kfbxBfdV+khGZKV8MdQdhfYf05bUQ5VOqdY3gdmqJAJ
   UC130pBbjFjvtSPfyJmt7FCxysAlg5J6ZlQxmezxGz7I7mH/gdRVf1C7Z
   3FMgcTUgkPcoMbPS7VJ3pDoEVIhdqp6UEYrCrfjM3ih1DmVa3zsc0ZQDV
   K6cAUbdWSIB/FaEKAVVtOpvL7NJVW3//A5IdUp6g68u5VVbZQ/3UwyxoO
   2qHl1eULoPm5iCnvJjtAFkiMA66nEIH269+iXsezPqgfW5wrrhNaLqGKl
   25mrnyKbglHm97Gm61VLdLLorArfsdaS9XwGldrzj7p09qn0aatR+r4Ho
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966575"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966575"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908802"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908802"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 25/26] soundwire: intel: remove .free callback
 implementation
Date: Mon, 15 May 2023 15:10:41 +0800
Message-Id: <20230515071042.2038-26-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DQ5PEQXXMRXK32WYYNTSWG5AYPBY3CT2
X-Message-ID-Hash: DQ5PEQXXMRXK32WYYNTSWG5AYPBY3CT2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQ5PEQXXMRXK32WYYNTSWG5AYPBY3CT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The interface is not needed for IPC3 solution but will be needed with
an updated parameter list for ACE2.x+IPC4 combinations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 37 +------------------------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 15cecd2e062d..f52167aa48db 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -663,25 +663,6 @@ static int intel_params_stream(struct sdw_intel *sdw,
 	return -EIO;
 }
 
-static int intel_free_stream(struct sdw_intel *sdw,
-			     int stream,
-			     struct snd_soc_dai *dai,
-			     int link_id)
-{
-	struct sdw_intel_link_res *res = sdw->link_res;
-	struct sdw_intel_stream_free_data free_data;
-
-	free_data.stream = stream; /* direction */
-	free_data.dai = dai;
-	free_data.link_id = link_id;
-
-	if (res->ops && res->ops->free_stream && res->dev)
-		return res->ops->free_stream(res->dev,
-					     &free_data);
-
-	return 0;
-}
-
 /*
  * DAI routines
  */
@@ -817,7 +798,6 @@ static int
 intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
-	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dai_runtime *dai_runtime;
 	int ret;
 
@@ -838,12 +818,6 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 		return ret;
 	}
 
-	ret = intel_free_stream(sdw, substream->stream, dai, sdw->instance);
-	if (ret < 0) {
-		dev_err(dai->dev, "intel_free_stream: failed %d\n", ret);
-		return ret;
-	}
-
 	dai_runtime->pdi = NULL;
 
 	return 0;
@@ -871,7 +845,6 @@ static void *intel_get_sdw_stream(struct snd_soc_dai *dai,
 static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
-	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dai_runtime *dai_runtime;
 	int ret = 0;
 
@@ -894,7 +867,6 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 
 		dai_runtime->suspended = true;
 
-		ret = intel_free_stream(sdw, substream->stream, dai, sdw->instance);
 		break;
 
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -940,9 +912,7 @@ static int intel_component_dais_suspend(struct snd_soc_component *component)
 	 */
 	for_each_component_dais(component, dai) {
 		struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
-		struct sdw_intel *sdw = cdns_to_intel(cdns);
 		struct sdw_cdns_dai_runtime *dai_runtime;
-		int ret;
 
 		dai_runtime = cdns->dai_runtime_array[dai->id];
 
@@ -952,13 +922,8 @@ static int intel_component_dais_suspend(struct snd_soc_component *component)
 		if (dai_runtime->suspended)
 			continue;
 
-		if (dai_runtime->paused) {
+		if (dai_runtime->paused)
 			dai_runtime->suspended = true;
-
-			ret = intel_free_stream(sdw, dai_runtime->direction, dai, sdw->instance);
-			if (ret < 0)
-				return ret;
-		}
 	}
 
 	return 0;
-- 
2.25.1

