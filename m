Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9105E709342
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A84FA827;
	Fri, 19 May 2023 11:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A84FA827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488810;
	bh=Sf9FvMiP8L6tWbFHNml8oAJ2F/TjV23LaU7q1tlrWyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j2S2kqx0zHsCrMliujLWH52ptZtuFSToNlG9MqH3wRPH7e6QQcx2G1euewNY3YET0
	 PUhSF2AjVEhYWhvRuUkF/7yigooCVfK9y/0ARMUCDulvhVXRhhWZK0iaf7l+LWWgD9
	 syBYOqSPie70D90gTrvQhmgcDpdzFdVxSSh/pJuM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A008FF805B2; Fri, 19 May 2023 11:31:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF7CF805B2;
	Fri, 19 May 2023 11:31:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C2AFF8057C; Fri, 19 May 2023 11:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4855F80431
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4855F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=010Z4dR8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vfTrElv0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 79970222AD;
	Fri, 19 May 2023 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ll/2d540Z78VxthKEG5YG2svlhy25Sgr67hqVjDbpbw=;
	b=010Z4dR8alfZjOeQTL3TpeVs8UxbGqiczktAQv9vxE/wuR1f2mR7QvYIC4Pm7XlYmyVjsa
	jSl3Dll+X3FRuAkg7hMZ5TcdGM2SpoooVQjP64MWnNVukrSp6W8wVIUcYFTw3tgIszhTT3
	zJneURHI5qOxZPoPaaOBIfzD8ZC7ils=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ll/2d540Z78VxthKEG5YG2svlhy25Sgr67hqVjDbpbw=;
	b=vfTrElv0WCZ1aZkS1CWiKEuSq+NdenBgMfwZiU6oYfREKIL6KNSy97gRNGOGDYmFO0onWk
	LEfB+PKVS1TFOMAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D92613A12;
	Fri, 19 May 2023 09:31:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YPUMFvVBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 06/36] ALSA: usb-audio: Manage number of rawmidis globally
Date: Fri, 19 May 2023 11:30:44 +0200
Message-Id: <20230519093114.28813-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YLQNYKGILUHBGJ7KJTC7MHKIWEFWOYYP
X-Message-ID-Hash: YLQNYKGILUHBGJ7KJTC7MHKIWEFWOYYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YLQNYKGILUHBGJ7KJTC7MHKIWEFWOYYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We're going to create rawmidi objects for MIDI 2.0 in a different code
from the current code for USB-MIDI 1.0.  As a preliminary work, this
patch adds the number of rawmidi objects to keep globally in a
USB-audio card instance, so that it can be referred from both MIDI 1.0
and 2.0 code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     | 5 +++--
 sound/usb/midi.c     | 7 ++++++-
 sound/usb/midi.h     | 5 +++--
 sound/usb/quirks.c   | 5 +++--
 sound/usb/usbaudio.h | 1 +
 5 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index f6e99ced8068..bd051e634516 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -179,8 +179,9 @@ static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int int
 	     altsd->bInterfaceClass == USB_CLASS_VENDOR_SPEC) &&
 	    altsd->bInterfaceSubClass == USB_SUBCLASS_MIDISTREAMING) {
 		int err = __snd_usbmidi_create(chip->card, iface,
-					     &chip->midi_list, NULL,
-					     chip->usb_id);
+					       &chip->midi_list, NULL,
+					       chip->usb_id,
+					       &chip->num_rawmidis);
 		if (err < 0) {
 			dev_err(&dev->dev,
 				"%u:%d: cannot create sequencer device\n",
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 2839f6b6f09b..6b0993258e03 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -2461,7 +2461,8 @@ int __snd_usbmidi_create(struct snd_card *card,
 			 struct usb_interface *iface,
 			 struct list_head *midi_list,
 			 const struct snd_usb_audio_quirk *quirk,
-			 unsigned int usb_id)
+			 unsigned int usb_id,
+			 unsigned int *num_rawmidis)
 {
 	struct snd_usb_midi *umidi;
 	struct snd_usb_midi_endpoint_info endpoints[MIDI_MAX_ENDPOINTS];
@@ -2476,6 +2477,8 @@ int __snd_usbmidi_create(struct snd_card *card,
 	umidi->iface = iface;
 	umidi->quirk = quirk;
 	umidi->usb_protocol_ops = &snd_usbmidi_standard_ops;
+	if (num_rawmidis)
+		umidi->next_midi_device = *num_rawmidis;
 	spin_lock_init(&umidi->disc_lock);
 	init_rwsem(&umidi->disc_rwsem);
 	mutex_init(&umidi->mutex);
@@ -2595,6 +2598,8 @@ int __snd_usbmidi_create(struct snd_card *card,
 	usb_autopm_get_interface_no_resume(umidi->iface);
 
 	list_add_tail(&umidi->list, midi_list);
+	if (num_rawmidis)
+		*num_rawmidis = umidi->next_midi_device;
 	return 0;
 
 free_midi:
diff --git a/sound/usb/midi.h b/sound/usb/midi.h
index 3f153195c841..2100f1486b03 100644
--- a/sound/usb/midi.h
+++ b/sound/usb/midi.h
@@ -46,14 +46,15 @@ int __snd_usbmidi_create(struct snd_card *card,
 			 struct usb_interface *iface,
 			 struct list_head *midi_list,
 			 const struct snd_usb_audio_quirk *quirk,
-			 unsigned int usb_id);
+			 unsigned int usb_id,
+			 unsigned int *num_rawmidis);
 
 static inline int snd_usbmidi_create(struct snd_card *card,
 		       struct usb_interface *iface,
 		       struct list_head *midi_list,
 		       const struct snd_usb_audio_quirk *quirk)
 {
-	return __snd_usbmidi_create(card, iface, midi_list, quirk, 0);
+	return __snd_usbmidi_create(card, iface, midi_list, quirk, 0, NULL);
 }
 
 void snd_usbmidi_input_stop(struct list_head *p);
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3ecd1ba7fd4b..1cabe4cc019f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -436,8 +436,9 @@ static int create_uaxx_quirk(struct snd_usb_audio *chip,
 			chip->usb_id == USB_ID(0x0582, 0x002b)
 			? &ua700_quirk : &uaxx_quirk;
 		return __snd_usbmidi_create(chip->card, iface,
-					  &chip->midi_list, quirk,
-					  chip->usb_id);
+					    &chip->midi_list, quirk,
+					    chip->usb_id,
+					    &chip->num_rawmidis);
 	}
 
 	if (altsd->bNumEndpoints != 1)
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 38a85b2c9a73..b1fa0a377866 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -49,6 +49,7 @@ struct snd_usb_audio {
 	struct list_head clock_ref_list; /* list of clock refcounts */
 	int pcm_devs;
 
+	unsigned int num_rawmidis;	/* number of created rawmidi devices */
 	struct list_head midi_list;	/* list of midi interfaces */
 
 	struct list_head mixer_list;	/* list of mixer interfaces */
-- 
2.35.3

