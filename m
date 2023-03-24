Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E66C7514
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:33:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D59ED9;
	Fri, 24 Mar 2023 02:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D59ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621587;
	bh=o4qd2sv2ZOppsjBTKo/y1CYVg/dHsho3gT1BEbOKJc8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qak8+22ZrDy+GMS3CzKfZJsuyLrds+12OzPXILYWAoOjP6vzqfn3YEOa/ShWzgxUH
	 f9QC2qokC5A5aGfLx28tzscEsD4qK2B0xSIAGLFvTdzqE1ZmVFCUNuROciC1bX21v3
	 2THjoic9UWN/s5xADQDL8CCM74/XedzMsw22QgwI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7121CF8052E;
	Fri, 24 Mar 2023 02:30:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CC83F80580; Fri, 24 Mar 2023 02:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D67AAF80529
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D67AAF80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dADXlDTK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621358; x=1711157358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o4qd2sv2ZOppsjBTKo/y1CYVg/dHsho3gT1BEbOKJc8=;
  b=dADXlDTKeO9uuSNPtKNQXD9rR/Vcpl0pi3sKRdZWQ84xY/3Z4ms1DVN8
   p6icJEd1HsHPu7taE3i+dBGuqviYnu7crCRG2TTbWjRRUqHGawlnoDO8W
   Awy7i7XsaRKc03LUQJFcaDnZvdzBf3FWiOeLe8bCw+CKw6g2ykcDr5d5u
   HYoE1TwtU93EihBVYOBkcqZHNhM/uIziCusKQvO+Ne63lfEQWAp5juN7Z
   hEPuVbwTl+emp+PU6NCr9QXYifGLkX9jnpioWQ3syOZM5OVpGbBtAm+g2
   EYapmJjnDT9kgWAvtYzGEjeIJ4ShvW//UUcgNPQfZ9AtrZIO+DagC3tVc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584928"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584928"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873150"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873150"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 12/13] ASoC: codecs: rt715-sdca: simplify set_stream
Date: Fri, 24 Mar 2023 09:44:07 +0800
Message-Id: <20230324014408.1677505-13-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 67ZHRPQCRXOOH4H2VSAL4E3XYJBBFSJR
X-Message-ID-Hash: 67ZHRPQCRXOOH4H2VSAL4E3XYJBBFSJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67ZHRPQCRXOOH4H2VSAL4E3XYJBBFSJR/>
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
 sound/soc/codecs/rt715-sdca.c | 30 +++++++-----------------------
 sound/soc/codecs/rt715-sdca.h |  4 ----
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 920510365fd7..b989f907784b 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -784,16 +784,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rt715_sdca = {
 static int rt715_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 				int direction)
 {
-	struct rt715_sdw_stream_data *stream;
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
@@ -802,14 +793,7 @@ static void rt715_sdca_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 
 {
-	struct rt715_sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
-	if (!stream)
-		return;
-
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -820,13 +804,13 @@ static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
 	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config = {0};
-	struct rt715_sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int retval;
 	unsigned int val;
 
-	stream = snd_soc_dai_get_dma_data(dai, substream);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!rt715->slave)
@@ -851,7 +835,7 @@ static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	retval = sdw_stream_add_slave(rt715->slave, &stream_config,
-					&port_config, 1, stream->sdw_stream);
+					&port_config, 1, sdw_stream);
 	if (retval) {
 		dev_err(component->dev, "Unable to configure port, retval:%d\n",
 			retval);
@@ -922,13 +906,13 @@ static int rt715_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
-	struct rt715_sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!rt715->slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(rt715->slave, stream->sdw_stream);
+	sdw_stream_remove_slave(rt715->slave, sdw_stream);
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.h
index 90881b455ece..7577f3151934 100644
--- a/sound/soc/codecs/rt715-sdca.h
+++ b/sound/soc/codecs/rt715-sdca.h
@@ -37,10 +37,6 @@ struct rt715_sdca_priv {
 	int kctl_8ch_orig[8];
 };
 
-struct rt715_sdw_stream_data {
-	struct sdw_stream_runtime *sdw_stream;
-};
-
 struct rt715_sdca_kcontrol_private {
 	unsigned int reg_base;
 	unsigned int count;
-- 
2.25.1

