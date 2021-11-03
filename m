Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814D5444570
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 17:08:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B511699;
	Wed,  3 Nov 2021 17:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B511699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635955716;
	bh=MaSIloMma1h68TqpIPv3a5lAJzn3BC/0xO0iyfJrqa4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fh6Ui33KeCWX0EK9rbx+V/Tc3MPkMIQshyzRz7eBEQ7CZ+rISyzeUtLzhv+O28OoZ
	 JnB+NtaG7ReeYCJ6V+poUCNWGp2i7LzQdoP3OiMYY4G91UxM9GwzYMUNB8KPOPJ6y7
	 4sf6HU3JJqh9VUfy9bbXV6BqpTmFYtHcZvS98ohg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C81E3F804C3;
	Wed,  3 Nov 2021 17:07:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63C14F8049E; Wed,  3 Nov 2021 17:07:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7D9FF80279
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 17:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7D9FF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Og427z/d"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="DcAU3Hg2"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CF338212C5;
 Wed,  3 Nov 2021 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635955628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=k3OuvJSvgbahNULZlpe5E31EuVuqOKxqUPYjT9vG3sY=;
 b=Og427z/dC6JsH3LpQbR/EaB25LVQplg2EgAU4QYn/HDojP4PbjK1AeO535FRI8TvNm2hAN
 Y+KyDGxjYh3m2ID5jM3Ce4fGf6o/qDrV2MTLI3njPpPNnnSpzpFU8zdLRXDwdqez46cwmi
 6KjFNTQ5AvK00W7K49Hj5W1oSouqYPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635955628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=k3OuvJSvgbahNULZlpe5E31EuVuqOKxqUPYjT9vG3sY=;
 b=DcAU3Hg2QxM5P/PQsu1S78bmFcLr6NkhS3p07P139XvbegoLIBf17YjL8fTHzlJKCsLesu
 JjqN6E82MUEBggDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C98BD2C168;
 Wed,  3 Nov 2021 16:07:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: timer: Unconditionally unlink slave instances, too
Date: Wed,  3 Nov 2021 17:07:07 +0100
Message-Id: <20211103160707.21928-1-tiwai@suse.de>
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
 sound/core/timer.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 4f9bab931951..5749e5275ba5 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -665,19 +665,18 @@ static int snd_timer_stop1(struct snd_timer_instance *timeri, bool stop)
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
-- 
2.26.2

