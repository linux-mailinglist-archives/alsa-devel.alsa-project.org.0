Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD66C750A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:31:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDBB5EE9;
	Fri, 24 Mar 2023 02:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDBB5EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621516;
	bh=yWKTdjTalqvw+4k9e+5wDSSpz/nWuKDr1M8WkzT7cNs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pmRaVsTS/yK41Erk9JwDqVkf7AW/0Tz1nL3E9YFHz+l0nsK8w4OMMs1i3hG6akPh3
	 VJ+HEzr2lT/ykRMaFiwJsi/tvanmv9zwC87ZRxtUbp+fTTQklbNqes2VbZvC21+ucC
	 S8i/kyNMa+XW88yrgwiMm9yryn38CAed8bkHMC68=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDEEF8051B;
	Fri, 24 Mar 2023 02:29:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10D13F80482; Fri, 24 Mar 2023 02:29:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FC23F804FE
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FC23F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MEWwZsoR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621346; x=1711157346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yWKTdjTalqvw+4k9e+5wDSSpz/nWuKDr1M8WkzT7cNs=;
  b=MEWwZsoRdJAny7fCejlkbGkXOc+YddOF3rEu75d8Gx4VbGNoJQhSwQSj
   LYEOmcnk1jQqXcSE6CiWSCREOGqjHm5GPFO7L8Cncvg69W0LrIzxifQOK
   dFazQNtXM/iLL6OHUljZCjz7aJZ8Kc7fse1OcOYGR6gtinWBQl82Y/e2r
   K0LBB4ZWyK1TApxAn8ocYYAf73+xjUURY+yfvBK0CcLyr16kB0WIc+txv
   fKkwbxVXToe0PHgEu8qrmULwy2OMG51JyezJuv7vofy6mWSCS4/+TTaHN
   N6BIdlb1JMb97iy2FgNcpB5KDifQRDCz9wYbZcxQmcqcg60VAdWVxqX1J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584885"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584885"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873035"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873035"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 06/13] ASoC: codecs: rt1318-sdw: simplify set_stream
Date: Fri, 24 Mar 2023 09:44:01 +0800
Message-Id: <20230324014408.1677505-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2PBUCPVZDP5Q5265HQMPPHNTMDGRVZPM
X-Message-ID-Hash: 2PBUCPVZDP5Q5265HQMPPHNTMDGRVZPM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PBUCPVZDP5Q5265HQMPPHNTMDGRVZPM/>
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
 sound/soc/codecs/rt1318-sdw.c | 30 +++++++-----------------------
 sound/soc/codecs/rt1318-sdw.h |  4 ----
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index c32d8ae77981..795accedc22c 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -562,19 +562,7 @@ static const struct snd_soc_dapm_route rt1318_dapm_routes[] = {
 static int rt1318_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
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
@@ -582,11 +570,7 @@ static int rt1318_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 static void rt1318_sdw_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int rt1318_sdw_hw_params(struct snd_pcm_substream *substream,
@@ -598,14 +582,14 @@ static int rt1318_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_stream_config stream_config;
 	struct sdw_port_config port_config;
 	enum sdw_data_direction direction;
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int retval, port, num_channels, ch_mask;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
-	stream = snd_soc_dai_get_dma_data(dai, substream);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!rt1318->sdw_slave)
@@ -633,7 +617,7 @@ static int rt1318_sdw_hw_params(struct snd_pcm_substream *substream,
 	port_config.num = port;
 
 	retval = sdw_stream_add_slave(rt1318->sdw_slave, &stream_config,
-				&port_config, 1, stream->sdw_stream);
+				&port_config, 1, sdw_stream);
 	if (retval) {
 		dev_err(dai->dev, "Unable to configure port\n");
 		return retval;
@@ -679,13 +663,13 @@ static int rt1318_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct rt1318_sdw_priv *rt1318 =
 		snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!rt1318->sdw_slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(rt1318->sdw_slave, stream->sdw_stream);
+	sdw_stream_remove_slave(rt1318->sdw_slave, sdw_stream);
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt1318-sdw.h b/sound/soc/codecs/rt1318-sdw.h
index 4d7ac9c4bd8d..85918c184f16 100644
--- a/sound/soc/codecs/rt1318-sdw.h
+++ b/sound/soc/codecs/rt1318-sdw.h
@@ -94,8 +94,4 @@ struct rt1318_sdw_priv {
 	bool first_hw_init;
 };
 
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 #endif /* __RT1318_SDW_H__ */
-- 
2.25.1

