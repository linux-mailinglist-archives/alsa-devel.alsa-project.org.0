Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE1572F45C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 08:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9982D822;
	Wed, 14 Jun 2023 08:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9982D822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686722499;
	bh=73LmXuqFciWWc1iCze5o36cRzap2z09zoCv1utU2YzY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TMAjj+/O9PqR/lMBeG0d4W0y6ww9cr7Aj8T0wP+z8Nui2poGGySUwb+l5Rrq8OkyE
	 yRC+opLBiVsFfjCOZBkiwpA5yCcVnFYI2jaliaJN2clvuHnOl2zfFsv35w2Y+uRoKR
	 ZRKtf6BYkDvt5HYfQhv9Y4Nc538KUmZt2DxXK1T4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C69AF80246; Wed, 14 Jun 2023 08:00:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E5AF80132;
	Wed, 14 Jun 2023 08:00:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5380CF80149; Wed, 14 Jun 2023 07:56:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B58BF800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 07:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B58BF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bzBloQLA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ha8E1ZTm
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 427172250C;
	Wed, 14 Jun 2023 05:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686722180;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=geObxz8Ir0kENPOmj8FusLWNQEZG6IM3PHxh2vZfFwk=;
	b=bzBloQLAA5gr4c9KZLeJMWlrHR1ueIHUvCkOe2+nYJVfOG5XgWkaagskPklRz6RARLmyjg
	eAGnvSmNSpZm6FxcphK3zDRWb5ZSJmWhi8pzFGLmOalr3IvnhTnFnNWiznBaF/Wv0sPmhw
	3qTzUPiWqMfj6miCxxrue37jPCwtA9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686722180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=geObxz8Ir0kENPOmj8FusLWNQEZG6IM3PHxh2vZfFwk=;
	b=Ha8E1ZTmNnM2le8dwe9okwlYwHEngT2eWKPRKt6n2yi5uEVbyTm0vY63sd25GmsIdgzF57
	LwRn3O+PnBwOY1Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 164D01391E;
	Wed, 14 Jun 2023 05:56:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ltN1BIRWiWTwcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 14 Jun 2023 05:56:20 +0000
Date: Wed, 14 Jun 2023 07:56:19 +0200
Message-ID: <87zg52bn98.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
In-Reply-To: <34b7d114-af69-459e-8a22-2a93a1e43e94@sirena.org.uk>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
	<87v8fua1qm.wl-tiwai@suse.de>
	<877cs7g6f1.wl-tiwai@suse.de>
	<e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
	<87v8frcueb.wl-tiwai@suse.de>
	<60f70667-16b0-4071-aa0f-a83e43bbf2a0@sirena.org.uk>
	<87a5x3cp9r.wl-tiwai@suse.de>
	<18bcfcba-a6ce-4595-bd2b-4d4ba761fd58@sirena.org.uk>
	<874jnbcmy6.wl-tiwai@suse.de>
	<34b7d114-af69-459e-8a22-2a93a1e43e94@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: COF3WB7RINCAK7H2QI6JFI35SP7XVLLO
X-Message-ID-Hash: COF3WB7RINCAK7H2QI6JFI35SP7XVLLO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COF3WB7RINCAK7H2QI6JFI35SP7XVLLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 19:29:19 +0200,
Mark Brown wrote:
> 
> On Tue, Jun 13, 2023 at 07:05:21PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > > Oh, I'm afraid that we're seeing different things.  The code there is
> > > > rather to *set* some initial value for each amp register (but only
> > > > once), and it's not about optimization for writing a same value
> > > > again.
> 
> > > > That is, the function helps to set an initial (mute) value on each amp
> > > > when the driver parses the topology and finds an amp.  But if the
> > > > driver already has parsed this amp beforehand by other paths, it skips
> > > > the initialization, as the other path may have already unmuted the
> > > > amp.
> 
> > > So it is possible that we might set two distinct values during setup
> > > then and we're doing this intentionally?  It's not obvious that this
> > > might happen.  A comment wouldn't hurt, and a big part of this is
> > > confusing is that in the non-regmap case all we're doing is suppressing
> > > duplicate writes, in that path it's just checking for changes in the
> > > register value.
> 
> > > None of this is what the non-regmap path does, it just suppresses noop
> > > writes to the hardware.
> 
> > Actually, many of HD-audio codec driver code heavily relies on the
> > regmap, more or less mandatory.  The snd_hda_codec_amp_init() is one
> > of such.  You may write a codec driver without the regmap, but some
> > helpers won't work as expected.
> 
> Sounds like it might be so thinly used it's becoming mandatory to have a
> regmap in order to avoid gotchas like there might be with things getting
> muted?

It's rather historical reasons.  The caching mechanism was already
present and mandatory from the beginning, but it was implemented in a
different way.  Later on, it was translated to the regmap.  Meanwhile,
we generalized the HD-audio codec driver to be on a generic HD-audio
bus, and this allowed the use without regmap.  So some basic helpers
are designed to work without regmap but some are still tightly tied
with regmap.


Takashi
