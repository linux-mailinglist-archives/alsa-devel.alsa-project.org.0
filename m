Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3370709395
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E89EA82B;
	Fri, 19 May 2023 11:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E89EA82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489074;
	bh=hwWpLY+ySh049kEscvOEgQjTr/nCOe5KKEbi5rFNORA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nec/75vqVb24t54VjQIM7fpE1ybSaI8VEBCJZOhV13C1jP4fvYV+1j2aOVl+ZO+2Z
	 twe5XlLvnsNZ/s8I/zXO6KXMh0VwopSgkEOX/l8UKjejoGAzmvLQk1kn15bJWcFIzK
	 2R7+YaNYZXGPW9+hHwtB0qzE4q3MM8NoGc6iC5v0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D405DF80672; Fri, 19 May 2023 11:32:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F3BF8065A;
	Fri, 19 May 2023 11:32:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E6CF80605; Fri, 19 May 2023 11:32:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 95DC8F80542
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DC8F80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jYSAPYfU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dwGJw1/q
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6CE2222245;
	Fri, 19 May 2023 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488695;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/vFcVb0n9Ba9H2O0vv9VgnhDswKpE1tKkK+15sbcO5g=;
	b=jYSAPYfU5amkk6Ym73ZUerWEceuFVsVcQDcr4ldsl06BXKXjqa8pGfDTWdENxVbz+J7Nwo
	O7KC+ASVreEBTRMw0MrgcVJAErEaFfXBf+SGMk0pzqJV/CNudvsC11raS9DlGWJk27pSXB
	5vVDh9IzKJ2BV7rr554yR6XvPQh7IEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488695;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/vFcVb0n9Ba9H2O0vv9VgnhDswKpE1tKkK+15sbcO5g=;
	b=dwGJw1/q1m548OOzy6hIb0bHt2zR2+QF+hxjZUHsRgyemliMSXvueL6NtAbHeoGhzrzExr
	CiEy1BlHtHXfcrBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CE1213A12;
	Fri, 19 May 2023 09:31:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iAnpEfdBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 09/36] ALSA: usb-audio: Get UMP EP name string from USB
 interface
Date: Fri, 19 May 2023 11:30:47 +0200
Message-Id: <20230519093114.28813-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4U3YWAAAL5Z2CM5SU3TYBZYHVPUGUWJL
X-Message-ID-Hash: 4U3YWAAAL5Z2CM5SU3TYBZYHVPUGUWJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4U3YWAAAL5Z2CM5SU3TYBZYHVPUGUWJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

USB descriptor may provide a nicer name for USB interface, and we may
take it as the UMP Endpoint name.  The UMP EP name is copied as the
rawmidi name, too.

Also, fill the UMP block product_id field from the iSerialNumber
string of the USB device descriptor as a recommended unique id, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 7b4cfbaf2ec0..2ac3f96216bc 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -892,15 +892,39 @@ static int set_altset(struct snd_usb_midi2_interface *umidi)
 				 umidi->hostif->desc.bAlternateSetting);
 }
 
+/* fill UMP Endpoint name string from USB descriptor */
+static void fill_ump_ep_name(struct snd_ump_endpoint *ump,
+			     struct usb_device *dev, int id)
+{
+	usb_string(dev, id, ump->info.name, sizeof(ump->info.name));
+}
+
 /* fill the fallback name string for each rawmidi instance */
 static void set_fallback_rawmidi_names(struct snd_usb_midi2_interface *umidi)
 {
+	struct usb_device *dev = umidi->chip->dev;
 	struct snd_usb_midi2_ump *rmidi;
+	struct snd_ump_endpoint *ump;
 
 	list_for_each_entry(rmidi, &umidi->rawmidi_list, list) {
-		if (!*rmidi->ump->core.name)
-			sprintf(rmidi->ump->core.name, "USB MIDI %d",
-				rmidi->index);
+		ump = rmidi->ump;
+		/* fill UMP EP name from USB descriptors */
+		if (!*ump->info.name && umidi->hostif->desc.iInterface)
+			fill_ump_ep_name(ump, dev, umidi->hostif->desc.iInterface);
+		else if (!*ump->info.name && dev->descriptor.iProduct)
+			fill_ump_ep_name(ump, dev, dev->descriptor.iProduct);
+		/* fill fallback name */
+		if (!*ump->info.name)
+			sprintf(ump->info.name, "USB MIDI %d", rmidi->index);
+		/* copy as rawmidi name if not set */
+		if (!*ump->core.name)
+			strscpy(ump->core.name, ump->info.name,
+				sizeof(ump->core.name));
+		/* use serial number string as unique UMP product id */
+		if (!*ump->info.product_id && dev->descriptor.iSerialNumber)
+			usb_string(dev, dev->descriptor.iSerialNumber,
+				   ump->info.product_id,
+				   sizeof(ump->info.product_id));
 	}
 }
 
-- 
2.35.3

