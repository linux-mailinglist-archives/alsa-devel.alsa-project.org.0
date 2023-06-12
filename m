Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B201372B9FD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068DE820;
	Mon, 12 Jun 2023 10:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068DE820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557668;
	bh=FWfi8Q5DaAgtEiXBVfaD1uVx92XqNAe/L2lcwUpO5QY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lpb2Vzb0xVpDuQ4qiVXQB+E7RFSnfnx8l0C5iS80Pn6LQzyYwSVb20CmKAx96h9o4
	 aEAF92CSuULS+vR8btXo9N6c9le0gt2qmmK4apUQju41jTx9I4xewGT+9d4pEzWX3K
	 KIvq1zbcIu3jkfsionuuL+uxOEI/ZXWMEZzV2FVg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4268F805E0; Mon, 12 Jun 2023 10:11:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9DB3F805CA;
	Mon, 12 Jun 2023 10:11:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3101AF805B5; Mon, 12 Jun 2023 10:11:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E508FF80544
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E508FF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZwWy25Wi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VjkFupeZ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5874722859;
	Mon, 12 Jun 2023 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686557466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lmTcnQvPXfOqzH45/oFPrEnvSagw7pp+VGlRZVQxy0=;
	b=ZwWy25Wi7mWIYGktowrhQBkUdfrGcfYdO6CuIVy7IatV9PpS1CvY5c4U5rnFzuFXb0RaS7
	BMcxg1DGDDHboKkbsa1qiDZhw1GXSKUxaA3oa5eEukGvJeyQFXxdWu+BgdGGA1JHhBI9Ja
	lP5RFfQvebtGQJ6jdEwkgHEWX3grepc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686557466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lmTcnQvPXfOqzH45/oFPrEnvSagw7pp+VGlRZVQxy0=;
	b=VjkFupeZ3cvFKjx73fDBh5DudaA5oWnZMdhX46kxI8ixgSVGMnU5KTPEudm6tF2lq5Y9yk
	4w53TQ3FuI/vojAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37309138EC;
	Mon, 12 Jun 2023 08:11:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sKe0DBrThmSLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:11:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] ALSA: usb-audio: Parse UMP Endpoint and Function Blocks
 at first
Date: Mon, 12 Jun 2023 10:10:47 +0200
Message-Id: <20230612081054.17200-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081054.17200-1-tiwai@suse.de>
References: <20230612081054.17200-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PIULEF4BDYDP4ZBV5PUOXA4DUNX67OL6
X-Message-ID-Hash: PIULEF4BDYDP4ZBV5PUOXA4DUNX67OL6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PIULEF4BDYDP4ZBV5PUOXA4DUNX67OL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Try to parse the UMP Endpoint and UMP Function Blocks for building the
topology at first.  Only when those are missing (e.g. on an older USB
MIDI 2.0 spec or a unidirectional endpoint), the driver still creates
blocks based on USB group terminal block information as fallback.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 341783418a6a..fad094e15999 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -80,6 +80,7 @@ struct snd_usb_midi2_ump {
 	struct snd_usb_midi2_endpoint *eps[2];	/* USB MIDI endpoints */
 	int index;				/* rawmidi device index */
 	unsigned char usb_block_id;		/* USB GTB id used for finding a pair */
+	bool ump_parsed;			/* Parsed UMP 1.1 EP/FB info*/
 	struct list_head list;		/* list to umidi->rawmidi_list */
 };
 
@@ -786,6 +787,31 @@ static int find_matching_ep_partner(struct snd_usb_midi2_interface *umidi,
 	return 0;
 }
 
+/* Call UMP helper to parse UMP endpoints;
+ * this needs to be called after starting the input streams for bi-directional
+ * communications
+ */
+static int parse_ump_endpoints(struct snd_usb_midi2_interface *umidi)
+{
+	struct snd_usb_midi2_ump *rmidi;
+	int err;
+
+	list_for_each_entry(rmidi, &umidi->rawmidi_list, list) {
+		if (!rmidi->ump ||
+		    !(rmidi->ump->core.info_flags & SNDRV_RAWMIDI_INFO_DUPLEX))
+			continue;
+		err = snd_ump_parse_endpoint(rmidi->ump);
+		if (!err) {
+			rmidi->ump_parsed = true;
+		} else {
+			if (err == -ENOMEM)
+				return err;
+			/* fall back to GTB later */
+		}
+	}
+	return 0;
+}
+
 /* create a UMP block from a GTB entry */
 static int create_gtb_block(struct snd_usb_midi2_ump *rmidi, int dir, int blk)
 {
@@ -856,7 +882,7 @@ static int create_blocks_from_gtb(struct snd_usb_midi2_interface *umidi)
 		if (!rmidi->ump)
 			continue;
 		/* Blocks have been already created? */
-		if (rmidi->ump->info.num_blocks)
+		if (rmidi->ump_parsed || rmidi->ump->info.num_blocks)
 			continue;
 		/* loop over GTBs */
 		for (dir = 0; dir < 2; dir++) {
@@ -1110,6 +1136,12 @@ int snd_usb_midi_v2_create(struct snd_usb_audio *chip,
 		goto error;
 	}
 
+	err = parse_ump_endpoints(umidi);
+	if (err < 0) {
+		usb_audio_err(chip, "Failed to parse UMP endpoint\n");
+		goto error;
+	}
+
 	err = create_blocks_from_gtb(umidi);
 	if (err < 0) {
 		usb_audio_err(chip, "Failed to create GTB blocks\n");
-- 
2.35.3

