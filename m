Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 317FA23C873
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 11:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2AA61667;
	Wed,  5 Aug 2020 11:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2AA61667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596618054;
	bh=FcJXYfATTe6mXsgb7i9nLb8BZsNn2ZPoTs9/chlQtZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=idsegdqL/lWVUzyH6+f6jsyAQuqGJlSxo5z/Jj2TT7gBFPrVbAGSNMEa5bBjN91/Z
	 PAzThhvMdjnA01pFnvSdAN2WMchNSoh4Z1o07zWIyOEAwt6UbozGKysh2KrVMkPZik
	 FPNuaxlb4g6zDoqo964hnfUpv8f670hprwICM9I0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE02F80234;
	Wed,  5 Aug 2020 10:59:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C00CEF80218; Wed,  5 Aug 2020 10:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3446F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 10:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3446F80112
Received: by mail-oi1-f194.google.com with SMTP id o21so18219305oie.12
 for <alsa-devel@alsa-project.org>; Wed, 05 Aug 2020 01:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PEPkOHX4GNS8S5Rg4NoX/0Kkpu8DKvfoDJJeWRfc+c=;
 b=RINqIWqbGDV13LbbYI77mizzQ6fbI2ksJiMev6BUYIpTnT8f9KKIsdt9rVUafCcrge
 7pSRBmG/FZYX5xBLoQE1pDcgFdVmtcp0tb6aaYnL2vKjL3kdxli9U35TQtuWPcHzondM
 y7U0111UW2Bv5tDx+JdT9IGrUjYJ/g6iDLHn99b0G8nxGXK/wOOYUg6im6btXH0X9iD0
 EPHHoYBm9xJxHJPLGQw6/kDL4JYVvhfOX4RmQy3Uoh815lHHAXN1v+MnVM2RkJcRA5fc
 958ncb8TEgck+r+6MiJLt7AsqgooPCfAYhPSmqcNeUQFLS1mjs1hu9O4Yw1HqV7cLK2k
 tv4A==
X-Gm-Message-State: AOAM533wry43gLL8kP3dWSJ1xn9hyj4FQ/b7d/aEbXtFDUx7JR8z0H9l
 z7vGlaCYicoTjoexBPiz/Mv/Yi6NK3M6DPuMv/A=
X-Google-Smtp-Source: ABdhPJxOPpR3dk7VDSXYx6KKvjnoJv5/4tMZbEd2TqXt4CKHnoMUzx0WD2+9YVb/X64OZIidpkxnwCi/O01k1qJCr/c=
X-Received: by 2002:aca:b742:: with SMTP id h63mr1809112oif.148.1596617943136; 
 Wed, 05 Aug 2020 01:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2020 10:58:51 +0200
Message-ID: <CAMuHMdVzVGmc=2d5B4AZ4-G--gvkF4H3D-PVxhj6o5mq875fig@mail.gmail.com>
Subject: Re: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1
 support
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

On Thu, Jul 16, 2020 at 7:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document r8a774e1 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen3-xhci", therefore no driver
> change is needed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +

In the mean time, this file has been converted to dt-schema in Rob's
tree: Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml

> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -13,6 +13,7 @@ Required properties:
>      - "renesas,xhci-r8a774a1" for r8a774a1 SoC
>      - "renesas,xhci-r8a774b1" for r8a774b1 SoC
>      - "renesas,xhci-r8a774c0" for r8a774c0 SoC
> +    - "renesas,xhci-r8a774e1" for r8a774e1 SoC
>      - "renesas,xhci-r8a7790" for r8a7790 SoC
>      - "renesas,xhci-r8a7791" for r8a7791 SoC
>      - "renesas,xhci-r8a7793" for r8a7793 SoC

For the logical change:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
