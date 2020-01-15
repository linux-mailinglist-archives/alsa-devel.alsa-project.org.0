Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8084313CE27
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 21:39:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A98817A8;
	Wed, 15 Jan 2020 21:38:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A98817A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579120764;
	bh=j/kLo3D0XTle8HFAiP9r8rvhIkJiwaWDJIEiZ2Uo8Rw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AzP8FC1ok3uzaRUJ+U5K4FSO6iZqyB6RxydsrUFMu03yaB/6aQOUwQSYKbCUWfdZR
	 p7ydr5ECAzNakkV5pZzF2nKQytyRRkY1Mj4GanoSV8ZxjSvbut0EEMJ9vRdyy0gK5p
	 ddcvTtZbD2wZ1fzgkTXdRIrAPp9Na+xGYiZI7Alg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3EECF801F8;
	Wed, 15 Jan 2020 21:37:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60DA3F801EB; Wed, 15 Jan 2020 21:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ACB4F800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 21:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ACB4F800CC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5FCBFB021
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 20:37:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 15 Jan 2020 21:37:33 +0100
Message-Id: <20200115203733.26530-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: seq: Fix racy access for queue timer in
	proc read
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

snd_seq_info_timer_read() reads the information of the timer assigned
for each queue, but it's done in a racy way which may lead to UAF as
spotted by syzkaller.

This patch applies the missing q->timer_mutex lock while accessing the
timer object as well as a slight code change to adapt the standard
coding style.

Reported-by: syzbot+2b2ef983f973e5c40943@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_timer.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index 63dc7bdb622d..be59b59c9be4 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -471,15 +471,19 @@ void snd_seq_info_timer_read(struct snd_info_entry *entry,
 		q = queueptr(idx);
 		if (q == NULL)
 			continue;
-		if ((tmr = q->timer) == NULL ||
-		    (ti = tmr->timeri) == NULL) {
-			queuefree(q);
-			continue;
-		}
+		mutex_lock(&q->timer_mutex);
+		tmr = q->timer;
+		if (!tmr)
+			goto unlock;
+		ti = tmr->timeri;
+		if (!ti)
+			goto unlock;
 		snd_iprintf(buffer, "Timer for queue %i : %s\n", q->queue, ti->timer->name);
 		resolution = snd_timer_resolution(ti) * tmr->ticks;
 		snd_iprintf(buffer, "  Period time : %lu.%09lu\n", resolution / 1000000000, resolution % 1000000000);
 		snd_iprintf(buffer, "  Skew : %u / %u\n", tmr->skew, tmr->skew_base);
+unlock:
+		mutex_unlock(&q->timer_mutex);
 		queuefree(q);
  	}
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
