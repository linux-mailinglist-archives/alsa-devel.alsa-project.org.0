Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2F63A9709
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 12:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC64D851;
	Wed, 16 Jun 2021 12:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC64D851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623838568;
	bh=4U7CRd5ZUHeAQ1mHTEeUDEyK+XRZ/2DD+iIwKeM2DUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DIxX12/MHyY7N93sBaRZNb/bm0HiaUGgzu6m68DlgknBoiIKOasG5MbxlaNAjyckt
	 7NIulTa2X2xepycHEjNTC+WOtg0d1VbaeMN28VyphIVnvV4puRWK0D/PfDBjLmsjul
	 OlJj5kq0mKeUv1zye9lWSLUNU3p6GD1mAsQXNtOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49289F80165;
	Wed, 16 Jun 2021 12:14:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAABCF80423; Wed, 16 Jun 2021 12:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E611F80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 12:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E611F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EJlIwC+w"
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso1382801wms.1
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4U7CRd5ZUHeAQ1mHTEeUDEyK+XRZ/2DD+iIwKeM2DUQ=;
 b=EJlIwC+w/ZZcUyLS2Wmq9xD/+QoTpHYJn6vBhhOq04HrcqQ3zLjqNMhOlCw3LdBytb
 AtbsLxrJg3b4TnH+GAksptt1xPeldU9cRmZocKOu80svTqGC6XWsaGvu0QlnEr2F+ttU
 jb+Z26eE6h0fmWbXGmciv1IrXyo48ZuO7kAAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4U7CRd5ZUHeAQ1mHTEeUDEyK+XRZ/2DD+iIwKeM2DUQ=;
 b=AnLdcQ4sL4zlutgIQ78KyhDeuTmKzxqRj2VzVz/V7uWxAINUxYZ52vWdXBY5jCl6WP
 7Kukh4ctg+By38sCMMdP95SVZLtqvktrPKppy+HMbdtqqfwYN2p4HV4fYAkbeRBxJ87e
 Ind7saOzybfRlx95fJWVDEC10G5DTEcvtDD1WbXA+4KzWZZoTitL2z+NE7jaVawDZTM6
 4QBZlkmNNkBd/JDwITK/8ZLt8aCVQwGw78wRomCbLY0hK88544JtWrPDUK/xEjFXzc5y
 kpk9PUkL7blzJ+RIxe1FJUYl8vew16ZhMNVXQOXeYiYIlw+K+tsC8Jpmdy/6STI+Zgn1
 i50w==
X-Gm-Message-State: AOAM531mywV1Ld1kF4WAwGb97LJ8YCdF8SNqy4Lq7Uh41cldn/+okgN8
 eC7U83o8mIukc/w+ATELMEGRxP0PlxYNrIt5EaDWcQ==
X-Google-Smtp-Source: ABdhPJwvRYer0BSrpn6ulizEkP50tXiNp6EJLSUbHvxNSVpJOzUIbRyL0qQIPiFOhbr31ytuPczvh4qBQIl7ujw3jeM=
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr10523975wmk.97.1623838472860; 
 Wed, 16 Jun 2021 03:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
 <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
 <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
In-Reply-To: <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 16 Jun 2021 18:14:05 +0800
Message-ID: <CAFv8Nw+FNfmgwadeFMWjRiGbKFuO4JJ=9ggRHxG+Pq_OuHdmeA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Dylan Reid <dgreid@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On Wed, Jun 16, 2021 at 12:00 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 6/15/21 10:47 AM, Cheng-yi Chiang wrote:
> > Hi Tzung-Bi,
> >
> > On a platform, the four max98357a amps will be controlled by only one
> > codec device, as GPIO for SD_MODE is shared by all amps and is the
> > only thing to be controlled.
> > In this sense, I think we can treat max98357a DAI as if it supports
> > four channels.
> > I understand that this solution is not scalable, because one can
> > control as many amps as they want.
> > Theoretically, the number of supported channels by this codec device
> > is unlimited.
> > I found that rt1015.c has similar usage.
> > Do you have a better suggestion to support this kind of use case ?
> > Thanks!
>
> please don't top-post...
Hi Pierre-Louis,

I am sorry about that!
>
>
> I don't think it's correct to declare 4-channel support at the
> individual codec DAI level when in practice each device will be provided
> with a TDM mask that selects two slots.

On this platform there is no TDM support, so there were two I2S data lines.

>
> This is confusing device capabilities and TDM link configuration.

I see that in most of the use cases of multiple amps, we should use
codecs and num_codecs of the link.
But in this case we only want one codec to control the only GPIO
shared by 4 max98357a amps
I think we should be able to use 1 max98357 codec and 3 dummy codec to
fulfill this use case.
Not sure if the number of dummy codec would really matter.
With num_codec > 1 we should be able to bypass the channel checking
and just use the channel from CPU DAI.
Thanks for the suggestion.


>
> > On Tue, Jun 1, 2021 at 2:20 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >>
> >> On Wed, May 26, 2021 at 11:47 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
> >>> Sets channels_max to 4 to support QUAD channel.
> >>
> >> Could you point out probably the up-to-date MAX98357A datasheet for
> >> 4-channel support?
> >>
> >> On a related note, from the public datasheet I could find[1], "Table
> >> 5" only shows 2 channel's configuration.
> >>
> >> [1]: https://pdf1.alldatasheet.com/datasheet-pdf/view/623796/MAXIM/MAX98357A.html
