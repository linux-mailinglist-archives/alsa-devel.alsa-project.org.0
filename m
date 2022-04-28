Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC19951338E
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 14:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 678B91632;
	Thu, 28 Apr 2022 14:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 678B91632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651148581;
	bh=vn1FeuprLJhIwATzTzo+YMF4NYreyuYcg4zJl9dkmZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GUX7KNALcv9/qPBAq605OBwhtnImSzBAxFEv5KTayyAnSifrVHTbMLVwfJ15NOe2A
	 /jxHbjEPAKZ1DScmEveTMsGp+zunnmhB0eEfDzfch1ic2PE7IcxscjS3iBS3O3w9d9
	 R8YVIHzt6lHcLGqWMvR8Apekkl9y3flZhOyDkqMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D80F800F2;
	Thu, 28 Apr 2022 14:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6457F8016E; Thu, 28 Apr 2022 14:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97C7BF8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 14:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97C7BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ozM4TRYC"
Received: by mail-ej1-x636.google.com with SMTP id dk23so9206309ejb.8
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kHC/sO6eIW7uXUOVldWo1tUYFi/Y8qeMgQ78qKqaIzI=;
 b=ozM4TRYCVn7wb460x/Mi+qMJg74HYDqmuuwnaj1HFKU71sSpXQ3aw39mEiSHnjjj0c
 +dDiD1Hidn9/dEQEqiVALTdWMydJKcZpIKyJGj3e1lrjdFOAkEaS5hQih+rwz9kxMhuB
 sSQA+IX5/8Hs5KqSBQVVDunk/9L+6kj+syVoibs7959bk9l1YQrPmGj58CLy4YDprpaO
 9etJryt3MfhBywv4DpYH+qG2edjSeLBBgFayIpsyapw2/I6qh2xYLx/qpA5+Wp65uyMg
 B0KwPdw8u/9ZxKr0p37SaAC31kX+MF3YLcKAYw7EXZ05SMm9ThhGbLzqVQy2PumKADjl
 XNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kHC/sO6eIW7uXUOVldWo1tUYFi/Y8qeMgQ78qKqaIzI=;
 b=mxxVzxZ6O26o9ipfUduxjRtu8rVs8idA22e6tGDWMIqG94adA/rkxwoVRZFUJvK609
 IUT+Tw8CV5ZATlRuH5CoUxy6EailZtMRe5+vbDHA4zvcGPcw+EoAgzkgcUI1Ub2rzCcK
 o8l/sTfr6yoQruRZ98//SFuLdt+8RS435jk7GM1qKp0YvUSaa/azAoGlKID7cvwMAfh4
 RviTD0Plg+xdSAIsTTP+8pO4K747NFVbuQmMxzU+vTGPoHg7dmugvPIc2eY0HY7Abtvo
 ptJRXrbSKkkoo3JFURyxhrxBriA6Wx/kWHHGvJR+0Lixw2OBEIJBMwJVQP84Zc12Ycsw
 G/Sw==
X-Gm-Message-State: AOAM532Y6RggT5QAEXQxAVQ/qcFxlN+8gTQehlvei1FnRlnVv7q/llg1
 GdYVHXOaQluHjCTRlIhGkKMYu+6VEsW2M5kyv/M=
X-Google-Smtp-Source: ABdhPJzCkGSf3HaVy7VeSq0GTSIhhZrxOfsSj+vqsBo0Ui3z5CXUOon/R8Xq2/7Sm1+bqZm7BWTDTNCunIp89LnIe8Y=
X-Received: by 2002:a17:906:ad9:b0:6f3:da10:1389 with SMTP id
 z25-20020a1709060ad900b006f3da101389mr3614221ejf.32.1651148511444; Thu, 28
 Apr 2022 05:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
 <20220427145730.GE38351@ediswmail.ad.cirrus.com>
 <YmlgL+Ur6BeWiUtr@sirena.org.uk>
 <20220427164825.GH38351@ediswmail.ad.cirrus.com>
 <CAHCN7xJSpYsZbVRrCmt8QobEOk+bvRLs=qgTHqqsh-K1xEUgUA@mail.gmail.com>
 <20220428082321.GI38351@ediswmail.ad.cirrus.com>
In-Reply-To: <20220428082321.GI38351@ediswmail.ad.cirrus.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 28 Apr 2022 07:21:39 -0500
Message-ID: <CAHCN7xKOr5CJbBCCxJTUoyDndRy0rkfgk-N1WKJ5iAZsdTXS2A@mail.gmail.com>
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

On Thu, Apr 28, 2022 at 3:23 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Wed, Apr 27, 2022 at 11:54:40AM -0500, Adam Ford wrote:
> > On Wed, Apr 27, 2022 at 11:48 AM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > > On Wed, Apr 27, 2022 at 04:24:31PM +0100, Mark Brown wrote:
> > > > On Wed, Apr 27, 2022 at 02:57:30PM +0000, Charles Keepax wrote:
> > > > > On Wed, Apr 27, 2022 at 08:12:56AM -0500, Adam Ford wrote:
> > > > > > I applied this, and it appears to make the issue go away on a 5.15
> > > > > > kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
> > > > > > would that be an acceptable solution to push upstream?
> > > >
> > > > > Feels like those operations should be runtime PM, like there is
> > > > > no reason to keep the CODEC in a high power state than necessary.
> > > >
> > > > The issue Adam reported was suspending during playback - if you suspend
> > > > during playback or capture the device is not idle at the point where we
> > > > start trying to suspend so it shouldn't be in runtime suspend and won't
> > > > by default be runtime suspended by the PM core.
> > >
> > > Yeah in my head snd_soc_suspend would have been called which
> > > would (assuming the DAI doesn't have ignore_suspend set) shut
> > > down the DAPM graph for the audio route, causing the runtime
> > > references to all be released and the CODEC to be suspended
> > > through runtime_pm. Not sure if I missed something there, and
> > > that also allows for systems where the CODEC doesn't suspend
> > > during system suspend. That said guess there probably arn't
> > > any use-cases for that on wm8962 and I am more than happy to
> > > use the force_suspend ops if you are happy with it.
> >
> > I am not familiar with this driver or the force_suspend ops, so I am
> > not sure if there are going to be side-effects.
> > I don't mind collecting more data if it's helpful.  I probably won't
> > be able to add more debug info until this weekend at the earliest.
> >
>
> Nah, its good your ok to upstream your out of tree patch, just
> making sure I fill in the holes in my knowledge with Mark :-)

I'd like to push the patch with a Fixes tag, but I am not sure that we
have a definitive hash to use.  Ideally, it'd get backported, but I am
not sure that I have the means to test it, because the hardware
platform I have doesn't go back that far.  Any thoughts? If not, I'll
just push it without a fixes tag.

adam
>
> Thanks,
> Charles
