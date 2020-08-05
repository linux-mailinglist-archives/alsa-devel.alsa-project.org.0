Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D86723CA37
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 13:21:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE92B1664;
	Wed,  5 Aug 2020 13:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE92B1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596626465;
	bh=J43/zMWUFRlLb7WthBK0QHN+L/A4G7AC0bCDyWVuQ0w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npXnNAqYH60dwLE3bqGDkkSDmEG3hrsOzC0LBHAqKalMv/NXCgjbXrgPIrMQ3bmht
	 2PDWMzc5kFRSU6JS0bYb84eyCPyMoLh8bHaQQ6dRLt6fqO7HEr/jvNrLSTStgaMX1t
	 LSDBB5ApoN7Mc5PZKziAQecAYCq+H3bTLbfhQ4Hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1328BF80112;
	Wed,  5 Aug 2020 13:19:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAB4DF80218; Wed,  5 Aug 2020 13:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_13,PRX_BODY_135,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59176F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 13:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59176F80112
Received: by mail-ot1-f65.google.com with SMTP id h22so3787897otq.11
 for <alsa-devel@alsa-project.org>; Wed, 05 Aug 2020 04:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXKpgsbLcw7z2C6ljXHBYtvVN+NDPtHizk0roOICInI=;
 b=BCdnMhjgWSq3UvUEYdjvua9uIi7FoWmFbjcyDnkKQPVT2njnGKQO6YuJqUY2SsWlHW
 ab2XpvgXixHOOgKgF3yhGe+mZ3NpkBXfq8HjEpbsPYWp8+VjcxZALOsMldlSAEOUiue+
 kTYFjwQD9X21TT8iWE/LyjIf2Rg8V8Bt1C26024t2bxWiHNUzY54/O8wHhSRss20jHBu
 D51g2GBA7P8qZQf2SOZjY88Eg20J1o+d1M+oiPM/o54Fq+bx/znJeC/ZPaCOw7DChP5J
 LuBMTbXgjvA0PRNK69alM7nfhnTLg8E9SPFhkAkFEKOdkleet8oOkaUwCO13j+Y1Bh3a
 MhXQ==
X-Gm-Message-State: AOAM533vYalBDiAXxP89+GtTtAQb2iwGIhmrkhHAqSZrxfCbftlEMcTJ
 rrIR7tdykpg0nQMIhvbCWEj9Rw62q5JzoVwoOvY=
X-Google-Smtp-Source: ABdhPJwV3n8tOAcfpMHynj9j+mQfpTpf9DYt0YtMCyg/CBd6L07ZVwpSWSi6SSwkA6/AmBSX9QS/9q9S3w/0cDUPDdY=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr2057730ote.107.1596626350552; 
 Wed, 05 Aug 2020 04:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-21-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2020 13:18:59 +0200
Message-ID: <CAMuHMdVriWnPK8-=w=0mq8yj9+1jbsg9yH8aV=ygyHsQ0f-CQQ@mail.gmail.com>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2
 nodes
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Niklas <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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

Hi Prabhakar,

On Thu, Jul 16, 2020 at 7:20 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add VIN and CSI-2 nodes to RZ/G2H (R8A774E1) SoC dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, before I queue this in renesas-devel for v5.10, I'd like to
have some clarification about the issue below.

> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi

> +               vin4: video@e6ef4000 {
> +                       compatible = "renesas,vin-r8a774e1";
> +                       reg = <0 0xe6ef4000 0 0x1000>;
> +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 807>;
> +                       power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> +                       resets = <&cpg 807>;
> +                       renesas,id = <4>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;

"make dtbs W=1" says:

    arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1562.12-1572.7: Warning
(graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node
has single child node 'endpoint@0', #address-cells/#size-cells are not
necessary

(same for vin5-7 below)

> +
> +                                       reg = <1>;
> +
> +                                       vin4csi20: endpoint@0 {
> +                                               reg = <0>;
> +                                               remote-endpoint = <&csi20vin4>;
> +                                       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
