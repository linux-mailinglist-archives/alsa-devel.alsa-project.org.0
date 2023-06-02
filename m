Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857C720AA5
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6508886;
	Fri,  2 Jun 2023 22:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6508886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739530;
	bh=ucw2vAtS9Y9TO+J0+PxaCqYqbPNawSbbv/OS3KCN9Qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OL2PdwbBaowlTKi4w6/Rj5YhP3RAj6HZsHpj9/ixtW3jkxYTfmLaMoRkUURoJbVBG
	 kmxVeoe5Knep0BeM6fc42kPCn2r2jT9tziLW/Fl8aEUOiQrOHw0kNaR30w7B2PyPTw
	 LktKPlUuegA+d++sTGZqTfkVtLqQc3bOoDARGP+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF3A3F80579; Fri,  2 Jun 2023 22:56:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C87F80579;
	Fri,  2 Jun 2023 22:56:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 208F8F80132; Fri,  2 Jun 2023 22:56:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D72AAF800ED
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D72AAF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=niqIxSYZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739400; x=1717275400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ucw2vAtS9Y9TO+J0+PxaCqYqbPNawSbbv/OS3KCN9Qk=;
  b=niqIxSYZ4xxMGcnFnabtowme+Tz8imT5smE6kjCC/2ynE0Wx4aYsfnbO
   5SpQ/qDzwsO5dAzQL7YKs5DSa9gbCTqIvwD4ShYW24+3laxowp7+tBvqq
   5drr3vokrG5nEVA6nxr60+Wa+bA1MazlNArzNnWEbXfnJwLO9aORATfX0
   q6jerHqi7pmKmnv7aFAKJ5UfK+PXeUL217l0pBS8i4sGaoujU0Kzy6R+R
   echjsQ7jA/9e5GRfUOMiP6nJ/wCO/obJ/uM4xQPCq+Kt55jCG6TeXLNAH
   5/0K7ENvigIl+DNXK9B1RmjE43MbBCOaYC6kY3PUXw55UjtJmZTarMf/d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272086"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272086"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092695"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092695"
Received: from sbalabha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/9] ASoC: SOF: Intel: hda-dai: add calc_stream_format
 callback
Date: Fri,  2 Jun 2023 15:56:14 -0500
Message-Id: <20230602205620.310879-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7IGZWLIMKL7TPUJBG7UJVEFA7LFYMZTJ
X-Message-ID-Hash: 7IGZWLIMKL7TPUJBG7UJVEFA7LFYMZTJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IGZWLIMKL7TPUJBG7UJVEFA7LFYMZTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code for HDAudio DAIs cannot be extended to other types
of DAIs, specific programming sequences need to be abstracted away.

This patch hides the stream format setup which is currently completely
related to the HDaudio codec setup - not something that will work for
other types of DAIs.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 27 +++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-dai.c     | 16 +++-------------
 sound/soc/sof/intel/hda.h         |  5 +++++
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 2d2953cee1d8..88fee1e256b0 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -186,6 +186,29 @@ static void hda_codec_dai_set_stream(struct snd_sof_dev *sdev,
 	snd_soc_dai_set_stream(codec_dai, hstream, substream->stream);
 }
 
+static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
+					   struct snd_pcm_substream *substream,
+					   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int link_bps;
+	unsigned int format_val;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		link_bps = codec_dai->driver->playback.sig_bits;
+	else
+		link_bps = codec_dai->driver->capture.sig_bits;
+
+	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
+						 params_format(params), link_bps, 0);
+
+	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
+		params_rate(params), params_channels(params), params_format(params));
+
+	return format_val;
+}
+
 static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				struct snd_pcm_substream *substream, int cmd)
 {
@@ -320,6 +343,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.trigger = hda_trigger,
 	.post_trigger = hda_ipc4_post_trigger,
 	.codec_dai_set_stream = hda_codec_dai_set_stream,
+	.calc_stream_format = hda_calc_stream_format,
 };
 
 static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
@@ -330,6 +354,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
 	.reset_hext_stream = hda_reset_hext_stream,
 	.trigger = hda_trigger,
 	.codec_dai_set_stream = hda_codec_dai_set_stream,
+	.calc_stream_format = hda_calc_stream_format,
 };
 
 static int hda_ipc3_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
@@ -364,6 +389,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc3_dma_ops = {
 	.trigger = hda_trigger,
 	.post_trigger = hda_ipc3_post_trigger,
 	.codec_dai_set_stream = hda_codec_dai_set_stream,
+	.calc_stream_format = hda_calc_stream_format,
 };
 
 static struct hdac_ext_stream *
@@ -391,6 +417,7 @@ static const struct hda_dai_widget_dma_ops hda_dspless_dma_ops = {
 	.get_hext_stream = hda_dspless_get_hext_stream,
 	.setup_hext_stream = hda_dspless_setup_hext_stream,
 	.codec_dai_set_stream = hda_codec_dai_set_stream,
+	.calc_stream_format = hda_calc_stream_format,
 };
 
 #endif
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 0c018644347e..d9a77a253350 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -159,8 +159,6 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_ext_link *hlink;
 	struct snd_sof_dev *sdev;
 	struct hdac_bus *bus;
-	unsigned int format_val;
-	unsigned int link_bps;
 	int stream_tag;
 
 	if (!ops) {
@@ -195,22 +193,14 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	if (ops->codec_dai_set_stream)
 		ops->codec_dai_set_stream(sdev, substream, hstream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		link_bps = codec_dai->driver->playback.sig_bits;
-	else
-		link_bps = codec_dai->driver->capture.sig_bits;
-
 	if (ops->reset_hext_stream)
 		ops->reset_hext_stream(sdev, hext_stream);
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params), link_bps, 0);
+	if (ops->calc_stream_format && ops->setup_hext_stream) {
+		unsigned int format_val = ops->calc_stream_format(sdev, substream, params);
 
-	dev_dbg(bus->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
-		params_rate(params), params_channels(params), params_format(params));
-
-	if (ops->setup_hext_stream)
 		ops->setup_hext_stream(sdev, hext_stream, format_val);
+	}
 
 	hext_stream->link_prepared = 1;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 02d935daab28..7a3d202f970e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -920,6 +920,8 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
  * @trigger: Function pointer for DAI DMA trigger actions
  * @post_trigger: Function pointer for DAI DMA post-trigger actions
  * @codec_dai_set_stream: Function pointer to set codec-side stream information
+ * @calc_stream_format: Function pointer to determine stream format from hw_params and
+ * for HDaudio codec DAI from the .sig bits
  */
 struct hda_dai_widget_dma_ops {
 	struct hdac_ext_stream *(*get_hext_stream)(struct snd_sof_dev *sdev,
@@ -942,6 +944,9 @@ struct hda_dai_widget_dma_ops {
 	void (*codec_dai_set_stream)(struct snd_sof_dev *sdev,
 				     struct snd_pcm_substream *substream,
 				     struct hdac_stream *hstream);
+	unsigned int (*calc_stream_format)(struct snd_sof_dev *sdev,
+					   struct snd_pcm_substream *substream,
+					   struct snd_pcm_hw_params *params);
 };
 
 const struct hda_dai_widget_dma_ops *
-- 
2.37.2

