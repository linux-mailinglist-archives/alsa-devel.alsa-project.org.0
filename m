Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E99C706BCE
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62A711F9;
	Wed, 17 May 2023 16:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62A711F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684335253;
	bh=Y7jj05tgRxAbTtw9dsePslTLlnRhYIfUGFg4wNBSue4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p0WlZZk3gf/2tp60JjYRoyj5/1PzVJEHLJG5VqQXNGy64W3Uy1nr0swXdijOrDLZj
	 CSvaAH8xlmQJS/WDt1yrfBq62kRBWEhsCGbfDXrI3AILle9vCJ46QbHXb47bq+mpdj
	 axF63Q3qLDiD97Y7TY9KXQZwo9+bphCJw9d92BDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF65DF8016D; Wed, 17 May 2023 16:52:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DB52F8025A;
	Wed, 17 May 2023 16:52:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91366F80272; Wed, 17 May 2023 16:52:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A33EF8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A33EF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EOU7OH8L;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BI+oP8+m
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D8742244C;
	Wed, 17 May 2023 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684335164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8IRi/NjL0rProIFyhA/kIwvypfToFP0aQRapg2mPR8=;
	b=EOU7OH8LDqhWLgau/5s4+xp65uPaROkQIYJRojkFSxJIgkG0jdsRJ2OUaBgr2LXNI4j8kD
	lz/eMfs6wl+7wIcjI8Av94gZKjJOUIFezkHYz0aaP1FdIbGYGFzFpa20EI5NdhDY2IlUPl
	wO1shFhL02STMLgQVb7X/koNerwhsHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684335164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8IRi/NjL0rProIFyhA/kIwvypfToFP0aQRapg2mPR8=;
	b=BI+oP8+mKfOYkiFGj6DRxjgRI2D7sIt9tOr2vc1orNf9EEcLZ44SeBYPZD+YN+73QOGtyC
	hRwTsQVNOPzjUMCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F97513358;
	Wed, 17 May 2023 14:52:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id S1wrFjzqZGT2cgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 17 May 2023 14:52:44 +0000
Date: Wed, 17 May 2023 16:52:43 +0200
Message-ID: <87jzx7103o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	"alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: HDA, power saving and recording
In-Reply-To: <4cc5cd11-e1c4-1ff2-ec66-328a00b5703f@intel.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H4LWU2PB3VEU2XJKJH6KCAQYPGEK2ZYQ
X-Message-ID-Hash: H4LWU2PB3VEU2XJKJH6KCAQYPGEK2ZYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4LWU2PB3VEU2XJKJH6KCAQYPGEK2ZYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 15:15:13 +0200,
Cezary Rojewski wrote:
> 
> On 2023-05-15 5:33 PM, Takashi Iwai wrote:
> > On Mon, 15 May 2023 16:49:48 +0200,
> > Amadeusz S³awiñski wrote:
> 
> ...
> 
> >> I think there are two problems:
> >> 
> >> 1. After probe codec is powered down
> >> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/pci/hda/hda_codec.c#n833),
> >> even though according to power management it is still running
> > 
> > I guess it's in the auto-suspend state, so it's still not suspended
> > but the device itself is active, while the usage count is 0.
> > 
> > That's fine, and I thought my second patch handling it.  That is, if
> > the usage count is 0 and the device is not suspended, it should return
> > -EAGAIN and make the caller retry with the full power up.
> > The code path is with CALL_RUN_FUNC() macro in hdac_regmap.c, and with
> > -EAGAIN return value, it tries snd_hdac_power_up_pm() and call the
> > function again.
> > 
> >> 2. When stream is started before first suspend, resume function
> >> doesn't run and it is a function which syncs cached registers. By
> >> resume function I mean
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/pci/hda/hda_codec.c#n2899
> >> which calls snd_hda_regmap_sync() or through in case of the platform I
> >> test it on codec->patch_ops.resume(codec) -> alc269_resume, which also
> >> calls snd_hda_regmap_sync().
> > 
> > It's also expected, per se.  Since it's been not suspended, it assumes
> > that the value got already written, and no resume is needed.
> 
> 
> After reading this conversation few times I came to conclusion that
> codec device should be kept up as long as its runtime_status=0
> (RPM_ACTIVE), regardless if usage_count is 0 or not. Basically, in
> autosuspend case usage_count and runtime_status for the device are
> both 0 so, if we are not ignoring the former by calling
> pm_runtime_get_if_in_use() then we end up caching the writes during
> the autosuspend period - period when the device is no longer used but
> there is still some time left before it's suspended.
> 
> 
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
>  int snd_hdac_keep_power_up(struct hdac_device *codec)
>  {
>         if (!atomic_inc_not_zero(&codec->in_pm)) {
> -               int ret = pm_runtime_get_if_in_use(&codec->dev);
> +               int ret = pm_runtime_get_if_active(&codec->dev, true);
>                 if (!ret)
>                         return -1;
>                 if (ret < 0)
> 
> 
> Results for the above look good.

OK, this seems to be a workaround.

I took a deeper look at the issue now, and noticed that it's a messy
problem.

The check with pm_runtime_get_if_in_use() itself isn't wrong, but it
needs the exceptional handling.

In addition to that, however, we need to work around the case where
the register gets updated twice with -EAGAIN handling; at the first
update, the regcache gets updated while the actual write gives an
error.  Then at the second update, it checks only the cache and 
believes as if it's been already written, and the write is skipped.
This was what Amadeusz experienced with my previous patch.
So, we need to paper over those two.

OTOH, if we replace the primary check with
pm_runtime_get_if_active(true), this makes the things *mostly*
working, too.  This increases the usage count forcibly when the device
is active, and we'll continue to write the register.
The caveat is that the auto-suspend timer is still ticking in this
case.  But, this won't be a big problem, as the timer callback does
check the state and cancel itself if the device is actually in use.

So, I guess we should go for pm_runtime_get_if_in_use().
But please give it more tests.


thanks,

Takashi
