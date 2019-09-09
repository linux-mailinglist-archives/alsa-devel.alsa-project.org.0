Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D3ADD90
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 18:54:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D0801664;
	Mon,  9 Sep 2019 18:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D0801664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568048080;
	bh=W/j/8WuhiqItmfyg1a+uoq3YvKyHupt8Pjrs8B23nnc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGKK5phWFpI2JGraNPNJW3Ky6SJO/Zkd/AJ7aOoMJCb0MhoOXRMsMHaibsNg7+UZC
	 3rC+iJ7wTnIFSLEkorH67xKs8GjkZNPT6b0jLvJu5ifYCYyX4h4FeoPGyqoeiMtS5I
	 Jt4i8xBDTyofQPS78EYyRfmb/WAAO7VDB7uyBKWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0387AF80323;
	Mon,  9 Sep 2019 18:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 036F1F800C9; Mon,  9 Sep 2019 18:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46940F800E6
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 18:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46940F800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="MDzQwcXF"
Received: by mail-qk1-x742.google.com with SMTP id 4so13738552qki.6
 for <alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 09:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VVQ9FT6nbyOJMf0n+KYpYwmGRMhyt0SHNjoGy/7TAHA=;
 b=MDzQwcXFs8PSf2JfUPJNAf1+2lmMvu0k8cKhHYj8q0bznlqVYUpiCYd/Fkcj7tGe8h
 6M7FiQk7OuXh347R/CY/xHu0xvCfdOzAcxJRfTRRV/uyljDH5k7k9ong8rq6RsPrtQ5E
 oLKjR/7IL4XBLuq6F00ROcZKmX/bH0xsQfvX4rvkrtiWYh/Oq7XBp1eVHIANzO3uNrgF
 BpMPrLtDTrRdip+GsWPG+i0WyF7Tg8UAklODgME0Phmxf4obtFGaaFSsp/gN1Es40P0I
 dLqLG3ZJgiHhQCYfn8yCwU7rwxAsgsaxG1c3LKWmFOrfB4neUO/hg/dUfgUVoB6VIS80
 6mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVQ9FT6nbyOJMf0n+KYpYwmGRMhyt0SHNjoGy/7TAHA=;
 b=kOydaVS7PM7b+rUA/jHXw03pYasoYoKFuKZmMtEQcqrMfTcQNHY2/gGjbKR5lgjqOW
 6nQpqZun8KphJ7/VDRhq3TUZ2O2akcvSUR9LG1qoBbe/W9ZVR1WxbZ70G9OKUNnHPKZp
 lLvLetdTsW5Z7xNz2zBqIVTMXW59qkDy7hQneeNxYsVEJymxle3UV8cQfz6t4SpkVI+q
 mWBHlmDgMjBoL3SVf5CcRbQN25t3do7pAhaMY8seYrFExLppqwqZBo3uBXJxXAWfZaNk
 RZq5fCkFAzVaZ6aDB1TwSLUN2ID2q7rXmCWVEMkms/0CixkQgaSR3vAQDhZiMfY9mr4Y
 eydQ==
X-Gm-Message-State: APjAAAXrdDmXdaYA3ufsH0XBdFn4vHldmfPzh9XF0Ej4mf2hkvi26XCl
 eWq80jSlw+xJwzzBtVONeTB1LOD0kJ/Jqm0kPO6Tow==
X-Google-Smtp-Source: APXvYqzQAlAL39Lgm76lxBOhcMMJvKAgzJ7O2hlLTWj3lbSfYMXRr9TzvoW0abPYzONEe8Uv+jF5ZB2h/rhOOJ4Xv+o=
X-Received: by 2002:a05:620a:c:: with SMTP id
 j12mr20412390qki.127.1568047969203; 
 Mon, 09 Sep 2019 09:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <b96e35fb-09d7-6cf7-8880-2cb8f377cca8@linux.intel.com>
 <CAOReqxgJQaW=XAsD4o9hq_iU1faJBK3d9Rg8FCp_4Mrx3UX-oQ@mail.gmail.com>
 <b1de1190-d809-9cb3-3560-97595df895d3@linux.intel.com>
In-Reply-To: <b1de1190-d809-9cb3-3560-97595df895d3@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 9 Sep 2019 09:52:38 -0700
Message-ID: <CAOReqxjz+-qRH-w2Az20ihFRNAA3yxhaxsObXAsCypMh0vvMGA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [RFC 00/15] Add Samus Hotwording for RT5677
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

On Fri, Sep 6, 2019 at 3:13 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> On 9/6/19 4:09 PM, Curtis Malainey wrote:
> >
> >
> > Curtis Malainey | Software Engineer | cujomalainey@google.com
> > <mailto:cujomalainey@google.com> | 650-898-3849
> >
> >
> > On Fri, Sep 6, 2019 at 1:41 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com
> > <mailto:pierre-louis.bossart@linux.intel.com>> wrote:
> >  >
> >  > On 9/6/19 2:46 PM, Curtis Malainey wrote:
> >  > > This patch series adds the hotwording implementation used in the
> >  > > Pixelbook on the RT5677 driver.
> >  > >
> >  > > Known Issues:
> >  > > There is a known issue where the system will fail to detect a
> > hotword if
> >  > > suspended while the stream is open. This is due to the fact that the
> >  > > haswell-dsp suspends its I2S MCLK before the RT5677 suspends which
> >  > > causes the writes and reads to become corrupted as a result. Any
> >  > > recommendations to correct this behaviour would be appreciated.
> >  >
> >  > I don't get what 'suspend' and 'stream' refer to. is this pm_runtime,
> >  > s2idle, system capture, SPI capture?
> >  >
> >  > Can you elaborate on the sequence?
> > Definitely can,
> >
> >  1. open hotwording pcm with arecord in non-blocking mode
> >       * Codec won't send any data over SPI until the hotword is detected
> >  2. put system into S3 (see order of callbacks as follows)
>
> Before we start digging into dependencies below, is it really possible
> to enter S3 with the hotwording open? I vaguely remember being told that
> such cases would be trapped by the Chrome userspace and the PCM would be
> closed. I don't think anyone on the SOF team testing this case for newer
> platform, so that case on an old platform makes me nervous.
>
I vaguely recall that as well now that you mention it. I will follow
up internally, if that is true then this will be a non-issue from our
point of view.
> >      1. HSW DSP suspended which suspends stops I2S MCLK
> >      2. RT5677 suspended, all pm writes are lost due to the fact that
> >         the codec is still in DSP mode but has no clock
>
> there's no real dependency or parent-child relationship between the two
> drivers, is there? so I am wondering if this order is intentional or
> just accidental.
> The only thing I can think of is that there are multiple steps during
> the system suspend and maybe we can play with .suspend_late instead of
> .suspend?
Not that I am aware of, when used as a standard codec there is no
clock dependency. I will try and see if I can set the pm accordingly.
>
> >  3. System resumes and fails to restore the RT5677 due to the fact that
> >     the regmap is now out of sync
> >
> > The rt5677 needs to suspend before the haswell dsp but I am not sure how
> > to schedule that appropriately. The reason this worked in Samus is
> > because it launched with a 3.14 kernel which did not
> > have 0d2135ecadb0b2eec5338a7587ba29724ddf612b ("ASoC: Intel: Work around
> > to fix HW D3 potential crash issue") which powers down the MCLK when the
> > haswell DSP is not in use.
> >
> > Hope that clears things up.
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
