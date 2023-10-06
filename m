Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8C7BB3B3
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B2AF0;
	Fri,  6 Oct 2023 11:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B2AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696582874;
	bh=c0ppWRUszEfrMfrwgTkiNWyhAJl4TSYw8u6ffNoMO34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gRT5BWlol5fgz5AciSuP65Il36HeRycTwsdEwcr78EyR8UPWIla1VJNLdDh7BA77Z
	 53Zh8JKVOVtN4df1oc5CIFZ8Cx101baKSATZYDiv7FtAPj//g5C86V5gQo/YCTtZKN
	 DURdzQ/MzheSqSLiygwxj6zjOPJc1T+D6MKRwDqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C855F80553; Fri,  6 Oct 2023 11:00:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B748F80310;
	Fri,  6 Oct 2023 11:00:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 119B3F8047D; Fri,  6 Oct 2023 10:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49922F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49922F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZCsjFioV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jDkDMmAT
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 611CD1F896;
	Fri,  6 Oct 2023 08:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696582795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=srsNrgZL9zR7WLAyT/RuTZKhjlgD3sHz3MPU5cn2BWI=;
	b=ZCsjFioV7vYcwiEHo+5WQbDXQfwKOFUSQr8L6NlaRfg3WSyQyj1z8YAytwlDi4zp+II0PG
	79QLmVOl5S2tBkOwoRWLBK1FIsQo4zOSkXYasWBJNCnEMUGougG+kPlFI2ak6S+3hUPIe7
	k2yv1v/KP5cRYYdRh4+yM0XdBUC4QTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696582795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=srsNrgZL9zR7WLAyT/RuTZKhjlgD3sHz3MPU5cn2BWI=;
	b=jDkDMmATGw1QHuu5h9nmfyzmoUhPndizF41NCJAiTgTTHXNKphOTcdSwlRub96x085JSWZ
	/k0EXK0fzmkumhCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25A6E13A2E;
	Fri,  6 Oct 2023 08:59:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id todOCIvMH2UbKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 08:59:55 +0000
Date: Fri, 06 Oct 2023 10:59:54 +0200
Message-ID: <87pm1sw2gl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jussi Kivilinna <jussi.kivilinna@iki.fi>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: 6fire: Fix undefined behavior bug in struct
 comm_runtime
In-Reply-To: <ZRb0WiViajjqcyKT@work>
References: <ZRb0WiViajjqcyKT@work>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GIROX636W45ZBLNZX6EAGDKQHYXY5QN5
X-Message-ID-Hash: GIROX636W45ZBLNZX6EAGDKQHYXY5QN5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIROX636W45ZBLNZX6EAGDKQHYXY5QN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Sep 2023 17:59:22 +0200,
Gustavo A. R. Silva wrote:
> 
> `struct urb` is a flexible structure, which means that it contains a
> flexible-array member at the bottom. This could potentially lead to an
> overwrite of the objects following `receiver` in `struct comm_runtime`,
> among them some function pointers.
> 
> Fix this by placing the declaration of object `receiver` at the end of
> `struct comm_runtime`.
> 
> Fixes: ddb6b5a96437 ("ALSA: 6fire: fix DMA issues with URB transfer_buffer usage")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Sorry for the late reply, as I've been (still) off since the last
week.

Through a quick glance, I don't mind much to apply this, but I still
wonder how this "fixes" anything.  Does it silence compiler warnings
or such?

Certainly struct urb *may* have flex array, but in this case, it's
clearly not used, so it's fixed-size.  And, even if we shuffle the
member to put to the last, it doesn't fix anything automagically
alone.  If a flex array were used, it still leads to memory corruption
unless we implement the allocation properly.  So I find the patch
description is somehow misleading.


thanks,

Takashi

> ---
>  sound/usb/6fire/comm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/6fire/comm.h b/sound/usb/6fire/comm.h
> index 2447d7ecf179..ee81572a4eec 100644
> --- a/sound/usb/6fire/comm.h
> +++ b/sound/usb/6fire/comm.h
> @@ -19,7 +19,6 @@ enum /* settings for comm */
>  struct comm_runtime {
>  	struct sfire_chip *chip;
>  
> -	struct urb receiver;
>  	u8 *receiver_buffer;
>  
>  	u8 serial; /* urb serial */
> @@ -30,6 +29,7 @@ struct comm_runtime {
>  	int (*write8)(struct comm_runtime *rt, u8 request, u8 reg, u8 value);
>  	int (*write16)(struct comm_runtime *rt, u8 request, u8 reg,
>  			u8 vh, u8 vl);
> +	struct urb receiver;
>  };
>  
>  int usb6fire_comm_init(struct sfire_chip *chip);
> -- 
> 2.34.1
> 
