Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD94A645E7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Mar 2025 09:40:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 821AC60344;
	Mon, 17 Mar 2025 09:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 821AC60344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742200823;
	bh=vx3UyLispRpVfWLiP9dgE6o+CmBS4/yGuqLzf961zs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rJR5yN1NsSldLnJeWZ6o9VSWCvu+cSFqmr83hIneyD9IpsjECG1Fdb4Nugj91PsTd
	 W/p8ILqrjK3NeQ4i8+wxFf53L6c3e6RXWRwFQkiAFKOzJRiKxMFD9BtFhKxI0m2/sL
	 PaIShszVjT1O+/xtAGW+cRQVXXzb5uBVXVBtErCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C1FAF805AF; Mon, 17 Mar 2025 09:39:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 317D0F805B5;
	Mon, 17 Mar 2025 09:39:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E280F8055B; Mon, 17 Mar 2025 09:39:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B306F80073
	for <alsa-devel@alsa-project.org>; Mon, 17 Mar 2025 09:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B306F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=h4kBpObl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BA+tbSJs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=h4kBpObl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BA+tbSJs
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29DD320094;
	Mon, 17 Mar 2025 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742200778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l5TNV3pIkdVvErbUwHZyV4ACZXbtBjxLi3eTQ10vzZg=;
	b=h4kBpObll4AX8tlBvoJzweznEJ1LyhcksZcwho42f5M7hUIVq2eCl75WmrGzB00Lt+emK+
	EFqYmPykwYEwFYxEIMif2xuN+B/dQtoilpNtr5KAAQbaP8H1idbDhMot4Otht0v2jMB8nz
	FPOVWs/HWwy8BCBf+4qri6NVJB8K75k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742200778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l5TNV3pIkdVvErbUwHZyV4ACZXbtBjxLi3eTQ10vzZg=;
	b=BA+tbSJstcXvxnwgUT+rGjUROq6qOlUiBefh4rXI+3wsP8DQqMVrd6nKAWdTD0seI8aG/j
	N9eLHp4qcqmBUGCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h4kBpObl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BA+tbSJs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742200778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l5TNV3pIkdVvErbUwHZyV4ACZXbtBjxLi3eTQ10vzZg=;
	b=h4kBpObll4AX8tlBvoJzweznEJ1LyhcksZcwho42f5M7hUIVq2eCl75WmrGzB00Lt+emK+
	EFqYmPykwYEwFYxEIMif2xuN+B/dQtoilpNtr5KAAQbaP8H1idbDhMot4Otht0v2jMB8nz
	FPOVWs/HWwy8BCBf+4qri6NVJB8K75k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742200778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l5TNV3pIkdVvErbUwHZyV4ACZXbtBjxLi3eTQ10vzZg=;
	b=BA+tbSJstcXvxnwgUT+rGjUROq6qOlUiBefh4rXI+3wsP8DQqMVrd6nKAWdTD0seI8aG/j
	N9eLHp4qcqmBUGCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 062E6139D2;
	Mon, 17 Mar 2025 08:39:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ow8QAMrf12cWfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 08:39:38 +0000
Date: Mon, 17 Mar 2025 09:39:37 +0100
Message-ID: <875xk8f3ue.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dhruv Deshpande <dhrv.d@proton.me>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Support mute LED on HP Laptop
 15s-du3xxx The mute LED on this HP laptop uses ALC236 and requires a quirk to
 function. This patch enables the existing quirk for the device.
In-Reply-To: <20250317083319.42195-1-dhrv.d@proton.me>
References: <20250317083319.42195-1-dhrv.d@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 29DD320094
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: GPN7G7OVZRTMYPNYHB42OJK2IDYO2T5F
X-Message-ID-Hash: GPN7G7OVZRTMYPNYHB42OJK2IDYO2T5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPN7G7OVZRTMYPNYHB42OJK2IDYO2T5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Mar 2025 09:33:53 +0100,
Dhruv Deshpande wrote:
> 
> Signed-off-by: Dhruv Deshpande <dhrv.d@proton.me>

Please keep the subject line concise, and put the more texts in the
patch description instead.

Also, we already changed the ML for the kernel patches to
linux-sound@vger.kernel.org.  Use that address instead.

Last but not least, if you want to make this as a stable patch, put
the Cc line in the patch itself (just before your Signed-off-by
line), and you don't need the patch to send to stable ML.

Could you resubmit with those corrections?


thanks,

Takashi

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index a84857a3c2bf..c0b97c29bf89 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10519,6 +10519,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
>  	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
>  	SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> +	SND_PCI_QUIRK(0x103c, 0x881e, "HP Laptop 15s-du3xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
> -- 
> 2.48.1
> 
> 
