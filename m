Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD19592414
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F280168A;
	Sun, 14 Aug 2022 18:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F280168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494533;
	bh=BWjidRQ+edWUR4aH7drez7StIMEyzcJyA/RtL4QAKXA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mj6fdGNsaw46tPLG/pLnsohOzhwpv8BSRkrTzUf3mkF9/gr9wsrzROlwO99ELJouJ
	 DcnmdiBoO2rxQpUKe5OmgyMP4ykJIm+GR3FDQU1KGucYkARvCQmLnK8Q9Q2sSbrHkj
	 mIZrVKA2jmHDWTeIh5aYLSeBxNiRGZChZ6TV2C04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DF82F80567;
	Sun, 14 Aug 2022 18:25:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B9BF804C1; Sun, 14 Aug 2022 18:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7311BF805B1
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7311BF805B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pgkkyq09"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5945860F9D;
 Sun, 14 Aug 2022 16:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561D6C433C1;
 Sun, 14 Aug 2022 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494346;
 bh=BWjidRQ+edWUR4aH7drez7StIMEyzcJyA/RtL4QAKXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pgkkyq09Ie6tvmlEzRQEFb1BwFmzKj5SA2kczGZpb1EqJ5k49iK4xo/y2/fMU7SC2
 12xzVn7ms6wJU8p8RxOj8pFQdR8vv5oxu3J7IgjCgszfRx3UEA17uugICGkThexPRd
 1bZQ+SI2Ipe6nYg+xuLAe6j3nIgp2geG3GXyWKLhE/nTbDZI1fbFxJHga3mayDKRht
 ZCVEKSCBj8rghkAMOMAjruEOe38ab+OGQ09Ec/YkVwUBT43xky9CFSORHFaUBqm0sN
 jmHHBPz/ggWMYuVxHjp0qAztLaDHK9pPSuy56Z+8dxnjKgScx/s6MBP0fv1483VHKZ
 jY147hY2e6C3w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 31/39] ALSA: pcm: Use deferred fasync helper
Date: Sun, 14 Aug 2022 12:23:20 -0400
Message-Id: <20220814162332.2396012-31-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, zsm@chromium.org, kai.vehmanen@linux.intel.com,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, broonie@kernel.org,
 syzbot+669c9abf11a6a011dd09@syzkaller.appspotmail.com,
 ranjani.sridharan@linux.intel.com,
 syzbot+8285e973a41b5aa68902@syzkaller.appspotmail.com
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 96b097091c66df4f6fbf5cbff21df6cc02a2f055 ]

For avoiding the potential deadlock via kill_fasync() call, use the
new fasync helpers to defer the invocation from timer API.  Note that
it's merely a workaround.

Reported-by: syzbot+8285e973a41b5aa68902@syzkaller.appspotmail.com
Reported-by: syzbot+669c9abf11a6a011dd09@syzkaller.appspotmail.com
Link: https://lore.kernel.org/r/20220728125945.29533-4-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/pcm.h     | 2 +-
 sound/core/pcm.c        | 1 +
 sound/core/pcm_lib.c    | 2 +-
 sound/core/pcm_native.c | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 6b99310b5b88..6987110843f0 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -399,7 +399,7 @@ struct snd_pcm_runtime {
 	snd_pcm_uframes_t twake; 	/* do transfer (!poll) wakeup if non-zero */
 	wait_queue_head_t sleep;	/* poll sleep */
 	wait_queue_head_t tsleep;	/* transfer sleep */
-	struct fasync_struct *fasync;
+	struct snd_fasync *fasync;
 	bool stop_operating;		/* sync_stop will be called */
 	struct mutex buffer_mutex;	/* protect for buffer changes */
 	atomic_t buffer_accessing;	/* >0: in r/w operation, <0: blocked */
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 977d54320a5c..c917ac84a7e5 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1005,6 +1005,7 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 		substream->runtime = NULL;
 	}
 	mutex_destroy(&runtime->buffer_mutex);
+	snd_fasync_free(runtime->fasync);
 	kfree(runtime);
 	put_pid(substream->pid);
 	substream->pid = NULL;
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 1fc7c50ffa62..40751e5aff09 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1822,7 +1822,7 @@ void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substrea
 		snd_timer_interrupt(substream->timer, 1);
 #endif
  _end:
-	kill_fasync(&runtime->fasync, SIGIO, POLL_IN);
+	snd_kill_fasync(runtime->fasync, SIGIO, POLL_IN);
 }
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4adaee62ef33..16fcf57c6f03 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3945,7 +3945,7 @@ static int snd_pcm_fasync(int fd, struct file * file, int on)
 	runtime = substream->runtime;
 	if (runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
-	return fasync_helper(fd, file, on, &runtime->fasync);
+	return snd_fasync_helper(fd, file, on, &runtime->fasync);
 }
 
 /*
-- 
2.35.1

