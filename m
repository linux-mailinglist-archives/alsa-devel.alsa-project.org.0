Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF80D78ED0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 17:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506121823;
	Mon, 29 Jul 2019 17:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506121823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564413178;
	bh=6LZKayKW7EXEUPuZtsB9SK1BLakXeSp510x2XLJPMow=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IEp5qQO9/lA4YCdLUNU0K3MFAT9FYzPm4826BJT2YSKDW7NORnAKoLdKG9tdUPRHu
	 6v6kY1iqRMONyAe6GHljTg+gHdyUbfeRdO9fLFnQoNG0DlEGEZKKQBnLliF+U51b5u
	 PXBs1OtTC1JwIAdJ4pHdb5uL2JdxBHq3RkNcxSWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B09F8048F;
	Mon, 29 Jul 2019 17:11:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A67F8048D; Mon, 29 Jul 2019 17:11:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D550F803D5;
 Mon, 29 Jul 2019 17:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D550F803D5
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 13F313C057C;
 Mon, 29 Jul 2019 17:11:02 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVXvr6OM67UR; Mon, 29 Jul 2019 17:10:56 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 3AEDD3C00B7;
 Mon, 29 Jul 2019 17:10:56 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 29 Jul 2019 17:10:55 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Mon, 29 Jul 2019 17:10:36 +0200
Message-ID: <1564413036-3165-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org, Yuki Tsunashima <ytsunashima@jp.adit-jv.com>,
 Suresh Udipi <sudipi@jp.adit-jv.com>
Subject: [alsa-devel] [PATCH] ALSA: pcm: fix lost wakeup event scenarios in
	snd_pcm_drain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Yuki Tsunashima <ytsunashima@jp.adit-jv.com>

lost wakeup can occur after enabling irq, therefore put task
into interruptible before enabling interrupts,

without this change, task can be put to sleep and snd_pcm_drain
will delay

Signed-off-by: Yuki Tsunashima <ytsunashima@jp.adit-jv.com>
Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
[ported from 4.9]
Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
---
 sound/core/pcm_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 860543a..fe333c8 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1874,6 +1874,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 		if (!to_check)
 			break; /* all drained */
 		init_waitqueue_entry(&wait, current);
+		set_current_state(TASK_INTERRUPTIBLE);
 		add_wait_queue(&to_check->sleep, &wait);
 		snd_pcm_stream_unlock_irq(substream);
 		if (runtime->no_period_wakeup)
@@ -1886,7 +1887,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 			}
 			tout = msecs_to_jiffies(tout * 1000);
 		}
-		tout = schedule_timeout_interruptible(tout);
+		tout = schedule_timeout(tout);
 
 		snd_pcm_stream_lock_irq(substream);
 		group = snd_pcm_stream_group_ref(substream);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
