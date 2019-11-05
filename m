Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A3F0007
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 15:39:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F39016E4;
	Tue,  5 Nov 2019 15:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F39016E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572964755;
	bh=K/Sqr1WiNh0tVOj5GCJQRMDN9Z6jECPYDIAe9kiv5iE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SOqHXcYRP+QW7F26fhf9jRrcTt3YjY+N6VHgZ80bOgLuHbdxLal/42WdOkmnG1Guj
	 qtUoFYCPxof/KZXI7jI3tEpUyqDtwzkJ1d49F0S6BQpijB3GlQw7WbnNiXuUuDR/Rr
	 PncK9ylVBZyJuSW9F5W/6KzO+DY44Ra2D3uJNMWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C5CEF8065C;
	Tue,  5 Nov 2019 15:34:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69777F8064C; Tue,  5 Nov 2019 15:34:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC78F80446
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC78F80446
IronPort-SDR: EwOfBElxxxzC8XqinLv7j9rgXDecLXNzXXXf/SHuPU7LtZzalJLJXviWHYVGaDyNgXEnRbAioR
 NJ3owLcqxbJnHhHKOKSdl5dStfcIXAl2AFAdqaf2F+IoYUoKmBrAqVdRZ/VzlNtFuRHEyctgH6
 izPQ2N/Rug+dfROwsx49eISQtkPN9gPHg0BYbs8jUtQUH+GKM/za/QG7/QLH9wtz4ycrbHzEyL
 tHJsSnOjSxVHB/ZqMLRmr+2suGW3TK4RDKP53c/v5RXVfIjUu9JCII9hr2CdHQinzE850PftBQ
 YMY=
X-IronPort-AV: E=Sophos;i="5.68,271,1569312000"; d="scan'208";a="42819844"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 05 Nov 2019 06:34:08 -0800
IronPort-SDR: +0Dq2ZhvKabs6yLKH6f9Hk78ZSJXcEVKqw0emzKUvB3M+5tKequoYgsy8DfFRq1SRJ8SaXdsjI
 Yv7Vew4tTs9fOZD0cxRRPemCXDPDW1CkKeFjhmrbBS3vMMBAUNLVAIgADPm+0o9OD4gYUT2LZH
 sFbYC8jF1ZiUANkn1nN1hhGyyaqxxzRwJwq2/bSSTebA0qloGF0Eu9lnlszR45UkGH21TZ6aul
 jl0gh662jJvbRF0QqsTJdH7FObrpQOL+zRNJ9sasbQvl4mKFcoE+KRRtgiSgwdr2i3rAR5YAWi
 BaE=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Tue, 5 Nov 2019 08:32:13 -0600
Message-ID: <20191105143218.5948-4-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105143218.5948-3-andrew_gabbasov@mentor.com>
References: <20191105143218.5948-1-andrew_gabbasov@mentor.com>
 <20191105143218.5948-2-andrew_gabbasov@mentor.com>
 <20191105143218.5948-3-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v2 3/8] ALSA: aloop: loopback_timer_stop:
	Support return of error code
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
 sound/drivers/aloop.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index b9ee5b72a996..dc9154662d5b 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -176,15 +176,19 @@ static int loopback_timer_start(struct loopback_pcm *dpcm)
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
@@ -275,7 +279,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_lock(&cable->lock);	
 		cable->running &= ~stream;
 		cable->pause &= ~stream;
-		loopback_timer_stop(dpcm);
+		err = loopback_timer_stop(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -284,7 +288,7 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		spin_lock(&cable->lock);	
 		cable->pause |= stream;
-		loopback_timer_stop(dpcm);
+		err = loopback_timer_stop(dpcm);
 		spin_unlock(&cable->lock);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
@@ -323,9 +327,11 @@ static int loopback_prepare(struct snd_pcm_substream *substream)
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
