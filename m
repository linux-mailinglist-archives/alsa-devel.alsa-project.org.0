Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBC778694E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 10:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1D68845;
	Thu, 24 Aug 2023 10:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1D68845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692864221;
	bh=Tk3SzK9POptDHM2WiGwOJDi/geE4JyrH9kneuA/ExzQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uLNEV7I/UN8rOSbUfwhrNtN1PQw15ydbwMt5WuJLBuGzlwhsocz25RB7R+oNfEe98
	 frA6imxsIFXC3ZsN24mUtQVoYLaQfs+fUgMC719cpAuZtU1+o+pw4f7qFtRMBMpvMB
	 8wlNJs7JUrzuQQMIm/9smhqYfQxQHl1Im+4boX4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FD0CF804F3; Thu, 24 Aug 2023 10:02:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC7DF800F5;
	Thu, 24 Aug 2023 10:02:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03447F80158; Thu, 24 Aug 2023 10:02:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A9663F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 10:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9663F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Gvwnhig+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jZqh7G0O
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2C7722214B;
	Thu, 24 Aug 2023 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692864165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OiPVHqqVfJrxrNZ8ndJG8ZGc9PmvqzmtT2i2dfcnAQ=;
	b=Gvwnhig+SBDAc1PYubpSurfDgIaeqmgEyBccf9zKzfaLSccRCVDuszW/nPqV8AbhB6F5Kh
	TIt3So1DUFONHRQJGC/2VgzykZ60eJJ286pGXGE04WhCAI0R49nnbLE86XEPwuBK/QXfJ5
	yJWYGRpRDqi84/uOPYS589yMFfJcRU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692864165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OiPVHqqVfJrxrNZ8ndJG8ZGc9PmvqzmtT2i2dfcnAQ=;
	b=jZqh7G0OWXfcGuzeG/fH/O81ELED3/6cmEyaXF1c9lcgooTuPeV9dEIb0twnUcS823nQMB
	lfuUufnpF+zeq8CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2E63139BC;
	Thu, 24 Aug 2023 08:02:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HNbINaQO52QZMgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 24 Aug 2023 08:02:44 +0000
Date: Thu, 24 Aug 2023 10:02:44 +0200
Message-ID: <87cyzcc1gb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Su Hui <suhui@nfschina.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	perex@perex.cz,
	tiwai@suse.com,
	arnd@arndb.de,
	robert.jarzmik@free.fr,
	yangyingliang@huawei.com,
	maciej.szmigiero@oracle.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: ac97: Fix possible error value of *rac97
In-Reply-To: <ddc14926-45d8-9b20-9523-0fb6afa499b3@wanadoo.fr>
References: <20230823025212.1000961-1-suhui@nfschina.com>
	<ddc14926-45d8-9b20-9523-0fb6afa499b3@wanadoo.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MNWTPVLB436MBOLI2TE67VMG7EP72GCI
X-Message-ID-Hash: MNWTPVLB436MBOLI2TE67VMG7EP72GCI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNWTPVLB436MBOLI2TE67VMG7EP72GCI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 19:20:49 +0200,
Christophe JAILLET wrote:
> 
> Le 23/08/2023 à 04:52, Su Hui a écrit :
> > Before committing 79597c8bf64c, *rac97 always be NULL if there is
> > an error. When error happens, make sure *rac97 is NULL is safer.
> > 
> > For examble, in snd_vortex_mixer():
> > 	err = snd_ac97_mixer(pbus, &ac97, &vortex->codec);
> > 	vortex->isquad = ((vortex->codec == NULL) ?
> > 		0 : (vortex->codec->ext_id&0x80));
> > If error happened but vortex->codec isn't NULL, this may cause some
> > problems.
> > 
> > Move the judgement order to be clearer and better.
> > 
> > Fixes: 79597c8bf64c ("ALSA: ac97: Fix possible NULL dereference in snd_ac97_mixer")
> > Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >   sound/pci/ac97/ac97_codec.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
> > index 80a65b8ad7b9..25f93e56cfc7 100644
> > --- a/sound/pci/ac97/ac97_codec.c
> > +++ b/sound/pci/ac97/ac97_codec.c
> > @@ -2069,10 +2069,9 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
> >   		.dev_disconnect =	snd_ac97_dev_disconnect,
> >   	};
> >   -	if (!rac97)
> > -		return -EINVAL;
> > -	if (snd_BUG_ON(!bus || !template))
> > +	if (snd_BUG_ON(!bus || !template || !rac97))
> >   		return -EINVAL;
> > +	*rac97 = NULL;
> >   	if (snd_BUG_ON(template->num >= 4))
> >   		return -EINVAL;
> >   	if (bus->codec[template->num])
> 
> FWIW,
> 
> Acked-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied now, thanks.


Takashi
