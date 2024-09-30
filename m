Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981D989EA8
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 11:43:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C17E41530;
	Mon, 30 Sep 2024 11:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C17E41530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727689387;
	bh=uJ8/vpmmGhvXBt7yG9xTuuhyrPbqpKEK19L8FPukiGo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ksgC391pMaN/7ZWeLcuDk4rvgjwut2oiz0fjqQWoqanp7JT+7JwaZoWnsrH171KHC
	 rfANW2Nlw7HzHEqNhUygRXui/gbVAS1YHWnUQhVI3mRHIZfPyrYBJJipQuSN2fA3LZ
	 rHW+ey3lSNPMKq2uhje66bT0eFSBaGAujc7SEPUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17FCAF805B6; Mon, 30 Sep 2024 11:42:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53A45F805B2;
	Mon, 30 Sep 2024 11:42:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33755F80508; Mon, 30 Sep 2024 11:42:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4891EF80007
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 11:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4891EF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=auWm6bJ4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nbby8iVJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=auWm6bJ4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nbby8iVJ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C5101F7F8;
	Mon, 30 Sep 2024 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727689348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G1seGICz3JPahsuG06QLM3DMJzt/DSNB6Y3TDA5CHFs=;
	b=auWm6bJ4wF32WSCaEmFGKT0oZfjkEaq45u/aNqEVF/smal3iV5c8NnEkNOyIDKLnSdfJ7H
	XvXZaFRDSK30yKDOoIEum4DaVNt+Nf4pqnYrZEJTHzf+jg3YFo7fawErxYtihfRMs03hlR
	LgeVUBrniH05WlHJ6VYslRyFDcIT5H4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727689348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G1seGICz3JPahsuG06QLM3DMJzt/DSNB6Y3TDA5CHFs=;
	b=nbby8iVJp+Lj18crnS5bZtxtPdx0r6FPBfHF4QH6pGz/O+2inkHnxYc1mo9RoGhpdMJAPW
	WPK3rMPM0W3VsXDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727689348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G1seGICz3JPahsuG06QLM3DMJzt/DSNB6Y3TDA5CHFs=;
	b=auWm6bJ4wF32WSCaEmFGKT0oZfjkEaq45u/aNqEVF/smal3iV5c8NnEkNOyIDKLnSdfJ7H
	XvXZaFRDSK30yKDOoIEum4DaVNt+Nf4pqnYrZEJTHzf+jg3YFo7fawErxYtihfRMs03hlR
	LgeVUBrniH05WlHJ6VYslRyFDcIT5H4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727689348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G1seGICz3JPahsuG06QLM3DMJzt/DSNB6Y3TDA5CHFs=;
	b=nbby8iVJp+Lj18crnS5bZtxtPdx0r6FPBfHF4QH6pGz/O+2inkHnxYc1mo9RoGhpdMJAPW
	WPK3rMPM0W3VsXDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE1F3136CB;
	Mon, 30 Sep 2024 09:42:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3MXBOINy+mZrMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Sep 2024 09:42:27 +0000
Date: Mon, 30 Sep 2024 11:43:20 +0200
Message-ID: <87sethiiiv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: <alsa-devel@alsa-project.org>,
	<kailang@realtek.com>,
	<flove@realtek.com>,
	<jennifer_chen@realtek.com>,
	<geans_chen@realsil.com.cn>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the push button function for the
 ALC257
In-Reply-To: <20240930085731.2871700-1-oder_chiou@realtek.com>
References: <20240930085731.2871700-1-oder_chiou@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: 6IIFNXKHFPU3SCPWT7YQR3OY36QX3JWX
X-Message-ID-Hash: 6IIFNXKHFPU3SCPWT7YQR3OY36QX3JWX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IIFNXKHFPU3SCPWT7YQR3OY36QX3JWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Sep 2024 10:57:31 +0200,
Oder Chiou wrote:
> 
> The patch "Fix noise from speakers on Lenovo IdeaPad 3 15IAU7" caused
> that the headset push button cannot work properly in case of ALC257.
> This patch reverted it to correct the side effect.

If a previous commit caused such a regression, could you point it,
too?  At best in a form of "Fixes:" tag.


thanks,

Takashi

> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f787ff4182d4..86db1a4ec24c 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -587,6 +587,7 @@ static void alc_shutup_pins(struct hda_codec *codec)
>  	switch (codec->core.vendor_id) {
>  	case 0x10ec0236:
>  	case 0x10ec0256:
> +	case 0x10ec0257:
>  	case 0x19e58326:
>  	case 0x10ec0283:
>  	case 0x10ec0285:
> -- 
> 2.34.1
> 
