Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCC872E065
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 13:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA2383A;
	Tue, 13 Jun 2023 13:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA2383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686654595;
	bh=vEwa4UHN85rCIVLYjhbPVmwU0ZY3+0sV37CqeHXqzM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BgF72lQFs9B4MQL0hQ4b0/ALxaYLUO0Luk0lZmCbzYOXGbd+eO5SWyrAWfwNJClgm
	 3w3YgAOookmnlRf+w6Nn/Y3XDv4gghZyDpnonvMYOwJIuicTPe6jPzmHbKNiaMOzDm
	 Ux16SK5auvii4OAZ0wclADMCdVi2zkT0ED1Qmi5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24E48F8052E; Tue, 13 Jun 2023 13:09:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FA4EF80132;
	Tue, 13 Jun 2023 13:09:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2824F80149; Tue, 13 Jun 2023 13:09:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43D4EF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 13:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D4EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vUfoIGMh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Z9cw5cy5
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 834D61FD8D;
	Tue, 13 Jun 2023 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686654536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LrIblFdx6VZZWkei3LPgXabdkm1HOw0aPZI09tK7pog=;
	b=vUfoIGMh79e4eAqADpaD1t9o5rVcz6NMu0BzXy6NQbLLkULlHwL5irhFVLRpCnu/nUqVgS
	DDeTZgcSBAP4Y1N27kHLBMmHPZUga8x/euhUVhmfIv/Bnm6NKv9Q0u8ig7XS6JTVJfaJ0Y
	xZ7pfOyrJLOGJ8/6Fqs5JXerBOW99kU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686654536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LrIblFdx6VZZWkei3LPgXabdkm1HOw0aPZI09tK7pog=;
	b=Z9cw5cy5bfHFRIzlahETf5wIB8LPRa1tyjXxHlNvu7iDY/yBY35+AZOzKdjesFdsaAXYZF
	Tc/h8Y8eqcEaUIBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 623AB13483;
	Tue, 13 Jun 2023 11:08:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id w4AGF0hOiGTvCAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 11:08:56 +0000
Date: Tue, 13 Jun 2023 13:08:55 +0200
Message-ID: <87edmfei0o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
In-Reply-To: <ZIhKe99WGpLFN1ld@ugly>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
	<20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
	<87v8fren1k.wl-tiwai@suse.de>
	<ZIhKe99WGpLFN1ld@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5ILRW6S6ULJ354TCEIOE2SIBLIETWUZE
X-Message-ID-Hash: 5ILRW6S6ULJ354TCEIOE2SIBLIETWUZE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ILRW6S6ULJ354TCEIOE2SIBLIETWUZE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 12:52:43 +0200,
Oswald Buddenhagen wrote:
> 
> On Tue, Jun 13, 2023 at 11:20:23AM +0200, Takashi Iwai wrote:
> > On Tue, 13 Jun 2023 09:38:20 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> Notably, add_ctls() now uses snd_ctl_add_locked(), so it doesn't
> >> deadlock when called from snd_emu1010_clock_shift_put(). This also
> >> affects the initial creation of the controls, which is OK, as that is
> >> done before the card is registered, so no concurrent access can occur.
> > 
> > Creating and removing the controls from kctl put callback is no good
> > idea.  In general, dynamic control creation/deletion already confuses
> > user-space.
> > 
> i kind of expected that, but what i've tried so far worked remarkably
> well (ok, it was mostly alsamixer).
> 
> > On top of that, if it's done by a control element, it can
> > be even triggered endlessly by user.
> > 
> it shouldn't, because there is no circularity between the
> controls. even if the app sets all controls as a response to new ones
> appearing, the second round will be a no-op for the multiplier
> control, and therefore causes no new creattion/deletion notifications,
> and thus terminates the recursion.

Hmm I don't get it; if an application just toggles the kctl value
between two values in an infinite loop, it'll delete and recreate
kctls endlessly as well with your patch, no?

> but suppose a sufficiently broken application exists. then causing it
> to fail still seems quite acceptable: this is effectively new hardware
> (the new mode needs to be enabled manually), so it would be simply
> unsupported by the application until that gets fixed.
>
> > A safer approach would be to create controls statically, and set
> > active flag dynamically, I suppose.
> > 
> i wanted to do that, but the problem is that not only the number of
> controls changes, but also the number of enum values in each control,
> as there is no way to make particular enum values inactive.
> and i didn't want to keep three whole sets of controls around at all
> times, as that seems a bit wasteful.
> 
> also, i don't think that disabling would be fundamentally different
> from deleting: the particular code paths taken are somewhat different,
> but the high-level view is essentially the same. so we can't really
> make predictions which one would work better.

Creating and deleting needs a lot of different works and much heavier
tasks.  And, above all, many user-space programs will be borked if an
element goes away, simply crashing.  Some (rather rare) nice ones will
still survive, though.  I've learned this from the past.

> > And, if we really have to create / delete a kctl element from some
> > kctl action, don't do it in the callback but process in another work.
> > 
> would that really improve anything?

As a primary reason, I don't want to expose such a stuff.  If you need
such an unlocked version, you're already doing something very exotic,
and in 99% cases, it's something that needs more care.


Takashi

> for the notification to be
> received before the ioctl returns, it would have to be watched by a
> different thread. but if the app thought that there is a race, it
> would have to take the lock before issuing the ioctl anyway. so i
> think for user space it doesn't matter when exactly the notifications
> are emitted.
> 
> otoh, making the mixer reorganization async would introduce rather
> significant complexity to the driver due to having to deal with ioctls
> that come in while the inconsistent state persists (which seems likely
> during a state restoration).
> 
> so i would _really_ prefer to keep things as they are, and think about
> changing them only once we have hard evidence that the approach is too
> problematic.
> 
> regards,
> ossi
> 
