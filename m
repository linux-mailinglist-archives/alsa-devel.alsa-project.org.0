Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A441076C7
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:55:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220551830;
	Fri, 22 Nov 2019 18:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220551830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574445303;
	bh=z5ymzH3Bxjp1709CohWAe5OrJLQEEdMA/RvFA3JmTTk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jKp4eyWOIZYFvpUkPSD6oE6VdOYY3bc8uqAL3QjHwO+jTg4FdsQR5+aHmf6R+GFMG
	 io2PtiRovFbNkDcJnUa4Du13SV7W51MQbnR/Mia5qrGF7sbHnyTbak0lcjRPWpirr4
	 YO3CbyqUfRu91xzAOtiKvcd/dNZYKq6z30KXGsdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F458F8014A;
	Fri, 22 Nov 2019 18:53:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA58F800EF; Fri, 22 Nov 2019 18:53:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71156F800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71156F800EF
IronPort-SDR: 4EZfq6p9ngHgFGcN2Aoysp3vMnB21Uy35m/HOmMF7lWXxYqYEVh56wlSwQJ6pZ+XwmM0fpb/Oy
 SQ3JtbItDLFjT6r3SliE4cI7axB1iTeg8bfIqT8EMoXWNVI5WOtK5q/y8Gj/URLzj2Upb1qmJ+
 AKp9GyBxpi4Y7c1rDNbD0zC7iuarqLpLJDJyREE1qaU0NFSlUpXx3nYbdUL+DL6tKv1wS/u0Z0
 RXNXCZ5KYj9f7kF+a+MePviDUzWLfiJNnmMeno3GC8tU6dOgMTuJDReZGW5TC9JbvZX+7T+7Qm
 dLw=
X-IronPort-AV: E=Sophos;i="5.69,230,1571731200"; d="scan'208";a="43373733"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 22 Nov 2019 09:53:11 -0800
IronPort-SDR: wF5LDk+dyX65opAPimVh69XX/p/Naarbwluir5E8WXg8Mh0HUe+SXC8pOKFVrRGqAOu3hN6cch
 XJnpWvbXeMUYwWTrqBe8NoyKJhslb9l1EE/GHcqm3Kokds2pGICYJMBLZTDZy1j/D7jwwA9Lqp
 ThFcxkRlL6LVOITHjJTADJcYLSL6xaAcmbN2fDh+hlVjtklIR58xN5LkhAfXMkPyuXbW0jU4wS
 ZUAw361MxV7ZEZi7x9txEyBAA9noHSNzxH9ZeprSXCbWypQSPhZTYOuX4ZDuZ9eBJimjmfCTXf
 /Go=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Fri, 22 Nov 2019 11:52:17 -0600
Message-ID: <20191122175218.17187-1-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH 1/2] ALSA: aloop: Remove redundant locking in
	timer open function
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

loopback_parse_timer_id() uses snd_card_ref(), that can lock on mutex,
also snd_timer_instance_new() uses non-atomic allocation, that can sleep.
So, both functions can not be called from loopback_snd_timer_open()
with cable->lock spinlock locked.

Moreover, most part of loopback_snd_timer_open() function body works
when the opposite stream of the same cable does not yet exist, and
the current stream is not yet completely open and can't be running,
so existing locking of loopback->cable_lock mutex is enough to protect
from conflicts with simultaneous opening or closing.
Locking of cable->lock spinlock is not needed in this case.

Fixes: 26c53379f98d ("ALSA: aloop: Support selection of snd_timer instead of jiffies")
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 1408403f727a..6408932f5f72 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1107,20 +1107,18 @@ static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
 	struct snd_timer_instance *timeri;
 	struct loopback_cable *cable = dpcm->cable;
 
-	spin_lock_irq(&cable->lock);
-
 	/* check if timer was already opened. It is only opened once
 	 * per playback and capture subdevice (aka cable).
 	 */
 	if (cable->snd_timer.instance)
-		goto unlock;
+		goto exit;
 
 	err = loopback_parse_timer_id(dpcm->loopback->timer_source, &tid);
 	if (err < 0) {
 		pcm_err(dpcm->substream->pcm,
 			"Parsing timer source \'%s\' failed with %d",
 			dpcm->loopback->timer_source, err);
-		goto unlock;
+		goto exit;
 	}
 
 	cable->snd_timer.stream = dpcm->substream->stream;
@@ -1129,7 +1127,7 @@ static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
 	timeri = snd_timer_instance_new(dpcm->loopback->card->id);
 	if (!timeri) {
 		err = -ENOMEM;
-		goto unlock;
+		goto exit;
 	}
 	/* The callback has to be called from another tasklet. If
 	 * SNDRV_TIMER_IFLG_FAST is specified it will be called from the
@@ -1148,10 +1146,9 @@ static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
 	tasklet_init(&cable->snd_timer.event_tasklet,
 		     loopback_snd_timer_tasklet, (unsigned long)timeri);
 
-	/* snd_timer_close() and snd_timer_open() should not be called with
-	 * locked spinlock because both functions can block on a mutex. The
-	 * mutex loopback->cable_lock is kept locked. Therefore snd_timer_open()
-	 * cannot be called a second time by the other device of the same cable.
+	/* The mutex loopback->cable_lock is kept locked.
+	 * Therefore snd_timer_open() cannot be called a second time
+	 * by the other device of the same cable.
 	 * Therefore the following issue cannot happen:
 	 * [proc1] Call loopback_timer_open() ->
 	 *	   Unlock cable->lock for snd_timer_close/open() call
@@ -1160,9 +1157,7 @@ static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
 	 * [proc1] Call snd_timer_open() and overwrite running timer
 	 *	   instance
 	 */
-	spin_unlock_irq(&cable->lock);
 	err = snd_timer_open(timeri, &cable->snd_timer.id, current->pid);
-	spin_lock_irq(&cable->lock);
 	if (err < 0) {
 		pcm_err(dpcm->substream->pcm,
 			"snd_timer_open (%d,%d,%d) failed with %d",
@@ -1171,14 +1166,12 @@ static int loopback_snd_timer_open(struct loopback_pcm *dpcm)
 			cable->snd_timer.id.subdevice,
 			err);
 		snd_timer_instance_free(timeri);
-		goto unlock;
+		goto exit;
 	}
 
 	cable->snd_timer.instance = timeri;
 
-unlock:
-	spin_unlock_irq(&cable->lock);
-
+exit:
 	return err;
 }
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
