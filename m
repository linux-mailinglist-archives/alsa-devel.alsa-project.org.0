Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FAD70D64E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 09:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4012A844;
	Tue, 23 May 2023 09:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4012A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828669;
	bh=svMCdHDmVDNqttHfJUkPcv7ueEoH0oFuZeT63QkwRgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H/hauzIIpokZpCgc0M2kPQlgdETS4X0nJ68H8UWlZIuC7rslktmEDShCXb/SvSl8X
	 EGr1zc+DnWKCTXO7xT2K59GSz9tJ7/DgcskAgPWwle1qn9uy1nN/e6/D/p66mcONub
	 5yUeBe+1UEcJvqu5XufkVnLiPypAonUjcEIXzd/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F3D3F805FE; Tue, 23 May 2023 09:54:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECA64F805FA;
	Tue, 23 May 2023 09:54:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0612CF805AA; Tue, 23 May 2023 09:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E14EDF8026A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E14EDF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VwK8ends;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hrqlcv+Z
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A25F2040C;
	Tue, 23 May 2023 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxnmOhq+hNE1bnrwoap3xaZVrhnrAGTCoSHtcTlVz/U=;
	b=VwK8endsKeeUiW3ovXy9mmmdXp0nQDmndTyzdj7Q8VBlBJVE4kWMqxLkCAv9TLj6OQSjuj
	sKeRV639IxN2VG7actZPdyG+WxppmpjKa3+LqvRMFdLSOgLzNNJXZa2pzXUP5ICXbGfn4D
	Iab7K/diKlTqTtiZOBWIOzWPFfNXdcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxnmOhq+hNE1bnrwoap3xaZVrhnrAGTCoSHtcTlVz/U=;
	b=hrqlcv+ZUVDteACAVDImOuE1NZQqe5ky+mTIEyteLt3XU3tgRUCVeAntJrycvPIKNLhdVZ
	0ajCWtIUsw9V0zCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23CF813588;
	Tue, 23 May 2023 07:54:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sHokBh5xbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/37] ALSA: usb-audio: Create UMP blocks from USB MIDI
 GTBs
Date: Tue, 23 May 2023 09:53:33 +0200
Message-Id: <20230523075358.9672-13-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FQ65URMLWP7I7NG3YCHMEPSG6BHEWKU6
X-Message-ID-Hash: FQ65URMLWP7I7NG3YCHMEPSG6BHEWKU6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQ65URMLWP7I7NG3YCHMEPSG6BHEWKU6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

USB MIDI spec defines the Group Terminal Blocks (GTB) that associate
multiple UMP Groups.  Those correspond to snd_ump_block entities in
ALSA UMP abstraction, and now we create those UMP Block objects for
each UMP Endpoint from the parsed GTB information.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 100 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 6 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 790e4cd5d35c..5ffee06ac746 100644
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
@@ -798,6 +792,94 @@ static int find_matching_ep_partner(struct snd_usb_midi2_interface *umidi,
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
+		usb_audio_dbg(umidi->chip, "Unsupported GTB type %d\n",
+			      desc->bGrpTrmBlkType);
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
@@ -1009,6 +1091,12 @@ int snd_usb_midi_v2_create(struct snd_usb_audio *chip,
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

