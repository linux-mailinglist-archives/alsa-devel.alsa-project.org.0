Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB86C7507
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBA8ED8;
	Fri, 24 Mar 2023 02:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBA8ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621467;
	bh=wjw34KdtCxm3W44AGkSEc9zBd1GmuZfgTUhmIbn2tWI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c80oR0W7N5ilxF+RbduT/WmnfAOtIDHJDaFsMCdREKWurKCsFwNfaHts22l5yrJB8
	 E/XbcOywcvfY/u15E3Jzd+VHrEPNbpMiSphS8xHv3cKc7Kp8ZfR3KeG9qK4LdU3/FC
	 9yL8KO8U3NFugrKATMoXnARyuQAEylRTtHqyuXhQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E33F80551;
	Fri, 24 Mar 2023 02:29:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA9DBF80534; Fri, 24 Mar 2023 02:29:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F510F8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F510F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SnVtrW7p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621342; x=1711157342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wjw34KdtCxm3W44AGkSEc9zBd1GmuZfgTUhmIbn2tWI=;
  b=SnVtrW7poJ84QjYKa9nB/8PeVL1fhRqWF8UoiBK3ktLeSHVX/FvzpAvw
   6u4tFBt0Q3yVTLlI69RIzSHc+h+2gYrHgUe1EmUg6lYkEsbatCdgPKVa7
   S4kARcDjWkAWuv58ZU/LC4vuy01fpI1oCEpWTiasdGCy1IKZiHitx64EQ
   bQShs6d7dEJVN2rRvR6QaHdYU4BUQPTn4XXEbVAWnZ4PE7sH52TXR9CPX
   UJtX4WQeE7PkQ59zDhmphEGN9g7hmCrItSJXQrbnOE8TIupyJUOyZNcLE
   PHNN0z3uIwNIRBb72PJzaD+hkIFMcAenCb3bhcnoCSA+rAuC3TRQ9aA21
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584852"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584852"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659872998"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659872998"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:28:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 02/13] ASoC: codecs: sdw-mockup: simplify set_stream
Date: Fri, 24 Mar 2023 09:43:57 +0800
Message-Id: <20230324014408.1677505-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QBYOYBW7LHA457N2AV447Y2S24T6RS23
X-Message-ID-Hash: QBYOYBW7LHA457N2AV447Y2S24T6RS23
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBYOYBW7LHA457N2AV447Y2S24T6RS23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Using a dynamic allocation to store a single pointer is not very
efficient/useful.

Worse, the memory is released in the SoundWire stream.c file, but
still accessed in the DAI shutdown, leading to kmemleak reports.

And last the API requires the previous stream information to be
cleared when the argument is NULL.

Simplify the code to address all 3 problems.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/sdw-mockup.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index 62b02d764f09..5498ff027c58 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -23,10 +23,6 @@ struct  sdw_mockup_priv {
 	struct sdw_slave *slave;
 };
 
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 static int sdw_mockup_component_probe(struct snd_soc_component *component)
 {
 	return 0;
@@ -45,19 +41,7 @@ static const struct snd_soc_component_driver snd_soc_sdw_mockup_component = {
 static int sdw_mockup_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 				     int direction)
 {
-	struct sdw_stream_data *stream;
-
-	if (!sdw_stream)
-		return 0;
-
-	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
-	if (!stream)
-		return -ENOMEM;
-
-	stream->sdw_stream = sdw_stream;
-
-	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	snd_soc_dai_dma_data_set(dai, direction, stream);
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
 
 	return 0;
 }
@@ -65,11 +49,7 @@ static int sdw_mockup_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 static void sdw_mockup_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int sdw_mockup_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -80,11 +60,10 @@ static int sdw_mockup_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_mockup_priv *sdw_mockup = snd_soc_component_get_drvdata(component);
 	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config = {0};
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 	int ret;
 
-	stream = snd_soc_dai_get_dma_data(dai, substream);
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!sdw_mockup->slave)
@@ -99,7 +78,7 @@ static int sdw_mockup_pcm_hw_params(struct snd_pcm_substream *substream,
 		port_config.num = 8;
 
 	ret = sdw_stream_add_slave(sdw_mockup->slave, &stream_config,
-				   &port_config, 1, stream->sdw_stream);
+				   &port_config, 1, sdw_stream);
 	if (ret)
 		dev_err(dai->dev, "Unable to configure port\n");
 
@@ -111,13 +90,12 @@ static int sdw_mockup_pcm_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct sdw_mockup_priv *sdw_mockup = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
-		snd_soc_dai_get_dma_data(dai, substream);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!sdw_mockup->slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(sdw_mockup->slave, stream->sdw_stream);
+	sdw_stream_remove_slave(sdw_mockup->slave, sdw_stream);
 	return 0;
 }
 
-- 
2.25.1

