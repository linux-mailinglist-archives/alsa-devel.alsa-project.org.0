Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9B404AD0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34FD915DC;
	Thu,  9 Sep 2021 13:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34FD915DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188115;
	bh=6+MONF8EmtdpRsVvsw+V+vRmiKz8kfaaA31jO5pe8sg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQAKnzHXyRrV8R56BoWnY9g/wBLx/FdcTJmteJhlg2adm+9BnjX3SDYTjmL73qSBz
	 lRj2a6+iFoQDbwaeXze8L5jogVCIGP8Nc251u0Fuczs7wTKFJARjQJHe4VdRqCl62y
	 9TM145seEk3eE5fF/bSAoI1y05Ovp5c+uSfhzVcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 013E0F80506;
	Thu,  9 Sep 2021 13:46:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B9B9F80506; Thu,  9 Sep 2021 13:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1C59F80217
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C59F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZIP8cDKa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3EE161414;
 Thu,  9 Sep 2021 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187958;
 bh=6+MONF8EmtdpRsVvsw+V+vRmiKz8kfaaA31jO5pe8sg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZIP8cDKai0/OWXfaO7NWGkZ3Cdza7M1jr1ZnmxXvhzWAK/ulKKwfq0XJ1JRQTQukz
 aPPPIKj1Hm+sTwFs9v3ozlZSh07Yhi2hbkaavDHkI9ncdkokogPGbg/PArpJU0Syhg
 KljgrBdAKu51Rj50LLgDRk21aeLSR3p25uFTaUHzWL5jL+1dMdVMmW4cdwjfaGp+Yo
 dm5RdN7yZDP0E1Euh1zZccD0k3I7diGy6HEfuNsf5yW3fKc26LeiuPcIkArcvRKIZh
 MciV8mSWn3D0oeHSpbcmqH8r4l5rB8RXkGlFJA0WJfottCXYvRJPh8KXO7a0PBxX5I
 A2OjargwVY9Sg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 224/252] ASoC: soc-pcm: protect BE dailink state
 changes in trigger
Date: Thu,  9 Sep 2021 07:40:38 -0400
Message-Id: <20210909114106.141462-224-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 0c75fc7193387776c10f7c7b440d93496e3d5e21 ]

When more than one FE is connected to a BE, e.g. in a mixing use case,
the BE can be triggered multiple times when the FE are opened/started
concurrently. This race condition is problematic in the case of
SoundWire BE dailinks, and this is not desirable in a general
case. The code carefully checks when the BE can be stopped or
hw_free'ed, but the trigger code does not use any mutual exclusion.

Fix by using the same spinlock already used to check FE states, and
set the state before the trigger. In case of errors,  the initial
state will be restored.

This patch does not change how the triggers are handled, it only makes
sure the states are handled in critical sections.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-Id: <20210817164054.250028-2-pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-pcm.c | 103 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 85 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index d1c570ca21ea..b944f56a469a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2001,6 +2001,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dpcm *dpcm;
 	int ret = 0;
+	unsigned long flags;
+	enum snd_soc_dpcm_state state;
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_pcm_substream *be_substream;
@@ -2017,76 +2019,141 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
-			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED)) {
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
+			}
+			state = be->dpcm[stream].state;
+			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+				be->dpcm[stream].state = state;
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
+			}
 
-			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
 		case SNDRV_PCM_TRIGGER_RESUME:
-			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND))
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND) {
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
+			}
+
+			state = be->dpcm[stream].state;
+			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+				be->dpcm[stream].state = state;
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
+			}
 
-			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED) {
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
+			}
+
+			state = be->dpcm[stream].state;
+			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+				be->dpcm[stream].state = state;
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
+			}
 
-			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
-			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED)) {
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
+			}
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+			state = be->dpcm[stream].state;
+			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+				be->dpcm[stream].state = state;
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
+			}
 
-			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
 			break;
 		case SNDRV_PCM_TRIGGER_SUSPEND:
-			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) {
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
+			}
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+			state = be->dpcm[stream].state;
+			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+				be->dpcm[stream].state = state;
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
+			}
 
-			be->dpcm[stream].state = SND_SOC_DPCM_STATE_SUSPEND;
 			break;
 		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) {
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				continue;
+			}
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 
 			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
 				continue;
 
+			spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+			state = be->dpcm[stream].state;
+			be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
+			spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+				be->dpcm[stream].state = state;
+				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
 				goto end;
+			}
 
-			be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
 			break;
 		}
 	}
-- 
2.30.2

