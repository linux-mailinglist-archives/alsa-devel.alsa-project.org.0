Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D531C768B48
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 07:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32376827;
	Mon, 31 Jul 2023 07:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32376827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690781901;
	bh=Dffivd82On0kacxpUeX5EbMUnFlyvIarfVHB+rfgs9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KZ6OVmtdUPmvaigpmUwQNe2kNeB7uiwq9m5UGHGzFbK0tys5+EMvaJiEDFKcI/TL1
	 5X/Owx5jYDJKzQXLsc/wCH9E3ek8xr3/1Ni3Xb3t0MXGkhDvpzBZWkJpp20KCfn9XF
	 7i3xjoATPXtfSem6ly25+mDzpagr6f5Ij9ipSOm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70037F80520; Mon, 31 Jul 2023 07:37:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B8EEF8015B;
	Mon, 31 Jul 2023 07:37:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F8EEF8016D; Mon, 31 Jul 2023 07:37:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 654D1F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 07:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 654D1F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hDTr062a
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686efb9ee0cso4113839b3a.3
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 22:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690781802; x=1691386602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEYDHdxW+GqO/A72zpM2Ivj3ad0HfR7AVeRSROhpavA=;
        b=hDTr062anlw+gU4Ml5fkr/Wqeg81olwlqGYFQzMcGd2un12W9W64LQ7TevFxj5f1Jm
         8o9JeYLduBM6K5Hs9Fj7tuqmRpQGaYtGr6HDisLzsMgBiLSA86A9ZmktUufhCxB2hKOs
         GWvdcmnVbpg7aBq4MFXNyMoigFMjx3JzHoDa9Qca6zbR/hnQAFtGcQgqHWfIE/7tI0RW
         Fe8z8zsvcNZsoNlq8LgtwJDeO+aOdsuM6dZGpYPPw7KZxhf/nFap6vsmRp6mgb/byoib
         yYlVAuMo8XAOylVDtFebP2AI0Z/lrKaAKBLd8rsdmkOVvROvRAlmmhJMWKD8SB325F4i
         UB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690781802; x=1691386602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEYDHdxW+GqO/A72zpM2Ivj3ad0HfR7AVeRSROhpavA=;
        b=KYAp4+4CHUvH8fRAmfx8Y/5KPiEEvV5jEV2+LWTUYSUqdHjn+nbNiKnTQLp1dnIIaA
         6ZgvmbfW0Gucrt5dKpcWYFAgn4KN++N8kdDRjG0CPP3vn5utNChIYE9+dQgtfO7DUu6m
         VcY6rcIXQbxabaydBHKbE8bucojbftMrAcS8HdnjHVicj5/j9ekvymRmNKDxTs8k/tG7
         eExlim+O/oyz4CunckDjtQiYQQDIj6+R1UXCoewaIApT3pDE3T3SJ7RfMXDP9vfw0m+7
         rCGRjKUOIiEeVdyCUkhALzLqtj/m3qgYpuGzfiBAym0lNQUOB4O7TX9m09gBQZxCPutZ
         1fSA==
X-Gm-Message-State: ABy/qLYQoTV+3+A8Ol3SJAtvxhU3n2V37YqJMwaziDAMyfODFN54IC3f
	KAYgeuPMHlPyGV5J1L0kwTo=
X-Google-Smtp-Source: 
 APBJJlE3/PWrxtTzXeEVgTjilO2kKRi76gBdRfysdoM8scgKejMgaNyfKWfKEnHr4SYWD58E0UkGlg==
X-Received: by 2002:a05:6a20:8f19:b0:13b:c4a8:1a68 with SMTP id
 b25-20020a056a208f1900b0013bc4a81a68mr9762941pzk.34.1690781802268;
        Sun, 30 Jul 2023 22:36:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d25:c0f1:d8d5:201c])
        by smtp.gmail.com with ESMTPSA id
 e26-20020aa78c5a000000b0064d57ecaa1dsm4052358pfd.28.2023.07.30.22.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 22:36:41 -0700 (PDT)
Date: Sun, 30 Jul 2023 22:36:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Manuel Traut <manuel.traut@mt.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
Message-ID: <ZMdIZiC453onyeHh@google.com>
References: <20230512185551.183049-1-marex@denx.de>
 <ZF7kCjKGVjsxK8ec@nixie71>
 <0ef98ec1-6191-c72e-2362-310db7f09b84@denx.de>
 <06379f26-ab24-85f9-783f-0c49d4291b23@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06379f26-ab24-85f9-783f-0c49d4291b23@denx.de>
