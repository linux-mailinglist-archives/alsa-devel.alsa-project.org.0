Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E4474924
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:19:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9D51FFB;
	Tue, 14 Dec 2021 18:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9D51FFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639502379;
	bh=qRczuY+UNN+qbk0KSjlgxKClfHB0e5rqUACREGhHYFc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATDWmDn4OEtcFjk/60u20hqvFRAOSVU9c5hHYGWVHa+Bb8uCSd5/51Ist9VIq7jLn
	 jAqULiZsie0X4pO7Z/mugbTU0ojdk1HiI70lyHywQ0IFmIzun9v579ZVUrbGK50hIN
	 Gm5KDnBnU+5SQ3qyfclcmz6jGI6qATLSfJqfjjAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1DBEF80249;
	Tue, 14 Dec 2021 18:18:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67969F80246; Tue, 14 Dec 2021 18:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D34EF800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D34EF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E/0G7D28"
Received: by mail-ed1-x52b.google.com with SMTP id z7so4376236edc.11
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 09:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4k5xaxFhaWmmMpFWuwoV5BzpXXgW4I+HqRbm5rb7jQ=;
 b=E/0G7D28L5ngV0FeoItTWxWCu93mlXAxXRQGbhVuVR/4XZx1fRJ30udAun2qn4uj5G
 x+WdA2mCOnVS9EBKt3++NrkzRMRzd1225YRW0PXZuPOX/hyWYE3vt4VZPBZHAALjIoLl
 3qjAFrCGDteLu5JFgajrUCBMaZsMiOI4N6WlGy12nTIlbmZmp14zXehZA7xnZyYTG16T
 uF/IDmhPRBcENwdV7m8w6edfxhjEqYoDmo8VbI/v+WvFtPdW7GtUbevbwomTgfHUdDpG
 dXY6LzDz4Ap5dlYCrL4K49eRnqBqBBq0osDjRwUPt+EZIRVkG0MvSFQLqoboygwLvfXl
 0q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4k5xaxFhaWmmMpFWuwoV5BzpXXgW4I+HqRbm5rb7jQ=;
 b=b/iiwSRzeWLH2dbrCvr1nB9hFrM/blOnpFRqYvuh8Dy9r9NIn44YqQOJzClvfwwILq
 tEGulVoAAKIFIJSDQ5U0UYrzoH6lyExYROMsHERuUntb67B0e+6m8mG5xBxOoPMd5X6i
 zCkIlBTsKE/GRcJTNuY7UucUC0guPGA4Zmzvxjwfx2pUQxmLTr7jEqmmcdCsFSmyYMlk
 ugIN4Q2psVj9L/cbBbPaIaZ/Lsqvadjht6tnvMn2GU/E/XGiwwTPN+6MioHtwJ8C/8bl
 A4JvjsBYMpbhAfrrfoRqe5GF8yrX3AQaoxTovlTas7MFCxdco5TIHzqofM+C8YqGOmcS
 7Srw==
X-Gm-Message-State: AOAM531op/fDdWaZDy3yxdWH593dXKUtGq5ylxQIf0J9zKyRyu+hpdiT
 XOt6QSmddgrhFnUPmw892irFLx+wzjWlwtUnixg=
X-Google-Smtp-Source: ABdhPJzvpULuko8jJTmI6gtokS4SL3ehpvJGK6X1x3V2r6BF2DkuActxc/xuzD9om2ud1n0bwycObZY3BBBvqdpIxMI=
X-Received: by 2002:a17:906:af1a:: with SMTP id
 lx26mr7201191ejb.44.1639502300844; 
 Tue, 14 Dec 2021 09:18:20 -0800 (PST)
MIME-Version: 1.0
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
 <1638891339-21806-4-git-send-email-quic_srivasam@quicinc.com>
 <CAHp75Vd=47Tv9Sf+styPhxS2=O1H2KUDeKQXTULUYU5fDgGwwA@mail.gmail.com>
 <0f6621e5-f014-27c9-be8b-6c32ab994304@quicinc.com>
In-Reply-To: <0f6621e5-f014-27c9-be8b-6c32ab994304@quicinc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Dec 2021 19:16:50 +0200
Message-ID: <CAHp75VdL3hmr23CcJLDpvbHaKv5HrDZjmVQpCnRNmPM7nEx6WQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] pinctrl: qcom: Extract chip specific LPASS LPI code
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 Takashi Iwai <tiwai@suse.com>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, rohitkr@codeaurora.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Dec 14, 2021 at 7:15 PM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
> On 12/8/2021 11:58 AM, Andy Shevchenko wrote:

...

> >> +#define NO_SLEW                                -1
> > Naming sucks for the header.
> >
> > LPI_NO_SLEW ?
>
> Actually it's already mainline code. Just these patches are
> rearrangement of old code.
>
> still do you suggest to change?

I would, but this means it should be in a separate change.

...

> >> +struct lpi_pingroup {
> >> +       const char *name;
> >> +       const unsigned int *pins;
> >> +       unsigned int npins;
> >> +       unsigned int pin;
> >> +       /* Bit offset in slew register for SoundWire pins only */
> >> +       int slew_offset;
> >> +       unsigned int *funcs;
> >> +       unsigned int nfuncs;
> >> +};
> > Are you going to convert this to use struct group_desc?

Any comments on this? It sounds like further improvements.

-- 
With Best Regards,
Andy Shevchenko
