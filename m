Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C074E658
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 07:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B328E820;
	Tue, 11 Jul 2023 07:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B328E820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689053430;
	bh=fMEO+x/VlBNG7ZriDkfDHyYIOPZpkuhNyIhDQnsBlx8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PrMl7WaL5fDdPO8nXUu8X/FCFCjqpZ5jfgEUJDetPw6bb+wp8juQxom0YZ67nrqh8
	 eDn/u01LwkWdRbsvBl1rAQjtEIWkiK/Op8TcAR8WhKqbJSzVaKaP7obTDYKljWQdV5
	 iDTAHgS5mIyPcUXNUfe41es2NGKLdppVhXruObNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E238F8047D; Tue, 11 Jul 2023 07:29:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DFF6F80236;
	Tue, 11 Jul 2023 07:29:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44D49F80249; Tue, 11 Jul 2023 07:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B73FAF80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 07:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73FAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Z0nIVqCv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6HaZRRDt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6969A2041B;
	Tue, 11 Jul 2023 05:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689053303;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=USVdogK7bRGkppg7qZvrMYaSy6X2JfS/2HvL5HO57sI=;
	b=Z0nIVqCvqw1WOkcWHne4u8yyYrsr+rmPy8QD7eq/p/5RJbAAF1UXFQdQ/B8/MjYW2Uazjt
	mgbUtlQXa7d8M410nS1zVHkz/wxrKK936lnb2WRozDnk9N+zgC70wn3AHLClbns0rUOqHc
	66RFXieyYorFH8dwk1wthI6VOcVmzfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689053303;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=USVdogK7bRGkppg7qZvrMYaSy6X2JfS/2HvL5HO57sI=;
	b=6HaZRRDtlFKFkhkGiQs7Wujo0GlbX6iXBg57F/iYLOVkOabkDf4GNoQd56KGs3p3xcg3WH
	9GYvdaOVmnVAoxBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46CA91346F;
	Tue, 11 Jul 2023 05:28:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id h3MmEHforGTceAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 11 Jul 2023 05:28:23 +0000
Date: Tue, 11 Jul 2023 07:28:22 +0200
Message-ID: <87cz0zxbih.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ALSA: emu10k1: track loss of external clock on E-MU
 cards
In-Reply-To: <ZKxBJVxHdkmpHSVh@ugly>
References: <20230710065956.1246364-1-oswald.buddenhagen@gmx.de>
	<20230710065956.1246364-2-oswald.buddenhagen@gmx.de>
	<87ttubyfh9.wl-tiwai@suse.de>
	<ZKxBJVxHdkmpHSVh@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: TKUPJUF2ICKN37MXB7UY5LELLQ54HIYV
X-Message-ID-Hash: TKUPJUF2ICKN37MXB7UY5LELLQ54HIYV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKUPJUF2ICKN37MXB7UY5LELLQ54HIYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Jul 2023 19:34:29 +0200,
Oswald Buddenhagen wrote:
> 
> On Mon, Jul 10, 2023 at 05:05:06PM +0200, Takashi Iwai wrote:
> > On Mon, 10 Jul 2023 08:59:56 +0200,
> > Oswald Buddenhagen wrote:
> >> +	// We consider this a mixer setting, so use the mixer's lock
> >> +	down_write(&emu->card->controls_rwsem);
> > 
> > I really don't want to see the driver touching this lock.  It's
> > basically an internal stuff of ALSA core code.  And, as already
> > discussed, the controls_rwsem wasn't intended as a lock for the mixer
> > content protection originally.  It took over the role partially, but
> > the drivers shouldn't rely on it.
> > 
> i know that this is technically true, but i think that from a
> pragmatic point of view it just makes no sense.
> 
> if we are pedantic about it, we need to revert my 06405d8ee8c
> (emu10k1: remove now superfluous mixer locking) and do the opposite
> change, to add the technically missing locks. that's several tens of
> irq-safe spinlock operations in this driver alone. which are hundreds
> of bytes spent entirely pointlessly, because we _know_ that the
> operation is already locked, because it must be.

Yes, I'm for reintroducing the driver sepcific lock (it can be mutex,
too).

> so i think the most sensible approach is to just make it official,
> which is what my 37bb927d5bb (core: update comment on
> snd_card.controls_rwsem) actually works towards. at least i can't
> think of a reason not to do that, except for some puristic ideals.
> 
> if somebody actually finds a _good_ reason to change this and wants to
> embark on the mammoth task of proving that everything is still safe
> afterwards, they can just do so. adjusting this commit for the new
> reality wouldn't be hard or laborious.
> 
> > > +     snd_emu1010_update_clock(emu);
> > > +     downgrade_write(&emu->card->controls_rwsem);
> > > +     snd_ctl_build_ioff(&id, emu->ctl_clock_source, 0);
> > > +     snd_ctl_notify(emu->card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
> > > +     up_read(&emu->card->controls_rwsem);
> > 
> > Err, too ugly and unnecessary change.  snd_ctl_notify() doesn't take
> > the rwsem, and it can be called at any place without fiddling the
> > rwsem.  It's snd_ctl_notify_one() that needs the downgrade to read
> > (and maybe we should rename the function to be clearer).
> > 
> well, that lock is necessary exactly because we (ab-)use the rwsem as
> the general mixer lock, so we basically need to emulate the ioctl
> entry path, so a concurrent actual put ioctl doesn't blow up in our
> face. i actually agree that it's kinda ugly, but the argument remains
> the same - it just isn't worth doing it differently (we'd have to
> sprinkle around quite some reg_lock operations instead).

Again, snd_ctl_notify() itself doesn't need the rwsem lock at all.
It's snd_ctl_notify_one() that needs a more careful call pattern.

And, that ugly implementation is a thing to be improved in future in
ALSA core side.  If we have this in each driver, it'll be a
nightmare.  So, please don't follow it.


thanks,

Takashi
