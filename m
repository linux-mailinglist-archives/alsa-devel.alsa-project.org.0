Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2313276994F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 16:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F7D37F8;
	Mon, 31 Jul 2023 16:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F7D37F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690813288;
	bh=mNn0VOizETzOFA7yu7fdFC7iBUnSeAbizNAcflxS6UA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oqmRM6saIxHD0jpkpc0rULhCoIc06nVVRx++Eg+WtaEYDMKfWdCgOexjL1/P2dWtl
	 aumyDbsfgr+supPlJaeNS9tSWDrJzjTYmLywJCv6ihKa7dDCosOihOkP+NnExtPNiF
	 wRGyn8Li7IhCk/TS0ifegXGXX9Xn6k4rNPA++q0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72A9DF8016D; Mon, 31 Jul 2023 16:20:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E6BBF80163;
	Mon, 31 Jul 2023 16:20:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE4CAF8016D; Mon, 31 Jul 2023 16:20:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 91B37F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 16:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91B37F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UkZy0YhT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VqS67/tP
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1BD3121AC3;
	Mon, 31 Jul 2023 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690813210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5ccKt4H9G3+ieHTtJa59zRFAawTGeN0W2eKNb7uRU4=;
	b=UkZy0YhTNu7nvWDDwk3Mu8GTYIv9u48JbLNgyxNQqyrB6aZnQD8+s4oOIwUP77sydV0ZUk
	8IQ40jlvRNGJK8lVw/7YQHvX/CbFH9PeoFEsoMrLzkNid3RHpGr3a3N1l8FOR7N6O1eOTS
	dwVA8rmdX2MLxrBm1FmgGsZN02tZsAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690813210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5ccKt4H9G3+ieHTtJa59zRFAawTGeN0W2eKNb7uRU4=;
	b=VqS67/tPI21wdGpKQDTmX+lQ1Zlb0jdWGNv5E8Y07BL2NwyYfowO3leIcH1Ua7pBvM0KB4
	9DhWYYARTw0L+CAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD0C71322C;
	Mon, 31 Jul 2023 14:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XOL9MBnDx2QkUwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 14:20:09 +0000
Date: Mon, 31 Jul 2023 16:20:09 +0200
Message-ID: <87h6pkjh7q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,	Jeff LaBundy
 <jeff@labundy.com>,	linux-input@vger.kernel.org,	Uwe =?ISO-8859-1?Q?Klein?=
 =?ISO-8859-1?Q?e-K=F6nig?= <u.kleine-koenig@pengutronix.de>,	Frieder
 Schrempf <frieder.schrempf@kontron.de>,	Manuel Traut <manuel.traut@mt.com>,
	Thierry Reding <thierry.reding@gmail.com>,	linux-pwm@vger.kernel.org,
	alsa-devel@alsa-project.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai
 <tiwai@suse.com>
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
In-Reply-To: <0cffe366-75af-d8a8-8920-6fb94c321a89@denx.de>
References: <20230512185551.183049-1-marex@denx.de>
	<ZF7kCjKGVjsxK8ec@nixie71>
	<0ef98ec1-6191-c72e-2362-310db7f09b84@denx.de>
	<06379f26-ab24-85f9-783f-0c49d4291b23@denx.de>
	<ZMdIZiC453onyeHh@google.com>
	<873514d2ju.wl-tiwai@suse.de>
	<63adce9a-df65-b462-9055-0ece5216d680@denx.de>
	<87tttkjmyu.wl-tiwai@suse.de>
	<0cffe366-75af-d8a8-8920-6fb94c321a89@denx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: DIV6ICLIVCRD5YCPQSV6KU66YSFPHQLM
