Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F887BB3BD
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:02:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA7B1E9;
	Fri,  6 Oct 2023 11:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA7B1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696582975;
	bh=AkLt9B4yKb8V57CupuAU+SjzHNw5s+FyBA0FpxVL7fU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=amQoGaZSeuRue3vwFaJOyKgSAgFbcer+WRKFxz47TsiQH130a9GpwjnPsFjSQIL3P
	 v/ChMWPdMtvcAKB1Qx/hrzeXzVwjoIWWddOUwEDfWZWtcdccuZwkKT3LvNS0KBQ7n+
	 1Zh0OVqqje1ZpALsxdvumvu0j9GKGhswGezNSGEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27867F80557; Fri,  6 Oct 2023 11:01:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82503F80310;
	Fri,  6 Oct 2023 11:01:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41936F8047D; Fri,  6 Oct 2023 11:01:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 58CD5F801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 11:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CD5F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kChFPxns;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=trSMZbzQ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 338811F45F;
	Fri,  6 Oct 2023 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696582898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZDIguXnYNfuvCTy25QRJxOzQExo+GhNuL1tdAJxFvA=;
	b=kChFPxnscyTax/udKiuFDpBaYJYhTPJwooQqM/Cv6yVz1xL/CwqE4CtdXl1xEtAEzeFdWc
	fbZqCX8X/p754Nq/mQHpbbIiJgsUoUV9Kch7KssOTSXdDmSMTYKcjN6fdyPtCwApnE9iei
	sUJ+uFAwwjJx7DnO58A3tRw8G3gGPaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696582898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZDIguXnYNfuvCTy25QRJxOzQExo+GhNuL1tdAJxFvA=;
	b=trSMZbzQbey/vL5X3ZMqvPQ1c0mqQpwWLuwPSYWJ0DzqLHg44qo+pb4m0iBjKgrWk0N7vD
	MacWe9eXesnBqfAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03BD613A2E;
	Fri,  6 Oct 2023 09:01:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rRVXO/HMH2VDKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 09:01:37 +0000
Date: Fri, 06 Oct 2023 11:01:37 +0200
Message-ID: <87o7hcw2dq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Torsten Schenk <torsten.schenk@zoho.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: 6fire: Fix undefined behavior bug in struct
 midi_runtime
In-Reply-To: <ZRb2CKHuaCu0u38i@work>
References: <ZRb2CKHuaCu0u38i@work>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4IABE7QDOABUGJQ7XLZ7T3IPG4ARXK7Y
X-Message-ID-Hash: 4IABE7QDOABUGJQ7XLZ7T3IPG4ARXK7Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IABE7QDOABUGJQ7XLZ7T3IPG4ARXK7Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Sep 2023 18:06:32 +0200,
Gustavo A. R. Silva wrote:
> 
> `struct urb` is a flexible structure, which means that it contains a
> flexible-array member at the bottom. This could potentially lead to an
> overwrite of the objects following `out_urb` in `struct midi_runtime`,
> among them a function pointer.
> 
> Fix this by placing the declaration of object `out_urb` at the end of
> `struct midi_runtime`.
> 
> Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

The same question as your another 6fire patch is applied here: does it
"fix" anything real?


thanks,

Takashi

> ---
>  sound/usb/6fire/midi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/6fire/midi.h b/sound/usb/6fire/midi.h
> index 47640c845903..df3f41913274 100644
> --- a/sound/usb/6fire/midi.h
> +++ b/sound/usb/6fire/midi.h
> @@ -22,12 +22,12 @@ struct midi_runtime {
>  	spinlock_t in_lock;
>  	spinlock_t out_lock;
>  	struct snd_rawmidi_substream *out;
> -	struct urb out_urb;
>  	u8 out_serial; /* serial number of out packet */
>  	u8 *out_buffer;
>  	int buffer_offset;
>  
>  	void (*in_received)(struct midi_runtime *rt, u8 *data, int length);
> +	struct urb out_urb;
>  };
>  
>  int usb6fire_midi_init(struct sfire_chip *chip);
> -- 
> 2.34.1
> 
