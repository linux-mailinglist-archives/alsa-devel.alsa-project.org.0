Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E23B49DD
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 22:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBE68168D;
	Fri, 25 Jun 2021 22:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBE68168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624654386;
	bh=bawFJd6qyqnJzm2qUBrDdGXqVCckv0Ui7JyHBWA4MMo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MU9Q8YGi3yti3WzraR4rwzIdJIxJgxoxJqoSjOraXpTN4h7Nz5rncsSnOpkxcOH+A
	 UUD4CM6bR+8e/ctYzEITS+FGO31K/B4vV3vldPwVtqqJdY0vFPkL0w02K/083oQzM5
	 s9xhhIsUfsLd4GG2CwTgOfUvnRo54LOIqEdhlAfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 045E7F8012C;
	Fri, 25 Jun 2021 22:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD3E0F804C2; Fri, 25 Jun 2021 22:51:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08982F8016D
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 22:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08982F8016D
IronPort-SDR: DsIKODDJpiUx2sWsnFGVHeIUocvSRPGemxj0zt8+p61KMvFN3hIZ9AAv+Cpx6TOOoj8GhmAf+2
 RbX6bFu4RITw==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="188122676"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="188122676"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:51:09 -0700
IronPort-SDR: xkSJ0+R/7FukS+OtvGezGTta9LIeb6sDbYFfISj41tX6o0sbIjQzHX0F8iPyGjhi95Lw+cxOjV
 jvSokwwYQZHg==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="640223020"
Received: from rlcervan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.127.151])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:50:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: Intel: boards: fix xrun issue on platform with
 max98373
Date: Fri, 25 Jun 2021 15:50:39 -0500
Message-Id: <20210625205042.65181-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
References: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

From: Rander Wang <rander.wang@intel.com>

On TGL platform with max98373 codec the trigger start sequence is
fe first, then codec component and sdw link is the last. Recently
a delay was introduced in max98373 codec driver and this resulted
to the start of sdw stream transmission was delayed and the data
transmitted by fw can't be consumed by sdw controller, so xrun happened.

Adding delay in trigger function is a bad idea. This patch enable spk
pin in prepare function and disable it in hw_free to avoid xrun issue
caused by delay in trigger.

Fixes: 3a27875e91fb ("ASoC: max98373: Added 30ms turn on/off time delay")
BugLink: https://github.com/thesofproject/sof/issues/4066
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_max98373.c | 81 +++++++++++++++--------
 1 file changed, 53 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_max98373.c b/sound/soc/intel/boards/sof_sdw_max98373.c
index 0e7ed906b341..25daef910aee 100644
--- a/sound/soc/intel/boards/sof_sdw_max98373.c
+++ b/sound/soc/intel/boards/sof_sdw_max98373.c
@@ -55,43 +55,68 @@ static int spk_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-static int max98373_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
+static int mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enable)
 {
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
 	int ret;
+	int j;
 
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		/* enable max98373 first */
-		ret = max_98373_trigger(substream, cmd);
-		if (ret < 0)
-			break;
-
-		ret = sdw_trigger(substream, cmd);
-		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = sdw_trigger(substream, cmd);
-		if (ret < 0)
-			break;
-
-		ret = max_98373_trigger(substream, cmd);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
+	/* set spk pin by playback only */
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
+		struct snd_soc_dapm_context *dapm =
+				snd_soc_component_get_dapm(cpu_dai->component);
+		char pin_name[16];
+
+		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
+			 codec_dai->component->name_prefix);
+
+		if (enable)
+			ret = snd_soc_dapm_enable_pin(dapm, pin_name);
+		else
+			ret = snd_soc_dapm_disable_pin(dapm, pin_name);
+
+		if (!ret)
+			snd_soc_dapm_sync(dapm);
 	}
 
-	return ret;
+	return 0;
+}
+
+static int mx8373_sdw_prepare(struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+
+	/* according to soc_pcm_prepare dai link prepare is called first */
+	ret = sdw_prepare(substream);
+	if (ret < 0)
+		return ret;
+
+	return mx8373_enable_spk_pin(substream, true);
+}
+
+static int mx8373_sdw_hw_free(struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+
+	/* according to soc_pcm_hw_free dai link free is called first */
+	ret = sdw_hw_free(substream);
+	if (ret < 0)
+		return ret;
+
+	return mx8373_enable_spk_pin(substream, false);
 }
 
 static const struct snd_soc_ops max_98373_sdw_ops = {
 	.startup = sdw_startup,
-	.prepare = sdw_prepare,
-	.trigger = max98373_sdw_trigger,
-	.hw_free = sdw_hw_free,
+	.prepare = mx8373_sdw_prepare,
+	.trigger = sdw_trigger,
+	.hw_free = mx8373_sdw_hw_free,
 	.shutdown = sdw_shutdown,
 };
 
-- 
2.25.1

