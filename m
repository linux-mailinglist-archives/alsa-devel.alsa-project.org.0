Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F174E241835
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 10:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A34C21667;
	Tue, 11 Aug 2020 10:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A34C21667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597134447;
	bh=E4nfuEGaEOrZNuOSuLHBoZg7SsbYsG1qt4ORcj9gl/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdCCQ4nZQHdnp+RmzjbU4bUDvp/kSLqkKf0ESNOyNKRlM4zdiR0V3t4/m5bYpPkSH
	 49WaNtp9RaJ5IGOJWaZ0qhZbMuZiXEyWgDBWWjK1nK/eRxveX7+BN/bYRebdfjvK1I
	 9EGq88RoA/mrjqf6fbq7rYH0HO+wTd6E8Dnb8/Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D018BF800BC;
	Tue, 11 Aug 2020 10:25:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3729BF8015B; Tue, 11 Aug 2020 10:25:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 396D6F800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 10:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 396D6F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Ghue3xrO"
Received: by mail-wm1-x342.google.com with SMTP id 184so2003396wmb.0
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 01:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s4WfRm8FL/l3vhau3PXNvN3lXdJUqSYFtG1h+otOPkA=;
 b=Ghue3xrOtNhufzYQGfXg/CZW/hyk0FgPLGhC7FEOBZzB63zistsT+SbJ43i8BpMid9
 Zpd3qyTjLgKkuC/hCjCQWSf0eDU0CnK8G1QfwjXWat9QoQTVfNAFpwJNFdK+IDWEbujX
 NueiMNP3/qlT3snIibb25eZGOTnRB5bFoa5Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s4WfRm8FL/l3vhau3PXNvN3lXdJUqSYFtG1h+otOPkA=;
 b=pSvPh58LCHS4R1GGiufFj64ir7iMhRFiOWElToeTS3aZjFhz5l6/dZ8kJBKTPIC3Nu
 N0/JxJkZEpKYi+X3jSANn8cdABC77bcLkvQZNqcCGjauUfwo2Vc/97FukFBViZogL0v3
 H7vJRtTyQ5eyncLt63UMQUEIfhdIn1mUunEJppBforIoUPd3rMTFBxq6gA6XSVHlK8B2
 juEeYPm3WIqbuv9PEFGC5zbXgo9skLLWmIIFqEp0EOvlPc6qzCYphqhtooYsRX5vVJCw
 gY3w9tFoV6Tqi4zdIHhr3kxgieP2BrGyZSAPMFy+d9cYaqXdtkvASRFSqedw00hQ6Hbl
 eDbA==
X-Gm-Message-State: AOAM532vIk4ZtKyM+GCEb3ePcn7nbFk7eX9oz6nG+VEW3+NQt0BL0BJb
 rms8JEJG/fDNyz1s+wHLUuO4k1zofx4xYCkIOcaydQ==
X-Google-Smtp-Source: ABdhPJwjb89iO8CnJzAD6D8G5SaTNey2aeRIeFGTY6hY7rG3v1COnZB5ucBxyvm0UwEdRBuaOI6zY0/AiQ/wzBwJhHw=
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr3123230wmk.17.1597134333428;
 Tue, 11 Aug 2020 01:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-3-git-send-email-brent.lu@intel.com>
 <s5h5za3ajvb.wl-tiwai@suse.de>
 <DM6PR11MB3642AE90DF98956CCEDE6C2F974F0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hd04a90o4.wl-tiwai@suse.de>
 <DM6PR11MB3642B5BC2E1E0708088526D8974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <63bca214-3434-16c6-1b60-adf323aec554@linux.intel.com>
 <DM6PR11MB3642D9BE1E5DAAB8B78B84B0974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hpn873by6.wl-tiwai@suse.de>
 <DM6PR11MB36423A9D28134811AD5A911F974A0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <6466847a-8aae-24f7-d727-36ba75e95f98@linux.intel.com>
 <DM6PR11MB364259049769F6EF3B84AABD97480@DM6PR11MB3642.namprd11.prod.outlook.com>
 <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <CAGvk5PohOP0Yv22tb53EX=ZLB9_vOMb=iujTh64OvHmjC1d4mg@mail.gmail.com>
 <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
 <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
 <s5htux939x1.wl-tiwai@suse.de>
