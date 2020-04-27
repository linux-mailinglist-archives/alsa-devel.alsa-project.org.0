Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A101BAB8A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 19:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F6816B5;
	Mon, 27 Apr 2020 19:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F6816B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588009441;
	bh=KkbaosToRHBWEpGwKtm4KXDZRpl+0WDnkcPNCaseRVM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ChdjHggiuYa47YnWKv2dKEWgmz4Qxed5yN+eEHgTi5hCkkB9XKRlfidQ1mHXO5dof
	 Wm9OL4/fElRi1a1J3wgxiQPfVNYCXGGZ0EyN2mVVCOf0lII5Gk1XRWgH5UaHvEWyxn
	 LmQSXW5JmhruLaWOas8jhOMIpIgAeIwwKuEC6+xQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89215F802F9;
	Mon, 27 Apr 2020 19:30:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85D20F802EA; Mon, 27 Apr 2020 19:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FC01F802DC
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 19:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC01F802DC
IronPort-SDR: 4IECd9F2UniqMIlyHQkcZCIQqclMK/qLNcPqM8O1WgJu1LBZdFgANCotarL/1Hi6QPC6Yd2pXf
 MThd56Fs0uZg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 10:29:40 -0700
IronPort-SDR: AGkkGpDJobXofbSL9P+f2mXgvr0jsQ8DgljSef+Js+tam8FPIJM3g/e1vF+LdzJIFNTcLU93lW
 VmU38KlKil/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="458935999"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 10:29:40 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: Intel: change trigger sequence to fix pop
 noise when stopping playback on sdw platforms
Date: Mon, 27 Apr 2020 10:29:39 -0700
Message-Id: <20200427172939.25848-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
References: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, randerwang <rander.wang@linux.intel.com>
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

From: randerwang <rander.wang@linux.intel.com>

Now the trigger sequence is set to SND_SOC_DPCM_TRIGGER_POST for
SOF. This means FE will be stopped before BE, so BE will consume
invalid data and this generates huge pop noise. This sequence is
introduced for HDA DAI which requires SND_SOC_DPCM_TRIGGER_POST for
some reasons. Now set default trigger sequence to SND_SOC_DPCM_TRIGGER_PRE
for playback with all DAI and fix sequence only for HDA DAI.

Fully tested on Comet Lake for a few cycles.

Signed-off-by: randerwang <rander.wang@linux.intel.com>
Reviewed-by: Clarex Zhou <clarex.zhou@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c      | 12 +++++++++++-
 sound/soc/sof/topology.c | 14 +++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 0885826adb6c..e9679fcba428 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -639,6 +639,7 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
+	struct snd_soc_dpcm *dpcm;
 
 	/* no topology exists for this BE, try a common configuration */
 	if (!dai) {
@@ -702,7 +703,16 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		}
 		break;
 	case SOF_DAI_INTEL_HDA:
-		/* do nothing for HDA dai_link */
+		/*
+		 * HDaudio does not follow the default trigger
+		 * sequence due to firmware implementation
+		 */
+		for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
+			struct snd_soc_pcm_runtime *fe = dpcm->fe;
+
+			fe->dai_link->trigger[SNDRV_PCM_STREAM_PLAYBACK] =
+				SND_SOC_DPCM_TRIGGER_POST;
+		}
 		break;
 	case SOF_DAI_INTEL_ALH:
 		/* do nothing for ALH dai_link */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 6fd75fe9f699..8ab0fc558054 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3111,9 +3111,17 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	if (!link->no_pcm) {
 		link->nonatomic = true;
 
-		/* set trigger order */
-		link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
-		link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
+		/*
+		 * set default trigger order for all links. Exceptions to
+		 * the rule will be handled in sof_pcm_dai_link_fixup()
+		 * For playback, the sequence is the following: start FE,
+		 * start BE, stop BE, stop FE; for Capture the sequence is
+		 * inverted start BE, start FE, stop FE, stop BE
+		 */
+		link->trigger[SNDRV_PCM_STREAM_PLAYBACK] =
+					SND_SOC_DPCM_TRIGGER_PRE;
+		link->trigger[SNDRV_PCM_STREAM_CAPTURE] =
+					SND_SOC_DPCM_TRIGGER_POST;
 
 		/* nothing more to do for FE dai links */
 		return 0;
-- 
2.17.1

