Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D208942A71
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 11:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 103162CA1;
	Wed, 31 Jul 2024 11:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 103162CA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722418077;
	bh=ki6ynyq1K3GiYEWr555tPBFYiIsLtZZZITs0RA6gtu8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nE8d7b0xJNzmpeCVxJkeD/sMuw2TYa6GUy1G4ZuRZAOOlNgX+ruxbt4mvtuWjPxi2
	 IMjmCq0X/gI4sMCEkZ4P3/bqhHr1T32ON6uHRIrA7K9CifESIR3syPSyKDNtxbWyAH
	 rH1Nbetzs1s+WdkKvead/RKHWryZ+BL1bgiQyyTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15B2AF80589; Wed, 31 Jul 2024 11:27:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDD3F80448;
	Wed, 31 Jul 2024 11:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6BDBF802DB; Wed, 31 Jul 2024 11:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABEEDF800C9
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 11:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABEEDF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OyM+tgQJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9C5DQH+i;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=OyM+tgQJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9C5DQH+i
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFF571F831;
	Wed, 31 Jul 2024 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722417961;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y0RuoBTKejJw8A2qOIa20poqgXyklQmOci+V7fYPZeM=;
	b=OyM+tgQJxwZ78MKkeIFzR6tZwxIuPKlSe4ePtP0DD8HZSvABF8f/pBW9G98+ydjBKdEHxm
	YgClafz1nvfNfPNWFYhUafPZ5ebR0pFjpF+f9O8Y9PY+N2w5wCkVXr7HhXJEHtdULaD2A+
	6b4z1ethubNwSBVgzirx/lblJ4y5wxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722417961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y0RuoBTKejJw8A2qOIa20poqgXyklQmOci+V7fYPZeM=;
	b=9C5DQH+i4wBbVNoaN5PNUbJQFOAf1y51bu7QCJ0YalGNG/ZY8PAyVRQ5o86GSif/ZI2WXJ
	9xEzWBdxWMhuOdBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722417961;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y0RuoBTKejJw8A2qOIa20poqgXyklQmOci+V7fYPZeM=;
	b=OyM+tgQJxwZ78MKkeIFzR6tZwxIuPKlSe4ePtP0DD8HZSvABF8f/pBW9G98+ydjBKdEHxm
	YgClafz1nvfNfPNWFYhUafPZ5ebR0pFjpF+f9O8Y9PY+N2w5wCkVXr7HhXJEHtdULaD2A+
	6b4z1ethubNwSBVgzirx/lblJ4y5wxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722417961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y0RuoBTKejJw8A2qOIa20poqgXyklQmOci+V7fYPZeM=;
	b=9C5DQH+i4wBbVNoaN5PNUbJQFOAf1y51bu7QCJ0YalGNG/ZY8PAyVRQ5o86GSif/ZI2WXJ
	9xEzWBdxWMhuOdBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B61861368F;
	Wed, 31 Jul 2024 09:26:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +oojKykDqmbQGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 09:26:01 +0000
Date: Wed, 31 Jul 2024 11:26:38 +0200
Message-ID: <87h6c5zzch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH][LINUX][ALSA][USB AUDIO CLASS 1] wrong channel ids for
 surround
In-Reply-To: <ZqIyJD8lhd8hFhlC@freedom>
References: <ZqIyJD8lhd8hFhlC@freedom>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: U6GGA5JIPQLVWXGX2MQSAS6IQZRAGTO3
X-Message-ID-Hash: U6GGA5JIPQLVWXGX2MQSAS6IQZRAGTO3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6GGA5JIPQLVWXGX2MQSAS6IQZRAGTO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jul 2024 13:08:20 +0200,
Sylvain BERTRAND wrote:
> 
> Hi,
> 
> In the USB audio class 1 specifications, page 33 (3.7.2.3 Audio Channel Cluster Format):
> 
> Surround is spatially defined as [rear], hence left surround should be SNDRV_CHMAP_RL and not SND_CHMAP_SL (Side).
> Same for right surround channel.
> 
> Right?

Yes, this looks rather like a typo, SL/SR appear twice there.

> 
> I am not a mailing list subscriber, CC me please.
> 
> regards,

Could you submit a properly formatted patch (with a patch description
and your Signed-off-by tag) to linux-sound ML
(linux-sound@vger.kernel.org) instead?


thanks,

Takashi


> 
> -- 
> Sylvain BERTRAND
> 
> 
> --- a/sound/usb/stream.c
> +++ b/sound/usb/stream.c
> @@ -244,8 +244,8 @@ static struct snd_pcm_chmap_elem *convert_chmap(int channels, unsigned int bits,
>  		SNDRV_CHMAP_FR,		/* right front */
>  		SNDRV_CHMAP_FC,		/* center front */
>  		SNDRV_CHMAP_LFE,	/* LFE */
> -		SNDRV_CHMAP_SL,		/* left surround */
> -		SNDRV_CHMAP_SR,		/* right surround */
> +		SNDRV_CHMAP_RL,		/* left surround */
> +		SNDRV_CHMAP_RR,		/* right surround */
>  		SNDRV_CHMAP_FLC,	/* left of center */
>  		SNDRV_CHMAP_FRC,	/* right of center */
>  		SNDRV_CHMAP_RC,		/* surround */
> 
