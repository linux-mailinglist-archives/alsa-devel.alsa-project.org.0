Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD7A8567C0
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 16:32:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A591F84D;
	Thu, 15 Feb 2024 16:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A591F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708011164;
	bh=1ySeRU52Fjc5T1RYSYKT3tNkryKHBSjSVzQ984bX1cs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tqO0irpgiPKwQv9UNZ3cEh63FqJHCZ/cQXEIgm4AsmrFtZEpwkM+JcqLayxylOuNV
	 ZdUDKfa0cavhUuT7ccobLvj4dVPDrDz+v1HTJ8uzWSEyDxU4RimAF3UqGHPN97OrrN
	 VLz3xDVaIxjUjU1tNwedbk+kOpDI/hKL/3P6r/hU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 805A8F805AE; Thu, 15 Feb 2024 16:32:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A140FF80578;
	Thu, 15 Feb 2024 16:32:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A359F80238; Thu, 15 Feb 2024 16:32:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8175F800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 16:31:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8175F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pp8CSGXG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=awWss7zB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=pp8CSGXG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=awWss7zB
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6A8F21F67;
	Thu, 15 Feb 2024 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708011109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yYCh2KtG5vupXa7aKBQTHEBXrbf/7kx/IpWbesSdXjw=;
	b=pp8CSGXGbQUGWpI8o2dW+5QEtsG2xwqy8JJnOqUU8zmDfZqv/CcOIz7Saj+a1B7D5088tp
	l0qNLh3LLayVzK9foZBSB+cyPHBrcuuoEaW8G33UJFe6SwPY/VdF3AgHNZbgSIC0HfuAnl
	IGfC8pMIfWL57RJxrN5cnJKhfADfMEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708011109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yYCh2KtG5vupXa7aKBQTHEBXrbf/7kx/IpWbesSdXjw=;
	b=awWss7zB9ASEUDxpp6Nr3eiSTjQKMaNpji9+/ZMLV7MIYWc/18JLaZebYoQZJA0ozQWDrs
	/XscDbImmUx67pDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708011109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yYCh2KtG5vupXa7aKBQTHEBXrbf/7kx/IpWbesSdXjw=;
	b=pp8CSGXGbQUGWpI8o2dW+5QEtsG2xwqy8JJnOqUU8zmDfZqv/CcOIz7Saj+a1B7D5088tp
	l0qNLh3LLayVzK9foZBSB+cyPHBrcuuoEaW8G33UJFe6SwPY/VdF3AgHNZbgSIC0HfuAnl
	IGfC8pMIfWL57RJxrN5cnJKhfADfMEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708011109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yYCh2KtG5vupXa7aKBQTHEBXrbf/7kx/IpWbesSdXjw=;
	b=awWss7zB9ASEUDxpp6Nr3eiSTjQKMaNpji9+/ZMLV7MIYWc/18JLaZebYoQZJA0ozQWDrs
	/XscDbImmUx67pDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B11F513A53;
	Thu, 15 Feb 2024 15:31:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1GiaKWUuzmXGdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Feb 2024 15:31:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: More relaxed check of MIDI jack names
Date: Thu, 15 Feb 2024 16:31:44 +0100
Message-Id: <20240215153144.26047-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pp8CSGXG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=awWss7zB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.49 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 R_MISSING_CHARSET(2.50)[];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[23.61%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: D6A8F21F67
Message-ID-Hash: KYPHQTFHSV4BJVZS7TLCBK22NKQJOG5M
X-Message-ID-Hash: KYPHQTFHSV4BJVZS7TLCBK22NKQJOG5M
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYPHQTFHSV4BJVZS7TLCBK22NKQJOG5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The USB audio driver tries to retrieve MIDI jack name strings that can
be used for rawmidi substream names and sequencer port names, but its
checking is too strict: often the firmware provides the jack info for
unexpected directions, and then we miss the info although it's
present.

In this patch, the code to extract the jack info is changed to allow
both in and out directions in a single loop.  That is, the former two
functions to obtain the descriptor pointers for jack in and out are
changed to a single function that returns iJack of the corresponding
jack ID, no matter which direction is used.  It's a code
simplification at the same time as well as the fix.

Fixes: eb596e0fd13c ("ALSA: usb-audio: generate midi streaming substream names from jack names")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 77 +++++++++++++++++-------------------------------
 1 file changed, 27 insertions(+), 50 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 6b0993258e03..c1f2e5a03de9 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1742,50 +1742,44 @@ static void snd_usbmidi_get_port_info(struct snd_rawmidi *rmidi, int number,
 	}
 }
 
