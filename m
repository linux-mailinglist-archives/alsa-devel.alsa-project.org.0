Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA68E792061
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 07:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E93384B;
	Tue,  5 Sep 2023 07:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E93384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693892796;
	bh=t8q9YcKXHvLwjMeTHrZA/qvR1iGAYQrioRmcGLncToI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PijnjnWIpgT47MsQe9Ar74E4UxMbQF8uucsdh6lFNC6I5QO8lRDnmdqvaW+qIHzPi
	 lUtt6/2Nw8OY54D90NmoPvlg533hYjJ9Ks2IEd5mkpCopFrIaVJIxc1leyFsu3f70J
	 q8tVDeNx8E02WomEwX4ZCBxPUBVZOeUf1MCt1JeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73B9CF80552; Tue,  5 Sep 2023 07:45:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6E5DF80431;
	Tue,  5 Sep 2023 07:45:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8558FF8047D; Tue,  5 Sep 2023 07:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 489E6F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 07:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 489E6F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WfjcyuM6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FMiOl54c
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B37451F74D;
	Tue,  5 Sep 2023 05:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693892722;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ouaQIpNRvfxBy5cx92uWEDL4CdzPp4e+TbtGshjgg2c=;
	b=WfjcyuM6FSJHt6AiNVqV5irmu7fMsg3x1z3FmRqb9hjbSpRmDwH+QrPJx4yiRhsjhk86z6
	pweaULfrix3irBh43DchORy4+jDCf2rV4coYaPYeFBHZJCkQck2b3WORyjw1Bdn/cGsk6V
	buzLydEOH3PBHqbkCSRlIZc62/dp16M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693892722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ouaQIpNRvfxBy5cx92uWEDL4CdzPp4e+TbtGshjgg2c=;
	b=FMiOl54c4KnwOaJs3d4loyHHGfENy68zhxwZv/HKjdKsmeq3BzzAJ5R/naQrvR4Z7V3+e6
	VKgim6yoR4dLx9Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93F00134B2;
	Tue,  5 Sep 2023 05:45:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AH4CI3LA9mT1NwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 05 Sep 2023 05:45:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ALSA: usb-audio: Fix potential memory leaks at error path for
 UMP open
Date: Tue,  5 Sep 2023 07:45:11 +0200
Message-Id: <20230905054511.20502-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BI2POQRVTJFQWKUZFP6WND3ALISCIC46
X-Message-ID-Hash: BI2POQRVTJFQWKUZFP6WND3ALISCIC46
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BI2POQRVTJFQWKUZFP6WND3ALISCIC46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The allocation and initialization errors at alloc_midi_urbs() that is
called at MIDI 2.0 / UMP device are supposed to be handled at the
caller side by invoking free_midi_urbs().  However, free_midi_urbs()
loops only for ep->num_urbs entries, and since ep->num_entries wasn't
updated yet at the allocation / init error in alloc_midi_urbs(), this
entry won't be released.

The intention of free_midi_urbs() is to release the whole elements, so
change the loop size to NUM_URBS to scan over all elements for fixing
the missed releases.

Also, the call of free_midi_urbs() is missing at
snd_usb_midi_v2_open().  Although it'll be released later at
reopen/close or disconnection, it's better to release immediately at
the error path.

Fixes: ff49d1df79ae ("ALSA: usb-audio: USB MIDI 2.0 UMP support")
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Closes: https://lore.kernel.org/r/fc275ed315b9157952dcf2744ee7bdb78defdb5f.1693746347.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index a27e244650c8..1ec177fe284e 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -265,7 +265,7 @@ static void free_midi_urbs(struct snd_usb_midi2_endpoint *ep)
 
 	if (!ep)
 		return;
-	for (i = 0; i < ep->num_urbs; ++i) {
+	for (i = 0; i < NUM_URBS; ++i) {
 		ctx = &ep->urbs[i];
 		if (!ctx->urb)
 			break;
@@ -279,6 +279,7 @@ static void free_midi_urbs(struct snd_usb_midi2_endpoint *ep)
 }
 
 /* allocate URBs for an EP */
+/* the callers should handle allocation errors via free_midi_urbs() */
 static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
 {
 	struct snd_usb_midi2_urb *ctx;
@@ -351,8 +352,10 @@ static int snd_usb_midi_v2_open(struct snd_ump_endpoint *ump, int dir)
 		return -EIO;
 	if (ep->direction == STR_OUT) {
 		err = alloc_midi_urbs(ep);
-		if (err)
+		if (err) {
+			free_midi_urbs(ep);
 			return err;
+		}
 	}
 	return 0;
 }
-- 
2.35.3

