Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F056C750B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:32:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64054EEB;
	Fri, 24 Mar 2023 02:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64054EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621538;
	bh=rXzyOVa6hGhSz8CheEMCIVTNqh5vslmX0LZ52J+Uwag=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q8mAtHQE9qwwgM+cSDXSSNkxsldH8PlJO/jJScRxNLY63mL1CEG8YA3Om46aPnJDi
	 KZvM7SDRxWzRxrveHeCD7DHYVX0xohLm/B8atsa6gltx67hvcdJcRjhtrNdIWpnbZv
	 5pvQV79ERLRdckW21wicyemIEB5SsUDlZinVBEpo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E9B5F8057A;
	Fri, 24 Mar 2023 02:29:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F863F80564; Fri, 24 Mar 2023 02:29:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91F01F8051B
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F01F8051B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U5oS4hlD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621346; x=1711157346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rXzyOVa6hGhSz8CheEMCIVTNqh5vslmX0LZ52J+Uwag=;
  b=U5oS4hlD8s3Y6zJC/g/fhqC6GrQgT8KdZcsrLuTlXq+kF19vXTwc3uEc
   NL3+1LeqtKU2vEzBAB3A1vFCPrPO53UCjMdyI/1wueL2M/6laLdZ3hpzI
   7A7ge3gPStsvmWtkgPkO3dojaFqrqMzn+2aTAPK9y1jsLQM+Y54vuR2uy
   +rXfFxahyL03Iu5zbGYZiaMEAJA4M4FM8TdZU6LrPuzQ1pfR1owEFcw/q
   5UWe6nKhUyyElz6TqrtmQjjvhHqKMJBNlJ2jwFMv+cIoncobeguxbyhDY
   XCPlMfSNRJZn3YWIQ0bziSPnemirwxRIS4uC17cNlhtTB3BP3o521idbG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584857"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873004"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873004"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:28:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 03/13] ASoC: codecs: max98373-sdw: simplify set_stream
Date: Fri, 24 Mar 2023 09:43:58 +0800
Message-Id: <20230324014408.1677505-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVTQ75JMKEJ7PKWSZDSGDANHRTJFN7X2
X-Message-ID-Hash: FVTQ75JMKEJ7PKWSZDSGDANHRTJFN7X2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVTQ75JMKEJ7PKWSZDSGDANHRTJFN7X2/>
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
 sound/soc/codecs/max98373-sdw.c | 34 +++++++--------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index c9a2d4dabd3c..df92242af960 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -20,10 +20,6 @@
 #include "max98373.h"
 #include "max98373-sdw.h"
 
-struct sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 static const u32 max98373_sdw_cache_reg[] = {
 	MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK,
 	MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK,
@@ -536,12 +532,12 @@ static int max98373_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_component_get_drvdata(component);
 	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config = {0};
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int ret, chan_sz, sampling_rate;
 
-	stream = snd_soc_dai_get_dma_data(dai, substream);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!max98373->slave)
@@ -565,7 +561,7 @@ static int max98373_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	ret = sdw_stream_add_slave(max98373->slave, &stream_config,
-				   &port_config, 1, stream->sdw_stream);
+				   &port_config, 1, sdw_stream);
 	if (ret) {
 		dev_err(dai->dev, "Unable to configure port\n");
 		return ret;
@@ -664,32 +660,20 @@ static int max98373_pcm_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct max98373_priv *max98373 =
 		snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!max98373->slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(max98373->slave, stream->sdw_stream);
+	sdw_stream_remove_slave(max98373->slave, sdw_stream);
 	return 0;
 }
 
 static int max98373_set_sdw_stream(struct snd_soc_dai *dai,
 				   void *sdw_stream, int direction)
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
@@ -697,11 +681,7 @@ static int max98373_set_sdw_stream(struct snd_soc_dai *dai,
 static void max98373_shutdown(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int max98373_sdw_set_tdm_slot(struct snd_soc_dai *dai,
-- 
2.25.1

