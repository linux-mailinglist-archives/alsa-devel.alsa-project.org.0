Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC35774E0
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 09:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F2E18F6;
	Sun, 17 Jul 2022 09:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F2E18F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658041681;
	bh=tpTJAEUclKTqtJ7NzY7AVHJU8IdYP7J4Rp2bh0UVH3o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PrjpaQxjh+Qc+ZzDUy0VSZMiXLQLZqGZntSm85ctjWstof5z2aPFX9ox9pT2MNaqV
	 NOqEFX3PXe1B/YXIAMqf3mhmn7AGDyUu23cJdDJtR7gJGoNoE027nY9JSJTuaMA8oR
	 pXqaeXBepQxEYJszoftrYwSxvg1kwJ4dQNcl+9zQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A8A0F80549;
	Sun, 17 Jul 2022 09:06:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CA4BF80171; Sun, 17 Jul 2022 09:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6C32F80171
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 09:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C32F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hse9akEQ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="6FnWojvv"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6A1D1F96E;
 Sun, 17 Jul 2022 07:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658041554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DsHLYF7nQ5WhhAycjEQzo6YSjaCkaTIOWB+nLJG/Kk=;
 b=hse9akEQ4NOakwj7XGEFHM6tZAyCS8Tg7JVqa0RbWzJKeGSj1DppNhkuXxW3DZ2/mOaY60
 fF1ebBNnmrBF1cn/vEYY+YyZrWqtwYRi/ispRDuwTlfTnkd2/vfFOF39FI7PBrKTQij8vn
 FdpZyHciCXdg2fxSmvWLoR5WDWMRRZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658041554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DsHLYF7nQ5WhhAycjEQzo6YSjaCkaTIOWB+nLJG/Kk=;
 b=6FnWojvvNCO/C9W3Pkq0k/tPjX/SwVxk6stjs55tjcEQVbn2Ch+/uQyrKTqG1cZzDRo3Cd
 8KIFjxktHIU4dBDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B2F813A89;
 Sun, 17 Jul 2022 07:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SM3jJNK002LDawAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 17 Jul 2022 07:05:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/5] ALSA: pcm: Drop async signal support
Date: Sun, 17 Jul 2022 09:05:46 +0200
Message-Id: <20220717070549.5993-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220717070549.5993-1-tiwai@suse.de>
References: <20220717070549.5993-1-tiwai@suse.de>
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
 sound/core/pcm_lib.c    |  8 +-------
 sound/core/pcm_native.c | 18 ------------------
 3 files changed, 1 insertion(+), 26 deletions(-)

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
index 1fc7c50ffa62..e490a575aa03 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1807,22 +1807,16 @@ EXPORT_SYMBOL(snd_pcm_lib_ioctl);
  */
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream)
 {
-	struct snd_pcm_runtime *runtime;
-
 	if (PCM_RUNTIME_CHECK(substream))
 		return;
-	runtime = substream->runtime;
-
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

