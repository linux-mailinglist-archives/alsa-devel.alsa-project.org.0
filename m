Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489AC23EC82
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFEA71616;
	Fri,  7 Aug 2020 13:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFEA71616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596799797;
	bh=MMQAjDqSTcTXO0bgkL/mY+iKKIS7uIQSy7ttS8TZV0k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u+p9QOdmXJqQuaBEb7WKSA8aVubju43UUrxtzPeY1yfUNWX3ZZE4L/HPzb3HPzq6y
	 G0+ANobgkAFOPaWz+B79nHyDwdxYKyh/Uq2TWQxYKAi+b0ZyXwt6u0PDFvBFPe99xz
	 4X9Lz56ZFRW12UhCWFnQX6yP7e2OnFARA3XCsF2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04028F80234;
	Fri,  7 Aug 2020 13:28:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B042AF80218; Fri,  7 Aug 2020 13:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_13,PRX_BODY_135,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8F2AF801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F2AF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com
 header.i=@ragnatech-se.20150623.gappssmtp.com header.b="VdjUzCI1"
Received: by mail-lf1-x143.google.com with SMTP id b11so799637lfe.10
 for <alsa-devel@alsa-project.org>; Fri, 07 Aug 2020 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=waBAoJFTdIUQI4uoUSEB4jJ4XRcoXOI3bWeWwLSuxFA=;
 b=VdjUzCI1JVslBT6YIgbNvZlRRj0n8K0nUjiErwNLA+vBqbUVtSln1LX2D/MV+FJRlv
 Koo0ZaqBc+UpbEeXrAnA8YJFugat/G61imnH2skG2tU2mnfaP+cfe5bqidryRXBACEtV
 ikYv5maKGLTvFDigGNJW2SWUqOdSZCvYgFykxd2hxz60ERr6RPOeC9E+haVBSCBVDbEY
 TNzo2R9B4srw40ZgGwUM82TPT1YiY9zjlW0FGOTIligzcMKspB+4T45k/+hkr5cLZva3
 QqZGp3tGn4NhYLza4Q/eLBi6QRnxNvA11IIWismsrd95KYL0lUan5/m5/uGtOzrP0BHv
 EKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=waBAoJFTdIUQI4uoUSEB4jJ4XRcoXOI3bWeWwLSuxFA=;
 b=jXZ89qlR5yXi+EivupU4P0BZ+yVkJxyi3jV3SkGIhTjzKspKt0Z5PDE9UXq7m/Sgkb
 KWGRAoDrhdeI47Ntrg9TQjiuXUBf8KLfiVuyXx7MwZe08BuYFFVjHN7yor8sjElE14+p
 iApJEcJ2b7wYcobaXMF+KjTU68+RuKJiy+c6rRfTZKvbu7nDg+ZIwb61EKHIp44g7jif
 /O90QSYVhG7612p90YDFhSdC6sdMxCu/HHlG9VVptOS6PuQSgoHzvk8/1ChQr1M3ghhl
 37iRaVMgBMCpMEUa02bxOjo+Vn7nEGyIQVvkrpbdm9p37zL28dHdcgUqJewiUF03SqSD
 jg7w==
X-Gm-Message-State: AOAM531Qo0QmHxjcEFJudIRpt41KiXiXR1giuX57RKjPTuwIeKP3Q49d
 wDPSDjITtvwVS/1PDuD1FalhQA==
X-Google-Smtp-Source: ABdhPJwOJR3f3YaUusCA8jfqHy76KQg5OKskX5dD7VLanBgHxd2/UwGDiHUSIfTpUkeoHS+3mTivJg==
X-Received: by 2002:a19:d14:: with SMTP id 20mr6088083lfn.27.1596799675688;
 Fri, 07 Aug 2020 04:27:55 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id q29sm4124842lfb.94.2020.08.07.04.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 04:27:54 -0700 (PDT)
Date: Fri, 7 Aug 2020 13:27:54 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2
 nodes
Message-ID: <20200807112754.GC3387836@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
 <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
 <CAMuHMdXie+GfKBO22mFrn4oG_y7YUxU9ekQdWnp1hn-6z2mLuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXie+GfKBO22mFrn4oG_y7YUxU9ekQdWnp1hn-6z2mLuQ@mail.gmail.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-pci <linux-pci@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 dmaengine <dmaengine@vger.kernel.org>
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

Hi Geert, Lad,

On 2020-08-06 13:47:58 +0200, Geert Uytterhoeven wrote:
> Hi Prabhakar,
> 
> On Thu, Aug 6, 2020 at 1:17 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Aug 5, 2020 at 12:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > However, before I queue this in renesas-devel for v5.10, I'd like to
> > > have some clarification about the issue below.
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > >
> > > > +               vin4: video@e6ef4000 {
> > > > +                       compatible = "renesas,vin-r8a774e1";
> > > > +                       reg = <0 0xe6ef4000 0 0x1000>;
> > > > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                       clocks = <&cpg CPG_MOD 807>;
> > > > +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> > > > +                       resets = <&cpg 807>;
> > > > +                       renesas,id = <4>;
> > > > +                       status = "disabled";
> > > > +
> > > > +                       ports {
> > > > +                               #address-cells = <1>;
> > > > +                               #size-cells = <0>;
> > > > +
> > > > +                               port@1 {
> > > > +                                       #address-cells = <1>;
> > > > +                                       #size-cells = <0>;
> > >
> > > "make dtbs W=1" says:
> > >
> > >     arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
> > > (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
> > > has single child node 'endpoint@0', #address-cells/#size-cells are not
> > > necessary
> > >
> > > (same for vin5-7 below)
> > >
> > Referring to commit 5e53dbf4edb4d ("arm64: dts: renesas: r8a77990: Fix
> > VIN endpoint numbering") we definitely need endpoint numbering.
> > Probably the driver needs to be fixed to handle such cases.
> 
> > > > +
> > > > +                                       reg = <1>;
> > > > +
> > > > +                                       vin4csi20: endpoint@0 {
> > > > +                                               reg = <0>;
> > > > +                                               remote-endpoint = <&csi20vin4>;
> 
> On R-Car E3, the single endpoint is at address 2, so "make dtbs W=1"doesn't
> complain. Here it is at address 0.
> 
> Niklas?

First the R-Car VIN driver makes decisions based on which endpoint is 
described, each endpoint 0-3 represents a different CSI-2 block on the 
other end (0: CSI20, 1: CSI21, 2: CSI40 and 3: CSI41).

Then how to handle the warning I'm not sure. I can only really see 2 
options.

1. Ignore the warning.
2. Remove #address-cells, #size-cells and reg properties from port@ if 
   the only endpoint described is endpoint@0.

I would prefers option 2. that is what we do in other cases (for example 
on Gen2 boards that only have a single parallel sensor in some early DTS 
files we don't have the ports node and just describe a single port with 
the same reasoning.

We are not at risk at someone describing a second CSI-2 bock as an 
overlay so I see no real harm in option 2. What are your thoughts Geert?  
You know more about DT then me.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
