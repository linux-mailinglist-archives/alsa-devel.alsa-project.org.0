Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE864879A5
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 16:21:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 786B916C7;
	Fri,  7 Jan 2022 16:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 786B916C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641568897;
	bh=JZSDTXn831jsHLaeMlhV91a2NBUCYRKTYU4k2JJ3SEY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L1BMS0hvVKp78aJWBp6BHG45LOwvUvV0bngdLtQXP6oBsVig+B0mv1ddEG+6Wrz6o
	 HGF/e3EWG3Jz5N7Elaz7Gf5D3RQIvR1HxmDOJ70wa4Zq4fzqJ/kezWcWpZNCb9tG8p
	 jegHCz5sslitVwuexWku79LdKr2BB0PN1kepdGW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C38EDF80082;
	Fri,  7 Jan 2022 16:20:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 027C8F80249; Fri,  7 Jan 2022 16:20:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2678F80082
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 16:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2678F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aiW2Oo9r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13E9D61F47
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646CCC36AF3
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641568819;
 bh=JZSDTXn831jsHLaeMlhV91a2NBUCYRKTYU4k2JJ3SEY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aiW2Oo9rqnSvZMty9UZIT7Su6WRlpFZC4qB33eV+4HwGl+1IEQ29rltyVDfSbQmYo
 4e+xjseIQ4gjpJnncgYW0+GQl2lY/7Pc42gGUb0HiGc/0qpispy2oluvsAY69ZD+o/
 408clmpmDydeZ97b3Dy1O1mPHnlKDiJt28KxuXWVqXU8bN1D7Dnjh7+Li9+ax4mQwn
 gccb1AzgDKTqPVeTjGMCgkxl1J6N7g4Dn8aJG38k94S3wa9itzjU4IrMFrp6JrHwhB
 p5qTIQsCbQ19nz6d2GayyCfJucnwGsufy68qYS1iPodeLHrJ/P5hRUyh1a7woIqFWF
 MsuEB755uJd1w==
Received: by mail-ed1-f41.google.com with SMTP id k15so23180387edk.13
 for <alsa-devel@alsa-project.org>; Fri, 07 Jan 2022 07:20:19 -0800 (PST)
X-Gm-Message-State: AOAM533ra8BbszpuRvPpd3erZ1Geo5YJJ/sV3WvMLrPaCYQ471dPl8/b
 8tXATIwcOHXsvh8qXGnn9DQASrkv5cWaUGvSKA==
X-Google-Smtp-Source: ABdhPJz1jllAhtHnE/GCaPMpieaWkmlnAW2CajB4Bv3UzewhAkigmenmu4JVTDvGexXd518wf1HJZMvSArTFrZXD/Rw=
X-Received: by 2002:a05:6402:1e88:: with SMTP id
 f8mr57554194edf.2.1641568817622; 
 Fri, 07 Jan 2022 07:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20220107031905.2406176-1-robh@kernel.org>
 <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
In-Reply-To: <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Jan 2022 09:20:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
Message-ID: <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
To: Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, PCI <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Lee Jones <lee.jones@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, "Nagalla,
 Hari" <hnagalla@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Jakub Kicinski <kuba@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, John Crispin <john@phrozen.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 - <patches@opensource.cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, netdev <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Fri, Jan 7, 2022 at 8:27 AM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Rob,
>
> On 1/6/22 9:19 PM, Rob Herring wrote:
> > 'interrupt-parent' is never required as it can be in a parent node or a
> > parent node itself can be an interrupt provider. Where exactly it lives is
> > outside the scope of a binding schema.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
> >  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
> >  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
> >  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
> >  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
> >  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
> >  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
> >  7 files changed, 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > index 9ad470e01953..b085450b527f 100644
> > --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > @@ -43,7 +43,6 @@ required:
> >    - gpio-controller
> >    - interrupt-controller
> >    - "#interrupt-cells"
> > -  - interrupt-parent
> >
> >  additionalProperties: false
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> > index e864d798168d..d433e496ec6e 100644
> > --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> > +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> > @@ -175,15 +175,6 @@ required:
> >    - ti,mbox-num-fifos
> >
> >  allOf:
> > -  - if:
> > -      properties:
> > -        compatible:
> > -          enum:
> > -            - ti,am654-mailbox
> > -    then:
> > -      required:
> > -        - interrupt-parent
> > -
>
> There are multiple interrupt controllers on TI K3 devices, and we need this
> property to be defined _specifically_ to point to the relevant interrupt router
> parent node.
>
> While what you state in general is true, I cannot have a node not define this on
> K3 devices, and end up using the wrong interrupt parent (GIC
> interrupt-controller). That's why the conditional compatible check.

But you could.

The parent node can have a default interrupt-parent and child nodes
can override that. It doesn't matter which one is the default though
typically you would want the one used the most to be the default.
Looking at your dts files, it looks like you all did the opposite. The
only way that wouldn't work is if the parent node is if the parent
node has its own 'interrupts' or you are just abusing
'interrupt-parent' where the standard parsing doesn't work.

You are also free to use 'interrupts-extended' anywhere 'interrupts'
is used and then interrupt-parent being present is an error. How you
structure all this is outside the scope of binding schemas which only
need to define how many interrupts and what are they. Ensuring parents
and cell sizes are correct is mostly done by dtc.

Rob
