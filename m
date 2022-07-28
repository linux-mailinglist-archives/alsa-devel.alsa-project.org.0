Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD24584012
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 15:35:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5601A1652;
	Thu, 28 Jul 2022 15:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5601A1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659015341;
	bh=Qd+3NrW/5ygapHMOwOKc9DvD/koP0khL8lswvIMdi2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRy8Edxrgs7wgNsSluBgt8oEBMxc02Ucag81h0TRvM1kpD1mhnSr9XpxqX+HeN/DR
	 mpfHx4C0yepAA60RjtKNSx2W3proMnT03A5ZtXT+Quo3Mv9PGVWOceauEZE5f5jBFC
	 V+FPasjU0+A6GD1wfdu5LB1HM5H5XWfZ8GLXM5qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD57F80508;
	Thu, 28 Jul 2022 15:34:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8FE3F80430; Thu, 28 Jul 2022 15:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C717F800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 15:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C717F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dTOChVnH"
Received: by mail-lf1-x129.google.com with SMTP id y11so2875577lfs.6
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 06:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vFprzQhCWNMgHIihJj1JVcvvMx5ZjqFKAXuVDlib5JI=;
 b=dTOChVnH3kaY4IkqF2L6TrBjYtVrpgkAugRTrwyw7B2TW1Myqrlp+Tdw5LpPODZNXl
 wjGM4gg0N7sug1Ol01wIx5kkFRaezuopBtGA0N8IbCpNLsN6v5o1bczpdf8qpFarvdVQ
 eTG8JrdpqcVKjuPrvnRFZ6JGHeR38DakR9o0gedOd5XaFPL4OUH+EOYvXvdDV7KD19bk
 YgP1Vs86XzXvdiNWlYFOjnKhiMmmI1oN1Zgt9cVeWoJhhIJtvy4tbR69PXB7Nq8taEYR
 C4JMVftl/7r0pjr3DZTXr+FVLkHE9SUn92NcIk154/JvcdmUF94Vung77R6avVnuncH5
 BxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vFprzQhCWNMgHIihJj1JVcvvMx5ZjqFKAXuVDlib5JI=;
 b=f1c7GGh19OtBP+OXqbnBn93+WRUUxdgqQt2RUtViw16AdKu346CZehx9Jlttw0YDZ8
 ZVMpQ2lPL/3aaTd4eDIno9gdZ6XIzQVP/jrNhJmxllIxvSh2Z+cnqfUJwlpxNYPwFb3L
 onhOxgT4B3scGvyvH2wY/6BYbIrn4OcIzKT4gco/3Xxl69jt5o8Eqc4TfaIcX015d9E5
 r8sgn+6bPkQyLlkTBKzL57l6LEWU0qfGADExjyYWg5PFDW3/8lc/k9tLG/qM/0GZzcZl
 ji8AtXcSSE04a7jQEu7wk+OMmqjeeLG5Q4Q5IdfFv+i6FqgAL4oiOLqnkW17J7Khvisi
 5y2Q==
X-Gm-Message-State: AJIora+MYfgp6+gdVWviDPmG/PGjTtC4z8LN8UbYKQ+VR+syOh10sG3e
 KDhcX8OkJ7IfZfTfXOK5xXRoiY6TjZXPzTaG26Y=
X-Google-Smtp-Source: AGRyM1utJtd4BPBt49fwcViSQQ0GMGDf7EuClp2aSDAkeMjD030X3Sb3S8LjW23r/ymBHpVPxW/aGLTE+UKW3uplBqc=
X-Received: by 2002:a05:6512:32b2:b0:48a:c018:6e35 with SMTP id
 q18-20020a05651232b200b0048ac0186e35mr1889464lfe.67.1659015265935; Thu, 28
 Jul 2022 06:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <1658741467-32620-1-git-send-email-shengjiu.wang@nxp.com>
 <20220725202532.GA2626016-robh@kernel.org>
In-Reply-To: <20220725202532.GA2626016-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 28 Jul 2022 21:34:14 +0800
Message-ID: <CAA+D8AOj_0abrt97OC0ba9E8UG+LN7UinbW3yggkCzrKQcxEVQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl, sai: Convert format to json-schema
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org
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

On Tue, Jul 26, 2022 at 4:25 AM Rob Herring <robh@kernel.org> wrote:

> On Mon, Jul 25, 2022 at 05:31:07PM +0800, Shengjiu Wang wrote:
> > Convert the NXP SAI binding to DT schema format using json-schema.
> >
> > The Synchronous Audio Interface (SAI) provides an interface that
> > supports full-duplex serial interfaces with frame synchronization
> > formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,sai.yaml    | 175 ++++++++++++++++++
> >  .../devicetree/bindings/sound/fsl-sai.txt     |  95 ----------
> >  2 files changed, 175 insertions(+), 95 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sai.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.txt
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > new file mode 100644
> > index 000000000000..adcd77531eba
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > @@ -0,0 +1,175 @@
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
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      enum:
> > +        - fsl,vf610-sai
> > +        - fsl,imx6sx-sai
> > +        - fsl,imx6ul-sai
> > +        - fsl,imx7ulp-sai
> > +        - fsl,imx8mq-sai
> > +        - fsl,imx8qm-sai
> > +        - fsl,imx8mm-sai
> > +        - fsl,imx8mn-sai
> > +        - fsl,imx8mp-sai
> > +        - fsl,imx8ulp-sai
>
> You need to define the order and combinations which are valid.
>

