Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71359244E
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:31:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A099816A4;
	Sun, 14 Aug 2022 18:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A099816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494663;
	bh=utwjySDW4EArzun52oLQorI+1cEBJiW/BBG0M5KHHJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/iIlRSJp10cUQ1XW+UMl0NJeSiG4Cew5MY48SVY9/KwTff4G/Wm/exkCcl+VZGf3
	 nT5kSKu8hAL/koYSx41xB85rAiV6ehR4rDNQN6TCi2b9mQ1wlVtDIZApfMIETo8PtU
	 GWZuMeiAaDfbve4g1iokpiGynKirqRETZsZD0udw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 057DDF80571;
	Sun, 14 Aug 2022 18:28:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6168F80571; Sun, 14 Aug 2022 18:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A525F804C1
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A525F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sjIhjDNQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3BDE9B80B79;
 Sun, 14 Aug 2022 16:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24579C433C1;
 Sun, 14 Aug 2022 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494495;
 bh=utwjySDW4EArzun52oLQorI+1cEBJiW/BBG0M5KHHJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sjIhjDNQ940q9066u3sdC+Df3rO1t9Akq8CAlMCiGLkSvU6pLU4/HvOwVwtP7DdOa
 wnAi0rP3Z2nPQYzIq+pKQKaGPGTVzMnaQEfIY3RLFXulikj3kZqgIwDGQ1owbsN0SV
 9tUJu6nv3mLeKSC1a6amS7Z785iGU4moo6+OhWRVRJqhTHRgkIRHzl6n+E/ktBAOu9
 MbqnVibl4fvpXbv+W5Wi0cCiTgJAB091SqbSO/smvWZJQvLTE5eTXG1p0OhU4xnmnC
 msizMgSR1riRIrNN1Yal7dKakV9FFecAImWb8oWDzmPoxeHIz9ThXxZUo/SyuR1WMr
 hIhIy6aAgjhVA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/19] ALSA: control: Use deferred fasync helper
Date: Sun, 14 Aug 2022 12:27:32 -0400
Message-Id: <20220814162739.2398217-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162739.2398217-1-sashal@kernel.org>
References: <20220814162739.2398217-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, tiwai@suse.com
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

[ Upstream commit 4a971e84a7ae10a38d875cd2d4e487c8d1682ca3 ]

For avoiding the potential deadlock via kill_fasync() call, use the
new fasync helpers to defer the invocation from the control API.  Note
that it's merely a workaround.

Another note: although we haven't received reports about the deadlock
with the control API, the deadlock is still potentially possible, and
it's better to align the behavior with other core APIs (PCM and
timer); so let's move altogether.

Link: https://lore.kernel.org/r/20220728125945.29533-5-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/control.h | 2 +-
 sound/core/control.c    | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 77d9fa10812d..41bd72ffd232 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -103,7 +103,7 @@ struct snd_ctl_file {
 	int preferred_subdevice[SND_CTL_SUBDEV_ITEMS];
 	wait_queue_head_t change_sleep;
 	spinlock_t read_lock;
-	struct fasync_struct *fasync;
+	struct snd_fasync *fasync;
 	int subscribed;			/* read interface is activated */
 	struct list_head events;	/* waiting events for read */
 };
diff --git a/sound/core/control.c b/sound/core/control.c
index 3b44378b9dec..732eb515d2f5 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -121,6 +121,7 @@ static int snd_ctl_release(struct inode *inode, struct file *file)
 			if (control->vd[idx].owner == ctl)
 				control->vd[idx].owner = NULL;
 	up_write(&card->controls_rwsem);
+	snd_fasync_free(ctl->fasync);
 	snd_ctl_empty_read_queue(ctl);
 	put_pid(ctl->pid);
 	kfree(ctl);
@@ -175,7 +176,7 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 	_found:
 		wake_up(&ctl->change_sleep);
 		spin_unlock(&ctl->read_lock);
-		kill_fasync(&ctl->fasync, SIGIO, POLL_IN);
+		snd_kill_fasync(ctl->fasync, SIGIO, POLL_IN);
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 }
@@ -1941,7 +1942,7 @@ static int snd_ctl_fasync(int fd, struct file * file, int on)
 	struct snd_ctl_file *ctl;
 
 	ctl = file->private_data;
-	return fasync_helper(fd, file, on, &ctl->fasync);
+	return snd_fasync_helper(fd, file, on, &ctl->fasync);
 }
 
 /* return the preferred subdevice number if already assigned;
@@ -2015,7 +2016,7 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	read_lock_irqsave(&card->ctl_files_rwlock, flags);
 	list_for_each_entry(ctl, &card->ctl_files, list) {
 		wake_up(&ctl->change_sleep);
-		kill_fasync(&ctl->fasync, SIGIO, POLL_ERR);
+		snd_kill_fasync(ctl->fasync, SIGIO, POLL_ERR);
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 
-- 
2.35.1

