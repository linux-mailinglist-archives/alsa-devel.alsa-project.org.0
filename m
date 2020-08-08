Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6713523F6E1
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Aug 2020 09:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5E661612;
	Sat,  8 Aug 2020 09:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5E661612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596873006;
	bh=wKfWX4N0N9G0S6TSOOc31aRHCht/lN11L2jYL0oBC+E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rf4Y8ATaB7/PRGHL65Eh9JYiWhi/yoxTh7533gAEsW0UQq605Ha+y4FN7HgdKOXiK
	 KFwzY+k3YbkvZHqalpe9HUDoqfXgs97ca5/WEFT/OUAEY9N96wF+bkGVvKi1fCg0DV
	 3OM/VvcwpSHv9lTzc2gVJPDNtKL85KvDB1DU+D9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 069C3F8015C;
	Sat,  8 Aug 2020 09:48:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F8B7F8015A; Sat,  8 Aug 2020 09:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_13,PRX_BODY_135,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C80E7F800B7
 for <alsa-devel@alsa-project.org>; Sat,  8 Aug 2020 09:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C80E7F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com
 header.i=@ragnatech-se.20150623.gappssmtp.com header.b="1VzsDiFw"
Received: by mail-lj1-x241.google.com with SMTP id v4so4528338ljd.0
 for <alsa-devel@alsa-project.org>; Sat, 08 Aug 2020 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TLcg4skVrYQV7y3Fp8lGIPLLhHgq3utx3e26pLPa0Zw=;
 b=1VzsDiFwx3l4LbKM/adAoH2A5LXc8uTDm51hB67MB1DJvEWnbiUdZNnlk/zqW1rXSg
 e84S+Nl/AciZotRytrok/YlrcU/uiDU1/77EXZK77pT6Q1oC5xrOJvfLcVhpUqE98khz
 6kTVv/T8M1DZVlE+3yMPlWUbNv3pfTNYDdvwHeR5NreLP+hgq/2HDHCW9MFGvqOReLCc
 2eP5+ic5f/8mKBztlQVtF3jMIMGyQywRBgosNIzttuxZzA6TQNn9uiVR0bbgnDa6HZle
 DPPPCBx6a+HQgGGayBbSWTf2mDUUjjNMxEx9zwDmzxCXS51qFl126b0ccUDbq3JU/9Vo
 rIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TLcg4skVrYQV7y3Fp8lGIPLLhHgq3utx3e26pLPa0Zw=;
 b=kWpychQ+MLPQ5mCCsp6hwk5eyMFDnR5HLj11g3BZ6AkwQI77ThhyRMTYiQB8gBkxLU
 uG8Ezu9YOcbeb2EXpAbhSECgMJIGyOzAoaEFvg4ukCOW+IlZ1IeNb/gfKuWWpctyc3ZK
 UGpddgiKk+PCtOFosXorqsIr75Hm1inrwwxu8vGFqwtRYQt8bbLHAzEDIyVsY7N/6yhB
 VsjqpBH+tB+B2M3ytEwAYFlFx5O1Gz7tT06A4HYSyc2pPbyk35zYbHfDA7rJZQVv+KVt
 pwKtml1Evx0R1IilWZjlF5bmU6iyuIkwS4tg9efPL8+swIq0wOwOVyzuZ+CmAOxw3P0c
 FMQA==
X-Gm-Message-State: AOAM532oDHxVK6nDHLPYv9dqf5+ZBDPfaXWpr+rHNARjDM2hcsKCLWwu
 1aK9hwajS7/AbCqBX/fLvZkooA==
X-Google-Smtp-Source: ABdhPJyzPqtbc6UrehHkmR4Cf0yev8vWKE8xcenwd+6WhMYR2wiWLxsRKUzx4J4XCGaANv0EYiKsqQ==
X-Received: by 2002:a2e:b8cf:: with SMTP id s15mr8289054ljp.166.1596872895201; 
 Sat, 08 Aug 2020 00:48:15 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id o68sm5341891lff.57.2020.08.08.00.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 00:48:14 -0700 (PDT)
Date: Sat, 8 Aug 2020 09:48:12 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2
 nodes
