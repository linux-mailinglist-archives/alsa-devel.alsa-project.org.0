Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDCF6C751B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:35:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86749ECF;
	Fri, 24 Mar 2023 02:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86749ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621712;
	bh=JmvCMuX6e+m5zMDfnYICrToLMhkiiVCRyDfYnN8XDzc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gp4T4v2a1H7lugu9NPurjtqS+O+VV2+II1buUbS73JLV1rNd2QpLF2hZPzTO6mqa/
	 nggJFO6gRWaOvxB0ys3ji7WIaIvZ2rVA/fBCIk14yiZicN1tl3+OT0HWZGfSYjW9zt
	 TEx+Ddm2AI9l+UTreo12ckwkzgSb7NrT2dPNmHjc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F8D3F80534;
	Fri, 24 Mar 2023 02:33:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9AD6F8052E; Fri, 24 Mar 2023 02:33:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6822F804B1
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6822F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F2DX2Zd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621351; x=1711157351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JmvCMuX6e+m5zMDfnYICrToLMhkiiVCRyDfYnN8XDzc=;
  b=F2DX2Zd5E5pV0RpA/8i2Nny72JX8uUdIbQ0czgyCG+rVoI4vRRp+bnMy
   cnhXgmU0oZ2dgIC+QjBsEV80hB8YVlJ0/4rBXVoiuOejB1wZrq1ZJyEPH
   uETwZM+JeETFwBzOJAjRtuhY5lygJld79yFPgm4QmeCB5o2zCLafSMY9J
   8hw113a3/grO0uCQ66oXKArAtiJzCeSJKOKWLip3z4gZ1Q6vfw7qeWMZk
   QcQCa3S2BoUJyRkLzJ1A3ZTgARYNTnqputX3nQ6vLGqx+l7sWj4dWlRV1
   a6Eq+ZIsGsvoGxvpExKq45I2g3PUqeUQZlxR6w9kytSShqKz2HHQnP4oA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584894"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584894"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873112"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873112"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 08/13] ASoC: codecs: rt711-sdw: simplify set_stream
Date: Fri, 24 Mar 2023 09:44:03 +0800
Message-Id: <20230324014408.1677505-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OFPM72IHSZUV5MLFWJGVO742KSEJRCZ5
X-Message-ID-Hash: OFPM72IHSZUV5MLFWJGVO742KSEJRCZ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OFPM72IHSZUV5MLFWJGVO742KSEJRCZ5/>
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
 sound/soc/codecs/rt711.c | 30 +++++++-----------------------
 sound/soc/codecs/rt711.h |  4 ----
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 862f50950565..af53cbcc7bf2 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -964,19 +964,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rt711 = {
 static int rt711_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
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
@@ -984,11 +972,7 @@ static int rt711_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 static void rt711_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -999,14 +983,14 @@ static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
 	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config = {0};
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int retval;
 	unsigned int val = 0;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
-	stream = snd_soc_dai_get_dma_data(dai, substream);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!rt711->slave)
@@ -1027,7 +1011,7 @@ static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	retval = sdw_stream_add_slave(rt711->slave, &stream_config,
-					&port_config, 1, stream->sdw_stream);
+					&port_config, 1, sdw_stream);
 	if (retval) {
 		dev_err(dai->dev, "Unable to configure port\n");
 		return retval;
@@ -1075,13 +1059,13 @@ static int rt711_pcm_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!rt711->slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(rt711->slave, stream->sdw_stream);
+	sdw_stream_remove_slave(rt711->slave, sdw_stream);
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711.h b/sound/soc/codecs/rt711.h
index f50f8c8d0934..b31351f11df9 100644
--- a/sound/soc/codecs/rt711.h
+++ b/sound/soc/codecs/rt711.h
@@ -29,10 +29,6 @@ struct  rt711_priv {
 	bool disable_irq;
 };
 
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 /* NID */
 #define RT711_AUDIO_FUNCTION_GROUP			0x01
 #define RT711_DAC_OUT2					0x03
-- 
2.25.1

