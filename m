Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C99C2617DF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:44:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87BBD16A8;
	Tue,  8 Sep 2020 19:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87BBD16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599587083;
	bh=0Vmf23SCceUatTs054SlrjMniRFg/79QBN5mMw2o4LY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqNfa0z5g46WSUq2iQ20kMuTuGFxalrbYZfL5XGSv+YzjAj0UzqGTR402W8hpX8Lg
	 SwcKqNr1Ahxvn1cKt3mD/76H0iJ7Dtr5GmigLWs5ZjA4EJ80i2XPj6CNeMVg9VWPlD
	 0+8+UuOI8ALdwmOJ6Nw6RluxQMUQiPZHwYkGn3Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A8E9F8015F;
	Tue,  8 Sep 2020 19:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D222AF80264; Tue,  8 Sep 2020 19:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0C88F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0C88F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="Nip8LBTJ"
Received: by mail-wm1-x342.google.com with SMTP id c19so118289wmd.1
 for <alsa-devel@alsa-project.org>; Tue, 08 Sep 2020 10:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OEf+BGjF/t1JSSdnc1xyf+TDXOi/Xxv0WukkmnIdvak=;
 b=Nip8LBTJIwyVryN3G1TC6CvDmzGXzZLtpIWyp4oLnyJg756Yi/T1XrlRX5l4q10pq5
 KPXGPSSkxpDZO2ofu+3llwSUCrdutCjsmjJhF874adxIVK/TixD/rUgcb3wtev6fJEDg
 hQHhNPAqej0ccihmGc52Lsd3cLHMg5TjYKW6J7pQ+VAEajE+BqqayRXzdY1UEu/CbIQl
 dRZKrnvJJFH1ZIQoQ/N0E/haKrRpS8/VY1hHZhT5kgYf1iCa6tHpQazmOgtD6yy/XGBv
 VwPiBf5aSdPIhj6PRaAi5PIZHtQM++hnRAdo1Unw1f2FT6sN5vs/FOZLq273pmHDhxbs
 8wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OEf+BGjF/t1JSSdnc1xyf+TDXOi/Xxv0WukkmnIdvak=;
 b=IEjJ7jljEr5KmLol/bqPGWc9d9S40rQVKuxqLfFTAd4KBbcnG4B9O23R8R4oqnrp3I
 Um3QVdvC2B1QQnzn4ptlQUAP8AKx6nARom8Fffe/EvQqxL12Y12Wk9DZDqnKcmOKI1PX
 sUvUGEJknQCPJT/Mb2xi4NTaxvYpdC1X7VhS7b8D4koo3anIpW/eYHLqEdYS+f3AYLi2
 HpRoT2DjYn5Up04cfeHA7ZVakqng+5slAE5IAa7fGyImihXP3cDBxmzsjw0TstqHsuOb
 Ii7Ypct9io26YVEsAW03ji9SN/REzNuqJDXa5xBLXTwe045uCbRwjkxDecqRtdYZYZi+
 Sejw==
X-Gm-Message-State: AOAM530pLqGMJ8kHZRdXM3P966sVjbGATy/UhyG9DdFhQprkVkZUN5+c
 7goqVsShMrkKozXTPV5kJssaX7tC7zWuOvW2vtYVqg==
X-Google-Smtp-Source: ABdhPJwdAhCHkjes0xF1vFytq4iFsXQyYNDN0A43hixRh6hsuZrP+Tcfw609dCp9J8cPhB1mHHbGKxY9funQbMQmKE4=
X-Received: by 2002:a1c:7314:: with SMTP id d20mr249187wmb.76.1599586968746;
 Tue, 08 Sep 2020 10:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200501193141.30293-1-rad@semihalf.com>
 <3ad44b75-387f-da75-d7b2-3a16ed00550c@linux.intel.com>
 <CAOs-w0LPeKgooa_98x_Jkzus-Y5Kad7pDby0CriDGb6nTp_6sA@mail.gmail.com>
 <8b97bf43-ddd8-df81-90e7-9e87c19af1ab@linux.intel.com>
In-Reply-To: <8b97bf43-ddd8-df81-90e7-9e87c19af1ab@linux.intel.com>
From: =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Date: Tue, 8 Sep 2020 19:42:33 +0200
Message-ID: <CAOs-w0KvKcRnDkMtdAV2n_3XLfwk9KgM65QEO=6+qNshobJx3g@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, John Hsu <KCHSU0@nuvoton.com>,
 Takashi Iwai <tiwai@suse.com>, "Sienkiewicz,
 Michal" <michal.sienkiewicz@intel.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Alex Levin <levinale@google.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sorry for missing the response for so long.
Somehow lost this thread in my mailbox.

