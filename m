Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFFB772650
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2692826;
	Mon,  7 Aug 2023 15:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2692826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691415881;
	bh=6TF029ZO5z04ek4pEqYoxpTOGIEkygtQDRY0r0El7mI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G7tV9fKRYpT5izOrxwpfnmJeIEV6SSH1909RpZ+s/adz14XOtyXY6il7Ig+LXWgWG
	 2i/PmKzu6/GldtbrDmIG+K+evr58eWPO1WtvO8m8A5l4VQ4JJ37uVsqMoiSsIUStAn
	 hiEXVfyWLXkVgvJJKNZlUOOKxoS1y+rObBbvWbY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58BEAF8016D; Mon,  7 Aug 2023 15:43:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4DA0F80116;
	Mon,  7 Aug 2023 15:43:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BE76F8016D; Mon,  7 Aug 2023 15:43:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C56E7F8016A
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C56E7F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZjUhhYeZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fNYSs+KG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2779219A3;
	Mon,  7 Aug 2023 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691415813;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPHq/8ReL9SskH7x4QhUjjkD2WsMlbeCGGwCHO/lY2k=;
	b=ZjUhhYeZdQKlzWLWjW9k7P98d00ezI+ZqJxHrkKrLdeFf5qt5Dd5gWM1tCJfnhATrFXpTW
	Py4auRvyTafmACCq8xwtnE9XxC//CuVNuctiHFqvtIZ4Bi7Ib4inwlFCogBjJch2OeY1Uh
	ccmndAPV1kl5+AGc1r7UN/EO3b5lr6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691415813;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPHq/8ReL9SskH7x4QhUjjkD2WsMlbeCGGwCHO/lY2k=;
	b=fNYSs+KGVYZcxOicz/T8Dyfd6bm+RaqNWSV647uUfpAg/k16eg1XV283Vo0k5n/II0RE77
	bpzPowTg6YU/OyBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7EC7D13910;
	Mon,  7 Aug 2023 13:43:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9Q74HQX10GRiIwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:43:33 +0000
Date: Mon, 07 Aug 2023 15:43:32 +0200
Message-ID: <878ranj7cr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org,
	alsa-devel@alsa-project.org,
	Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] sound: core: fix device ownership model in card and pcm
In-Reply-To: <87msz4f2e1.wl-tiwai@suse.de>
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
	<87cz06djxo.wl-tiwai@suse.de>
	<CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
	<87sf90b7hw.wl-tiwai@suse.de>
	<87cz04b0ku.wl-tiwai@suse.de>
	<CAOReqxhVXEL0ifkhEhBG1NYHOAVPS5y2oEuHfEO8gDvZjF30fQ@mail.gmail.com>
	<87zg379oap.wl-tiwai@suse.de>
	<CAOReqxjjwJec+Ho7vHg6tOjXHc8VEpVL317f6KE6gnmfDofa-g@mail.gmail.com>
	<87o7jloqp5.wl-tiwai@suse.de>
	<87msz4f2e1.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MASTHKJH4ECGIP5GML6MSUBPK4PCN4D5
X-Message-ID-Hash: MASTHKJH4ECGIP5GML6MSUBPK4PCN4D5
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 06 Aug 2023 20:32:06 +0200,
Takashi Iwai wrote:
> 
> On Sat, 05 Aug 2023 10:09:58 +0200,
> Takashi Iwai wrote:
> > 
> > On Fri, 04 Aug 2023 21:17:56 +0200,
> > Curtis Malainey wrote:
> > > 
> > > On Fri, Aug 4, 2023 at 1:58 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > Now I've been reconsidering the problem, and thought of another
> > > > possible workaround.  We may add the card's refcount control for the
> > > > device init and release, so that we delay the actual resource free.
> > > > The basic idea is to take card->card_ref at the device init and unref
> > > > it at the actual device release callback.  Then the snd_card_free()
> > > > call is held until all those refcounted devices are released.
> > > >
> > > > Below is a PoC patch (yes, this can be split, too ;)
> > > > A quick test on VM seems OK, but needs more reviews and tests.
> > > >
> > > > It contains somewhat ugly conditional put_device() at the dev_free
> > > > ops.  We can make those a bit saner with some helpers later, too.
> > > >
> > > > BTW, this approach may avoid another potential problem by the delayed
> > > > release; if we finish the driver remove without waiting for the actual
> > > > device releases, it may hit a code (the piece of the device release
> > > > callback) of the already removed module, and it's not guaranteed to be
> > > > present.
> > > > I'm not sure whether this really happens, but it's another thing to be
> > > > considered.
> > > >
> > > >
> > > > thanks,
> > > >
> > > > Takashi
> > > >
> > > > ---
> > > > diff --git a/include/sound/core.h b/include/sound/core.h
> > > > index f6e0dd648b80..00c514a80a4a 100644
> > > > --- a/include/sound/core.h
> > > > +++ b/include/sound/core.h
> > > 
> > > Unfortunately it doesn't hold up in my testing, hit the devm vs device
> > > race bug after a little over 30min of hammering snd-dummy (on top of
> > > your for-next branch)
> > (snip)
> > > I was talking with Stephen Boyd about this bug and his recommendation
> > > was to keep snd_card always out of devm and just allocate a pointer in
> > > devm to snd_card to puppet it as if it was managed via devm and just
> > > reference count rather than release the card so that its always
> > > handled through device->release. What do you think? This would go
> > > alongside the current patch proposed.
> > 
> > Indeed, that's another issue about devres vs delayed kobj release.
> > A quick fix would be something like below, I suppose.
> > (note: totally untested)
> 
> Scratch it.  It's still obviously broken.
> Will cook more proper patches later.

Now RFC patchset is ready.
I'll submit for testing in another thread.


Takashi