Message-ID-Hash: KWTRYOY5GZSOZW4HD7TLDEZQIBCNJ3RA
X-Message-ID-Hash: KWTRYOY5GZSOZW4HD7TLDEZQIBCNJ3RA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KWTRYOY5GZSOZW4HD7TLDEZQIBCNJ3RA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, May 13, 2023 at 11:02:30PM +0200, Marek Vasut wrote:
> On 5/13/23 03:51, Marek Vasut wrote:
> > On 5/13/23 03:12, Jeff LaBundy wrote:
> > > Hi Marek,
> > 
> > Hi,
> > 
> > > On Fri, May 12, 2023 at 08:55:51PM +0200, Marek Vasut wrote:
> > > > The PWM beeper volume can be controlled by adjusting the PWM duty cycle,
> > > > expose volume setting via sysfs, so users can make the beeper quieter.
> > > > This patch adds sysfs attribute 'volume' in range 0..50000, i.e. from 0
> > > > to 50% in 1/1000th of percent steps, this resolution should be
> > > > sufficient.
> > > > 
> > > > The reason for 50000 cap on volume or PWM duty cycle is because
> > > > duty cycle
> > > > above 50% again reduces the loudness, the PWM wave form is inverted wave
> > > > form of the one for duty cycle below 50% and the beeper gets quieter the
> > > > closer the setting is to 100% . Hence, 50% cap where the wave
> > > > form yields
> > > > the loudest result.
> > > > 
> > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > ---
> > > > An alternative option would be to extend the userspace input
> > > > ABI, e.g. by
> > > > using SND_TONE top 16bits to encode the duty cycle in 0..50000
> > > > range, and
> > > > bottom 16bit to encode the existing frequency in Hz . Since frequency in
> > > > Hz is likely to be below some 25 kHz for audible bell, this fits
> > > > in 16bits
> > > > just fine. Thoughts ?
> > > > ---
> > > 
> > > Thanks for the patch; this seems like a useful feature.
> > > 
> > > My first thought is that 50000 seems like an oddly specific limit to
> > > impose
> > > upon user space. Ideally, user space need not even care that the
> > > beeper is
> > > implemented via PWM and why 50000 is significant.
> > > 
> > > Instead, what about accepting 0..255 as the LED subsystem does for
> > > brightness,
> > > then map these values to 0..50000 internally? In fact, the leds-pwm
> > > driver
> > > does something similar.
> > 
> > The pwm_set_relative_duty_cycle() function can map whatever range to
> > whatever other range of the PWM already, so that's not an issues here.
> > It seems to me the 0..127 or 0..255 range is a bit too limiting . I
> > think even for the LEDs the reason for that limit is legacy design, but
> > here I might be wrong.
> > 
> > > I'm also curious as to whether this function should be a rogue sysfs
> > > control
> > > limited to this driver, or a generic operation in input. For
> > > example, input
> > > already allows user space to specify the magnitude of an FF effect;
> > > perhaps
> > > something similar is warranted here?
> > 
> > See the "An alternative ..." part above, I was wondering about this too,
> > whether this can be added into the input ABI, but I am somewhat
> > reluctant to fiddle with the ABI.
> 
> Thinking about this further, we could try and add some
> 
> EV_SND SND_TONE_WITH_VOLUME
> 
> to avoid overloading EV_SND SND_TONE , and at the same time allow the user
> to set both frequency and volume for the tone without any race condition
> between the two.
> 
> The EV_SND SND_TONE_WITH_VOLUME would still take one 32bit parameter, except
> this time the parameter 16 LSbits would be the frequency and 16 MSbits would
> be the volume.
> 
> But again, here I would like input from the maintainers.

Beeper was supposed to be an extremely simple device with minimal
controls. I wonder if there is need for volume controls, etc, etc are we
not better moving it over to the sound subsystem. We already have:

	sound/drivers/pcsp/pcsp.c

and

	sound/pci/hda/hda_beep.c

there, can we have other "advanced" beepers there as well? Adding sound
maintainers to CC...

Thanks.

-- 
Dmitry
