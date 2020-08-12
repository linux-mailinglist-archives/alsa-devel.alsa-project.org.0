Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B62425AA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 08:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAED166F;
	Wed, 12 Aug 2020 08:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAED166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597215349;
	bh=fHM8kooaftEcpEwFWLUNiqCaoBVbQxBVH+ZMGJg3zZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hwppmxNlSjgJLALNnKnC4Re/tnXMnrR/60r7Xr3PqY4lsUy37eVNiFsAeddBwTdaZ
	 BB2ZM2OXiiweWslvvDr3LPEm+QKYOpKrOp0sbDRPiYspYqCj5Rq4vxBcZ/91Uh3BB9
	 QT13FMnk/QOdUPju4y28jv0ApkIb+Eswzsx5u5YU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D3BF8022D;
	Wed, 12 Aug 2020 08:54:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 602A5F8022B; Wed, 12 Aug 2020 08:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36581F80147
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 08:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36581F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="oAfjJAce"
Received: by mail-wm1-x344.google.com with SMTP id g8so822907wmk.3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 23:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5PxYpoistIMDkzVoXu/DF+OKZP+LWyNIDFgp+6XLH8I=;
 b=oAfjJAce8ABKQvf952VhJBQL/twLLYi2JsLBOYlWJmXaR5mlqmooNocY5HotN6JWcg
 moyeJSdoaK0ZAj1KzpitphhkCOSbNS6V7SNVOFka4kwJounWpUKyyPNOCRRl9O32PHeI
 xTTeGCW9AGVyMXyGibWejAVSOA1VTbNvr3P2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5PxYpoistIMDkzVoXu/DF+OKZP+LWyNIDFgp+6XLH8I=;
 b=j/ke6jxYr58BDBz3g05PWWA448rPTd5vfEx6ce4M7DMwui5QTdmkofBQRAxDI3bvwh
 yiNh8ZnCs76WhFlUemNHFT/xm7Z8rReVoXSeDoMoip9KjODBYoBS2VgZz6RAufYQv9q6
 MQs+z38cPgIZOrGvo2330Q4mLhhicjSFGahrDWbnpsC8SU8mA2FXjLunl/eUsilF0CEf
 2rgrpCZxuMwPaEbidDlUxqZiLWy2NGVZTFQw5RUZMu9dvOCMdyol6Dq4JPfySzyApecT
 mcBQMjmaCYrpAvRbWIGSDhEH0iIgU1vncHRPh7mwvwEL29w1+i0GMX7jawqLywfIeUXY
 qsDA==
X-Gm-Message-State: AOAM5309c5jfb9OJ232tczzugQLn4u5alV1vxsA+u9CSuH3jXzazQC/a
 iu2xf2g8K4m1ikLtxByv+fhuaUViBsxz8Epnnx0QwQ==
X-Google-Smtp-Source: ABdhPJwmrQM5NEWqbmhzLiERHAIBBPHOpmkAXiOZyi7OpZyDkG7y7E/e/4P/2RL/eHYo+fjCnasuTBBKK4KjRyAFoY0=
X-Received: by 2002:a05:600c:2302:: with SMTP id
 2mr7373609wmo.151.1597215233986; 
 Tue, 11 Aug 2020 23:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <CAGvk5PohOP0Yv22tb53EX=ZLB9_vOMb=iujTh64OvHmjC1d4mg@mail.gmail.com>
 <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
 <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
 <s5htux939x1.wl-tiwai@suse.de>
 <CAGvk5PpcmkZ2HarqeCDaXm4id=84wYs-u4vWxJunHaf09gj66g@mail.gmail.com>
 <s5ho8nh37br.wl-tiwai@suse.de>
 <CAGvk5PphzkdiNfW8hiDuqX+2eQO2FvrpzA0qR3=3VvqM3GBhAA@mail.gmail.com>
 <20200811145353.GG6967@sirena.org.uk>
 <d78f9adc-d583-f0f2-ce38-3c9175c939b8@linux.intel.com>
 <20200811172209.GM6967@sirena.org.uk>
 <CAGvk5PqGi7cXthLHFi4NyypxFiGnoHvD9vp+5nJdH-_VkVvcKw@mail.gmail.com>
 <s5hr1scz908.wl-tiwai@suse.de>
