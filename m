Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DA64720C2
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 06:50:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB171904;
	Mon, 13 Dec 2021 06:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB171904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639374604;
	bh=lVPLmtu7jTPFljx35JqPnyJ+a2uqiWCRH+M58tpiB1U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YnLYZ1taf7KMCKiG53vTj6+HRE2WohMAr0wZHIVfyTVr7wV2I1PbrWgyKmMEoiytC
	 0oohSBIro0QU0rl3Qj2rwe1dxiGKktXu3U8f0gFWziwXJ4cJ5w2/VNptzacc5fYqyl
	 8XJp/oP0gTvwNaTdfyaobSubt4SPSu84ZnQ3Wcac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F499F804CB;
	Mon, 13 Dec 2021 06:48:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D863EF80161; Mon, 13 Dec 2021 06:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C73D9F80518
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 06:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C73D9F80518
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237402050"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; d="scan'208";a="237402050"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 21:47:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; d="scan'208";a="517608182"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 21:46:59 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/7] ASoC: Intel/SOF: use set_stream() instead of
 set_tdm_slots() for HDAudio
Date: Mon, 13 Dec 2021 13:46:32 +0800
Message-Id: <20211213054634.30088-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Overloading the tx_mask with a linear value is asking for trouble and
only works because the codec_dai hw_params() is called before the
cpu_dai hw_params().

Move to the more generic set_stream() API to pass the hdac_stream
information.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c       | 22 +++++++++++-----------
 sound/soc/intel/skylake/skl-pcm.c |  7 ++-----
 sound/soc/sof/intel/hda-dai.c     |  7 ++-----
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 390dd6c7f6a5..de5955db0a5f 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -46,9 +46,8 @@ static int hdac_hda_dai_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai);
 static int hdac_hda_dai_hw_free(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai);
-static int hdac_hda_dai_set_tdm_slot(struct snd_soc_dai *dai,
-				     unsigned int tx_mask, unsigned int rx_mask,
-				     int slots, int slot_width);
+static int hdac_hda_dai_set_stream(struct snd_soc_dai *dai, void *stream,
+				   int direction);
 static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 						 struct snd_soc_dai *dai);
 
@@ -58,7 +57,7 @@ static const struct snd_soc_dai_ops hdac_hda_dai_ops = {
 	.prepare = hdac_hda_dai_prepare,
 	.hw_params = hdac_hda_dai_hw_params,
 	.hw_free = hdac_hda_dai_hw_free,
-	.set_tdm_slot = hdac_hda_dai_set_tdm_slot,
+	.set_stream = hdac_hda_dai_set_stream,
 };
 
 static struct snd_soc_dai_driver hdac_hda_dais[] = {
@@ -180,21 +179,22 @@ static struct snd_soc_dai_driver hdac_hda_dais[] = {
 
 };
 
-static int hdac_hda_dai_set_tdm_slot(struct snd_soc_dai *dai,
-				     unsigned int tx_mask, unsigned int rx_mask,
-				     int slots, int slot_width)
+static int hdac_hda_dai_set_stream(struct snd_soc_dai *dai,
+				   void *stream, int direction)
 {
 	struct snd_soc_component *component = dai->component;
 	struct hdac_hda_priv *hda_pvt;
 	struct hdac_hda_pcm *pcm;
+	struct hdac_stream *hstream;
+
+	if (!stream)
+		return -EINVAL;
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
 	pcm = &hda_pvt->pcm[dai->id];
+	hstream = (struct hdac_stream *)stream;
 
-	if (tx_mask)
-		pcm->stream_tag[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
-	else
-		pcm->stream_tag[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
+	pcm->stream_tag[direction] = hstream->stream_tag;
 
 	return 0;
 }
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 9ecaf6a1e847..8378c187959f 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -562,11 +562,8 @@ static int skl_link_hw_params(struct snd_pcm_substream *substream,
 
 	stream_tag = hdac_stream(link_dev)->stream_tag;
 
-	/* set the stream tag in the codec dai dma params  */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		snd_soc_dai_set_tdm_slot(codec_dai, stream_tag, 0, 0, 0);
-	else
-		snd_soc_dai_set_tdm_slot(codec_dai, 0, stream_tag, 0, 0);
+	/* set the hdac_stream in the codec dai */
+	snd_soc_dai_set_stream(codec_dai, hdac_stream(link_dev), substream->stream);
 
 	p_params.s_fmt = snd_pcm_format_width(params_format(params));
 	p_params.ch = params_channels(params);
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 76579383d290..ba8a6d181410 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -264,11 +264,8 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	if (!link)
 		return -EINVAL;
 
-	/* set the stream tag in the codec dai dma params */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		snd_soc_dai_set_tdm_slot(codec_dai, stream_tag, 0, 0, 0);
-	else
-		snd_soc_dai_set_tdm_slot(codec_dai, 0, stream_tag, 0, 0);
+	/* set the hdac_stream in the codec dai */
+	snd_soc_dai_set_stream(codec_dai, hdac_stream(link_dev), substream->stream);
 
 	p_params.s_fmt = snd_pcm_format_width(params_format(params));
 	p_params.ch = params_channels(params);
-- 
2.17.1

