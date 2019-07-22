Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A0D70247
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47128182C;
	Mon, 22 Jul 2019 16:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47128182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805567;
	bh=/wIQFXTbSizyVd5pJJtiD+bD01DYsS/kh6cSy3Qalaw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCCbZ2qJ2Prv5LXAnurgxgObLbDSoOPTEIW95K5YFxSwCPbLULiGdVlBtGgX73o5o
	 htWWE7NsOd7s2HaA8Zz1X1EdeQCfCvtf7umrN73dUdqlhmgOH0tuOjz959PMRBnGdY
	 ooIErWJRE8aw7PVgWGMC+MEh/Yiq0Gi7Raj+wxnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 436CFF8065A;
	Mon, 22 Jul 2019 16:14:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09254F80539; Mon, 22 Jul 2019 16:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF405F8048E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF405F8048E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733302"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:58 -0500
Message-Id: <20190722141402.7194-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 17/21] ASoC: SOF: Intel: hda: reset link DMA
	state in prepare
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

When application goes through SUSPEND/STOP->PREPARE->START
cycle, we should always reprogram the DAI link DMA to ensure
it is in sync with the host PCM DMA.

Use same state tracking logic to handle both restart and
system resume flows. Use link_prepared field of
'struct hdac_ext_stream' to store the state, instead of
adding redundant fields to SOF specific structs.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c |  8 +++-----
 sound/soc/sof/intel/hda-dsp.c | 17 ++++++-----------
 sound/soc/sof/intel/hda.h     |  1 -
 3 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index a514f9cf5c9a..a448be60f6dd 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -226,8 +226,6 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_dma_data(dai, substream, (void *)link_dev);
 
-	hda_stream->hw_params_upon_resume = 0;
-
 	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
 	if (!link)
 		return -EINVAL;
@@ -267,8 +265,7 @@ static int hda_link_pcm_prepare(struct snd_pcm_substream *substream,
 
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
-	/* setup hw_params again only if resuming from system suspend */
-	if (!hda_stream->hw_params_upon_resume)
+	if (link_dev->link_prepared)
 		return 0;
 
 	dev_dbg(sdev->dev, "hda: prepare stream dir %d\n", substream->stream);
@@ -317,6 +314,7 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 		snd_hdac_ext_link_stream_start(link_dev);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
 		/*
 		 * clear and release link DMA channel. It will be assigned when
 		 * hw_params is set up again after resume.
@@ -329,10 +327,10 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
 		snd_hdac_ext_stream_release(link_dev,
 					    HDAC_EXT_STREAM_TYPE_LINK);
+		link_dev->link_prepared = 0;
 
 		/* fallthrough */
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-	case SNDRV_PCM_TRIGGER_STOP:
 		snd_hdac_ext_link_stream_clear(link_dev);
 		break;
 	default:
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index f08a5d649346..e82ecaad1763 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -425,25 +425,19 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev)
 
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 {
-	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct sof_intel_hda_stream *hda_stream;
-	struct hdac_ext_stream *stream;
-	struct hdac_stream *s;
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_pcm_runtime *rtd;
+	struct hdac_ext_stream *stream;
 	struct hdac_ext_link *link;
+	struct hdac_stream *s;
 	const char *name;
 	int stream_tag;
-#endif
 
 	/* set internal flag for BE */
 	list_for_each_entry(s, &bus->stream_list, list) {
 		stream = stream_to_hdac_ext_stream(s);
-		hda_stream = container_of(stream, struct sof_intel_hda_stream,
-					  hda_stream);
-		hda_stream->hw_params_upon_resume = 1;
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+
 		/*
 		 * clear and release stream. This should already be taken care
 		 * for running streams when the SUSPEND trigger is called.
@@ -460,8 +454,9 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
 			snd_hdac_ext_stream_release(stream,
 						    HDAC_EXT_STREAM_TYPE_LINK);
+			stream->link_prepared = 0;
 		}
-#endif
 	}
+#endif
 	return 0;
 }
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 028e865d5e20..ceaaa8d467f4 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -418,7 +418,6 @@ struct sof_intel_hda_stream {
 	struct snd_sof_dev *sdev;
 	struct hdac_ext_stream hda_stream;
 	struct sof_intel_stream stream;
-	int hw_params_upon_resume; /* set up hw_params upon resume */
 	int host_reserved; /* reserve host DMA channel */
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
