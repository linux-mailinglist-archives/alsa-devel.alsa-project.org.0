Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8651B3EF057
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 18:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED491678;
	Tue, 17 Aug 2021 18:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED491678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629218624;
	bh=fcD386Bc5zGf4//XdtSWEyQKdtw8HkFJvrV3MlUCHUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bHxUi84rUMztawEMLbVfz4XJN2yeCgHwgb84Ut7DjnDYY2Jgqnu1a1J/V9/R8bkok
	 tbkjDOsHZEZCy1HuSN3XlVnm5SU17EEt47jASdQCR7ngifN9bkZYOvNARjFutL7b0d
	 B6XoDPRGRhBuk7uirXrTi3B/PfdUoK/Yfh2WTskQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0F56F804E4;
	Tue, 17 Aug 2021 18:41:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E56EF80134; Tue, 17 Aug 2021 18:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08B2CF80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 18:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08B2CF80134
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="279884374"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="279884374"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 09:41:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="449342732"
Received: from aaadelek-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.12.89])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 09:41:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 2/2] ASoC: soc-pcm: test refcount before triggering
Date: Tue, 17 Aug 2021 11:40:54 -0500
Message-Id: <20210817164054.250028-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817164054.250028-1-pierre-louis.bossart@linux.intel.com>
References: <20210817164054.250028-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, liam.r.girdwood@linux.intel.com,
 vkoul@kernel.org, broonie@kernel.org
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
checking the FE states, using a refcount protected by a spinlock.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-dpcm.h |  2 ++
 sound/soc/soc-pcm.c      | 46 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index e296a3949b18..6cc751002da7 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -101,6 +101,8 @@ struct snd_soc_dpcm_runtime {
 	enum snd_soc_dpcm_state state;
 
 	int trigger_pending; /* trigger cmd + 1 if pending, 0 if not */
+
+	int be_start; /* refcount protected by dpcm_lock */
 };
 
 #define for_each_dpcm_fe(be, stream, _dpcm)				\
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 0717f39d2eec..b2440f2f9bf5 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1534,7 +1534,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 			goto unwind;
 		}
-
+		be->dpcm[stream].be_start = 0;
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 		count++;
 	}
@@ -2001,6 +2001,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 	int ret = 0;
 	unsigned long flags;
 	enum snd_soc_dpcm_state state;
+	bool do_trigger;
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_pcm_substream *be_substream;
@@ -2015,6 +2016,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		dev_dbg(be->dev, "ASoC: trigger BE %s cmd %d\n",
 			be->dai_link->name, cmd);
 
+		do_trigger = false;
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
 			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
@@ -2025,13 +2027,20 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 				continue;
 			}
 			state = be->dpcm[stream].state;
+			if (be->dpcm[stream].be_start == 0)
+				do_trigger = true;
+			be->dpcm[stream].be_start++;
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
+			if (!do_trigger)
+				continue;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret) {
 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 				be->dpcm[stream].state = state;
+				be->dpcm[stream].be_start--;
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
 			}
@@ -2045,13 +2054,20 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			}
 
 			state = be->dpcm[stream].state;
+			if (be->dpcm[stream].be_start == 0)
+				do_trigger = true;
+			be->dpcm[stream].be_start++;
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
+			if (!do_trigger)
+				continue;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret) {
 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 				be->dpcm[stream].state = state;
+				be->dpcm[stream].be_start--;
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
 			}
@@ -2065,13 +2081,20 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			}
 
 			state = be->dpcm[stream].state;
+			if (be->dpcm[stream].be_start == 0)
+				do_trigger = true;
+			be->dpcm[stream].be_start++;
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
+			if (!do_trigger)
+				continue;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret) {
 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 				be->dpcm[stream].state = state;
+				be->dpcm[stream].be_start--;
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
 			}
@@ -2084,9 +2107,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
 			}
+			if ((be->dpcm[stream].state == SND_SOC_DPCM_STATE_START &&
+			     be->dpcm[stream].be_start == 1) ||
+			    (be->dpcm[stream].state == SND_SOC_DPCM_STATE_PAUSED &&
+			     be->dpcm[stream].be_start == 0))
+				do_trigger = true;
+			be->dpcm[stream].be_start--;
 			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!do_trigger)
 				continue;
 
 			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
@@ -2098,6 +2127,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (ret) {
 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 				be->dpcm[stream].state = state;
+				be->dpcm[stream].be_start++;
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
 			}
@@ -2109,9 +2139,12 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
 			}
+			if (be->dpcm[stream].be_start == 1)
+				do_trigger = true;
+			be->dpcm[stream].be_start--;
 			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!do_trigger)
 				continue;
 
 			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
@@ -2123,6 +2156,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (ret) {
 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 				be->dpcm[stream].state = state;
+				be->dpcm[stream].be_start++;
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
 			}
@@ -2134,9 +2168,12 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
 			}
+			if (be->dpcm[stream].be_start == 1)
+				do_trigger = true;
+			be->dpcm[stream].be_start--;
 			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (!do_trigger)
 				continue;
 
 			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
@@ -2148,6 +2185,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (ret) {
 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 				be->dpcm[stream].state = state;
+				be->dpcm[stream].be_start++;
 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
 			}
-- 
2.25.1

