Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22583271BE5
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 09:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39CA1664;
	Mon, 21 Sep 2020 09:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39CA1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600673544;
	bh=6DBuSA5//Hsy8G0vVBVY6I1FZbOm9+aAH7dfAeOnUQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOgpKm5g+PG43Mq4PARaSVqt/Ga+v5TH+S65vxKb/lm8rB5ZB2fVnkk7JgFJj2rCz
	 XUXr+2S0KQNrmulpWF0aPGRmFxM3PxFlSmkLSDWSBSz65Wzo9mB1UQKo1W33qNxU7w
	 iYEoYMCZH0YRocMgZNhqaV3lGL4K97UuLraMPpHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CED1BF800B2;
	Mon, 21 Sep 2020 09:31:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90EF2F801EC; Mon, 21 Sep 2020 09:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2D03F800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 09:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2D03F800B2
Received: by mail-oi1-f193.google.com with SMTP id i17so15876613oig.10
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 00:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bvT46MVLA1wc77+QBaxqpfVEdVrcHoplawt2ilNveyU=;
 b=AVIsuHxOkgdPgMwdI0rTUA/LHZiaiWGTryI/xvozQ2ii7FOrwjzxTFu9tD5nb7Uymr
 8Fd4zeyd9y10crdizafD0LhXv9rXOLo6LnHk9OJuFCtGCT0oVF3izdqK9L1RdwRXtNfD
 /WJ6E6/zELT8zk/wIocrn4tm/NCIxs8XU/Ezfsw+fd99tOJv5clV6QxSzJUVONnaM5Ec
 RHIPynab3grXxX9Suwtt7vYKSpIm5nw7ZXvhRVcA3aMdn6vylY5UyqfweFAnQK5WzmNh
 QE1JZSEcDVEwaI9i32YiDORnBkQ1x3ekwOUd9U/PCyviK5OjXUFPwXjFbasBXb7UeuWs
 L41w==
X-Gm-Message-State: AOAM531UmbnTTFqW9QM9E/AK0YFLplzBcm9qrp7Fo3EkWEpxSBchpPQU
 VjCDig31Eiun3pGx0cxuglH4Wb7skINgmVvqRms=
X-Google-Smtp-Source: ABdhPJz9xmN9krNVkmFntK1fJCP4SVdiOQdSlUn0glZjdNUu0BDHNFHEgQW2lXttV0KKLloQqhm28dH1yGE42S/hfkE=
X-Received: by 2002:aca:4441:: with SMTP id r62mr15852660oia.153.1600673451338; 
 Mon, 21 Sep 2020 00:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vJ2n3KEL8P+XmVob2zjoWaX+s4a6c1TV_WoPFkwdkZmA@mail.gmail.com>
 <20200920140824.GA2915460@kroah.com>
In-Reply-To: <20200920140824.GA2915460@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2020 09:30:39 +0200
Message-ID: <CAMuHMdUyXMfZcVKkqaZHJ8tJf-3Kotqg+S2NHMZT0VFO0ZJJww@mail.gmail.com>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 linux-pci <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
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

On Sun, Sep 20, 2020 at 4:08 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Sep 19, 2020 at 11:50:07AM +0100, Lad, Prabhakar wrote:
> > On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Document RZ/G2H (R8A774E1) SoC bindings.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > Could you please pick this patch.
>
> Don't DT patches have to be acked by a DT maintainer first?

https://lore.kernel.org/r/20200721033508.GA3504365@bogus

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
