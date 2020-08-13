Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0E243E27
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 19:17:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE6C71667;
	Thu, 13 Aug 2020 19:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE6C71667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597339076;
	bh=3gO3o7V7FrXIPDDXBeC/XG5mwrVyaeQN2WQzVOm9DsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jclTcPEroDh51IddxcNTLdpWiM2tQfMrHpkjUfcgCmfol+0+8WoUdZ6TV6kjyoTw7
	 YaKlMj8P7PV5OH1DJqfYhbpoyG4Li/IiNN/PbaYhayFNHbQgp0KYRQFkCCKjryRC3j
	 EJLfur026qNzJP1R2cjVrdu9CRUx9pNt3hlR47uI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02FEFF80161;
	Thu, 13 Aug 2020 19:16:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A50DDF8015B; Thu, 13 Aug 2020 19:16:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC848F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 19:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC848F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="U64AEa3y"
Received: by mail-wr1-x442.google.com with SMTP id z18so5955843wrm.12
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tAbE60AfPQ68SFoJfLwXxAhzymsyN9ddwLjjDAk36no=;
 b=U64AEa3ypgo0b0GxsyeuQmYXUbFWfpNdJO6SToZ63kYzeRUKcpZxxUu22Z+/O+B1SE
 LQ29FfOkUFi2kK4ebi32x20f0vDVQ0uSLjRZOOrWJnei4Z3CY9FAPtMVRQV2ahyQKt1M
 QTMiOpRlEwtXg4h7UGMJcg2UtpdD18dC0K0bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tAbE60AfPQ68SFoJfLwXxAhzymsyN9ddwLjjDAk36no=;
 b=DgpSvlelKbof78roAlou/rYNG7tfxuk6PITiHwKSVQf2sw44ch5ytQudQ1tkO4WDoB
 vTXiAVaNJfv4nGNLOm0x86IOyyiRZQ+tnKbJA5ouLfYYfneWjSax73WHYH907z0hQOrT
 aogEaJxFX6NZmxJFOrgW/5HxlIFGLq7gCGT2Q3ldvbDQU6x6+5+USYWiPf2gw7oyz3aS
 EhsFx//xvjgObfIq6UmdRCgpa55ibs3XDolahO4wOaLZkoHwUkCy9CechiJSeETE+3vg
 XrQl59eTPrfzNN4Xp4DeAQVft2HuqMMUwF5ES5TlH5yU6CUQAISiNjKA+gkiSp3PaE5w
 NInQ==
X-Gm-Message-State: AOAM533I4Dsmd5PkaoCtP5oee99UwOL4x/WxcCW9dl8J+Qbnw3FsWFlB
 YWduZi9DpagYXfEZ9dWCRu+lV8fTwImRW7sBH9x8fw==
X-Google-Smtp-Source: ABdhPJxs9I4NCN5HTGmFKOr8ZCysJX7Wt4hfxt+ZjzQO+yc4spS15XTKkNfHlxiKG+9sJfXf5R6khKEqBc03P2cWLlo=
X-Received: by 2002:a05:6000:1091:: with SMTP id
 y17mr5222406wrw.255.1597338966174; 
 Thu, 13 Aug 2020 10:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
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
 <CAGvk5PpvhjyvETcGS0212XnLPaL71A8D2qMW55rSQZxseOffmw@mail.gmail.com>
 <s5h8sejvsrs.wl-tiwai@suse.de>
 <e836596b-8ed8-d85f-8226-a471ab4c23d3@linux.intel.com>
