Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECBE790C69
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 16:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FEBFA;
	Sun,  3 Sep 2023 16:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FEBFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693751099;
	bh=/ca0lAi8s2p2j7KbFIXPnzFhmugrrU0qx3oTHH6PBEo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SPAElRQflGIOUyPhtOaxV8P02g6KfSSZ74qef0zqQzyze8jJdh7zFzJ7uidzC11SZ
	 11/LcROYIuLZa8aOSYxY0ptKA5noZXr8gfBxUc8jVO9nqiMjPvKBMfBPujxQtHxKXf
	 RQl9MM/ApLGNMe/+vDwPJ8LnJAH+rKXYRRtBA5qA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27FADF80537; Sun,  3 Sep 2023 16:24:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DA0F80431;
	Sun,  3 Sep 2023 16:24:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B05C2F8047D; Sun,  3 Sep 2023 16:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B600BF80141
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 16:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B600BF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=L4nm2hkU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sNgjXc1h
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CCA1E216DA;
	Sun,  3 Sep 2023 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693751034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kXC+3FqTHA/mLgbq2RC3Hciy9DRGxqa82vRW3oFylp0=;
	b=L4nm2hkUtYLnahhlzqi7c3QjOLM1gtjpY/Ilb/oP/21ePdfXlHLtBiPJbfMFSmJPQHbL/S
	X1XNK/1FfTXKXzsdjC3sOkcor6z+3+F05SO/j3Sbc1MUdrBEL/R/ERMG4U12NsTOyN7Ujo
	cy2ZKODj+oYhmVc2oGMdjKEJtWkJzGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693751034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kXC+3FqTHA/mLgbq2RC3Hciy9DRGxqa82vRW3oFylp0=;
	b=sNgjXc1hkIBDJQXwnhjfFDBR7ihql78Wt1v+14Lq/WKOPUVATyfqNxkU1r/yO2LrwOfG6/
	60PQL6wk2mWtD7Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A244E13583;
	Sun,  3 Sep 2023 14:23:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dXG0JvqW9GRIcgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 03 Sep 2023 14:23:54 +0000
Date: Sun, 03 Sep 2023 16:23:54 +0200
Message-ID: <871qffmj2d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix a potential memory leak in
 scarlett2_init_notify()
In-Reply-To: 
 <fc275ed315b9157952dcf2744ee7bdb78defdb5f.1693746347.git.christophe.jaillet@wanadoo.fr>
References: 
 <fc275ed315b9157952dcf2744ee7bdb78defdb5f.1693746347.git.christophe.jaillet@wanadoo.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3ZMMHKKUGTTKL7SUSI7WLM7NEUYTLZDI
X-Message-ID-Hash: 3ZMMHKKUGTTKL7SUSI7WLM7NEUYTLZDI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZMMHKKUGTTKL7SUSI7WLM7NEUYTLZDI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 03 Sep 2023 15:06:00 +0200,
Christophe JAILLET wrote:
> 
> If usb_alloc_coherent() or usb_urb_ep_type_check() fail, we should release
> the resources previously allocated.

Those are freed in the caller side, start_input_streams() instead.


thanks,

Takashi

> 
> Fixes: ff49d1df79ae ("ALSA: usb-audio: USB MIDI 2.0 UMP support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  sound/usb/midi2.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
> index a27e244650c8..4109c82adff6 100644
> --- a/sound/usb/midi2.c
> +++ b/sound/usb/midi2.c
> @@ -302,7 +302,8 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
>  		ctx->urb = usb_alloc_urb(0, GFP_KERNEL);
>  		if (!ctx->urb) {
>  			dev_err(&ep->dev->dev, "URB alloc failed\n");
> -			return -ENOMEM;
> +			err = -ENOMEM;
> +			goto err_free_all;
>  		}
>  		ctx->ep = ep;
>  		buffer = usb_alloc_coherent(ep->dev, len, GFP_KERNEL,
> @@ -310,7 +311,8 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
>  		if (!buffer) {
>  			dev_err(&ep->dev->dev,
>  				"URB buffer alloc failed (size %d)\n", len);
> -			return -ENOMEM;
> +			err = -ENOMEM;
> +			goto err_free_cur_urb;
>  		}
>  		if (ep->interval)
>  			usb_fill_int_urb(ctx->urb, ep->dev, ep->pipe,
> @@ -322,13 +324,22 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
>  		if (err < 0) {
>  			dev_err(&ep->dev->dev, "invalid MIDI EP %x\n",
>  				endpoint);
> -			return err;
> +			goto err_free_cur_dma;
>  		}
>  		ctx->urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>  		ep->num_urbs++;
>  	}
>  	ep->urb_free = ep->urb_free_mask = GENMASK(ep->num_urbs - 1, 0);
>  	return 0;
> +
> +err_free_cur_dma:
> +	usb_free_coherent(ep->dev, len, buffer, ctx->urb->transfer_dma);
> +err_free_cur_urb:
> +	usb_free_urb(ctx->urb);
> +	ctx->urb = NULL;
> +err_free_all:
> +	free_midi_urbs(ep);
> +	return err;
>  }
>  
>  static struct snd_usb_midi2_endpoint *
> -- 
> 2.34.1
> 
