Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1736270D41
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Sep 2020 12:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF65169B;
	Sat, 19 Sep 2020 12:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF65169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600512744;
	bh=cXOWZBDWuMCwDJpRiI6UZd0XLI8GlWckYYW8wIU0EcA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRkFZYnBFSdYAMdMPgNxvYz1ObICBVur6sG0tsEEUMWZDlsR88dN7/P+uZDkX6wkq
	 NEIb/VIsT/8p9X7MvBP/ye88UXhZlPkqkgK/KwP2ztHqDMf58pHJjb3wAN0hIikMVH
	 GGQ4L+B/izjtIMmY9IpE4X8g7IF/5UyMRwnaARzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B5C2F8013A;
	Sat, 19 Sep 2020 12:50:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28EFDF80212; Sat, 19 Sep 2020 12:50:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E157DF8013A
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 12:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E157DF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h+fZZUH6"
Received: by mail-yb1-xb41.google.com with SMTP id x20so6349491ybs.8
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sR4Cf468ttlcnEpD2lR99lnNDLzNYlhl55SIm3LLtd4=;
 b=h+fZZUH6fIgq13gs2kd6hFQTg0H8gYjImJcdR9Qx9rZwfTAIwjI8eKphpv8/Emi18V
 0DMzO+0vOJM9E70MeDuMpUTA/o/QImw4KbEQb17KSGwmDqyVrxWujJvSyZzrbQwNVwEf
 wUe112+xxfMWXK3OtZ2FiwQGtV1fIcJeiXlkb3Zf3471cBTjE3U3lKsg4BuEhoXXuhx1
 MwwdopqSI5Dl/C5SUF/KCzvYgj0fJVHi/c0efCcBCPbiYbQzxBymh5K3mTb1FYR3yzA1
 r1V1FPoYQiJALJIgv1PcjJUIFAgyuRHwbGhpD40ZordPqVYibzS1BsHx6yi/xkiBds8b
 suJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sR4Cf468ttlcnEpD2lR99lnNDLzNYlhl55SIm3LLtd4=;
 b=fXAzo2YcYlQyLzD+VqbcB8EpeqBwtJAIXPTb6311ZFGeOzubOEMeI84E/JLRLIK31Q
 9bJAN5TnXUQH7WsN9BIHgqdK2UnMPNZwgRmrJ+XGl0qpmRxt1ON6EtpoVyj4x4VzIWur
 sDRKTGelu8epFQvfFqQvMW+4CUJmw2D502UiDF/nNjwJXRlQ3zmAlR6LhZ4kOX49zXoH
 CHbQ6zJEYjzjW/SctaEoFCpx5Rrvh+txTEM4lfxcoxLvNHHs3/PDmo1BjEIHesMhcG6m
 GgyDb+vXJdvmBonHMuRV4CxH2t5BRac9E/+QcmG5cQbTDkaK060e4rGBTUdkjK5Zb/VP
 eEMA==
X-Gm-Message-State: AOAM530CujeCpkCmq3etU9an7jFAnDXTdRcKYFCIiTd84VbvZszvrf5V
 wPWYivqKzlqGPRooYvsBN7pPgf0iXVkeFFWaKUhhLf5/YO6yPIK/
X-Google-Smtp-Source: ABdhPJyE4U9ZnryEOY+zR+FUEkyCD/GHbSRKQqLTyhRoWySjkq/s2si4GtaVgrchY1J9veY4efVDKa+2G+W/Xi8n3pw=
X-Received: by 2002:a25:c487:: with SMTP id u129mr3406786ybf.25.1600512632850; 
 Sat, 19 Sep 2020 03:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 19 Sep 2020 11:50:07 +0100
Message-ID: <CA+V-a8vJ2n3KEL8P+XmVob2zjoWaX+s4a6c1TV_WoPFkwdkZmA@mail.gmail.com>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
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
>  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Could you please pick this patch.

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> index e3cdeab1199f..b9a008e8469f 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> @@ -16,6 +16,7 @@ properties:
>            - renesas,r8a774a1-usb3-peri # RZ/G2M
>            - renesas,r8a774b1-usb3-peri # RZ/G2N
>            - renesas,r8a774c0-usb3-peri # RZ/G2E
> +          - renesas,r8a774e1-usb3-peri # RZ/G2H
>            - renesas,r8a7795-usb3-peri  # R-Car H3
>            - renesas,r8a7796-usb3-peri  # R-Car M3-W
>            - renesas,r8a77961-usb3-peri # R-Car M3-W+
> --
> 2.17.1
>