In-Reply-To: <e836596b-8ed8-d85f-8226-a471ab4c23d3@linux.intel.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 14 Aug 2020 01:15:54 +0800
Message-ID: <CAGvk5Pr7t+TqRuBXbkU2PLTaFSZjDzOQLsx747VW__vEpDztsA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 "yuhsuan@google.com" <yuhsuan@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Lu,
 Brent" <brent.lu@intel.com>, Damian van Soelen <dj.vsoelen@gmail.com>
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

Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> =E6=96=BC
2020=E5=B9=B48=E6=9C=8813=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:5=
7=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
>
> On 8/13/20 3:45 AM, Takashi Iwai wrote:
> > On Thu, 13 Aug 2020 10:36:57 +0200,
> > Yu-Hsuan Hsu wrote:
> >>
> >> Lu, Brent <brent.lu@intel.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8813=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:55=E5=AF=AB=E9=81=93=EF=BC=9A
> >>>
> >>>>>>
> >>>>>> CRAS calls snd_pcm_hw_params_set_buffer_size_max() to use as large
> >>>>>> buffer as possible. So the period size is an arbitrary number in
> >>>>>> different platforms. Atom SST platform happens to be 256, and CML
> >>>>>> SOF platform is 1056 for example.
> >>>>>
> >>>>> ok, but earlier in this thread it was mentioned that values such as
> >>>>> 432 are not suitable. the statement above seems to mean the period
> >>>>> actual value is a "don't care", so I don't quite see why this speci=
fic
> >>>>> patch2 restricting the value to 240 is necessary. Patch1 is needed =
for
> >>>>> sure,
> >>>>> Patch2 is where Takashi and I are not convinced.
> >>>>
> >>>> I have downloaded the patch1 but it does not work. After applying pa=
tch1,
> >>>> the default period size changes to 320. However, it also has the sam=
e issue
> >>>> with period size 320. (It can be verified by aplay.)
> >>>
> >>> The period_size is related to the audio latency so it's decided by ap=
plication
> >>> according to the use case it's running. That's why there are concerns=
 about
> >>> patch 2 and also you cannot find similar constraints in other machine=
 driver.
> >> You're right. However, the problem here is the provided period size
> >> does not work. Like 256, setting the period size to 320 also makes
> >> users have big latency in the DSP ring buffer.
> >>
> >> localhost ~ # aplay -Dhw:1,0 --period-size=3D320 --buffer-size=3D640
> >> /dev/zero -d 1 -f dat --test-position
> >> Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48000
> >> Hz, Stereo
> >> Suspicious buffer position (1 total): avail =3D 0, delay =3D 2640, buf=
fer =3D 640
> >> Suspicious buffer position (2 total): avail =3D 0, delay =3D 2640, buf=
fer =3D 640
> >> Suspicious buffer position (3 total): avail =3D 0, delay =3D 2720, buf=
fer =3D 640
> >> ...
> >
> > It means that the delay value returned from the driver is bogus.
> > I suppose it comes pcm_delay value calculated in sst_calc_tstamp(),
> > but haven't followed the code closely yet.  Maybe checking the debug
> > outputs can help to trace what's going wrong.
>
> the problem is really that we add a constraint that the period size be a
> multiple of 1ms, and it's not respected. 320 samples is not a valid
> choice, I don't get how it ends-up being selected? there's a glitch in
> the matrix here.
>
>
Oh sorry that I applied the wrong patch. With the correct patch, the
default period size is 432.
With period size 432, running aplay with --test-position does not show
any errors. However, by cat `/proc/asound/card1/pcm0p/sub0/status`. We
can see the delay is around 3000.
Here are all period sizes I have tried. All buffer sizes are set to 2
* period size.
period size: 192,  delay is a negative number. Not sure what happened.
period size: 240, delay is fixed at 960
period size: 288, delay is around 27XX
period size: 336, delay is around 27XX
period size: 384, delay is around 24XX (no errors from aplay)
period size: 432, delay is around 30XX (no errors from aplay)
period size: 480, delay is fixed at 3120 (no errors from aplay)
period size: 524, delay is around 31XX (no errors from aplay)

Not sure why the delay is around 50ms except for the period size 240.
Is it normal?

Thanks,
Yu-Hsuan
