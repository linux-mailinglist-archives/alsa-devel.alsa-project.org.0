Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB1754EAED
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 468DB1B06;
	Thu, 16 Jun 2022 22:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 468DB1B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655410873;
	bh=46I67ew4CJLPXyZvsuOMXLMtbcBboWoiAXX27HUc88M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kpn30isRNtEL9sYT3R0JYCNo/VyRbA/fWFzp80R1+5VuO7C9GRX08EvKIGG/Qm1lw
	 T9WiUwpBaqAWbTQTVjmv2HMKU8+wt2cAFDEsL5UJgNQU3HzzB3wWH5EjUELvDmjQYQ
	 fRwXaZbVXILn2zQ8KGEFWo0tCwQATITy7nsUKRY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 900BCF8047C;
	Thu, 16 Jun 2022 22:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E69CF80310; Thu, 16 Jun 2022 22:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C571BF801D8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C571BF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PfDX6n0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655410811; x=1686946811;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=46I67ew4CJLPXyZvsuOMXLMtbcBboWoiAXX27HUc88M=;
 b=PfDX6n0G3E78QvLq7m0q711Pz5oM2VH+CFzjc7/6ZSdFgSU2GCpoFlr7
 OqIp44muW11ucNuys+0SMXuYx47O4sPvCQUtWlIlexbvqCUJjFyC03Xk2
 qHftcBkFk+A97c/RJ6ySgA1fLn4kRxvqANoZRWkrRVdbKdSX8txYvKuMv
 2BqSYgnwGw+IsL6XIP7v8ZTwxv1hT7UZ6edpraUwNxX+DvEjCCNrOccBN
 Wcj2Vf/7IpY/3N7LNLRsgcXG5GdAXcd8xAmiSnJPREksf23SvE/R0ZW3u
 iM6xSRgXxD/YTc60Cwe9MaeD7dVdBGoDQlCwj6L3u147kZG27UxuimoeE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="343304210"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="343304210"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:20:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641713830"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:19:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda: Fix compressed stream position tracking
Date: Thu, 16 Jun 2022 15:19:53 -0500
Message-Id: <20220616201953.130876-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Commit 288fad2f71fa ("ASoC: SOF: Intel: hda: add quirks for HDAudio DMA position information")
modified the PCM path only, but left the compressed data patch using an
obsolete option.
Move the functionality in a helper that can be called for both PCM and
compressed data.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Fixes: 288fad2f71fa ("ASoC: SOF: Intel: hda: add quirks for HDAudio DMA position information")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c    | 74 +------------------------
 sound/soc/sof/intel/hda-stream.c | 94 ++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda.h        |  3 +
 3 files changed, 94 insertions(+), 77 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index dc1f743730c0d..6888e0a4665d2 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -192,79 +192,7 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 		goto found;
 	}
 
-	switch (sof_hda_position_quirk) {
-	case SOF_HDA_POSITION_QUIRK_USE_SKYLAKE_LEGACY:
-		/*
-		 * This legacy code, inherited from the Skylake driver,
-		 * mixes DPIB registers and DPIB DDR updates and
-		 * does not seem to follow any known hardware recommendations.
-		 * It's not clear e.g. why there is a different flow
-		 * for capture and playback, the only information that matters is
-		 * what traffic class is used, and on all SOF-enabled platforms
-		 * only VC0 is supported so the work-around was likely not necessary
-		 * and quite possibly wrong.
-		 */
-
-		/* DPIB/posbuf position mode:
-		 * For Playback, Use DPIB register from HDA space which
-		 * reflects the actual data transferred.
-		 * For Capture, Use the position buffer for pointer, as DPIB
-		 * is not accurate enough, its update may be completed
-		 * earlier than the data written to DDR.
-		 */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
-					       AZX_REG_VS_SDXDPIB_XBASE +
-					       (AZX_REG_VS_SDXDPIB_XINTERVAL *
-						hstream->index));
-		} else {
-			/*
-			 * For capture stream, we need more workaround to fix the
-			 * position incorrect issue:
-			 *
-			 * 1. Wait at least 20us before reading position buffer after
-			 * the interrupt generated(IOC), to make sure position update
-			 * happens on frame boundary i.e. 20.833uSec for 48KHz.
-			 * 2. Perform a dummy Read to DPIB register to flush DMA
-			 * position value.
-			 * 3. Read the DMA Position from posbuf. Now the readback
-			 * value should be >= period boundary.
-			 */
-			usleep_range(20, 21);
-			snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
-					 AZX_REG_VS_SDXDPIB_XBASE +
-					 (AZX_REG_VS_SDXDPIB_XINTERVAL *
-					  hstream->index));
-			pos = snd_hdac_stream_get_pos_posbuf(hstream);
-		}
-		break;
-	case SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS:
-		/*
-		 * In case VC1 traffic is disabled this is the recommended option
-		 */
-		pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
-				       AZX_REG_VS_SDXDPIB_XBASE +
-				       (AZX_REG_VS_SDXDPIB_XINTERVAL *
-					hstream->index));
-		break;
-	case SOF_HDA_POSITION_QUIRK_USE_DPIB_DDR_UPDATE:
-		/*
-		 * This is the recommended option when VC1 is enabled.
-		 * While this isn't needed for SOF platforms it's added for
-		 * consistency and debug.
-		 */
-		pos = snd_hdac_stream_get_pos_posbuf(hstream);
-		break;
-	default:
-		dev_err_once(sdev->dev, "hda_position_quirk value %d not supported\n",
-			     sof_hda_position_quirk);
-		pos = 0;
-		break;
-	}
-
-	if (pos >= hstream->bufsize)
-		pos = 0;
-
+	pos = hda_dsp_stream_get_position(hstream, substream->stream, true);
 found:
 	pos = bytes_to_frames(substream->runtime, pos);
 
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index daeb64c495e40..d95ae17e81cc4 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -707,12 +707,13 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 }
 
 static void