X-Message-ID-Hash: DIV6ICLIVCRD5YCPQSV6KU66YSFPHQLM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIV6ICLIVCRD5YCPQSV6KU66YSFPHQLM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 16:05:18 +0200,
Marek Vasut wrote:
> 
> On 7/31/23 14:15, Takashi Iwai wrote:
> > On Mon, 31 Jul 2023 13:49:46 +0200,
> > Marek Vasut wrote:
> >> 
> >> On 7/31/23 08:21, Takashi Iwai wrote:
> >>> On Mon, 31 Jul 2023 07:36:38 +0200,
> >>> Dmitry Torokhov wrote:
> >>>> 
> >>>> On Sat, May 13, 2023 at 11:02:30PM +0200, Marek Vasut wrote:
> >>>>> On 5/13/23 03:51, Marek Vasut wrote:
> >>>>>> On 5/13/23 03:12, Jeff LaBundy wrote:
> >>>>>>> Hi Marek,
> >>>>>> 
> >>>>>> Hi,
> >>>>>> 
> >>>>>>> On Fri, May 12, 2023 at 08:55:51PM +0200, Marek Vasut wrote:
> >>>>>>>> The PWM beeper volume can be controlled by adjusting the PWM duty cycle,
> >>>>>>>> expose volume setting via sysfs, so users can make the beeper quieter.
> >>>>>>>> This patch adds sysfs attribute 'volume' in range 0..50000, i.e. from 0
> >>>>>>>> to 50% in 1/1000th of percent steps, this resolution should be
> >>>>>>>> sufficient.
> >>>>>>>> 
> >>>>>>>> The reason for 50000 cap on volume or PWM duty cycle is because
> >>>>>>>> duty cycle
> >>>>>>>> above 50% again reduces the loudness, the PWM wave form is inverted wave
> >>>>>>>> form of the one for duty cycle below 50% and the beeper gets quieter the
> >>>>>>>> closer the setting is to 100% . Hence, 50% cap where the wave
> >>>>>>>> form yields
> >>>>>>>> the loudest result.
> >>>>>>>> 
> >>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>>>>> ---
> >>>>>>>> An alternative option would be to extend the userspace input
> >>>>>>>> ABI, e.g. by
> >>>>>>>> using SND_TONE top 16bits to encode the duty cycle in 0..50000
> >>>>>>>> range, and
> >>>>>>>> bottom 16bit to encode the existing frequency in Hz . Since frequency in
> >>>>>>>> Hz is likely to be below some 25 kHz for audible bell, this fits
> >>>>>>>> in 16bits
> >>>>>>>> just fine. Thoughts ?
> >>>>>>>> ---
> >>>>>>> 
> >>>>>>> Thanks for the patch; this seems like a useful feature.
> >>>>>>> 
> >>>>>>> My first thought is that 50000 seems like an oddly specific limit to
> >>>>>>> impose
> >>>>>>> upon user space. Ideally, user space need not even care that the
> >>>>>>> beeper is
> >>>>>>> implemented via PWM and why 50000 is significant.
> >>>>>>> 
> >>>>>>> Instead, what about accepting 0..255 as the LED subsystem does for
> >>>>>>> brightness,
> >>>>>>> then map these values to 0..50000 internally? In fact, the leds-pwm
> >>>>>>> driver
> >>>>>>> does something similar.
> >>>>>> 
> >>>>>> The pwm_set_relative_duty_cycle() function can map whatever range to
> >>>>>> whatever other range of the PWM already, so that's not an issues here.
> >>>>>> It seems to me the 0..127 or 0..255 range is a bit too limiting . I
> >>>>>> think even for the LEDs the reason for that limit is legacy design, but
> >>>>>> here I might be wrong.
> >>>>>> 
> >>>>>>> I'm also curious as to whether this function should be a rogue sysfs
> >>>>>>> control
> >>>>>>> limited to this driver, or a generic operation in input. For
> >>>>>>> example, input
> >>>>>>> already allows user space to specify the magnitude of an FF effect;
> >>>>>>> perhaps
> >>>>>>> something similar is warranted here?
> >>>>>> 
> >>>>>> See the "An alternative ..." part above, I was wondering about this too,
> >>>>>> whether this can be added into the input ABI, but I am somewhat
> >>>>>> reluctant to fiddle with the ABI.
> >>>>> 
> >>>>> Thinking about this further, we could try and add some
> >>>>> 
> >>>>> EV_SND SND_TONE_WITH_VOLUME
> >>>>> 
> >>>>> to avoid overloading EV_SND SND_TONE , and at the same time allow the user
> >>>>> to set both frequency and volume for the tone without any race condition
> >>>>> between the two.
> >>>>> 
> >>>>> The EV_SND SND_TONE_WITH_VOLUME would still take one 32bit parameter, except
> >>>>> this time the parameter 16 LSbits would be the frequency and 16 MSbits would
> >>>>> be the volume.
> >>>>> 
> >>>>> But again, here I would like input from the maintainers.
> >>>> 
> >>>> Beeper was supposed to be an extremely simple device with minimal
> >>>> controls. I wonder if there is need for volume controls, etc, etc are we
> >>>> not better moving it over to the sound subsystem. We already have:
> >>>> 
> >>>> 	sound/drivers/pcsp/pcsp.c
> >>>> 
> >>>> and
> >>>> 
> >>>> 	sound/pci/hda/hda_beep.c
> >>>> 
> >>>> there, can we have other "advanced" beepers there as well? Adding sound
> >>>> maintainers to CC...
> >>> 
> >>> I don't mind it put to sound/*.  But, note that pcsp.c you pointed in
> >>> the above is a PCM tone generator driver with a PC beep device, and it
> >>> provides the normal SND_BEEP input only for compatibility.
> >>> 
> >>> Indeed there have been already many sound drivers providing the beep
> >>> capability, and they bind with the input device using SND_BEEP.  And,
> >>> for the beep volume, "Beep Playback Volume" mixer control is provided,
> >>> too.
> >> 
> >> Uh, I don't need a full sound device to emit beeps, that's not even
> >> possible with this hardware.
> > 
> > Heh, I also don't recommend that route, either :)
> > (Though, it must be possible to create a sound device with that beep
> > control in theory)
> 
> I mean, I can imagine one could possibly use PCM DMA to cook samples
> to feed some of the PWM devices so they could possibly be used to
> generate low quality audio, as a weird limited DAC, but ... that's not
> really generic, and not what I want.

