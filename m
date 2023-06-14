Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3072F8DC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 11:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC25D6C1;
	Wed, 14 Jun 2023 11:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC25D6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686734239;
	bh=x8iQ0fItHcYUFjOdjtfVGKx+Am6qTp161y6yfwoSfYs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n/ObyXx/zluKMLYpez1agO0mNjiF4fcGRFYFnkTqpuKvAqV7Sp3Svkd7ubhlMZhgo
	 8beHIZH8scfg9KNX8kbMPZbz5pf26hOOFwu/tajiYzVcVsy+A7834nUz2RxlGLwdIQ
	 gdsMT/3eSzl0pFeCGYiPet1M5ol9G++iBR88cLXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05C7DF8052E; Wed, 14 Jun 2023 11:16:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84A56F80149;
	Wed, 14 Jun 2023 11:16:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E58D9F80246; Wed, 14 Jun 2023 11:16:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 69908F80132
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 11:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69908F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=znlZc2CD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=syq3TyIm
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 938591FD6A;
	Wed, 14 Jun 2023 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686734180;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfRbZx4HT73tYkvoL3+hEuyPFHd2nQGkAzn7DPlrhj0=;
	b=znlZc2CDUZGoDAMjpTsRSW1pGTdDfBMcLsoJnWqzrCZYjp+HpJso73NfiHUIApOJqO8A2R
	udnXFW348AcV1p5eJVhtLngvqT4wnS3sCSzX70vGOZgV7y/iN/DvxAJyFeXdbv56aSbjcm
	YHY3MbGcda2XvhHkC9shxw/qvRCDmmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686734180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfRbZx4HT73tYkvoL3+hEuyPFHd2nQGkAzn7DPlrhj0=;
	b=syq3TyImMClpMrefxEOG5VVwOpbDuZdEx0ymz6eFrpYkTwWWpRGeINTt9vco4VhcyCZ73l
	Yh/kPPrJ+Ef7yTAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EE651357F;
	Wed, 14 Jun 2023 09:16:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kRAEGmSFiWStVAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 14 Jun 2023 09:16:20 +0000
Date: Wed, 14 Jun 2023 11:16:19 +0200
Message-ID: <87352ubdzw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
In-Reply-To: <ZIl/5rSSydaVngpQ@ugly>
References: <20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
	<87v8fren1k.wl-tiwai@suse.de>
	<ZIhKe99WGpLFN1ld@ugly>
	<87edmfei0o.wl-tiwai@suse.de>
	<ZIh2gp/I4ot326KP@ugly>
	<871qife9ga.wl-tiwai@suse.de>
	<ZIiJ9zzwgvQHyrW9@ugly>
	<87fs6vcqpt.wl-tiwai@suse.de>
	<ZIij6mdc1utyBD93@ugly>
	<87sfaublds.wl-tiwai@suse.de>
	<ZIl/5rSSydaVngpQ@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: BHS23QKF45OYSADLYCD7OEEO3NK6F7RJ
X-Message-ID-Hash: BHS23QKF45OYSADLYCD7OEEO3NK6F7RJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHS23QKF45OYSADLYCD7OEEO3NK6F7RJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 10:52:54 +0200,
Oswald Buddenhagen wrote:
> 
> On Wed, Jun 14, 2023 at 08:36:47AM +0200, Takashi Iwai wrote:
> > On Tue, 13 Jun 2023 19:14:18 +0200,
> > Oswald Buddenhagen wrote:
> >> On Tue, Jun 13, 2023 at 05:43:58PM +0200, Takashi Iwai wrote:
> >> > Crashing an existing application is the worst-case scenario.
> >> > a new driver (which this effectively is) crashing a broken
> >> application
> >> is perfectly legitimate, as it doesn't affect any existing users.
> > 
> > No, you can't ignore it.
> > 
> you're allowing _hypothetical_ crappy 3rd party code to dictate what
> you can and cannot do. that's a completely unreasonable and
> counterproductive attitude, akin to letting hostage-takers set the
> rules.

Oswald, it's no hypothetical, I have seen lots of applications that
did crash with such mixer element changes in the past.
It's no dictation by 3rd party.  We simply must not crash things by an
update (unless it's a must, something like a security fix).

> >> > Oh well, that's really not a change to be advertised for creating /
> >> > deleting kctls from the put callback at all.
> >> > and? it's done, and it's basically impossible to revert. so we
> >> may
> >> reap its full benefits just as well, as i did in that previous commit.
> > 
> > Well, I can revert your commit, too...
> > 
> sure, but my point was that there are likely many more such commits,
> some of them not explicitly marked as such. it would be a very costly
> and risky exercise to actually do that revert at this point.

Sure, I didn't mean to do it immediately, it's no easy task.

> > Basically the content protection shouldn't be covered by this rwsem.
> > It's rather a misuse.
> > 
> yes, sort of.
> otoh, the commit message is rather convincing, and you clearly saw it
> that way as well.

I wasn't really convinced at that time, too, but the commit was the
easiest workaround, so we agreed on taking it.  Basically it's still a
bad idea to use cards_rwsem lock for the content protection of each
kctl.  This should be revised, but it'll be a much wider work than a
single revert or such, and certainly a lower priority task.

> >> > Sorry, but my answer is same: NO.  I see no reason why kctl >
> >> deletion
> >> > and creation _must_ be implemented _inevitably_ in that way.
> >> > being the most straight-forward way to implement it certainly
> >> qualifies as a good reason for doing it that way.
> >> and i still see no convincing reason why it shouldn't.
> > 
> > I still see no convincing reason why it must be done so, either.
> > 
> the very convincing reason is that it was already done that way, and
> you'd have to bring forward a very convincing justification for
> further investment into a much more complex solution, esp. considering
> what driver we're talking about.

Nah, as I repeatedly wrote, the whole idea is too risky, may crash
things easily, so should be avoided as much as possible.
A correct use of API doesn't mean that everything keeps working as is,
unfortunately.

> > The way you're trying to implement is an anti-pattern,
> > 
> that's something you keep repeating in various ways, but i see no
> evidence that there is an _actual_ problem.

There were actual problems, and we had to address them.

The API is there and it should be usable in the ideal world, but we
know that it breaks far more than expected.  We don't prohibit that
API, but the actual use should be limited for very special use cases.

If it were triggered in only certain (rare and race-free) situations,
it'd be acceptable.  But your patch allows every user to trigger it by
the normal kctl value adjustment, which is simply no-go.


Takashi
