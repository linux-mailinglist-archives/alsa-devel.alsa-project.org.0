Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 551F947EA84
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 03:12:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E522418B1;
	Fri, 24 Dec 2021 03:12:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E522418B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640311973;
	bh=4wlCe70BRZKAkZaO8SjK9u4Vz9V4vUqESsniSLvQ5zI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BhbcxRY1lQoylvYxqH6WJzQvjhRzmwLg8p1uu2Z5cFc6YDCTg+FzeHW3kLolHN5A3
	 Tgdy8xGKKgpxtBJNydNaw+cGmqb/gNNB/fhMA5SKPgIdAcEftS5UrBP8MuYU8sQx1N
	 ryN1/QrUicq7veCTQTGDG0sq9Kk1o8KVeMf2HgjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CA08F804EB;
	Fri, 24 Dec 2021 03:11:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74FD8F804E4; Fri, 24 Dec 2021 03:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9604F80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 03:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9604F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ux2auwMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640311883; x=1671847883;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=4wlCe70BRZKAkZaO8SjK9u4Vz9V4vUqESsniSLvQ5zI=;
 b=Ux2auwMCmzOWNBUtgpmTyTe1T9umV/mwD603OwpS+LHtp/GjCYxM1vF2
 iAeV87RJudgPEYkiM/9tAn7dun/WbFzzEf0+aKjbHA4oZo/6wj17B+8XG
 M/eELmwkOyuPYh7IkChgT4lSqCJxjPL7P1e40S6W2ieoSgi2qd9MENFhP
 VnEML9CQY1Iejk5xb4v7/slBUc5PqGy+kK01CmQWPs3Nap5TYdt1kLa05
 rpTfP6W3FJ+/LItEi4Q1M6M8W28762oDCeou3mPR5k0WDuD+szkvdEmTb
 c5cDisx1+nBmYixc+zqxCYesau6Jfqe3nPCiVuPs+rTPtiomSUDUrpzTH Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="238450107"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="238450107"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:11:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="467156234"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:11:07 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 5/7] ASoC: Intel/SOF: use set_stream() instead of
 set_tdm_slots() for HDAudio
Date: Fri, 24 Dec 2021 10:10:32 +0800
Message-Id: <20211224021034.26635-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
References: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
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
index 6381f2b227f0..cd12589355ef 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -243,11 +243,8 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
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

