Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4AE118919
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0CA638;
	Tue, 10 Dec 2019 14:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0CA638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575983051;
	bh=04kmEUnwuNTfxEtN1ui4P4+TinyR2fiv+1TNL9DWHno=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DdjGJ9ky8hPpj+oJSSnUHRk9DSrZjWqHaPi58h5Mn7RrZ3ogZgmXdm9KNBujb6Ljg
	 YpHHlNcDr9D9xcwfP2/lcpUk3oBIQXiCoIP4WF3/ZBcI2IDEPOapEtxesCfnzY3xMT
	 RkpKfTWWA8s4PCIQ5DY4wpYJOiRrTYVRsJvNsQo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A033F8020C;
	Tue, 10 Dec 2019 14:02:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87CEFF8020C; Tue, 10 Dec 2019 14:02:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0938F8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0938F8011E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8FF7BAC6F;
 Tue, 10 Dec 2019 13:02:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 14:02:19 +0100
Message-Id: <20191210130219.27919-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Lionel Koenig <lionel.koenig@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: pcm: Fill silence on buffers at hw_params
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

The current PCM code doesn't initialize explicitly the buffers
allocated for PCM streams, hence it might leak some uninitialized
kernel data by mmapping or reading the buffer before actually reading
or writing.

Since this is a common problem, let's initialize the data on the
buffers each hw_params properly.  For that, an existing helper
function is exposed as snd_pcm_fill_silence_frames() and call it from
snd_pcm_hw_params().

Reported-and-tested-by: Lionel Koenig <lionel.koenig@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_lib.c    | 13 ++++---------
 sound/core/pcm_local.h  |  2 ++
 sound/core/pcm_native.c |  3 +++
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 2236b5e0c1f2..3c63324b8bb7 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -30,9 +30,6 @@
 #define trace_applptr(substream, prev, curr)
 #endif
 
-static int fill_silence_frames(struct snd_pcm_substream *substream,
-			       snd_pcm_uframes_t off, snd_pcm_uframes_t frames);
-
 /*
  * fill ring buffer with silence
  * runtime->silence_start: starting pointer to silence area
@@ -100,7 +97,7 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 	ofs = runtime->silence_start % runtime->buffer_size;
 	while (frames > 0) {
 		transfer = ofs + frames > runtime->buffer_size ? runtime->buffer_size - ofs : frames;
-		err = fill_silence_frames(substream, ofs, transfer);
+		err = snd_pcm_fill_silence_frames(substream, ofs, transfer);
 		snd_BUG_ON(err < 0);
 		runtime->silence_filled += transfer;
 		frames -= transfer;
@@ -1945,8 +1942,6 @@ static int fill_silence(struct snd_pcm_substream *substream, int channel,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
-		return 0;
 	if (substream->ops->fill_silence)
 		return substream->ops->fill_silence(substream, channel,
 						    hwoff, bytes);
@@ -2030,10 +2025,10 @@ static int noninterleaved_copy(struct snd_pcm_substream *substream,
 }
 
 /* fill silence on the given buffer position;
- * called from snd_pcm_playback_silence()
+ * called from snd_pcm_playback_silence() and snd_pcm_hw_params()
  */
-static int fill_silence_frames(struct snd_pcm_substream *substream,
-			       snd_pcm_uframes_t off, snd_pcm_uframes_t frames)
+int snd_pcm_fill_silence_frames(struct snd_pcm_substream *substream,
+				snd_pcm_uframes_t off, snd_pcm_uframes_t frames)
 {
 	if (substream->runtime->access == SNDRV_PCM_ACCESS_RW_INTERLEAVED ||
 	    substream->runtime->access == SNDRV_PCM_ACCESS_MMAP_INTERLEAVED)
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index 384efd002984..ac4f455b1fff 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -34,6 +34,8 @@ int snd_pcm_update_hw_ptr(struct snd_pcm_substream *substream);
 
 void snd_pcm_playback_silence(struct snd_pcm_substream *substream,
 			      snd_pcm_uframes_t new_hw_ptr);
+int snd_pcm_fill_silence_frames(struct snd_pcm_substream *substream,
+				snd_pcm_uframes_t off, snd_pcm_uframes_t frames);
 
 static inline snd_pcm_uframes_t
 snd_pcm_avail(struct snd_pcm_substream *substream)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 1fe581167b7b..d6f270c639b4 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -739,6 +739,9 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	while (runtime->boundary * 2 <= LONG_MAX - runtime->buffer_size)
 		runtime->boundary *= 2;
 
+	/* clear the buffer once for avoiding information leaks */
+	snd_pcm_fill_silence_frames(substream, 0, runtime->period_size);
+
 	snd_pcm_timer_resolution_change(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
