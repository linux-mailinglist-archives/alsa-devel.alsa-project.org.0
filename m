Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44082720AA6
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CCC21FE;
	Fri,  2 Jun 2023 22:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CCC21FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739554;
	bh=PUNzmzUck5debaFGlBrujH8YEJw7myLfV7V+Ty8IITk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=URdwFlZbl2e3kIIBHgW/l/xtebbRagnyQAEbztSbF1SFvrbWjyMDbGrq7SrNLpYw2
	 I6bnmfunG4cTtYWJaDTfavxI9GejRoZbYkYIM10ianBi1fIDGd363rP15SWYeKf9Ip
	 /KyzSNCByCOtQ5KAQD2soItAxdk2VNDdHbMzS9mg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CA78F805AE; Fri,  2 Jun 2023 22:56:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E646CF805A8;
	Fri,  2 Jun 2023 22:56:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F158F80199; Fri,  2 Jun 2023 22:56:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72A14F8016B
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A14F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ixs7SQFm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739400; x=1717275400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUNzmzUck5debaFGlBrujH8YEJw7myLfV7V+Ty8IITk=;
  b=ixs7SQFmBp9IqP/D9ew7Pk8QDKoFZH2vUUsYrpgO8gCqFm9VvdNqzDTA
   hHgekZxc0MmyX8OquL+Tum+/faQrBgKbvif0cW42y9KnoAMNi2lrfARiE
   +N8S9nWqha5D+KrIDsRNyQHTMEQ1mvLPw0OZJ5Wee1nrlqkF+M8VEu5md
   KSRUEcQAMmZlHNJZsEqE1iPkQU0W0kxIhEMQjRnefMos+gHRMf/1RHpSs
   bBVj1PYPEgi2PnJPg8qkG2+iNdS4QvxN2GVCS31ulny6Xouogy5mfLmVj
   jm3KMU5MB884s3UtiAyWx77Xl0/GhN5d8opeTJhmDtE1Isqa9ZKOLUaep
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272091"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272091"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092703"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092703"
Received: from sbalabha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 4/9] ASoC: SOF: Intel: hda-dai: add get_hlink callback
Date: Fri,  2 Jun 2023 15:56:15 -0500
Message-Id: <20230602205620.310879-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3L5XNRFB6BLZ3DCXZ5YILHFM3HGGNTIF
X-Message-ID-Hash: 3L5XNRFB6BLZ3DCXZ5YILHFM3HGGNTIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3L5XNRFB6BLZ3DCXZ5YILHFM3HGGNTIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code for HDAudio DAIs cannot be extended to other types
of DAIs, specific programming sequences need to be abstracted
away.

This patch hides the mechanism to determine the multi-link structure
related to the DAI and program the LOSIDV register. An added benefit
is that we can remove all references to the codec DAI from what should
be a CPU dai configuration only.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 14 ++++++++++++++
 sound/soc/sof/intel/hda-dai.c     | 28 ++++++----------------------
 sound/soc/sof/intel/hda.h         |  4 ++++
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 88fee1e256b0..f3513796c189 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -209,6 +209,16 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 	return format_val;
 }
 
+static struct hdac_ext_link *hda_get_hlink(struct snd_sof_dev *sdev,
+					   struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	return snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
+}
+
 static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				struct snd_pcm_substream *substream, int cmd)
 {
@@ -344,6 +354,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.post_trigger = hda_ipc4_post_trigger,
 	.codec_dai_set_stream = hda_codec_dai_set_stream,
 	.calc_stream_format = hda_calc_stream_format,
+	.get_hlink = hda_get_hlink,
 };
 
 static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
@@ -355,6 +366,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
 	.trigger = hda_trigger,
 	.codec_dai_set_stream = hda_codec_dai_set_stream,
 	.calc_stream_format = hda_calc_stream_format,
+	.get_hlink = hda_get_hlink,
 };
 
 static int hda_ipc3_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
@@ -390,6 +402,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc3_dma_ops = {
 	.post_trigger = hda_ipc3_post_trigger,
 	.codec_dai_set_stream = hda_codec_dai_set_stream,
 	.calc_stream_format = hda_calc_stream_format,
+	.get_hlink = hda_get_hlink,
 };
 
 static struct hdac_ext_stream *
@@ -418,6 +431,7 @@ static const struct hda_dai_widget_dma_ops hda_dspless_dma_ops = {
 	.setup_hext_stream = hda_dspless_setup_hext_stream,
 	.codec_dai_set_stream = hda_codec_dai_set_stream,
 	.calc_stream_format = hda_calc_stream_format,
+	.get_hlink = hda_get_hlink,
 };
 
 #endif
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index d9a77a253350..3297dea493aa 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -109,12 +109,9 @@ hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai
 
 static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 				struct hdac_ext_stream *hext_stream,
