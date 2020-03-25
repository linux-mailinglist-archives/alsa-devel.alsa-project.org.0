Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD1C19326E
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:16:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CF20168A;
	Wed, 25 Mar 2020 22:15:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CF20168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585170983;
	bh=tYsDTRHzNoeBtcLaFEbwWyl88y4XhD20nTEJq3sCxx4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vkrJ0mPLKPa0uggbyokJuGavID+Z2X1cjdmxLnIbXWsDtDqR0MU1QHgfgTnr8YWVg
	 Y4kEq7+mHcTX1gZlTG1tSOhQCUy2wa4ZhgVhs9h4ipwyww5Us9OjHOy8yj9E78Q5+z
	 kfoIjA7HLAV2wSRffuXO+pGYv9OLa7cD7b+L2zKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1291F802A0;
	Wed, 25 Mar 2020 22:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E855F8025A; Wed, 25 Mar 2020 22:12:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE412F8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE412F8011E
IronPort-SDR: O4HkPtGyM8+TqRsXSH6QSFUzGa71F2DPt3i0fbWzA0BNVDWaYwTOs5qk1JNURLMj+fTAugoue0
 BeMDUztI49lA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:12:46 -0700
IronPort-SDR: yVTUyCx3BXcJh6f8BMYzdbia9Cg16DP3IU9r1whJsqTmlBfCfCYs6pDFz+yfpkLm7nYviu5fOs
 UK96KmkWBFdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="357935830"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 14:12:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: SOF: fix uninitialised "work" with VirtIO
Date: Wed, 25 Mar 2020 16:12:31 -0500
Message-Id: <20200325211233.27394-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325211233.27394-1-pierre-louis.bossart@linux.intel.com>
References: <20200325211233.27394-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

In the VirtIO case the sof_pcm_open() function isn't called on the
host during guest streaming, which then leaves "work" structures
uninitialised. However it is then used to handle position update
messages from the DSP. Move their initialisation to immediately after
allocation of the containing structure.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c       | 4 +---
 sound/soc/sof/sof-audio.h | 3 +++
 sound/soc/sof/topology.c  | 6 +++++-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index f4769e19965a..47cd741f2a8c 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -57,7 +57,7 @@ static int sof_pcm_dsp_params(struct snd_sof_pcm *spcm, struct snd_pcm_substream
 /*
  * sof pcm period elapse work
  */
-static void sof_pcm_period_elapsed_work(struct work_struct *work)
+void snd_sof_pcm_period_elapsed_work(struct work_struct *work)
 {
 	struct snd_sof_pcm_stream *sps =
 		container_of(work, struct snd_sof_pcm_stream,
@@ -475,8 +475,6 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: open stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
-	INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
-		  sof_pcm_period_elapsed_work);
 
 	caps = &spcm->pcm.caps[substream->stream];
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index eacd10e4da11..bf65f31af858 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -11,6 +11,8 @@
 #ifndef __SOUND_SOC_SOF_AUDIO_H
 #define __SOUND_SOC_SOF_AUDIO_H
 
+#include <linux/workqueue.h>
+
 #include <sound/soc.h>
 #include <sound/control.h>
 #include <sound/sof/stream.h> /* needs to be included before control.h */
@@ -189,6 +191,7 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
 struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component *scomp,
 					     unsigned int pcm_id);
 void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
+void snd_sof_pcm_period_elapsed_work(struct work_struct *work);
 
 /*
  * Mixer IPC
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 54437caf9488..fe8ba3e05e08 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/firmware.h>
+#include <linux/workqueue.h>
 #include <sound/tlv.h>
 #include <sound/pcm_params.h>
 #include <uapi/sound/sof/tokens.h>
@@ -2461,8 +2462,11 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 
 	spcm->scomp = scomp;
 
-	for_each_pcm_streams(stream)
+	for_each_pcm_streams(stream) {
 		spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
+		INIT_WORK(&spcm->stream[stream].period_elapsed_work,
+			  snd_sof_pcm_period_elapsed_work);
+	}
 
 	spcm->pcm = *pcm;
 	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
-- 
2.20.1

