Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B630360A5F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 15:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE34D1678;
	Thu, 15 Apr 2021 15:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE34D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618492850;
	bh=iIg1gLIf7xOvUXDh6ACO7COsilxSIUWwwwHeKhu4rtk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iLN3DUpczyXZyum9gFxy6RzuzdGtrbUdzZfCaglG6gIqw+Iki7lnGwL8uuAq6gnDv
	 KhvUG8SbdpVd76hEQZAWhg0akKWuqM6Ow/5wwcfbO8s5NG8/s6E4nbbMqdrmwwW+vd
	 mnc6pO8fhKMEaMYAoH4RuNX70+X6jSFykwS2Rfvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D8AFF8021D;
	Thu, 15 Apr 2021 15:19:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D403F8022B; Thu, 15 Apr 2021 15:19:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB664F800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 15:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB664F800FF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A50DAE56;
 Thu, 15 Apr 2021 13:19:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: control: Fix racy management of user ctl memory size
 account
Date: Thu, 15 Apr 2021 15:18:56 +0200
Message-Id: <20210415131856.13113-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Gong, Sishuai" <sishuai@purdue.edu>
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

We've got a report about the possible race in the user control element
counts (card->user_ctl_count), and it was confirmed that the race
wasn't serious in the old code up to 5.12.  There, the value
modification itself was exclusive and protected via a write semaphore,
hence it's at most concurrent reads and evaluations before the
increment.  Since it's only about the soft-limit to avoid the
exhausting memory usage, one-off isn't a big problem at all.

Meanwhile, the relevant code has been largely modified recently, and
now card->user_ctl_count was replaced with card->user_ctl_alloc_size,
and a few more places were added to access this field.  And, in this
new code, it turned out to be more serious: the modifications are
scattered in various places, and a few of them are without protection.
It implies that it may lead to an inconsistent value by racy
accesses.

For addressing it, this patch extends the range covered by the
card->controls_rwsem write lock at snd_ctl_elem_add() so that the all
code paths that modify and refer to card->user_ctl_alloc_size are
protected by the rwsem properly.

The patch adds also comments in a couple of functions to indicate that
they are under the rwsem lock.

Fixes: 66c6d1ef86ff ("ALSA: control: Add memory consumption limit to user controls")
Link: https://lore.kernel.org/r/FEEBF384-44BE-42CF-8FB3-93470933F64F@purdue.edu
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index a076c08c21b6..498e3701514a 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1337,6 +1337,7 @@ static int snd_ctl_elem_user_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
+/* called in controls_rwsem write lock */
 static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 			    unsigned int size)
 {
@@ -1414,6 +1415,7 @@ static int snd_ctl_elem_user_tlv(struct snd_kcontrol *kctl, int op_flag,
 		return read_user_tlv(kctl, buf, size);
 }
 
+/* called in controls_rwsem write lock */
 static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 {
 	char *names, *p;
@@ -1529,8 +1531,11 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	private_size = value_sizes[info->type] * info->count;
 	alloc_size = compute_user_elem_size(private_size, count);
 
-	if (check_user_elem_overflow(card, alloc_size))
-		return -ENOMEM;
+	down_write(&card->controls_rwsem);
+	if (check_user_elem_overflow(card, alloc_size)) {
+		err = -ENOMEM;
+		goto unlock;
+	}
 
 	/*
 	 * Keep memory object for this userspace control. After passing this
@@ -1540,12 +1545,13 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	 */
 	err = snd_ctl_new(&kctl, count, access, file);
 	if (err < 0)
-		return err;
+		goto unlock;
 	memcpy(&kctl->id, &info->id, sizeof(kctl->id));
 	ue = kzalloc(alloc_size, GFP_KERNEL);
 	if (!ue) {
 		kfree(kctl);
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto unlock;
 	}
 	kctl->private_data = ue;
 	kctl->private_free = snd_ctl_elem_user_free;
@@ -1563,7 +1569,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 		err = snd_ctl_elem_init_enum_names(ue);
 		if (err < 0) {
 			snd_ctl_free_one(kctl);
-			return err;
+			goto unlock;
 		}
 	}
 
@@ -1580,7 +1586,6 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 		kctl->tlv.c = snd_ctl_elem_user_tlv;
 
 	/* This function manage to free the instance on failure. */
-	down_write(&card->controls_rwsem);
 	err = __snd_ctl_add_replace(card, kctl, CTL_ADD_EXCLUSIVE);
 	if (err < 0) {
 		snd_ctl_free_one(kctl);
-- 
2.26.2

