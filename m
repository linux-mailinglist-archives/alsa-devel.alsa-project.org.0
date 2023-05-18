Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0545070844D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDA80201;
	Thu, 18 May 2023 16:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDA80201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684421690;
	bh=x8DYp3uQ741qRr3WmmBMguzX5iSxn3cggrNrksG28L8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T7Fwp08tsX+bHwjpNJfImteo5GPfF4Ujrpthx1CcU+q2gqX3RVQRmiH+IPhD02eK6
	 ORioo9WrC7kWeQI30L39dycrKd3dc+VxMP4M9UPiCSjKbZpZcwkgsoWhtLvdoY9nnI
	 kNC9eDTjnzD/1DQzDCuO4Wd0lcFTZw4KqAOxIoCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6259DF802E8; Thu, 18 May 2023 16:53:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B62BF8025A;
	Thu, 18 May 2023 16:53:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99623F80272; Thu, 18 May 2023 16:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31AA9F8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31AA9F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CseMP5rb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OebB7L2Q
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 97FA222381;
	Thu, 18 May 2023 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684421610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lgoce4+z5zELPyi6jCc3LqMDRs+guxKyDm8IeTrfKIk=;
	b=CseMP5rb4xbyLxcZVkSUKgk26GKqdJAzVum0pqMHsXUC7KkpRQAPqmv7reNLKJOFjBKMNr
	LwOilvRDh+eCYIb3h3D/ebTEaHO1CqbREtm19mQycG7ZOSvFjSrCB5cwndCQH9ihZ5QLfE
	TKMAyR81N3Y6TpSTBjZ74Qma4RZnpZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684421610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lgoce4+z5zELPyi6jCc3LqMDRs+guxKyDm8IeTrfKIk=;
	b=OebB7L2Q2PaTJDca24cltefqNxSNFk4GYVYhaQ1csqgteVmMenKcC4CsTGNefjEG2tTkZs
	smPkyaBYguoYYrAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B68E1390B;
	Thu, 18 May 2023 14:53:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IcpHH+c7ZmRgZgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 18 May 2023 14:53:27 +0000
Date: Thu, 18 May 2023 16:53:19 +0200
Message-ID: <87ttw9hesg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 5/7] ALSA: emu10k1: centralize freeing PCM voices
In-Reply-To: <20230518140947.3725394-6-oswald.buddenhagen@gmx.de>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
	<20230518140947.3725394-6-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QT7KQNDKNYY62WNACG7BGNKQNVOIUVG2
X-Message-ID-Hash: QT7KQNDKNYY62WNACG7BGNKQNVOIUVG2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QT7KQNDKNYY62WNACG7BGNKQNVOIUVG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 16:09:45 +0200,
Oswald Buddenhagen wrote:
> -static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voices)
> +static void snd_emu10k1_pcm_free_voices(struct snd_emu10k1_pcm *epcm)
>  {
> -	int err, i;
> -
> -	for (i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
> +	for (unsigned i = 0; i < ARRAY_SIZE(epcm->voices); i++) {

We don't use this style.  Declare the variable outside the for().

Also, as usual, it'd be still helpful if you show this is merely a
code simplification without any functional change in the commit log.


thanks,

Takashi
