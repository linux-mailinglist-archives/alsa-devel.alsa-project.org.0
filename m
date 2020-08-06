Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1723DBFC
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 18:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1371662;
	Thu,  6 Aug 2020 18:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1371662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596732113;
	bh=YasQqcwpwTnBz4exLKS6Rhmr1BzZ3tXPi5SiV6ojUJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EvTk0r5Iaodap6JOjmvO1U7iki6YH2NgXmj5F5LFmX+jCKUI/4iU1msazKxcGndE4
	 McMJPqmfVd86WUDpOTrgo2vjNH0XCI3OTzaf7DtZtyIwq2ItdMkVzKnDvi84RtwGPa
	 L/p+O4yFSo5muSOAP2KVkly0odIO0YJq20z0WhCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45875F802EB;
	Thu,  6 Aug 2020 18:36:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6334DF80159; Thu,  6 Aug 2020 13:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,PRX_BODY_135,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC280F80124
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 13:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC280F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W1T7PMyT"
Received: by mail-yb1-xb42.google.com with SMTP id a34so20482313ybj.9
 for <alsa-devel@alsa-project.org>; Thu, 06 Aug 2020 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IkZFSPvcY5I31SF4ovGBrfHT1rxg0M171V/0SMIVx2k=;
 b=W1T7PMyTGM7VIbxN0FUlHyTKpaK0nw8VbeY8YI4ksk9CWWKzLOGNJsuFVpAeVzqEDQ
 l5jy7ReADQ2WPptC19aMYCiHXKqdoGibvICjZi24Fx59vEVwEvfL4yZTHGzKYmCRL03U
 RVTRjFq4TV8+2/gTNJkJ/Htgj1Fhq5P1qcxe/eQL/FoLz9bwZG6KJsHhvjn7+xr/6u/A
 ZwyurJY9E7i7o/VwJb0vYHsxFh1fqfcI6q3MWsQ7MjEBH949S7NP+IoE180+3rUUw9UI
 +/+wKAisrtczBHnl7YHt8MqtQz67j1T9EoVK3At6moXH+T7btd80HOMRDedl6B5O04Fc
 C4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IkZFSPvcY5I31SF4ovGBrfHT1rxg0M171V/0SMIVx2k=;
 b=sEN0EtqRZtgYPWg+kVAcWlxBLHuSeFIX4hms2QP2b6e56BNSqEna4jYc6sOhNrhq8E
 EX1xJ4hM8zJkBPZlL8Oyob8+wZ9Zss4Ta+iGYLke0gXD1LECCEw+Wso6T6JYeZ2iZthH
 SnfOktA2i0fE4lJVWuMw3oInpC43SdbSb1v4GtCl7cpm1byyT1WsrZ3kbtwdEjDMxBl9
 bKRFP2tuwo0A0SMzUhnbCIbyUbcbctX7m+yOUOa0S+bo6a1CPM/W/mixFZ6UM2/fLsOZ
 rD4wrS5xhs7hGfoSWAxNimbo/csH4+c5tNzrvPns4BHBaEfymK6dSjD61/S4aVPfCvpc
 4WTQ==
X-Gm-Message-State: AOAM533bvLAhcf8x1p/+npp+UxWaGMiReKceFtAomakO1cgnZSYMXRn8
 XLKSDpUnRk+hNX5+YBvZHZExwNyRQi4FjSRcQhY=
X-Google-Smtp-Source: ABdhPJxC1QZwDQjfBbSfcHd9+nWr/d1KIV+hOzv93X+1QoDGFFoAz1yykeKI4ZMC4cs50cyA5iK5Orky9ZbUh/KQlXM=
X-Received: by 2002:a25:c743:: with SMTP id w64mr11132228ybe.127.1596712641618; 
 Thu, 06 Aug 2020 04:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Aug 2020 12:16:55 +0100
Message-ID: <CA+V-a8vXjhV-EeQb=bBhoRmuVA=0GSuFiV33N9nkhi39VNN6oA@mail.gmail.com>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2
 nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 06 Aug 2020 18:36:48 +0200
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Niklas <niklas.soderlund@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 USB list <linux-usb@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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

Hi Geert,

Thank you for the review.

On Wed, Aug 5, 2020 at 12:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> However, before I queue this in renesas-devel for v5.10, I'd like to
> have some clarification about the issue below.
>
> > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
>
> > +               vin4: video@e6ef4000 {
> > +                       compatible = "renesas,vin-r8a774e1";
> > +                       reg = <0 0xe6ef4000 0 0x1000>;
> > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 807>;
> > +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 807>;
> > +                       renesas,id = <4>;
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@1 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
>
> "make dtbs W=1" says:
>
>     arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
> (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
> has single child node 'endpoint@0', #address-cells/#size-cells are not
> necessary
>
> (same for vin5-7 below)
>
Referring to commit 5e53dbf4edb4d ("arm64: dts: renesas: r8a77990: Fix
VIN endpoint numbering") we definitely need endpoint numbering.
Probably the driver needs to be fixed to handle such cases.

Cheers,
Prabhakar

> > +
> > +                                       reg = <1>;
> > +
> > +                                       vin4csi20: endpoint@0 {
> > +                                               reg = <0>;
> > +                                               remote-endpoint = <&csi20vin4>;
> > +                                       };
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
