Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D821584287
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 17:02:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F36E1651;
	Thu, 28 Jul 2022 17:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F36E1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659020559;
	bh=d1ZVB7XdgXUdZiAmhPm2qTiqvkaohE845c3iWjDIy50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=at35hs1GNUGe1bZtOckSB4GEJGOe9bWb6LQq5AblP00Lw+vjjWYVKl+jPCYK7XZwj
	 lB9UK4ywxHI8kjdbijV2xDzkN98bFpgC/D9e4+A34BdxTdgLLw7L96O+Ks0uDEkZcw
	 hCog8hSp9Yos+rEZnQojC7ZGS+Cp/tkhXXCu20xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08028F80508;
	Thu, 28 Jul 2022 17:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 740E8F804EC; Thu, 28 Jul 2022 17:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC55F8015B
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 17:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC55F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HvAuTWOn"
Received: by mail-lj1-x22b.google.com with SMTP id s14so2256071ljh.0
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 08:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4f0xgD5fveSSXZCk+Yt/Vp34xtKjUL2ZhI6riu52Vg=;
 b=HvAuTWOnIIi5KmU7BfasbqBnFQbu+dVkpeKGiXsUnR2Q2sJ1FVL9RvWNGo3x3GjbbF
 pExk1O+aNnRvLbKHvYmQTZIYs1DaOIDHIvU7pIhMtAIUOzuTzMEwc/SNTXY5Tr+Gv6Lz
 M9SylS8S73DeqO86KalzwkxmfCv4A6WecIJNPjrCay16yx/L28Pm61s9uoG1PDDZKlZu
 FFROLXKkRwukQ+9XBq97ZsRDcZ/NWgegG6qWsHAyK/XFz5QVucanW+bZSKmrc9LrPNbL
 6BkuNaKyKigCpBqdGuvEPk1f5ZKKylfUF5OV61KKLAzaKU7FwfJlli8QufdldhFfE4pH
 BXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4f0xgD5fveSSXZCk+Yt/Vp34xtKjUL2ZhI6riu52Vg=;
 b=UZgpqmYZtZ8VofUHzJORSnQZPIq1V+vQK2p1T0FxcUMghlJ+A4dmLLIid7Y+PrYILO
 +dazJPXykqBKjefFXVOmh8mGsrWlQaa3ZW5T44oqX3Gn+xtE6CLYPyd8xfBxhqpXOxlX
 zXddZhU4YwhyjNKhlaaJje/J8OUnVYZI+DgzLAu5pbVKRVeWS9LVwPYhpGN5qekfrQJH
 jVxAmsRccJ8H8PH0AxdxKV7Rpb2Bf/SunsAArMNN9Lg1M3DxNeOaEMEEHRxyXy7Uw6Kd
 qNNvrzPt/XR9qlODXpGS7g/kQ+Tls9hS3VDJdQIGpuU47lAeGE3WU6pRRZttGJyvG9aT
 T95w==
X-Gm-Message-State: AJIora8NzTz1aXNJnSn0SRJT7upoU/0JzYBTeQTGcG6WJ8qz/rJF07+k
 AoSMe6OXimeNbtUAaqvi/DpjeeRvWiWXS8jEu+o=
X-Google-Smtp-Source: AGRyM1sfYv3IXfQLxpy42AB8v0QgTbsuQ5dzVFSBHRQHHHy2D76mtP/xlWlWrm4ZWcYa5YQz1Bf/wpMtB0Ah1vtwHUY=
X-Received: by 2002:a05:651c:10aa:b0:25e:7a1:b126 with SMTP id
 k10-20020a05651c10aa00b0025e07a1b126mr6890820ljn.432.1659020489032; Thu, 28
 Jul 2022 08:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <1658741467-32620-1-git-send-email-shengjiu.wang@nxp.com>
 <e81d657f-edea-4c5d-e546-e3bdb379c659@linaro.org>
In-Reply-To: <e81d657f-edea-4c5d-e546-e3bdb379c659@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 28 Jul 2022 23:01:16 +0800
Message-ID: <CAA+D8AP3o-sRtzBEQEPEOVXW2vACf38fWy=jJ0AGrxTrO=W4yA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl, sai: Convert format to json-schema
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

On Tue, Jul 26, 2022 at 4:05 AM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 25/07/2022 11:31, Shengjiu Wang wrote:
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
>
> You allow anything here, so it's not acceptable. This has to be strictly
> defined.
>

ok, I will update it.

>
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
>
> No need for minItems.
>

ok


>
> > +    maxItems: 2
> > +    description:
> > +      Must contain a list of pairs of references to DMA specifiers, one
> for
> > +      transmission, and one for reception.
>
> Skip description and instead describe items like you did for interrupts.
>

ok, will update it

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
> No, this has to be strictly defined, so items with tx and rx (or
> reversed order).
>

two kind of order is needed, seems I need to use
if - then -else


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
> Ditto. minItems:4 could stay, but the rest is not correct. This has to
> be strictly ordered/defined list.
>

ok, I will update it,  also I need two orders.

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
> > +    description: |
> > +      Boolean property, required if all the SAI
> > +      registers are big-endian rather than little-endian.
> > +
> > +  fsl,sai-synchronous-rx:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property.
>
> Skip such description, it's useless... Further as well.
>
> If present, indicating
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
> > +      second one is dataline mask for 'rx'
> > +      third one is dataline mask for 'tx'.
> > +      for example: fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
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
>
> You need to express the exclusiveness of properties.
> allOf:if:required:then:... would work, like here:
>
> https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155
>
> Yes,  that is I wanted

best regards
wang shengjiu

>
> Best regards,
> Krzysztof
>
