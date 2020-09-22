Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E669273DC9
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 10:51:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 165AD16C1;
	Tue, 22 Sep 2020 10:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 165AD16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600764706;
	bh=YGIrUZrPiwXVL49g1SFAM03UQumVO0gciNYj3y6Ng08=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PcDKw5Hxbj4O2boOwNuZGwzzz+rU6rdASGRCuX8gVQmPIEGNCTsn9HJCfFF9RcC+g
	 1bEutDiIQKQAqg99tsUlebZaAOs7mBoukVKQWZ56rip7rwOD9DMcAm903SpIWkIm/b
	 WgIFP6VBnzTgdw5t3qws5COUQd3JaGcu3KnmUMrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 298A1F80229;
	Tue, 22 Sep 2020 10:50:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 766C5F8010A; Tue, 22 Sep 2020 10:50:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 479B8F8010A
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 10:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 479B8F8010A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3057AEEF
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 08:50:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ctl: Workaround for lockdep warning wrt
 card->ctl_files_rwlock
Date: Tue, 22 Sep 2020 10:49:53 +0200
Message-Id: <20200922084953.29018-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

The recent change in lockdep for read lock caused the deadlock
warnings in ALSA control code which uses the read_lock() for
notification and else while write_lock_irqsave() is used for adding
and removing the list entry.  Although a deadlock would practically
never hit in a real usage (the addition and the deletion can't happen
with the notification), it's better to fix the read_lock() usage in a
semantically correct way.

This patch replaces the read_lock() calls with read_lock_irqsave()
version for avoiding a reported deadlock.  The notification code path
takes the irq disablement in anyway, and other code paths are very
short execution, hence there shouldn't be any big performance hit by
this change.

Fixes: e918188611f0 ("locking: More accurate annotations for read_lock()")
Reported-by: syzbot+561a74f84100162990b2@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index e014598142df..421ddc76f264 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -150,14 +150,14 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 		return;
 	if (card->shutdown)
 		return;
-	read_lock(&card->ctl_files_rwlock);
+	read_lock_irqsave(&card->ctl_files_rwlock, flags);
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
 	card->mixer_oss_change_count++;
 #endif
 	list_for_each_entry(ctl, &card->ctl_files, list) {
 		if (!ctl->subscribed)
 			continue;
-		spin_lock_irqsave(&ctl->read_lock, flags);
+		spin_lock(&ctl->read_lock);
 		list_for_each_entry(ev, &ctl->events, list) {
 			if (ev->id.numid == id->numid) {
 				ev->mask |= mask;
@@ -174,10 +174,10 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 		}
 	_found:
 		wake_up(&ctl->change_sleep);
-		spin_unlock_irqrestore(&ctl->read_lock, flags);
+		spin_unlock(&ctl->read_lock);
 		kill_fasync(&ctl->fasync, SIGIO, POLL_IN);
 	}
-	read_unlock(&card->ctl_files_rwlock);
+	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 }
 EXPORT_SYMBOL(snd_ctl_notify);
 
@@ -1951,8 +1951,9 @@ int snd_ctl_get_preferred_subdevice(struct snd_card *card, int type)
 {
 	struct snd_ctl_file *kctl;
 	int subdevice = -1;
+	unsigned long flags;
 
-	read_lock(&card->ctl_files_rwlock);
+	read_lock_irqsave(&card->ctl_files_rwlock, flags);
 	list_for_each_entry(kctl, &card->ctl_files, list) {
 		if (kctl->pid == task_pid(current)) {
 			subdevice = kctl->preferred_subdevice[type];
@@ -1960,7 +1961,7 @@ int snd_ctl_get_preferred_subdevice(struct snd_card *card, int type)
 				break;
 		}
 	}
-	read_unlock(&card->ctl_files_rwlock);
+	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 	return subdevice;
 }
 EXPORT_SYMBOL_GPL(snd_ctl_get_preferred_subdevice);
@@ -2009,13 +2010,14 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 {
 	struct snd_card *card = device->device_data;
 	struct snd_ctl_file *ctl;
+	unsigned long flags;
 
-	read_lock(&card->ctl_files_rwlock);
+	read_lock_irqsave(&card->ctl_files_rwlock, flags);
 	list_for_each_entry(ctl, &card->ctl_files, list) {
 		wake_up(&ctl->change_sleep);
 		kill_fasync(&ctl->fasync, SIGIO, POLL_ERR);
 	}
-	read_unlock(&card->ctl_files_rwlock);
+	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 
 	return snd_unregister_device(&card->ctl_dev);
 }
-- 
2.16.4

