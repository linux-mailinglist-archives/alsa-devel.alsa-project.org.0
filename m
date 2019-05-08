Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5990181DF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 23:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 560291ABD;
	Wed,  8 May 2019 23:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 560291ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557352796;
	bh=u4LUB1idt6cPnfh2ZULKqkiIbon8gw2ATR01wShssKM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0msyRLk6jW5zJ/BETMe79wHR1nm9JmzDyz4uQ2L+RzJ1aNUM7tEVjkspv25FTwzQ
	 +BO1/pG/TXHFgfKYLR7Y3Awhx7zeHFXr3vXJZyCzthXkkzfBFeGp8ekapKdHWX/k96
	 CgTJolBh8Mx7UhVcNvoQk79ka6r9sZu78DkV4XHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A63F807B5;
	Wed,  8 May 2019 23:58:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B836F896F0; Wed,  8 May 2019 23:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B8D1F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 23:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B8D1F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ChqqDy9O"
Received: by mail-lj1-x242.google.com with SMTP id d15so228376ljc.7
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mJDqU9Be18vct3RelT0fkz+NNup0uRkQXwCH0J/0ayA=;
 b=ChqqDy9OtTLco9IUq0EovfxGWkylmU9D9HUEpFYYW+YRmXm0hippWdq2pKZankIEGt
 Xf2jdjQWWmAdtZPM+9/wLEklwq++GFufTFUCOTqAq2A6cLLxT6l3ymO2l+h0yQElcUIS
 oZ2pIuEdr4g1L8oDs6yyOQmrqt/DoKU53ONMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mJDqU9Be18vct3RelT0fkz+NNup0uRkQXwCH0J/0ayA=;
 b=gln3BVkTnkM6MwD0t0Oo/yT01SqLCzX1kljYtB01/gUtbV1SoUY7wv8y7IfHabhAYC
 MZ6YeqzGNTKkbAf2clPrkSTWyHDz0SRjYhJmQxN+tyWS85/OkeR7t5TJ0hlRT49DPe9U
 2Nwvu1Md3P/HRG3S3naSoZe00QOosM0AXd278nO9DvuCs1Ef3cZbBnclmOU4VCZe20s5
 gI7mlwkAcgO7ZlQIwhPXpiJMXmG0tQuGemno9ADdGPl5VUj48hMv4xNCGlrE+kxzmVft
 h8kYpnbW484lmVPwd9XnGtY5wog7oB+YtdI5VxsG13pMvwmiZpy2nYAXSZx6ZmXJof0G
 o/Ng==
X-Gm-Message-State: APjAAAUueXToQDKcBldfSc8ClbsujoGRyebu88tVB5vOsPR4whRBIj9h
 odBcCXsHijwYZNBWI4DpnbNGEXb6YHE=
X-Google-Smtp-Source: APXvYqxEDYrG0MsSZVgHJg4rbh+XeiHVESlCNLZc4ztDAlvCMi7UCmMA1dXDU/86DymGZbFePtiqoA==
X-Received: by 2002:a2e:85c9:: with SMTP id h9mr96704ljj.110.1557352685954;
 Wed, 08 May 2019 14:58:05 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id v1sm27896lfa.93.2019.05.08.14.58.04
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 14:58:04 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id v18so51334lfi.1
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 14:58:04 -0700 (PDT)
X-Received: by 2002:a19:2d1a:: with SMTP id k26mr255997lfj.104.1557352684116; 
 Wed, 08 May 2019 14:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190507215359.113378-1-evgreen@chromium.org>
 <20190507215359.113378-3-evgreen@chromium.org>
 <866afac2-e457-375b-d745-88952b11d75e@linux.intel.com>
 <CAE=gft4sDo1cLeU8Cm1CRZu2PzVG0iu-b7UaWxWVrsUeZ=SYhQ@mail.gmail.com>
 <6fd9ca2b-dcf6-801f-209e-11eba59203fe@linux.intel.com>
In-Reply-To: <6fd9ca2b-dcf6-801f-209e-11eba59203fe@linux.intel.com>
From: Evan Green <evgreen@chromium.org>
Date: Wed, 8 May 2019 14:57:27 -0700
X-Gmail-Original-Message-ID: <CAE=gft7JgbDo2xPwdRmY9-oiA_Wchg+mCz1foH267pob-223YA@mail.gmail.com>
Message-ID: <CAE=gft7JgbDo2xPwdRmY9-oiA_Wchg+mCz1foH267pob-223YA@mail.gmail.com>
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

On Wed, May 8, 2019 at 10:04 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 5/8/19 11:51 AM, Evan Green wrote:
> > On Tue, May 7, 2019 at 3:31 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >> On 5/7/19 4:53 PM, Evan Green wrote:
> >>> Add PCI IDs for Intel CometLake platforms, which from a software
> >>> point of view are extremely similar to Cannonlake platforms.
> >>
> >> Humm, I have mixed feelings here.
> >>
> >> Yes the hardware is nearly identical, with the exception of one detail
> >> that's not visible to the kernel, but there is no support for DMICs with
> >> the Skylake driver w/ HDaudio, and Chrome platforms are only going with
> >> SOF, so is it wise to add these two CometLake platforms to the default
> >> SND_SOC_INTEL_SKYLAKE selector, which is used by a number of distributions?
> >>
> >> I don't mind if we add those PCI IDs and people use this driver if they
> >> wish to, but it may be time for an explicit opt-in? The
> >> SND_SOC_INTEL_SKYLAKE definition should even be pruned to mean SKL, APL,
> >> KBL and GLK, and we can add DMI-based quirks for e.g. the Up2 board and
> >> GLK Chromebooks which work with SOF.
> >
> > I don't have the context here, so feel free to ignore me. But it seems
> > like such a tiny amount of extra bits to add to make Cometlake work,
> > and then there's no hassle for the distributions when Cometlake
> > devices start showing up in the wild. So while things are more or less
> > the same, why not continue piggypacking off the default?
> > Or are you saying that the lack of DMIC support means the default
> > should be to use a different driver?
>
> Yes, it's the latter case, SOF will be the only driver supporting DMICs
> on CometLake, so it'd be better to avoid creating a conflict with SOF or
> enabling a configuration by default which is known to have restrictions.
> It's fine to add the CML IDs, but better avoid adding CML under the
> SKYLAKE all-you-can-eat selector.

Ok, I'll plan to remove the new selects from under SND_SOC_INTEL_SKYLAKE.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
