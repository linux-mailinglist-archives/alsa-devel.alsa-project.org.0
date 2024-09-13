Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4B97792B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 09:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD1CFB71;
	Fri, 13 Sep 2024 09:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD1CFB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726211659;
	bh=nmAZJOs4/YfAaOhJG+M49fu8a38aloU1FmK3w4Rqal8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M125luOUVji0DnUVQlWi11JMX/dJTM0cUjTunL4m25+UhGQ2yzfRbRhwatOUbC4GS
	 NN2/uQlAqevx2y0qq60XPF/YIBBgJJsi3zPcLRnke1+LdqgJBHpVkKTVJ2rDI2GWZv
	 uBbB6GnvEsYjgXIVRd+a9twOsbXl+49FAyAox/dQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CB67F805A1; Fri, 13 Sep 2024 09:13:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B726F805B1;
	Fri, 13 Sep 2024 09:13:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 935E4F801F5; Fri, 13 Sep 2024 09:13:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA1E9F800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 09:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA1E9F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NEG2wpMg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hZWGsOvU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=NEG2wpMg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hZWGsOvU
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE947219E5;
	Fri, 13 Sep 2024 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726211618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+Xpcc2JM6j8Pae6K6gMiCTE8w6aCep62s/t0UF2vKk=;
	b=NEG2wpMgpEgxzAIjz1/2Dl97scV6fQSQodF7prAZ2Z1M3MVlJRHsJDWqtFOFYCmkjfnAcP
	jmRlFDZetfjWZohnJDuJPBT8Ujo6x3qDQcdK9jtyenxOID9IlogaMedmZa1+LpNnitnCSu
	x4fHUta4qBsP4qySaizJeIJN78i3EVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726211618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+Xpcc2JM6j8Pae6K6gMiCTE8w6aCep62s/t0UF2vKk=;
	b=hZWGsOvUVg70G6Nriy360HtR6B5FExsmXyUrP9DT+PflX4WbddTW2zDiw3/WUf1hfumVNr
	HuV27Gr7ew6kBdDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726211618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+Xpcc2JM6j8Pae6K6gMiCTE8w6aCep62s/t0UF2vKk=;
	b=NEG2wpMgpEgxzAIjz1/2Dl97scV6fQSQodF7prAZ2Z1M3MVlJRHsJDWqtFOFYCmkjfnAcP
	jmRlFDZetfjWZohnJDuJPBT8Ujo6x3qDQcdK9jtyenxOID9IlogaMedmZa1+LpNnitnCSu
	x4fHUta4qBsP4qySaizJeIJN78i3EVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726211618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+Xpcc2JM6j8Pae6K6gMiCTE8w6aCep62s/t0UF2vKk=;
	b=hZWGsOvUVg70G6Nriy360HtR6B5FExsmXyUrP9DT+PflX4WbddTW2zDiw3/WUf1hfumVNr
	HuV27Gr7ew6kBdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EB8F13A73;
	Fri, 13 Sep 2024 07:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eRlPHSLm42ZrJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Sep 2024 07:13:38 +0000
Date: Fri, 13 Sep 2024 09:14:27 +0200
Message-ID: <87wmjgdnzg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-USB <linux-usb@vger.kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg KH <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
In-Reply-To: <87ed5o8hen.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
	<d6e47194-a708-4dfe-96c8-aba9391e4496@perex.cz>
	<46b37ef3-047c-4b1b-a79b-37187a46754a@sirena.org.uk>
	<87ed5o8hen.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: AG3DEGD3NK3MJHHLZ2JZDB7LZ2ZL3QMB
X-Message-ID-Hash: AG3DEGD3NK3MJHHLZ2JZDB7LZ2ZL3QMB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AG3DEGD3NK3MJHHLZ2JZDB7LZ2ZL3QMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Sep 2024 03:35:28 +0200,
Kuninori Morimoto wrote:
> 
> 
> Hi Takashi, Mark, Jaroslav
> 
> This is the reply for very old patch (almost 2 month ago).
> 
> > > > Many drivers are using below code to know the Sound direction.
> > 
> > > > 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> > 
> > > > This patch-set add snd_pcm_is_playback/capture() macro to handle it.
> > 
> > > NAK from my side (overdesign, no improved readability). The defines
> > > (SNDRV_PCM_STREAM_*) are enough to check the stream type value correctly.
> > 
> > I have to say I do remember this being a little bit of a confusing idiom
> > when I first stated looking at ALSA stuff, especially for capture only
> > cases.
> 
> This patch-set got both Ack and Nack.
> I wonder can I re-post this after merge-window again ?
> I'm asking because this is very huge patch-set.

If we get a NACK for this kind of cleanups, it's rather negative.
Unless its' a mandatory preliminary change for other upcoming stuff,
I don't think it's worth to work on this further. 


thanks,

Takashi
