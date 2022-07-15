Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5E575F65
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 12:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 064B218B6;
	Fri, 15 Jul 2022 12:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 064B218B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657881081;
	bh=9xOIKv/fZBVX5TnKf9pT+kTzOAegZnIddrYXdjI/zUE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BmHtxGaPnf6rwpGWVKGr0uEkuGnqMGWK8l0xsdFQPR042ne93txH+LUyIq9v6LJUY
	 6DG5fDFdDRtoHhJYLU+5f+fJ/q0xL1KRNs8zNhM4SfpjlqLPeHWuH9/BksBkduMBm7
	 uEVKd2FNblWBFET41UvburX8IRdsv2IjDQt5zUmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6487F80544;
	Fri, 15 Jul 2022 12:29:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 520A6F8053D; Fri, 15 Jul 2022 12:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E6FFF80153
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 12:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6FFF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="bfjAqgsi"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="yohLoyhH"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 705E81FB39;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657880978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGVz3f4YEWYWzCw5t3v/ARD34LQAWDWlEvZkjgyvp6c=;
 b=bfjAqgsieVAHRUPSjKTr2EtuJVUzFcTjT6wKJHVR4YlezVeof/+lE1EYCkSmeqgpdyZ+yP
 qUVjUHSmx3BXphvOB/bzwLFWh0s6PN1FitokxKM8W9WII0bfRKfhTNkzJvvrMGseGZfKqs
 NSdTV2nn8z2Fq3QJgpdRG8G+2OOMc50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657880978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGVz3f4YEWYWzCw5t3v/ARD34LQAWDWlEvZkjgyvp6c=;
 b=yohLoyhHJ/rpLp54JrEAxthT3shb3/HY3bbe96kuzy3nL+aC0xE3FlpU2zgkI79js2DqrY
 Aqnq5/xyKtyjrDBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C42E13AC3;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oCL5EZJB0WI+WwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 15 Jul 2022 10:29:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ALSA: pcm: Drop async signal support
Date: Fri, 15 Jul 2022 12:29:32 +0200
Message-Id: <20220715102935.4695-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220715102935.4695-1-tiwai@suse.de>
References: <20220715102935.4695-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The async signal (SIGIO) support for ALSA PCM API has been never used
by real applications, but yet it can be a cause of various potential
deadlocks, as spotted by syzkaller.  Let's drop the feature as the
simplest solution.

Reported-by: syzbot+8285e973a41b5aa68902@syzkaller.appspotmail.com
Reported-by: syzbot+669c9abf11a6a011dd09@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     |  1 -
 sound/core/pcm_lib.c    |  4 +---
 sound/core/pcm_native.c | 18 ------------------
 3 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 08cf4a5801f3..9bbd3742ef59 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -399,7 +399,6 @@ struct snd_pcm_runtime {
 	snd_pcm_uframes_t twake; 	/* do transfer (!poll) wakeup if non-zero */
 	wait_queue_head_t sleep;	/* poll sleep */
 	wait_queue_head_t tsleep;	/* transfer sleep */
-	struct fasync_struct *fasync;
 	bool stop_operating;		/* sync_stop will be called */
 	struct mutex buffer_mutex;	/* protect for buffer changes */
 	atomic_t buffer_accessing;	/* >0: in r/w operation, <0: blocked */
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 1fc7c50ffa62..a7b10ee5d57d 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1815,14 +1815,12 @@ void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substrea
 
 	if (!snd_pcm_running(substream) ||
 	    snd_pcm_update_hw_ptr0(substream, 1) < 0)
-		goto _end;
+		return;
 
 #ifdef CONFIG_SND_PCM_TIMER
 	if (substream->timer_running)
 		snd_timer_interrupt(substream->timer, 1);
 #endif
- _end:
-	kill_fasync(&runtime->fasync, SIGIO, POLL_IN);
 }
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index aa0453e51595..c8e340b97277 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3938,22 +3938,6 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 	return 0;
 }
 
-static int snd_pcm_fasync(int fd, struct file * file, int on)
-{
-	struct snd_pcm_file * pcm_file;
-	struct snd_pcm_substream *substream;
-	struct snd_pcm_runtime *runtime;
-
-	pcm_file = file->private_data;
-	substream = pcm_file->substream;
-	if (PCM_RUNTIME_CHECK(substream))
-		return -ENXIO;
-	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
-		return -EBADFD;
-	return fasync_helper(fd, file, on, &runtime->fasync);
-}
-
 /*
  * ioctl32 compat
  */
@@ -4118,7 +4102,6 @@ const struct file_operations snd_pcm_f_ops[2] = {
 		.unlocked_ioctl =	snd_pcm_ioctl,
 		.compat_ioctl = 	snd_pcm_ioctl_compat,
 		.mmap =			snd_pcm_mmap,
-		.fasync =		snd_pcm_fasync,
 		.get_unmapped_area =	snd_pcm_get_unmapped_area,
 	},
 	{
@@ -4132,7 +4115,6 @@ const struct file_operations snd_pcm_f_ops[2] = {
 		.unlocked_ioctl =	snd_pcm_ioctl,
 		.compat_ioctl = 	snd_pcm_ioctl_compat,
 		.mmap =			snd_pcm_mmap,
-		.fasync =		snd_pcm_fasync,
 		.get_unmapped_area =	snd_pcm_get_unmapped_area,
 	}
 };
-- 
2.35.3

