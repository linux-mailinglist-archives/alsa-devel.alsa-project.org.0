Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234939F87C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D7E16F4;
	Tue,  8 Jun 2021 16:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D7E16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161404;
	bh=ctK53MDcd7HJ+YhqD/qQxvRVdabwy/t+BvA1U+GegK8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QJC4yTJdmSZAHdZXyuisCwI6wU+cPpwgAmlb9YHKnSDm9//52thrT6hr0GzjO+vBe
	 MhwIPTM0J+ma3OrVI4Z2UPllapo6ci7a91VX6jOaq411dudijMPICxRTZKX+Vh11/h
	 MJ6HOyNZBFrHH/dKxQwTFeRhI3UdShc/dy2djoSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 063FDF8055C;
	Tue,  8 Jun 2021 16:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BF7AF80557; Tue,  8 Jun 2021 16:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 091C0F804C2
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 091C0F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="SqxNeqac"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZpHDB+99"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A6CBF21956
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENsinWi7lONbu091FCneoMX/KYLLPwssYarjCCW12YU=;
 b=SqxNeqacc934d9u4E/1NDMQUE8u3X+ADGjGBdM+0N0v+JDCS+0K/+Wky96rIYty6YhkvCQ
 1ecSDSSF3FQINYzQaoLorpFfCMEcv9j2ulkQ7S8JZ/vSGIsom+co6IUaq4uthNhr5QvC9S
 VwWi4AGXJRw9c5GS2KD2wwjuY3nf1Vs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENsinWi7lONbu091FCneoMX/KYLLPwssYarjCCW12YU=;
 b=ZpHDB+99zwT93qVDw8fcl4VTXKz9TJ64u8ixcc9KlNMxYWXJip1ZuAlxORo5PcK0yCuu9C
 uRKlbozvjfM7vBAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 97E7EA3B84;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/66] ALSA: sb: Fix potential double-free of CSP mixer
 elements
Date: Tue,  8 Jun 2021 16:04:37 +0200
Message-Id: <20210608140540.17885-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

snd_sb_qsound_destroy() contains the calls of removing the previously
created mixer controls, but it doesn't clear the pointers.  As
snd_sb_qsound_destroy() itself may be repeatedly called via ioctl,
this could lead to double-free potentially.

Fix it by clearing the struct fields properly afterwards.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/sb16_csp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index dec68ae6b599..5bbe6695689d 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -1077,10 +1077,14 @@ static void snd_sb_qsound_destroy(struct snd_sb_csp * p)
 	card = p->chip->card;	
 	
 	down_write(&card->controls_rwsem);
-	if (p->qsound_switch)
+	if (p->qsound_switch) {
 		snd_ctl_remove(card, p->qsound_switch);
-	if (p->qsound_space)
+		p->qsound_switch = NULL;
+	}
+	if (p->qsound_space) {
 		snd_ctl_remove(card, p->qsound_space);
+		p->qsound_space = NULL;
+	}
 	up_write(&card->controls_rwsem);
 
 	/* cancel pending transfer of QSound parameters */
-- 
2.26.2

