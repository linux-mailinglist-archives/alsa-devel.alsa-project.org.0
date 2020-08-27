Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C4255996
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:46:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D5C61870;
	Fri, 28 Aug 2020 13:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D5C61870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598615190;
	bh=NhK081z8w3EP4Z2vdiTApO42Mhg5DD53aUIoI6BkYQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shySZ4WGIjuWzXFUZlXpimw+8N3QmGfEx0ReM6iVgu9MUN2EjufkutL2n1l0VAgMy
	 pWHoraetDPYOfH7UmzYp5wrk3Mmno2c3rpboxEPBhFppeHXyFteJ/ivmO9bVuXuXUk
	 KMyGQ5oaFEM6G/GwIZxrsT8NlLE3TxERM7nkoYpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47100F80264;
	Fri, 28 Aug 2020 13:44:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA80F8016F; Thu, 27 Aug 2020 19:15:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA077F800EB
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 19:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA077F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UxRhj1E5"
Received: by mail-yb1-xb44.google.com with SMTP id h20so2950519ybj.8
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sIZhYAthYWBYdLdFxX62quaSDkTNt7lcxiX/jTX8QP0=;
 b=UxRhj1E5yWHmK02wVOz5+lpu2UXiBVT2ExRCRprxxH1S4VAKxqdO31TP6ZpqARUlWO
 vwPD+1LblYV2iK3wmfEDOKH/E5ZTWY6ydGbcMxvQadznmQIGU6CHA0dfBHTC7eN8f8He
 7A7yyzMnGwaOS1UvpgrILEQD9gg9JlGFxcQ57SBngIrEapInjNk46HGBRfo+d+FiPKwa
 teLPniL0duptKZinnbwqAFtwwPOSkZwCprfirnyIqNJ5UltaaKsC2y3HDX26vaTuMWXb
 Cpi8lLlOvSa7K2odaQpDx4415Xhp8pYUFQEjAhJrXBzgLdbHLfMW3V9QfNXdJ7ufcgWi
 xf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sIZhYAthYWBYdLdFxX62quaSDkTNt7lcxiX/jTX8QP0=;
 b=mtkWEx7W2Ae5Nq98KiVtPQ3izNHyNu4ITlZsw+lYk9bc1yX9YEV/Helc6wH8iH1Oto
 lPBBran2LKr/cTKe/1y3d74uLcdqqahVOnMxkb3rpn6P/vpdq8lsX0q08qsZgg3oAvKY
 fWA1qYHnGY2gh1hdTDYTcKSCik3IMVDmaFqGmpShl4sKqaDqXbT2jLTDCpdxmPxXuiGK
 39WpZDb8tNpuwiiD+veXDjFSEyveagWmSvvBozG++MyiK2vKqr/E0XcJYBNI6486vH2N
 NRo7QWIsCr/svTn36/xBwnSZiCUVS+LKE/o8Z4zaNxQb7/j0ra3+d1eFqumVpDaJrgDG
 j9xw==
X-Gm-Message-State: AOAM531aHCSP0CFXWBtfZThBLcFLtf3+Arbu5FALpwbnVE+3XlWN21RN
 JNbUZAZBMALhqoIZFYYIbqx0YsXXWqCMRmVeBUs=
X-Google-Smtp-Source: ABdhPJz3x0ltioowCpoW9IFahNqovv85mHc+kMeq8iX9slmaAJEwJxGArTLcXBn+w17+vkNbqQZ20FE/b1rvCTEF6pw=
X-Received: by 2002:a25:2a58:: with SMTP id q85mr32915263ybq.518.1598548527955; 
 Thu, 27 Aug 2020 10:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Aug 2020 18:15:02 +0100
Message-ID: <CA+V-a8t-HHWeo4zwnTuyZHnhc8u_aXqt_KZHr1trnXQB15Jj6A@mail.gmail.com>
Subject: Re: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1
 support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 28 Aug 2020 13:44:03 +0200
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
> Document r8a774e1 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen3-xhci", therefore no driver
> change is needed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  1 file changed, 1 insertion(+)
>
Gentle ping.

Cheers,
Prabhakar
