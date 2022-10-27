Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 979DB60F758
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 14:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 133223083;
	Thu, 27 Oct 2022 14:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 133223083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666874008;
	bh=3f4kH9guzDKd0tZe3rePE0YTUNF++plqK87nxUjOZs4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUIPsSqG15wI7gB1Wgy5eJNZRu1HsSRjoc/6xpClp8+8xGCNsVG5M1fVxv1iC489V
	 hX1KmOxTD75Ze4DUUNOKx2uhrya4FlqkE8LxzGjMgdAhNHUgFEA3XY+b1Olz5F8P0Y
	 1tWel80EuUrOtOlGFxpOe/o2h51vtRECaGS58xB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C34F80587;
	Thu, 27 Oct 2022 14:30:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3842F80568; Thu, 27 Oct 2022 14:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F100BF8054A
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 14:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F100BF8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V/G6Z96K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666873828; x=1698409828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3f4kH9guzDKd0tZe3rePE0YTUNF++plqK87nxUjOZs4=;
 b=V/G6Z96KHiHK9bdjwyfgjx3J/j4izV7HIY7/qx0DKWF7btbKftdMzfj6
 ++ka0orOTRrUd6oSIhrydteYctJu8kMkHy8k5heGrFOJuuu4z6n7t01ob
 maP2JrKUthM+ObdYdebDQ0KhnH2IzpMcWuANK5sPFEV3ySwZlXF05K4yF
 aZ64ssf+CmUJqu2g3xTmTGBpD+cqNqki4ZYBqsnhRrFtcE6SOUeGXFZi1
 43h8wx3jfQqOTseTCCi0eyTAn2EY1sjdtOp7SlCv6eEHwRN3+FqAur0gZ
 yF7bFvjqAeifD6LL4Usab8wEOGwi8/fh4JGs6rLHxu8/u22CKnHjx3pAy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334839926"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="334839926"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 05:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="807435715"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="807435715"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 27 Oct 2022 05:30:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 5/9] ASoC: Intel: avs: Restart instead of resuming HDA
 capture streams
Date: Thu, 27 Oct 2022 14:46:58 +0200
Message-Id: <20221027124702.1761002-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027124702.1761002-1-cezary.rojewski@intel.com>
References: <20221027124702.1761002-1-cezary.rojewski@intel.com>
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
index db29496e16ab..660129508c08 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1004,34 +1004,34 @@ static int avs_component_resume(struct snd_soc_component *component)
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
@@ -1375,9 +1375,15 @@ static int avs_component_hda_open(struct snd_soc_component *component,
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

