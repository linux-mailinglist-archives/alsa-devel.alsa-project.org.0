Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101870D641
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 09:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9741FA;
	Tue, 23 May 2023 09:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9741FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828625;
	bh=37kXzkuCSeYTjflL2hgT83ZiSCMTuw5tib26JW7iJDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XQ/CqeexBDC/k9ca4/tYp/O4Lfwh5C65yYQeeJAEOlG61U4DR40FOPH5DRLfhHICa
	 2R/7h3lgjfFZyhFQ9ECKZAWeM6te1KCtLLeVgjDxAygpHb400GOa4RZdeT4psHv6Sg
	 3vuIXuYsnKo3TKehwxKzjpngm0YLhsgaEUbd5c5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C21F3F805F2; Tue, 23 May 2023 09:54:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64200F805EE;
	Tue, 23 May 2023 09:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D27F805D2; Tue, 23 May 2023 09:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DBC6F80549
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DBC6F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xJlS6E9i;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tA9lxT/A
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C53762191A;
	Tue, 23 May 2023 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHrx6V+uewqzX9UqFfIqqGA6/p4XBbhXfx4OFs0RTCU=;
	b=xJlS6E9iJ2EFF+DymKFeMpQ084cBqDmConz1kdV5Oas2qUnII0Td6kqFhGtxhT3q/nIEiA
	7WEBLg1sbVGSTQGaA8kChbcSa5XUk+R6g/q6ALltoeQC8lh4GuKbFgXiPsyk9DmeEJPZJw
	E5mmWBD9QxU+IV3Pa1DWkEhYNLKkVlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHrx6V+uewqzX9UqFfIqqGA6/p4XBbhXfx4OFs0RTCU=;
	b=tA9lxT/AZ2PkzccDo0UI9LUOktfO0xARmOgHdxDdUqhMB7w+OR7HwmCgcric2OLX4uy7fE
	e72T7+Pt15xOh7Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D04313588;
	Tue, 23 May 2023 07:54:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KAROIR1xbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/37] ALSA: usb-audio: Get UMP EP name string from USB
 interface
Date: Tue, 23 May 2023 09:53:31 +0200
Message-Id: <20230523075358.9672-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q22BNHMAFPG357VF3F7CY2JAQKI6I5RI
X-Message-ID-Hash: Q22BNHMAFPG357VF3F7CY2JAQKI6I5RI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q22BNHMAFPG357VF3F7CY2JAQKI6I5RI/>
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

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
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

