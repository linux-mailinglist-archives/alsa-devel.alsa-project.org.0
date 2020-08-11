Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B12414F8
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 04:31:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B07691666;
	Tue, 11 Aug 2020 04:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B07691666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597113088;
	bh=UVrU0zKKXVrbjPDhFS5aWP6SA16dSJe0O5nB+/8sDCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Taj7TjFS8uolwF90FbxpAVoVzVbVyqhDQG2hp1FwYTBICdEDEZA2PsUI/WJgar4H8
	 SuRIswEuKCVKdX33Nc161NnndxIKBF9Ndd4tlrSevbCDCXPGcGjthsv2AVNASSU+14
	 gGEZmuuGS9z61kZA0qJy1JKHcnpuOG1lX07WRBzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7140F8014C;
	Tue, 11 Aug 2020 04:29:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E759BF8015B; Tue, 11 Aug 2020 04:29:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A24E3F800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 04:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A24E3F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="N2WbK4V7"
Received: by mail-wr1-x442.google.com with SMTP id f7so10006577wrw.1
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 19:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X/70H9Q9Fhe0k/LriAao6FGlrMhsC+D8fqJ9Zp1ZId4=;
 b=N2WbK4V7NzZoluibv/IR/Gzljh6tqtfJ/HQoZPGT8RLzw4W9/AYC6qP+gJsB9ipiQr
 +uptnGJbKGryZfnLgJxPqBQngbIbplDCSCXKV9762jRcXc0oT4S/4EqAsN+t0cQC3yRC
 wviLx4Exwt8aWJVNWbWd4WzlufM9CTBKe82YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X/70H9Q9Fhe0k/LriAao6FGlrMhsC+D8fqJ9Zp1ZId4=;
 b=tXllL5a4EarvxH1HRYWxybAfQZ1HEWdBRplpSi1LJUwUMHDKweyGJP5NvA9KKSmedS
 VfRCnOKrd7UPFXVDwBIfqv2oyMctkN5ER4nhlyie9Lj0eky017CoJBErGcuEVq0OAdqD
 25mdCiyOIa8c/PNS3JInsdCtXGrioHn3ghWbFcWHibg+kY9O+nOUO9pnXSkktS85qKvO
 Ht3DWOK2/7zjakGbjvN2EsL88q8DYvx2KeGlS72EqU+fpUHeVjZaJ8BP1r8bM8qy+Uso
 hyj813+6e+mgU0FwDABMIfdi2X603VP4hjASnXpneSL4Gfi35Smg+mLRADsNhsYGt3Gh
 Lhjw==
X-Gm-Message-State: AOAM531rotSc8ya4n0uS6ARUePqlOTuvUpEaHLzVwAE29PhPXYl2kr7w
 DekSQYBDfKsEocqrl+G63TQsartjsIkga7qHz5dpCg==
X-Google-Smtp-Source: ABdhPJzoRKjULwzqB/GeoCyOIzYWNcIXL9vijf50RkDSGdI+bzliEeuAID29pjnEQwhlgwEAwuRgznr6tbIy4cY97Hg=
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr27393019wrr.370.1597112975525; 
 Mon, 10 Aug 2020 19:29:35 -0700 (PDT)
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
In-Reply-To: <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Tue, 11 Aug 2020 10:29:24 +0800
Message-ID: <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: "Lu, Brent" <brent.lu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 "yuhsuan@google.com" <yuhsuan@google.com>,
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

Lu, Brent <brent.lu@intel.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8811=E6=97=A5=
 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:17=E5=AF=AB=E9=81=93=EF=BC=9A
>
> >
> > Sorry for the late reply. CRAS does not set the period size when using =
it.
> > The default period size is 256, which consumes the samples quickly(abou=
t 49627
> > fps when the rate is 48000 fps) at the beginning of the playback.
> > Since CRAS write samples with the fixed frequency, it triggers underrun=
s
> > immidiately.
> >
> > According to Brent, the DSP is using 240 period regardless the hw_param=
. If the
> > period size is 256, DSP will read 256 samples each time but only consum=
e 240
> > samples until the ring buffer of DSP is full. This behavior makes the s=
amples in
> > the ring buffer of kernel consumed quickly. (Not sure whether the expla=
nation is
> > correct. Need Brent to confirm it.)
> >
> > Unfortunately, we can not change the behavior of DSP. After some experi=
ments,
> > we found that the issue can be fixed if we set the period size to 240. =
With the
> > same frequency as the DSP, the samples are consumed stably. Because eve=
ryone
> > can trigger this issue when using the driver without setting the period=
 size, we
> > think it is a general issue that should be fixed in the kernel.
>
> I check the code and just realized CRAS does nothing but request maximum =
buffer
> size. As I know the application needs to decide the buffer time and perio=
d time so
> ALSA could generate a hw_param structure with proper period size instead =
of using
> fixed constraint in machine driver because driver has no idea about the l=
atency you
> want.
>
> You can use snd_pcm_hw_params_set_buffer_time_near() and
> snd_pcm_hw_params_set_period_time_near() to get a proper configuration of
> buffer and period parameters according to the latency requirement. In the=
 CRAS
> code, there is a UCM variable to support this: DmaPeriodMicrosecs. I test=
ed it on
> Celes and it looks quite promising. It seems to me that adding constraint=
 in machine
> driver is not necessary.
>
> SectionDevice."Speaker".0 {
>         Value {
>                 PlaybackPCM "hw:chtrt5650,0"
>                 DmaPeriodMicrosecs "5000"
> ...
>
> [   52.434761] sound pcmC1D0p: hw_param
> [   52.434767] sound pcmC1D0p:   ACCESS 0x1
> [   52.434770] sound pcmC1D0p:   FORMAT 0x4
> [   52.434772] sound pcmC1D0p:   SUBFORMAT 0x1
> [   52.434776] sound pcmC1D0p:   SAMPLE_BITS [16:16]
> [   52.434779] sound pcmC1D0p:   FRAME_BITS [32:32]
> [   52.434782] sound pcmC1D0p:   CHANNELS [2:2]
> [   52.434785] sound pcmC1D0p:   RATE [48000:48000]
> [   52.434788] sound pcmC1D0p:   PERIOD_TIME [5000:5000]
> [   52.434791] sound pcmC1D0p:   PERIOD_SIZE [240:240]
> [   52.434794] sound pcmC1D0p:   PERIOD_BYTES [960:960]
> [   52.434797] sound pcmC1D0p:   PERIODS [852:852]
> [   52.434799] sound pcmC1D0p:   BUFFER_TIME [4260000:4260000]
> [   52.434802] sound pcmC1D0p:   BUFFER_SIZE [204480:204480]
> [   52.434805] sound pcmC1D0p:   BUFFER_BYTES [817920:817920]
> [   52.434808] sound pcmC1D0p:   TICK_TIME [0:0]
>
> Regards,
> Brent
Hi Brent,

Yes, I know we can do it to fix the issue as well. As I mentioned
before, we wanted to fix it in kernel because it is a real issue,
isn't it? Basically, a driver should work with any param it supports.
But in this case, everyone can trigger underrun if he or she does not
the period size to 240. If you still think it's not necessary, I can
modify UCM to make CRAS set the appropriate period size.

Thanks,
Yu-Hsuan

>
> >
> > Thanks,
> > Yu-Hsuan
