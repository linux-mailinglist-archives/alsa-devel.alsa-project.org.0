Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6D511C74
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 18:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27FD320C;
	Wed, 27 Apr 2022 18:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27FD320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651078562;
	bh=BprxktdNPE+NYGOYbvLnlWf4wY7E07o36Wa6YG7j7Yk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LU896D9v4y6r1RG/hzKd1FDC+6UrqOVsIhd2B9uD30R2bkte9TDcOab9eZiKepVbH
	 xdYFrN/KrbGWFIWPbtyacZIOnRt8sdR0XMFTsXiLdCepczTwWoVcBVRxZvpm6wSJBG
	 det2jfaqeWIf9+ljQ1oX1ptq5J++e3FAHbXcrFi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 804FCF80100;
	Wed, 27 Apr 2022 18:55:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1CA1F8016E; Wed, 27 Apr 2022 18:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E919F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 18:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E919F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cN/MStJF"
Received: by mail-ed1-x535.google.com with SMTP id z19so2634523edx.9
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TQEfts7gGgrS3RTNrz2Amxg4xfYD+j4xnGdHlASdH9I=;
 b=cN/MStJFBDig4DNtSuDfP9IMen7lJr0c0zoMBqSlQbV4uW7pAlntvzRFZdgz/swyd6
 dVaRK8xP9m9wfqB0uu4bj7i/XSpVblxxlAoWIgvRm/coJFm/dTQZR8TGKD6NN1MBuBP2
 R5muNDW8b49AWLlgvQoUusLyTZkiJGrGsj+WRVEVSYbKYb3GTRJUiMC1ASFi2xz1WssX
 QH0Fpjnpf5w47KOPqL1Kw4EMd5u2tln/TS3NuGq1mACmGzPN8xBL+IpUgXQ1Hn0zi+Sa
 PYmgVzNyo5/6RPLMjLdkD4WxJZqSjM9uj/EC98KCa3bvo2sfQD81Nws2BvthLSorxcB/
 /BdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TQEfts7gGgrS3RTNrz2Amxg4xfYD+j4xnGdHlASdH9I=;
 b=MnZRg0vEZ4enelBrO7aK8E9uipf3QvFiRUA0+V4v6k/lFoRREzG9MsG4zu8PT9Holh
 1o1Wmx6KJ7ANRg1iXFNxnj1Jk5Pe8w2A+Dz/PeksOOxW9lJN6xckiUW6l/qBFNf3JQXm
 E9PMZZZluilz5WmWPfpC1YkzE+l4+npk+IEK4XAc9LmbIrEW7VFyBZts4GSl8uWsCweb
 IWG4F0w/4DiNkTsh4UaN1DmV3EtC76kdJfDDIPt6AKy5cspMA1ESEjr6IvB4oc3Ny6GS
 1ddOPA8V3FJ3I/GcPuHOykr4RYZVcckGDocRgnpAsrpgo6aNdgqqMFJNGns7S9+gzkB+
 +vCQ==
X-Gm-Message-State: AOAM532SmiTTbnnTMcUwgVEuYuLJrw+hEqPQUgfotgbhNuk+otMSubLk
 JaHVOqrWT70EGp2++Pg7aSbyMaNXQcTatdDQooznLlRz5jc=
X-Google-Smtp-Source: ABdhPJwgoNy1H9XcwcsUGxoasbcDBzq7WtxOrHlC76valho4hFxrC3TCWeuptcHUT67MMZuyDOCisnyGSl8/nYlDU50=
X-Received: by 2002:aa7:d5c5:0:b0:425:b144:ab84 with SMTP id
 d5-20020aa7d5c5000000b00425b144ab84mr31520840eds.200.1651078491902; Wed, 27
 Apr 2022 09:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
 <20220427145730.GE38351@ediswmail.ad.cirrus.com>
 <YmlgL+Ur6BeWiUtr@sirena.org.uk>
 <20220427164825.GH38351@ediswmail.ad.cirrus.com>
In-Reply-To: <20220427164825.GH38351@ediswmail.ad.cirrus.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 27 Apr 2022 11:54:40 -0500
Message-ID: <CAHCN7xJSpYsZbVRrCmt8QobEOk+bvRLs=qgTHqqsh-K1xEUgUA@mail.gmail.com>
Subject: Re: WM8962 crashing on suspend
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Wed, Apr 27, 2022 at 11:48 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Wed, Apr 27, 2022 at 04:24:31PM +0100, Mark Brown wrote:
> > On Wed, Apr 27, 2022 at 02:57:30PM +0000, Charles Keepax wrote:
> > > On Wed, Apr 27, 2022 at 08:12:56AM -0500, Adam Ford wrote:
> > > > static const struct dev_pm_ops wm8962_pm = {
> > > > + SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> > > > SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
> > > > };
> >
> > > > I applied this, and it appears to make the issue go away on a 5.15
> > > > kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
> > > > would that be an acceptable solution to push upstream?
> >
> > > Feels like those operations should be runtime PM, like there is
> > > no reason to keep the CODEC in a high power state than necessary.
> >
> > The issue Adam reported was suspending during playback - if you suspend
> > during playback or capture the device is not idle at the point where we
> > start trying to suspend so it shouldn't be in runtime suspend and won't
> > by default be runtime suspended by the PM core.
>
> Yeah in my head snd_soc_suspend would have been called which
> would (assuming the DAI doesn't have ignore_suspend set) shut
> down the DAPM graph for the audio route, causing the runtime
> references to all be released and the CODEC to be suspended
> through runtime_pm. Not sure if I missed something there, and
> that also allows for systems where the CODEC doesn't suspend
> during system suspend. That said guess there probably arn't
> any use-cases for that on wm8962 and I am more than happy to
> use the force_suspend ops if you are happy with it.

I am not familiar with this driver or the force_suspend ops, so I am
not sure if there are going to be side-effects.
I don't mind collecting more data if it's helpful.  I probably won't
be able to add more debug info until this weekend at the earliest.

adam
>
> Thanks,
> Charles
