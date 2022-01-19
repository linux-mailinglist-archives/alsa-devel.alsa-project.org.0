Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09414936E5
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 10:12:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C8C2FB2;
	Wed, 19 Jan 2022 10:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C8C2FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642583528;
	bh=wDKhTwnlnIjt3UFJNwln9a+nZEYI2f57xc7b/aQbMcI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HuediLAS//O/r0qm1jY5yC1+BRojKqJd9bSFw1Js8f5hdR1qpC0/6O+JWxCM8E+a8
	 fWYfqGUQSlWyO8p98V6/5oa7xVWWbovcB0AhIfU8lCKO1Zc2dhPHc+BRPmB1CF3AN5
	 qZWT2CeqqcqhwvhfplgCCSsliQwX6QU0M+GribWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2774F80212;
	Wed, 19 Jan 2022 10:11:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4C03F801F7; Wed, 19 Jan 2022 10:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9850EF80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 10:10:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9850EF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="bqvJ2ND+"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qJdcggsr"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4995E1F384
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642583451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JY9joOtO772B6TqhEk2255sL1/j6MW+OPVJ7xCxpAdw=;
 b=bqvJ2ND+f8pAshX0tTrh0+fgoT425Vo/9UnPizwHOnG7NPMr4Il5jfJlJetRDCTINnuvKl
 RCBzC7n1VE3QdKm5NIoe/wiszez2nt+tX7WWzuQD3tvgsguhZ/gaP4uDMN2vCtUgcrKe43
 9HkCKqWpeTy42JviZJZVo6RTrPCQGNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642583451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JY9joOtO772B6TqhEk2255sL1/j6MW+OPVJ7xCxpAdw=;
 b=qJdcggsrG0jPZzgPeuSNqMoCxly3ECOSI1n3saBsFW2m2kXByeAmECxFaG10rQDOWanAI2
 YZi58j9Ea7AqzzAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 44EB2A3B85;
 Wed, 19 Jan 2022 09:10:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: Simplify snd_power_ref_and_wait() with the
 standard macro
Date: Wed, 19 Jan 2022 10:10:50 +0100
Message-Id: <20220119091050.30125-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use wait_event_cmd() macro and simplify snd_power_ref_wait()
implementation.  This may also cover possible races in the current
open code, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index ac335f5906c6..31ba7024e3ad 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -1111,29 +1111,14 @@ EXPORT_SYMBOL(snd_card_file_remove);
  */
 int snd_power_ref_and_wait(struct snd_card *card)
 {
-	wait_queue_entry_t wait;
-	int result = 0;
-
 	snd_power_ref(card);
-	/* fastpath */
 	if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0)
 		return 0;
-	init_waitqueue_entry(&wait, current);
-	add_wait_queue(&card->power_sleep, &wait);
-	while (1) {
-		if (card->shutdown) {
-			result = -ENODEV;
-			break;
-		}
-		if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0)
-			break;
-		snd_power_unref(card);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(30 * HZ);
-		snd_power_ref(card);
-	}
-	remove_wait_queue(&card->power_sleep, &wait);
-	return result;
+	wait_event_cmd(card->power_sleep,
+		       card->shutdown ||
+		       snd_power_get_state(card) == SNDRV_CTL_POWER_D0,
+		       snd_power_unref(card), snd_power_ref(card));
+	return card->shutdown ? -ENODEV : 0;
 }
 EXPORT_SYMBOL_GPL(snd_power_ref_and_wait);
 
-- 
2.31.1

