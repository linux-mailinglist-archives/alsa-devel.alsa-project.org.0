Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A02318E2
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 07:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C261740;
	Wed, 29 Jul 2020 07:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C261740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595999333;
	bh=BwjSfX/YxefcBgthq91u6kobE7WXGIlKds5ofmSiV9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J4dXfiEjZd8DhwQT1ypd7f8BE9fA8DBJoIBbRe7rTetX/dqL65SafsYEZwYNNQzIX
	 0veeATIRPpQHhpXYldC3gr8memRfXtRmqCL9VOnq3oavSraJM09wA1QF7raM6k1w5M
	 LyvAt/SQfYQkpdBlZCUXaWXPiE/Ot1+Y+F2ZASBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E184F801D9;
	Wed, 29 Jul 2020 07:07:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55432F801A3; Wed, 29 Jul 2020 07:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AF52F80125
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 07:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF52F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SkGAKM4v"
Received: by mail-wr1-x441.google.com with SMTP id b6so20289350wrs.11
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 22:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7GpifdEc6/Oc47TVBKpBwXB5I1TE7MgsWaCzxZQmbVY=;
 b=SkGAKM4vmqg3Msrjk1lw+Z0tzr2H1O4AexEGpm1tkin8xvNP/5Y9RvAEmEjQrLa65U
 SbmI/Uo/tDJXmOJfmxH7xW5Jm+vVXpRPWQzRVnORHeFwhcyZd44wtmnd1ABDD7dW4CiB
 TTyrnTWqZJVt+A+yfI96ySNQv7mCbULcoyDM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GpifdEc6/Oc47TVBKpBwXB5I1TE7MgsWaCzxZQmbVY=;
 b=ATFEYLBQ3pZY+HmCFqRdDBnsSWaCiES3EEtqd2A32NycD8te5o0hSVyHZuiYfc4fTU
 GJl5KFtyC0qyY5zKvau/jDuyRNwlmiU9JiUkkKnKPLLdJ2HgG9uOHM15cyaXjsdpytve
 tr1qYGtx7ClBiqoZTpV7ODlAM0i2xL2zN103SueW/1IZbo/NjotAKd16Y0vVv5TEEaS3
 1kEP4/pAZ2azOHkTn1m6FHhOndFA+/mTNIrb6H8P8z6CBzZfy4O059f84iuW1SOZYGp4
 9CnECH9L9F3zrRHSmCR9oEIusz7Y4sUrQVyMZkF0lN0blXha4CTorhP3s2v/2S7r3ds/
 DWfQ==
X-Gm-Message-State: AOAM531P8LjzVbZPDbo7MZHp1CD0zU2kn60ikqB8gDb9Ed/azQU9unc0
 PYJ2ldaNpglFc2WNOkpuFHiaMlb6qgFOLlhQbSsyiw==
X-Google-Smtp-Source: ABdhPJxbnyDe18hT7bjCWGNi5c5AT3QkDh5H/5AFBe0xvxZwMfVY1VwpKS/VFk6Ivj9WACTb+i1bEnsFK4MGE1RYQkk=
X-Received: by 2002:a5d:5588:: with SMTP id i8mr27809549wrv.177.1595999219359; 
 Tue, 28 Jul 2020 22:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <1595779727-31404-1-git-send-email-brent.lu@intel.com>
 <7dec7fcd-0381-d279-4dac-77c27ea5f6fe@linux.intel.com>
 <DM6PR11MB3642BE84A5C91504D6AF4ECB97730@DM6PR11MB3642.namprd11.prod.outlook.com>
 <14fde5e9-a11a-077d-b533-1e6db4b7a262@linux.intel.com>
 <DM6PR11MB3642AF0905E0CF57B094906297730@DM6PR11MB3642.namprd11.prod.outlook.com>
 <216b86eb-aec6-dab9-7901-9e0f2cc5af7f@linux.intel.com>
In-Reply-To: <216b86eb-aec6-dab9-7901-9e0f2cc5af7f@linux.intel.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 29 Jul 2020 13:06:32 +0800
Message-ID: <CAFv8NwLEHf=3ejrr1m74cRSjiX3mOKfx0oRyu51ENo6mktEgEQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Atom: use hardware counter to update hw_ptr
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, "Lu, Brent" <brent.lu@intel.com>
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

On Wed, Jul 29, 2020 at 1:31 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 7/28/20 12:02 PM, Lu, Brent wrote:
> >>
> >> So if there are already quirks in atom machine drivers to change the period
> >> size, why is this patch necessary?
> >>
> >
> > The story is: google implemented the constraint but doesn't know why it works
> > so asked us to explain. After checking the two counters I realized the increase of
> > ring buffer pointer follows the period size setting in hw_param (256) but the
> > period of interrupt is always 5ms instead of 5.33 so it's running little bit too fast.
> > It seems the LPE keeps tracking the difference of two counters. When the
> > difference exceeds 2160 samples, the next interrupt will be canceled so the
> > hardware counter could catch up a little.
> >
> > [   43.208299] intel_sst_acpi 808622A8:00: mrfld ring_buffer_counter 107520 hardware_counter 98880 pcm delay 8640 (in bytes)
> > [   43.208306] intel_sst_acpi 808622A8:00: buffer ptr 26880 pcm_delay rep: 2160
> > [   43.208321] sound pcmC1D0p: [Q] pos 26880 hw_ptr 26880 appl_ptr 40000 avail 191680
> > => one interrupt is skipped.
> > [   43.218299] intel_sst_acpi 808622A8:00: mrfld ring_buffer_counter 108544 hardware_counter 100800 pcm delay 7744 (in bytes)
> > [   43.218307] intel_sst_acpi 808622A8:00: buffer ptr 27136 pcm_delay rep: 1936
> > [   43.218336] sound pcmC1D0p: [Q] pos 27136 hw_ptr 27136 appl_ptr 40000 avail 191936
> >
> > So I think why not using the hardware counter? It increases 240 samples every 5ms
> > perfectly match the 48000 sample rate. The test result is good but I know there must
> > be a reason for the original designer to use ring buffer counter instead of hardware
> > counter. I uploaded this patch to see if anyone still remember the reason and share
> > some insight with me.
> >
> > I totally agree that we shouldn't touch this part of design. Do you think it make sense
> > to add a constraint to enforce the period size in machine driver? If yes then I would
> > upload patches for Chrome atom machines for google.
>
> I think it'd make sense to add this constraint, either in the machine
> driver or in the platform driver, so that we don't change the position
> updates and introduce more issues by accident by doing so. As you
> rightly said, I don't think anyone tested periods multiple of 256
> samples so it's not a regression, more aligning with the internal design.

Thanks for the explanation and discussion.
A slight correction in this thread is that CRAS does not set period size to 256.
It just uses whatever value that driver wants to use, which happens to be 256.
If the driver can limit the selection to only correct values that
would be the best.
Adding constraints in the machine driver or platform driver looks
good. Prefer to adding in platform driver so we don't need to add for
each machine driver.
Thanks!