=C5=9Br., 6 maj 2020 o 00:04 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
>
>
> >>> This single fix address two issues on machines with nau88125:
> >>> 1) Audio distortion, due to lack of required clock rate on MCLK line
> >>> 2) Loud audible "pops" on headphones if there is no sysclk during nau=
8825
> >>>      playback power up sequence
> >>>
> >>> Explanation for:
> >>> 1) Due to Skylake HW limitation, MCLK pin can only output 24MHz clk
> >>>      rate (it can be only connected to XTAL parent clk). The BCLK pin
> >>>      can be driven by dividers and therefore FW is able to set it to =
rate
> >>>      required by chosen audio format. According to nau8825 datasheet,=
 256*FS
> >>>      sysclk gives the best audio quality and the only way to achieve =
this
> >>>      (taking into account the above limitations) its to regenerate th=
e MCLK
> >>>      from BCLK on nau8825 side by FFL. Without required clk rate, aud=
io is
> >>>      distorted by added harmonics.
> >>
> >> The BCLK is going to be a multiple of 50 * Fs due to clocking
> >> restrictions. Can the codec regenerate a good-enough sysclk from this?
> >
> > According to Intel, silicon has a limitation, on SKL/KBL only clk_id =
=3D
> > SKL_XTAL, .name =3D "xtal" is available for IO domain.
> > As mentioned in the commit:
> > MCLK is generated by using 24MHz Xtal directly or applying a divider
> > (so no way of achieving the rate required by audio format).
> > BCLK/FS is generated from 24MHz and uses dividers and additional
> > padding bits are used to match the clock source.
> > Next gen silicon has the possibility of using additional clock sources.
> >
> > Summing up, using MCLK from SKL to NAU88L25 is not an option.
> > The only option we found is to use BCLK and regen the required clock
> > rate by FLL on the NAU88l25 side.
>
> Right, this 24 MHz is a recurring problem.
> But what I was asking was if the NAU8825 is fine working with e.g. a
> 2.4MHz bit clock. i.e. with 25 bit slots or padding at the end of the fra=
me?

From our tests NAU8825 is working fine with these parameters.
Also the output audio signal looks fine on the scope and FFT and there
are no audible glitches.

>
> >
> >>>
> >>> 2) Currently Skylake does not output MCLK/FS when the back-end DAI op
> >>>      hw_param is called, so we cannot switch to MCLK/FS in hw_param. =
 This
> >>>      patch reduces pop by letting nau8825 keep using its internal VCO=
 clock
> >>>      during widget power up sequence, until SNDRV_PCM_TRIGGER_START w=
hen
> >>>      MCLK/FS is available. Once device resumes, the system will only =
enable
> >>>      power sequence for playback without doing hardware parameter, au=
dio
> >>>      format, and PLL configure. In the mean time, the jack detecion s=
equence
> >>>      has changed PLL parameters and switched to internal clock. Thus,=
 the
> >>>      playback signal distorted without correct PLL parameters.  That =
is why
> >>>      we need to configure the PLL again in SNDRV_PCM_TRIGGER_RESUME c=
ase.
> >>
> >> IIRC the FS can be controlled with the clk_ api with the Skylake drive=
r,
> >> as done for some KBL platforms. Or is this not supported by the firmwa=
re
> >> used by this machine?
> >
> > According to Ben, SKL had limitations in FW for managing the clk's
> > back in the days.
> > Can you point to the other driver you mention so we can cross check?
>
> There are two KBL drivers that control the SSP clocks from the machine
> driver, but indeed I don't know if this would work on Firmware, it'd be
> a question for Lech/Cezary.
>
> kbl_rt5663_max98927.c:          ret =3D clk_prepare_enable(priv->mclk);
> kbl_rt5663_max98927.c:          ret =3D clk_prepare_enable(priv->sclk);
> kbl_rt5663_rt5514_max98927.c:           ret =3D
> clk_prepare_enable(priv->mclk);
> kbl_rt5663_rt5514_max98927.c:           ret =3D
> clk_prepare_enable(priv->sclk);
> kbl_rt5663_rt5514_max98927.c:                   ret =3D
> clk_prepare_enable(priv->mclk);
>

Czarek answered this and we got the same response from other Intel
devs while consulting this change:
FW cannot request a chosen rate (48k) for MCLK pin as it does not
"align with what's present on SKL hw".

The only way we found out for NAU8825 to cooperate at chosen rate with
SKL HW is to regen the MCLK from BCLK by FLL as mentioned above.
NHTL is used to set SSP0 (48k, 24/25 bit on 24MHz crystal).
If I get all of this right, use of NHTL and HW "abilities" would
explain why there is no call to change SSP from a machine driver.


If all of this is ok I will send V3 with msleep() removed.
