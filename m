Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A60A58499B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 04:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4524F15CA;
	Fri, 29 Jul 2022 04:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4524F15CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659060603;
	bh=4IqQc9s76BroLvEgDhcy6iMkEZmOn4xlGbRsG2urURE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XnR+Wz+LhY1As9cSSOY5UrrVwgAIA9DG1y2Se+51DvCGGpg5iFlhQEA9Qr5D9r2cE
	 2bVGJ5xIvczoykToxpYOhW32b7r1KmEXTTd4X04S0kvIV2wba7vtk22vLqjoPBFQwM
	 rkhVI7XZrGLbVQhsWuyekVSxQn3XN/DXue83LbcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB2A3F804B1;
	Fri, 29 Jul 2022 04:09:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44F55F8049C; Fri, 29 Jul 2022 04:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A804F8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 04:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A804F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AgqzCdH0"
Received: by mail-lf1-x132.google.com with SMTP id m12so5370248lfj.4
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 19:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Egu6XbOSW2/5lIsT9r6kTYppYZFrAHSLqGcmRoRQMNQ=;
 b=AgqzCdH0YKe9ztSgnPEJDepW801N5tXAQ/Sar65T5F5Tn5anYHXHsJUF1MuqDQSpmV
 go5sW9AFgIq5/MlwXCa/FlI031eQYb2kEHP819IqU/Djj8nLYBUoGFHUbG8161fWh0p5
 BBDMmBDj1CMiL22m6xSVMbHnxOLU1Ps7TM3QD1Z8XmeOd1/NnaGSquPQneoCk59kGlCl
 FFkSYOqnn5EHhPZnc1E4IcLee8ojozfxCDmuRrBkVubBZ+73aZo1w4gyg5FtlDFqsVi+
 hzlIlZPniAaWScm4kfJ7wOHUTZ1aLuYKow8+gSBKfUiOTKaiqB8ZcN66dXpiR087hlla
 4oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Egu6XbOSW2/5lIsT9r6kTYppYZFrAHSLqGcmRoRQMNQ=;
 b=ltlKLz8h7saidC2badUb0IGaxIW9GYjXuDp/q6gmy46WQVOi4dKZbHzRKGfAorFhBD
 NJ6wGJnP3xBN3XHn1zLKpPsLaq8cNkwOl9fdhp4v+QILLN+BxlYEiPORV435iUXhD9dJ
 h9m2AC89jYm5lszlhy4FTRlbG10lc4nLuVSlOrv1ERUBavLNVs3xctGASP561ywgHndw
 tchG8Obsyyjf/HhP4fXewZXKOd1F59Q4D5gPQlgBbIIpbENp1zgp2+Ah8upP0hLuECSi
 ReGX8SAC70FauJYFmbxzrjstUEzxWd3tvJ5Yxn9wWzIRwDi4DkSZeRlhtEUy5uxHCV1z
 xxmQ==
X-Gm-Message-State: AJIora/NKSern/gHJOJ3xW6qbnR3NIkVat9H0dp+O4bEhIqDrEcHAHjt
 VO00xeja9uKEGwTMsnKvDfZ6+tuHKSMYowjJ34M=
X-Google-Smtp-Source: AGRyM1sQPljYnNniSBWJ9lTRVHNE25WXveloZ6DXSXGsnBz3xsQJ1TCVCOHB3HNxclzXnB9hDewVWURGOehE5Ea9cAA=
X-Received: by 2002:a05:6512:c06:b0:48a:d3de:f096 with SMTP id
 z6-20020a0565120c0600b0048ad3def096mr305063lfu.67.1659060524990; Thu, 28 Jul
 2022 19:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <1659020669-3946-1-git-send-email-shengjiu.wang@nxp.com>
 <d674ed95-1e90-8d81-1d1c-cc640808c81e@linaro.org>
In-Reply-To: <d674ed95-1e90-8d81-1d1c-cc640808c81e@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 29 Jul 2022 10:08:33 +0800
Message-ID: <CAA+D8AMJ9LgKiwWARFhSG3tT+B4QU+SNBsFobft4aop_6c0Oeg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,
 sai: Convert format to json-schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, krzysztof.kozlowski+dt@linaro.org
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

