Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E162D24263D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 09:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 598DE1669;
	Wed, 12 Aug 2020 09:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 598DE1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597218328;
	bh=5dtJn44x7OKFcr8TLj5OJrA2ISXXX2Km2r059gIizyo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UEYryo3T4FL8POkMTzTRk9hfL3WnsqfI+sU8VhICsZgvRj+V6CQJ0iM5mNu26YGGP
	 xgn1R63Z2RyL185nHH8OQL0EQfNJj307vvBoZSopsKR5qDkbmXG6yJo/oSNIDr9Lrs
	 X4FDPXI09HJX53rmNzxwfhraHre61063bAOjSLJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89D68F800F4;
	Wed, 12 Aug 2020 09:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76AFEF8022B; Wed, 12 Aug 2020 09:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9882AF800F4
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 09:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9882AF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hol+hh8J"
Received: by mail-wr1-x441.google.com with SMTP id 88so1098202wrh.3
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 00:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ga6T3Cy+kh1TnFrSU/BgLt86L1Ae+2hwNAjs8j02oF8=;
 b=hol+hh8JjG7+8Td5Y3AZkrMiWi6c+FnjZIx0uZ4RnrL55vZ7MusPGjbo/QfAgeQmJ1
 o9lkuGe+HE4Ohw3X382P5Kqpd3BPeuEwO8oeqL501BcCWdME9Mh4lbl96TzX4Gnjx1nb
 yUMwCY92PsBTHeo7NxMJbPtWsyl6AgtUQfKrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ga6T3Cy+kh1TnFrSU/BgLt86L1Ae+2hwNAjs8j02oF8=;
 b=Jz5I++bwl/5u7SxDBfv/1Q3ZOnNx8+pyz45HlF9Nca/+aoOskDnpCugtydSnY7jNZ2
 h4RyqakdQxiCHjbREuWjV2GRRk4AQ9L5N8frwIF064xWacRxiGQVm0Sl5Xsgfa+bqR+j
 d6MT/G4SvXh+flrv08cLNLjsYnT0GA8Lcv0ka6WtgmQN0KerqUCjqsHOzO5O1FFPW6L1
 s6Mtb/smyPZ7yqoIBFRoUgQtV51kTOGWX2ezm2XvvS1X6xF0ISX+fHF0bXbjqBKPk3JU
 BSWMpfvyO4g4UleT1bDTtU3wK0aBYV7659XKTUL2zKqlGnACjS2+t1KW82dt13/9tGjX
 JQFw==
X-Gm-Message-State: AOAM530IteUiLhAeaYXbN50qz0YeQTHn3hazLhMt7NN+ipMbVR2CZ2Rh
 4U0L+9cOtezuKw55ZV9gQimwIXdRElP6hy+xMFs8+Q==
X-Google-Smtp-Source: ABdhPJyoyVFNUCQzV+GdngHdYV/Kl2T2efj6sEyjpzqgjLkdb1V9rB0pF/Z+jW3c9VLxtezHJOrfD4PS+K7JdIvDJww=
X-Received: by 2002:adf:c981:: with SMTP id f1mr32180609wrh.14.1597218213822; 
 Wed, 12 Aug 2020 00:43:33 -0700 (PDT)
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
 <CAGvk5Pp+Gk5Uk-iLdhVPWuCL0FiL9OhsaAtwkotay5JAYUNxdQ@mail.gmail.com>
 <s5hlfikz6y8.wl-tiwai@suse.de>
In-Reply-To: <s5hlfikz6y8.wl-tiwai@suse.de>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Wed, 12 Aug 2020 15:43:22 +0800
Message-ID: <CAGvk5Pq3rEGJX=WjriPfWg_sEAVWHGZ9S=4iySNfYaHX7Xcw0g@mail.gmail.com>
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
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 12 Aug 2020 08:53:42 +0200,
> Yu-Hsuan Hsu wrote:
> >
> > Takashi Iwai <tiwai@suse.de> =E6=96=BC 2020=E5=B9=B48=E6=9C=8812=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:14=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Wed, 12 Aug 2020 05:09:58 +0200,
> > > Yu-Hsuan Hsu wrote:
> > > >
> > > > Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=8812=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > >
> > > > > On Tue, Aug 11, 2020 at 11:54:38AM -0500, Pierre-Louis Bossart wr=
ote:
> > > > >
> > > > > > > constraint logic needs to know about this DSP limitation - it=
 seems like
