Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B272F500
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 08:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D2C825;
	Wed, 14 Jun 2023 08:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D2C825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686724681;
	bh=Q4hmFOhAXV43svV+vLN8Sz77mc3edL6y41lkLREnB04=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kgOcweXf4vG8YLyK88BC+DEQkASZz4r89Zif6/oXclLMpIq2/RL7iIO5hBxLePddT
	 nDTjpsjbl7ov1yX+g42b7/1essDfcDD8FtdaEZw6ZfBWPmoip5CwW40NUkG/Wa4vd3
	 NJ0vCgJXHkaKxZR1Bb5ehyksVyR2SxAE52h2v3Lg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E646F800BA; Wed, 14 Jun 2023 08:37:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14800F80132;
	Wed, 14 Jun 2023 08:37:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D13E9F80149; Wed, 14 Jun 2023 08:37:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 744E6F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 08:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 744E6F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=m472kBD6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LSxahLaY
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B6B6E1FDD4;
	Wed, 14 Jun 2023 06:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686724607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RZ/cz5E+sw8n1GEbXp0lXgSgnDMvreyDQhOM6AC6G/Q=;
	b=m472kBD6DDTGW84daC0JhwQTN2HiTEBGmnx4AtC6FKrn2aD4wvOMgjVeP4Xgg4C6gRRSOt
	Ko+h54hxsj37s8mqYwlTML1P4SWpfSzpQMlLKluS+CppeMZ1Bx1HZ0Qj34rhIRk8w6oqqb
	9VTYMdZkRx51Y1BDxitvoQsnVJWJRmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686724607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RZ/cz5E+sw8n1GEbXp0lXgSgnDMvreyDQhOM6AC6G/Q=;
	b=LSxahLaY5Gys/0gHtQgrq+Ka8o6XLm5smkx519IF1PKTrnhEce6SeGx4SBHWMWPSrJ2cKN
	2YJKzuHVrBe8c3Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 944FB1357F;
	Wed, 14 Jun 2023 06:36:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sGE/I/9fiWQIAwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 14 Jun 2023 06:36:47 +0000
Date: Wed, 14 Jun 2023 08:36:47 +0200
Message-ID: <87sfaublds.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
In-Reply-To: <ZIij6mdc1utyBD93@ugly>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
	<20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
	<87v8fren1k.wl-tiwai@suse.de>
	<ZIhKe99WGpLFN1ld@ugly>
	<87edmfei0o.wl-tiwai@suse.de>
	<ZIh2gp/I4ot326KP@ugly>
	<871qife9ga.wl-tiwai@suse.de>
	<ZIiJ9zzwgvQHyrW9@ugly>
	<87fs6vcqpt.wl-tiwai@suse.de>
	<ZIij6mdc1utyBD93@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JIKY3NYJNR4TD22RUD5PDQSKWAKT32BG
X-Message-ID-Hash: JIKY3NYJNR4TD22RUD5PDQSKWAKT32BG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JIKY3NYJNR4TD22RUD5PDQSKWAKT32BG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 19:14:18 +0200,
Oswald Buddenhagen wrote:
> 
> On Tue, Jun 13, 2023 at 05:43:58PM +0200, Takashi Iwai wrote:
> >> the notion of "malicious" is meaningless in this context. a valid
> >> attack vector would allow the application to do something that i
> >> cannot do otherwise. hogging a cpu thread while flooding the system
> >> with meaningless ioctls is something an app can do regardless, so
> >> whatever.
> > 
> > Adding/deleting kctl increases the numid.  It grows and grows.
> > 
> as the code handles numid wraparound just fine, that would be a rather
> pointless attack.
> 
> > Crashing an existing application is the worst-case scenario.
> > 
> a new driver (which this effectively is) crashing a broken application
> is perfectly legitimate, as it doesn't affect any existing users.

No, you can't ignore it.

> >> that would indeed be a problem, but fortunately the put() callback is
> >> nowadays invoked with a write lock (see also commit 06405d8ee).
> > 
> > Oh well, that's really not a change to be advertised for creating /
> > deleting kctls from the put callback at all.
> > 
> and? it's done, and it's basically impossible to revert. so we may
> reap its full benefits just as well, as i did in that previous commit.

Well, I can revert your commit, too...
Basically the content protection shouldn't be covered by this rwsem.
It's rather a misuse.

> > Sorry, but my answer is same: NO.  I see no reason why kctl deletion
> > and creation _must_ be implemented _inevitably_ in that way.
> > 
> being the most straight-forward way to implement it certainly
> qualifies as a good reason for doing it that way.
> and i still see no convincing reason why it shouldn't.

I still see no convincing reason why it must be done so, either.
The way you're trying to implement is an anti-pattern, not seen in
other drivers that have been developed over decades.

> > Actually, snd_ctl_remove() should be changed back to a version that
> > takes the lock by itself instead.  There is no reason to have a helper
> > without the lock called from leaf drivers.
> > 
> well, except that this driver shows that there _is_ a reason. one may
> choose to throw stones in one's own way, but that's rarely a wise
> decision ...

The fact that it has to take a rwsem from the caller side itself is a
very bad design, and it should be corrected at best.  The rwsem there
is rather an internal stuff and shouldn't be taken explicitly.  Most
of its use outside control.c is an abuse.


Takashi
