Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966426C750C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0994EEF0;
	Fri, 24 Mar 2023 02:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0994EEF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621547;
	bh=XogbEGQswLLwbWo+zFayUbHp660Ev5saiURsiWedWB8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LhEEs7TKXZW5TjsWDnmqzTSobuJkPJZByruM6PvXiJsNocVP+A/TM/VaPByjT4Ym9
	 3AnPB6TdNkOrLgslbUcFP0031U58bJzSgNQV2fas0cVuS/ZsXqPyTZFLQuQC42lGa2
	 eyixHPJSo6RoG+VY2NF93uqTlormnPA3CdWKp+ac=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F4132F8056F;
	Fri, 24 Mar 2023 02:29:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4F8EF8057E; Fri, 24 Mar 2023 02:29:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11372F8027B
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11372F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Js76HBpl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621355; x=1711157355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XogbEGQswLLwbWo+zFayUbHp660Ev5saiURsiWedWB8=;
  b=Js76HBplKrLFKHklqsTkHWNC+VFHhvcXSwfhsHWGhxPnTNuNAwv2030f
   1fqTr0dF/ednWPEfB1HoLHLcY1viMtYVauLQT+NBW53WGQOcNighOBR7d
   6+/Kx3YQChOuzUICdvrm4c4yA7a5eOdmZBuEfxIZ94/mgOFAI7TCnZgep
   v3ZWfNiLj82ayJi7Ivlx7BNwe2MgXLG+fdEOxtCrRKBIoYK46slv+A1tD
   ZKO2JsECTvm2PgvMQlkH1/9UdxE92A17sCox9K6bwnf7yFjd0Nf5HbRQ0
   wzqjE1wh7BaWUcNR3xB8DECSTxmdFEJSbrMM8Vxc4vvZu97OsOyvutM/s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584909"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584909"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873132"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873132"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 10/13] ASoC: codecs: rt712-sdca: simplify set_stream
Date: Fri, 24 Mar 2023 09:44:05 +0800
Message-Id: <20230324014408.1677505-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CLYE6CVMOKEB3EKFW67O75EGZJF4G2J5
X-Message-ID-Hash: CLYE6CVMOKEB3EKFW67O75EGZJF4G2J5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLYE6CVMOKEB3EKFW67O75EGZJF4G2J5/>
List-Archive: <>
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
 sound/soc/codecs/rt712-sdca.c | 30 +++++++-----------------------
 sound/soc/codecs/rt712-sdca.h |  4 ----
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 8d2fa769bb2e..89d245655ca4 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -992,19 +992,7 @@ static const struct snd_soc_component_driver soc_sdca_dev_rt712 = {
 static int rt712_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
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
@@ -1012,11 +1000,7 @@ static int rt712_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 static void rt712_sdca_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -1028,14 +1012,14 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_stream_config stream_config;
 	struct sdw_port_config port_config;
 	enum sdw_data_direction direction;
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int retval, port, num_channels;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
-	stream = snd_soc_dai_get_dma_data(dai, substream);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!rt712->slave)
@@ -1068,7 +1052,7 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	port_config.num = port;
 
 	retval = sdw_stream_add_slave(rt712->slave, &stream_config,
-					&port_config, 1, stream->sdw_stream);
+					&port_config, 1, sdw_stream);
 	if (retval) {
 		dev_err(dai->dev, "Unable to configure port\n");
 		return retval;
@@ -1128,13 +1112,13 @@ static int rt712_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!rt712->slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(rt712->slave, stream->sdw_stream);
+	sdw_stream_remove_slave(rt712->slave, sdw_stream);
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index cf647162f9da..c6a94a23f46e 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -40,10 +40,6 @@ struct  rt712_sdca_priv {
 	bool fu0f_mixer_r_mute;
 };
 
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 /* NID */
 #define RT712_VENDOR_REG			0x20
 #define RT712_VENDOR_CALI			0x58
-- 
2.25.1

