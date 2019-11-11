Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA8CF72D3
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 12:12:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1270F1673;
	Mon, 11 Nov 2019 12:12:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1270F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573470772;
	bh=okgKcMep5dewtFp2UKa+c3ZNJq55vIZQcohQEUsMacE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E/2SEay6ZSapzluuC64d9iJgGJ2pboUGcm+I4myl28gHE9xG7pMoE9r1EVWrDKSp+
	 +x3S9899tJowSHEe9U0fKobHSd+aWEuOss3BAFMAjRFQpNgvDionDC5unqKkz0x8xg
	 PR28XrSMXgIo2GflCzr519Bsq0+ymFrCmzcC96xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DB21F8060D;
	Mon, 11 Nov 2019 12:09:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D9E5F8053A; Mon, 11 Nov 2019 12:09:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 392E5F8045D
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 12:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 392E5F8045D
IronPort-SDR: NQuoIU7vtJ/5/cHIWuwdZwQBlbH6BsoIk2oNG5fr52Bdl+nObFaFXwEEH6udMuV8GiwlFJAI9N
 NqTGQJ7DKlFQVaOs3v1PXeQXENtUTePjzTMhBktMCyRcZ5E+xGQ934eXI3l3S9g6zuMCygQTeu
 fUPQDvAD2shHjvm3J0gBcq+8rIkrvDGnYcAasVHQDQuhrxjXDnct0B1+zLDiK5RWfR/mvI5Gky
 AIAtmcEG1szDZn59rbDpIoqe6qiKS4YYnFdsQr6KI2rdlZ3M/0+uZCUyBBq2uXxdmJJPrWBfFv
 cdU=
X-IronPort-AV: E=Sophos;i="5.68,292,1569312000"; d="scan'208";a="43051109"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 11 Nov 2019 03:09:31 -0800
IronPort-SDR: 5idUWUzRCps92YlOKu+Y9QijUPKmgHKOAVjG/lH9VUeOQo0pfyDuZHKlHpeenr1oU/hXSvlCBj
 rWFLPGUUoJ29Us2ZvxftSLFlatpqQffvENakmC0c0p163000xpMfX9Jx05YU1qTI55xB8f4yY5
 Q9MN1NvTkEoHhYkwnQfSr07Nv/0t3V2o/0LuXiL+twlRGwN7D0cO66EIN3N0kpzOz/wMacyuvB
 lQ8dqVjaFsw92TrlItlCxyfDxcxndtDT1DIBShNsOgUiNWiH+FFvb2+uAls96LylWC7Fu3QKyI
 pzk=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Mon, 11 Nov 2019 05:08:41 -0600
Message-ID: <20191111110846.18223-3-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191111110846.18223-2-andrew_gabbasov@mentor.com>
References: <20191111110846.18223-1-andrew_gabbasov@mentor.com>
 <20191111110846.18223-2-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v3 2/7] ALSA: aloop: Support return of error
	code for timer start and stop
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Timo Wischer <twischer@de.adit-jv.com>

This is required for additional timer implementations which could detect
errors and want to throw them.

Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 1f5982e09025..dc9154662d5b 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -155,7 +155,7 @@ static inline unsigned int get_rate_shift(struct loopback_pcm *dpcm)
 }
 
 /* call in cable->lock */
-static void loopback_timer_start(struct loopback_pcm *dpcm)
+static int loopback_timer_start(struct loopback_pcm *dpcm)
 {
 	unsigned long tick;
 	unsigned int rate_shift = get_rate_shift(dpcm);
@@ -171,18 +171,24 @@ static void loopback_timer_start(struct loopback_pcm *dpcm)
 	tick = dpcm->period_size_frac - dpcm->irq_pos;
 	tick = (tick + dpcm->pcm_bps - 1) / dpcm->pcm_bps;
 	mod_timer(&dpcm->timer, jiffies + tick);
+
+	return 0;
 }
 
 /* call in cable->lock */
-static inline void loopback_timer_stop(struct loopback_pcm *dpcm)
+static inline int loopback_timer_stop(struct loopback_pcm *dpcm)
 {
 	del_timer(&dpcm->timer);
 	dpcm->timer.expires = 0;
+
+	return 0;
 }
 
-static inline void loopback_timer_stop_sync(struct loopback_pcm *dpcm)
+static inline int loopback_timer_stop_sync(struct loopback_pcm *dpcm)
 {
 	del_timer_sync(&dpcm->timer);
+
+	return 0;
 }
 
 #define CABLE_VALID_PLAYBACK	(1 << SNDRV_PCM_STREAM_PLAYBACK)
@@ -251,7 +257,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct loopback_pcm *dpcm = runtime->private_data;
 	struct loopback_cable *cable = dpcm->cable;
-	int err, stream = 1 << substream->stream;
+	int err = 0, stream = 1 << substream->stream;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -264,7 +270,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_lock(&cable->lock);	
 		cable->running |= stream;
 		cable->pause &= ~stream;
-		loopback_timer_start(dpcm);
+		err = loopback_timer_start(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -273,7 +279,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_lock(&cable->lock);	
 		cable->running &= ~stream;
 		cable->pause &= ~stream;
-		loopback_timer_stop(dpcm);
+		err = loopback_timer_stop(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -282,7 +288,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		spin_lock(&cable->lock);	
 		cable->pause |= stream;
-		loopback_timer_stop(dpcm);
+		err = loopback_timer_stop(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -292,7 +298,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_lock(&cable->lock);
 		dpcm->last_jiffies = jiffies;
 		cable->pause &= ~stream;
-		loopback_timer_start(dpcm);
+		err = loopback_timer_start(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -300,7 +306,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 	default:
 		return -EINVAL;
 	}
-	return 0;
+	return err;
 }
 
 static void params_change(struct snd_pcm_substream *substream)
@@ -321,9 +327,11 @@ static int loopback_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct loopback_pcm *dpcm = runtime->private_data;
 	struct loopback_cable *cable = dpcm->cable;
-	int bps, salign;
+	int err, bps, salign;
 
-	loopback_timer_stop_sync(dpcm);
+	err = loopback_timer_stop_sync(dpcm);
+	if (err < 0)
+		return err;
 
 	salign = (snd_pcm_format_physical_width(runtime->format) *
 						runtime->channels) / 8;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
