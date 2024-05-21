Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D12B18CAECB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 15:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153D3208;
	Tue, 21 May 2024 15:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153D3208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716296579;
	bh=hrsM7ZPGvSc3gBrRAQe0+21IiututFmytl05498MpqU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D9CMsOQ5OvgfbLyfKycCssHuGtlQ77ALUOXqroKKAQCrOwRC7vyPIcE51IjApfJBj
	 hiE9eQeSPX3e3cmcvLfvocDlfwVF/um6q2v5RkrEnhlbupoFVbsjjA8M0U/4BLg2pt
	 n6TzDqyyLtoRmGpquMhdWlPhpCf1LrxadhDWKbNo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 739C5F80589; Tue, 21 May 2024 15:02:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA13F8051F;
	Tue, 21 May 2024 15:02:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF0EAF8026A; Tue, 21 May 2024 15:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6785AF800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 15:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6785AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=u0hYpHxx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fOwQaVDd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=u0hYpHxx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fOwQaVDd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 83DB25C171;
	Tue, 21 May 2024 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1716296519;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Z4uWvo2twTh7wiDGu/9ID21HQ5a9PToI5gTbqHZcCU=;
	b=u0hYpHxxa9zJbhNT3Ai67Kh1uIYKgswpcbXNq6KHBRCEx+PPQ/VntIa9G3EMOyJf0seVYn
	BCQzLvKH0gB9SVc+wyiAq7Bal6gsqHWdr4A94hlJIr3cZJCZauvYTOszCaxJSUbsjluTgq
	mLvYhNNsey6YO4/otJy2hVeP6MrtnQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716296519;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Z4uWvo2twTh7wiDGu/9ID21HQ5a9PToI5gTbqHZcCU=;
	b=fOwQaVDdLtP92Zjaqdv4tiOoOR0tItzVT7Dg/6UGLDJGNn3c65St6OoYLkq3keI8svWZ3W
	wetbmZD/Lwp4ocBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u0hYpHxx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fOwQaVDd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1716296519;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Z4uWvo2twTh7wiDGu/9ID21HQ5a9PToI5gTbqHZcCU=;
	b=u0hYpHxxa9zJbhNT3Ai67Kh1uIYKgswpcbXNq6KHBRCEx+PPQ/VntIa9G3EMOyJf0seVYn
	BCQzLvKH0gB9SVc+wyiAq7Bal6gsqHWdr4A94hlJIr3cZJCZauvYTOszCaxJSUbsjluTgq
	mLvYhNNsey6YO4/otJy2hVeP6MrtnQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716296519;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Z4uWvo2twTh7wiDGu/9ID21HQ5a9PToI5gTbqHZcCU=;
	b=fOwQaVDdLtP92Zjaqdv4tiOoOR0tItzVT7Dg/6UGLDJGNn3c65St6OoYLkq3keI8svWZ3W
	wetbmZD/Lwp4ocBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F72213A1E;
	Tue, 21 May 2024 13:01:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NYblEUebTGYQOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 May 2024 13:01:59 +0000
Date: Tue, 21 May 2024 15:02:18 +0200
Message-ID: <87h6er1fol.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Prevent leaking urb
In-Reply-To: <20240521010352.1082164-1-nichen@iscas.ac.cn>
References: <20240521010352.1082164-1-nichen@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 83DB25C171
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: LFYODHFU72BQVIW3XFMSAAY5HSYR3SKW
X-Message-ID-Hash: LFYODHFU72BQVIW3XFMSAAY5HSYR3SKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFYODHFU72BQVIW3XFMSAAY5HSYR3SKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 May 2024 03:03:52 +0200,
Chen Ni wrote:
> 
> In scarlett2_init_notify() if kmalloc() fails the allocated urb should
> be released.

It's freed in the common USB mixer destructor (snd_usb_mixer_free()),
hence your patch will lead to a double-free.


thanks,

Takashi

> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  sound/usb/mixer_scarlett2.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
> index 1150cf104985..4cad6b2a0292 100644
> --- a/sound/usb/mixer_scarlett2.c
> +++ b/sound/usb/mixer_scarlett2.c
> @@ -8637,9 +8637,10 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
>  		return -ENOMEM;
>  
>  	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
> -	if (!transfer_buffer)
> +	if (!transfer_buffer) {
> +		usb_free_urb(mixer->urb);
>  		return -ENOMEM;
> -
> +	}
>  	usb_fill_int_urb(mixer->urb, dev, pipe,
>  			 transfer_buffer, private->wMaxPacketSize,
>  			 scarlett2_notify, mixer, private->bInterval);
> -- 
> 2.25.1
> 
> 
