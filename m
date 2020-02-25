Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8C16F528
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 02:40:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4549169E;
	Wed, 26 Feb 2020 02:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4549169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582681226;
	bh=+rDKAYg9GX/O440tvSicowPPrdl+NfZNnd2Wg7T03Tc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CFD5iTxtCh/JntjsblSoSjR3mPcSBjx8RD3IHfcXWMZz7RROEgCij+ypYPiWqOqcQ
	 jlC9G3QpN7tBkYjcL5XGMRetvpna0Dz8zmAQIr1v1iY54TC8ka0OlBX6EzYohNAi0O
	 4Ds5D208h0tmk40lzzhJxqCS58e+Av6LGC2qlSZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32EFCF802BD;
	Wed, 26 Feb 2020 02:35:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CA6FF8027D; Wed, 26 Feb 2020 02:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19F92F8025E
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 02:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19F92F8025E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 17:35:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,486,1574150400"; d="scan'208";a="436461014"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2020 17:35:20 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH v5 6/6] ASoC: pcm: check if cpu-dai supports a given stream
Date: Tue, 25 Feb 2020 21:39:17 +0800
Message-Id: <20200225133917.21314-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225133917.21314-1-yung-chuan.liao@linux.intel.com>
References: <20200225133917.21314-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
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

Now multi-cpu-dais are supported, we can skip cpi-dais which don't
support the current stream, following the example of multi-codec-dais.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-pcm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index adbceaff07b8..90857138c823 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -607,6 +607,20 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
 	/* first calculate min/max only for CPUs in the DAI link */
 	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+
+		/*
+		 * Skip CPUs which don't support the current stream type.
+		 * Otherwise, since the rate, channel, and format values will
+		 * zero in that case, we would have no usable settings left,
+		 * causing the resulting setup to fail.
+		 * At least one CPU should match, otherwise we should have
+		 * bailed out on a higher level, since there would be no
+		 * CPU to support the transfer direction in that case.
+		 */
+		if (!snd_soc_dai_stream_valid(cpu_dai,
+					      substream->stream))
+			continue;
+
 		cpu_stream = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
 
 		cpu_chan_min = max(cpu_chan_min, cpu_stream->channels_min);
@@ -1115,6 +1129,13 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		/*
+		 * Skip CPUs which don't support the current stream
+		 * type. See soc_pcm_init_runtime_hw() for more details
+		 */
+		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
+			continue;
+
 		ret = snd_soc_dai_hw_params(cpu_dai, substream, params);
 		if (ret < 0)
 			goto interface_err;
@@ -1150,6 +1171,9 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 interface_err:
 	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai) {
+		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
+			continue;
+
 		snd_soc_dai_hw_free(cpu_dai, substream);
 		cpu_dai->rate = 0;
 	}
@@ -1226,8 +1250,12 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 		snd_soc_dai_hw_free(codec_dai, substream);
 	}
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
+			continue;
+
 		snd_soc_dai_hw_free(cpu_dai, substream);
+	}
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 	return 0;
@@ -1904,6 +1932,13 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
 		int i;
 
 		for_each_rtd_cpu_dai(be, i, dai) {
+			/*
+			 * Skip CPUs which don't support the current stream
+			 * type. See soc_pcm_init_runtime_hw() for more details
+			 */
+			if (!snd_soc_dai_stream_valid(dai, stream))
+				continue;
+
 			cpu_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			*channels_min = max(*channels_min,
@@ -1952,6 +1987,13 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 		int i;
 
 		for_each_rtd_cpu_dai(be, i, dai) {
+			/*
+			 * Skip CPUs which don't support the current stream
+			 * type. See soc_pcm_init_runtime_hw() for more details
+			 */
+			if (!snd_soc_dai_stream_valid(dai, stream))
+				continue;
+
 			cpu_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			*rate_min = max(*rate_min, cpu_stream->rate_min);
@@ -1989,6 +2031,13 @@ static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
 	int i;
 
 	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		/*
+		 * Skip CPUs which don't support the current stream
+		 * type. See soc_pcm_init_runtime_hw() for more details
+		 */
+		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
+			continue;
+
 		cpu_dai_drv = cpu_dai->driver;
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			dpcm_init_runtime_hw(runtime, &cpu_dai_drv->playback);
-- 
2.17.1

