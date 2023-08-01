Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E876AA08
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 09:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC8C210;
	Tue,  1 Aug 2023 09:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC8C210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690875133;
	bh=WppVxbzD0zAW0oEaO+zRMR0lMwaO0EpYErMv0uP7Hug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yw3q4EwDs30vp3J3Ic6M98BN5yqT3+krXSKX1Gx5SP1CX5REipmhVG54DdTagyslE
	 Jgxhy9hkEHL6V2SY/FVwRT33ZOABC/+M84XprUDytm1jFsi/zk4Ow5+nGnJXbVtrtF
	 YoV90+ENSChJxfXnQ/qLN7G2teU63umOojWevi9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEF4DF8025A; Tue,  1 Aug 2023 09:31:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F16F8016D;
	Tue,  1 Aug 2023 09:31:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16FD8F801D5; Tue,  1 Aug 2023 09:28:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02640F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 09:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02640F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=juO4Yk9a
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-686fc0d3c92so3332500b3a.0
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Aug 2023 00:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690874913; x=1691479713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19fkat+AwmoIDmk7TMp4T2FCh4hY7EdvW+uqAE+YRjE=;
        b=juO4Yk9afn0VTy18or87R1uPLi1F1tC+NR2Qr5M5jo5aZ+aCxMXkQJMnZ/o74rIlPR
         NAHNgt0stjKMMIj5s4xUTTv6by2qrUVH1OwFt2sh3LGXDpS2UAXkBM7CAFku9e+AfbWA
         pbkH/+RagAjQzESjKt7Ea94GAcmrfrS3HUaiIYusletQCtsOzJ2VxDOzYPQuhtMuc5YI
         maQ4AuwovU2HXb52vntQc1ulFPEpEl+50sKDdS8eV8BBVooQwNptiN5+qxbzsD1CLOKD
         1Rc6r4BCDsEo8XD/UqxAvCu0d6pDooqkm5tBldp5+XlfWqOBUv+90jRlAzmiVHe1VXn3
         jZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690874913; x=1691479713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19fkat+AwmoIDmk7TMp4T2FCh4hY7EdvW+uqAE+YRjE=;
        b=IEz+Oin5mh4+/EjxBxQWM2gterPXX8eWIacu94s8b9slrPWDS2mYWwL8oEexvCeBfV
         n+g4z7LrcjvmJ0WlS7pyW3R3FdCetwZzZ/9PaMCr8/xKRV8J0sx0bLNFBa6F2Sh07RIB
         Sksd7FCpX06W2xAPo9Fi8Zqr8MYYtRRQPXMWypjcnTMsfXtqQw1+Td5j6oZkrRTf+nWJ
         l57GgeDZkznnrr/3xso2gJoDMBaCOg//z8HKr/fzEWDIZMoSkCwdNg0FmMTEL+PNqvHR
         zk9nAfbo1ZGqZ+NM6M5mwqfLwU8TDVkHoD0pPTisZSeoYvt4aeJp29Cr7+HvPo2gdXCq
         Ww/g==
X-Gm-Message-State: ABy/qLY7/t2GSr7t3uQvPS7eoEsFFLmws69vJZne5ZAS08a8ZJ3yKNUk
	Tpa/LuMY8n1vn4XxG/gK7xA=
X-Google-Smtp-Source: 
 APBJJlELLqDFM+PStFjKGXZPFUWsqqqPnh+1/CHn6w1eOq56smmbSNaPHOrgV6k3Z94uAO6TsZLjqA==
X-Received: by 2002:a05:6a00:1782:b0:687:38aa:9461 with SMTP id
 s2-20020a056a00178200b0068738aa9461mr5899107pfg.26.1690874912454;
        Tue, 01 Aug 2023 00:28:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e9c5:ca03:62a0:85ae])
        by smtp.gmail.com with ESMTPSA id
 e18-20020a62aa12000000b006875493da1fsm530162pff.10.2023.08.01.00.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 00:28:32 -0700 (PDT)
Date: Tue, 1 Aug 2023 00:28:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: Marek Vasut <marex@denx.de>, Takashi Iwai <tiwai@suse.de>,
	linux-input@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Manuel Traut <manuel.traut@mt.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