Oh I see how the misunderstanding came; I didn't mean the PCM
implementation like pcsp driver.  The pcsp driver is a real hack and
it's there just for fun, not for any real practical use.  
What I meant was rather that you can create a sound device containing
a mixer volume control that serves exactly like the sysfs or whatever
other interface, without any PCM stream or other interface.

> >> I only need to control loudness of the
> >> beeper that is controlled by PWM output. That's why I am trying to
> >> extend the pwm-beeper driver, which seems the best fit for such a
> >> device, it is only missing this one feature (loudness control).
> > 
> > So the question is what's expected from user-space POV.  If a more
> > generic control of beep volume is required, e.g. for desktop-like
> > usages, an implementation of sound driver wouldn't be too bad.
> > OTOH, for other specific use-cases, it doesn't matter much in which
> > interface it's implemented, and sysfs could be an easy choice.
> 
> The whole discussion above has been exactly about this. Basically the
> thing is, we can either have:
> - SND_TONE (via some /dev/input/eventX) + sysfs volume control
>   -> This is simple, but sounds racy between input and sysfs accesses

Hmm, how can it be racy if you do proper locking?

> - SND_TONE + SND_TONE_SET_VOLUME
>   -> User needs to do two ioctls, hum
> - some new SND_TONE_WITH_VOLUME
>   -> Probably the best option, user sets both tone frequency and volume
>      in one go, and it also only extends the IOCTL interface, so older
>      userspace won't have issues

Those are "extensions" I have mentioned, and I'm not a big fan for
that, honestly speaking.

The fact that the beep *output* stuff is provided by the *input*
device is already confusing (it was so just because of historical
reason), and yet you start implementing more full-featured mixer
control.  I'd rather keep fingers away.

Again, if user-space requires the compatible behavior like the
existing desktop usages, it can be implemented in a similar way like
the existing ones; i.e. provide a mixer control with a proper sound
device.  The sound device doesn't need to provide a PCM interface but
just with a mixer interface.

Or, if the purpose of your target device is a special usage, you don't
need to consider too much about the existing interface, and try to
keep the change as minimal as possible without too intrusive API
changes.


Takashi
