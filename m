Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C2372E552
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 16:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5938EE11;
	Tue, 13 Jun 2023 16:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5938EE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686665694;
	bh=lnPBdTpl55pmP94wE8TIyIwrUBu+J3MumFcwo7TtZf0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R0J1aw+4stB7pkGTpXDPZOghkUKch9awfKV72HgAM6PLVXSAN1C22e13Mxpa00a/L
	 tBRWGF+6BhLINyTCMbbvwwguk0uk8sdbPpisn6Xcq5dKb3NTVnLyyye/xHNW1kCEEl
	 Z24UsQLujybtARx15BM4JxWsldaep2FZl0CUAdbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA9E4F800ED; Tue, 13 Jun 2023 16:14:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94DD6F80132;
	Tue, 13 Jun 2023 16:14:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6516CF80149; Tue, 13 Jun 2023 16:14:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A972F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 16:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A972F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dYzF1oKG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FqxePpGN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C09541FDB6;
	Tue, 13 Jun 2023 14:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686665637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cZORVhA2dDG0pGsXglZLkvMHcXrmJRZ4mXvqR8t4KXc=;
	b=dYzF1oKGMpHmrJpSnwCv5s9H0mV/4xExhqAK2M0WrPqezg0/Ymjw7xPBCnzUd4P6tSGFeJ
	s2pCi/QmSenrqoSZlc0BZec3qyk/3EqxEVt4GaI8dQx0AK9oeQHAwScI2QUpCSKcjOkfh6
	AU4Nr16KcyLav1rzi3mH9emoJI9Lol4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686665637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cZORVhA2dDG0pGsXglZLkvMHcXrmJRZ4mXvqR8t4KXc=;
	b=FqxePpGNJ6T8rRAlznJvql3mpDXKkGkzDKzW7HGhQQqn0Z6JFrKDkJZLesC735H5PyuIvE
	v1Z2pO+HzpLziMDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A52A813345;
	Tue, 13 Jun 2023 14:13:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id bNBxJ6V5iGTEdQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 14:13:57 +0000
Date: Tue, 13 Jun 2023 16:13:57 +0200
Message-ID: <871qife9ga.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
In-Reply-To: <ZIh2gp/I4ot326KP@ugly>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
	<20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
	<87v8fren1k.wl-tiwai@suse.de>
	<ZIhKe99WGpLFN1ld@ugly>
	<87edmfei0o.wl-tiwai@suse.de>
	<ZIh2gp/I4ot326KP@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HRJA7ESVJGNZZGBUKKUAS5SFCMIT3T3G
X-Message-ID-Hash: HRJA7ESVJGNZZGBUKKUAS5SFCMIT3T3G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRJA7ESVJGNZZGBUKKUAS5SFCMIT3T3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 16:00:34 +0200,
Oswald Buddenhagen wrote:
> 
> On Tue, Jun 13, 2023 at 01:08:55PM +0200, Takashi Iwai wrote:
> > On Tue, 13 Jun 2023 12:52:43 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> On Tue, Jun 13, 2023 at 11:20:23AM +0200, Takashi Iwai wrote:
> >> > Creating and removing the controls from kctl put callback is no >
> >> good
> >> > idea.  In general, dynamic control creation/deletion already confuses
> >> > user-space.
> >> > i kind of expected that, but what i've tried so far worked
> >> remarkably
> >> well (ok, it was mostly alsamixer).
> >> 
> >> > On top of that, if it's done by a control element, it can
> >> > be even triggered endlessly by user.
> >> > it shouldn't, because there is no circularity between the
> >> controls. even if the app sets all controls as a response to new ones
> >> appearing, the second round will be a no-op for the multiplier
> >> control, and therefore causes no new creation/deletion notifications,
> >> and thus terminates the recursion.
> > 
> > Hmm I don't get it; if an application just toggles the kctl value
> > between two values in an infinite loop, it'll delete and recreate
> > kctls endlessly as well with your patch, no?
> > 
> yeah, but why should it toggle just so? it's not reasonable to do
> that. 

I'm arguing about a malicious or buggy applications.  Don't ask logics
or conscience behind it.

> >> also, i don't think that disabling would be fundamentally different
> >> from deleting: the particular code paths taken are somewhat different,
> >> but the high-level view is essentially the same. so we can't really
> >> make predictions which one would work better.
> > 
> > Creating and deleting needs a lot of different works and much heavier
> > tasks.
> > 
> it's entirely plausible that an application would tear down structures
> in response to controls being disabled, too.

But it's less dangerous.

> > And, above all, many user-space programs will be borked if an
> > element goes away, simply crashing.  Some (rather rare) nice ones will
> > still survive, though.  I've learned this from the past.
> > 
> yeah, but why should we care? it's not a regression when something new
> doesn't work with some crappy pre-existing code.

We can't break user-space.  That's a rule set in stone.

> >> > And, if we really have to create / delete a kctl element from some
> >> > kctl action, don't do it in the callback but process in another work.
> >> > would that really improve anything?
> > 
> > As a primary reason, I don't want to expose such a stuff.  If you need
> > such an unlocked version, you're already doing something very exotic,
> > and in 99% cases, it's something that needs more care.
> > 
> i don't see being "exotic" as something to avoid per se. and before
> putting in "more care" i want to see some evidence that there is
> actually a problem that needs to be addressed, in this
> place. esp. when the proposed much more complex alternative hasn't
> been shown to be actually better in relevant ways, even theoretically.

Well, then another, maybe foremost reason: you can't create / delete
kctls from the callback, simply because the callbacks are called in
the read lock.  Adding / deleting an element may crash the another
concurrent task that traverses the list.


Takashi
