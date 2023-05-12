Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6020F700131
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 09:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61961DF;
	Fri, 12 May 2023 09:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61961DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683875805;
	bh=hnf1rLMSanQeXaGbQedCYcmao3q2xxqmFby+r3ue480=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vt4m/544qKcAhcz8Z4hjuvscQ5MfsVciBN+O2bDSjZq/dsympawVbommnP0Q++uAu
	 HNNKgz5oHnevuN0xb9MpW2ymmivzOZ98CDbBILiGUoUnW4hipNKZIkhkrowoF+g8JA
	 8zjoaLi9ADcgwA4YMkz0hWveX8IHWd1brY176I4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 708EEF80549; Fri, 12 May 2023 09:15:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1401DF8032D;
	Fri, 12 May 2023 09:15:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66D2BF8052E; Fri, 12 May 2023 09:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B318F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 09:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B318F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Qng4xUqg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jizG6Hak
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 19B682262C;
	Fri, 12 May 2023 07:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683875718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h6FDrCBsyryTzTNsuKuFw9nrvEssA9gx7b/rsGOr+Ko=;
	b=Qng4xUqgYmVw0lScynMKaPZx72xPcStMsfL5ORdlw5sOgR8Gyd5bMr8MhSUkq0ME9XbtkM
	LHikvMGMdBR6jQVBNvZCJ89SOnj7cQotC/WeVhQ1zSmgp+QUIjXksk8JLkVdjZv9+h9+iF
	RirWcU2fvEkHlXTVZpl7lKI3by92FAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683875718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h6FDrCBsyryTzTNsuKuFw9nrvEssA9gx7b/rsGOr+Ko=;
	b=jizG6Hak+5hD6j1oJoi3vnPIBIzEwKifN5o9zCQWsMfgTNqk4c3XTTqJA7vGP4NmCnZYGj
	FCLxW5GGaYlTtECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED90413499;
	Fri, 12 May 2023 07:15:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ygJqOIXnXWSTfQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 12 May 2023 07:15:17 +0000
Date: Fri, 12 May 2023 09:15:17 +0200
Message-ID: <87a5yaaum2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 07/14] ALSA: emu10k1: properly assert DSP init constraints
In-Reply-To: <20230510173917.3073107-8-oswald.buddenhagen@gmx.de>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
	<20230510173917.3073107-8-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OYBOKFJAMH7EATLXHN4UUYDETJUFFL7P
X-Message-ID-Hash: OYBOKFJAMH7EATLXHN4UUYDETJUFFL7P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYBOKFJAMH7EATLXHN4UUYDETJUFFL7P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 May 2023 19:39:10 +0200,
Oswald Buddenhagen wrote:
> 
> If these are hit, we've already trashed kernel memory by writing past
> the end of the allocated buffer. There is no recovery from that.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> ---
> v2:
> - slightly more verbose description

Again, this is NAK.  First of all, if we really do care the overflow
seriously, we should check at each increment instead of after
breakage.  It shouldn't be too difficult at all.

Second, using BUG_ON() like this case is an overkill.  It was clearly
stated by Linus in the past a few times (although I can't find the
source right now).


thanks,

Takashi

> ---
>  sound/pci/emu10k1/emufx.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
> index 2da1f9f1fb5a..5ae275d87c59 100644
> --- a/sound/pci/emu10k1/emufx.c
> +++ b/sound/pci/emu10k1/emufx.c
> @@ -1668,22 +1668,19 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
>  	 * ok, set up done..
>  	 */
>  
> -	if (gpr > tmp) {
> -		snd_BUG();
> -		err = -EIO;
> -		goto __err;
> -	}
> +	BUG_ON(gpr > tmp);
> +	BUG_ON(nctl > SND_EMU10K1_GPR_CONTROLS);
> +
>  	/* clear remaining instruction memory */
>  	while (ptr < 0x400)
>  		A_OP(icode, &ptr, 0x0f, 0xc0, 0xc0, 0xcf, 0xc0);
>  
>  	icode->gpr_add_control_count = nctl;
>  	icode->gpr_add_controls = controls;
>  	emu->support_tlv = 1; /* support TLV */
>  	err = snd_emu10k1_icode_poke(emu, icode, true);
>  	emu->support_tlv = 0; /* clear again */
>  
> -__err:
>  	kfree(controls);
>  __err_ctrls:
>  	kfree(icode->gpr_map);
> @@ -2272,16 +2269,8 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
>  	}
>  	    
>  
> -	if (gpr > tmp) {
> -		snd_BUG();
> -		err = -EIO;
> -		goto __err;
> -	}
> -	if (i > SND_EMU10K1_GPR_CONTROLS) {
> -		snd_BUG();
> -		err = -EIO;
> -		goto __err;
> -	}
> +	BUG_ON(gpr > tmp);
> +	BUG_ON(i > SND_EMU10K1_GPR_CONTROLS);
>  	
>  	/* clear remaining instruction memory */
>  	while (ptr < 0x200)
> -- 
> 2.40.0.152.g15d061e6df
> 
