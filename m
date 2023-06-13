Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16272E78C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 17:45:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72425E80;
	Tue, 13 Jun 2023 17:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72425E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686671104;
	bh=i0RJ3VSKb992wDqFOZOJMBKvuMVVx2GiVJivO+ZWzYk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WueneGmu2N22hwtgGeC2ElTOG3nmteAXqQwW26b7hAIC8hcFCqB9yeAP1sCQzfO1h
	 9fJyYw5PDkEQPJT3uyYbu9OQhjxQ6HGAFYBSkWZoM0KxvZoxYSzuRgLmyb4R0zLpyP
	 aB73hPSBvvZWityp6OnUV1AZzyBz2T7zyHSQ+i0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E518AF800ED; Tue, 13 Jun 2023 17:44:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F78F80132;
	Tue, 13 Jun 2023 17:44:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABFA3F80149; Tue, 13 Jun 2023 17:44:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 11661F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 17:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11661F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JHtU5o7H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Yocbxb34
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2844522372;
	Tue, 13 Jun 2023 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686671039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cJgLjzEeK+vThRWT6EODiux5F+ytPQSr+WhGtvRA/Ak=;
	b=JHtU5o7HA6vTwfzI2u6t1xumAPwJxweiT9kcw6Aa+J6PtacGVHL9EzGhy3hKWHfnMyoUEj
	A88uiXkFOknkw20y02h3kpC0fcQCBjpvTUKrneFaRexw0r9Ic1AmPmRzfaEOnsy00z39jy
	M80gLj6btyXZyws/BXZBK7RfDVZ5iM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686671039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cJgLjzEeK+vThRWT6EODiux5F+ytPQSr+WhGtvRA/Ak=;
	b=Yocbxb34u1Cn7OVV6NVR2qsxXlasHLaJHV+vT8tQARhZpInp+4Eb0tDyZ1Pr/MyVxHpiOH
	O+sNdYbpI8ajA+Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A93013483;
	Tue, 13 Jun 2023 15:43:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DoKzAb+OiGQ5KQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 15:43:59 +0000
Date: Tue, 13 Jun 2023 17:43:58 +0200
Message-ID: <87fs6vcqpt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
In-Reply-To: <ZIiJ9zzwgvQHyrW9@ugly>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
	<20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
	<87v8fren1k.wl-tiwai@suse.de>
	<ZIhKe99WGpLFN1ld@ugly>
	<87edmfei0o.wl-tiwai@suse.de>
	<ZIh2gp/I4ot326KP@ugly>
	<871qife9ga.wl-tiwai@suse.de>
	<ZIiJ9zzwgvQHyrW9@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: DJ57NOHJF4PV4FM7THSSMGAJIT7XMPYC
X-Message-ID-Hash: DJ57NOHJF4PV4FM7THSSMGAJIT7XMPYC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJ57NOHJF4PV4FM7THSSMGAJIT7XMPYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 17:23:35 +0200,
Oswald Buddenhagen wrote:
> 
> On Tue, Jun 13, 2023 at 04:13:57PM +0200, Takashi Iwai wrote:
> > On Tue, 13 Jun 2023 16:00:34 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> On Tue, Jun 13, 2023 at 01:08:55PM +0200, Takashi Iwai wrote:
> >> > Hmm I don't get it; if an application just toggles the kctl value
> >> > between two values in an infinite loop, it'll delete and recreate
> >> > kctls endlessly as well with your patch, no?
> >> > yeah, but why should it toggle just so? it's not reasonable to do
> >> that. 
> > 
> > I'm arguing about a malicious or buggy applications.  Don't ask logics
> > or conscience behind it.
> > 
> yes, that was exactly the point of the sentence you cut away. it can
> be broken in any number of "creative" ways. there is absolutely no
> point in trying to prevent that.

We need to give our best to protect from malicious behavior.

> the notion of "malicious" is meaningless in this context. a valid
> attack vector would allow the application to do something that i
> cannot do otherwise. hogging a cpu thread while flooding the system
> with meaningless ioctls is something an app can do regardless, so
> whatever.

Adding/deleting kctl increases the numid.  It grows and grows.

> >> >> also, i don't think that disabling would be fundamentally different
> >> >> from deleting: the particular code paths taken are somewhat different,
> >> >> but the high-level view is essentially the same. so we can't really
> >> >> make predictions which one would work better.
> >> > > Creating and deleting needs a lot of different works and much
> >> heavier
> >> > tasks.
> >> > it's entirely plausible that an application would tear down
> >> structures
> >> in response to controls being disabled, too.
> > 
> > But it's less dangerous.
> > 
> if the app does mostly the same in both cases, then obviously neither
> one is any less dangerous than the other one.
> 
> there is also the opposite angle to this, which makes it an own goal
> for you: if the app did in fact respond to the elements being disabled
> by merely disabling them in the user interface, then having the
> currently inactive (but superficially identical) controls at all times
> would contribute to a rather horrible user experience. so for this
> reason alone it's better to actually delete the inapplicable set of
> controls.

Crashing an existing application is the worst-case scenario.

> >> > And, above all, many user-space programs will be borked if an
> >> > element goes away, simply crashing.  Some (rather rare) nice ones will
> >> > still survive, though.  I've learned this from the past.
> >> > yeah, but why should we care? it's not a regression when
> >> something new
> >> doesn't work with some crappy pre-existing code.
> > 
> > We can't break user-space.  That's a rule set in stone.
> > 
> that rule means that we may not cause regressions, which we would not.
> 
> > Well, then another, maybe foremost reason: you can't create / delete
> > kctls from the callback, simply because the callbacks are called in
> > the read lock.  Adding / deleting an element may crash the another
> > concurrent task that traverses the list.
> > 
> that would indeed be a problem, but fortunately the put() callback is
> nowadays invoked with a write lock (see also commit 06405d8ee).

Oh well, that's really not a change to be advertised for creating /
deleting kctls from the put callback at all.

Sorry, but my answer is same: NO.  I see no reason why kctl deletion
and creation _must_ be implemented _inevitably_ in that way.

We need a different implementation, some middle ground one.

> also, please go back to the first paragraph of the commit message of
> patch 5 in the series.

Actually, snd_ctl_remove() should be changed back to a version that
takes the lock by itself instead.  There is no reason to have a helper
without the lock called from leaf drivers.

IOW, ideally, the drivers shouldn't need to mimic with card rwsem.


Takashi
