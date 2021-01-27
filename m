Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B71304F20
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 03:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E7601769;
	Wed, 27 Jan 2021 03:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E7601769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611713380;
	bh=+aZBkTXAK4I1kEAeqt0RxM2q4HSfJ40KXPkn2w0Rupg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OnaeCVnQBM3mJCNpvAcA2983Bd5ApOTseyBIzSajsdo2z4obnKHz0hDDgCbUMkUr9
	 Z82R2gC7lLyE6790B2vwGYt0sXvP6rnM/8qJ9wWyoaXocXrR/Dgsie0Xlh8bKJTuto
	 AZKF0ipX4upVnL20cRjzusgvmZ/4GwekGdDZPeW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAD3BF80253;
	Wed, 27 Jan 2021 03:08:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD5C6F80217; Wed, 27 Jan 2021 03:07:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC597F80108
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 03:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC597F80108
IronPort-SDR: U4RcVPUPrTKxqHn61/ZXIdS71sDl5RbOfHuEdAo+CDnTsZ6h/82b8ZrvF9JiDU91rVCc9VXX2K
 UJgtM1jQAFzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="176495402"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="176495402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 18:07:45 -0800
IronPort-SDR: 4tcxsta1AcOudKpePkOudqI+zdepolAcG4Okg6uwup9q3NlwXbBneREnvDejD/Kmq0gBVJfeXg
 rKn5HRfpDrVg==
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="472975618"
Received: from laurafux-mobl.amr.corp.intel.com (HELO
 rsridh-mobl1.localdomain) ([10.254.96.47])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 18:07:44 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: SOF: Intel: hda: enable DMI L1 for
 D0i3-compatible streams
Date: Tue, 26 Jan 2021 18:07:36 -0800
Message-Id: <20210127020737.1088960-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127020737.1088960-1-ranjani.sridharan@linux.intel.com>
References: <20210127020737.1088960-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 sathyanarayana.nujella@intel.com
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

DMI L1 entry is currently disabled whenever any capture stream is
opened to prevent xruns during pause/release. But, in
order to maximise power savings for the wake-on-voice usecase,
DMI L1 entry should be enabled for D0i3-compatible capture streams.
Introduce a new field, flags in struct sof_intel_hda_stream
that stores whether a stream is dmi_l1_compatible. All playback streams,
and D0i3-compatible capture streams are DMI L1 compatible.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-compress.c |  2 +-
 sound/soc/sof/intel/hda-loader.c   |  2 +-
 sound/soc/sof/intel/hda-pcm.c      | 16 ++++++++++++-
 sound/soc/sof/intel/hda-stream.c   | 38 +++++++++++++++++-------------
 sound/soc/sof/intel/hda-trace.c    |  3 +--
 sound/soc/sof/intel/hda.h          |  6 ++++-
 6 files changed, 45 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/intel/hda-compress.c b/sound/soc/sof/intel/hda-compress.c
index 53c08034fa22..c6cf7b313934 100644
--- a/sound/soc/sof/intel/hda-compress.c
+++ b/sound/soc/sof/intel/hda-compress.c
@@ -25,7 +25,7 @@ int hda_probe_compr_assign(struct snd_sof_dev *sdev,
 {
 	struct hdac_ext_stream *stream;
 
-	stream = hda_dsp_stream_get(sdev, cstream->direction);
+	stream = hda_dsp_stream_get(sdev, cstream->direction, 0);
 	if (!stream)
 		return -EBUSY;
 
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index ed773696b495..365a79fc7081 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -35,7 +35,7 @@ static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsig
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
-	dsp_stream = hda_dsp_stream_get(sdev, direction);
+	dsp_stream = hda_dsp_stream_get(sdev, direction, 0);
 
 	if (!dsp_stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 5d35bb18660a..689934131a68 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -215,11 +215,25 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream)
 {
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_component *scomp = sdev->component;
 	struct hdac_ext_stream *dsp_stream;
+	struct snd_sof_pcm *spcm;
 	int direction = substream->stream;
+	u32 flags = 0;
+
+	spcm = snd_sof_find_spcm_dai(scomp, rtd);
+	if (!spcm) {
+		dev_err(sdev->dev, "error: can't find PCM with DAI ID %d\n", rtd->dai_link->id);
+		return -EINVAL;
+	}
 
-	dsp_stream = hda_dsp_stream_get(sdev, direction);
+	/* All playback and D0i3 compatible streams are DMI L1 capable */
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	    spcm->stream[substream->stream].d0i3_compatible)
+		flags |= SOF_HDA_STREAM_DMI_L1_COMPATIBLE;
 
+	dsp_stream = hda_dsp_stream_get(sdev, direction, flags);
 	if (!dsp_stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
 		return -ENODEV;
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 0e09ede922c7..40a3993ae2cb 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -155,7 +155,7 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 
 /* get next unused stream */
 struct hdac_ext_stream *
-hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction)
+hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
@@ -183,18 +183,22 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction)
 	spin_unlock_irq(&bus->reg_lock);
 
 	/* stream found ? */
-	if (!stream)
+	if (!stream) {
 		dev_err(sdev->dev, "error: no free %s streams\n",
 			direction == SNDRV_PCM_STREAM_PLAYBACK ?
 			"playback" : "capture");
+		return stream;
+	}
+
+	hda_stream->flags = flags;
 
 	/*
-	 * Disable DMI Link L1 entry when capture stream is opened.
+	 * Prevent DMI Link L1 entry for streams that don't support it.
 	 * Workaround to address a known issue with host DMA that results
 	 * in xruns during pause/release in capture scenarios.
 	 */
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1))
-		if (stream && direction == SNDRV_PCM_STREAM_CAPTURE)
+		if (stream && !(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE))
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 						HDA_VS_INTEL_EM2,
 						HDA_VS_INTEL_EM2_L1SEN, 0);
