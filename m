Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D66C7511
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F213EDA;
	Fri, 24 Mar 2023 02:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F213EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621568;
	bh=EhPGLULuW9pAHe2m6xpGbV+FDNHJ7OCZ9/lWWPOGb14=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ssX8I3fDWBfgt/NHRjVYLyNfopGP70oxpzoL/PsbNwob2wbM3chHzw5qM+LyyLYDW
	 PszO4QMKM1Iz6mZq4eRl0HIF5f8zYBUZCE+KIHOsxCsxW+LiToFRxYivClxoGuslEG
	 FICQuXAh5/P0VYeyQAFsOSHACNFwjsV0gaa+EsCQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E1CCF8027B;
	Fri, 24 Mar 2023 02:29:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EC6AF8057D; Fri, 24 Mar 2023 02:29:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BBD5F80093
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BBD5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A3DW2COH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621357; x=1711157357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EhPGLULuW9pAHe2m6xpGbV+FDNHJ7OCZ9/lWWPOGb14=;
  b=A3DW2COHPlbxWRvIMhzjLLX15lPHm0DO9UMK26l0AO/pt9CEf1G6SYHb
   ds1O7bY7tZdEmHICKisnPFOR+607NWnI8S1oSX1rSJ4gKu8i5jmiBdUdb
   oH2Ur6pkQ8P3eLTUdAM1bHF7ko/H1IiEkyrzL/lh9oyASI8QfSb/XZ0eF
   VJMyhN1eIDwEBLm3yvaU4RpsPb+ZKKM2Vw8cwMbGizusy52Bg7zcPyJ/5
   +sJyzCg9wcgi0G96ePGpxQY2gV2t7Q4myezvMwEJEvVC93Vu0EGWsi8HP
   boXmVT/g4t8WwWdT3F4vuC1uAAXAiqisu0JO8tburSl6rDdqAruz2wAT1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584915"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584915"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873144"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873144"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:12 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 11/13] ASoC: codecs: rt715: simplify set_stream
Date: Fri, 24 Mar 2023 09:44:06 +0800
Message-Id: <20230324014408.1677505-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PZD4QAVMHTKIW5VZ7FM6LXTLWWJNY3AT
X-Message-ID-Hash: PZD4QAVMHTKIW5VZ7FM6LXTLWWJNY3AT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZD4QAVMHTKIW5VZ7FM6LXTLWWJNY3AT/>
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
 sound/soc/codecs/rt715.c | 30 +++++++-----------------------
 sound/soc/codecs/rt715.h |  4 ----
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index c6dd9df7be45..6c2e165dd621 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -765,19 +765,7 @@ static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
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
@@ -786,11 +774,7 @@ static void rt715_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -801,13 +785,13 @@ static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
 	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config = {0};
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int retval;
 	unsigned int val = 0;
 
-	stream = snd_soc_dai_get_dma_data(dai, substream);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!rt715->slave)
@@ -830,7 +814,7 @@ static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	retval = sdw_stream_add_slave(rt715->slave, &stream_config,
-					&port_config, 1, stream->sdw_stream);
+					&port_config, 1, sdw_stream);
 	if (retval) {
 		dev_err(dai->dev, "Unable to configure port\n");
 		return retval;
@@ -893,13 +877,13 @@ static int rt715_pcm_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!rt715->slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(rt715->slave, stream->sdw_stream);
+	sdw_stream_remove_slave(rt715->slave, sdw_stream);
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
index 25dba61f1760..17a8d041c1c3 100644
--- a/sound/soc/codecs/rt715.h
+++ b/sound/soc/codecs/rt715.h
@@ -27,10 +27,6 @@ struct rt715_priv {
 	unsigned int kctl_8ch_vol_ori[8];
 };
 
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 /* NID */
 #define RT715_AUDIO_FUNCTION_GROUP			0x01
 #define RT715_MIC_ADC					0x07
-- 
2.25.1