In-Reply-To: <s5hr1scz908.wl-tiwai@suse.de>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Wed, 12 Aug 2020 14:53:42 +0800
Message-ID: <CAGvk5Pp+Gk5Uk-iLdhVPWuCL0FiL9OhsaAtwkotay5JAYUNxdQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 "yuhsuan@google.com" <yuhsuan@google.com>, "Lu, Brent" <brent.lu@intel.com>,
 Damian van Soelen <dj.vsoelen@gmail.com>
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

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2020=E5=B9=B48=E6=9C=8812=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 12 Aug 2020 05:09:58 +0200,
> Yu-Hsuan Hsu wrote:
> >
> > Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:22=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Tue, Aug 11, 2020 at 11:54:38AM -0500, Pierre-Louis Bossart wrote:
> > >
> > > > > constraint logic needs to know about this DSP limitation - it see=
ms like
> > > > > none of this is going to change without something new going into =
the
> > > > > mix?  We at least need a new question to ask about the DSP firmwa=
re I
> > > > > think.
> > >
> > > > I just tested aplay -Dhw: on a Cyan Chromebook with the Ubuntu kern=
el 5.4,
> > > > and I see no issues with the 240 sample period. Same with 432, 960,=
 9600,
> > > > etc.
> > >
> > > > I also tried just for fun what happens with 256 samples, and I don'=
t see any
> > > > underflows thrown either, so I am wondering what exactly the proble=
m is?
> > > > Something's not adding up. I would definitively favor multiple of 1=
ms
> > > > periods, since it's the only case that was productized, but there's=
 got to
> > > > me something a side effect of how CRAS programs the hw_params.
> > >
> > > Is it something that goes wrong with longer playbacks possibly (eg,
> > > someone watching a feature film or something)?
> >
> > Thanks for testing!
> >
> > After doing some experiments, I think I can identify the problem more p=
recisely.
> > 1. aplay can not reproduce this issue because it writes samples
> > immediately when there are some space in the buffer. However, you can
> > add --test-position to see how the delay grows with period size 256.
> > > aplay -Dhw:1,0 --period-size=3D256 --buffer-size=3D480 /dev/zero -d 1=
 -f dat --test-position
> > Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48000
> > Hz, Stereo
> > Suspicious buffer position (1 total): avail =3D 0, delay =3D 2064, buff=
er =3D 512
> > Suspicious buffer position (2 total): avail =3D 0, delay =3D 2064, buff=
er =3D 512
> > Suspicious buffer position (3 total): avail =3D 0, delay =3D 2096, buff=
er =3D 512
> > ...
>
> Isn't this about the alignment of the buffer size against the period
> size, not the period size itself?  i.e. in the example above, the
> buffer size isn't a multiple of period size, and DSP can't handle if
> the position overlaps the buffer size in a half way.
>
> If that's the problem (and it's an oft-seen restriction), the right
> constraint is
>   snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
>
>
> Takashi
Oh sorry for my typo. The issue happens no matter what buffer size is
set. Actually, even if I want to set 480, it will change to 512
automatically.
Suspicious buffer position (1 total): avail =3D 0, delay =3D 2064, buffer
=3D 512 <-this one is the buffer size

>
> > 2. Since many samples are moved to DSP(delay), the measured rate of
> > the ring-buffer is high. (I measured it by alsa_conformance_test,
> > which only test the sampling rate in the ring buffer of kernel not
> > DSP)
> >
> > 3. Since CRAS writes samples with a fixed frequency, this behavior
> > will take all samples from the ring buffer, which is seen as underrun
> > by CRAS. (It seems that it is not a real underrun because that avail
> > does not larger than buffer size. Maybe CRAS should also take dalay
> > into account.)
> >
> > 4. In spite of it is not a real underrun, the large delay is still a
> > big problem. Can we apply the constraint to fix it? Or any better
> > idea?
> >
> > Thanks,
> > Yu-Hsuan
> >
