Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45623C827
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 10:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADEAF1667;
	Wed,  5 Aug 2020 10:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADEAF1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596617433;
	bh=chTkhsGhAv39w6if+IiAek6y2650PEopFO42uNZ5fxI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jp7zRQ8aMH5lRG91Q4+0SGOUEE/7cKDfs5WBNZ/B6HsYoDJ4kcYaKrRedhlaxmWsN
	 s1TuM0y5l6UCGuoM5AAUw16mJtcNGHuo2U0Us5WU59/y7W2ChTr1akBnKtL23HmNA8
	 bn34eexW4TvhsAIfnlz3/6/Da9D8EAStb12PCDwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF48F80112;
	Wed,  5 Aug 2020 10:48:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEDA8F80218; Wed,  5 Aug 2020 10:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1891F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 10:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1891F80112
Received: by mail-oi1-f193.google.com with SMTP id k4so38943276oik.2
 for <alsa-devel@alsa-project.org>; Wed, 05 Aug 2020 01:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mrXzxi9uxOAW3sW2InYWxrD30ehGwVVOP3HqfzhRdk=;
 b=Ux4dI3WboRSOF7N63sOy4Ho2tifD9N1PNbWWswPFefcoCB4qW7GrO/svKqXCjMeWJk
 KXP/wC6S050gRPtGdrVXyoeHAaWNDsDMw6Bf2Qg13FIp3Mcj9x7Mf0n5lqo8zjP8KQX7
 eaVf0KO5w+fJtKJK5w3m+bvJ6vfAONYKZ/oDvM47tI0wVgUqnrgqftHaDgXmM0UZ2wDm
 PFofhevgPYnX/+2T5DnShigAkTcvdGsfMMnqNq6us+k0zimEdCuf9MwYpPrSVZwaukQO
 QkfDJ3ptQM1uC1TwPPaYPSklJ7mwEcLjbRMxgc9I6uZHgEom0qX04s/G7nMY5gzXpt2D
 mg0w==
X-Gm-Message-State: AOAM530EVYe1EBRwpQvc7pIdvD/DvLZHbMHbA5CV1lzTMJKQJtgr8gDK
 BbcEBTpd4YzRZWZUAJn1YwIeI+Fb6gPCYaLnaSQ=
X-Google-Smtp-Source: ABdhPJytnGMFscI/4Vj10JBqUQ7Wgi/Lqycodf6cBlV8PTnw+Znw95/OXOULRQVW5Ng30YOlYqbpGAXWXSVGKdV5pP0=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr1785208oie.153.1596617320906; 
 Wed, 05 Aug 2020 01:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2020 10:48:29 +0200
Message-ID: <CAMuHMdXOvVkbhXXmaugHe4fo5vUK3x7bYFHPYHESPWqVdDJBjg@mail.gmail.com>
Subject: Re: [PATCH 03/20] dt-bindings: ata: renesas,
 rcar-sata: Add r8a774e1 support
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
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
> Document SATA support for the RZ/G2H, no driver change required.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
