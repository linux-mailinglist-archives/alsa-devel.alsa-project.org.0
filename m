Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59163255991
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF3011872;
	Fri, 28 Aug 2020 13:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF3011872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598615147;
	bh=ppUfbGXDGmwDJVrtPqzckPq11vMMjUUl88Ez6bEP5tM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0+yfqy03ClMu/lXZ0cH9a9vUahpCUWbwA2rTeW9UxrfyJj6K33Lw9uAUJD9hHeKy
	 B/QVFPWEkOR9LkxbNe1KJN0y/L/ydIrALhj219yLRSE+bPzzaz77csL5qRsNPK+biw
	 2pohiY/wlusUU7NkBOUoveTtncv0QarvCKBROEEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3844DF800EB;
	Fri, 28 Aug 2020 13:44:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FC10F8016F; Thu, 27 Aug 2020 19:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A38EF80105
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 19:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A38EF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="phVYQvV+"
Received: by mail-yb1-xb43.google.com with SMTP id i10so3344728ybt.11
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 10:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mHniHlKDMaeGQOVA7wYMtzU65VERCv+oHJvfRmraXqc=;
 b=phVYQvV+p1qAm0gsfY1toQgMji8hPquXZHym9pN14Y2rco5aiKlsT1Gx6zVh2XPdIs
 t2lqa76eF8xs83b9Y54L5hMJo7WCFO2fbUSk+GIfX8iqVvRbExWIpBc7OTj5+vOG4I2P
 JMlFP6YynzTlq7xlgz3eMXxGGT5QMTkUMER9bFTWUu5AQF/UoGISrTL9tqBcLf6hoJk6
 37MLl/pmsybfeZDTrQ+3wnhfTSeXIU6+Q51facRmWQ5yyjSZuiQstgngF0UVxzXRP/21
 X486CABykcDT9yvbgwMMOekgteTdYZM9T9v9hlx2QNelhA/SoEvmBsVsRsEJBl3dLeze
 +W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mHniHlKDMaeGQOVA7wYMtzU65VERCv+oHJvfRmraXqc=;
 b=GOR+2jwSVMDqdV48WDSdtfV0v5/WKlZabCXUlCyNRLeDYWcP5VREVcioZWP70CEc84
 246tPpWAfY/uvVTvQiJ3oXiSS471+GGdfTSulRhPbbwF52Edu/c6lKcHmqHuVuUrescC
 L/PhOWorOc+gRqDEGXkNGzCy30ohIpoQQpWA9Y09ksbr+A6mnfEBz5S2kiQNoFdgNKCu
 IrGroIETxE7oKT84QccWLE7QEf9tpO6lszP8oOTd2l40SZmGGUicDA0vAPWqUANHpVcn
 CcceC3WUnOc7ymjbgRzEQupuD9UESz4JdCmxPgcd0gYuz2e0vgl2GJWXvIHtossvtubq
 iyrQ==
X-Gm-Message-State: AOAM532roqPJeBnxXQxryrcT6hc+VWm19weOAxg0lMYaU1gY7LORCoFU
 pqoooh+ZUanqPRVxpqGriv5Aflc+3QoBWvaC8ds=
X-Google-Smtp-Source: ABdhPJynyRKB2vFyMBE3ZSJ4B1YetYq7rZ1URcR+oH1Mlp82FYbmnw++2Z+nCtikyiYgdGx4q742m6zdB4fkuZ+CzIE=
X-Received: by 2002:a25:8149:: with SMTP id j9mr31275854ybm.214.1598548129529; 
 Thu, 27 Aug 2020 10:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-12-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Aug 2020 18:08:23 +0100
Message-ID: <CA+V-a8t9p9U5oeTp-QNmp2uGHMOvXpo+VhRvp5hv5oDEWUh5QA@mail.gmail.com>
Subject: Re: [PATCH 11/20] dt-bindings: usb: renesas,
 usbhs: Add r8a774e1 support
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
> Document RZ/G2H (R8A774E1) SoC bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
Gentle ping.

Cheers,
Prabhakar
