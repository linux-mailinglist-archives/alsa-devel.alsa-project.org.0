Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F57F1EB6
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:26:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7E6167E;
	Wed,  6 Nov 2019 20:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7E6167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573068366;
	bh=9lHzlOygLMgOK9YMJrpoTsQ9XuEEGwjbGEhe5ZlbwYE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IcxMgQsN+2/oswiw/h3x+GgnsakmwoBS32PUs/26h9fLK6u9DbEjt31i3GLVgwjg0
	 sgMtX5drL5pKguu5xpia1fSke4nelrKDtTVafbOHMsCdQYUjyCK2wQX/UKsA1LSJVz
	 SCMUuqX3bHGRECdPZjXTvD5n/z0CsygubxIu1PCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B41C7F8045F;
	Wed,  6 Nov 2019 20:21:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B95FF800F3; Wed,  6 Nov 2019 20:21:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FE59F80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:21:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE59F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IEAPWRQp"
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2804E21848
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573068068;
 bh=kt51GLtJRGhpxeArH7PbPGc0NGH1R9MH+9Qgg9Bbl2E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IEAPWRQpe0iBBUsDao1BwZCcAb28KOkc7oYh6GKs2SroYSjzRVbW7TXz2ar0KL9d3
 sUnYQrBCCep8Y0basL097DguXypI0HNiAZbSzC4S+d4qPGDr14sHOzYFSytB1ET9y6
 OdgizA3YtPO8U5omwD7mj8rkAxMmeITXadRB5Qrg=
Received: by mail-qk1-f182.google.com with SMTP id m4so25648662qke.9
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 11:21:08 -0800 (PST)
X-Gm-Message-State: APjAAAU1NZXcFjWdfsZTzhJeTyWLM6Eu/qdElNkcNaBXDTWvfVKZCMex
 F22u2IdpEODKdomde9XBmKNb7q4ztEYZZnGjnw==
X-Google-Smtp-Source: APXvYqx32bwEhx99vHD/kDAS+/S75zvMWBv+yskX8CR2wiE5zYnXor6TRM6cgKz+ApVQJE7zjdsPqEDMXPf0REI1jX8=
X-Received: by 2002:a37:4904:: with SMTP id w4mr3368103qka.119.1573068067259; 
 Wed, 06 Nov 2019 11:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
 <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
 <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
 <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
 <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
 <b3d078a1-f87d-c146-bdf7-7a6b30547bd5@linaro.org>
In-Reply-To: <b3d078a1-f87d-c146-bdf7-7a6b30547bd5@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2019 13:20:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK2yBcWbZvK3qUeYW8q+NuWrUmCTBMWqwbAU_0i1fE4rA@mail.gmail.com>
Message-ID: <CAL_JsqK2yBcWbZvK3qUeYW8q+NuWrUmCTBMWqwbAU_0i1fE4rA@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Vinod Koul <vinod.koul@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 01/11] ASoC: dt-bindings: add dt
 bindings for WCD9340/WCD9341 audio codec
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

On Wed, Nov 6, 2019 at 12:09 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 05/11/2019 19:08, Rob Herring wrote:
> > On Wed, Oct 30, 2019 at 4:55 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >>
> >>
> >> On 29/10/2019 20:47, Rob Herring wrote:
> >>> On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
> >>> <srinivas.kandagatla@linaro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
> >>>>> Its Phandle.
> >>>>>
> >>>>> something like this is okay?
> >>>>>
> >>>>> slim-ifc-dev:
> >>>>>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
> >>>>
> >>>> Sorry this should not be an array, so something like this:
> >>>>
> >>>>      slim-ifc-dev:
> >>>>        description: SLIMBus Interface device phandle
> >>>
> >>> You're just spelling out the abbreviated name. I can do that much.
> >>> What is 'SLIMBus Interface device'?
> >>
> >> Each SLIMBus Component contains one Interface Device. Which is
> >> responsible for Monitoring and reporting the status of component, Data
> >> line to Data pin connection setup for SLIMBus streaming. Interface
> >> device is enumerated just like any other slim device.
> >
> > So a standard set of registers every slimbus device has? In hindsight,
> > I would have made reg have 2 entries with both addresses. I guess that
> > ship has sailed.
>
> That will break SLIMBus bindings, Which is expecting one device per
> device node.

Like I said, that ship has sailed...

> >
> > It seems strange you would need both "devices" described as separate
> > nodes in DT.
>
> Because they are two different devices on the SLIMBus Component.
>
> >
> >>
> >> We already have exactly same bindings for WCD9335 in upstream at:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42
> >>
> >>>
> >>> Is it a standard SLIMBus property? If so, document it in the right
> >>> place. If not, then needs a vendor prefix.
> >>
> >> "SLIMBus Interface Device" itself is documented in SLIMBus Specification.
> >>
> >> If I remember it correctly You suggested me to move to "slim-ifc-dev"
> >> as this is part of SLIMBus Specification.
> >
> > Probably so. If it is common, then document it in bindings/slimbus/bus.txt.
> >
> As we are dealing with audio codecs here, it might be that
> "slim-ifc-dev" is common across wcd9335 and wcd934x but not all devices
> on the SLIMBus Component would need handle to interface device. SLIMbus
> can also be used for control buses as well which might not need this.

Like you said, it's part of the the spec, so define it somewhere
common, not in a device specific binding.

> > Then here, 'slim-ifc-dev: true' is sufficient. You can just assume we
> > convert bus.txt to schema (or feel free to do that :) ).
>
> We need phandle to the interface device so that we can program the
> streaming parameters for the SLIMBus Component.

'true' just means 'I'm using the property' and have no other
constraints. The constraints like type would be defined in the common
binding and no need to duplicate here.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
