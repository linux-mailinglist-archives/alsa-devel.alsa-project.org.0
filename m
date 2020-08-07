Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241B23ECB0
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F00DE15F9;
	Fri,  7 Aug 2020 13:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F00DE15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596800316;
	bh=2vifmn4McR9qoEJw//OiO3BiekmcKVk7Q558//RI+BM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JGIs4mmO/CHVXx7xeynCQRDq6cM9vRXJV0EefOVs/3gDkXuPBDFmgjfMNOFI7wfYU
	 vdxu+2UhTXIUgQI/a8r5wH1BwQ3cSiHqbyGEySZJTxiG2YMya8bct8MBUvUEykQHBC
	 i29OVmVaeF/zvHsSD4q7xNOtk3E8STOsyRQHeHZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA4D0F8020B;
	Fri,  7 Aug 2020 13:37:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D801CF8023E; Fri,  7 Aug 2020 13:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_13,PRX_BODY_135,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AC5FF800B7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC5FF800B7
Received: by mail-oo1-f67.google.com with SMTP id p137so356395oop.4
 for <alsa-devel@alsa-project.org>; Fri, 07 Aug 2020 04:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XXMM2VmPbdzScEgaWzC2c7QfQOtrLAuTY8gvz9Vc4VA=;
 b=L93tKPaffMJ55Bvq1hRWOQuLykNCof3qhpAp9skqVri/7hqj1e5Duxp15sF5PGque6
 Lb6gZE1WUEg+5mmojEbsKKMRHkblk5reI9iJwP0aTdhWHezGwzsLaJfGdgYzhCuUbu4u
 NpQy8mZr/t/JvLgL83BSvFDT7Ocp1RCZcnDUVIveMoDEk7ASCZ81iYictns3KcpUB4F8
 GuiIGCA9LjUaUh7Y83FTLqK5ixFNQRXVMZxzNJ3ZDiO/qoEfxa/CDLJaqina20z1mCGB
 JIvFmh9hrxLv3EN0U2FeO00k3nXz6kr2EF33ZAaNfV08H6i25f68XBiFL0HiSO52zwJO
 5/0g==
X-Gm-Message-State: AOAM531HfZVlkObyEZvVmBncptDetx4R5zREY8jXAR2FoCGvKh1uzPJF
 myhYQJyBkTAHO6qznWuNp/JYgpFJRbdnaAflGfg=
X-Google-Smtp-Source: ABdhPJzvkXusENrHFbx7Z4UeU5tcAYrWmu2wMgV9PP1LU7MWabSySITzZd9SeQneUYYb9H/JEkRsCIws54cijEZ+u5w=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr12077660ooj.1.1596800217309;
 Fri, 07 Aug 2020 04:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
 <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
 <CAMuHMdXie+GfKBO22mFrn4oG_y7YUxU9ekQdWnp1hn-6z2mLuQ@mail.gmail.com>
 <20200807112754.GC3387836@oden.dyn.berto.se>
In-Reply-To: <20200807112754.GC3387836@oden.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2020 13:36:46 +0200
Message-ID: <CAMuHMdW1Ofjouj4P+bdg2VWmYohD73=si8R6ivZ4QiZps6=HAQ@mail.gmail.com>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2
 nodes
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Niklas,

On Fri, Aug 7, 2020 at 1:27 PM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2020-08-06 13:47:58 +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 6, 2020 at 1:17 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Wed, Aug 5, 2020 at 12:19 PM Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
> > > > On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@=
bp.renesas.com>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > However, before I queue this in renesas-devel for v5.10, I'd like t=
o
> > > > have some clarification about the issue below.
> > > >
> > > > > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > > > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > > >
> > > > > +               vin4: video@e6ef4000 {
> > > > > +                       compatible =3D "renesas,vin-r8a774e1";
> > > > > +                       reg =3D <0 0xe6ef4000 0 0x1000>;
> > > > > +                       interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVE=
L_HIGH>;
> > > > > +                       clocks =3D <&cpg CPG_MOD 807>;
> > > > > +                       power-domains =3D <&sysc R8A774E1_PD_ALWA=
YS_ON>;
> > > > > +                       resets =3D <&cpg 807>;
> > > > > +                       renesas,id =3D <4>;
> > > > > +                       status =3D "disabled";
> > > > > +
> > > > > +                       ports {
> > > > > +                               #address-cells =3D <1>;
> > > > > +                               #size-cells =3D <0>;
> > > > > +
> > > > > +                               port@1 {
> > > > > +                                       #address-cells =3D <1>;
> > > > > +                                       #size-cells =3D <0>;
> > > >
> > > > "make dtbs W=3D1" says:
> > > >
> > > >     arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warni=
ng
> > > > (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
> > > > has single child node 'endpoint@0', #address-cells/#size-cells are =
not
> > > > necessary
> > > >
> > > > (same for vin5-7 below)
> > > >
> > > Referring to commit 5e53dbf4edb4d ("arm64: dts: renesas: r8a77990: Fi=
x
> > > VIN endpoint numbering") we definitely need endpoint numbering.
> > > Probably the driver needs to be fixed to handle such cases.
> >
> > > > > +
> > > > > +                                       reg =3D <1>;
> > > > > +
> > > > > +                                       vin4csi20: endpoint@0 {
> > > > > +                                               reg =3D <0>;
> > > > > +                                               remote-endpoint =
=3D <&csi20vin4>;
> >
> > On R-Car E3, the single endpoint is at address 2, so "make dtbs W=3D1"d=
oesn't
> > complain. Here it is at address 0.
> >
> > Niklas?
>
> First the R-Car VIN driver makes decisions based on which endpoint is
> described, each endpoint 0-3 represents a different CSI-2 block on the
> other end (0: CSI20, 1: CSI21, 2: CSI40 and 3: CSI41).

That's my understanding, too.

> Then how to handle the warning I'm not sure. I can only really see 2
> options.
>
> 1. Ignore the warning.
> 2. Remove #address-cells, #size-cells and reg properties from port@ if
>    the only endpoint described is endpoint@0.
>
> I would prefers option 2. that is what we do in other cases (for example
> on Gen2 boards that only have a single parallel sensor in some early DTS
> files we don't have the ports node and just describe a single port with
> the same reasoning.
>
> We are not at risk at someone describing a second CSI-2 bock as an
> overlay so I see no real harm in option 2.

Yeah, no overlay possible for on-SoC wiring ;-)

> What are your thoughts Geert?
> You know more about DT then me.

You have too much faith in me ;-)

AFAIK we don't get this warning for e.g. SPI buses, which can have a
single device at address 0, and #{address,size}-cells is mandatory
there. So endpoints (or SPI?) are treated special?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
