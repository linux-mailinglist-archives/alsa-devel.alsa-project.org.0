Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD314D4952
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 15:16:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8247842;
	Thu, 10 Mar 2022 15:15:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8247842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646921783;
	bh=yo5cNZOSv/J/WvklnDG16ry9Bw3elHchQ9q/vBCqvbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbsBq/bzLZVUcU3ScxBAWvqn7sEcyGE3xdthJyieoK7WBqeJ9mmQtcnj8wO+PAGyR
	 NsevrRuQqpBTMVRgzHN0c6cjKV7gdLKIaElACNWVAE7HYICVOajJ+nWmE0pK1BlLP/
	 Asb/7lanoGpw5NZVZHpqD82dA3Mi9k6ECWSvp+fU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E53DBF800D2;
	Thu, 10 Mar 2022 15:15:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A908BF800D2; Thu, 10 Mar 2022 15:15:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C5DAF800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 15:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C5DAF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="maGHS2m9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8A8F61CAF
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA5AC340F5
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646921702;
 bh=yo5cNZOSv/J/WvklnDG16ry9Bw3elHchQ9q/vBCqvbQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=maGHS2m9LDj84cxFFYKfEByaP+07rvv+owPqT7QN/rWpqfNcEJIgelSZsi89z4YEO
 eQ1qFs24G5TKKZ37vfsaWUuoahmWC2QwUDpYhUJOWTcA5ftlnYtglXuIm3C+NzvXVX
 gBXYfhzm3t7ZnwmCGQflz+r+w3644ExZdU582Wf+q3jK8KdwigqrOzzNj+ZaARW29C
 7hn4UDgR975l1tpTzDFBwdz4PbSL/O4tpE2aHK4RWiwc0aMs1RoAbAgXX3XjuS86s3
 HePHW4K+4ISCDz6AYjeZei8oxFadEePkK2O4JH54dDvQ9xfKcmwPJoy+iQaWP2GBHv
 67tYi9URG2iMw==
Received: by mail-ed1-f54.google.com with SMTP id h13so7153236ede.5
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 06:15:02 -0800 (PST)
X-Gm-Message-State: AOAM533tNVDVjsQTotiQn5GitepfIG/Gri3NwMj4giVs32OMBELiv5tj
 afUiat8CaQ0Z8V6PVg4OSiZdpAjCb/mX+OGCuA==
X-Google-Smtp-Source: ABdhPJxTKjB6jCuITpAJueLD1jR/nypmp0A/gmHHrMEnwEcpJdUe3bQ2Gx3VCz4Rpb6k9VX70aM1nvGlH0UAjjLTElI=
X-Received: by 2002:a05:6402:5256:b0:416:97d1:a6a2 with SMTP id
 t22-20020a056402525600b0041697d1a6a2mr4571157edd.280.1646921700547; Thu, 10
 Mar 2022 06:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5ea7235-8642-6a89-f4ce-bd0861b6e4aa@linaro.org>
 <CA+V-a8tkhERx+8zDae5aWkNQ9Oxd1AamRL=i4TDC2X8RGgAo0w@mail.gmail.com>
 <5e13c1ba-0bf5-e360-c350-e7a1a1402350@linaro.org>
In-Reply-To: <5e13c1ba-0bf5-e360-c350-e7a1a1402350@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 10 Mar 2022 08:14:48 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+CWKvkHMNhAa3o_rSLy_+AoHi6wkB3MRM8O3jJ5sG_Wg@mail.gmail.com>
Message-ID: <CAL_Jsq+CWKvkHMNhAa3o_rSLy_+AoHi6wkB3MRM8O3jJ5sG_Wg@mail.gmail.com>
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get the
 interrupt
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>, Andy Gross <agross@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, Mar 10, 2022 at 4:42 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 10/03/2022 10:23, Lad, Prabhakar wrote:
> > On Thu, Mar 10, 2022 at 10:16 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >>
> >>
> >> On 24/12/2021 16:13, Lad Prabhakar wrote:
> >>> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> >>> allocation of IRQ resources in DT core code, this causes an issue
> >>
> >> Are you saying that we should not be using platform_get_resource(pdev,
> >> IORESOURCE_IRQ, ...) on drivers that support DT?

We should be using platform_get_irq(). (period, on all platform drivers)

> >>> when using hierarchical interrupt domains using "interrupts" property
> >>> in the node as this bypasses the hierarchical setup and messes up the
> >>> irq chaining.
> >>
> >> Should this not be fixed in the DT core itself?
> >>
> > Yes the plan is to fix in the DT core itself (refer [0]).
> >
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> >>>
> >>> In preparation for removal of static setup of IRQ resource from DT core
> >>> code use platform_get_irq().
> >>
> >> I would prefer this patch to be part of the series that removes IRQ
> >> resource handling from DT core.
> >>
> > Since there are too many users (which are in different subsystems)
> > getting this all in single series would be a pain. As a result it is
> > split up into individual subsystems.
> Am happy for this to be included in that series,
> TBH, this patch make more sense along with that series than by itself.

No it doesn't. This is no different than converting to devm_* variants
or other cleanups to match current preferred styles.

Treewide cross subsystem clean-ups are a huge pain to merge. Why would
you ask for that when it is clearly not necessary?

Rob
