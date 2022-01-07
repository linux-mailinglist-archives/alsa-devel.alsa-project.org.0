Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF293487B47
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 18:20:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C90190E;
	Fri,  7 Jan 2022 18:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C90190E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641576016;
	bh=OFEHu/bkwozuqgXzmAJslWkaBtA/8D7wQRLLpTkuX10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vth6RbHPInXJqjZWrs9Hq3GvA1jpHmgH58UkbEIae/ujblUhCgR96YtvxbLM8Bx0+
	 m8BEDkaDfCtnUXu5nZAheAhMBPq9S1F7OrBX5me3EBfN+7PCprtxfdgJyjWuZtZaJZ
	 z7y98F+oSjYf1SZWPDv39LpwVPAaLAmkjTzHrn+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAA01F80507;
	Fri,  7 Jan 2022 18:18:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2F35F8007E; Fri,  7 Jan 2022 18:03:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B5F2F8007E
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 18:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B5F2F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g3j3AWgu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 070B6B8267E
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 17:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373FDC36AF5
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 17:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641575019;
 bh=OFEHu/bkwozuqgXzmAJslWkaBtA/8D7wQRLLpTkuX10=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g3j3AWguhtz9Ax4HaYWyVFJTrVmh++66LQtuos6qOmFxhrRerKv8mq6Ap3/eUMY1g
 ywXnPHwHHsPTK+G8/XyvT14E91Pbq/NlcXWgWg5MSg7ni9uuFT4g557BSa5DwNrnTs
 7L1AOT5sK2UYixVIwXdgGskmMWwWxjz9uBqq3CvqQbSyqkxs8EqcgkpAmdjnieVA7D
 +IQp1JeMf6h03hhI/PMi8zgypqmwQjJrnwsWMWb0cxe2rt43GcPRQv57cWuT/CHJBS
 8Vscu3b7VfSHp1+eVPdviTyf6vUt/AL0AgqLhPQ946jUr4tajOtbjQRSQcxryIz9zf
 UYidjqVfdbWPg==
Received: by mail-ed1-f43.google.com with SMTP id k15so24335137edk.13
 for <alsa-devel@alsa-project.org>; Fri, 07 Jan 2022 09:03:39 -0800 (PST)
X-Gm-Message-State: AOAM532vd1A72eHarKpm05WiHSqpRjkzOXG1vCHbw5ptikXrUAqulQNO
 +NcRKs5rdJnUYKDkeIpI4jPg5g9IfA0iF3fd4Q==
X-Google-Smtp-Source: ABdhPJyVHvfifLk+kw1sqHl8xV7RW2+DKP2YJdCdWKyWvhJDsj6/0F6MjSoppkQ/mBd9/4EtbX68a6mdmbqlGPBPU48=
X-Received: by 2002:a17:906:d184:: with SMTP id
 c4mr6269057ejz.20.1641575017424; 
 Fri, 07 Jan 2022 09:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20220107031905.2406176-1-robh@kernel.org>
 <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
 <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
 <8902cefa-e2d7-1bcc-aae2-f272be53d675@ti.com>
In-Reply-To: <8902cefa-e2d7-1bcc-aae2-f272be53d675@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Jan 2022 11:03:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKScenYRO4QERfdB-e8-70Va1tMBbSTXbAoUp+AVTk8Pw@mail.gmail.com>
Message-ID: <CAL_JsqKScenYRO4QERfdB-e8-70Va1tMBbSTXbAoUp+AVTk8Pw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
To: Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 07 Jan 2022 18:18:28 +0100
Cc: "Menon, Nishanth" <nm@ti.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Vignesh R <vigneshr@ti.com>, PCI <linux-pci@vger.kernel.org>,
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