Message-ID: <ZMi0HT/yaTo9uTyi@google.com>
References: <ZMdIZiC453onyeHh@google.com>
 <873514d2ju.wl-tiwai@suse.de>
 <63adce9a-df65-b462-9055-0ece5216d680@denx.de>
 <87tttkjmyu.wl-tiwai@suse.de>
 <0cffe366-75af-d8a8-8920-6fb94c321a89@denx.de>
 <87h6pkjh7q.wl-tiwai@suse.de>
 <618add56-3675-4efe-5b20-665c10040e03@denx.de>
 <ZMfgJ3o00nApkXGp@google.com>
 <f4612dc5-a7d4-74ba-2ed8-ea70314625b6@denx.de>
 <ZMh0Sa9s25JHhWw5@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMh0Sa9s25JHhWw5@nixie71>
Message-ID-Hash: XYO5BCWGG7GZS2GADFFFP72EI5F4KGRO
X-Message-ID-Hash: XYO5BCWGG7GZS2GADFFFP72EI5F4KGRO
X-MailFrom: dmitry.torokhov@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYO5BCWGG7GZS2GADFFFP72EI5F4KGRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 31, 2023 at 09:56:09PM -0500, Jeff LaBundy wrote:
> Hi all,
> 
> On Mon, Jul 31, 2023 at 07:49:50PM +0200, Marek Vasut wrote:
> > On 7/31/23 18:24, Dmitry Torokhov wrote:
> > > On Mon, Jul 31, 2023 at 04:36:01PM +0200, Marek Vasut wrote:
> > > > On 7/31/23 16:20, Takashi Iwai wrote:
> > > > 
> > > > [...]
> > > > 
> > > > > > > > Uh, I don't need a full sound device to emit beeps, that's not even
> > > > > > > > possible with this hardware.
> > > > > > > 
> > > > > > > Heh, I also don't recommend that route, either :)
> > > > > > > (Though, it must be possible to create a sound device with that beep
> > > > > > > control in theory)
> > > > > > 
> > > > > > I mean, I can imagine one could possibly use PCM DMA to cook samples
> > > > > > to feed some of the PWM devices so they could possibly be used to
> > > > > > generate low quality audio, as a weird limited DAC, but ... that's not
> > > > > > really generic, and not what I want.
> > > > > 
> > > > > Oh I see how the misunderstanding came; I didn't mean the PCM
> > > > > implementation like pcsp driver.  The pcsp driver is a real hack and
> > > > > it's there just for fun, not for any real practical use.
> > > > 
> > > > Ah :)
> > > > 
> > > > > What I meant was rather that you can create a sound device containing
> > > > > a mixer volume control that serves exactly like the sysfs or whatever
> > > > > other interface, without any PCM stream or other interface.
> > > > 
> > > > Ahhh, hum, I still feel like this might be a bit overkill here.
> > > > 
> > > > > > > > I only need to control loudness of the
> > > > > > > > beeper that is controlled by PWM output. That's why I am trying to
> > > > > > > > extend the pwm-beeper driver, which seems the best fit for such a
> > > > > > > > device, it is only missing this one feature (loudness control).
> > > > > > > 
> > > > > > > So the question is what's expected from user-space POV.  If a more
> > > > > > > generic control of beep volume is required, e.g. for desktop-like
> > > > > > > usages, an implementation of sound driver wouldn't be too bad.
> > > > > > > OTOH, for other specific use-cases, it doesn't matter much in which
> > > > > > > interface it's implemented, and sysfs could be an easy choice.
> > > > > > 
> > > > > > The whole discussion above has been exactly about this. Basically the
> > > > > > thing is, we can either have:
> > > > > > - SND_TONE (via some /dev/input/eventX) + sysfs volume control
> > > > > >     -> This is simple, but sounds racy between input and sysfs accesses
> > > > > 
> > > > > Hmm, how can it be racy if you do proper locking?
> > > > 
> > > > I can imagine two applications can each grab one of the controls and that
> > > > makes the interface a bit not nice. That would require extra synchronization
> > > > in userspace and so on.
> > > > 
> > > > > > - SND_TONE + SND_TONE_SET_VOLUME
> > > > > >     -> User needs to do two ioctls, hum
> > > > > > - some new SND_TONE_WITH_VOLUME
> > > > > >     -> Probably the best option, user sets both tone frequency and volume
> > > > > >        in one go, and it also only extends the IOCTL interface, so older
> > > > > >        userspace won't have issues
> > > > > 
> > > > > Those are "extensions" I have mentioned, and I'm not a big fan for
> > > > > that, honestly speaking.
> > > > > 
> > > > > The fact that the beep *output* stuff is provided by the *input*
> > > > > device is already confusing
> > > > 
> > > > I agree, this confused me as well.
> > > 
> > > This comes from the times when keyboards themselves were capable of
> > > emitting bells (SUN, DEC, etc). In hindsight it was not the best way of
> > > structuring things, same with the keyboard LEDs (that are now plugged
> > > into the LED subsystem, but still allow be driven through input).
> > > 
> > > And in the same vein I wonder if we should bite the bullet and pay with
> > > a bit of complexity but move sound-related things to sound subsystem.
> > 
> > I am not sure that's the right approach here, since the device cannot do PCM
> > playback, just bleeps.
> > 
> > > > > (it was so just because of historical
> > > > > reason), and yet you start implementing more full-featured mixer
> > > > > control.  I'd rather keep fingers away.
> > > > > 
> > > > > Again, if user-space requires the compatible behavior like the
> > > > > existing desktop usages
> > > > 
> > > > It does not. These pwm-beeper devices keep showing up in various embedded
> > > > devices these days.
> > > > 
> > > > > , it can be implemented in a similar way like
> > > > > the existing ones; i.e. provide a mixer control with a proper sound
> > > > > device.  The sound device doesn't need to provide a PCM interface but
> > > > > just with a mixer interface.
> > > > > 
> > > > > Or, if the purpose of your target device is a special usage, you don't
> > > > > need to consider too much about the existing interface, and try to
> > > > > keep the change as minimal as possible without too intrusive API
> > > > > changes.
> > > > 
> > > > My use case is almost perfectly matched by the current input pwm-beeper
> > > > driver, the only missing bit is the ability to control the loudness at
> > > > runtime. I think adding the SND_TONE_WITH_VOLUME parameter would cover it,
> > > > with least intrusive API changes.
> > > > 
> > > > The SND_TONE already supports configuring tone frequency in Hz as its
> > > > parameter. Since anything above 64 kHz is certainly not hearable by humans,
> > > > I would say the SND_TONE_WITH_VOLUME could use 16 LSbits for frequency (so
> > > > up to 65535 Hz , 0 is OFF), and 16 MSbits for volume .
> > > > 
> > > > I'm hesitant to overcomplicate something which can currently be controlled
> > > > via single ioctl by pulling in sound subsystem into the picture.
> > > 
> > > Can you tell a bit more about your use case? What needs to control the
> > > volume of beeps? Is this the only source of sounds on the system?
> > 
> > Custom user space application. The entire userspace is custom built in this
> > case.
> > 
> > In this case, it is a single-use device (think e.g. the kind of thermometer
> > you stick in your ear when you're ill, to find out how warm you are).
> > 
> > The beeper there is used to do just that, bleep (with different frequencies
> > to indicate different stuff), and that works. What I need in addition to
> > that is control the volume of the bleeps from the application, so it isn't
> > too noisy. And that needs to be user-controllable at runtime, so not
> > something that goes in DT.
> > 
> > Right now there is just the bleeper , yes.
> 
> It sounds like we essentially need an option within pcsp to drive PWM
> instead of PCM, but input already has pwm-beeper; it seems harmless to
> gently extend the latter for this use-case as opposed to reworking the
> former.
> 
> I agree that we should not invest too heavily in a legacy ABI, however
> something like SND_BELL_VOL seems like a low-cost addition that doesn't
> work against extending pcsp in the future. In fact, input already has
> precedent for this exact same thing by way of FF rumble effects, which
> are often PWM-based themselves.
> 
> If SND_BELL_VOL or similar is not acceptable, then the original sysfs
> approach seems like the next-best compromise. My only issue with it was
> that I felt the range was not abstracted enough.

If we want to extend the API we will need to define exactly how it will
all work. I.e. what happens if userspace mixes the old SND_TONE and
SND_BELL with the new SND_BELL_VOL or whatever. Does it play with
previously set volume? The default one? How to set the default one? How
to figure out what the current volume is if we decide to make volume
"sticky"?

As far as userspace I expect it is more common to have one program (or
component of a program) to set volume and then something else requests
sound, so having one-shot API is of dubious value to me.

I hope we can go with Takashi's proposal downthread, but if not I wonder
if the sysfs approach is not the simplest one. Do we expect more beepers
that can control volume besides pwm-beeper?

Thanks.

-- 
Dmitry
