Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900517E94
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 18:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0427E1ACA;
	Wed,  8 May 2019 18:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0427E1ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557334436;
	bh=B4GMD77jlQ2YCXhjDZ5abXFtUwKBHUoW0TvdCcFM9hw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njBCLaXZVtSAt+bSum90UbJR7cmSdJp+xcrMdI0wXewapJaHpIVbyGZ8u9zXDWuLq
	 PmXDpFTRy+ad5Wu9HDtd83WVDyGFft9E1/WCHIVfyEE48VSeJIXokoNOKhT0zjuG6g
	 tV9kuRyNIHlma4ZMYgOx0IqIEiVgDIPcWsEKUVDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE0BF89715;
	Wed,  8 May 2019 18:52:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0637F896FF; Wed,  8 May 2019 18:51:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68E71F896FF
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 18:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E71F896FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EkeSxg5L"
Received: by mail-lj1-x241.google.com with SMTP id 14so305005ljj.5
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQsJ0MMOXpj6zufGwF5+gpNcluH7GYea+FBpZiqmq4o=;
 b=EkeSxg5LiTGZ7oRiG88NnE3UOX78w4Hzdbbmt4L7rf01nC1vh+RrHjFojzc53VWTjN
 7uodjbP6QNH07K52PKfZzlfgmEITpiGPRtG5JFrR6zgYG+8oGLzI7DU4xFQIS8TmxRVA
 89lb4ZjnCK56fQ8t+nAq2Z9CaBeX+iseZyJeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQsJ0MMOXpj6zufGwF5+gpNcluH7GYea+FBpZiqmq4o=;
 b=Fduod56TGpdCHq6ugBbKAR+f6xbJN+qj2hNK0SbhB6JiYE0HKhSxHnAqn/H2j/zAh2
 BA2Bgvm2aNSk/PVLIBw1lMHXF5SK45uFdl1rg6l/JsrmysKNTz8DpypYXwpQe12BNYlP
 142TvhlsKaOnG7DV98iDgBoZ5TTTnX8TaHeN9SvqMa7h3ubuzL0rINEpapX0m48k5Q9D
 WKVHowN8cVCLv3qGsl052Jv69MWCoTzVEMzySfDu9YMtUax2rGFhbkQE0/2fRl/gad11
 CrYSxponrNLKdbUoCHczoK89YE2aLTEpw1FPFkXjCerLMtFF/pGuLQODqWOCZSUt6aFc
 0LMg==
X-Gm-Message-State: APjAAAUOUN/w+x2TayRdh10tH7neLT5KZ7Xu4gWR/8khetjsxYL5W0D+
 +yA5/fgT7DdV+3gZbXHruYEElPEeYcg=
X-Google-Smtp-Source: APXvYqxIj0fHpgIJdfCVIPZKjg7JoIEGAXL3EjOY1Noo/3UI7KphujgYDdueUTcYjo1SvIHisJ1fhA==
X-Received: by 2002:a2e:7e0a:: with SMTP id z10mr6800437ljc.9.1557334316474;
 Wed, 08 May 2019 09:51:56 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id k15sm4104833lje.21.2019.05.08.09.51.55
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 09:51:55 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id d8so15034407lfb.8
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 09:51:55 -0700 (PDT)
X-Received: by 2002:ac2:5621:: with SMTP id b1mr11089034lff.27.1557334314697; 
 Wed, 08 May 2019 09:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190507215359.113378-1-evgreen@chromium.org>
 <20190507215359.113378-3-evgreen@chromium.org>
 <866afac2-e457-375b-d745-88952b11d75e@linux.intel.com>
In-Reply-To: <866afac2-e457-375b-d745-88952b11d75e@linux.intel.com>
From: Evan Green <evgreen@chromium.org>
Date: Wed, 8 May 2019 09:51:18 -0700
X-Gmail-Original-Message-ID: <CAE=gft4sDo1cLeU8Cm1CRZu2PzVG0iu-b7UaWxWVrsUeZ=SYhQ@mail.gmail.com>
Message-ID: <CAE=gft4sDo1cLeU8Cm1CRZu2PzVG0iu-b7UaWxWVrsUeZ=SYhQ@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>, Jenny TC <jenny.tc@intel.com>
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: Intel: Skylake: Add Cometlake
	PCI IDs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, May 7, 2019 at 3:31 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> On 5/7/19 4:53 PM, Evan Green wrote:
> > Add PCI IDs for Intel CometLake platforms, which from a software
> > point of view are extremely similar to Cannonlake platforms.
>
> Humm, I have mixed feelings here.
>
> Yes the hardware is nearly identical, with the exception of one detail
> that's not visible to the kernel, but there is no support for DMICs with
> the Skylake driver w/ HDaudio, and Chrome platforms are only going with
> SOF, so is it wise to add these two CometLake platforms to the default
> SND_SOC_INTEL_SKYLAKE selector, which is used by a number of distributions?
>
> I don't mind if we add those PCI IDs and people use this driver if they
> wish to, but it may be time for an explicit opt-in? The
> SND_SOC_INTEL_SKYLAKE definition should even be pruned to mean SKL, APL,
> KBL and GLK, and we can add DMI-based quirks for e.g. the Up2 board and
> GLK Chromebooks which work with SOF.

I don't have the context here, so feel free to ignore me. But it seems
like such a tiny amount of extra bits to add to make Cometlake work,
and then there's no hassle for the distributions when Cometlake
devices start showing up in the wild. So while things are more or less
the same, why not continue piggypacking off the default?
Or are you saying that the lack of DMIC support means the default
should be to use a different driver?
-Evan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