On Fri, Jan 7, 2022 at 10:29 AM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Rob,
>
> On 1/7/22 9:20 AM, Rob Herring wrote:
> > On Fri, Jan 7, 2022 at 8:27 AM Suman Anna <s-anna@ti.com> wrote:
> >>
> >> Hi Rob,
> >>
> >> On 1/6/22 9:19 PM, Rob Herring wrote:
> >>> 'interrupt-parent' is never required as it can be in a parent node or a
> >>> parent node itself can be an interrupt provider. Where exactly it lives is
> >>> outside the scope of a binding schema.
> >>>
> >>> Signed-off-by: Rob Herring <robh@kernel.org>
> >>> ---
> >>>  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
> >>>  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
> >>>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
> >>>  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
> >>>  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
> >>>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
> >>>  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
> >>>  7 files changed, 15 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> >>> index 9ad470e01953..b085450b527f 100644
> >>> --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> >>> +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> >>> @@ -43,7 +43,6 @@ required:
> >>>    - gpio-controller
> >>>    - interrupt-controller
> >>>    - "#interrupt-cells"
> >>> -  - interrupt-parent
> >>>
> >>>  additionalProperties: false
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> >>> index e864d798168d..d433e496ec6e 100644
> >>> --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> >>> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> >>> @@ -175,15 +175,6 @@ required:
> >>>    - ti,mbox-num-fifos
> >>>
> >>>  allOf:
> >>> -  - if:
> >>> -      properties:
> >>> -        compatible:
> >>> -          enum:
> >>> -            - ti,am654-mailbox
> >>> -    then:
> >>> -      required:
> >>> -        - interrupt-parent
> >>> -
> >>
> >> There are multiple interrupt controllers on TI K3 devices, and we need this
> >> property to be defined _specifically_ to point to the relevant interrupt router
> >> parent node.
> >>
> >> While what you state in general is true, I cannot have a node not define this on
> >> K3 devices, and end up using the wrong interrupt parent (GIC
> >> interrupt-controller). That's why the conditional compatible check.
> >
> > But you could.
> >
> > The parent node can have a default interrupt-parent and child nodes
> > can override that. It doesn't matter which one is the default though
> > typically you would want the one used the most to be the default.
> > Looking at your dts files, it looks like you all did the opposite.
>
> Hmm, I am not sure I understood your last comment. Can you point out the
> specific usage?

Perhaps an example. These are all equivalent:

parent {
  child1 {
    interrupt-parent = <&intc1>;
    interrupts = <1>;
  };
  child2 {
    interrupt-parent = <&intc2>;
    interrupts = <2>;
 };
};

parent {
  interrupt-parent = <&intc1>; // Or in the parent's parent...
  child1 {
    interrupts = <1>;
  };
  child2 {
    interrupt-parent = <&intc2>;
    interrupts = <2>;
  };
};

parent {
  interrupt-parent = <&intc2>;
  child1 {
    interrupt-parent = <&intc1>;
    interrupts = <1>;
  };
  child2 {
    interrupts = <2>;
  };
};

You could structure main_navss and child nodes in any of these 3 ways.

>
> All our K3 dts files have the interrupt-parent = <&gic500> defined at the
> root-node, which is the default ARM GIC.
>
> Let us know if we need to fix something in our dts files.

No! I'm just saying there are multiple correct ways to write the dts files.

> The
> > only way that wouldn't work is if the parent node is if the parent
> > node has its own 'interrupts' or you are just abusing
> > 'interrupt-parent' where the standard parsing doesn't work.
>
> All our K3 gic500 nodes does have an 'interrupts' property.

I said the parent node, not the 'interrupt-parent'. In this case, the
parent is 'main_navss: bus@30800000'. It doesn't have 'interrupts' in
your case, so only the 2nd case is a possibility.

> > You are also free to use 'interrupts-extended' anywhere 'interrupts'
> > is used and then interrupt-parent being present is an error.
>
> Yes, this is understood. The OMAP Mailbox binding is reused between multiple SoC
> families, some of which do not use an Interrupt Router in between.
>
> So, whats the best way to enforce this in the specific schema? I have used the
> common 'interrupts' property that applies to all SoCs, and enforced the
> conditional 'interrupt-parent' only on relevant compatibles.

You can't. There is no way a schema can ensure you connect the right
interrupt controller just as it can't ensure you used the right
interrupt number and flags or used the right addresses. Well, you
could technically, but then at that point we could just generate the
dts from the schema.

Rob
