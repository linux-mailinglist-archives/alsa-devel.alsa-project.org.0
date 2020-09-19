Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EEB270D37
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Sep 2020 12:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D2051693;
	Sat, 19 Sep 2020 12:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D2051693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600512502;
	bh=xP3XMGOjANbVc6relE9Ar8XbG7l2OOMl4cMvmVlAjqQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thvYxFhB85TyZG24/u/Eb+zOMRBwir74KovLNnVDlkkzoQfZsKVdG/fiLoN26rPvb
	 cqTsC84ndv+kQxZpGLIKXAq3WLivMxXhl3fRb/Art/SfVeiqQa2xc66+/qMb0lSw6Y
	 9o0PV/MVfYVrN3CYOvmEYuM5CM2XS/eCQRir4fxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A927EF800EA;
	Sat, 19 Sep 2020 12:46:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D03BF80212; Sat, 19 Sep 2020 12:46:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FFFAF800EA
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 12:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FFFAF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RbMN5zRW"
Received: by mail-yb1-xb41.google.com with SMTP id e11so6361503ybk.1
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0S4Ht4NHIpyZ6tU7+DqxhQ4MU+jt5ffLJy99tEJzOgU=;
 b=RbMN5zRWTm+yR39er0gdwyqlNcRtPlWXgaCF8b88WKxXhoRLE6Mn2AJPtrz4kxyyiY
 P2bgIO58FWIfV2Ob4gx9iFfTuPA4mnLP7u054ZYJHmosYKD4YIXgggwrTTYX1tv4Za3W
 YTFtkHvEB9PSsmaog8XNcYGLU9zaztr4gm1EdalTFWIariXDmB2qMfzDI1CvL1lszS73
 H68oGFMn98K9SaHCrSQhZWPgXKaBQ1E07ns448nMyUAyVZ5Ov59JWfhx4VGh4YMjVsbw
 jvDwFBQmliitx24i5JRU80wShJZMIVfHv7Muhuu+XzCEnTAzqDugUZKqjeq5hv9Jsz3m
 gIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0S4Ht4NHIpyZ6tU7+DqxhQ4MU+jt5ffLJy99tEJzOgU=;
 b=MXCwHvXwyyNXMwXB/MeDuc9kIkSx2rfYaJsYolTV7YD658VqaIl9S5oyIv9pW8V2tY
 +3aysQOzuEkhG6Nr6JO5Bt8vdLJEbVZh9BrXwCJaW2bkCnY54BNoUj5azkcJw4r1zOtS
 GB/46R7HopQ42Byk+0EPGtaPKAKM7eYTKzJj+DVw652E09zVQN55C/ojfc0itQt+agxO
 c7FoVizm/d3zKZHIQ+w4zSGm+YYHVXDPRfnvsTjTLKXX99EYdpGiOY/mUaKoWfFlHOX5
 v8WdHXQWJMhLObTzwUvYNT1VWYqkaLynK6QVY4mS/z+DtLGujZcVUcVNy9/6gFuDb3yJ
 t+yw==
X-Gm-Message-State: AOAM5307ShXtU2jpUgavPOYADRC1kxvajr2dL19vX2gpPIQIm3qnz2bN
 g0fdlheprPopEDq3cClAAcwi+fByohhsoaWmtqQ=
X-Google-Smtp-Source: ABdhPJxBzwAMJjSTYjRHy/WAC+nDOGo9k/2nrLlIMxBf5lqxiHWLl+BIDV5S+hhsFapjrr4zITsBsmLzEi7nEIvg5Zw=
X-Received: by 2002:a25:23cb:: with SMTP id
 j194mr47717339ybj.445.1600512390461; 
 Sat, 19 Sep 2020 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 19 Sep 2020 11:46:04 +0100
Message-ID: <CA+V-a8vtGZ8Tfptj6evmhZOWC+6w9M8uVQ_ob05j0UJwZnSWyQ@mail.gmail.com>
Subject: Re: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree support
 for r8a774e1
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media <linux-media@vger.kernel.org>,
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

Hi Lorenzo,

On Thu, Jul 16, 2020 at 6:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Add PCIe support for the RZ/G2H (a.k.a. R8A774E1).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
--Prabhakar Lad

> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> index 1041c44a614f..64bb87e7dd06 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> @@ -6,6 +6,7 @@ compatible: "renesas,pcie-r8a7743" for the R8A7743 SoC;
>             "renesas,pcie-r8a774a1" for the R8A774A1 SoC;
>             "renesas,pcie-r8a774b1" for the R8A774B1 SoC;
>             "renesas,pcie-r8a774c0" for the R8A774C0 SoC;
> +           "renesas,pcie-r8a774e1" for the R8A774E1 SoC;
>             "renesas,pcie-r8a7779" for the R8A7779 SoC;
>             "renesas,pcie-r8a7790" for the R8A7790 SoC;
>             "renesas,pcie-r8a7791" for the R8A7791 SoC;
> --
> 2.17.1
>