-hda_dsp_set_bytes_transferred(struct hdac_stream *hstream, u64 buffer_size)
+hda_dsp_compr_bytes_transferred(struct hdac_stream *hstream, int direction)
 {
+	u64 buffer_size = hstream->bufsize;
 	u64 prev_pos, pos, num_bytes;
 
 	div64_u64_rem(hstream->curr_pos, buffer_size, &prev_pos);
-	pos = snd_hdac_stream_get_pos_posbuf(hstream);
+	pos = hda_dsp_stream_get_position(hstream, direction, false);
 
 	if (pos < prev_pos)
 		num_bytes = (buffer_size - prev_pos) +  pos;
@@ -748,8 +749,7 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 			if (s->substream && sof_hda->no_ipc_position) {
 				snd_sof_pcm_period_elapsed(s->substream);
 			} else if (s->cstream) {
-				hda_dsp_set_bytes_transferred(s,
-					s->cstream->runtime->buffer_size);
+				hda_dsp_compr_bytes_transferred(s, s->cstream->direction);
 				snd_compr_fragment_elapsed(s->cstream);
 			}
 		}
@@ -1009,3 +1009,89 @@ void hda_dsp_stream_free(struct snd_sof_dev *sdev)
 		devm_kfree(sdev->dev, hda_stream);
 	}
 }
+
+snd_pcm_uframes_t hda_dsp_stream_get_position(struct hdac_stream *hstream,
+					      int direction, bool can_sleep)
+{
+	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
+	struct sof_intel_hda_stream *hda_stream = hstream_to_sof_hda_stream(hext_stream);
+	struct snd_sof_dev *sdev = hda_stream->sdev;
+	snd_pcm_uframes_t pos;
+
+	switch (sof_hda_position_quirk) {
+	case SOF_HDA_POSITION_QUIRK_USE_SKYLAKE_LEGACY:
+		/*
+		 * This legacy code, inherited from the Skylake driver,
+		 * mixes DPIB registers and DPIB DDR updates and
+		 * does not seem to follow any known hardware recommendations.
+		 * It's not clear e.g. why there is a different flow
+		 * for capture and playback, the only information that matters is
+		 * what traffic class is used, and on all SOF-enabled platforms
+		 * only VC0 is supported so the work-around was likely not necessary
+		 * and quite possibly wrong.
+		 */
+
+		/* DPIB/posbuf position mode:
+		 * For Playback, Use DPIB register from HDA space which
+		 * reflects the actual data transferred.
+		 * For Capture, Use the position buffer for pointer, as DPIB
+		 * is not accurate enough, its update may be completed
+		 * earlier than the data written to DDR.
+		 */
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
+					       AZX_REG_VS_SDXDPIB_XBASE +
+					       (AZX_REG_VS_SDXDPIB_XINTERVAL *
+						hstream->index));
+		} else {
+			/*
+			 * For capture stream, we need more workaround to fix the
+			 * position incorrect issue:
+			 *
+			 * 1. Wait at least 20us before reading position buffer after
+			 * the interrupt generated(IOC), to make sure position update
+			 * happens on frame boundary i.e. 20.833uSec for 48KHz.
+			 * 2. Perform a dummy Read to DPIB register to flush DMA
+			 * position value.
+			 * 3. Read the DMA Position from posbuf. Now the readback
+			 * value should be >= period boundary.
+			 */
+			if (can_sleep)
+				usleep_range(20, 21);
+
+			snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
+					 AZX_REG_VS_SDXDPIB_XBASE +
+					 (AZX_REG_VS_SDXDPIB_XINTERVAL *
+					  hstream->index));
+			pos = snd_hdac_stream_get_pos_posbuf(hstream);
+		}
+		break;
+	case SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS:
+		/*
+		 * In case VC1 traffic is disabled this is the recommended option
+		 */
+		pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
+				       AZX_REG_VS_SDXDPIB_XBASE +
+				       (AZX_REG_VS_SDXDPIB_XINTERVAL *
+					hstream->index));
+		break;
+	case SOF_HDA_POSITION_QUIRK_USE_DPIB_DDR_UPDATE:
+		/*
+		 * This is the recommended option when VC1 is enabled.
+		 * While this isn't needed for SOF platforms it's added for
+		 * consistency and debug.
+		 */
+		pos = snd_hdac_stream_get_pos_posbuf(hstream);
+		break;
+	default:
+		dev_err_once(sdev->dev, "hda_position_quirk value %d not supported\n",
+			     sof_hda_position_quirk);
+		pos = 0;
+		break;
+	}
+
+	if (pos >= hstream->bufsize)
+		pos = 0;
+
+	return pos;
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index a3118499e34fc..dc713c20ba1d9 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -565,6 +565,9 @@ int hda_dsp_stream_setup_bdl(struct snd_sof_dev *sdev,
 bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev);
 bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev);
 
+snd_pcm_uframes_t hda_dsp_stream_get_position(struct hdac_stream *hstream,
+					      int direction, bool can_sleep);
+
 struct hdac_ext_stream *
 	hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags);
 int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag);
-- 
2.34.1

