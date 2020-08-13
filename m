Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74C243406
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 08:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8909D1663;
	Thu, 13 Aug 2020 08:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8909D1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597300019;
	bh=8KV3iNXRuphn+mAGHnrwMko51l806xol/eUUi2OV844=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g051Dain3jGvFGZlh0a3WOtLhUm4e5yOURF/szFZZ7JH99tG6ZCWv7rsEkNPUz0GT
	 UQ7O2YLq/Z4QGlTvq9RkzOhlvyZpIKh1zcQPm886JRW38IjzFOZjX8M8H66WBwRl3p
	 3K0nFM7vnRXFBXPcmNE8nGED7gR6AHLVcFuQYnG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD61AF800F4;
	Thu, 13 Aug 2020 08:25:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B548F800F4; Thu, 13 Aug 2020 08:25:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE808F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 08:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE808F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VKZLwG+L"
Received: by mail-wr1-x442.google.com with SMTP id f1so4173136wro.2
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rkxg7BbjMCs7clQXqrkuuJfUcLuYZQzc5cqQVGT0bkA=;
 b=VKZLwG+LBvxKNHW01Y5Vq1/8AYhApv5uc8wgcsV/vbbo4UJGTn/e5mkESWhcGdLN1z
 9WWewNaDZMHCE+ZCrJMu3icDG4+cPlyocZWkv0BwiQvVqFNGfAhD0jvtaOrwou6FzGr4
 pL6Fs3rCu1m/uUWiC6PdMZz9hLGdlCSTrNt6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rkxg7BbjMCs7clQXqrkuuJfUcLuYZQzc5cqQVGT0bkA=;
 b=Gzgy10huYhp3/Sjgh2XWWdCKFup7UD0hL+32p3n3DiYnfM5KrulcsbKbcHH9g9VeYj
 +apIkI7WyQuIxtwqJPJ161NUCWdOo1O1LhQqiD8Kodrrm+Y04m66kWsJICjdJn0vfw2s
 snXzMXhp0S8dP81wZKYap4n1l0TIBsn2ynDxdrJO+yvKuG9BDH5KffJw1+N4q9R+bXaB
 Z1KW0Aj3tm+g2NwL2Kwf9JV9WsjWC076vGCTPn/qD8Yf1QUbfHUQgf9IF7d3okijPu1J
 KkdfwQdJdrK7ukTr+imtkWVnRtcok7CNSB0rEfVbpEfY0n55N7iWrxiNOMGZiPAOeSs0
 W3jg==
X-Gm-Message-State: AOAM530cVI0EppoRYukNBNAQ/PjpBCCTyUAa7lNJ+na4Ybqa9RGqDhtA
 I0zghGt45jNtGXBCIXQOyCDe6UtPMarA2RYGgnVWgw==
X-Google-Smtp-Source: ABdhPJwX7HQyKe8Lf22vhQBwhwUlh4q7DNvkacWIafhRKIRTVUNnp1ZfiClutenFSWuoQDpO5dzZeguBrPMnyG5BM9s=
X-Received: by 2002:adf:97d3:: with SMTP id t19mr2321367wrb.138.1597299905388; 
 Wed, 12 Aug 2020 23:25:05 -0700 (PDT)
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
In-Reply-To: <0714b222-d3fc-5744-1147-bfac7df2651e@linux.intel.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Thu, 13 Aug 2020 14:24:54 +0800
Message-ID: <CAGvk5Pqg000SnrRhVD+8cOtAVokomRSa6MLdaKKnY2P6R_ruGA@mail.gmail.com>
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
2020=E5=B9=B48=E6=9C=8813=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:=
38=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
>
> On 8/12/20 11:08 AM, Lu, Brent wrote:
> >>>
> >>> I also wonder what's really missing, too :)
> >>>
> >>> BTW, I took a look back at the thread, and CRAS seems using a very
> >>> large buffer, namely:
> >>> [   52.434791] sound pcmC1D0p:   PERIOD_SIZE [240:240]
> >>> [   52.434802] sound pcmC1D0p:   BUFFER_SIZE [204480:204480]
> >>
> >> yes, that's 852 periods and 4.260 seconds. Never seen such values :-)
> >
> > CRAS calls snd_pcm_hw_params_set_buffer_size_max() to use as large
> > buffer as possible. So the period size is an arbitrary number in differ=
ent
> > platforms. Atom SST platform happens to be 256, and CML SOF platform
> > is 1056 for example.
>
> ok, but earlier in this thread it was mentioned that values such as 432
> are not suitable. the statement above seems to mean the period actual
> value is a "don't care", so I don't quite see why this specific patch2
> restricting the value to 240 is necessary. Patch1 is needed for sure,
> Patch2 is where Takashi and I are not convinced.

I have downloaded the patch1 but it does not work. After applying
patch1, the default period size changes to 320. However, it also has
the same issue with period size 320. (It can be verified by aplay.)
