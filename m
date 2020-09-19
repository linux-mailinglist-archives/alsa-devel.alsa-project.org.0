Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BEA270D4C
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Sep 2020 12:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3304169B;
	Sat, 19 Sep 2020 12:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3304169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600512987;
	bh=P834DscDqVTk5jNolr3fg+WsnJ9tYmXIlN1fiSb4nLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vWDRPN8os1DjGRsmY7D+B7VzmYxDAZgrPt70XGmn+bamp5ca9Bcli2g/hw+djhb/2
	 SnSnFRrnWViXeoZ6zkaDWXtYenGqeOP3Z6xqz22kH2cysvCqWp9IjFF3VpaL3Yn6iQ
	 6/iG46ThwdDASoygAF6zOmorXp6ikwwkmnFUbMmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C9A5F8013A;
	Sat, 19 Sep 2020 12:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1C0FF80212; Sat, 19 Sep 2020 12:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76EBDF8013A
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 12:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76EBDF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q3aT5V6E"
Received: by mail-yb1-xb43.google.com with SMTP id h206so6320451ybc.11
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pzSAC77KGj3b71DFM8b51B+fZYfC1Bsciu342riUU+I=;
 b=q3aT5V6EYpJSrJl/fZxvehZ9OLp1zFUW4vS7anYCIVy32j7NWiA6qEyJPp+k82RqFP
 0RcCLeEvdynv7ZL1KsxKuAPjJ3CmL385W0hTKZR3Svfxfq64HyLGOZv7XUxG1gVPiKY4
 OcxFH/huz5+ZJwenNgGrJiujfVF077N5O7y/pTAEqSD5fVfPZDg0r3vfztI1xzKMhn27
 /fFkHqgw4wyFop0l/J0qOegfFQsObv+T9uhO1opjkrdYtDjIzInwNF97zfNG12gyugE6
 rPZISBt5qEfy55VNNc4dP4clg7dPo0hdPZolHWAEWcaS94b//yBekPMElBwzBVvlUdTm
 GmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pzSAC77KGj3b71DFM8b51B+fZYfC1Bsciu342riUU+I=;
 b=TA6+NUs4v375kfOzSL9sl30IU2/73tEWE9z6mNd1g3rLbvQsONF6veUsRRffcocZuA
 ORV1DIk3W++P347TzuZkcrL7BRDeqNeiU2T9zg9yMvnla2CBkCxS0a0QEfkt8R6FnRcd
 c+1mGDcB0PakhJ8oqrVdHE13XTGZH08VI7AiuQMiKdETFnPGAtoKxbwuIAUOpC/g1Hzm
 481wWmPB+wRF3cpXLWSw1xfuBsz86vc/jabCXsFJVFya1hG296Qku35o7kfI21i7aFia
 9zbp7y2gJq0+p0IU/7JpoHPXq8Cln4/HM3iDNkiXcEyTfNt/Sjsvhm4k5QLxPN/p8sVN
 qUxA==
X-Gm-Message-State: AOAM532lJ1hht0TjMts7U2XGL1T0k+ZvWeoN4Jz80UBsJ/57k+a7EL99
 bDkUfDdUwEVCEhk4YrX56oFQboAwK9pcJgoCShs=
X-Google-Smtp-Source: ABdhPJw5efc5NhFkTetrZgcf7Z8DzfCZh/tmjP6pUg93tWkSjNZlODD1MWwUBtozQzW7FY/5hEpct+waFEd5OOBoI4k=
X-Received: by 2002:a25:e811:: with SMTP id k17mr45613290ybd.401.1600512871413; 
 Sat, 19 Sep 2020 03:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 19 Sep 2020 11:54:05 +0100
Message-ID: <CA+V-a8vuR-7vqxNnrqQ5Ysf3Xjvhp3xRZ33i8+6nEGFLJciT3A@mail.gmail.com>
Subject: Re: [PATCH 11/20] dt-bindings: usb: renesas,
 usbhs: Add r8a774e1 support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

Hi Greg,

On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document RZ/G2H (R8A774E1) SoC bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> index af4826fb6824..737c1f47b7de 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> @@ -39,6 +39,7 @@ properties:
>                - renesas,usbhs-r8a774a1 # RZ/G2M
>                - renesas,usbhs-r8a774b1 # RZ/G2N
>                - renesas,usbhs-r8a774c0 # RZ/G2E
> +              - renesas,usbhs-r8a774e1 # RZ/G2H
>                - renesas,usbhs-r8a7795  # R-Car H3
>                - renesas,usbhs-r8a7796  # R-Car M3-W
>                - renesas,usbhs-r8a77961 # R-Car M3-W+
> --
> 2.17.1
>
