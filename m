Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ABF669540
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 12:14:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C941A788;
	Fri, 13 Jan 2023 12:14:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C941A788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673608490;
	bh=1+XG7qLammQBp0XBhf1JdRZJfko8cla6x0q0gInCAo0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UMEeAtqhHqcN3QMAHSrUos/blQDSnIOmfOXkoBombJvalcveIC0/EMmggh5lgIkpF
	 lTqE+b5b2gJLkAeTNN98hqmQsAoo6jsF/59b6Mva7rZ2XTUDTzXsK1GZEyufxu5vGh
	 w5UYxG2bGgmRDxXw3It6mxZu+LZ00W4Y72CZHYdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBEB1F8053D;
	Fri, 13 Jan 2023 12:13:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83042F80542; Fri, 13 Jan 2023 12:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A9A1F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 12:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A9A1F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C4B2xE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673608405; x=1705144405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1+XG7qLammQBp0XBhf1JdRZJfko8cla6x0q0gInCAo0=;
 b=C4B2xE8AlbrLzHV1rpSh4Ndz1a7AIzBrD3DiH4nfpRNMbsAuPeWyZ31z
 c/VYnnwZ9IVCvFLt5xiSdIr5s/U+GvSwaTbq1bNYFAV14bKRIFhYEt0rI
 iZbaXGTOHjHmeb6wGUCKBlfZGl3hrcENHnYon/7qJMS++GR+yp1nZ7amj
 Zhesubn3qkAEgPXIa/sQEI8+7PHrNyue+tw40UnvcoQVG0t8593TOuIKi
 nctmFe+o9haXxzIB8E0I121nKsTogh9Hqwmm0B4cW/ntNGdLUcIpyzh9I
 hLVpgtmBY+X5xFO0A2tKdsYc4rwp5EqTIj0TNwQ923Gx+OBH1Xf+RGw8D w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="321666370"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="321666370"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:13:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="726667093"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="726667093"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2023 03:13:18 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: Intel: avs: Use asoc_substream_to_rtd() to obtain
 rtd
Date: Fri, 13 Jan 2023 20:14:09 +0100
Message-Id: <20230113191410.1454566-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Utilize the helper function instead of casting from ->private_data
or snd_pcm_substream_chip() directly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt286.c |  2 +-
 sound/soc/intel/avs/boards/rt298.c |  2 +-
 sound/soc/intel/avs/pcm.c          | 30 +++++++++++++++---------------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 8447b37a2a41..3551a05bd599 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -98,7 +98,7 @@ static int avs_rt286_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pc
 static int
 avs_rt286_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = substream->private_data;
+	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
 	int ret;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index bd25f0fde35e..2923f3805bbe 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -109,7 +109,7 @@ static int avs_rt298_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pc
 static int
 avs_rt298_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int clk_freq;
 	int ret;
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index f930c5e86a84..c4376c9c35ef 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -60,7 +60,7 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe,
 			   const struct snd_soc_dai_ops *ops)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
@@ -169,7 +169,7 @@ static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct
 
 static void avs_dai_nonhda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
@@ -218,7 +218,7 @@ static int avs_dai_nonhda_be_prepare(struct snd_pcm_substream *substream, struct
 static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	int ret = 0;
 
@@ -305,7 +305,7 @@ static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
 static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct hda_codec *codec;
@@ -335,7 +335,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 
 static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct hdac_ext_stream *link_stream = runtime->private_data;
 	struct hdac_ext_link *link;
@@ -374,7 +374,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct avs_dma_data *data;
 	int ret = 0;
@@ -489,7 +489,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct avs_dma_data *data;
 
@@ -628,7 +628,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 
 static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	struct hdac_bus *bus;
@@ -836,7 +836,7 @@ static int avs_dai_resume_hw_params(struct snd_soc_dai *dai, struct avs_dma_data
 	int ret;
 
 	substream = data->substream;
-	rtd = snd_pcm_substream_chip(substream);
+	rtd = asoc_substream_to_rtd(substream);
 
 	ret = dai->driver->ops->hw_params(substream, &rtd->dpcm[substream->stream].hw_params, dai);
 	if (ret)
@@ -931,7 +931,7 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 	for_each_component_dais(component, dai) {
 		data = dai->playback_dma_data;
 		if (data) {
-			rtd = snd_pcm_substream_chip(data->substream);
+			rtd = asoc_substream_to_rtd(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
 				if (ret < 0) {
@@ -944,7 +944,7 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 
 		data = dai->capture_dma_data;
 		if (data) {
-			rtd = snd_pcm_substream_chip(data->substream);
+			rtd = asoc_substream_to_rtd(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
 				if (ret < 0) {
@@ -1048,7 +1048,7 @@ static const struct snd_pcm_hardware avs_pcm_hardware = {
 static int avs_component_open(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 
 	/* only FE DAI links are handled here */
 	if (rtd->dai_link->no_pcm)
@@ -1066,7 +1066,7 @@ static unsigned int avs_hda_stream_dpib_read(struct hdac_ext_stream *stream)
 static snd_pcm_uframes_t
 avs_component_pointer(struct snd_soc_component *component, struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	unsigned int pos;
@@ -1394,7 +1394,7 @@ static void avs_component_hda_remove(struct snd_soc_component *component)
 static int avs_component_hda_open(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct hda_codec *codec;
 
@@ -1441,7 +1441,7 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 static int avs_component_hda_close(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 
 	/* only BE DAI links are handled here */
-- 
2.25.1

