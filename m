Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71472700E8C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 20:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E012EA1;
	Fri, 12 May 2023 20:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E012EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683915574;
	bh=dUanq3yDptZuV/4GYL510FaJnL/T4c8BB1tvWWScv8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T4weU47pjnepAormGbRvMK3MRqDnw+YmXAKhnbXMFlv5FqBPM5rE+G8pxwxWdkyjh
	 NikGY7p/E3I3vPUTaYNNPesOlLs05fqbNsJrdPdCGFuXrtgvpi9RAdX+Bxmz2MnksW
	 vAYCgRqq/usz+uCn1ZXUk+UBPU57cbNtuxGSKmKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39BA5F80570; Fri, 12 May 2023 20:17:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA09F8056F;
	Fri, 12 May 2023 20:17:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 606FCF80542; Fri, 12 May 2023 20:17:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACB12F8052E
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 20:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACB12F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BNvH3hFT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915461; x=1715451461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dUanq3yDptZuV/4GYL510FaJnL/T4c8BB1tvWWScv8U=;
  b=BNvH3hFTdxG+7EweNvSkXRJbxP2boBfWSArgZrEnNXtb5k16Uo3cDYDA
   bvaDf/UIgfxD+6289aJZJGVxorOfuAlUmeOhexXT6/GTOdq5FaP9FY8Ml
   RkxvVIHRl1WgpB9DKWmzcQ2aC0cfjplgNJ2pPxtWuJ9tYuS4zNSX4WtnQ
   pKRUdDGMREs7NZGCVVDvJT4qsFXBo2FrBVSccEqmFdQwaIdbsZZ36j+e0
   FAhr9uha47/TTGXUPi6UEtVS3NdbsxLghuBYm8pP7hqNhA8uff3kQallM
   8Dl26ZiBXVbr63eSYeW0xGqJXEqs4QqPNsARSnj6IBxRe4GAOP7C2QMfD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331223202"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331223202"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769895056"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="769895056"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 2/9] ASoC: SOF: Intel: hda-dai: remove use of
 cpu_dai->component drvdata
Date: Fri, 12 May 2023 13:16:55 -0500
Message-Id: <20230512181702.117483-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
References: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CQIAFOQN6SPNWFGEBBIK6NLSG7JV3AUJ
X-Message-ID-Hash: CQIAFOQN6SPNWFGEBBIK6NLSG7JV3AUJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQIAFOQN6SPNWFGEBBIK6NLSG7JV3AUJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code relies on conversions from cpu_dai to the sdev
structure pointer based on the cpu_dai component. This works fine for
HDaudio but will not work for SoundWire DAIs which are registered by a
different component. That's a problem preventing reuse of the HDaudio
DMA stream allocation for SoundWire DAIs starting with the LunarLake
platform.

This patch introduces a set of helpers to perform the conversion, and
an indirect way of retrieving the sdev pointer based on the
swidget->comp intermediate pointer.

Suggested-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 40 ++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 61eb25cfdbe1..7e71cce7f531 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -27,20 +27,26 @@ static bool hda_use_tplg_nhlt;
 module_param_named(sof_use_tplg_nhlt, hda_use_tplg_nhlt, bool, 0444);
 MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
 
+static struct snd_sof_dev *widget_to_sdev(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+
+	return snd_soc_component_get_drvdata(component);
+}
+
 int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 		   struct snd_sof_dai_config_data *data)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
 	const struct sof_ipc_tplg_ops *tplg_ops;
-	struct snd_soc_component *component;
 	struct snd_sof_dev *sdev;
 	int ret;
 
 	if (!swidget)
 		return 0;
 
-	component = swidget->scomp;
-	sdev = snd_soc_component_get_drvdata(component);
+	sdev = widget_to_sdev(w);
 	tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
 	if (tplg_ops && tplg_ops->dai_config) {
@@ -57,14 +63,24 @@ int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 
+static struct snd_sof_dev *dai_to_sdev(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *cpu_dai)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+
+	return widget_to_sdev(w);
+}
+
 static const struct hda_dai_widget_dma_ops *
 hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_sof_dev *sdev;
 	struct snd_sof_dai *sdai;
 
+	sdev = widget_to_sdev(w);
+
 	/*
 	 * The swidget parameter of hda_select_dai_widget_ops() is ignored in
 	 * case of DSPless mode
@@ -96,14 +112,16 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *cpu_dai,
 				struct snd_soc_dai *codec_dai)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	struct hdac_bus *bus = hstream->bus;
 	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_ext_link *hlink;
+	struct snd_sof_dev *sdev;
 	int stream_tag;
 
+	sdev = dai_to_sdev(substream, cpu_dai);
+
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
 	if (!hlink)
 		return -EINVAL;
@@ -140,7 +158,7 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	unsigned int link_bps;
 	int stream_tag;
 
-	sdev = snd_soc_component_get_drvdata(cpu_dai->component);
+	sdev = dai_to_sdev(substream, cpu_dai);
 	bus = sof_to_bus(sdev);
 
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
@@ -190,11 +208,11 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 
 static int hda_dai_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream;
+	struct snd_sof_dev *sdev = dai_to_sdev(substream, cpu_dai);
 
 	if (!ops) {
 		dev_err(sdev->dev, "DAI widget ops not set\n");
@@ -213,11 +231,11 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
 	struct hdac_ext_stream *hext_stream;
 	struct snd_sof_dai_config_data data = { 0 };
 	unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
+	struct snd_sof_dev *sdev = widget_to_sdev(w);
 	int ret;
 
 	if (!ops) {
@@ -255,16 +273,18 @@ static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
  */
 static int hda_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
 	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *codec_dai;
+	struct snd_sof_dev *sdev;
 	int ret;
 
 	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
 		dai->name, substream->stream);
 
+	sdev = dai_to_sdev(substream, dai);
+
 	hext_stream = ops->get_hext_stream(sdev, dai, substream);
 	if (!hext_stream)
 		return -EINVAL;
@@ -344,7 +364,7 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			codec_dai = asoc_rtd_to_codec(rtd, 0);
 			w = snd_soc_dai_get_widget(cpu_dai, hdac_stream(hext_stream)->direction);
 			swidget = w->dobj.private;
-			sdev = snd_soc_component_get_drvdata(swidget->scomp);
+			sdev = widget_to_sdev(w);
 			sdai = swidget->private;
 			ops = sdai->platform_private;
 
-- 
2.37.2

