Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0E575F60
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 12:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912EF18C1;
	Fri, 15 Jul 2022 12:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912EF18C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657881049;
	bh=Gd4Jyoo3B4R2r1nDJWUOLBOFwkZemzHMKyFlgLnedTs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XyVdoNXJpLEyE6t+L6uLKZ8BfqLvlpgWLcJIA7kh+V/6NeXAflJVbS6cKWddDmNSy
	 2TugnFUkFkurAkEb9o/nUh7kFynG1FJCp/0Ds1+NaC47MJ9lfxdbU0H/LPwSG2p0nG
	 gw2tu1l2IARLV77LWc3c7pqB8FDTa3XLS4CSnCsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF682F8053C;
	Fri, 15 Jul 2022 12:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83B40F80153; Fri, 15 Jul 2022 12:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC9EFF8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 12:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9EFF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Zqdrid3Y"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="GgdAs6bO"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4A2F91FA89;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657880978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGy8ZzpyH9uJRkZOdNs/yppyPP8ZQ6qKlUm4VrMnTa0=;
 b=Zqdrid3YiqchI0y+E8Y/Yo5v2LBuaycywPielJlv1fcevfTjlTMQDCu6KeExqNd+ZVwxYB
 I7x5g9WhekJ8zKA/6Ix8IxaIX3TTFGWvThXw+2Yo8lWnZ1M3J87OH+JSw8y/r5ERy3+LFQ
 CExIWw6zQc7Ply4TP3lGK79UjwlgDus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657880978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGy8ZzpyH9uJRkZOdNs/yppyPP8ZQ6qKlUm4VrMnTa0=;
 b=GgdAs6bOpuz4cye4oB0tGxsPPBu3i0/31F8C5Z6i7Qvd5UInS100xAVTd7HBxGtz7th3Ox
 x0b7Q2bAFcCdOyDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3218E13B28;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8GxMC5JB0WI+WwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 15 Jul 2022 10:29:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ALSA: timer: Drop async signal support
Date: Fri, 15 Jul 2022 12:29:31 +0200
Message-Id: <20220715102935.4695-2-tiwai@suse.de>
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

The async signal (SIGIO) support for ALSA timer API has been never
used by real applications, but yet it can be a cause of various
potential deadlocks, as spotted by syzkaller.  Let's drop the feature
as the simplest solution.

Reported-by: syzbot+1ee0910eca9c94f71f25@syzkaller.appspotmail.com
Reported-by: syzbot+49b10793b867871ee26f@syzkaller.appspotmail.com
Reported-by: syzbot+8285e973a41b5aa68902@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index b3214baa8919..4ac3ab2cf575 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -83,7 +83,6 @@ struct snd_timer_user {
 	unsigned int filter;
 	struct timespec64 tstamp;		/* trigger tstamp */
 	wait_queue_head_t qchange_sleep;
-	struct fasync_struct *fasync;
 	struct mutex ioctl_lock;
 };
 
@@ -1345,7 +1344,6 @@ static void snd_timer_user_interrupt(struct snd_timer_instance *timeri,
 	}
       __wake:
 	spin_unlock(&tu->qlock);
-	kill_fasync(&tu->fasync, SIGIO, POLL_IN);
 	wake_up(&tu->qchange_sleep);
 }
 
@@ -1383,7 +1381,6 @@ static void snd_timer_user_ccallback(struct snd_timer_instance *timeri,
 	spin_lock_irqsave(&tu->qlock, flags);
 	snd_timer_user_append_to_tqueue(tu, &r1);
 	spin_unlock_irqrestore(&tu->qlock, flags);
-	kill_fasync(&tu->fasync, SIGIO, POLL_IN);
 	wake_up(&tu->qchange_sleep);
 }
 
@@ -1453,7 +1450,6 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
 	spin_unlock(&tu->qlock);
 	if (append == 0)
 		return;
-	kill_fasync(&tu->fasync, SIGIO, POLL_IN);
 	wake_up(&tu->qchange_sleep);
 }
 
@@ -2130,14 +2126,6 @@ static long snd_timer_user_ioctl(struct file *file, unsigned int cmd,
 	return ret;
 }
 
-static int snd_timer_user_fasync(int fd, struct file * file, int on)
-{
-	struct snd_timer_user *tu;
-
-	tu = file->private_data;
-	return fasync_helper(fd, file, on, &tu->fasync);
-}
-
 static ssize_t snd_timer_user_read(struct file *file, char __user *buffer,
 				   size_t count, loff_t *offset)
 {
@@ -2280,7 +2268,6 @@ static const struct file_operations snd_timer_f_ops =
 	.poll =		snd_timer_user_poll,
 	.unlocked_ioctl =	snd_timer_user_ioctl,
 	.compat_ioctl =	snd_timer_user_ioctl_compat,
-	.fasync = 	snd_timer_user_fasync,
 };
 
 /* unregister the system timer */
-- 
2.35.3

