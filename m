Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A0FF7A16
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 18:38:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5621669;
	Mon, 11 Nov 2019 18:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5621669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573493915;
	bh=XBP045R2t/nauJOTCxMr2sP13Y+i0h9HscyK6R4Wh90=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s22xbHO0Eem/JDsCyeMJ6qFHt8GUyQupqW2Ff9MjomN0P6gqn07+ZWyN2Ielc7K+k
	 5Yk6l9fMuZk5Cpzb2ml6Y/8+Z7rG0gf6bf/ijVCl7910XXPae45ZMhhzWeUNo61vIl
	 /WAjA8YYrXLoWPEZZ8jKywFPZtD1pCNrCl7QIhOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FAAEF804FF;
	Mon, 11 Nov 2019 18:36:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBBE3F804FF; Mon, 11 Nov 2019 18:36:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD6EFF8015C
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 18:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD6EFF8015C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A6963AC53
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 17:36:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon, 11 Nov 2019 18:36:42 +0100
Message-Id: <20191111173642.6093-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: timer: Fix the breakage of slave link
	open
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A silly mistake was made while applying the fix for potential races in
commit 6a34367e52ca ("ALSA: timer: Fix possible race at assigning a
timer instance"): when a slave PCM is opened and succeeds, it doesn't
return but proceeds to the master timer open code instead.  Plug the
hole and beautify a bit.

Fixes: 6a34367e52ca ("ALSA: timer: Fix possible race at assigning a timer instance")
Reported-by: syzbot+4476917c053f60112c99@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 9091030f4a89..24fed5c78273 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -268,8 +268,7 @@ int snd_timer_open(struct snd_timer_instance *timeri,
 		list_add_tail(&timeri->open_list, &snd_timer_slave_list);
 		num_slaves++;
 		err = snd_timer_check_slave(timeri);
-		if (err < 0)
-			goto close;
+		goto list_added;
 	}
 
 	/* open a master instance */
@@ -324,7 +323,7 @@ int snd_timer_open(struct snd_timer_instance *timeri,
 	list_add_tail(&timeri->open_list, &timer->open_list_head);
 	timer->num_instances++;
 	err = snd_timer_check_master(timeri);
- close:
+list_added:
 	if (err < 0)
 		snd_timer_close_locked(timeri, &card_dev_to_put);
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
