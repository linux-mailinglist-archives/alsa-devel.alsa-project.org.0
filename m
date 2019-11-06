Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F0BF1BD2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:57:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E2D16B3;
	Wed,  6 Nov 2019 17:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E2D16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573059463;
	bh=XKcyLuEbE5krvwdmCyjz1910MvSwAk9PLk2o7WLKnvw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=naBXXz+7VMhZDW9kOiHQjazeUfyQeX7EjP624K6X8Hc5nBJv+IKSuEklyBPeLzQzN
	 8udnOfmeokbJWc/xZGVGhCkhjPh+BMDHZjLtVDD1oumDXisBvYXQSrpD9wpNn97Ckh
	 7lntDPCNXJ2aoMyzrR0EmdqEKMJlKdRl1q+Yubf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 576CEF80321;
	Wed,  6 Nov 2019 17:55:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FA3FF803D0; Wed,  6 Nov 2019 17:55:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBE0DF80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE0DF80291
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9378ACEF;
 Wed,  6 Nov 2019 16:55:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 17:55:47 +0100
Message-Id: <20191106165547.23518-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Tristan Madani <tristmd@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: timer: Fix incorrectly assigned timer
	instance
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

The clean up commit 41672c0c24a6 ("ALSA: timer: Simplify error path in
snd_timer_open()") unified the error handling code paths with the
standard goto, but it introduced a subtle bug: the timer instance is
stored in snd_timer_open() incorrectly even if it returns an error.
This may eventually lead to UAF, as spotted by fuzzer.

The culprit is the snd_timer_open() code checks the
SNDRV_TIMER_IFLG_EXCLUSIVE flag with the common variable timeri.
This variable is supposed to be the newly created instance, but we
(ab-)used it for a temporary check before the actual creation of a
timer instance.  After that point, there is another check for the max
number of instances, and it bails out if over the threshold.  Before
the refactoring above, it worked fine because the code returned
directly from that point.  After the refactoring, however, it jumps to
the unified error path that stores the timeri variable in return --
even if it returns an error.  Unfortunately this stored value is kept
in the caller side (snd_timer_user_tselect()) in tu->timeri.  This
causes inconsistency later, as if the timer was successfully
assigned.

In this patch, we fix it by not re-using timeri variable but a
temporary variable for testing the exclusive connection, so timeri
remains NULL at that point.

Fixes: 41672c0c24a6 ("ALSA: timer: Simplify error path in snd_timer_open()")
Reported-and-tested-by: Tristan Madani <tristmd@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 6b724d2ee2de..59ae21b0bb93 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -284,11 +284,11 @@ int snd_timer_open(struct snd_timer_instance **ti,
 		goto unlock;
 	}
 	if (!list_empty(&timer->open_list_head)) {
-		timeri = list_entry(timer->open_list_head.next,
+		struct snd_timer_instance *t =
+			list_entry(timer->open_list_head.next,
 				    struct snd_timer_instance, open_list);
-		if (timeri->flags & SNDRV_TIMER_IFLG_EXCLUSIVE) {
+		if (t->flags & SNDRV_TIMER_IFLG_EXCLUSIVE) {
 			err = -EBUSY;
-			timeri = NULL;
 			goto unlock;
 		}
 	}
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
