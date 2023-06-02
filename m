Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E3720AA2
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:58:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E980F85D;
	Fri,  2 Jun 2023 22:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E980F85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739512;
	bh=PWkXT1N+z3pK2wTxxef5ZGLINLgrekCHiI5HTifTQBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rWOKL+hNrRcF1QIV29Ae+7pIS1h+VF34+WiYqjunCVdYgM+gU1igsqC7OVcSIa72i
	 IbfQokp9Hjp1VWXoXngDyOCXSBUq4b1cXjONFBwKrkKAEKahM9KTuKkKxYheCryJiM
	 Q27/2kdNlvqvdJRh+mJO+f1+Qtv9eAalhpMyzLME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46F32F80578; Fri,  2 Jun 2023 22:56:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B63CCF8055A;
	Fri,  2 Jun 2023 22:56:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73636F80199; Fri,  2 Jun 2023 22:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43B6FF800BD
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B6FF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VhxTN4Us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739399; x=1717275399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PWkXT1N+z3pK2wTxxef5ZGLINLgrekCHiI5HTifTQBw=;
  b=VhxTN4Usay224ukEiV+zTvMCpZamlqRQ7w7PEQ0h7nCZriJePi+NmfPL
   7wL2nMrPSw82UXxhMnYxV2kP2sLSMmM64eysXMlmWwq13HQP4CTV/yAc5
   6jFojkhRi2P+BKtg4t5g7wCDwiIUEjZ57sDHJaOoO55ckgP9d+4s926zU
   beb/lEWQC6Sc3I5szXSh9vGuBoR/vMi2RdcMG2n2T8X8WY2NEYW4PJOAw
   2p76daQ3ycIbqg/rMNfjbv7cBG/YPfSmA+Z+6wakJ+R+Fs/b35xeMgn2f
   8DvJ3LAL71AcI2DoC9xaavHjJdd/My5igmlVb35Ltm842j5hz1xJ95lIc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272082"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272082"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092688"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092688"
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
Subject: [PATCH 2/9] ASoC: SOF: Intel: hda-dai: add codec_dai_set_stream
 callback
Date: Fri,  2 Jun 2023 15:56:13 -0500
Message-Id: <20230602205620.310879-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MZTGOBV6JZWG3MES5ILWTUJUBGOSMKLF
X-Message-ID-Hash: MZTGOBV6JZWG3MES5ILWTUJUBGOSMKLF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZTGOBV6JZWG3MES5ILWTUJUBGOSMKLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code for HDAudio DAIs cannot be extended to other types
of DAIs, specific programming sequences need to be abstracted
away. Start here with hiding the stream_tag needed by the HDAudio
codec_dai.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 17 ++++++++++++++++-
 sound/soc/sof/intel/hda-dai.c     |  3 ++-
 sound/soc/sof/intel/hda.h         |  4 ++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 1e58256c8003..2d2953cee1d8 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -175,6 +175,17 @@ static void hda_reset_hext_stream(struct snd_sof_dev *sdev, struct hdac_ext_stre
 	snd_hdac_ext_stream_reset(hext_stream);
 }
 
+static void hda_codec_dai_set_stream(struct snd_sof_dev *sdev,
+				     struct snd_pcm_substream *substream,
+				     struct hdac_stream *hstream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+
+	/* set the hdac_stream in the codec dai */
+	snd_soc_dai_set_stream(codec_dai, hstream, substream->stream);
+}
+
 static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				struct snd_pcm_substream *substream, int cmd)
 {
@@ -307,7 +318,8 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.reset_hext_stream = hda_reset_hext_stream,
 	.pre_trigger = hda_ipc4_pre_trigger,
 	.trigger = hda_trigger,
-	.post_trigger = hda_ipc4_post_trigger
+	.post_trigger = hda_ipc4_post_trigger,
+	.codec_dai_set_stream = hda_codec_dai_set_stream,
 };
 
 static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
@@ -317,6 +329,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
 	.setup_hext_stream = hda_setup_hext_stream,
 	.reset_hext_stream = hda_reset_hext_stream,
 	.trigger = hda_trigger,
+	.codec_dai_set_stream = hda_codec_dai_set_stream,
 };
 
 static int hda_ipc3_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
@@ -350,6 +363,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc3_dma_ops = {
 	.reset_hext_stream = hda_reset_hext_stream,
 	.trigger = hda_trigger,
 	.post_trigger = hda_ipc3_post_trigger,
+	.codec_dai_set_stream = hda_codec_dai_set_stream,
 };
 
 static struct hdac_ext_stream *
@@ -376,6 +390,7 @@ static void hda_dspless_setup_hext_stream(struct snd_sof_dev *sdev,
 static const struct hda_dai_widget_dma_ops hda_dspless_dma_ops = {
 	.get_hext_stream = hda_dspless_get_hext_stream,
 	.setup_hext_stream = hda_dspless_setup_hext_stream,
+	.codec_dai_set_stream = hda_codec_dai_set_stream,
 };
 
 #endif
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 3d89c1923b03..0c018644347e 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -192,7 +192,8 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 		snd_hdac_ext_bus_link_set_stream_id(hlink, stream_tag);
 
 	/* set the hdac_stream in the codec dai */
-	snd_soc_dai_set_stream(codec_dai, hdac_stream(hext_stream), substream->stream);
+	if (ops->codec_dai_set_stream)
+		ops->codec_dai_set_stream(sdev, substream, hstream);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		link_bps = codec_dai->driver->playback.sig_bits;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5b3dad2dadf4..02d935daab28 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -919,6 +919,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
  * @pre_trigger: Function pointer for DAI DMA pre-trigger actions
  * @trigger: Function pointer for DAI DMA trigger actions
  * @post_trigger: Function pointer for DAI DMA post-trigger actions
+ * @codec_dai_set_stream: Function pointer to set codec-side stream information
  */
 struct hda_dai_widget_dma_ops {
 	struct hdac_ext_stream *(*get_hext_stream)(struct snd_sof_dev *sdev,
@@ -938,6 +939,9 @@ struct hda_dai_widget_dma_ops {
 		       struct snd_pcm_substream *substream, int cmd);
 	int (*post_trigger)(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 			    struct snd_pcm_substream *substream, int cmd);
+	void (*codec_dai_set_stream)(struct snd_sof_dev *sdev,
+				     struct snd_pcm_substream *substream,
+				     struct hdac_stream *hstream);
 };
 
 const struct hda_dai_widget_dma_ops *
-- 
2.37.2

