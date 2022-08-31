Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343B5A7E24
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 15:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939F216C8;
	Wed, 31 Aug 2022 14:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939F216C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661950816;
	bh=XTrrF8PLb/iqxabhVGU7Z5Wwz7SSjOjCt7z6Ht8QMh4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y1z45w7uHFNKD0X94esaAYJXsjLarsHf6sWKm91/wsOYxKH9+P4OvGwvqwoFHqSwi
	 zzvpItMtylqeRJrE0Fr2HeInmwqs162GxIVPzO+EWO7Uz2JA12LZQw3pEs7pJRs8kK
	 OmTo7gWPu4CqUVVm+Eq+qudpQDOuUqIhogZ8O7T0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CC8F80448;
	Wed, 31 Aug 2022 14:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6918F80448; Wed, 31 Aug 2022 14:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81638F8012A
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 14:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81638F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="AsFZQm3t"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="9v6UoH1U"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF9642216D;
 Wed, 31 Aug 2022 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661950746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Rmbez77FS5Hvfp/JMOfp2c+xbsce3BCdyA7QzrOhDrY=;
 b=AsFZQm3tENvl6WUwHEDAAzGpWHo2riDMNEyGnLJT1afslW3CsgBGqKe/4nYKl3rtGOO4Bk
 3GoZroBad4KQuzAJHmUdB8K9mryt1C5+iHsd+fqUG3u91d0J7AzTB8wYyCPqqcvPY4W9Pb
 kWAzKq0IZ8zX08Gc4SgS3sJBg/8i4ws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661950746;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Rmbez77FS5Hvfp/JMOfp2c+xbsce3BCdyA7QzrOhDrY=;
 b=9v6UoH1UCeWuoePVCJ0FsRJWZ/h8X93itaS6kQgC+EooaVQrFAWftjJmDb4PCMMNVN++qM
 7gacPJvv+ymUckBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC25113A7C;
 Wed, 31 Aug 2022 12:59:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u90cMRpbD2NOKgAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 31 Aug 2022 12:59:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: usb-audio: Inform the delayed registration more
 properly
Date: Wed, 31 Aug 2022 14:59:00 +0200
Message-Id: <20220831125901.4660-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

The info message that was added in the commit a4aad5636c72 ("ALSA:
usb-audio: Inform devices that need delayed registration") is actually
useful to know the need for the delayed registration.  However, it
turned out that this doesn't catch the all cases; namely, this warned
only when a PCM stream is attached onto the existing PCM instance, but
it doesn't count for a newly created PCM instance.  This made
confusion as if there were no further delayed registration.

This patch moves the check to the code path for either adding a stream
or creating a PCM instance.  Also, make it simpler by checking the
card->registered flag instead of querying each snd_device state.

Fixes: a4aad5636c72 ("ALSA: usb-audio: Inform devices that need delayed registration")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216082
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index ceb93d798182..40b7821c6c99 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -495,6 +495,10 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 			return 0;
 		}
 	}
+
+	if (chip->card->registered)
+		chip->need_delayed_register = true;
+
 	/* look for an empty stream */
 	list_for_each_entry(as, &chip->pcm_list, list) {
 		if (as->fmt_type != fp->fmt_type)
@@ -502,9 +506,6 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 		subs = &as->substream[stream];
 		if (subs->ep_num)
 			continue;
-		if (snd_device_get_state(chip->card, as->pcm) !=
-		    SNDRV_DEV_BUILD)
-			chip->need_delayed_register = true;
 		err = snd_pcm_new_stream(as->pcm, stream, 1);
 		if (err < 0)
 			return err;
-- 
2.35.3

