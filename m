Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1746C3D6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:43:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BF89257D;
	Tue,  7 Dec 2021 20:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BF89257D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638906221;
	bh=K0KFLyn2cohxH4HJkgGQEj5TRQ6ETWK3I9z5C4omLGk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XSvLYX0dhXaC7SsxkTKCBgtodOqE4D3ppy+puDsqJ0+Wk+SG9k78VCpOWUm7axDRe
	 QRPydx2Up+ne0DvFFtPSQ3Z+0TLoN5EzKaH8NnESKUC/gu4bj+xkdh+oQIJcQJS70K
	 9+NHL+3o94caCENWlx0vauYEZDztVnl+QSbcVmRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FB0F80525;
	Tue,  7 Dec 2021 20:40:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FE2EF80511; Tue,  7 Dec 2021 20:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F446F804CF
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F446F804CF
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236407813"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="236407813"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="479641172"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: SOF: Intel: hda: add quirks for HDAudio DMA
 position information
Date: Tue,  7 Dec 2021 13:39:45 -0600
Message-Id: <20211207193947.71080-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
References: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

The code inherited from the Skylake driver does not seem to follow any
known hardware recommendations.

The only two recommended options are
a) use DPIB registers if VC1 traffic is not allowed
b) use DPIB DDR update if VC1 traffic is used

In all of SOF-based updated, VC1 is not supported so we can 'safely'
move to using DPIB registers only.

This patch keeps the legacy code, in case there was an undocumented
issue lost to history, and adds the DPIB DDR update for additional
debug.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 86 +++++++++++++++++++++++++----------
 sound/soc/sof/intel/hda.c     |  9 +++-
 sound/soc/sof/intel/hda.h     |  6 +++
 3 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 974383cd0440..d78aa5d8552d 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -202,38 +202,74 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 		goto found;
 	}
 
-	/*
-	 * DPIB/posbuf position mode:
-	 * For Playback, Use DPIB register from HDA space which
-	 * reflects the actual data transferred.
-	 * For Capture, Use the position buffer for pointer, as DPIB
-	 * is not accurate enough, its update may be completed
-	 * earlier than the data written to DDR.
-	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
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
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
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
+			usleep_range(20, 21);
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
 		pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
 				       AZX_REG_VS_SDXDPIB_XBASE +
 				       (AZX_REG_VS_SDXDPIB_XINTERVAL *
 					hstream->index));
-	} else {
+		break;
+	case SOF_HDA_POSITION_QUIRK_USE_DPIB_DDR_UPDATE:
 		/*
-		 * For capture stream, we need more workaround to fix the
-		 * position incorrect issue:
-		 *
-		 * 1. Wait at least 20us before reading position buffer after
-		 * the interrupt generated(IOC), to make sure position update
-		 * happens on frame boundary i.e. 20.833uSec for 48KHz.
-		 * 2. Perform a dummy Read to DPIB register to flush DMA
-		 * position value.
-		 * 3. Read the DMA Position from posbuf. Now the readback
-		 * value should be >= period boundary.
+		 * This is the recommended option when VC1 is enabled.
+		 * While this isn't needed for SOF platforms it's added for
+		 * consistency and debug.
 		 */
-		usleep_range(20, 21);
-		snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
-				 AZX_REG_VS_SDXDPIB_XBASE +
-				 (AZX_REG_VS_SDXDPIB_XINTERVAL *
-				  hstream->index));
 		pos = snd_hdac_stream_get_pos_posbuf(hstream);
+		break;
+	default:
+		dev_err_once(sdev->dev, "hda_position_quirk value %d not supported\n",
+			     sof_hda_position_quirk);
+		pos = 0;
+		break;
 	}
 
 	if (pos >= hstream->bufsize)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index cfe026dbf124..dabbd5d908f6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -432,6 +432,10 @@ MODULE_PARM_DESC(use_msi, "SOF HDA use PCI MSI mode");
 #define hda_use_msi	(1)
 #endif
 
+int sof_hda_position_quirk = SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS;
+module_param_named(position_quirk, sof_hda_position_quirk, int, 0444);
+MODULE_PARM_DESC(position_quirk, "SOF HDaudio position quirk");
+
 static char *hda_model;
 module_param(hda_model, charp, 0444);
 MODULE_PARM_DESC(hda_model, "Use the given HDA board model.");
@@ -610,7 +614,10 @@ static int hda_init(struct snd_sof_dev *sdev)
 	/* HDA bus init */
 	sof_hda_bus_init(bus, &pci->dev);
 
-	bus->use_posbuf = 1;
+	if (sof_hda_position_quirk == SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS)
+		bus->use_posbuf = 0;
+	else
+		bus->use_posbuf = 1;
 	bus->bdl_pos_adj = 0;
 	bus->sync_write = 1;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e2055b6c8139..cb71d9d5cf6c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -740,4 +740,10 @@ struct sof_ipc_dai_config;
 int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w, unsigned int quirk_flags);
 int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_flags);
 
+#define SOF_HDA_POSITION_QUIRK_USE_SKYLAKE_LEGACY	(0) /* previous implementation */
+#define SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS	(1) /* recommended if VC0 only */
+#define SOF_HDA_POSITION_QUIRK_USE_DPIB_DDR_UPDATE	(2) /* recommended with VC0 or VC1 */
+
+extern int sof_hda_position_quirk;
+
 #endif
-- 
2.25.1

