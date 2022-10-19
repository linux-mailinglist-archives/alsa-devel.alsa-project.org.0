Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B104A604F04
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B13A8DD;
	Wed, 19 Oct 2022 19:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B13A8DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666201215;
	bh=ZjS/LWGEcU8ADNV5Pup52JOGpU2MPFMzJr4TyS6rqoE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rKKdE5gx+MzAuI1WN6dY4iciHLnsQwmFy9lzaBvyjSW7pt5TLp3r7nWhGAC26AHMq
	 ryPv1wj1fjn4vbgqPNAWw/NHgI6X1Vfzv8J6xJzW2n+yEVjfs3gCUi9z7VdoSO/1Cy
	 FA1tw93ppZ1WV2wmPQXDYG9FuywojKmbBOdgx71g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9726F804CB;
	Wed, 19 Oct 2022 19:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5428DF80528; Wed, 19 Oct 2022 19:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C64FF80528
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C64FF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qke1VHV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201056; x=1697737056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZjS/LWGEcU8ADNV5Pup52JOGpU2MPFMzJr4TyS6rqoE=;
 b=Qke1VHV+hUaUSfXDBdEKF5OvPUE0a6z2LirfAkzWB6WerlQUYoXvUzy6
 BlYckyLX4NDkPekwcgJtMFEiroOZ6xPTvjOyCmAd7H86snMyB7yIyU0MK
 G/RC6TN4RTnnq1MsxpzKqjVaV2FCJjzH3Tk6x4mt705rQU94mH3F6XNTz
 ZNN/TrnhPD/AFjg4mkikNN4gmzJOKJTkpzch7oJcuBYUGjpqhvMk4VGMV
 SfA7d257rRdI3VHmcp+RUQzK6JLfMLYFX8acINQn3qH6cq2NOqwtPA7u/
 h03FItYmwFgiRXewqHqkEdD8XZARUog/D17DKADZdVcUF6UJQ3GZTujIX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333045680"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333045680"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771898539"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="771898539"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 10:37:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/8] ASoC: Intel: avs: Restart instead of resuming HDA capture
 streams
Date: Wed, 19 Oct 2022 19:53:13 +0200
Message-Id: <20221019175317.1540919-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019175317.1540919-1-cezary.rojewski@intel.com>
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Resuming of capture streams for HD-Audio is unsupported so remove the
relevant flag from the hardware params when assigning them during
avs_component_hda_open().

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 50 ++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 5c9923cba126..cce3756e2a4e 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1023,34 +1023,34 @@ static int avs_component_resume(struct snd_soc_component *component)
 	return avs_component_resume_prepare(component, false);
 }
 
+static const struct snd_pcm_hardware avs_pcm_hardware = {
+	.info			= SNDRV_PCM_INFO_MMAP |
+				  SNDRV_PCM_INFO_MMAP_VALID |
+				  SNDRV_PCM_INFO_INTERLEAVED |
+				  SNDRV_PCM_INFO_PAUSE |
+				  SNDRV_PCM_INFO_RESUME |
+				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
+				  SNDRV_PCM_FMTBIT_S24_LE |
+				  SNDRV_PCM_FMTBIT_S32_LE,
+	.buffer_bytes_max	= AZX_MAX_BUF_SIZE,
+	.period_bytes_min	= 128,
+	.period_bytes_max	= AZX_MAX_BUF_SIZE / 2,
+	.periods_min		= 2,
+	.periods_max		= AZX_MAX_FRAG,
+	.fifo_size		= 0,
+};
+
 static int avs_component_open(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
-	struct snd_pcm_hardware hwparams;
 
 	/* only FE DAI links are handled here */
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	hwparams.info = SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_RESUME |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP;
-
-	hwparams.formats = SNDRV_PCM_FMTBIT_S16_LE |
-			   SNDRV_PCM_FMTBIT_S24_LE |
-			   SNDRV_PCM_FMTBIT_S32_LE;
-	hwparams.period_bytes_min = 128;
-	hwparams.period_bytes_max = AZX_MAX_BUF_SIZE / 2;
-	hwparams.periods_min = 2;
-	hwparams.periods_max = AZX_MAX_FRAG;
-	hwparams.buffer_bytes_max = AZX_MAX_BUF_SIZE;
-	hwparams.fifo_size = 0;
-
-	return snd_soc_set_runtime_hwparams(substream, &hwparams);
+	return snd_soc_set_runtime_hwparams(substream, &avs_pcm_hardware);
 }
 
 static unsigned int avs_hda_stream_dpib_read(struct hdac_ext_stream *stream)
@@ -1394,9 +1394,15 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 	struct hdac_ext_stream *link_stream;
 	struct hda_codec *codec;
 
-	/* only BE DAI links are handled here */
-	if (!rtd->dai_link->no_pcm)
-		return avs_component_open(component, substream);
+	if (!rtd->dai_link->no_pcm) {
+		struct snd_pcm_hardware hwparams = avs_pcm_hardware;
+
+		/* RESUME unsupported for de-coupled HD-Audio capture. */
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			hwparams.info &= ~SNDRV_PCM_INFO_RESUME;
+
+		return snd_soc_set_runtime_hwparams(substream, &hwparams);
+	}
 
 	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
 	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
-- 
2.25.1

