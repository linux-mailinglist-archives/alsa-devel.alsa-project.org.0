Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1C59243E
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0362D16A0;
	Sun, 14 Aug 2022 18:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0362D16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494615;
	bh=X/ZLYxxDnih0e0paGcYJ4tSJ7KVpOyF0ATP2RLTK/q4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HTj4JdKERozmo8jRsvTEppw4AnPcDl3ILLv2IinSp+sDsk8emJ1DPm1z6X8nRPsMM
	 IjGf5XR1Y6o87NPj9GqzcFVaIFw5+QetcKr24znf11W7ZZKVpbwXDsIfnagLWI3kuJ
	 nuzvWuTK43e8BY5kd/c7DXnjkHT9C2g7AC6go9tU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA345F80588;
	Sun, 14 Aug 2022 18:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90789F8057C; Sun, 14 Aug 2022 18:27:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 694CAF80553
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 694CAF80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uh13lgIt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D99960C98;
 Sun, 14 Aug 2022 16:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED974C433D7;
 Sun, 14 Aug 2022 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494442;
 bh=X/ZLYxxDnih0e0paGcYJ4tSJ7KVpOyF0ATP2RLTK/q4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uh13lgItE4/WLXXSLr3LSEjHbRkjqhIdc2kdnhdKqwhxM3sFPh5IpZWqRvaRDn2Wh
 KE2wXUllzCp2vdnTsLkTJyt/NnzvM0kHopcs2Ruzq5W5lzIFDB72c4MYrFmhVWTDzD
 4O80KDB8KXS/BlTJmsb9Rnw7PqlNRo6R8oCgHJyWH4pezLYIbNMA93Xi1Z8iHzdMxS
 2hJe6xE4chMcpid7cwrcASgDOKQHkzInXn+TzFs4gtit90x1ECVk+qS1+Kjw/7XhLY
 UMjKSbC8FF0SvccndMf3wFHXEZm4XRbQqkZx972mXAwfiNP4KL5toOUBV3N6X0T5j1
 zxI8rYZ/HSUzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 21/28] ALSA: control: Use deferred fasync helper
Date: Sun, 14 Aug 2022 12:26:01 -0400
Message-Id: <20220814162610.2397644-21-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162610.2397644-1-sashal@kernel.org>
References: <20220814162610.2397644-1-sashal@kernel.org>
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
index 985c51a8fb74..a1fc7e0a47d9 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -109,7 +109,7 @@ struct snd_ctl_file {
 	int preferred_subdevice[SND_CTL_SUBDEV_ITEMS];
 	wait_queue_head_t change_sleep;
 	spinlock_t read_lock;
-	struct fasync_struct *fasync;
+	struct snd_fasync *fasync;
 	int subscribed;			/* read interface is activated */
 	struct list_head events;	/* waiting events for read */
 };
diff --git a/sound/core/control.c b/sound/core/control.c
index a25c0d64d104..f66fe4be30d3 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -127,6 +127,7 @@ static int snd_ctl_release(struct inode *inode, struct file *file)
 			if (control->vd[idx].owner == ctl)
 				control->vd[idx].owner = NULL;
 	up_write(&card->controls_rwsem);
+	snd_fasync_free(ctl->fasync);
 	snd_ctl_empty_read_queue(ctl);
 	put_pid(ctl->pid);
 	kfree(ctl);
@@ -181,7 +182,7 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 	_found:
 		wake_up(&ctl->change_sleep);
 		spin_unlock(&ctl->read_lock);
-		kill_fasync(&ctl->fasync, SIGIO, POLL_IN);
+		snd_kill_fasync(ctl->fasync, SIGIO, POLL_IN);
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 }
@@ -2002,7 +2003,7 @@ static int snd_ctl_fasync(int fd, struct file * file, int on)
 	struct snd_ctl_file *ctl;
 
 	ctl = file->private_data;
-	return fasync_helper(fd, file, on, &ctl->fasync);
+	return snd_fasync_helper(fd, file, on, &ctl->fasync);
 }
 
 /* return the preferred subdevice number if already assigned;
@@ -2170,7 +2171,7 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	read_lock_irqsave(&card->ctl_files_rwlock, flags);
 	list_for_each_entry(ctl, &card->ctl_files, list) {
 		wake_up(&ctl->change_sleep);
-		kill_fasync(&ctl->fasync, SIGIO, POLL_ERR);
+		snd_kill_fasync(ctl->fasync, SIGIO, POLL_ERR);
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 
-- 
2.35.1

