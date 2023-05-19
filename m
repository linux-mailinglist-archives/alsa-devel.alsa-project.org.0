Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30370934E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E8E836;
	Fri, 19 May 2023 11:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E8E836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488912;
	bh=jnWNMjr14ZGO95FeurSsGiIHEd7hsSeE78R57LjrOVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eRsBuB4EiuxsuYuMAxEZde85Bxc4gWaF8/bVogZO9+fGYM8DekEWemTgCONBVm7vN
	 A4hqP5cW8GDLdyljZAV5fQzOrlNNQ83MYKesXYl2XjFkqCDkNt5eQs4g/H51hZbJY4
	 9X/uUrpj0VzAuC+h0eFd5yBkJCTR75Sk+oJ9+erA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F094F80603; Fri, 19 May 2023 11:32:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61F9EF80087;
	Fri, 19 May 2023 11:32:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB0B0F805EC; Fri, 19 May 2023 11:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03D89F80551
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D89F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bUmSJNI9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=O4m4h64B
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CED59222E4;
	Fri, 19 May 2023 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488696;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5RT2c9lIVsLaZopaBJ96F+nQa8/s3L/lEQ/NVtk+6gw=;
	b=bUmSJNI94dHP0xSLlfLo0Kiz0+uSvpHdhpERYv+7XjUsKDNVs9mHv56nHvupzj+Dg3NF79
	NIVD/13i6Dd/9YSrz05We96uYDixWskUMvuc2d7Ekfrrkr61x6Gu3KcX6xdQtXhQTGRm4q
	9znNevTpmSANZs/hQDIHTczqqaeyAn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5RT2c9lIVsLaZopaBJ96F+nQa8/s3L/lEQ/NVtk+6gw=;
	b=O4m4h64Becd7y1l+o+cAa/HRnPuR7aAp9xPbMNGBzmw5jMhI0FcgnAVneguxoNpKw/8Cn7
	bdZSKj9WEr1aC/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAAC313A12;
	Fri, 19 May 2023 09:31:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IODCKPhBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 11/36] ALSA: usb-audio: Create UMP blocks from USB MIDI GTBs
Date: Fri, 19 May 2023 11:30:49 +0200
Message-Id: <20230519093114.28813-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VWPPPNWTSP7X7ZCXXRX7FMKANEUKFR5Y
X-Message-ID-Hash: VWPPPNWTSP7X7ZCXXRX7FMKANEUKFR5Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWPPPNWTSP7X7ZCXXRX7FMKANEUKFR5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

