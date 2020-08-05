Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF523C896
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 11:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFCD1672;
	Wed,  5 Aug 2020 11:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFCD1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596618296;
	bh=LdKDYsQpNIn3oBJl99MsUlYhAygbeNmH0Hm5uGqH9R4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GZLNm+qSMFkrOQmr2f3yebhRZo7y27mkE5sGYY3C1DxeRGdzjnbIFj11VXUH0j5au
	 IkteFhhmXC89wm07BO7FM86A1TRXjk3j/qSkoagBndT659/hBJnL1v9u7fi+MOmEOo
	 83ROByJwrZHYWvOhc1CpReFcVq7tzbosVajMFjKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CE8F80249;
	Wed,  5 Aug 2020 11:04:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A2FDF80234; Wed,  5 Aug 2020 11:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E798F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 11:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E798F80112
Received: by mail-ot1-f66.google.com with SMTP id t7so18942122otp.0
 for <alsa-devel@alsa-project.org>; Wed, 05 Aug 2020 02:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+U8+4Hl6vkW6q5H3Mn8yh7PKkJ8AzP5y5V/lYaSvu1o=;
 b=YFvyFu1weqPxpB6eJWiijxKnpw5QCjqW7ATMoGZBouU8rSDl0i/p47JW9lkEGZdpj+
 o9caExT/BkZRZGNHk6d/FF0WhDoSWg6mncELozIIKauSnoOiQlglFPE/Mr+KxYlo/5Wm
 an82Z1BrU9AlL+PQ8M95HiT5RI3Fz5OKlWW+3PTN/tL/S1LXWjMe6BoycasXsNuOJT2H
 AupA28q13rYXqMUBjBYPxPvoWKtykbu3mWLpRVoD51uyRH34c1SVnGggwtpWrp7dke5m
 WH9GJ3ox1QREkXc9G38B6YOwHy6qdY3RcJ7ktsyT+lNR2W1ThiaRzJ7h6dFJPWkHdRUP
 593w==
X-Gm-Message-State: AOAM533Qjw7EurR35wyJ4ienDdCg9DFSOh8HxhgAz0B76YZ3xXEUv1fB
 vs31aowf4yGVWgrSGXrD+MweompmXsJTVcmmoD9Jt6J0
X-Google-Smtp-Source: ABdhPJxfFB1hHoa5BXIYGVzYY67VoOT3jTLbs48GTCpZQYZnuP5JqIwGmhxVtRFSbWsP+vfLaRmRzFfm+5MdaHUY6CM=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr1670667ote.107.1596618231704; 
 Wed, 05 Aug 2020 02:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2020 11:03:40 +0200
Message-ID: <CAMuHMdV1A3SZSukFcO9YHGveJGXkUHm4VG2wBgThh+xV939Wew@mail.gmail.com>
Subject: Re: [PATCH 12/20] dt-bindings: dma: renesas,
 usb-dmac: Add binding for r8a774e1
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
> Add binding for R8A774E1 SoC (RZ/G2H).
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
