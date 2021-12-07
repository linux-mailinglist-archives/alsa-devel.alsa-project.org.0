Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26A46C27A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 19:12:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BE324A8;
	Tue,  7 Dec 2021 19:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BE324A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638900733;
	bh=cJlIOT0dYZwwDPuhs+MI3a7MBQGJOAal/S6WWQ3P8O0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O87y0oq7pL7Pw7GupV0KdSA5R0ZT6Eyael0WN5gNUDekX14ROjzo0XGWrFq2kIxQZ
	 jG+Cr1GBHpbg42BthQGpLhOPc8F0kQSXX4ohD649cu3ZrXO+8NUxAUwnW9Ql+M9aNQ
	 MxRAdIDPj6ga5nhNWJLkAMPdT2trPP8FY96abcMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA31F80511;
	Tue,  7 Dec 2021 19:09:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E194F80516; Tue,  7 Dec 2021 19:09:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F473F804E4
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 19:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F473F804E4
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237873623"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="237873623"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:38:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="751385252"
Received: from charriso-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.98.250])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:38:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: soc-pcm: test refcount before triggering
Date: Tue,  7 Dec 2021 11:37:44 -0600
Message-Id: <20211207173745.15850-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207173745.15850-1-pierre-louis.bossart@linux.intel.com>
References: <20211207173745.15850-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On start/pause_release/resume, when more than one FE is connected to
the same BE, it's possible that the trigger is sent more than
once. This is not desirable, we only want to trigger a BE once, which
is straightforward to implement with a refcount.

For stop/pause/suspend, the problem is more complicated: the check
implemented in snd_soc_dpcm_can_be_free_stop() may fail due to a
conceptual deadlock when we trigger the BE before the FE. In this
case, the FE states have not yet changed, so there are corner cases
where the TRIGGER_STOP is never sent - the dual case of start where
multiple triggers might be sent.

This patch suggests an unconditional trigger in all cases, without
checking the FE states, using a refcount protected by the BE PCM
stream lock.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/soc-dpcm.h |  2 ++
 sound/soc/soc-pcm.c      | 53 +++++++++++++++++++++++++++++++---------
 2 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index bc7af90099a8..75b92d883976 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -101,6 +101,8 @@ struct snd_soc_dpcm_runtime {
 	enum snd_soc_dpcm_state state;
 
 	int trigger_pending; /* trigger cmd + 1 if pending, 0 if not */
+
+	int be_start; /* refcount protected by BE stream pcm lock */
 };
 
 #define for_each_dpcm_fe(be, stream, _dpcm)				\
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7043857e30b1..05a0f52eb11b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1619,7 +1619,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 			goto unwind;
 		}
-
+		be->dpcm[stream].be_start = 0;
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 		count++;
 	}
@@ -2105,14 +2105,21 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
-			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
+			if (!be->dpcm[stream].be_start &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
+			be->dpcm[stream].be_start++;
+			if (be->dpcm[stream].be_start != 1)
+				goto next;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start--;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2120,9 +2127,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND))
 				goto next;
 
+			be->dpcm[stream].be_start++;
+			if (be->dpcm[stream].be_start != 1)
+				goto next;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start--;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2130,9 +2143,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
+			be->dpcm[stream].be_start++;
+			if (be->dpcm[stream].be_start != 1)
+				goto next;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start--;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2141,12 +2160,18 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+				be->dpcm[stream].be_start--;
+
+			if (be->dpcm[stream].be_start != 0)
 				goto next;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+					be->dpcm[stream].be_start++;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
 			break;
@@ -2154,12 +2179,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				goto next;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			be->dpcm[stream].be_start--;
+			if (be->dpcm[stream].be_start != 0)
 				goto next;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start++;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_SUSPEND;
 			break;
@@ -2167,12 +2195,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				goto next;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			be->dpcm[stream].be_start--;
+			if (be->dpcm[stream].be_start != 0)
 				goto next;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start++;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
 			break;
-- 
2.25.1

