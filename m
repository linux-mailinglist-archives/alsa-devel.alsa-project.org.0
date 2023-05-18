Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A9707EC1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 13:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF7ECF0;
	Thu, 18 May 2023 13:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF7ECF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684407840;
	bh=SyETSqYb6S3kS3nZpd+mPCjA0oQdjThna1VsNgJCwbc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DM6LAL/14jJPhvB+RkHElssER0CBAsfuBThFtMfYAwpxmfIxD+Se0ImS24IBLry90
	 upsXuwKj5SA1lLGemezTfRWGJAdatNe2sycFF9sISIfdPuD1gWQeY8Tm2+3xK6i3PH
	 nMzFZkC3PU7dowNRRva94EFUnEtbTLSZXwn1gUZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3353F80087; Thu, 18 May 2023 13:02:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD46F8016D;
	Thu, 18 May 2023 13:02:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD82EF8025A; Thu, 18 May 2023 13:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4648F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 13:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4648F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Hw5q8by5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/pH2nCJn
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E6F0E22446;
	Thu, 18 May 2023 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684407738;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CYlt2wdQmnYVWReb4R975jK3XtcEGxm0gIrLHGfX4i0=;
	b=Hw5q8by54YPA8//p3PN2VP2tDoQdZLob7jGMGzQokpMJ3nnKFbv97NubtP8sl+KIHRRhCq
	K2lrCokF+TUk06Xb2Rl95dO1YIfKhBbEdtU7fDYMl/O6/6+6ryU75YCMKe1RI3pGV8TAVr
	MBxdeL+l/tTP4BYCmi/dZ4MCrjybQdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684407738;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CYlt2wdQmnYVWReb4R975jK3XtcEGxm0gIrLHGfX4i0=;
	b=/pH2nCJnVo/RMrT0qUyIxk0FFexnJcZMo5vBi9EyAVUXDnr3YjvgjDz6AoY+rOL18B3tI+
	G02ma/Q59ltpxeAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C50DE1390B;
	Thu, 18 May 2023 11:02:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yv/+LroFZmRjAQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 18 May 2023 11:02:18 +0000
Date: Thu, 18 May 2023 13:02:18 +0200
Message-ID: <87o7mhzyv9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	"alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: HDA, power saving and recording
In-Reply-To: <91ec6843-5191-e424-1056-2aaf111d98bc@intel.com>
References: <a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com>
	<878rdwjs1s.wl-tiwai@suse.de>
	<cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
	<87jzxe5084.wl-tiwai@suse.de>
	<41417b90-1881-0cbb-52e1-d63923dd8cd6@linux.intel.com>
	<87ilcxaj3u.wl-tiwai@suse.de>
	<87fs81ainl.wl-tiwai@suse.de>
	<7915b40e-a65a-479d-5a2b-062ee3cb432b@linux.intel.com>
	<87bkipag9z.wl-tiwai@suse.de>
	<98943bc1-c56c-45aa-06d2-80c618d0585c@linux.intel.com>
	<878rdplpci.wl-tiwai@suse.de>
	<63790c96-215b-bc8c-3ad6-7acbe487d85a@linux.intel.com>
	<87cz31pq2d.wl-tiwai@suse.de>
	<4cc5cd11-e1c4-1ff2-ec66-328a00b5703f@intel.com>
	<87jzx7103o.wl-tiwai@suse.de>
	<91ec6843-5191-e424-1056-2aaf111d98bc@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6D7QYOK555NF64UZURTZS5TJGQ4Z7UQ5
X-Message-ID-Hash: 6D7QYOK555NF64UZURTZS5TJGQ4Z7UQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6D7QYOK555NF64UZURTZS5TJGQ4Z7UQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 11:00:54 +0200,
Cezary Rojewski wrote:
> 
> On 2023-05-17 4:52 PM, Takashi Iwai wrote:
> > On Wed, 17 May 2023 15:15:13 +0200,
> > Cezary Rojewski wrote:
> 
> ...
> 
> >> After reading this conversation few times I came to conclusion that
> >> codec device should be kept up as long as its runtime_status=0
> >> (RPM_ACTIVE), regardless if usage_count is 0 or not. Basically, in
> >> autosuspend case usage_count and runtime_status for the device are
> >> both 0 so, if we are not ignoring the former by calling
> >> pm_runtime_get_if_in_use() then we end up caching the writes during
> >> the autosuspend period - period when the device is no longer used but
> >> there is still some time left before it's suspended.
> >> 
> >> 
> >> --- a/sound/hda/hdac_device.c
> >> +++ b/sound/hda/hdac_device.c
> >> @@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
> >>   int snd_hdac_keep_power_up(struct hdac_device *codec)
> >>   {
> >>          if (!atomic_inc_not_zero(&codec->in_pm)) {
> >> -               int ret = pm_runtime_get_if_in_use(&codec->dev);
> >> +               int ret = pm_runtime_get_if_active(&codec->dev, true);
> >>                  if (!ret)
> >>                          return -1;
> >>                  if (ret < 0)
> >> 
> >> 
> >> Results for the above look good.
> > 
> > OK, this seems to be a workaround.
> > 
> > I took a deeper look at the issue now, and noticed that it's a messy
> > problem.
> 
> 
> While we want to address this issue first - I've even messaged you
> about this for the very first time early 2021 :D but it's not marked
> as high prio so it remained unaddressed till now - me and Amadeo spent
> some time analyzing most of the pm-related code for sound/hda and we
> believe most of it could be replaced by native pm_runtime_xxx code and
> fields such as ->in_pm could be dropped.

It's a bit tricky.  The in_pm refcount check is mandatory because the
very same code path is called recursively for enabling itself.

> However, this won't take a
> day or two and it's best if first we get to know the background
> what/why/when some of those specific functions/members exist in the
> hda code.

Yeah, I'd love to clean up / fix the stuff, but this is in some
sensitive area, so let's get it carefully.

> > The check with pm_runtime_get_if_in_use() itself isn't wrong, but it
> > needs the exceptional handling.
> > 
> > In addition to that, however, we need to work around the case where
> > the register gets updated twice with -EAGAIN handling; at the first
> > update, the regcache gets updated while the actual write gives an
> > error.  Then at the second update, it checks only the cache and
> > believes as if it's been already written, and the write is skipped.
> > This was what Amadeusz experienced with my previous patch.
> > So, we need to paper over those two.
> > 
> > OTOH, if we replace the primary check with
> > pm_runtime_get_if_active(true), this makes the things *mostly*
> > working, too.  This increases the usage count forcibly when the device
> > is active, and we'll continue to write the register.
> > The caveat is that the auto-suspend timer is still ticking in this
> > case.  But, this won't be a big problem, as the timer callback does
> > check the state and cancel itself if the device is actually in use.
> > 
> > So, I guess we should go for pm_runtime_get_if_in_use().
> > But please give it more tests.
> 
> I believe you meant pm_runtime_get_if_active(true) in the last one. If
> yes, then indeed I'm delaying the patch upload until more tests are
> run.

Ah correct, sorry for the typo, I mean *_if_active().

> Once again, thank you for the input. Ramping up and addressing this
> problem wouldn't happen so quickly without your guidance.

I'm going to submit your change as a proper fix patch soon later.
Then let's dig down and tidy the rest things up.


thanks,

Takashi
