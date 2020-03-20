Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B5018CDF6
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 13:38:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E88817C9;
	Fri, 20 Mar 2020 13:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E88817C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584707913;
	bh=EeY0ocnz77B9jVm/1NQrhD45xQVWUI07vrz7IXQloYc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=muJrX4bVt84whZ3gESPNmJp7CFoEg1ve0qn2PfZtT0r3JueJyK3SjfgEuULNS1Ex4
	 hmAermisEBrEapaaeQXg4YwNUDZ6SQ6JG23ApMR5+VyOdazIJP7clEJMB177EUNyFX
	 pmh/QFSXG3U1oM2EVMGnakABcrrDI1JSzjg/mupg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20804F80171;
	Fri, 20 Mar 2020 13:36:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64269F8015B; Fri, 20 Mar 2020 13:36:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 360B8F800C0;
 Fri, 20 Mar 2020 13:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 360B8F800C0
IronPort-SDR: ZEZrqJYGHY2hmJzJ6W8aK9dt3biykd3hBWz5qZBdgq6CaZE6KkV0BOSaYOoyCRKegKpqbMq1jg
 kcejlgKOSH2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 05:36:36 -0700
IronPort-SDR: JpHnsLviVUSZA3djk/kYiaPm75d1DifVyvtYPTyVSJz3RHi+SddmMJzjAfMAZmxcwFyduDogWz
 Qh5qR9wYovyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="234496779"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.57.199])
 by orsmga007.jf.intel.com with ESMTP; 20 Mar 2020 05:36:35 -0700
Date: Fri, 20 Mar 2020 13:36:34 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: fix uninitialised "work" with VirtIO
Message-ID: <20200320123634.GB2130@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Brown <broonie@kernel.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>, sound-open-firmware@alsa-project.org
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

In the VirtIO case the sof_pcm_open() function isn't called on the
host during guest streaming, which then leaves "work" structures
uninitialised. However it is then used to handle position update
messages from the DSP. Move their initialisation to immediately after
allocation of the containing structure.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---

This is a re-send of "[PATCH 08/14] ASoC: SOF: fix uninitialised "work" 
with VirtIO" as suggested by Mark, also taking into account a comment 
from Ranjani - thanks. Note: I haven't sent patches before from mutt, 
hope this will work, if not - will have to re-send.

 sound/soc/sof/pcm.c       |  4 +---
 sound/soc/sof/sof-audio.h |  3 +++
 sound/soc/sof/topology.c  | 17 ++++++++++++-----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index f4769e1..47cd741 100644
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
index eacd10e..bf65f31a 100644
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
index 058de94..fe8ba3e 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/firmware.h>
+#include <linux/workqueue.h>
 #include <sound/tlv.h>
 #include <sound/pcm_params.h>
 #include <uapi/sound/sof/tokens.h>
@@ -2448,7 +2449,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	struct snd_soc_tplg_stream_caps *caps;
 	struct snd_soc_tplg_private *private = &pcm->priv;
 	struct snd_sof_pcm *spcm;
-	int stream = SNDRV_PCM_STREAM_PLAYBACK;
+	int stream;
 	int ret = 0;
 
 	/* nothing to do for BEs atm */
@@ -2460,8 +2461,12 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 		return -ENOMEM;
 
 	spcm->scomp = scomp;
-	spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id = COMP_ID_UNASSIGNED;
-	spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id = COMP_ID_UNASSIGNED;
+
+	for_each_pcm_streams(stream) {
+		spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
+		INIT_WORK(&spcm->stream[stream].period_elapsed_work,
+			  snd_sof_pcm_period_elapsed_work);
+	}
 
 	spcm->pcm = *pcm;
 	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
@@ -2482,8 +2487,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	if (!spcm->pcm.playback)
 		goto capture;
 
+	stream = SNDRV_PCM_STREAM_PLAYBACK;
+
 	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
-		 spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
+		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
 
 	caps = &spcm->pcm.caps[stream];
 
@@ -2513,7 +2520,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 		return ret;
 
 	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
-		 spcm->pcm.pcm_name, spcm->stream[1].d0i3_compatible);
+		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
 
 	caps = &spcm->pcm.caps[stream];
 
-- 
1.9.3

