Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C34D4486
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 11:25:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 192F81895;
	Thu, 10 Mar 2022 11:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 192F81895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646907938;
	bh=zv+SAChDgZCkNTw3Cf7lo7fpZLSItMjdBmWUfRVZmok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YZCh1N/dUUb9qZRv1CppeEZPz72T7XV9WVWP0hhF/EtvoD2f2Ow/Aq5B+ywtEXlJy
	 m0YH3Oo8mRoXq+v1PtBTqvEEJcBDqFuV2u7QgnJuRLYoaFvsWj8NT3p4J0RSYcZA9t
	 VtJswNFAIcAvZRm4sqjv6YTOeDFIVnto80N32zKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A14F800D2;
	Thu, 10 Mar 2022 11:24:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E36FF80137; Thu, 10 Mar 2022 11:24:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0926BF800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 11:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0926BF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bSUZuST0"
Received: by mail-yb1-xb2a.google.com with SMTP id j2so10056467ybu.0
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 02:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6naJd+0sZQ29BmCLcmFwDc35DHsyxjzyXnqa9Mk7bLE=;
 b=bSUZuST0uigI2zFO4tPzF0IC7azGrfKIj/PG+/k1xdEKtZiiElVwRoCQvZfuqmeAeZ
 OVrZZGYYLEp4dDZ3LHEBQqB0JNg6h53oiyOOHsCpMC3nldgnHnjDjx+AT02qR4NQ9lEQ
 2dCaSvQ+V66ETNXQDHi+C+1pyJcUcHDqLMV35SJzQy/24nzyI805Nm1Swc3ENM29yfIu
 YHxvyM33XVMEikCfvHJAY97oDxtLUsBU4Fn8/L4AVjtoMCEDn4AE9qxy88wzqXvZHoY+
 AKgwTTxGrKVYK7bYNmsRFj5f76CvdUv0KSC0ZDGeUU+Umyq70LJgDqW6pnLIMMyuPvYY
 gARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6naJd+0sZQ29BmCLcmFwDc35DHsyxjzyXnqa9Mk7bLE=;
 b=I7+m1hH2bsKJTLfudWyPSBkUe+REAjPBcmN8Te0HCQX23ocPJxqf1QgldMwTHkexkc
 kAVgRResDQ8b4eIk4JzRnhG9yd8eqYawKJPWz7cie1JlV/d03c0Cx8Dr05Dd+Cc2MzS7
 tbvvyt7DXckoU6tzX02TNwQnV1c2ZCUWt2Bi9E7j+go/Uj65QVKLXYmvVRB2bDeB2UnV
 Vu1qrYfiAzA78Di0CCfNJ53OTYF8AqI6TBrUPuP05uByB2lbh9Ff2pCJjloKqgvNtqBF
 fwP7ZdbK0utNH5qh418wureCLvkSzVEfuPnp2N+MBI2Q/ZLWNFsZi3ZXcLhwYoqlCMAI
 Fcfw==
X-Gm-Message-State: AOAM530vDbNfYRIg74WWx62IJrsilS07XqvbFY4p53CK9PGjBM8WNpM+
 jzAoXm1TvR/P/0wdrAQflu9ZnJFJTxmVul1pNFY=
X-Google-Smtp-Source: ABdhPJwOa/BYCFgn16nyNygqP/E7e04kCx1eOH+kxuWtpClYMQmITCAztH4hZgVdpFrkt0U1rwRQrR4cizObCrrlTwk=
X-Received: by 2002:a5b:246:0:b0:619:5651:3907 with SMTP id
 g6-20020a5b0246000000b0061956513907mr3209140ybp.190.1646907861259; Thu, 10
 Mar 2022 02:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5ea7235-8642-6a89-f4ce-bd0861b6e4aa@linaro.org>
In-Reply-To: <c5ea7235-8642-6a89-f4ce-bd0861b6e4aa@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 10 Mar 2022 10:23:55 +0000
Message-ID: <CA+V-a8tkhERx+8zDae5aWkNQ9Oxd1AamRL=i4TDC2X8RGgAo0w@mail.gmail.com>
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get the
 interrupt
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-arm-msm@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

On Thu, Mar 10, 2022 at 10:16 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 24/12/2021 16:13, Lad Prabhakar wrote:
> > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > allocation of IRQ resources in DT core code, this causes an issue
>
> Are you saying that we should not be using platform_get_resource(pdev,
> IORESOURCE_IRQ, ...) on drivers that support DT?
>
> > when using hierarchical interrupt domains using "interrupts" property
> > in the node as this bypasses the hierarchical setup and messes up the
> > irq chaining.
>
> Should this not be fixed in the DT core itself?
>
Yes the plan is to fix in the DT core itself (refer [0]).

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

> >
> > In preparation for removal of static setup of IRQ resource from DT core
> > code use platform_get_irq().
>
> I would prefer this patch to be part of the series that removes IRQ
> resource handling from DT core.
>
Since there are too many users (which are in different subsystems)
getting this all in single series would be a pain. As a result it is
split up into individual subsystems.

Cheers,
Prabhakar

>
> --srini
>
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Hi,
> >
> > Dropping usage of platform_get_resource() was agreed based on
> > the discussion [0].
> >
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> > patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> > Cheers,
> > Prabhakar
> > ---
> >   drivers/slimbus/qcom-ngd-ctrl.c | 10 ++++------
> >   1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> > index 7040293c2ee8..0f29a08b4c09 100644
> > --- a/drivers/slimbus/qcom-ngd-ctrl.c
> > +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> > @@ -1526,13 +1526,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
> >       if (IS_ERR(ctrl->base))
> >               return PTR_ERR(ctrl->base);
> >
> > -     res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > -     if (!res) {
> > -             dev_err(&pdev->dev, "no slimbus IRQ resource\n");
> > -             return -ENODEV;
> > -     }
> > +     ret = platform_get_irq(pdev, 0);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -     ret = devm_request_irq(dev, res->start, qcom_slim_ngd_interrupt,
> > +     ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
> >                              IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
> >       if (ret) {
> >               dev_err(&pdev->dev, "request IRQ failed\n");
