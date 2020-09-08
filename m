Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2342619B6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 20:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96C621711;
	Tue,  8 Sep 2020 20:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96C621711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599589570;
	bh=v3cYWrMQJAffFhNv1NU+sw+ypDfsKKW1OtvL+xGvo/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfcGZHYyANoJ9vNxojdNORNursv9s0hJ+Ta7rL8Jjtb0nD/7zY94MXkE+sWjndzVo
	 LFcHSiJBKOKgG9iKJDDFHGJmtg7NkTYEwJfgI6lI0apQ1hUkDAKPOkGcPLf8wjPiuh
	 JBwMZ1RStIpHGKIC1uqZlUyodjyW9XlFvLH1S9hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8FA8F8026F;
	Tue,  8 Sep 2020 20:24:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72E22F80264; Tue,  8 Sep 2020 20:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33014F8015F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 20:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33014F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="xCh81xpP"
Received: by mail-wm1-x342.google.com with SMTP id s13so279091wmh.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Sep 2020 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CqUNZPQoWK27ZwluptR7lmOmGnDUgLbIso50mEGeMNA=;
 b=xCh81xpPbIIdQ/7J9jkA8BvZPOWnUqm1dGONxOZSWXkhOX7jZzHxmcL3TN0I/kjql9
 kQbku02XgzFM6c1dJbPQq3FZK0MSAQ9yuP3paVxLJmCeWc7EMlYudhSw6anka+2OqPhl
 NimzWJRhnXEuPRT7W+jk9OnuGF8bPld3Fh/23SGtNqxbsrJqnCrwvIJkwL7qPYjyQX2h
 Am9p5AQOi6QrURcnhsceskJPAlniay5LQjG89pDzzpKgm75/64R+PWvB/0Va2Igqlfgz
 brQdEO679PsYqfo+qeJfsfrznRuNJf286npI71+im+57glbjUdWCAb8v7w/aGkow4jgj
 AtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CqUNZPQoWK27ZwluptR7lmOmGnDUgLbIso50mEGeMNA=;
 b=e+oehvtu4DJG3t2lZsYGIQUzSdz6VPoAbbzbDORLYV6rGGmfSqNwJFGLvOSE9pGSzp
 qXkKo9Y5wqqw4Hx09weYosAZAwY4h5c51k4OZJ4ZpMUB33lcUh9+tfCGYGiLvCJuoVOv
 Vtg6Ud4TqP5OIIlbHrw2/IJQHWU7s/9xK1CXn6lmOZG8BUsZDMny2ZT8KHOMIQZKYG7N
 eqOg0isB+HuCbMfvDEHhtGd1Rsc1hmdgtHbxVpWViqWCcxRhmOHU02qVPFFrq71Z1z0a
 fGfWey1OGKXkaYoXlOWZfzJy6CV9s1hYz2Kmxy+0Old9/SmRkMfeoxZhlTipPd5B74XA
 OFtw==
X-Gm-Message-State: AOAM532Hq19TQmjTavPEubFAZTNeIrpeJOc5DkP6RGzy1InSzwXglS0I
 8tCSUFGJHBtCUuK6OyxVSaFMzrhznTP0tGTvUkTzsQ==
X-Google-Smtp-Source: ABdhPJxOwQbJk9/aV71MTPLxx7a72zVMcRW0Uovfz4WlvN1UIbLkNSAN3qn0cV3Q1nLP9bMLYeSupkeULTRFe8cdiM8=
X-Received: by 2002:a1c:81c6:: with SMTP id c189mr394744wmd.124.1599589460131; 
 Tue, 08 Sep 2020 11:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200501193141.30293-1-rad@semihalf.com>
 <3ad44b75-387f-da75-d7b2-3a16ed00550c@linux.intel.com>
 <CAOs-w0LPeKgooa_98x_Jkzus-Y5Kad7pDby0CriDGb6nTp_6sA@mail.gmail.com>
 <8b97bf43-ddd8-df81-90e7-9e87c19af1ab@linux.intel.com>
 <CAOs-w0KvKcRnDkMtdAV2n_3XLfwk9KgM65QEO=6+qNshobJx3g@mail.gmail.com>
 <2a88f81f-c7a3-f9fc-06a3-c39496b57d0c@linux.intel.com>
In-Reply-To: <2a88f81f-c7a3-f9fc-06a3-c39496b57d0c@linux.intel.com>
From: =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Date: Tue, 8 Sep 2020 20:24:03 +0200
Message-ID: <CAOs-w0KRipoK5xHGf4eDkydd5GPE6HXpnKy1WVZctBkM4CiuDg@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 John Hsu <KCHSU0@nuvoton.com>, Alex Levin <levinale@google.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "Sienkiewicz, Michal" <michal.sienkiewicz@intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

Thanks for the tip!
Let me reformat the patch.

wt., 8 wrz 2020 o 20:06 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):

