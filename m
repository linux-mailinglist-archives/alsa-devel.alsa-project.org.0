Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CEC240C2D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 19:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D671665;
	Mon, 10 Aug 2020 19:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D671665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597081233;
	bh=yRdCKJP+WI2M34o9eT71YkcI0TK2EPbAInBAcPP4Hp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THpD7aciQ+Am4WgwOLn1E9ljT67sdAcWg/B1OlNo0ud98a5/7HUBhDCS8/ekdjAEV
	 LqAj1AVTL70nFAko2ry99TIgzdGmrW0q5ZGgifbu+vpn3zKh5wa0vH9bFqIYap8zDK
	 9HYNiE6jM5qjjHDC4Rqo1x0qRj9Of7aOTHRBzaIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 629F4F8022D;
	Mon, 10 Aug 2020 19:38:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06CCF8022B; Mon, 10 Aug 2020 19:38:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E3ABF800BC
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 19:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3ABF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CJ32tAiB"
Received: by mail-wm1-x342.google.com with SMTP id c80so306351wme.0
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 10:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EcJDg2O7xIbOjM5eLQ8gCplwOfat/XZVzxZppSuBFXA=;
 b=CJ32tAiBMpba2lWqmucba2kWsAmrucVE+nHFEbLfe7F/yDIu8a5GsC+aKvXiXYYyjH
 p6tY4SvZEFynuVENJxRY4zfZMk55Q8+jalMCUt5LbX15hB2LNARaGtL//JDIXpveJBnq
 U97ZMz+k45sAX4uHdrKeocRzAh6Iaba1kKKm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EcJDg2O7xIbOjM5eLQ8gCplwOfat/XZVzxZppSuBFXA=;
 b=tIWgWIzBUWXRKOvch+e0TseESBwn4Lz0CpaIaetVEFEDB2xbzqPcWPrzFZ+zjLnxT9
 JDost0Npn3pJB2lrEHj5xZlNjsI74IRqVLQoQxf6uLiMWb/xXrRswbHvzx2t72H02uAT
 4UrCsqhdzp0vHS4jdWfpzRTFIMAVXjAIov7hqcGHW1FFyh5XfgqxiRYv8qtwZc/8LQxv
 hA6QaTbszKsHIY+1hdwOsrdbMFQ1rakPVdVlK5LAjgXfc/le9biW7VErWtIho9l/1/gt
 Qu7DOi7YECBRrtKcNykS8Q2w7O7xEgCMLcBb8saYI1cX2iKapoGGxFuqnetyW2zKkoZI
 eedQ==
X-Gm-Message-State: AOAM532Lal5ZQ7AytHYTjWWn65aAGQafnxsvYbh8NiNqp8hlQbqh4enE
 jDWag6QPGcZ6FQgq1GCNXos9h0EeuDIokOR0Qr+KKw==
X-Google-Smtp-Source: ABdhPJxWy126EoPeXn68o0RtdQ9AM8iu0r0roUOi2/tEIALG8XKSfLdRwQWvkOSSkWppyvAfQ/KenjZMRMb5iSGO57w=
X-Received: by 2002:a05:600c:2302:: with SMTP id
 2mr325053wmo.151.1597081117897; 
 Mon, 10 Aug 2020 10:38:37 -0700 (PDT)
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
In-Reply-To: <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Tue, 11 Aug 2020 01:38:26 +0800
Message-ID: <CAGvk5PohOP0Yv22tb53EX=ZLB9_vOMb=iujTh64OvHmjC1d4mg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
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

Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> =E6=96=BC
2020=E5=B9=B48=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
03=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
>
> On 8/6/20 11:41 AM, Lu, Brent wrote:
> >>
> >> I don't get this. If the platform driver already stated 240 and 960 sa=
mples why
> >> would 432 be chosen? Doesn't this mean the constraint is not applied?
> >
> > Hi Pierre,
> >
> > Sorry for late reply. I used following constraints in V3 patch so any p=
eriod which
> > aligns 1ms would be accepted.
> >
> > +     /*
> > +      * Make sure the period to be multiple of 1ms to align the
> > +      * design of firmware. Apply same rule to buffer size to make
> > +      * sure alsa could always find a value for period size
> > +      * regardless the buffer size given by user space.
> > +      */
> > +     snd_pcm_hw_constraint_step(substream->runtime, 0,
> > +                        SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 48);
> > +     snd_pcm_hw_constraint_step(substream->runtime, 0,
> > +                        SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 48);
>
> 432 samples is 9ms, I don't have a clue why/how CRAS might ask for this
> value.
>
> It'd be a bit odd to add constraints just for the purpose of letting
> userspace select a sensible value.

Sorry for the late reply. CRAS does not set the period size when using it.
The default period size is 256, which consumes the samples
quickly(about 49627 fps when the rate is 48000 fps) at the beginning
of the playback.
Since CRAS write samples with the fixed frequency, it triggers
underruns immidiately.

According to Brent, the DSP is using 240 period regardless the
hw_param. If the period size is 256, DSP will read 256 samples each
time but only consume 240 samples until the ring buffer of DSP is
full. This behavior makes the samples in the ring buffer of kernel
consumed quickly. (Not sure whether the explanation is correct. Need
Brent to confirm it.)

Unfortunately, we can not change the behavior of DSP. After some
experiments, we found that the issue can be fixed if we set the period
size to 240. With the same frequency as the DSP, the samples are
consumed stably. Because everyone can trigger this issue when using
the driver without setting the period size, we think it is a general
issue that should be fixed in the kernel.

Thanks,
Yu-Hsuan