ok, I will modify it.


>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: receive and transmit interrupt
> > +
> > +  dmas:
> > +    minItems: 2
> > +    maxItems: 2
> > +    description:
> > +      Must contain a list of pairs of references to DMA specifiers, one
> for
> > +      transmission, and one for reception.
>
> No need for generic descriptions.
>

ok, will remove the description.

>
> > +
> > +  dma-names:
> > +    minItems: 2
> > +    maxItems: 2
> > +    items:
> > +      enum:
> > +        - tx
> > +        - rx
>
> We really need to support either order?
>

yes, some dts use "tx", "rx", some dts use "rx", "tx". legacy issue.


>
> > +
> > +  clocks:
> > +    minItems: 4
> > +    items:
> > +      - description: The ipg clock for register access
> > +      - description: master clock source 0 (obsoleted, compatible for
> old dts)
> > +      - description: master clock source 1
> > +      - description: master clock source 2
> > +      - description: master clock source 3
> > +      - description: PLL clock source for 8kHz series
> > +      - description: PLL clock source for 11kHz series
> > +
> > +  clock-names:
> > +    minItems: 4
> > +    maxItems: 7
> > +    items:
> > +      enum:
> > +        - bus
> > +        - mclk0
> > +        - mclk1
> > +        - mclk2
> > +        - mclk3
> > +        - pll8k
> > +        - pll11k
>
> Again, need to define the order.
>

some dts already add "mclk0", but some dts no "mclk0".
Is there a way to handle this?


>
> > +
> > +  lsb-first:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      Configures whether the LSB or the MSB is transmitted
> > +      first for the fifo data. If this property is absent,
> > +      the MSB is transmitted first as default, or the LSB
> > +      is transmitted first.
> > +
> > +  big-endian:
> > +    $ref: /schemas/types.yaml#/definitions/flag
>
> Common property, already has a type and description.
>

ok, will remove this $ref.


>
> > +    description: |
> > +      Boolean property, required if all the SAI
> > +      registers are big-endian rather than little-endian.
> > +
> > +  fsl,sai-synchronous-rx:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present, indicating
> > +      that SAI will work in the synchronous mode (sync Tx
> > +      with Rx) which means both the transmitter and the
> > +      receiver will send and receive data by following
> > +      receiver's bit clocks and frame sync clocks.
> > +      fsl,sai-asynchronous and fsl,sai-synchronous-rx are exclusive.
> > +
> > +  fsl,sai-asynchronous:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present, indicating
>
> Schema already says it is boolean property, don't need that in plain
> text.
>

ok, will update

>
> > +      that SAI will work in the asynchronous mode, which
> > +      means both transmitter and receiver will send and
> > +      receive data by following their own bit clocks and
> > +      frame sync clocks separately.
> > +      If both fsl,sai-asynchronous and fsl,sai-synchronous-rx are
> absent, the
> > +      default synchronous mode (sync Rx with Tx) will be used, which
> means both
> > +      transmitter and receiver will send and receive data by following
> clocks
> > +      of transmitter.
> > +      fsl,sai-asynchronous and fsl,sai-synchronous-rx are exclusive.
> > +
> > +  fsl,dataline:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description: |
> > +      configure the dataline. it has 3 value for each configuration
> > +      first one means the type: I2S(1) or PDM(2)
>
> Looks like constraints:
>
> items:
>   items:
>     - description: ...
>       enum: [ 1, 2 ]
>     - ...
>     - ...
>
> ok, I will add it.


> > +      second one is dataline mask for 'rx'
> > +      third one is dataline mask for 'tx'.
> > +      for example: fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
>
> Perhaps add to the actual example.
>

ok.

best regards
wang shengjiu

>
> > +      it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
> > +      rx mask is 0xff, tx mask is 0x11 (dataline 1 and 5 enabled).
> > +
> > +  fsl,sai-mclk-direction-output:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present,
> > +      indicates that SAI will output the SAI MCLK clock.
> > +
> > +  fsl,shared-interrupt:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present,
> > +      indicates that interrupt is shared with other modules.
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - dmas
> > +  - dma-names
> > +  - clocks
> > +  - clock-names
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
> > +        dma-names = "rx", "tx";
> > +        dmas = <&edma0 0 20>,
> > +               <&edma0 0 21>;
> > +        big-endian;
> > +        lsb-first;
> > +    };
>