On Fri, Jul 29, 2022 at 12:42 AM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 28/07/2022 17:04, Shengjiu Wang wrote:
> > Convert the NXP SAI binding to DT schema format using json-schema.
> >
> > The Synchronous Audio Interface (SAI) provides an interface that
> > supports full-duplex serial interfaces with frame synchronization
> > formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > - fix exclusive property issue
> > - fix order issue of compatible, clock-names, dma-names
> >
>
> Thank you for your patch. There is something to discuss/improve.
>
> >  .../devicetree/bindings/sound/fsl,sai.yaml    | 215 ++++++++++++++++++
> >  .../devicetree/bindings/sound/fsl-sai.txt     |  95 --------
> >  2 files changed, 215 insertions(+), 95 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sai.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.txt
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > new file mode 100644
> > index 000000000000..3e3d99febd69
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > @@ -0,0 +1,215 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale Synchronous Audio Interface (SAI).
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description: |
> > +  The SAI is based on I2S module that used communicating with audio
> codecs,
> > +  which provides a synchronous audio interface that supports fullduplex
> > +  serial interfaces with frame synchronization such as I2S, AC97, TDM,
> and
> > +  codec/DSP interfaces.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: fsl,vf610-sai
> > +      - const: fsl,imx6sx-sai
> > +      - const: fsl,imx6ul-sai
> > +      - const: fsl,imx7ulp-sai
> > +      - const: fsl,imx8mq-sai
> > +      - const: fsl,imx8qm-sai
> > +      - const: fsl,imx8ulp-sai
>
> All these are an enum.
>

ok, I will update it.

>
> > +      - items:
> > +          - enum:
> > +              - fsl,imx8mm-sai
> > +              - fsl,imx8mn-sai
> > +              - fsl,imx8mp-sai
> > +          - const: fsl,imx8mq-sai
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: receive and transmit interrupt
> > +
> > +  dmas:
> > +    maxItems: 2
> > +
> > +  dma-names:
> > +    maxItems: 2
> > +
> > +  clocks:
> > +    items:
> > +      - description: The ipg clock for register access
> > +      - description: master clock source 0 (obsoleted)
> > +      - description: master clock source 1
> > +      - description: master clock source 2
> > +      - description: master clock source 3
> > +      - description: PLL clock source for 8kHz series
> > +      - description: PLL clock source for 11kHz series
> > +    minItems: 4
> > +
> > +  clock-names:
> > +    oneOf:
> > +      - items:
> > +          - const: bus
> > +          - const: mclk0
> > +          - const: mclk1
> > +          - const: mclk2
> > +          - const: mclk3
> > +          - const: pll8k
> > +          - const: pll11k
> > +        minItems: 4
> > +      - items:
> > +          - const: bus
> > +          - const: mclk1
> > +          - const: mclk2
> > +          - const: mclk3
> > +          - const: pll8k
> > +          - const: pll11k
> > +        minItems: 4
> > +
> > +  lsb-first:
> > +    $ref: /schemas/types.yaml#/definitions/flag
>
> Be consistent, so:
> type:boolean
>

ok, I will add it.

>
> > +    description: |
> > +      Configures whether the LSB or the MSB is transmitted
> > +      first for the fifo data. If this property is absent,
> > +      the MSB is transmitted first as default, or the LSB
> > +      is transmitted first.
> > +
> > +  big-endian:
> > +    description: |
> > +      required if all the SAI registers are big-endian rather than
> little-endian.
> > +    type: boolean
> > +
> > +  fsl,sai-synchronous-rx:
> > +    $ref: /schemas/types.yaml#/definitions/flag
>
> type:boolean
>
> > +    description: |
> > +      SAI will work in the synchronous mode (sync Tx with Rx) which
> means
> > +      both the transmitter and the receiver will send and receive data
> by
> > +      following receiver's bit clocks and frame sync clocks.
> > +
> > +  fsl,sai-asynchronous:
> > +    $ref: /schemas/types.yaml#/definitions/flag
>
> type:boolean
>
> > +    description: |
> > +      SAI will work in the asynchronous mode, which means both
> transmitter
> > +      and receiver will send and receive data by following their own
> bit clocks
> > +      and frame sync clocks separately.
> > +      If both fsl,sai-asynchronous and fsl,sai-synchronous-rx are
> absent, the
> > +      default synchronous mode (sync Rx with Tx) will be used, which
> means both
> > +      transmitter and receiver will send and receive data by following
> clocks
> > +      of transmitter.
> > +
> > +  fsl,dataline:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description: |
> > +      Configure the dataline. It has 3 value for each configuration
>
> and how many items in total?
>

