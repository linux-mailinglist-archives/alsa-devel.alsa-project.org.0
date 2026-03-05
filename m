Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD5oNLabqWnGAwEAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 16:05:26 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D1E214235
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 16:05:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A33D602C4;
	Thu,  5 Mar 2026 16:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A33D602C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772723125;
	bh=7lMsE/T5yBa91ia8Isdn+SUUGq2WwC5NiL17Nu8DPFg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vL4qDVHwcjV2afJmvHj7gdrpu+JdwfbqoIrvIOtpz/C5wiBUWTWshzupCXrv16kKW
	 U5zf8hlsg7Ax23/AiDvFZHoLHLh8LkEkB3R1MWpoJR1pgRWMU+zlZsrm7Vbcxn9lp9
	 ujuRibHJniXSkjGM8nDIdfoGo9L/hMzn00ByvsE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E5A6F805F7; Thu,  5 Mar 2026 16:04:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD19DF805F1;
	Thu,  5 Mar 2026 16:04:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2083F8025A; Thu,  5 Mar 2026 16:04:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
	URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B097F80087
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 16:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B097F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rEmqUGIp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1/VgtMCa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=rEmqUGIp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1/VgtMCa
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 60DAB3F26F;
	Thu,  5 Mar 2026 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772723081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bl3S/hvkeR7iHeTn1KQOJPKNei39lNO96TfX9Nvas44=;
	b=rEmqUGIp1uxzmI702myPW2O4lnh5Y8rmwY98NN9/lqXi5So7gLDTaKNHSjRsQF76bzo+aw
	nqcR115v1hqEKF3paNbuBOcsK8yxdLQVKereUtg8+STOKLTYCFB3YNBjQ8nRnlvngV6J2T
	1WX/y7DBfKhwpoiPnTtggxRuRuhl5n0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772723081;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bl3S/hvkeR7iHeTn1KQOJPKNei39lNO96TfX9Nvas44=;
	b=1/VgtMCaEHU93jub2c7WL4AaDYdWEs4Jp2617BqpR/usX1U1G7ve7AX6uQvjrcrcKuSK3q
	XJQqdo8JEtQUpyDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772723081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bl3S/hvkeR7iHeTn1KQOJPKNei39lNO96TfX9Nvas44=;
	b=rEmqUGIp1uxzmI702myPW2O4lnh5Y8rmwY98NN9/lqXi5So7gLDTaKNHSjRsQF76bzo+aw
	nqcR115v1hqEKF3paNbuBOcsK8yxdLQVKereUtg8+STOKLTYCFB3YNBjQ8nRnlvngV6J2T
	1WX/y7DBfKhwpoiPnTtggxRuRuhl5n0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772723081;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bl3S/hvkeR7iHeTn1KQOJPKNei39lNO96TfX9Nvas44=;
	b=1/VgtMCaEHU93jub2c7WL4AaDYdWEs4Jp2617BqpR/usX1U1G7ve7AX6uQvjrcrcKuSK3q
	XJQqdo8JEtQUpyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 449073EA68;
	Thu,  5 Mar 2026 15:04:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fDuID4mbqWkkHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 15:04:41 +0000
Date: Thu, 05 Mar 2026 16:04:40 +0100
Message-ID: <87seaewc53.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ngon <ngon36201@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [REPORT] ALSA: hda/realtek: Fix silent/extremely quiet audio on
 HP Pavilion x360 (ALC295) with uninitialized SSID 103c:0000
In-Reply-To: 
 <CAF2ktaXHsCKthq4nLWCXPzSdAtyopSrBrG3peQQ5cnxgfJS3XA@mail.gmail.com>
References: 
 <CAF2ktaUW2oaWwGazGtJQ3o1JyE2R4O2xPd-Dchr=qqi7_QRruQ@mail.gmail.com>
	<87ikbdjlrl.wl-tiwai@suse.de>
	<CAF2ktaXHsCKthq4nLWCXPzSdAtyopSrBrG3peQQ5cnxgfJS3XA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: X7BKBUKNKKWFN5ZHOLYFOSESYXBZ6274
X-Message-ID-Hash: X7BKBUKNKKWFN5ZHOLYFOSESYXBZ6274
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7BKBUKNKKWFN5ZHOLYFOSESYXBZ6274/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 61D1E214235
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ngon36201@gmail.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,alsa-project.org:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,suse.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, 04 Mar 2026 06:33:18 +0100,
Ngon wrote:
> 
> Hi Takashi,
> 
> Thank you for your quick response! I have checked the Codec Subsystem
> ID as you suggested.
> 
> Good news: While the PCI SSID is indeed 103c:0000, the Codec SSID is valid:
> Codec: Realtek ALC295, Subsystem Id: 0x103c8486
> 
> I have attached the full output of alsa-info.sh --no-upload to this
> email for your review.
> 
> Regarding the fix, manually applying these verbs restores audio perfectly:
> 1. 0x20 SET_COEF_INDEX 0x07 - 0x7770
> 2. 0x20 SET_COEF_INDEX 0x0d - 0x3000
> 
> I would be very happy to test a patch using HDA_CODEC_QUIRK(0x103c,
> 0x8486, ...) if you can provide one.
> 
> Best regards,
> kemzsitink

Thanks.  I see now that your have set up model=alc295-hp-x360, so this
might be needed to be chained.

Below is a test fix patch.  Let me know whether this works.
When you test it, please drop extra options from your setup.


Takashi

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4c49f1195e1b..2f30d4ffeec6 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3897,6 +3897,7 @@ enum {
 	ALC256_FIXUP_HUAWEI_MACH_WX9_PINS,
 	ALC298_FIXUP_HUAWEI_MBX_STEREO,
 	ALC295_FIXUP_HP_X360,
+	ALC295_FIXUP_HP_PAVILION_X360,
 	ALC221_FIXUP_HP_HEADSET_MIC,
 	ALC285_FIXUP_LENOVO_HEADPHONE_NOISE,
 	ALC295_FIXUP_HP_AUTO_MUTE,
@@ -5201,6 +5202,19 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HP_MUTE_LED_MIC3
 	},
+	[ALC295_FIXUP_HP_PAVILION_X360] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			/* force amp gain and processing state */
+			{0x20, AC_VERB_SET_COEF_INDEX, 0x07},
+			{0x20, AC_VERB_SET_PROC_COEF, 0x7770},
+			{0x20, AC_VERB_SET_COEF_INDEX, 0x0d},
+			{0x20, AC_VERB_SET_PROC_COEF, 0x3000},
+			{}
+		},
+		.chained = true,
+		.chain_id = ALC295_FIXUP_HP_X360
+	},
 	[ALC221_FIXUP_HP_HEADSET_MIC] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -6823,6 +6837,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x82c0, "HP G3 mini premium", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x841c, "HP Pavilion 15-CK0xx", ALC269_FIXUP_HP_MUTE_LED_MIC3),
+	HDA_CODEC_QUIRK(0x103c, 0x8486, "HP Pavilion x360", ALC295_FIXUP_HP_PAVILION_X360),
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x84a6, "HP 250 G7 Notebook PC", ALC269_FIXUP_HP_LINE1_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x84ae, "HP 15-db0403ng", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
