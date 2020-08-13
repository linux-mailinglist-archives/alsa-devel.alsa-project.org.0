Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 939AB2436BC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 10:39:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAE21667;
	Thu, 13 Aug 2020 10:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAE21667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597307943;
	bh=tHfNg+oz1iFo1kIypdHpDVPeAwijPwbDmK8EFi7isTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLBn89OYv5Vy/xi1449ku5G0qbh54FYmZqCm9mVml+kFhQGYLdsBATHbT9ptDotPf
	 +/7c8jK3aAYVZHgT8No0gnJMF+kDxyJ9UQexQ5ar1pO/vJRODkHq+BIV8LLgSOuBUN
	 tVCYjXlmtHxuajgcQrRQ/oNFyOLcAaZjvmTdVCVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5547CF800D3;
	Thu, 13 Aug 2020 10:37:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 239B9F8015B; Thu, 13 Aug 2020 10:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1816DF800D3
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 10:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1816DF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RaANlNLy"
Received: by mail-wr1-x443.google.com with SMTP id l2so4469866wrc.7
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tHfNg+oz1iFo1kIypdHpDVPeAwijPwbDmK8EFi7isTw=;
 b=RaANlNLy55/o434DpdV6u2gR9c16G4xX/0gKg23ymRnBUWtUtkoERDNpSg0s2qbtTc
 KbhLHLaRt8ElU0lWzafzrtumltwvzL2XRWMj1vdaO7iI8/hXsbyp8aGznR/NPybjXWJl
 HSSJTJTn0h7/TFGgTXXaOwe61bfCKkFCUQEa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tHfNg+oz1iFo1kIypdHpDVPeAwijPwbDmK8EFi7isTw=;
 b=Q/VZ7wOCgFR632K3DkQmSANEkNbC+zejByPu1zN1OrHPguZdbTv9bt4qmFomtUTsGA
 mzZUVtT60XahS0L84lpAYdLP/A9wDzM5Ig/mpkHmhn6K0I8hQzNaHzEgeggsEbKgq0GJ
 yg94Zy+XYGU9HMxj7IJhscDw5wmpzEuEdWqEvxB0j1Fa/QcSVAlhI6LKIoSCnSkU4WHw
 vfmoB88haacvN2T3vpVXmm4uFm9Z/ZiuDpzFC2uF3mFQggTpkFSM8CS3FeR2wuLUbSnW
 tHGmZ1gxS79FC8VXPe/fIa4lRHXPebxYvByE5aZtT7uJTAgPrLNmIhSVIx5sAmIjVxO8
 jSYw==
X-Gm-Message-State: AOAM532FUW7i99yaevzEJB59NpzTSH7C/zLjT6y9Ks6oP3Y1QR03Bl+f
 0XodqjWAShuoEN5eE6Sij7rvK6lh0c4mxkEL3BbrkQ==
X-Google-Smtp-Source: ABdhPJxUtZV8utD6dg9pUwdj+7jlKvLJZjolnEglK2vvdoxDxbGiAO09XwrzMbaWIWfh6AwA4SYUQyFTwl+nLL+c2dQ=
X-Received: by 2002:a05:6000:1091:: with SMTP id
 y17mr3100945wrw.255.1597307829173; 
 Thu, 13 Aug 2020 01:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
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
 <CAGvk5Pq3rEGJX=WjriPfWg_sEAVWHGZ9S=4iySNfYaHX7Xcw0g@mail.gmail.com>
 <s5h8sekz4ox.wl-tiwai@suse.de>
 <e4cc6231-8b19-c145-1b18-91d3a00131d3@linux.intel.com>
 <s5hv9hnx6am.wl-tiwai@suse.de>
 <be45d821-57c6-6ca5-0864-ac3aa521d82e@linux.intel.com>
 <DM6PR11MB364242D3652EDC2F9B8B214897420@DM6PR11MB3642.namprd11.prod.outlook.com>
 <0714b222-d3fc-5744-1147-bfac7df2651e@linux.intel.com>
 <CAGvk5Pqg000SnrRhVD+8cOtAVokomRSa6MLdaKKnY2P6R_ruGA@mail.gmail.com>
 <DM6PR11MB364285D8B21B723EB88915CB97430@DM6PR11MB3642.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB364285D8B21B723EB88915CB97430@DM6PR11MB3642.namprd11.prod.outlook.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Thu, 13 Aug 2020 16:36:57 +0800
Message-ID: <CAGvk5PpvhjyvETcGS0212XnLPaL71A8D2qMW55rSQZxseOffmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: "Lu, Brent" <brent.lu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 "yuhsuan@google.com" <yuhsuan@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

Lu, Brent <brent.lu@intel.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8813=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > > >
> > > > CRAS calls snd_pcm_hw_params_set_buffer_size_max() to use as large
> > > > buffer as possible. So the period size is an arbitrary number in
> > > > different platforms. Atom SST platform happens to be 256, and CML
> > > > SOF platform is 1056 for example.
> > >
> > > ok, but earlier in this thread it was mentioned that values such as
> > > 432 are not suitable. the statement above seems to mean the period
> > > actual value is a "don't care", so I don't quite see why this specifi=
c
> > > patch2 restricting the value to 240 is necessary. Patch1 is needed fo=
r
> > > sure,
> > > Patch2 is where Takashi and I are not convinced.
> >
> > I have downloaded the patch1 but it does not work. After applying patch=
1,
> > the default period size changes to 320. However, it also has the same i=
ssue
> > with period size 320. (It can be verified by aplay.)
>
> The period_size is related to the audio latency so it's decided by applic=
ation
> according to the use case it's running. That's why there are concerns abo=
ut
> patch 2 and also you cannot find similar constraints in other machine dri=
ver.
You're right. However, the problem here is the provided period size
does not work. Like 256, setting the period size to 320 also makes
users have big latency in the DSP ring buffer.

localhost ~ # aplay -Dhw:1,0 --period-size=3D320 --buffer-size=3D640
/dev/zero -d 1 -f dat --test-position
Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48000
Hz, Stereo
Suspicious buffer position (1 total): avail =3D 0, delay =3D 2640, buffer =
=3D 640
Suspicious buffer position (2 total): avail =3D 0, delay =3D 2640, buffer =
=3D 640
Suspicious buffer position (3 total): avail =3D 0, delay =3D 2720, buffer =
=3D 640
...

>
> Another problem is the buffer size. Too large buffer is not just wasting =
memories.
> It also creates problems to memory allocator since continuous pages are n=
ot
> always there. Using a small period_count like 2 or 4 should be sufficient=
 for audio
> data transfer.
>
> buffer_size =3D period_size * period_count * 1000000 / sample_rate;
> snd_pcm_hw_params_set_buffer_time_near(mPcmDevice, params, &buffer_size, =
NULL);
>
> And one more problem here: you need to decide period_size and period_coun=
t
> first in order to calculate the buffer size...
It's a good point. I will bring it up to our team and see whether we
can use the smaller buffer size. Thanks!
>
>
> Regards,
> Brent

Thanks,
Yu-Hsuan
