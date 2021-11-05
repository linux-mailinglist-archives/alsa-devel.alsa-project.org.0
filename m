Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A4446140
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 10:16:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E77173E;
	Fri,  5 Nov 2021 10:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E77173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636103809;
	bh=N+fS2/FWfSWACLWIGidYX5qCcjvzB2aq23w/ReEKAY8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ayxSKfrwVTkNp2Yi9Je1TMvz0XZN7jCIgKfdjPfaQFRunTdEFS+VRKUUixLLc9+HG
	 FDzIEK6TvWfTdflkeTzgWYFwog1vB/wHHhD/if3X0j5x16kcZVjhURLIkxL8BUdQJ/
	 5fZFtgXrvvfaqMDzWB9rC3l8YAV+Ye7OpWtDyXvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19CD0F8012A;
	Fri,  5 Nov 2021 10:15:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5822F8026A; Fri,  5 Nov 2021 10:15:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72A81F80148
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 10:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A81F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cVyc1aPL"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="E8nBqbRR"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C8EAA1FD33;
 Fri,  5 Nov 2021 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636103718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EPlXW56q6X3EX4uVauMyFslZfzhPE5RKeAL9JGg4KAQ=;
 b=cVyc1aPLXCgZrWWiXl3H+MUcBZGMoKdKSDSwm/glHweb9i25Y36FL0yiLHBH/Oov9/bq0D
 zcByFyvhOoGGKsIF4jk0mXkDqXd1yhcL/3HJw0SgzEStSxu7uCoM54w+z41I1Nizf5mV1d
 n+/uCozLeErSaMRD6Vuww/Nn2r4WdPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636103718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EPlXW56q6X3EX4uVauMyFslZfzhPE5RKeAL9JGg4KAQ=;
 b=E8nBqbRRdhCPg5LA175YKW65AKl+7MDWvVzq7bq+Vz1Ze2aAvzuOrhZvOnPKLiaKyPIH1q
 8gHrJbK0vmN03TDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C23F42C154;
 Fri,  5 Nov 2021 09:15:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: timer: Unconditionally unlink slave instances, too
Date: Fri,  5 Nov 2021 10:15:17 +0100
Message-Id: <20211105091517.21733-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Wang Wensheng <wangwensheng4@huawei.com>
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

Like the previous fix (commit c0317c0e8709 "ALSA: timer: Fix
use-after-free problem"), we have to unlink slave timer instances
immediately at snd_timer_stop(), too.  Otherwise it may leave a stale
entry in the list if the slave instance is freed before actually
running.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: return -EBUSY again if the instance isn't running

 sound/core/timer.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 4f9bab931951..b3214baa8919 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -665,23 +665,22 @@ static int snd_timer_stop1(struct snd_timer_instance *timeri, bool stop)
 static int snd_timer_stop_slave(struct snd_timer_instance *timeri, bool stop)
 {
 	unsigned long flags;
+	bool running;
 
 	spin_lock_irqsave(&slave_active_lock, flags);
-	if (!(timeri->flags & SNDRV_TIMER_IFLG_RUNNING)) {
-		spin_unlock_irqrestore(&slave_active_lock, flags);
-		return -EBUSY;
-	}
+	running = timeri->flags & SNDRV_TIMER_IFLG_RUNNING;
 	timeri->flags &= ~SNDRV_TIMER_IFLG_RUNNING;
 	if (timeri->timer) {
 		spin_lock(&timeri->timer->lock);
 		list_del_init(&timeri->ack_list);
 		list_del_init(&timeri->active_list);
-		snd_timer_notify1(timeri, stop ? SNDRV_TIMER_EVENT_STOP :
-				  SNDRV_TIMER_EVENT_PAUSE);
+		if (running)
+			snd_timer_notify1(timeri, stop ? SNDRV_TIMER_EVENT_STOP :
+					  SNDRV_TIMER_EVENT_PAUSE);
 		spin_unlock(&timeri->timer->lock);
 	}
 	spin_unlock_irqrestore(&slave_active_lock, flags);
-	return 0;
+	return running ? 0 : -EBUSY;
 }
 
 /*
-- 
2.26.2

