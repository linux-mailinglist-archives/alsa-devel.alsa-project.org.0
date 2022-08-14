Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A159242F
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DE3B1685;
	Sun, 14 Aug 2022 18:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DE3B1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494593;
	bh=dJICxAXUVqoAvRcs1iEYL7jr+zKhXIpbPrZJ96/wyv0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KevmtlPQ7JXxFc85EhXpsOToeb4go9sMmb0bU5q1bU2qsSMVnt7FAwUnhb32vemDD
	 9WdGuH+uTly7rgRfC+zdpT8P2BPhM4V/X/8jCbVkDhArMAuL3FB373l1MYvm7Z2d08
	 zu8nS08+AHvPQiYf+YTAB4IVnjWXWSX6jt+RDx0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 943EBF80557;
	Sun, 14 Aug 2022 18:27:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8FEF80515; Sun, 14 Aug 2022 18:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 523B6F80515
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 523B6F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kde2bluc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78BCB60FCE;
 Sun, 14 Aug 2022 16:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A369C433C1;
 Sun, 14 Aug 2022 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494439;
 bh=dJICxAXUVqoAvRcs1iEYL7jr+zKhXIpbPrZJ96/wyv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kde2bluc7tVHBKC3Fc7RFxt6FJiCLHs568iDXp4UbGEWJwBcQo2Cj8e2iLJCDTw7O
 7fsrBBE0UbQmCP4nrMcGakslJW02hZ8tyIBARB4BTKrVKAKCrrJdKtKjRASWJOJC/r
 +urSycRXnFN0WQInVvxYMXt3co/WV02wNFF2Kajd88qUU5FncKIkfXpz5tp+2RGDCn
 cDwtqFRt0OEuuRPPwSQVRJPdlCIEnGNS0ZqOl9XFwzhfXA1AZRGzlK45R68PZ4kicn
 McsD17etgBN6n9G0CbVjZ1SMJngedoQMIbRwx7vLB8ju1xwGkhXa62Z+TMXFTP4vOK
 YZghYxVDn3kJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 20/28] ALSA: timer: Use deferred fasync helper
Date: Sun, 14 Aug 2022 12:26:00 -0400
Message-Id: <20220814162610.2397644-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162610.2397644-1-sashal@kernel.org>
References: <20220814162610.2397644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, wangwensheng4@huawei.com,
 syzbot+49b10793b867871ee26f@syzkaller.appspotmail.com, tiwai@suse.com,
 syzbot+1ee0910eca9c94f71f25@syzkaller.appspotmail.com,
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

[ Upstream commit 95cc637c1afd83fb7dd3d7c8a53710488f4caf9c ]

For avoiding the potential deadlock via kill_fasync() call, use the
new fasync helpers to defer the invocation from PCI API.  Note that
it's merely a workaround.

Reported-by: syzbot+1ee0910eca9c94f71f25@syzkaller.appspotmail.com
Reported-by: syzbot+49b10793b867871ee26f@syzkaller.appspotmail.com
Reported-by: syzbot+8285e973a41b5aa68902@syzkaller.appspotmail.com
Link: https://lore.kernel.org/r/20220728125945.29533-3-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/timer.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index b3214baa8919..e08a37c23add 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -83,7 +83,7 @@ struct snd_timer_user {
 	unsigned int filter;
 	struct timespec64 tstamp;		/* trigger tstamp */
 	wait_queue_head_t qchange_sleep;
-	struct fasync_struct *fasync;
+	struct snd_fasync *fasync;
 	struct mutex ioctl_lock;
 };
 
@@ -1345,7 +1345,7 @@ static void snd_timer_user_interrupt(struct snd_timer_instance *timeri,
 	}
       __wake:
 	spin_unlock(&tu->qlock);
-	kill_fasync(&tu->fasync, SIGIO, POLL_IN);
+	snd_kill_fasync(tu->fasync, SIGIO, POLL_IN);
 	wake_up(&tu->qchange_sleep);
 }
 
@@ -1383,7 +1383,7 @@ static void snd_timer_user_ccallback(struct snd_timer_instance *timeri,
 	spin_lock_irqsave(&tu->qlock, flags);
 	snd_timer_user_append_to_tqueue(tu, &r1);
 	spin_unlock_irqrestore(&tu->qlock, flags);
-	kill_fasync(&tu->fasync, SIGIO, POLL_IN);
+	snd_kill_fasync(tu->fasync, SIGIO, POLL_IN);
 	wake_up(&tu->qchange_sleep);
 }
 
@@ -1453,7 +1453,7 @@ static void snd_timer_user_tinterrupt(struct snd_timer_instance *timeri,
 	spin_unlock(&tu->qlock);
 	if (append == 0)
 		return;
-	kill_fasync(&tu->fasync, SIGIO, POLL_IN);
+	snd_kill_fasync(tu->fasync, SIGIO, POLL_IN);
 	wake_up(&tu->qchange_sleep);
 }
 
@@ -1521,6 +1521,7 @@ static int snd_timer_user_release(struct inode *inode, struct file *file)
 			snd_timer_instance_free(tu->timeri);
 		}
 		mutex_unlock(&tu->ioctl_lock);
+		snd_fasync_free(tu->fasync);
 		kfree(tu->queue);
 		kfree(tu->tqueue);
 		kfree(tu);
@@ -2135,7 +2136,7 @@ static int snd_timer_user_fasync(int fd, struct file * file, int on)
 	struct snd_timer_user *tu;
 
 	tu = file->private_data;
-	return fasync_helper(fd, file, on, &tu->fasync);
+	return snd_fasync_helper(fd, file, on, &tu->fasync);
 }
 
 static ssize_t snd_timer_user_read(struct file *file, char __user *buffer,
-- 
2.35.1

