Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7C6C7516
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:33:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 562E6ECE;
	Fri, 24 Mar 2023 02:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 562E6ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621604;
	bh=WDhsEqG4VZdPy8eVjOW22Vlhck7ur3f3lTWKvWSSEwE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QuxZ/l+oGs5fwOLMOjBFLOc8kPR6mwL6T09/k2A8VTBkuSuL7aNQ09sgb5Ib/VKVV
	 MAUtaEfIL0zWFzy/XqfhHQKiJRZgDOo1pWXTW4XhITDNq3fmBB2EfSN/hAT7Ht0Lli
	 3azB8hXgbylbGla91LonCX7I1ApxzjychfFhlnPw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F018DF805AB;
	Fri, 24 Mar 2023 02:30:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 074D7F805A8; Fri, 24 Mar 2023 02:29:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BABD1F8052E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BABD1F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kwtPo767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621360; x=1711157360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WDhsEqG4VZdPy8eVjOW22Vlhck7ur3f3lTWKvWSSEwE=;
  b=kwtPo767OYXZKrnQ04Y+bVCGcrIHyKR/WL+VcDtHFugueD0pLvbuytW2
   Iyiv3EQPJIta9dmHDHrr2xA1Bb44LvT1rfISTaeViZsgD5G4ccbdqSA/Y
   ANiHV/50y6f6nQDp51jyp/69L/ju4EqkpmpZ495CWauC4fz+Uj6kqCAhR
   nxOBDyO7vnaokHLobCYUk9ChZjOTDgTJFvnsxqLNOis5xJTTwWuTnkqzG
   WwZuyfrnsuns+BaNHkHIbeXLpF9/DIkgV4oKG+PZXnLDkTSBUMWJxBPSQ
   lUbp8ken3eoqEmLq/u0mkvecieXQqZe6y+30rJrEZG4QmIXLWaujVjTiJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584939"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584939"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873156"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873156"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 13/13] ASoC: codecs: rt5682-sdw: simplify set_stream
Date: Fri, 24 Mar 2023 09:44:08 +0800
Message-Id: <20230324014408.1677505-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QQCBTQ2RMWU2NH3E3PEKBUNTTI2B7GEW
X-Message-ID-Hash: QQCBTQ2RMWU2NH3E3PEKBUNTTI2B7GEW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQCBTQ2RMWU2NH3E3PEKBUNTTI2B7GEW/>
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
 sound/soc/codecs/rt5682-sdw.c | 34 +++++++---------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 5f80a5d59b65..23f17f70d7e9 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -88,26 +88,10 @@ static const struct regmap_config rt5682_sdw_indirect_regmap = {
 	.reg_write = rt5682_sdw_write,
 };
 
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
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
@@ -115,11 +99,7 @@ static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 static void rt5682_sdw_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
@@ -130,14 +110,14 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config = {0};
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int retval;
 	unsigned int val_p = 0, val_c = 0, osr_p = 0, osr_c = 0;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
 
-	stream = snd_soc_dai_get_dma_data(dai, substream);
-	if (!stream)
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!sdw_stream)
 		return -ENOMEM;
 
 	if (!rt5682->slave)
@@ -152,7 +132,7 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 		port_config.num = 2;
 
 	retval = sdw_stream_add_slave(rt5682->slave, &stream_config,
-				      &port_config, 1, stream->sdw_stream);
+				      &port_config, 1, sdw_stream);
 	if (retval) {
 		dev_err(dai->dev, "Unable to configure port\n");
 		return retval;
@@ -246,13 +226,13 @@ static int rt5682_sdw_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!rt5682->slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(rt5682->slave, stream->sdw_stream);
+	sdw_stream_remove_slave(rt5682->slave, sdw_stream);
 	return 0;
 }
 
-- 
2.25.1