> > > > > > > none of this is going to change without something new going i=
nto the
> > > > > > > mix?  We at least need a new question to ask about the DSP fi=
rmware I
> > > > > > > think.
> > > > >
> > > > > > I just tested aplay -Dhw: on a Cyan Chromebook with the Ubuntu =
kernel 5.4,
> > > > > > and I see no issues with the 240 sample period. Same with 432, =
960, 9600,
> > > > > > etc.
> > > > >
> > > > > > I also tried just for fun what happens with 256 samples, and I =
don't see any
> > > > > > underflows thrown either, so I am wondering what exactly the pr=
oblem is?
> > > > > > Something's not adding up. I would definitively favor multiple =
of 1ms
> > > > > > periods, since it's the only case that was productized, but the=
re's got to
> > > > > > me something a side effect of how CRAS programs the hw_params.
> > > > >
> > > > > Is it something that goes wrong with longer playbacks possibly (e=
g,
> > > > > someone watching a feature film or something)?
> > > >
> > > > Thanks for testing!
> > > >
> > > > After doing some experiments, I think I can identify the problem mo=
re precisely.
> > > > 1. aplay can not reproduce this issue because it writes samples
> > > > immediately when there are some space in the buffer. However, you c=
an
> > > > add --test-position to see how the delay grows with period size 256=
.
> > > > > aplay -Dhw:1,0 --period-size=3D256 --buffer-size=3D480 /dev/zero =
-d 1 -f dat --test-position
> > > > Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48=
000
> > > > Hz, Stereo
> > > > Suspicious buffer position (1 total): avail =3D 0, delay =3D 2064, =
buffer =3D 512
> > > > Suspicious buffer position (2 total): avail =3D 0, delay =3D 2064, =
buffer =3D 512
> > > > Suspicious buffer position (3 total): avail =3D 0, delay =3D 2096, =
buffer =3D 512
> > > > ...
> > >
> > > Isn't this about the alignment of the buffer size against the period
> > > size, not the period size itself?  i.e. in the example above, the
> > > buffer size isn't a multiple of period size, and DSP can't handle if
> > > the position overlaps the buffer size in a half way.
> > >
> > > If that's the problem (and it's an oft-seen restriction), the right
> > > constraint is
> > >   snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
> > >
> > >
> > > Takashi
> > Oh sorry for my typo. The issue happens no matter what buffer size is
> > set. Actually, even if I want to set 480, it will change to 512
> > automatically.
> > Suspicious buffer position (1 total): avail =3D 0, delay =3D 2064, buff=
er
> > =3D 512 <-this one is the buffer size
>
> OK, then it means that the buffer size alignment is already in place.
>
> And this large delay won't happen if you use period size 240?
>
>
> Takashi
Yes! If I set the period size to 240, it will not print "Suspicious
buffer position ..."

Yu-Hsuan

>
> > > > 2. Since many samples are moved to DSP(delay), the measured rate of
> > > > the ring-buffer is high. (I measured it by alsa_conformance_test,
> > > > which only test the sampling rate in the ring buffer of kernel not
> > > > DSP)
> > > >
> > > > 3. Since CRAS writes samples with a fixed frequency, this behavior
> > > > will take all samples from the ring buffer, which is seen as underr=
un
> > > > by CRAS. (It seems that it is not a real underrun because that avai=
l
> > > > does not larger than buffer size. Maybe CRAS should also take dalay
> > > > into account.)
> > > >
> > > > 4. In spite of it is not a real underrun, the large delay is still =
a
> > > > big problem. Can we apply the constraint to fix it? Or any better
> > > > idea?
> > > >
> > > > Thanks,
> > > > Yu-Hsuan
> > > >
> >
