Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7571487B46
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 18:20:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E4721910;
	Fri,  7 Jan 2022 18:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E4721910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641576010;
	bh=ohkdli0pZqH3xqstctyE66dOE3R8YbgAjVdn98aQNOE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lfpleStShLHL8DNtleSXqUaJLA8ndMdTjNXBTWcr5F7piE900vtxmmjNJVcMU9iab
	 E3sz4UzK1mh2eX44nuSMXp2G72mTBKRyTqAGuiV77hVLB2WgZhMBxbihO6FXOy7OeR
	 7NxwZ1bNefzEVafW+tISE2P/uxVrCs7HcCDbfvx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 149EDF8047B;
	Fri,  7 Jan 2022 18:18:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA23F80249; Fri,  7 Jan 2022 17:29:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AADD0F800AE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 17:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AADD0F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MQOUv676"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 207GTWdY126346;
 Fri, 7 Jan 2022 10:29:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641572972;
 bh=gSPa2SrN3YqB2RHUn1JNHASwQpxAuZUnLG52GBxt0Yg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MQOUv676jgbtfoWqniRW7KLxTX7A9n1bLd9Z69Xp6udLs91KhMVg1QG+avjqYHped
 0Ja1d7ORgD9PT6zqJiEEUMcDTCYDjP0WrPJBNR0eknL4hdQUPwdnCarQ63770u3c9K
 tUWddqEeuiK82jmgg4MTVDeLLjtXsmesyaqcWE4c=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 207GTVuI030190
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jan 2022 10:29:31 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 7
 Jan 2022 10:29:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 7 Jan 2022 10:29:30 -0600
Received: from [10.249.36.164] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 207GTU8O054945;
 Fri, 7 Jan 2022 10:29:30 -0600
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
To: Rob Herring <robh@kernel.org>
References: <20220107031905.2406176-1-robh@kernel.org>
 <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
 <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <8902cefa-e2d7-1bcc-aae2-f272be53d675@ti.com>
Date: Fri, 7 Jan 2022 10:29:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hi Rob,

On 1/7/22 9:20 AM, Rob Herring wrote:
> On Fri, Jan 7, 2022 at 8:27 AM Suman Anna <s-anna@ti.com> wrote:
>>
>> Hi Rob,
>>
>> On 1/6/22 9:19 PM, Rob Herring wrote:
>>> 'interrupt-parent' is never required as it can be in a parent node or a
>>> parent node itself can be an interrupt provider. Where exactly it lives is
>>> outside the scope of a binding schema.
>>>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
>>>  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
>>>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
>>>  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
>>>  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
>>>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
>>>  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
>>>  7 files changed, 15 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
>>> index 9ad470e01953..b085450b527f 100644
>>> --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
>>> +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
>>> @@ -43,7 +43,6 @@ required:
>>>    - gpio-controller
>>>    - interrupt-controller
>>>    - "#interrupt-cells"
>>> -  - interrupt-parent
>>>
>>>  additionalProperties: false
>>>
>>> diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
>>> index e864d798168d..d433e496ec6e 100644
>>> --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
>>> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
>>> @@ -175,15 +175,6 @@ required:
>>>    - ti,mbox-num-fifos
>>>
>>>  allOf:
>>> -  - if:
>>> -      properties:
>>> -        compatible:
>>> -          enum:
>>> -            - ti,am654-mailbox
>>> -    then:
>>> -      required:
>>> -        - interrupt-parent
>>> -
>>
>> There are multiple interrupt controllers on TI K3 devices, and we need this
>> property to be defined _specifically_ to point to the relevant interrupt router
>> parent node.
>>
>> While what you state in general is true, I cannot have a node not define this on
>> K3 devices, and end up using the wrong interrupt parent (GIC
>> interrupt-controller). That's why the conditional compatible check.
> 
> But you could.
> 
> The parent node can have a default interrupt-parent and child nodes
> can override that. It doesn't matter which one is the default though
> typically you would want the one used the most to be the default.
> Looking at your dts files, it looks like you all did the opposite. 

Hmm, I am not sure I understood your last comment. Can you point out the
specific usage?

All our K3 dts files have the interrupt-parent = <&gic500> defined at the
root-node, which is the default ARM GIC.

Let us know if we need to fix something in our dts files.

The
> only way that wouldn't work is if the parent node is if the parent
> node has its own 'interrupts' or you are just abusing
> 'interrupt-parent' where the standard parsing doesn't work.

All our K3 gic500 nodes does have an 'interrupts' property.

> 
> You are also free to use 'interrupts-extended' anywhere 'interrupts'
> is used and then interrupt-parent being present is an error. 

Yes, this is understood. The OMAP Mailbox binding is reused between multiple SoC
families, some of which do not use an Interrupt Router in between.

So, whats the best way to enforce this in the specific schema? I have used the
common 'interrupts' property that applies to all SoCs, and enforced the
conditional 'interrupt-parent' only on relevant compatibles.

regards
Suman

How you
> structure all this is outside the scope of binding schemas which only
> need to define how many interrupts and what are they. Ensuring parents
> and cell sizes are correct is mostly done by dtc.
> 
> Rob
> 

