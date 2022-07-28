Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D146D583F6A
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 15:01:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D211167C;
	Thu, 28 Jul 2022 15:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D211167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659013298;
	bh=bOkhuqHZMZ0Axw8zORyhPpRXV39vnmbQXnlYFyB7rU4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5/Eb0r2ozMgZ6X752sK3irU7fvWFIVYUyMP9dHlKTrh5P2hInZwVPc5Szud7I1/D
	 ruhml5Z5njOgnPWBPyZ9fWNnG3z94NmwbJKkwFnCkEADoJXdvmlrDfTWxaxS8bu26h
	 s8KwGUITzwvCLZ2b5FhdZUXNPvrzjTYGntpYHnz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE41DF80553;
	Thu, 28 Jul 2022 15:00:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 237A8F8053C; Thu, 28 Jul 2022 14:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3224BF8051C
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 14:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3224BF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wAux2RZA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Uk2dt4Br"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 09380344CD;
 Thu, 28 Jul 2022 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659013188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Av4M3w3bvfDchec1QtsFKO6kq8iWGSQbAapWPI1XJrI=;
 b=wAux2RZArbYKdcSXSMh3fJakhKGHCHVYKi/eTIdltYukNUZ3SFMLhnCdEuB8diowdtIPlB
 TQg0NqHDpCNp6ZheBV5Bw38gQwozQiWatRXqM6jq00yQNV9HMf6nrg34sRoNrEaWpHqRID
 oGd5ctgbrZ8I9U7i/RtURfBdDJT7dzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659013188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Av4M3w3bvfDchec1QtsFKO6kq8iWGSQbAapWPI1XJrI=;
 b=Uk2dt4Br9hsf7wbJdKQlop+eno5U7hS4FWgFLxOtlALQFsTuGgjp6+8gpIIVepzgKjxF5x
 Ie1nnK6boV2OU6Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA65913AB4;
 Thu, 28 Jul 2022 12:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QD6iNEOI4mJmOQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 28 Jul 2022 12:59:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ALSA: pcm: Use deferred fasync helper
Date: Thu, 28 Jul 2022 14:59:44 +0200
Message-Id: <20220728125945.29533-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220728125945.29533-1-tiwai@suse.de>
References: <20220728125945.29533-1-tiwai@suse.de>
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

For avoiding the potential deadlock via kill_fasync() call, use the
new fasync helpers to defer the invocation from timer API.  Note that
it's merely a workaround.

Reported-by: syzbot+8285e973a41b5aa68902@syzkaller.appspotmail.com
Reported-by: syzbot+669c9abf11a6a011dd09@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 2 +-
 sound/core/pcm.c        | 1 +
 sound/core/pcm_lib.c    | 2 +-
 sound/core/pcm_native.c | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2d03c10f6a36..8c48a5bce88c 100644
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
index 03fc5fa5813e..2ac742035310 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1007,6 +1007,7 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
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
index aa0453e51595..ad0541e9e888 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3951,7 +3951,7 @@ static int snd_pcm_fasync(int fd, struct file * file, int on)
 	runtime = substream->runtime;
 	if (runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
-	return fasync_helper(fd, file, on, &runtime->fasync);
+	return snd_fasync_helper(fd, file, on, &runtime->fasync);
 }
 
 /*
-- 
2.35.3

