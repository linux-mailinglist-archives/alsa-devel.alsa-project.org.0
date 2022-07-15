Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F546575F67
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 12:31:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 194D118CE;
	Fri, 15 Jul 2022 12:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 194D118CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657881091;
	bh=4LA61HFUZ5ylMHpHwi4q2rPcuHJOpqDKc4aP+W9+5dY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ctBa5S95mCP7DryjDoPljRa8x2s6tTCkN5hWLeZ+orUQCwpd7m6EgMGlltmiAb6Pe
	 ZqtMJhEW13hwWMi/tJs6A6sMFWR7sywzDF7Ap/hFIRuKUY3QndmVXqWlX1M3Yh6jKd
	 iTTn7tzeAk9zNA9jKoUmyua7CwfxFUftHbYv2K9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E08CF8014E;
	Fri, 15 Jul 2022 12:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D096F80543; Fri, 15 Jul 2022 12:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01183F8012F
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 12:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01183F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xIIFgKf2"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Rp+RDeCh"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E5C11FB4C;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657880978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGZaCnSkWhN5wCIw32VPguw+G/ThT1KI9AXF1wzopkM=;
 b=xIIFgKf2HJBboXWwM8xQahVPbBaBiZf56cBmLMf5aBZz3fABUvW1silIYRk7CSNxIG3113
 6Axp6N32byjlt6PbkOF7QSj944wKRj85YqWVrVXNAJDWWwll+lBe43zP3rXLnQg+67N4fH
 PLTFb/K/Lxb5LXWccvPC6wWn8NQcf1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657880978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGZaCnSkWhN5wCIw32VPguw+G/ThT1KI9AXF1wzopkM=;
 b=Rp+RDeChznhExjXvlCcDi4p1Wpdcuum0e2Ws9NdwRy1DqAOmeirUAdgJP6bIi/bEN1Bt01
 mLT7/zriCCetDXAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6646913B28;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qANQGJJB0WI+WwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 15 Jul 2022 10:29:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ALSA: control: Drop async signal support
Date: Fri, 15 Jul 2022 12:29:33 +0200
Message-Id: <20220715102935.4695-4-tiwai@suse.de>
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

The async signal (SIGIO) support for ALSA control API has been never
used by real applications, but yet it can be a cause of various
potential deadlocks (although there hasn't been a bug report in this
code path unlike timer and PCM).  Let's drop the feature as the
simplest solution to align with other APIs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h |  1 -
 sound/core/control.c    | 11 -----------
 2 files changed, 12 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index fcd3cce673ec..0390d4952dac 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -109,7 +109,6 @@ struct snd_ctl_file {
 	int preferred_subdevice[SND_CTL_SUBDEV_ITEMS];
 	wait_queue_head_t change_sleep;
 	spinlock_t read_lock;
-	struct fasync_struct *fasync;
 	int subscribed;			/* read interface is activated */
 	struct list_head events;	/* waiting events for read */
 };
diff --git a/sound/core/control.c b/sound/core/control.c
index 4dba3a342458..3d3b8bf93f80 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -181,7 +181,6 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 	_found:
 		wake_up(&ctl->change_sleep);
 		spin_unlock(&ctl->read_lock);
-		kill_fasync(&ctl->fasync, SIGIO, POLL_IN);
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 }
@@ -2129,14 +2128,6 @@ int snd_ctl_unregister_ioctl_compat(snd_kctl_ioctl_func_t fcn)
 EXPORT_SYMBOL(snd_ctl_unregister_ioctl_compat);
 #endif
 
-static int snd_ctl_fasync(int fd, struct file * file, int on)
-{
-	struct snd_ctl_file *ctl;
-
-	ctl = file->private_data;
-	return fasync_helper(fd, file, on, &ctl->fasync);
-}
-
 /* return the preferred subdevice number if already assigned;
  * otherwise return -1
  */
@@ -2264,7 +2255,6 @@ static const struct file_operations snd_ctl_f_ops =
 	.poll =		snd_ctl_poll,
 	.unlocked_ioctl =	snd_ctl_ioctl,
 	.compat_ioctl =	snd_ctl_ioctl_compat,
-	.fasync =	snd_ctl_fasync,
 };
 
 /*
@@ -2302,7 +2292,6 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	read_lock_irqsave(&card->ctl_files_rwlock, flags);
 	list_for_each_entry(ctl, &card->ctl_files, list) {
 		wake_up(&ctl->change_sleep);
-		kill_fasync(&ctl->fasync, SIGIO, POLL_ERR);
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 
-- 
2.35.3

