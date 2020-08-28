Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135625599E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E271870;
	Fri, 28 Aug 2020 13:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E271870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598615303;
	bh=/Tknbw0stu4TnqEdLf+QcWu+/2GUIu2JyMgYLkYRZgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d5iNSXXfKiADjKAxmAgWkzbW2sVFK59++npo2QTBLtnZhnRgW0DeXF2L/pGWhTJRb
	 eirP9nnsCWk1i/mCCUH2ln/MkTVb1njvpaKGFqSFX8a3xyCmDOqDrnfDOO5UGGR4cV
	 rJIxJqQpQU4Vu6CBS4nlU5ytzZTOGFkDiMG23K8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D5BF802E7;
	Fri, 28 Aug 2020 13:44:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0488EF8016F; Fri, 28 Aug 2020 09:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C82EBF80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C82EBF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ce1e8K/c"
Received: by mail-yb1-xb43.google.com with SMTP id y134so55959yby.2
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=03SA6QLBtK3IQ4zuCDRLpEPFR1JjLUS7ypF2jRpTUus=;
 b=Ce1e8K/caM4JvW4I6IlYWAdAdDrcDJjdidgiSSw3u1U2l7HQ3a2kOmczvvbkYGVOq4
 erB9J73UZGJvV7XHy/RkrrCUhQw7V1lydp0AdbQo+pNvzOBgNLswc2RgdPqsMF58aheA
 9Lrv0ex7Uj91QMqENp5Yv4cuToIFPSGWs2lkiKSxnpsSTe7Eq5ZlVjBnVhNFGFh4cIr2
 jpoD9oU/YgAXieicPCZprdmCdMY/V0jc1YbWHaplTsQgOGXc03HEMZkGKzhEBMjjUyat
 1huT8whAgyVZhNrXbK4bevxXwjsD6gaR28Big84Mi8vP/bi7JfPYO85puDNU0UBxCGih
 WPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=03SA6QLBtK3IQ4zuCDRLpEPFR1JjLUS7ypF2jRpTUus=;
 b=EWnCGMv1CT34qASo2dnKOrBjVRuDkUHf1eD7mqSZK3LZHNCDgqkdNWUaGL1Ez9Wsgu
 e3wjvCz3lSPXolHuMf/w4o48ItZLyhb3kggKbvHOb3Z38k4cU4QorlEyYCjb+TDVbTkT
 98LqoJqq9UGfcZu8HvZnHEVwJ6iFh/m3J9lr1Mi89bevOUjfCPNQLhe/FcNYfN5M8qwI
 MX+JHp0ht4Xbdfk7ILz3mQCfPQjdsUx5W0zLfSlF4EztB5O7Ge2EXjiYnK9OUIA1LTNX
 KJsgX7CIubs/ciXiDe55gBhKaMyhFLrh7iDP+bEbn8kZPgYveRouheyGX8/7MVX5uaUU
 MTng==
X-Gm-Message-State: AOAM532Y5+7o1dZunhbNV9E8U/X0VsVSPU9BFN4qq8EEX88gPGXaWvIw
 mOzVIt7v2gxVnSJ5c6WpGZ4nolm0HigY1569FBg=
X-Google-Smtp-Source: ABdhPJxKaH3Rnxdft6nzQd34AAzAxueOyLTpZiz6Sebv+w7rBi0ECVdDr/vmwjJ5qeTeRA2GnUZW3Taq1UeJFdtPzj4=
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr720966ybv.401.1598601154899; 
 Fri, 28 Aug 2020 00:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8t-HHWeo4zwnTuyZHnhc8u_aXqt_KZHr1trnXQB15Jj6A@mail.gmail.com>
 <TY2PR01MB36923A0548AAE7E0249042AFD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36923A0548AAE7E0249042AFD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Aug 2020 08:52:08 +0100
Message-ID: <CA+V-a8v5sFVGVxNKDXvg8w=FeZnGdyV8q9deBuAaVMsx0bDcwg@mail.gmail.com>
Subject: Re: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1
 support
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 28 Aug 2020 13:44:03 +0200
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Niklas <niklas.soderlund@ragnatech.se>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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

Hi Shimoda-san

On Fri, Aug 28, 2020 at 2:11 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi Lad-san,
>
> > From: Lad, Prabhakar, Sent: Friday, August 28, 2020 2:15 AM
> >
> > Hi Greg,
> >
> > On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Document r8a774e1 xhci support. The driver will use the fallback
> > > compatible string "renesas,rcar-gen3-xhci", therefore no driver
> > > change is needed.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > Gentle ping.
>
> Thank you for the ping. However, since the latest kernel has renesas,usb-xhci.yaml,
> would you fix the patch?
>
Thank you for pointing out, I have now posted a v2 [1] now. (I missed
out Geert's comment earlier for this patch)

[1] https://patchwork.kernel.org/patch/11742289/

Cheers,
Prabhakar
