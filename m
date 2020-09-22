Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E3273D8F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 10:41:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65BD16D7;
	Tue, 22 Sep 2020 10:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65BD16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600764106;
	bh=vs+Ma0kjstiD+hy/a52XpqFHgEUZ5Ni71IqOzANoUAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4UfkX4QOyqRMz4h51CS+gW0jV1l0OAUH+8GbZ42nMXwSvFj78GLs0WCZcJoMiITy
	 Z4rnr/N+UP4nQLYpbYCZHzkcrlfe34MA97eBk4qoZK4f2cxuDa2D52cDSGzuU3dpcq
	 ed/G1AwmWLo1s+qhxEGM9stiEN1BhlcIOE9A/MfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77792F8023E;
	Tue, 22 Sep 2020 10:40:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44AFF80232; Tue, 22 Sep 2020 10:40:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63308F80234
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 10:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63308F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NuVLgPgz"
Received: by mail-yb1-xb43.google.com with SMTP id k18so3556902ybh.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 01:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N+OZiUP1vnnZHS8QHCk/3wxoJQlfFggJgv3Kp7po0iw=;
 b=NuVLgPgziheHwTfP5LjhFY4SesKJN6z12RILB1pN4/SeYDJzsHHvNKezR7ZYNY4dks
 R0rzGhN6Udmt//3tnPZXjgTsNr/c3ToPlEYCpNKg+XX1/tON4IljkX1fpQmsFLu4fysH
 ZjJ86XJRSYLhpVFJDKRk9CJOC4RjlB+fC4P1iwaz1sZk4aKze740Q52vngewtGl/oIyY
 Y45SYNMv6ibCl+2Vx1HERK0vRajzkUQ1kQpv9q64EgtEFcw7fBDhONQWuRZU8tl15Q5p
 dapvzfVuitIIPO3bUQ/+iHaSDz56C4mqO4AuLzfsHRSyNQkmm471kLn7Lwusf38OStzE
 yLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N+OZiUP1vnnZHS8QHCk/3wxoJQlfFggJgv3Kp7po0iw=;
 b=BPfhtZX6dfu4xEBjk70yDq0vVEgoorQcbNamUeALmM6A/IJj5WWX2takNz4QAnh1vr
 PpLoCqllWW71zCjZHoqO/0dSqc1uGF8WxXkgS74f/SI6BIPvcCsepoLUEhzwPWFekxt+
 D06DFs+RmuZExc5aQ3DDGAdJDf8ptzyJ80970bfD45eT3c2NHS8skvC0mj6IaU4/3xkM
 MBOHD8pPlGM+etEtZxI/oHnHJZC6Od7eqOOeuolmoJug6P3L1aQjL8JRTdptxP0he7kC
 Hk6CYdX/kvldww70cUH9kYpPBIXpp2YFqdinWOAFiSrZDUqNlTUYZtIKEWqQVoKJzdt3
 yMkw==
X-Gm-Message-State: AOAM533dK0OIFrb5jLvQTSNwjRXA8Q4tiwIRwzijiiTzOlzG4pmQKTaU
 OtF5C9FOCxOl1LBldnqA8whw5+gjPpNNZ/np0vc=
X-Google-Smtp-Source: ABdhPJz7tp5/sbJjNYhmIjZ7Es4Bbt3UXUUN5/fc2NbqpCJMyZa2zZxOrHHSujRQO3IVOmIzjvH6zmqGIz2tZe5DpxI=
X-Received: by 2002:a25:aba1:: with SMTP id v30mr5709473ybi.518.1600764043123; 
 Tue, 22 Sep 2020 01:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vJ2n3KEL8P+XmVob2zjoWaX+s4a6c1TV_WoPFkwdkZmA@mail.gmail.com>
 <20200920140824.GA2915460@kroah.com>
 <CAMuHMdUyXMfZcVKkqaZHJ8tJf-3Kotqg+S2NHMZT0VFO0ZJJww@mail.gmail.com>
 <20200922083909.GA2092905@kroah.com>
In-Reply-To: <20200922083909.GA2092905@kroah.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 22 Sep 2020 09:40:16 +0100
Message-ID: <CA+V-a8u_0+XqyBiV6vxuc1d6_eDZdzO8dy3qBrmO1ke3L4BROQ@mail.gmail.com>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
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

On Tue, Sep 22, 2020 at 9:38 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Sep 21, 2020 at 09:30:39AM +0200, Geert Uytterhoeven wrote:
> > Hi Greg,
> >
> > On Sun, Sep 20, 2020 at 4:08 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Sat, Sep 19, 2020 at 11:50:07AM +0100, Lad, Prabhakar wrote:
> > > > On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > >
> > > > > Document RZ/G2H (R8A774E1) SoC bindings.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > Could you please pick this patch.
> > >
> > > Don't DT patches have to be acked by a DT maintainer first?
> >
> > https://lore.kernel.org/r/20200721033508.GA3504365@bogus
>
> Ah, missed that, sorry.  This, and patch 11/20, now queued up.
>
Thank you.

Cheers,
Prabhakar