>
>
>
> On 9/8/20 12:42 PM, Rados=C5=82aw Biernacki wrote:
> > Sorry for missing the response for so long.
> > Somehow lost this thread in my mailbox.
>
> That happens to all of us!
>
> > =C5=9Br., 6 maj 2020 o 00:04 Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> >>
> >>
> >>>>> This single fix address two issues on machines with nau88125:
> >>>>> 1) Audio distortion, due to lack of required clock rate on MCLK lin=
e
> >>>>> 2) Loud audible "pops" on headphones if there is no sysclk during n=
au8825
> >>>>>       playback power up sequence
> >>>>>
> >>>>> Explanation for:
> >>>>> 1) Due to Skylake HW limitation, MCLK pin can only output 24MHz clk
> >>>>>       rate (it can be only connected to XTAL parent clk). The BCLK =
pin
> >>>>>       can be driven by dividers and therefore FW is able to set it =
to rate
> >>>>>       required by chosen audio format. According to nau8825 datashe=
et, 256*FS
> >>>>>       sysclk gives the best audio quality and the only way to achie=
ve this
> >>>>>       (taking into account the above limitations) its to regenerate=
 the MCLK
> >>>>>       from BCLK on nau8825 side by FFL. Without required clk rate, =
audio is
> >>>>>       distorted by added harmonics.
> >>>>
> >>>> The BCLK is going to be a multiple of 50 * Fs due to clocking
> >>>> restrictions. Can the codec regenerate a good-enough sysclk from thi=
s?
> >>>
> >>> According to Intel, silicon has a limitation, on SKL/KBL only clk_id =
=3D
> >>> SKL_XTAL, .name =3D "xtal" is available for IO domain.
> >>> As mentioned in the commit:
> >>> MCLK is generated by using 24MHz Xtal directly or applying a divider
> >>> (so no way of achieving the rate required by audio format).
> >>> BCLK/FS is generated from 24MHz and uses dividers and additional
> >>> padding bits are used to match the clock source.
> >>> Next gen silicon has the possibility of using additional clock source=
s.
> >>>
> >>> Summing up, using MCLK from SKL to NAU88L25 is not an option.
> >>> The only option we found is to use BCLK and regen the required clock
> >>> rate by FLL on the NAU88l25 side.
> >>
> >> Right, this 24 MHz is a recurring problem.
> >> But what I was asking was if the NAU8825 is fine working with e.g. a
> >> 2.4MHz bit clock. i.e. with 25 bit slots or padding at the end of the =
frame?
> >
> >  From our tests NAU8825 is working fine with these parameters.
> > Also the output audio signal looks fine on the scope and FFT and there
> > are no audible glitches.
> >
> >>
> >>>
> >>>>>
> >>>>> 2) Currently Skylake does not output MCLK/FS when the back-end DAI =
op
> >>>>>       hw_param is called, so we cannot switch to MCLK/FS in hw_para=
m.  This
> >>>>>       patch reduces pop by letting nau8825 keep using its internal =
VCO clock
> >>>>>       during widget power up sequence, until SNDRV_PCM_TRIGGER_STAR=
T when
> >>>>>       MCLK/FS is available. Once device resumes, the system will on=
ly enable
> >>>>>       power sequence for playback without doing hardware parameter,=
 audio
> >>>>>       format, and PLL configure. In the mean time, the jack detecio=
n sequence
> >>>>>       has changed PLL parameters and switched to internal clock. Th=
us, the
> >>>>>       playback signal distorted without correct PLL parameters.  Th=
at is why
> >>>>>       we need to configure the PLL again in SNDRV_PCM_TRIGGER_RESUM=
E case.
> >>>>
> >>>> IIRC the FS can be controlled with the clk_ api with the Skylake dri=
ver,
> >>>> as done for some KBL platforms. Or is this not supported by the firm=
ware
> >>>> used by this machine?
> >>>
> >>> According to Ben, SKL had limitations in FW for managing the clk's
> >>> back in the days.
> >>> Can you point to the other driver you mention so we can cross check?
> >>
> >> There are two KBL drivers that control the SSP clocks from the machine
> >> driver, but indeed I don't know if this would work on Firmware, it'd b=
e
> >> a question for Lech/Cezary.
> >>
> >> kbl_rt5663_max98927.c:          ret =3D clk_prepare_enable(priv->mclk)=
;
> >> kbl_rt5663_max98927.c:          ret =3D clk_prepare_enable(priv->sclk)=
;
> >> kbl_rt5663_rt5514_max98927.c:           ret =3D
> >> clk_prepare_enable(priv->mclk);
> >> kbl_rt5663_rt5514_max98927.c:           ret =3D
> >> clk_prepare_enable(priv->sclk);
> >> kbl_rt5663_rt5514_max98927.c:                   ret =3D
> >> clk_prepare_enable(priv->mclk);
> >>
> >
> > Czarek answered this and we got the same response from other Intel
> > devs while consulting this change:
> > FW cannot request a chosen rate (48k) for MCLK pin as it does not
> > "align with what's present on SKL hw".
> >
> > The only way we found out for NAU8825 to cooperate at chosen rate with
> > SKL HW is to regen the MCLK from BCLK by FLL as mentioned above.
> > NHTL is used to set SSP0 (48k, 24/25 bit on 24MHz crystal).
> > If I get all of this right, use of NHTL and HW "abilities" would
> > explain why there is no call to change SSP from a machine driver.
> >
> >
> > If all of this is ok I will send V3 with msleep() removed.
>
> Sounds good.
>
> You may want to simplify your commit message and just state what you
> described, e.g.
>
> "Since 64xfs clocks cannot be generated, the NAU8825 is configured to
> re-generate its system clock from the BCLK using the FLL. The link is
> configured to use a 48kHz frame rate, and 24 bits in 25-bit slot. The
> SSP configuration is extracted from NHLT settings and not dynamically
> changed. Listening tests and measurements do not show any distortion or
> issues".
>
>
>