I will add maxitems.

>
> > +    items:
> > +      items:
> > +        - description: format Default(0), I2S(1) or PDM(2)
> > +          enum: [0, 1, 2]
> > +        - description: dataline mask for 'rx'
> > +        - description: dataline mask for 'tx'
> > +
> > +  fsl,sai-mclk-direction-output:
> > +    $ref: /schemas/types.yaml#/definitions/flag
>
> boolean
>
> > +    description: |
> > +      SAI will output the SAI MCLK clock.
> > +
> > +  fsl,shared-interrupt:
> > +    $ref: /schemas/types.yaml#/definitions/flag
>
> boolean
> but the problem is it was not present in previous bindings and a change
> in pure conversion was not mentioned/explained in commit msg.
>
> it is already used by some dts, so add it,  I will mention it in commit
msg.


> > +    description: |
> > +      Interrupt is shared with other modules.
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
>
> Also a new property. If these are already used, please briefly explain
> in commit msg the changes to binding from pure conversion.
>
> it is already used by some dts, so add it,  I will mention it in commit
msg.


> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,vf610-sai
> > +    then:
> > +      properties:
> > +        dmas:
> > +          items:
> > +            - description: DMA controller phandle and request line for
> TX
> > +            - description: DMA controller phandle and request line for
> RX
> > +        dma-names:
> > +          items:
> > +            - const: tx
> > +            - const: rx
> > +    else:
> > +      properties:
> > +        dmas:
> > +          items:
> > +            - description: DMA controller phandle and request line for
> RX
> > +            - description: DMA controller phandle and request line for
> TX
> > +        dma-names:
> > +          items:
> > +            - const: rx
> > +            - const: tx
> > +  - if:
> > +      required:
> > +        - fsl,sai-asynchronous
> > +    then:
> > +      properties:
> > +        fsl,sai-synchronous-rx: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - dmas
> > +  - dma-names
> > +  - clocks
> > +  - clock-names
>
> sound-dai-cells not required and not present in vf610-sai? That's a bit
> unusual. Maybe it was missing?
>

it is optional,  some old dts nodes don't use it.


>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/vf610-clock.h>
> > +    sai2: sai@40031000 {
> > +        compatible = "fsl,vf610-sai";
> > +        reg = <0x40031000 0x1000>;
> > +        interrupts = <86 IRQ_TYPE_LEVEL_HIGH>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&pinctrl_sai2_1>;
> > +        clocks = <&clks VF610_CLK_PLATFORM_BUS>,
> > +                 <&clks VF610_CLK_SAI2>,
> > +                 <&clks 0>, <&clks 0>;
> > +        clock-names = "bus", "mclk1", "mclk2", "mclk3";
> > +        dma-names = "tx", "rx";
> > +        dmas = <&edma0 0 21>,
> > +               <&edma0 0 20>;
> > +        big-endian;
> > +        lsb-first;
> > +    };
> > +
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/imx8mm-clock.h>
> > +    sai1: sai@30010000 {
> > +        #sound-dai-cells = <0>;
> > +        compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
> > +        reg = <0x30010000 0x10000>;
>
> First compatible, then reg, then the rest of properties.
>

ok will update it.

best regards
wang shengjiu

>
> > +        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&clk IMX8MM_CLK_SAI1_IPG>,
> > +                 <&clk IMX8MM_CLK_DUMMY>,
> > +                 <&clk IMX8MM_CLK_SAI1_ROOT>,
> > +                 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
> > +        clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +        dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
> > +        dma-names = "rx", "tx";
> > +        fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
> > +    };
>
>
> Best regards,
> Krzysztof
>
