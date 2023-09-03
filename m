Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6554790C76
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 16:28:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CABC3E8;
	Sun,  3 Sep 2023 16:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CABC3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693751338;
	bh=UuHMcXScosmFPy5HC5qeb4uZxwn+Uvgb/5RU7zXnzWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sWfnD7E5OoiRI+EoonzYMZAFYPWpsFOaLZWjZ9LamR/jUHk6DQIIvoQ8XRtJj8ou6
	 CNOgyOY0i/S+aVglxyRRTqCzEpXYAh7JHUpbzUMeXMBmaSbG7HWPB3boWCeMJ3XW7h
	 AjPCYQNEbsvIT+VeaHpHbqCUu+xTcMK+/kNugY8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F4CFF8047D; Sun,  3 Sep 2023 16:27:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC522F80431;
	Sun,  3 Sep 2023 16:27:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC0A2F8047D; Sun,  3 Sep 2023 16:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D059F800F5
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 16:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D059F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pH2g3p8N;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=d6HvFViU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C804D216DA;
	Sun,  3 Sep 2023 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693751260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6qMJi4BKyutAvw/lZjnVaXoKuFbBrRnta8D0q30utTs=;
	b=pH2g3p8N0X88xdBrpz7RJJ5StCgRDlSq6Fkiiu1N0I7mTLoQec0z4x+SbuN6Dgj3z9zEx7
	b+J+iyzlWXPj+xcAFIzo7iBreNFUSYTfb9zwCsC0QdncI1gSXPoNKZ4UrAosmU+uT04uqM
	Pb0IlbcT5uwKMOhK7BAAdUAOOvhM35A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693751260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6qMJi4BKyutAvw/lZjnVaXoKuFbBrRnta8D0q30utTs=;
	b=d6HvFViU48h3ICoKVzNxTgKiYrhiUeKXy665RwBz1a6nVXIQseUnKHJh4fJ/Yrwjlvatla
	aj5Sr6wo6aJunrDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D7A013583;
	Sun,  3 Sep 2023 14:27:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id fG7JINyX9GR0cwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 03 Sep 2023 14:27:40 +0000
Date: Sun, 03 Sep 2023 16:27:40 +0200
Message-ID: <87zg23l4bn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: scarlett2: Fix a potential memory leak in
 scarlett2_init_notify()
In-Reply-To: 
 <73aab53d53df156a5df2bc61314ff26448526749.1693744859.git.christophe.jaillet@wanadoo.fr>
References: 
 <73aab53d53df156a5df2bc61314ff26448526749.1693744859.git.christophe.jaillet@wanadoo.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LGDW5HGOZ6HR4NEU2RCLIU3ZJKP24BD6
X-Message-ID-Hash: LGDW5HGOZ6HR4NEU2RCLIU3ZJKP24BD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGDW5HGOZ6HR4NEU2RCLIU3ZJKP24BD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 03 Sep 2023 14:41:45 +0200,
Christophe JAILLET wrote:
> 
> If kmalloc() fails, we should release 'mixer->urb'.

This is released at the common error path in mixer.c,
snd_usb_mixer_free(), hence it's not needed.

And, even if freeing here, you must NULL-clear mixer->urb, too;
otherwise it'll lead to double-free.


thanks,

Takashi

> 
> Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  sound/usb/mixer_scarlett_gen2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> index 9d11bb08667e..a439c7f64b2e 100644
> --- a/sound/usb/mixer_scarlett_gen2.c
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -4060,8 +4060,10 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
>  		return -ENOMEM;
>  
>  	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
> -	if (!transfer_buffer)
> +	if (!transfer_buffer) {
> +		usb_free_urb(mixer->urb);
>  		return -ENOMEM;
> +	}
>  
>  	usb_fill_int_urb(mixer->urb, dev, pipe,
>  			 transfer_buffer, private->wMaxPacketSize,
> -- 
> 2.34.1
> 
