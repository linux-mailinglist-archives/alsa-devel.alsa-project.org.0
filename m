Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13702143532
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 02:31:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62DA167A;
	Tue, 21 Jan 2020 02:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62DA167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579570300;
	bh=xcJ40xA6rnWGbBUB2CshMUuDTPJlkDB2nljAsJeE4S4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qWLUNWihE3zDPWsVrWkVrPFo2bbWOHPBiXHlazoIjF6UQQNv9R49pUOKQhkDnk1Rk
	 mkLfJhrvzq8ouIYr1x4yUFazKzPCPj/5ORDpIzc3oZQTNFwCA9RzIIVvsicYAEHlV4
	 kRPu0PSOCB/n4d/eBG2MepEao0HsWvJw3ebobCHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF3FF802A1;
	Tue, 21 Jan 2020 02:26:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F27F80272; Tue, 21 Jan 2020 02:25:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D192F800C6
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 02:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D192F800C6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 17:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="258880028"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 17:25:47 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Mon, 20 Jan 2020 21:29:28 +0800
Message-Id: <20200120132928.25257-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
References: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH RFC v4 6/6] ASoC: pcm: check if cpu DAI support
	the given stream
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Now multi-cpu-dai is supported. We have the same resaon as
multi-codec-dai to skip CPUs which don't support the current stream.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/soc-pcm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a1e84bbc5258..948363b3e610 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -417,6 +417,20 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
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
 		cpu_dai_drv = cpu_dai->driver;
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			cpu_stream = &cpu_dai_drv->playback;
@@ -945,6 +959,13 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
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
@@ -980,6 +1001,9 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 interface_err:
 	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai) {
+		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
+			continue;
+
 		snd_soc_dai_hw_free(cpu_dai, substream);
 		cpu_dai->rate = 0;
 	}
@@ -1055,8 +1079,12 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
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
@@ -1807,6 +1835,13 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
 		int i;
 
 		for_each_rtd_cpu_dai(be, i, dai) {
+			/*
+			 * Skip CPUs which don't support the current stream
+			 * type. See soc_pcm_init_runtime_hw() for more details
+			 */
+			if (!snd_soc_dai_stream_valid(dai, stream))
+				continue;
+
 			cpu_dai_drv =  dai->driver;
 			if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 				cpu_stream = &cpu_dai_drv->playback;
@@ -1866,6 +1901,13 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 		int i;
 
 		for_each_rtd_cpu_dai(be, i, dai) {
+			/*
+			 * Skip CPUs which don't support the current stream
+			 * type. See soc_pcm_init_runtime_hw() for more details
+			 */
+			if (!snd_soc_dai_stream_valid(dai, stream))
+				continue;
+
 			cpu_dai_drv =  dai->driver;
 			if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 				cpu_stream = &cpu_dai_drv->playback;
@@ -1911,6 +1953,13 @@ static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
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

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