In-Reply-To: <s5htux939x1.wl-tiwai@suse.de>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Tue, 11 Aug 2020 16:25:22 +0800
Message-ID: <CAGvk5PpcmkZ2HarqeCDaXm4id=84wYs-u4vWxJunHaf09gj66g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
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

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2020=E5=B9=B48=E6=9C=8811=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 11 Aug 2020 04:29:24 +0200,
> Yu-Hsuan Hsu wrote:
> >
> > Lu, Brent <brent.lu@intel.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:17=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > >
> > > > Sorry for the late reply. CRAS does not set the period size when us=
ing it.
> > > > The default period size is 256, which consumes the samples quickly(=
about 49627
> > > > fps when the rate is 48000 fps) at the beginning of the playback.
> > > > Since CRAS write samples with the fixed frequency, it triggers unde=
rruns
> > > > immidiately.
> > > >
> > > > According to Brent, the DSP is using 240 period regardless the hw_p=
aram. If the
> > > > period size is 256, DSP will read 256 samples each time but only co=
nsume 240
> > > > samples until the ring buffer of DSP is full. This behavior makes t=
he samples in
> > > > the ring buffer of kernel consumed quickly. (Not sure whether the e=
xplanation is
> > > > correct. Need Brent to confirm it.)
> > > >
> > > > Unfortunately, we can not change the behavior of DSP. After some ex=
periments,
> > > > we found that the issue can be fixed if we set the period size to 2=
40. With the
> > > > same frequency as the DSP, the samples are consumed stably. Because=
 everyone
> > > > can trigger this issue when using the driver without setting the pe=
riod size, we
> > > > think it is a general issue that should be fixed in the kernel.
> > >
> > > I check the code and just realized CRAS does nothing but request maxi=
mum buffer
> > > size. As I know the application needs to decide the buffer time and p=
eriod time so
> > > ALSA could generate a hw_param structure with proper period size inst=
ead of using
> > > fixed constraint in machine driver because driver has no idea about t=
he latency you
> > > want.
> > >
> > > You can use snd_pcm_hw_params_set_buffer_time_near() and
> > > snd_pcm_hw_params_set_period_time_near() to get a proper configuratio=
n of
> > > buffer and period parameters according to the latency requirement. In=
 the CRAS
> > > code, there is a UCM variable to support this: DmaPeriodMicrosecs. I =
tested it on
> > > Celes and it looks quite promising. It seems to me that adding constr=
aint in machine
> > > driver is not necessary.
> > >
> > > SectionDevice."Speaker".0 {
> > >         Value {
> > >                 PlaybackPCM "hw:chtrt5650,0"
> > >                 DmaPeriodMicrosecs "5000"
> > > ...
> > >
> > > [   52.434761] sound pcmC1D0p: hw_param
> > > [   52.434767] sound pcmC1D0p:   ACCESS 0x1
> > > [   52.434770] sound pcmC1D0p:   FORMAT 0x4
> > > [   52.434772] sound pcmC1D0p:   SUBFORMAT 0x1
> > > [   52.434776] sound pcmC1D0p:   SAMPLE_BITS [16:16]
> > > [   52.434779] sound pcmC1D0p:   FRAME_BITS [32:32]
> > > [   52.434782] sound pcmC1D0p:   CHANNELS [2:2]
> > > [   52.434785] sound pcmC1D0p:   RATE [48000:48000]
> > > [   52.434788] sound pcmC1D0p:   PERIOD_TIME [5000:5000]
> > > [   52.434791] sound pcmC1D0p:   PERIOD_SIZE [240:240]
> > > [   52.434794] sound pcmC1D0p:   PERIOD_BYTES [960:960]
> > > [   52.434797] sound pcmC1D0p:   PERIODS [852:852]
> > > [   52.434799] sound pcmC1D0p:   BUFFER_TIME [4260000:4260000]
> > > [   52.434802] sound pcmC1D0p:   BUFFER_SIZE [204480:204480]
> > > [   52.434805] sound pcmC1D0p:   BUFFER_BYTES [817920:817920]
> > > [   52.434808] sound pcmC1D0p:   TICK_TIME [0:0]
> > >
> > > Regards,
> > > Brent
> > Hi Brent,
> >
> > Yes, I know we can do it to fix the issue as well. As I mentioned
> > before, we wanted to fix it in kernel because it is a real issue,
> > isn't it? Basically, a driver should work with any param it supports.
> > But in this case, everyone can trigger underrun if he or she does not
> > the period size to 240. If you still think it's not necessary, I can
> > modify UCM to make CRAS set the appropriate period size.
>
> How does it *not* work if you set other than period size 240, more
> exactly?
>
> The hw_constraint to a fixed period size must be really an exception.
> If you look at other drivers, you won't find any other doing such.
> It already indicates that something is wrong.
>
> Usually the fixed period size comes from the hardware limitation and
> defined in snd_pcm_hardware.  Or, sometimes it's an alignment issue.
> If you need more than that, you should doubt what's really not
> working.
>
>
> Takashi
Thank Takashi,

As I mentioned before, if the period size is set to 256, the measured
rate of sample-consuming will be around 49627 fps. It causes underrun
because the rate we set is 48000 fps. This behavior also happen on the
other period rate except for 240.

Thanks,
Yu-Hsuan
