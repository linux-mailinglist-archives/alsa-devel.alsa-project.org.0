Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B307709371
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BBD474C;
	Fri, 19 May 2023 11:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BBD474C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489037;
	bh=3ZeobsfuLFCLVk15lGtKEEjKXR+i3UgJCnlk8b1cpVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OZeHQQJ/IxB74h+8NRJZPdyM0vaOdSSqHdZ57CnGla3ATvkyktNiirlZ4Hrw7CebW
	 Pv/MZ2GLvZz0ESanxb2FtBh8R54NAnP6vsNPAQ2OZawdJDNh99CiOAPyhWkjXPQxBI
	 mN6D+EHhWBf0HeSuDZOdzBiWvfPoRF+Ah1UjKcrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38D0FF805B3; Fri, 19 May 2023 11:32:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 583CAF8062D;
	Fri, 19 May 2023 11:32:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D650F80605; Fri, 19 May 2023 11:32:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F469F80557
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F469F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vavSz7Dg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OkI7tgbE
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F5BE222AD;
	Fri, 19 May 2023 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dimxiJwwtH3lX8qyHAdRD71WhexQ0+riv3hHhd98nB4=;
	b=vavSz7DgPDBtdH/do9LPB5JxEPPUyZWjMm5xYjkd0AfvZ2v2/2bpVC8ieQOTKwd99jLQBX
	bdT9J3ph7PpN7FPu+YncrX4VecLspUt7M9Z9x45u9W4mjWodoHvSzykJTbrBSKGbx0x5fh
	z1QMYzFzLK/9E74OvOdERjr9Ab37SFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dimxiJwwtH3lX8qyHAdRD71WhexQ0+riv3hHhd98nB4=;
	b=OkI7tgbEDRuHGqE/y5K774J9uPkVDuirJJLXSu2CHCTMEIplOJip1WQQyj0rfkCfdk8kie
	SaV6ibIy6AnESMDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FE8513A12;
	Fri, 19 May 2023 09:31:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sOcPA/tBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 15/36] ALSA: usb-audio: Inform inconsistent protocols in GTBs
Date: Fri, 19 May 2023 11:30:53 +0200
Message-Id: <20230519093114.28813-16-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MOD464JZWPUV6CGQ3XRDP4XEKND63BFN
X-Message-ID-Hash: MOD464JZWPUV6CGQ3XRDP4XEKND63BFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOD464JZWPUV6CGQ3XRDP4XEKND63BFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When parsing Group Terminal Blocks, we overwrote the preferred
protocol and the protocol capabilities silently from the last parsed
GTB.  This patch adds the information print indicating the unexpected
overrides instead of silent action.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index f005de9f9b8a..14f023b4b414 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -581,6 +581,7 @@ static int parse_group_terminal_block(struct snd_usb_midi2_ump *rmidi,
 				      const struct usb_ms20_gr_trm_block_descriptor *desc)
 {
 	struct snd_ump_endpoint *ump = rmidi->ump;
+	unsigned int protocol, protocol_caps;
 
 	/* set default protocol */
 	switch (desc->bMIDIProtocol) {
@@ -588,24 +589,40 @@ static int parse_group_terminal_block(struct snd_usb_midi2_ump *rmidi,
 	case USB_MS_MIDI_PROTO_1_0_64_JRTS:
 	case USB_MS_MIDI_PROTO_1_0_128:
 	case USB_MS_MIDI_PROTO_1_0_128_JRTS:
-		ump->info.protocol = SNDRV_UMP_EP_INFO_PROTO_MIDI1;
+		protocol = SNDRV_UMP_EP_INFO_PROTO_MIDI1;
 		break;
 	case USB_MS_MIDI_PROTO_2_0:
 	case USB_MS_MIDI_PROTO_2_0_JRTS:
-		ump->info.protocol = SNDRV_UMP_EP_INFO_PROTO_MIDI2;
+		protocol = SNDRV_UMP_EP_INFO_PROTO_MIDI2;
 		break;
+	default:
+		return 0;
 	}
 
-	ump->info.protocol_caps = ump->info.protocol;
+	if (ump->info.protocol && ump->info.protocol != protocol)
+		usb_audio_info(rmidi->umidi->chip,
+			       "Overriding preferred MIDI protocol in GTB %d: %x -> %x\n",
+			       rmidi->usb_block_id, ump->info.protocol,
+			       protocol);
+	ump->info.protocol = protocol;
+
+	protocol_caps = protocol;
 	switch (desc->bMIDIProtocol) {
 	case USB_MS_MIDI_PROTO_1_0_64_JRTS:
 	case USB_MS_MIDI_PROTO_1_0_128_JRTS:
 	case USB_MS_MIDI_PROTO_2_0_JRTS:
-		ump->info.protocol_caps |= SNDRV_UMP_EP_INFO_PROTO_JRTS_TX |
+		protocol_caps |= SNDRV_UMP_EP_INFO_PROTO_JRTS_TX |
 			SNDRV_UMP_EP_INFO_PROTO_JRTS_RX;
 		break;
 	}
 
+	if (ump->info.protocol_caps && ump->info.protocol_caps != protocol_caps)
+		usb_audio_info(rmidi->umidi->chip,
+			       "Overriding MIDI protocol caps in GTB %d: %x -> %x\n",
+			       rmidi->usb_block_id, ump->info.protocol_caps,
+			       protocol_caps);
+	ump->info.protocol_caps = protocol_caps;
+
 	return 0;
 }
 
-- 
2.35.3

