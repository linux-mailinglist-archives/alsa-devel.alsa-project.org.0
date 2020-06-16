Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26621FBD7C
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 20:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98C131679;
	Tue, 16 Jun 2020 20:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98C131679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592330585;
	bh=P1/EB/jmkvbnKLD2OGqL8Zxn9yOxJmK4wmo3lqCpjGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARTJ1V9BqY06fBWcv61KmRXEZwMpS5EG2ryo3rc0kUSlTyMYbZam0yjLK+aWqb/1H
	 A0n7ft8KeRWMKZ1CcOvstkkTiyxUibRhWO4k/hz9ru+sQBzhd5N+rLKJGKJpHhTi+Z
	 G/kJj0biX0yrj7YYftA1uhC/zb37IUGknKTcW08U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB4B0F80232;
	Tue, 16 Jun 2020 20:01:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2075AF80114; Tue, 16 Jun 2020 20:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBCB0F80114
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 20:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBCB0F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TuBEyfGO"
Received: by mail-oi1-x243.google.com with SMTP id 25so20025374oiy.13
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EgZ/XoQ64awNfeRabXBKQp1DrgKmmqukpGMGvJR38Xk=;
 b=TuBEyfGOsjP2n116q5v6t3QrerQ9ug/HfGwCnWfT0pegZ2gnRoGwNWLeaHaAPA4fKT
 ZN9V/ILRPj/LpWI6wiR+rwyqidjH60mPpFa0fqZFlt7Qysr1HNsWItP2yl5FMFE74uiR
 kwQaTrX0aeMb7i+2aVVHfhMg9t+dacsYrWUPGqDJzS1V1CxpLY3AIS23JwcaejBU2UGs
 KrAcEbUZ5OW0Wg9PDeEDdlRX6QQrFOdBbmuqTPSWNjGJ7z9qzU7u64uqKeqZXxdm72Vs
 c30lpVzUqDFeS+ZaXGYjfVynGXL7TuBXYyTS16O32LIwQJAjl/VUPUP0kpXOYJL/0PZo
 hj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EgZ/XoQ64awNfeRabXBKQp1DrgKmmqukpGMGvJR38Xk=;
 b=E/9iLZKckv3cZw5T4E+55Id9GP/80lEFaO4lilIG5bxH6UJdDtfZWfh/u/QW7Zbr0u
 tbh0Wb+hGn8xplAMRt+4qanwYjUeb+Nb7oSNISQB1Zy37FzrltbCo7sV8agrJ4CExONe
 V+pUW91jeelGAmFAKZRXxRDWD4ns66sJajgtKQuLuYu+DvFwzECIzertjoC7GeaYLlHJ
 GiD4zGl77gdrWCrjhRKOchW3l/ZzpiI55XSLChOCuV9aLhgBH2j0em5SHSM05iINQnIn
 YmPHwQBFK/myaQbKqKBGMZkw0+UJ60zZbQm1maIhRd9sek6WYEMW7ByG4RNAbfNlBsLH
 pKPw==
X-Gm-Message-State: AOAM5330q6Eqg1z9i+ywzTh9rqg9nfZJeoAg5QPUVglLbZcxSl1KjNYZ
 QrCjXcmqUF00/Ve3vHUgInx3oGisf7k9JlOI/Mcl2w==
X-Google-Smtp-Source: ABdhPJwCMY2BCv+SW9qiOfPCgfX5ll96BrmVpQuKJWGEA0auXyzgdvga0VidL8pRv3v7D4D1zuMjJNfmX1WfAw9ZflE=
X-Received: by 2002:aca:2108:: with SMTP id 8mr4531179oiz.10.1592330474306;
 Tue, 16 Jun 2020 11:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063417.110263-1-john.stultz@linaro.org>
 <8f7f563b-fae7-e25e-33f2-18c608c338e6@linaro.org>
In-Reply-To: <8f7f563b-fae7-e25e-33f2-18c608c338e6@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 16 Jun 2020 11:01:02 -0700
Message-ID: <CALAqxLXnijNBB4HBqLG4k679FRcHT8hjSLMnpjE_+0UkqU7Y0w@mail.gmail.com>
Subject: Re: [RESENDx2][PATCH] sound: qcom: Kconfig: Tweak dependencies on
 SND_SOC_SDM845
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>
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

On Tue, Jun 16, 2020 at 1:25 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> On 16/06/2020 07:34, John Stultz wrote:
> > CROS_EC isn't strictly required for audio to work
> > on other SDM845 platforms (like the Dragonboard 845c).
> >
> > So lets remove the dependency and select the related
> > CROS_EC options if CROS_EC is already enabled.
>
> Sorry John, totally missed this one out!

No worries!

> > diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> > index f51b28d1b94d..0434f2c7d746 100644
> > --- a/sound/soc/qcom/Kconfig
> > +++ b/sound/soc/qcom/Kconfig
> > @@ -99,12 +99,12 @@ config SND_SOC_MSM8996
> >
> >   config SND_SOC_SDM845
> >       tristate "SoC Machine driver for SDM845 boards"
> > -     depends on QCOM_APR && CROS_EC && I2C && SOUNDWIRE
> > +     depends on QCOM_APR && I2C && SOUNDWIRE
> >       select SND_SOC_QDSP6
> >       select SND_SOC_QCOM_COMMON
> >       select SND_SOC_RT5663
> >       select SND_SOC_MAX98927
> > -     select SND_SOC_CROS_EC_CODEC
> > +     select SND_SOC_CROS_EC_CODEC if CROS_EC
>
> Isn't "imply SND_SOC_CROS_EC_CODEC" better option here?

I've honestly not gotten my head around "imply", so I'll have to take
a closer look.
What I have in this patch least is easier to compare and match with
the existing code. :)

Thanks for the feedback!
-john