USB MIDI spec defines the Group Terminal Blocks (GTB) that associate
multiple UMP Groups.  Those correspond to snd_ump_block entities in
ALSA UMP abstraction, and now we create those UMP Block objects for
each UMP Endpoint from the parsed GTB information.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 99 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 93 insertions(+), 6 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 790e4cd5d35c..886fd85fcd80 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -599,14 +599,8 @@ find_group_terminal_block(struct snd_usb_midi2_interface *umidi, int id)
 static int parse_group_terminal_block(struct snd_usb_midi2_ump *rmidi,
 				      const struct usb_ms20_gr_trm_block_descriptor *desc)
 {
-	struct snd_usb_audio *chip = rmidi->umidi->chip;
 	struct snd_ump_endpoint *ump = rmidi->ump;
 
-	usb_audio_dbg(chip,
-		      "GTB id %d: groups = %d / %d, type = %d\n",
-		      desc->bGrpTrmBlkID, desc->nGroupTrm, desc->nNumGroupTrm,
-		      desc->bGrpTrmBlkType);
-
 	/* set default protocol */
 	switch (desc->bMIDIProtocol) {
 	case USB_MS_MIDI_PROTO_1_0_64:
@@ -798,6 +792,93 @@ static int find_matching_ep_partner(struct snd_usb_midi2_interface *umidi,
 	return 0;
 }
 
+/* create a UMP block from a GTB entry */
+static int create_gtb_block(struct snd_usb_midi2_ump *rmidi, int dir, int blk)
+{
+	struct snd_usb_midi2_interface *umidi = rmidi->umidi;
+	const struct usb_ms20_gr_trm_block_descriptor *desc;
+	struct snd_ump_block *fb;
+	int type, err;
+
+	desc = find_group_terminal_block(umidi, blk);
+	if (!desc)
+		return 0;
+
+	usb_audio_dbg(umidi->chip,
+		      "GTB %d: type=%d, group=%d/%d, protocol=%d, in bw=%d, out bw=%d\n",
+		      blk, desc->bGrpTrmBlkType, desc->nGroupTrm,
+		      desc->nNumGroupTrm, desc->bMIDIProtocol,
+		      __le16_to_cpu(desc->wMaxInputBandwidth),
+		      __le16_to_cpu(desc->wMaxOutputBandwidth));
+
+	/* assign the direction */
+	switch (desc->bGrpTrmBlkType) {
+	case USB_MS_GR_TRM_BLOCK_TYPE_BIDIRECTIONAL:
+		type = SNDRV_UMP_DIR_BIDIRECTION;
+		break;
+	case USB_MS_GR_TRM_BLOCK_TYPE_INPUT_ONLY:
+		type = SNDRV_UMP_DIR_INPUT;
+		break;
+	case USB_MS_GR_TRM_BLOCK_TYPE_OUTPUT_ONLY:
+		type = SNDRV_UMP_DIR_OUTPUT;
+		break;
+	default:
+		usb_audio_dbg(umidi->chip, "Unsupported GTB type %d\n", type);
+		return 0; /* unsupported */
+	}
+
+	/* guess work: set blk-1 as the (0-based) block ID */
+	err = snd_ump_block_new(rmidi->ump, blk - 1, type,
+				desc->nGroupTrm, desc->nNumGroupTrm,
+				&fb);
+	if (err == -EBUSY)
+		return 0; /* already present */
+	else if (err)
+		return err;
+
+	if (desc->iBlockItem)
+		usb_string(rmidi->dev, desc->iBlockItem,
+			   fb->info.name, sizeof(fb->info.name));
+
+	if (__le16_to_cpu(desc->wMaxInputBandwidth) == 1 ||
+	    __le16_to_cpu(desc->wMaxOutputBandwidth) == 1)
+		fb->info.flags |= SNDRV_UMP_BLOCK_IS_MIDI1 |
+			SNDRV_UMP_BLOCK_IS_LOWSPEED;
+
+	usb_audio_dbg(umidi->chip,
+		      "Created a UMP block %d from GTB, name=%s\n",
+		      blk, fb->info.name);
+	return 0;
+}
+
+/* Create UMP blocks for each UMP EP */
+static int create_blocks_from_gtb(struct snd_usb_midi2_interface *umidi)
+{
+	struct snd_usb_midi2_ump *rmidi;
+	int i, blk, err, dir;
+
+	list_for_each_entry(rmidi, &umidi->rawmidi_list, list) {
+		if (!rmidi->ump)
+			continue;
+		/* Blocks have been already created? */
+		if (rmidi->ump->info.num_blocks)
+			continue;
+		/* loop over GTBs */
+		for (dir = 0; dir < 2; dir++) {
+			if (!rmidi->eps[dir])
+				continue;
+			for (i = 0; i < rmidi->eps[dir]->ms_ep->bNumGrpTrmBlock; i++) {
+				blk = rmidi->eps[dir]->ms_ep->baAssoGrpTrmBlkID[i];
+				err = create_gtb_block(rmidi, dir, blk);
+				if (err < 0)
+					return err;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static void snd_usb_midi_v2_free(struct snd_usb_midi2_interface *umidi)
 {
 	free_all_midi2_endpoints(umidi);
@@ -1009,6 +1090,12 @@ int snd_usb_midi_v2_create(struct snd_usb_audio *chip,
 		goto error;
 	}
 
+	err = create_blocks_from_gtb(umidi);
+	if (err < 0) {
+		usb_audio_err(chip, "Failed to create GTB blocks\n");
+		goto error;
+	}
+
 	set_fallback_rawmidi_names(umidi);
 	return 0;
 
-- 
2.35.3

