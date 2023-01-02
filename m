Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699765B598
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 18:09:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF3A5A31D;
	Mon,  2 Jan 2023 18:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF3A5A31D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672679378;
	bh=nDVkFd3S9txiBjSAaxwHTsCiCBtaoJNL45xodtmRPeI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iAEXbDknl58Q7vjFd4MkP24wzJ3h0Gu+T/AH8wXMmWk2+u+AIHE5n8ZlsxV7AOOCX
	 ne4fzd9VLh7NkvZ9QCYqA9UUhNUwbgcdoc2T4GugHMZa5ZhQrrZki8XmVH/sn1VIXW
	 H9NLeDHWBFgFhBMt//kI57l2ZaLBV1R96s/lXgXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D7BF80508;
	Mon,  2 Jan 2023 18:08:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CF18F80240; Mon,  2 Jan 2023 18:08:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC708F8023A
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 18:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC708F8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=cmkV04Eh; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BoWJcNFN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F2EA934288;
 Mon,  2 Jan 2023 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672679286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYqA0bjQ1nCJWrqNI71WWvqDhpqmzbphtN/rXj9/XJU=;
 b=cmkV04EhUO+7Jzr+6NijknHctcjDSLZASox8DT+kg+ehu0xlVX4WQUAaqH3Z2orQbtEAZ9
 bjTPNLdBXSz9DIesuzwsRv4/2g2J1QoTsyjxrddfVWOxYs+88Bc0pgJ/zgWJZaqt9m9KvZ
 R6+CpdyP9y+XXAdnbtKu2D1aXkfHOu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672679286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYqA0bjQ1nCJWrqNI71WWvqDhpqmzbphtN/rXj9/XJU=;
 b=BoWJcNFNPVycCFaYo60kbXdln8uzcjABYRwzDWLXPJ9CiIfgj8bdRLmoDMhoCH+5t3FhEp
 tvrxRP7byZpRTVCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB41413427;
 Mon,  2 Jan 2023 17:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UGH2NHYPs2ODGAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 02 Jan 2023 17:08:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: usb-audio: Relax hw constraints for implicit fb sync
Date: Mon,  2 Jan 2023 18:07:58 +0100
Message-Id: <20230102170759.29610-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230102170759.29610-1-tiwai@suse.de>
References: <20230102170759.29610-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

The fix commit the commit e4ea77f8e53f ("ALSA: usb-audio: Always apply
the hw constraints for implicit fb sync") tried to address the bug
where an incorrect PCM parameter is chosen when two (implicit fb)
streams are set up at the same time.  This change had, however, some
side effect: once when the sync endpoint is chosen and set up, this
restriction is applied at the next hw params unless it's freed via hw
free explicitly.

This patch is a workaround for the problem by relaxing the hw
constraints a bit for the implicit fb sync.  We still keep applying
the hw constraints for implicit fb sync, but only when the matching
sync EP is being used by other streams.

Fixes: e4ea77f8e53f ("ALSA: usb-audio: Always apply the hw constraints for implicit fb sync")
Link: https://lore.kernel.org/r/4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 7fc95ae9b2f0..2fd4ecc1b25a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -937,8 +937,13 @@ get_sync_ep_from_substream(struct snd_usb_substream *subs)
 			continue;
 		/* for the implicit fb, check the sync ep as well */
 		ep = snd_usb_get_endpoint(chip, fp->sync_ep);
-		if (ep && ep->cur_audiofmt)
-			return ep;
+		if (ep && ep->cur_audiofmt) {
+			/* ditto, if the sync (data) ep is used by others,
+			 * this stream is restricted by the sync ep
+			 */
+			if (ep != subs->sync_endpoint || ep->opened > 1)
+				return ep;
+		}
 	}
 	return NULL;
 }
-- 
2.35.3