@@ -206,37 +210,39 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction)
 int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct sof_intel_hda_stream *hda_stream;
+	struct hdac_ext_stream *stream;
 	struct hdac_stream *s;
-	bool active_capture_stream = false;
+	bool dmi_l1_enable = true;
 	bool found = false;
 
 	spin_lock_irq(&bus->reg_lock);
 
 	/*
-	 * close stream matching the stream tag
-	 * and check if there are any open capture streams.
+	 * close stream matching the stream tag and check if there are any open streams
+	 * that are DMI L1 incompatible.
 	 */
 	list_for_each_entry(s, &bus->stream_list, list) {
+		stream = stream_to_hdac_ext_stream(s);
+		hda_stream = container_of(stream, struct sof_intel_hda_stream, hda_stream);
+
 		if (!s->opened)
 			continue;
 
 		if (s->direction == direction && s->stream_tag == stream_tag) {
 			s->opened = false;
 			found = true;
-		} else if (s->direction == SNDRV_PCM_STREAM_CAPTURE) {
-			active_capture_stream = true;
+		} else if (!(hda_stream->flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
+			dmi_l1_enable = false;
 		}
 	}
 
 	spin_unlock_irq(&bus->reg_lock);
 
-	/* Enable DMI L1 entry if there are no capture streams open */
-	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1))
-		if (!active_capture_stream)
-			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-						HDA_VS_INTEL_EM2,
-						HDA_VS_INTEL_EM2_L1SEN,
-						HDA_VS_INTEL_EM2_L1SEN);
+	/* Enable DMI L1 if permitted */
+	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1) && dmi_l1_enable)
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
+					HDA_VS_INTEL_EM2_L1SEN, HDA_VS_INTEL_EM2_L1SEN);
 
 	if (!found) {
 		dev_dbg(sdev->dev, "stream_tag %d not opened!\n", stream_tag);
diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index 1eb746d5adeb..ca869038e909 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -42,8 +42,7 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	int ret;
 
-	hda->dtrace_stream = hda_dsp_stream_get(sdev,
-						SNDRV_PCM_STREAM_CAPTURE);
+	hda->dtrace_stream = hda_dsp_stream_get(sdev, SNDRV_PCM_STREAM_CAPTURE, 0);
 
 	if (!hda->dtrace_stream) {
 		dev_err(sdev->dev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index a3b6f3e9121c..8e39d1e16178 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -402,6 +402,9 @@ struct sof_intel_dsp_bdl {
 #define SOF_HDA_PLAYBACK		0
 #define SOF_HDA_CAPTURE			1
 
+/* stream flags */
+#define SOF_HDA_STREAM_DMI_L1_COMPATIBLE	1
+
 /*
  * Time in ms for opportunistic D0I3 entry delay.
  * This has been deliberately chosen to be long to avoid race conditions.
@@ -471,6 +474,7 @@ struct sof_intel_hda_stream {
 	struct hdac_ext_stream hda_stream;
 	struct sof_intel_stream stream;
 	int host_reserved; /* reserve host DMA channel */
+	u32 flags;
 };
 
 #define hstream_to_sof_hda_stream(hstream) \
@@ -562,7 +566,7 @@ bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev);
 bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev);
 
 struct hdac_ext_stream *
-	hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction);
+	hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags);
 int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag);
 int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 			       struct hdac_ext_stream *stream,
-- 
2.25.1

