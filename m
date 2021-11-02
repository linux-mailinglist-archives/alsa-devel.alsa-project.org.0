Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC24430A2
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 15:40:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C4A916AD;
	Tue,  2 Nov 2021 15:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C4A916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635864043;
	bh=+1hn52q8y8zti+fTuq+ANsyey3M7nmCv/qZFAU7AKVE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KKq8oOGSND2c8uGfjwcSHP8Dg3qehmXsCrWu/VJvN0fKglrjxSQPSbrBeXIC7hpy8
	 h0lb/nlkqXGqu679spmIu+ky8AOUUaylGp+ogkHn3DwUqNNF6h9xY+l2iL4ChKHkaf
	 kzGSwlQkFkP0wTX5Fqkaj+10ps5FWwKoCbG5tBiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DCEFF8025F;
	Tue,  2 Nov 2021 15:39:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3AA3F8025D; Tue,  2 Nov 2021 14:43:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C5DEF800BF
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 14:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C5DEF800BF
Received: from dggeme762-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hk9yx4jCJzZcf8;
 Tue,  2 Nov 2021 21:40:57 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggeme762-chm.china.huawei.com
 (10.3.19.108) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Tue, 2
 Nov 2021 21:43:01 +0800
From: Wang Wensheng <wangwensheng4@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <broonie@kernel.org>,
 <joe@perches.com>, <wangwensheng4@huawei.com>, <alsa-devel@alsa-project.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ALSA: timer: Fix use-after-free problem
Date: Tue, 2 Nov 2021 13:41:07 +0000
Message-ID: <20211102134107.35126-1-wangwensheng4@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 02 Nov 2021 15:39:24 +0100
Cc: rui.xiang@huawei.com
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

When the timer instance was add into ack_list but was not currently in
process, the user could stop it via snd_timer_stop1() without delete it
from the ack_list. Then the user could free the timer instance and when
it was actually processed UAF occurred.

This issue could be reproduced via testcase snd_timer01 in ltp - running
several instances of that testcase at the same time.

What I actually met was that the ack_list of the timer broken and the
kernel went into deadloop with irqoff. That could be detected by
hardlockup detector on board or when we run it on qemu, we could use gdb
to dump the ack_list when the console has no response.

To fix this issue, we introduce a new flag SNDRV_TIMER_IFLG_ACKING to
indicate the state where the timer instance is in ack_list but not
currently processed and check against the new flag in snd_timer_stop1()
and delete it from ack_list if the flag is set.

Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
---
 include/sound/timer.h |  1 +
 sound/core/timer.c    | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/sound/timer.h b/include/sound/timer.h
index 760e132cc0cd..549288e94a39 100644
--- a/include/sound/timer.h
+++ b/include/sound/timer.h
@@ -31,6 +31,7 @@
 #define SNDRV_TIMER_IFLG_CALLBACK 0x00000020	/* timer callback is active */
 #define SNDRV_TIMER_IFLG_EXCLUSIVE 0x00000040	/* exclusive owner - no more instances */
 #define SNDRV_TIMER_IFLG_EARLY_EVENT 0x00000080	/* write early event to the poll queue */
+#define SNDRV_TIMER_IFLG_ACKING    0x00000100	/* the timeri was added to ack_list */
 
 #define SNDRV_TIMER_FLG_CHANGE	0x00000001
 #define SNDRV_TIMER_FLG_RESCHED	0x00000002	/* need reschedule */
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 92b7008fcdb8..1d1e4274919c 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -625,10 +625,12 @@ static int snd_timer_stop1(struct snd_timer_instance *timeri, bool stop)
 		return -EINVAL;
 	spin_lock_irqsave(&timer->lock, flags);
 	if (!(timeri->flags & (SNDRV_TIMER_IFLG_RUNNING |
-			       SNDRV_TIMER_IFLG_START))) {
+			       SNDRV_TIMER_IFLG_START |
+			       SNDRV_TIMER_IFLG_ACKING))) {
 		result = -EBUSY;
 		goto unlock;
 	}
+
 	list_del_init(&timeri->ack_list);
 	list_del_init(&timeri->active_list);
 	if (timer->card && timer->card->shutdown)
@@ -649,7 +651,8 @@ static int snd_timer_stop1(struct snd_timer_instance *timeri, bool stop)
 			}
 		}
 	}
-	timeri->flags &= ~(SNDRV_TIMER_IFLG_RUNNING | SNDRV_TIMER_IFLG_START);
+	timeri->flags &= ~(SNDRV_TIMER_IFLG_RUNNING | SNDRV_TIMER_IFLG_START |
+			   SNDRV_TIMER_IFLG_ACKING);
 	if (stop)
 		timeri->flags &= ~SNDRV_TIMER_IFLG_PAUSED;
 	else
@@ -786,6 +789,7 @@ static void snd_timer_process_callbacks(struct snd_timer *timer,
 
 		/* remove from ack_list and make empty */
 		list_del_init(&ti->ack_list);
+		ti->flags &= ~SNDRV_TIMER_IFLG_ACKING;
 
 		if (!(ti->flags & SNDRV_TIMER_IFLG_DEAD)) {
 			ticks = ti->pticks;
@@ -890,8 +894,10 @@ void snd_timer_interrupt(struct snd_timer * timer, unsigned long ticks_left)
 			ack_list_head = &timer->ack_list_head;
 		else
 			ack_list_head = &timer->sack_list_head;
-		if (list_empty(&ti->ack_list))
+		if (list_empty(&ti->ack_list)) {
 			list_add_tail(&ti->ack_list, ack_list_head);
+			ti->flags |= SNDRV_TIMER_IFLG_ACKING;
+		}
 		list_for_each_entry(ts, &ti->slave_active_head, active_list) {
 			ts->pticks = ti->pticks;
 			ts->resolution = resolution;
-- 
2.17.1

