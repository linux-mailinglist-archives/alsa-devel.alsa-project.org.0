Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE16209D0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 07:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693B9823;
	Tue,  8 Nov 2022 07:58:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693B9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667890774;
	bh=KHwuglVIPL0hUQqhAlALlI5GWYkxwsuqyIMDbYwLHlI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjAZfpTZMEVDY4P3rTCC0A/KBiPSnEQJk31G8ljabVgzVBrUamG58zvAbCgkqx2eY
	 dDvqMlrN8ybCDhL9V/nPQG+9xzz5wpPxJPZBu7tq1bkmqr88+GQ2wRfUNM4xXp6paT
	 nrWemg3PHgoZJLbdYqp5BUqbhqPfjJ2SmwbaGcyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D090F8016A;
	Tue,  8 Nov 2022 07:58:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57233F800EC; Tue,  8 Nov 2022 07:58:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBBD2F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 07:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBBD2F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cS+bpBaf"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="2A2Crxuh"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26D61224D7;
 Tue,  8 Nov 2022 06:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667890709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jP7zwB/DColcGU0PKlcTxe+1ltCEzhLkseKJZ0grZE0=;
 b=cS+bpBafOXKR1NOkTkfNADMzOsmtolAoFUhoncwlGJ2UDwDwGvijVj16UtGDVVwwvVcrRb
 35upw+QAuxcjmnKfHGGr+jeqwR+WifiFMC7DqJN4SPPxLKnvgzEbX54wkwoZ+Dn+UBxt/x
 8keXhPYrSkF94dFZrqPjzls9ykDjesg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667890709;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jP7zwB/DColcGU0PKlcTxe+1ltCEzhLkseKJZ0grZE0=;
 b=2A2CrxuhEsFz3bFVMSg4pvBH4pEb4J/ZIeE710MC6aKimKEYQgICxIGUroM2vXOdP12rkJ
 tEYmRIoM0CQkGYCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BEE7139F1;
 Tue,  8 Nov 2022 06:58:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wLQkAhX+aWO0IQAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 08 Nov 2022 06:58:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: usb-audio: Remove redundant workaround for Roland
 quirk
Date: Tue,  8 Nov 2022 07:58:24 +0100
Message-Id: <20221108065824.14418-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221108065824.14418-1-tiwai@suse.de>
References: <20221108065824.14418-1-tiwai@suse.de>
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

The recent fix for the delayed card registration made the current
workaround for QUIRK_AUTODETECT superfluous, since the card
registration itself is delayed until the last interface probe.

This patch drops the redundant workaround in
create_autodetect_quirks() for simplification.

Fixes: 39efc9c8a973 ("ALSA: usb-audio: Fix last interface check for registration")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1205111
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 44 +++-----------------------------------------
 1 file changed, 3 insertions(+), 41 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index eadac586bcc8..2dd19a5c3026 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -376,7 +376,8 @@ static int create_auto_midi_quirk(struct snd_usb_audio *chip,
 
 static int create_autodetect_quirk(struct snd_usb_audio *chip,
 				   struct usb_interface *iface,
-				   struct usb_driver *driver)
+				   struct usb_driver *driver,
+				   const struct snd_usb_audio_quirk *quirk)
 {
 	int err;
 
@@ -386,45 +387,6 @@ static int create_autodetect_quirk(struct snd_usb_audio *chip,
 	return err;
 }
 
-static int create_autodetect_quirks(struct snd_usb_audio *chip,
-				    struct usb_interface *iface,
-				    struct usb_driver *driver,
-				    const struct snd_usb_audio_quirk *quirk)
-{
-	int probed_ifnum = get_iface_desc(iface->altsetting)->bInterfaceNumber;
-	int ifcount, ifnum, err;
-
-	err = create_autodetect_quirk(chip, iface, driver);
-	if (err < 0)
-		return err;
-
-	/*
-	 * ALSA PCM playback/capture devices cannot be registered in two steps,
-	 * so we have to claim the other corresponding interface here.
-	 */
-	ifcount = chip->dev->actconfig->desc.bNumInterfaces;
-	for (ifnum = 0; ifnum < ifcount; ifnum++) {
-		if (ifnum == probed_ifnum || quirk->ifnum >= 0)
-			continue;
-		iface = usb_ifnum_to_if(chip->dev, ifnum);
-		if (!iface ||
-		    usb_interface_claimed(iface) ||
-		    get_iface_desc(iface->altsetting)->bInterfaceClass !=
-							USB_CLASS_VENDOR_SPEC)
-			continue;
-
-		err = create_autodetect_quirk(chip, iface, driver);
-		if (err >= 0) {
-			err = usb_driver_claim_interface(driver, iface,
-							 USB_AUDIO_IFACE_UNUSED);
-			if (err < 0)
-				return err;
-		}
-	}
-
-	return 0;
-}
-
 /*
  * Create a stream for an Edirol UA-700/UA-25/UA-4FX interface.  
  * The only way to detect the sample rate is by looking at wMaxPacketSize.
@@ -554,7 +516,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 	static const quirk_func_t quirk_funcs[] = {
 		[QUIRK_IGNORE_INTERFACE] = ignore_interface_quirk,
 		[QUIRK_COMPOSITE] = create_composite_quirk,
-		[QUIRK_AUTODETECT] = create_autodetect_quirks,
+		[QUIRK_AUTODETECT] = create_autodetect_quirk,
 		[QUIRK_MIDI_STANDARD_INTERFACE] = create_any_midi_quirk,
 		[QUIRK_MIDI_FIXED_ENDPOINT] = create_any_midi_quirk,
 		[QUIRK_MIDI_YAMAHA] = create_any_midi_quirk,
-- 
2.35.3