-static struct usb_midi_in_jack_descriptor *find_usb_in_jack_descriptor(
-					struct usb_host_interface *hostif, uint8_t jack_id)
+/* return iJack for the corresponding jackID */
+static int find_usb_ijack(struct usb_host_interface *hostif, uint8_t jack_id)
 {
 	unsigned char *extra = hostif->extra;
 	int extralen = hostif->extralen;
+	struct usb_descriptor_header *h;
+	struct usb_midi_out_jack_descriptor *outjd;
+	struct usb_midi_in_jack_descriptor *injd;
+	size_t sz;
 
 	while (extralen > 4) {
-		struct usb_midi_in_jack_descriptor *injd =
-				(struct usb_midi_in_jack_descriptor *)extra;
+		h = (struct usb_descriptor_header *)extra;
+		if (h->bDescriptorType != USB_DT_CS_INTERFACE)
+			goto next;
 
-		if (injd->bLength >= sizeof(*injd) &&
-		    injd->bDescriptorType == USB_DT_CS_INTERFACE &&
-		    injd->bDescriptorSubtype == UAC_MIDI_IN_JACK &&
-				injd->bJackID == jack_id)
-			return injd;
-		if (!extra[0])
-			break;
-		extralen -= extra[0];
-		extra += extra[0];
-	}
-	return NULL;
-}
-
-static struct usb_midi_out_jack_descriptor *find_usb_out_jack_descriptor(
-					struct usb_host_interface *hostif, uint8_t jack_id)
-{
-	unsigned char *extra = hostif->extra;
-	int extralen = hostif->extralen;
-
-	while (extralen > 4) {
-		struct usb_midi_out_jack_descriptor *outjd =
-				(struct usb_midi_out_jack_descriptor *)extra;
-
-		if (outjd->bLength >= sizeof(*outjd) &&
-		    outjd->bDescriptorType == USB_DT_CS_INTERFACE &&
+		outjd = (struct usb_midi_out_jack_descriptor *)h;
+		if (h->bLength >= sizeof(*outjd) &&
 		    outjd->bDescriptorSubtype == UAC_MIDI_OUT_JACK &&
-				outjd->bJackID == jack_id)
-			return outjd;
+		    outjd->bJackID == jack_id) {
+			sz = USB_DT_MIDI_OUT_SIZE(outjd->bNrInputPins);
+			if (outjd->bLength < sz)
+				goto next;
+			return *(extra + sz - 1);
+		}
+
+		injd = (struct usb_midi_in_jack_descriptor *)h;
+		if (injd->bLength >= sizeof(*injd) &&
+		    injd->bDescriptorSubtype == UAC_MIDI_IN_JACK &&
+		    injd->bJackID == jack_id)
+			return injd->iJack;
+
+next:
 		if (!extra[0])
 			break;
 		extralen -= extra[0];
 		extra += extra[0];
 	}
-	return NULL;
+	return 0;
 }
 
 static void snd_usbmidi_init_substream(struct snd_usb_midi *umidi,
@@ -1796,13 +1790,10 @@ static void snd_usbmidi_init_substream(struct snd_usb_midi *umidi,
 	const char *name_format;
 	struct usb_interface *intf;
 	struct usb_host_interface *hostif;
-	struct usb_midi_in_jack_descriptor *injd;
-	struct usb_midi_out_jack_descriptor *outjd;
 	uint8_t jack_name_buf[32];
 	uint8_t *default_jack_name = "MIDI";
 	uint8_t *jack_name = default_jack_name;
 	uint8_t iJack;
-	size_t sz;
 	int res;
 
 	struct snd_rawmidi_substream *substream =
@@ -1816,21 +1807,7 @@ static void snd_usbmidi_init_substream(struct snd_usb_midi *umidi,
 	intf = umidi->iface;
 	if (intf && jack_id >= 0) {
 		hostif = intf->cur_altsetting;
-		iJack = 0;
-		if (stream != SNDRV_RAWMIDI_STREAM_OUTPUT) {
-			/* in jacks connect to outs */
-			outjd = find_usb_out_jack_descriptor(hostif, jack_id);
-			if (outjd) {
-				sz = USB_DT_MIDI_OUT_SIZE(outjd->bNrInputPins);
-				if (outjd->bLength >= sz)
-					iJack = *(((uint8_t *) outjd) + sz - sizeof(uint8_t));
-			}
-		} else {
-			/* and out jacks connect to ins */
-			injd = find_usb_in_jack_descriptor(hostif, jack_id);
-			if (injd)
-				iJack = injd->iJack;
-		}
+		iJack = find_usb_ijack(hostif, jack_id);
 		if (iJack != 0) {
 			res = usb_string(umidi->dev, iJack, jack_name_buf,
 			  ARRAY_SIZE(jack_name_buf));
-- 
2.35.3