Message-ID: <20200808074812.GD3387836@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
 <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
 <CAMuHMdXie+GfKBO22mFrn4oG_y7YUxU9ekQdWnp1hn-6z2mLuQ@mail.gmail.com>
 <20200807112754.GC3387836@oden.dyn.berto.se>
 <CAMuHMdW1Ofjouj4P+bdg2VWmYohD73=si8R6ivZ4QiZps6=HAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW1Ofjouj4P+bdg2VWmYohD73=si8R6ivZ4QiZps6=HAQ@mail.gmail.com>
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

Hi Geert and Lad,

On 2020-08-07 13:36:46 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, Aug 7, 2020 at 1:27 PM Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2020-08-06 13:47:58 +0200, Geert Uytterhoeven wrote:
> > > On Thu, Aug 6, 2020 at 1:17 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Wed, Aug 5, 2020 at 12:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > > Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > > >
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >
> > > > > However, before I queue this in renesas-devel for v5.10, I'd like to
> > > > > have some clarification about the issue below.
> > > > >
> > > > > > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > > >
> > > > > > +               vin4: video@e6ef4000 {
> > > > > > +                       compatible = "renesas,vin-r8a774e1";
> > > > > > +                       reg = <0 0xe6ef4000 0 0x1000>;
> > > > > > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > +                       clocks = <&cpg CPG_MOD 807>;
> > > > > > +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> > > > > > +                       resets = <&cpg 807>;
> > > > > > +                       renesas,id = <4>;
> > > > > > +                       status = "disabled";
> > > > > > +
> > > > > > +                       ports {
> > > > > > +                               #address-cells = <1>;
> > > > > > +                               #size-cells = <0>;
> > > > > > +
> > > > > > +                               port@1 {
> > > > > > +                                       #address-cells = <1>;
> > > > > > +                                       #size-cells = <0>;
> > > > >
> > > > > "make dtbs W=1" says:
> > > > >
> > > > >     arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
> > > > > (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
> > > > > has single child node 'endpoint@0', #address-cells/#size-cells are not
> > > > > necessary
> > > > >
> > > > > (same for vin5-7 below)
> > > > >
> > > > Referring to commit 5e53dbf4edb4d ("arm64: dts: renesas: r8a77990: Fix
> > > > VIN endpoint numbering") we definitely need endpoint numbering.
> > > > Probably the driver needs to be fixed to handle such cases.
> > >
> > > > > > +
> > > > > > +                                       reg = <1>;
> > > > > > +
> > > > > > +                                       vin4csi20: endpoint@0 {
> > > > > > +                                               reg = <0>;
> > > > > > +                                               remote-endpoint = <&csi20vin4>;
> > >
> > > On R-Car E3, the single endpoint is at address 2, so "make dtbs W=1"doesn't
> > > complain. Here it is at address 0.
> > >
> > > Niklas?
> >
> > First the R-Car VIN driver makes decisions based on which endpoint is
> > described, each endpoint 0-3 represents a different CSI-2 block on the
> > other end (0: CSI20, 1: CSI21, 2: CSI40 and 3: CSI41).
> 
> That's my understanding, too.
> 
> > Then how to handle the warning I'm not sure. I can only really see 2
> > options.
> >
> > 1. Ignore the warning.
> > 2. Remove #address-cells, #size-cells and reg properties from port@ if
> >    the only endpoint described is endpoint@0.
> >
> > I would prefers option 2. that is what we do in other cases (for example
> > on Gen2 boards that only have a single parallel sensor in some early DTS
> > files we don't have the ports node and just describe a single port with
> > the same reasoning.
> >
> > We are not at risk at someone describing a second CSI-2 bock as an
> > overlay so I see no real harm in option 2.
> 
> Yeah, no overlay possible for on-SoC wiring ;-)
> 
> > What are your thoughts Geert?
> > You know more about DT then me.
> 
> You have too much faith in me ;-)
> 
> AFAIK we don't get this warning for e.g. SPI buses, which can have a
> single device at address 0, and #{address,size}-cells is mandatory
> there. So endpoints (or SPI?) are treated special?

That is a good question, I don't know if either of those are treated 
special. Lad could you look into this?

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
