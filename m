Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 882F624242E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 05:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2564E166B;
	Wed, 12 Aug 2020 05:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2564E166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597201920;
	bh=CFnxBPNDgtE44pHXI+KFL0dwjYiqKviACre/vH4lS4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=utmTHTTNiQaWVI7PJMm6b5rhU5B1xlVLN+J6XXfxNgzu8sn6xMOa2bx7W0Q268Zxj
	 RessYvdIvFGltt9tUtFoG84HzmgVt17T7H5OizIBODuLAxErWsTMNaGXDvOttQZAC8
	 vA7Gd07a5Ohehf5PG8LqYQ1iPB0C+vpnp9GWDy2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25FD1F8022D;
	Wed, 12 Aug 2020 05:10:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 348B1F8022B; Wed, 12 Aug 2020 05:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5690FF800D3
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 05:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5690FF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ngSRzlum"
Received: by mail-wm1-x343.google.com with SMTP id c19so3300272wmd.1
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 20:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3hkg0qu6P9KQ5oYfn7DTQjSamGImaGuetOUyRL9DWkY=;
 b=ngSRzlumHkb0IDY4Pr87hg0ZwDwyroTE0Ld40lvNSNKIijgNhqQpnM6zRj84dIcXj4
 qQ0YIrqSSAk94RpkV98/z5snP7OuL/YSL97sskrxvMAJUeecU/LwDCYHJLTkNbYY6y4S
 ag4+ErdhG3PO6Aaz/J7vZZktVSkGJgZVvQCYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3hkg0qu6P9KQ5oYfn7DTQjSamGImaGuetOUyRL9DWkY=;
 b=ebgwbTtN7/dKByMoug8OUUQ1E7eFrA8D5HsyUlPQK+w0L7xEb9yPh2R12fpuXtdx09
 cTAEz5SPUpMx19Cghgv6o6tr+kRVZOFoEHqOmOSHsCwkQIkxVbCp9RzJKYd56ePIy41T
 tySjziDNruWFrI7sHjUa9ZW19RK17pOksMVAuImxyH7RnVKc03vjHiDRyLQUezKE7/vH
 NI7uN1HWIjw2JVLMyMFV5DYNi6NxVb1QkvkjfWOe9eP9zne5PEpQ6YBTQV9XbyYCzK5c
 tpFO+wYdR3vzHF/9oI4yT29smC8xJSSGRw4YpgOg2SgF0uj54nDwTBWrOrOW9s4R9KZE
 tU1w==
X-Gm-Message-State: AOAM530f5Q4KTfdOOrnp4vzWAij0dXpWia2Yq+DRmu7P+ieYGrp4cXDz
 R+SsB3s7bqgOvflrVnzvZ4fa9EaRuTYjYeAfa0PGDw==
X-Google-Smtp-Source: ABdhPJxDOFrYjfmnL/EFseUjo4ptWPav8xuJ2FzYhPDiA/AQYuCzo4N45IBYUvbTgXJuvFyhWdUUCw3z9AyGGUry5Yc=
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr6825647wmk.17.1597201809730;
 Tue, 11 Aug 2020 20:10:09 -0700 (PDT)
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
In-Reply-To: <20200811172209.GM6967@sirena.org.uk>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Wed, 12 Aug 2020 11:09:58 +0800
Message-ID: <CAGvk5PqGi7cXthLHFi4NyypxFiGnoHvD9vp+5nJdH-_VkVvcKw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: Mark Brown <broonie@kernel.org>
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
 Sam McNally <sammc@chromium.org>,
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

Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=8812=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Aug 11, 2020 at 11:54:38AM -0500, Pierre-Louis Bossart wrote:
>
> > > constraint logic needs to know about this DSP limitation - it seems l=
ike
> > > none of this is going to change without something new going into the
> > > mix?  We at least need a new question to ask about the DSP firmware I
> > > think.
>
> > I just tested aplay -Dhw: on a Cyan Chromebook with the Ubuntu kernel 5=
.4,
> > and I see no issues with the 240 sample period. Same with 432, 960, 960=
0,
> > etc.
>
> > I also tried just for fun what happens with 256 samples, and I don't se=
e any
> > underflows thrown either, so I am wondering what exactly the problem is=
?
> > Something's not adding up. I would definitively favor multiple of 1ms
> > periods, since it's the only case that was productized, but there's got=
 to
> > me something a side effect of how CRAS programs the hw_params.
>
> Is it something that goes wrong with longer playbacks possibly (eg,
> someone watching a feature film or something)?

Thanks for testing!

After doing some experiments, I think I can identify the problem more preci=
sely.
1. aplay can not reproduce this issue because it writes samples
immediately when there are some space in the buffer. However, you can
add --test-position to see how the delay grows with period size 256.
> aplay -Dhw:1,0 --period-size=3D256 --buffer-size=3D480 /dev/zero -d 1 -f =
dat --test-position
Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48000
Hz, Stereo
Suspicious buffer position (1 total): avail =3D 0, delay =3D 2064, buffer =
=3D 512
Suspicious buffer position (2 total): avail =3D 0, delay =3D 2064, buffer =
=3D 512
Suspicious buffer position (3 total): avail =3D 0, delay =3D 2096, buffer =
=3D 512
...

2. Since many samples are moved to DSP(delay), the measured rate of
the ring-buffer is high. (I measured it by alsa_conformance_test,
which only test the sampling rate in the ring buffer of kernel not
DSP)

3. Since CRAS writes samples with a fixed frequency, this behavior
will take all samples from the ring buffer, which is seen as underrun
by CRAS. (It seems that it is not a real underrun because that avail
does not larger than buffer size. Maybe CRAS should also take dalay
into account.)

4. In spite of it is not a real underrun, the large delay is still a
big problem. Can we apply the constraint to fix it? Or any better
idea?

Thanks,
Yu-Hsuan
