Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F69E6C7519
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 02:34:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E532FECA;
	Fri, 24 Mar 2023 02:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E532FECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679621662;
	bh=a0Hd+9i5i1nzEknPIsiDafrA0TcSFlMSYteGFBuA59M=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IzWTk4tsZ/5h3wd4D5pIS7RL8hpEsc6L2i+FN/O56SDeEkIuB9P46mKhuGtGuYbij
	 VNg2x/E4bmCG+hdO00bJrj63OFvMbJ+L+Cm2o5+yr78DE7A05ioMXg5EvDwvF1LI4X
	 8OaAOR7AdBoVCFGe3duhtC9g3EB44GxFdMP/3EJU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A47FEF800C9;
	Fri, 24 Mar 2023 02:33:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C25D5F800C9; Fri, 24 Mar 2023 02:33:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9B0AF80527
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 02:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B0AF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z6C3/9NK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679621353; x=1711157353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a0Hd+9i5i1nzEknPIsiDafrA0TcSFlMSYteGFBuA59M=;
  b=Z6C3/9NK36W0TenuReiBLPf0DpjIyQf3bMmcIQvoI2tkcnxiru9ABC17
   BYoT2KTMb0PiVTpihlGIiO4hxa8YBdO1UBCPp+O+b6GAiKDomw/nYgBfW
   ggWU9RDhOHaNh1CEYYIK4tLJ9v8GfWAnuPZZGj7vwOrALovWLYKvIDBrt
   EtPwtZ+kEMEw9+XgfP+li/kGNZkdS3g1d74DMF/eb3/BtBIepYlKvG61P
   Y6Tvm4ihmMg/pPfisJfUBkyuQDxs7+Lrbz89p3l93PK6Ft1Ct4EedSTdj
   BLY4MXukrjyW31wG032W03b76E4V88pYEqgGmYMnrTf94qlGwId5UKgEL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404584901"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="404584901"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659873122"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400";
   d="scan'208";a="659873122"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:29:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 09/13] ASoC: codecs: rt711-sdca: simplify set_stream
Date: Fri, 24 Mar 2023 09:44:04 +0800
Message-Id: <20230324014408.1677505-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SKB5YY4W6CVQZYQRV3L7ADUHHTSQHZT6
X-Message-ID-Hash: SKB5YY4W6CVQZYQRV3L7ADUHHTSQHZT6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKB5YY4W6CVQZYQRV3L7ADUHHTSQHZT6/>
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
 sound/soc/codecs/rt711-sdca.c | 30 +++++++-----------------------
 sound/soc/codecs/rt711-sdca.h |  4 ----
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index c65abe812a4c..07640d2f6e56 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1237,19 +1237,7 @@ static const struct snd_soc_component_driver soc_sdca_dev_rt711 = {
 static int rt711_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
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
@@ -1257,11 +1245,7 @@ static int rt711_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 static void rt711_sdca_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct sdw_stream_data *stream;
-
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	kfree(stream);
 }
 
 static int rt711_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -1272,14 +1256,14 @@ static int rt711_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
 	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config = {0};
-	struct sdw_stream_data *stream;
+	struct sdw_stream_runtime *sdw_stream;
 	int retval;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
-	stream = snd_soc_dai_get_dma_data(dai, substream);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!stream)
+	if (!sdw_stream)
 		return -EINVAL;
 
 	if (!rt711->slave)
@@ -1300,7 +1284,7 @@ static int rt711_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	retval = sdw_stream_add_slave(rt711->slave, &stream_config,
-					&port_config, 1, stream->sdw_stream);
+					&port_config, 1, sdw_stream);
 	if (retval) {
 		dev_err(dai->dev, "Unable to configure port\n");
 		return retval;
@@ -1351,13 +1335,13 @@ static int rt711_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_data *stream =
+	struct sdw_stream_runtime *sdw_stream =
 		snd_soc_dai_get_dma_data(dai, substream);
 
 	if (!rt711->slave)
 		return -EINVAL;
 
-	sdw_stream_remove_slave(rt711->slave, stream->sdw_stream);
+	sdw_stream_remove_slave(rt711->slave, sdw_stream);
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 10e3c801b813..22076f268577 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -36,10 +36,6 @@ struct  rt711_sdca_priv {
 	bool fu1e_dapm_mute, fu1e_mixer_l_mute, fu1e_mixer_r_mute;
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

