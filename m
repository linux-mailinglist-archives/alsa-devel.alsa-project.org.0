Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED423C864
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 10:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A24851667;
	Wed,  5 Aug 2020 10:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A24851667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596617936;
	bh=KuMRZItE2N6uS2GlGWGYq0vagTMyGlGg7sw5OpZ+IxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AmLiEwyDxoQ88nnhIIxlb5D3080W8qlLU83m0yAqHRGcBdEvzoqsfQZFdNFStCIB2
	 iZVjM4he5M8TZ2fJthRlyQCHE+tbhUhdYMw7n1POAXjFIwd6rzl2Rlyy+UkOPFTWaV
	 TMcHs2gIUxoNUP0YL2Gl+8qpb3anIIce0pB6QHog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7521F80112;
	Wed,  5 Aug 2020 10:57:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5954DF80218; Wed,  5 Aug 2020 10:57:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D15C4F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 10:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D15C4F80112
Received: by mail-oi1-f193.google.com with SMTP id b22so13002759oic.8
 for <alsa-devel@alsa-project.org>; Wed, 05 Aug 2020 01:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0C2QPNz+RkDu9YLa9Z+rHGCS+ZeukaWrCXpvcs7hr4E=;
 b=pDigCtt2L/JhLx11DKyWYsgqAoa8BvboeWqAMFY0jVmUs5sNmZfXH13OAI3ey+d6Ly
 OjRF9rrbWsXRaonYgBrUex0xDiJ846xoMKeuMPZs3vV/e/uWsepQjbjfU3SFOGrc1m2B
 ++4lcuWRuocoYvCX+GcSGwLRgZQQBCK5uQekDn3kpLdtdhO3fVtTTDd5kWW9cHIa8Slf
 DkYhyfl6c82ZPfs1/1/uiU+TTaaUg/LqlwXOUo3VFIPp3sRajLRJPtAuPaNkyzPEJp5V
 IrtFDmIlxd32RQLZ5poLo4XWV1i3VUZdN7EIEV0hHv4uWQ/kxQBpdQcrzGBfTnAxO0OO
 Af0g==
X-Gm-Message-State: AOAM531vjYNroMq0vejYb7KkWJ2J6tKoT5Yg5xHioXpzNk39LbbW77Sc
 L/UahSoRRM4IFjo705n8Xeh5rz9siDKYjpJEFA4=
X-Google-Smtp-Source: ABdhPJxig6iQpzRHDmYA2Ws2f12T50P8nQRPHOJgk/4ruGyeAaxQzJ5ap2HuOZ2wGBDZe+u8z4eTqSdXfbOD8P2Z2Ws=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr1895464oia.54.1596617825204; 
 Wed, 05 Aug 2020 01:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2020 10:56:54 +0200
Message-ID: <CAMuHMdXzGQe2Ov3uFUtZ+c+x1ftDWGu0q=YyD3J0QM_560Aw=A@mail.gmail.com>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
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
> Document RZ/G2H (R8A774E1) SoC bindings.
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
