Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F3768BE2
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 08:22:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 760BE823;
	Mon, 31 Jul 2023 08:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 760BE823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690784534;
	bh=pKmKxdUqG/IxFCGRitIBOZeQgBLZ/Q/Z4mnXbF+6kf4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iXnCCJ65mfSWwKqtzEP1uhS/u6R9fYVSIzkAbh8Rf1YZEjLx7vBzXwhlIhMPt4YVw
	 WQJqmkHlS3o2ZFkNIaM0xpLr2PfSrz7RhDW4C1zkNtM36Dhaprlp/ujvRrcqaALGL9
	 Np9UMWVMoCfAvOXtA8fkwUxm+Bqr97tn0Iv3EqxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C63CAF80149; Mon, 31 Jul 2023 08:21:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FC4AF80163;
	Mon, 31 Jul 2023 08:21:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D08E4F8016D; Mon, 31 Jul 2023 08:21:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD82EF80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 08:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD82EF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=P3quShTI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eJ9CnDvP
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 00F4B1F749;
	Mon, 31 Jul 2023 06:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690784470;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8uz9UreL669MhgY12mZE3fMA6oQ2OnCJzzU3AJy8+Mo=;
	b=P3quShTI/SP9802brh982beWhEVRti+Mlin4ocYqCpfbtLL81e+KRY9kaqVg0H4beLHSQv
	ZcZiYyi2Iaz7p1ChGiOruATUsnxtoj47MiEfKLC6Ib3CvqAAS+3Y9IDOrkbQgv+h7Zl+LN
	yF1rmZltUCMQ2tIzOYPdE+wjhvuqJiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690784470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8uz9UreL669MhgY12mZE3fMA6oQ2OnCJzzU3AJy8+Mo=;
	b=eJ9CnDvPEYmi+XuAA5musIwZy53yH95HKgw3o1VvJU5kw+sia3Ep1x7GBiGPJ/fn9Dz4o4
	wnJYrnwEY7dCsYCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC4EF133F7;
	Mon, 31 Jul 2023 06:21:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NI35KNVSx2TaYQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 06:21:09 +0000
Date: Mon, 31 Jul 2023 08:21:09 +0200
Message-ID: <873514d2ju.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marek Vasut <marex@denx.de>,	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>,	Frieder Schrempf
 <frieder.schrempf@kontron.de>,	Manuel Traut <manuel.traut@mt.com>,	Thierry
 Reding <thierry.reding@gmail.com>,	linux-pwm@vger.kernel.org,
	alsa-devel@alsa-project.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai
 <tiwai@suse.com>
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
In-Reply-To: <ZMdIZiC453onyeHh@google.com>
References: <20230512185551.183049-1-marex@denx.de>
	<ZF7kCjKGVjsxK8ec@nixie71>
	<0ef98ec1-6191-c72e-2362-310db7f09b84@denx.de>
	<06379f26-ab24-85f9-783f-0c49d4291b23@denx.de>
	<ZMdIZiC453onyeHh@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: KBGUDD7Y7CNLYAR6GX4H66STQNNP7Y7K
X-Message-ID-Hash: KBGUDD7Y7CNLYAR6GX4H66STQNNP7Y7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBGUDD7Y7CNLYAR6GX4H66STQNNP7Y7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 07:36:38 +0200,
Dmitry Torokhov wrote:
> 
> On Sat, May 13, 2023 at 11:02:30PM +0200, Marek Vasut wrote:
> > On 5/13/23 03:51, Marek Vasut wrote:
> > > On 5/13/23 03:12, Jeff LaBundy wrote:
> > > > Hi Marek,
> > > 
> > > Hi,
> > > 
> > > > On Fri, May 12, 2023 at 08:55:51PM +0200, Marek Vasut wrote:
> > > > > The PWM beeper volume can be controlled by adjusting the PWM duty cycle,
> > > > > expose volume setting via sysfs, so users can make the beeper quieter.
> > > > > This patch adds sysfs attribute 'volume' in range 0..50000, i.e. from 0
> > > > > to 50% in 1/1000th of percent steps, this resolution should be
> > > > > sufficient.
> > > > > 
> > > > > The reason for 50000 cap on volume or PWM duty cycle is because
> > > > > duty cycle
> > > > > above 50% again reduces the loudness, the PWM wave form is inverted wave
> > > > > form of the one for duty cycle below 50% and the beeper gets quieter the
> > > > > closer the setting is to 100% . Hence, 50% cap where the wave
> > > > > form yields
> > > > > the loudest result.
> > > > > 
> > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > ---
> > > > > An alternative option would be to extend the userspace input
> > > > > ABI, e.g. by
> > > > > using SND_TONE top 16bits to encode the duty cycle in 0..50000
> > > > > range, and
> > > > > bottom 16bit to encode the existing frequency in Hz . Since frequency in
> > > > > Hz is likely to be below some 25 kHz for audible bell, this fits
> > > > > in 16bits
> > > > > just fine. Thoughts ?
> > > > > ---
> > > > 
> > > > Thanks for the patch; this seems like a useful feature.
> > > > 
> > > > My first thought is that 50000 seems like an oddly specific limit to
> > > > impose
> > > > upon user space. Ideally, user space need not even care that the
> > > > beeper is
> > > > implemented via PWM and why 50000 is significant.
> > > > 
> > > > Instead, what about accepting 0..255 as the LED subsystem does for
> > > > brightness,
> > > > then map these values to 0..50000 internally? In fact, the leds-pwm
> > > > driver
> > > > does something similar.
> > > 
> > > The pwm_set_relative_duty_cycle() function can map whatever range to
> > > whatever other range of the PWM already, so that's not an issues here.
> > > It seems to me the 0..127 or 0..255 range is a bit too limiting . I
> > > think even for the LEDs the reason for that limit is legacy design, but
> > > here I might be wrong.
> > > 
> > > > I'm also curious as to whether this function should be a rogue sysfs
> > > > control
> > > > limited to this driver, or a generic operation in input. For
> > > > example, input
> > > > already allows user space to specify the magnitude of an FF effect;
> > > > perhaps
> > > > something similar is warranted here?
> > > 
> > > See the "An alternative ..." part above, I was wondering about this too,
> > > whether this can be added into the input ABI, but I am somewhat
> > > reluctant to fiddle with the ABI.
> > 
> > Thinking about this further, we could try and add some
> > 
> > EV_SND SND_TONE_WITH_VOLUME
> > 
> > to avoid overloading EV_SND SND_TONE , and at the same time allow the user
> > to set both frequency and volume for the tone without any race condition
> > between the two.
> > 
> > The EV_SND SND_TONE_WITH_VOLUME would still take one 32bit parameter, except
> > this time the parameter 16 LSbits would be the frequency and 16 MSbits would
> > be the volume.
> > 
> > But again, here I would like input from the maintainers.
> 
> Beeper was supposed to be an extremely simple device with minimal
> controls. I wonder if there is need for volume controls, etc, etc are we
> not better moving it over to the sound subsystem. We already have:
> 
> 	sound/drivers/pcsp/pcsp.c
> 
> and
> 
> 	sound/pci/hda/hda_beep.c
> 
> there, can we have other "advanced" beepers there as well? Adding sound
> maintainers to CC...

I don't mind it put to sound/*.  But, note that pcsp.c you pointed in
the above is a PCM tone generator driver with a PC beep device, and it
provides the normal SND_BEEP input only for compatibility.

Indeed there have been already many sound drivers providing the beep
capability, and they bind with the input device using SND_BEEP.  And,
for the beep volume, "Beep Playback Volume" mixer control is provided,
too.


thanks,

Takashi