-				struct snd_soc_dai *cpu_dai,
-				struct snd_soc_dai *codec_dai)
+				struct snd_soc_dai *cpu_dai)
 {
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
-	struct hdac_stream *hstream = &hext_stream->hstream;
-	struct hdac_bus *bus = hstream->bus;
 	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_ext_link *hlink;
 	struct snd_sof_dev *sdev;
@@ -127,7 +124,7 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 
 	sdev = dai_to_sdev(substream, cpu_dai);
 
-	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
+	hlink = ops->get_hlink(sdev, substream);
 	if (!hlink)
 		return -EINVAL;
 
@@ -152,13 +149,10 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params, struct snd_soc_dai *cpu_dai)
 {
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
 	struct hdac_ext_link *hlink;
 	struct snd_sof_dev *sdev;
-	struct hdac_bus *bus;
 	int stream_tag;
 
 	if (!ops) {
@@ -167,9 +161,8 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	sdev = dai_to_sdev(substream, cpu_dai);
-	bus = sof_to_bus(sdev);
 
-	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
+	hlink = ops->get_hlink(sdev, substream);
 	if (!hlink)
 		return -EINVAL;
 
@@ -211,8 +204,6 @@ static int __maybe_unused hda_dai_hw_free(struct snd_pcm_substream *substream,
 					  struct snd_soc_dai *cpu_dai)
 {
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream;
 	struct snd_sof_dev *sdev = dai_to_sdev(substream, cpu_dai);
 
@@ -225,7 +216,7 @@ static int __maybe_unused hda_dai_hw_free(struct snd_pcm_substream *substream,
 	if (!hext_stream)
 		return 0;
 
-	return hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai);
+	return hda_link_dma_cleanup(substream, hext_stream, cpu_dai);
 }
 
 static int __maybe_unused hda_dai_hw_params(struct snd_pcm_substream *substream,
@@ -270,8 +261,6 @@ static int __maybe_unused hda_dai_trigger(struct snd_pcm_substream *substream, i
 {
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
 	struct hdac_ext_stream *hext_stream;
-	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai *codec_dai;
 	struct snd_sof_dev *sdev;
 	int ret;
 
@@ -289,9 +278,6 @@ static int __maybe_unused hda_dai_trigger(struct snd_pcm_substream *substream, i
 	if (!hext_stream)
 		return -EINVAL;
 
-	rtd = asoc_substream_to_rtd(substream);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
-
 	if (ops->pre_trigger) {
 		ret = ops->pre_trigger(sdev, dai, substream, cmd);
 		if (ret < 0)
@@ -312,7 +298,7 @@ static int __maybe_unused hda_dai_trigger(struct snd_pcm_substream *substream, i
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		ret = hda_link_dma_cleanup(substream, hext_stream, dai, codec_dai);
+		ret = hda_link_dma_cleanup(substream, hext_stream, dai);
 		if (ret < 0) {
 			dev_err(sdev->dev, "%s: failed to clean up link DMA\n", __func__);
 			return ret;
@@ -366,14 +352,12 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			const struct hda_dai_widget_dma_ops *ops;
 			struct snd_sof_widget *swidget;
 			struct snd_soc_dapm_widget *w;
-			struct snd_soc_dai *codec_dai;
 			struct snd_soc_dai *cpu_dai;
 			struct snd_sof_dev *sdev;
 			struct snd_sof_dai *sdai;
 
 			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
 			cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-			codec_dai = asoc_rtd_to_codec(rtd, 0);
 			w = snd_soc_dai_get_widget(cpu_dai, hdac_stream(hext_stream)->direction);
 			swidget = w->dobj.private;
 			sdev = widget_to_sdev(w);
@@ -382,7 +366,7 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 
 			ret = hda_link_dma_cleanup(hext_stream->link_substream,
 						   hext_stream,
-						   cpu_dai, codec_dai);
+						   cpu_dai);
 			if (ret < 0)
 				return ret;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7a3d202f970e..8ca43303d97f 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -922,6 +922,8 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
  * @codec_dai_set_stream: Function pointer to set codec-side stream information
  * @calc_stream_format: Function pointer to determine stream format from hw_params and
  * for HDaudio codec DAI from the .sig bits
+ * @get_hlink: Mandatory function pointer to retrieve hlink, mainly to program LOSIDV
+ * for legacy HDaudio links or program HDaudio Extended Link registers.
  */
 struct hda_dai_widget_dma_ops {
 	struct hdac_ext_stream *(*get_hext_stream)(struct snd_sof_dev *sdev,
@@ -947,6 +949,8 @@ struct hda_dai_widget_dma_ops {
 	unsigned int (*calc_stream_format)(struct snd_sof_dev *sdev,
 					   struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params);
+	struct hdac_ext_link * (*get_hlink)(struct snd_sof_dev *sdev,
+					    struct snd_pcm_substream *substream);
 };
 
 const struct hda_dai_widget_dma_ops *
-- 
2.37.2

