Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 648605879C6
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 11:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A48E5843;
	Tue,  2 Aug 2022 11:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A48E5843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659432152;
	bh=8KQRPwX2/e9GQVQqr4Ak11SX41i0Va0oMUY6xdMkKZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ciH/Zdec27yu91KdqZhN5XkNFZrNlnzGHoYCFCFXmKRdjuzlZKQ3QoQVvF940BH2i
	 efT4DdpBINCAhE59SiUYA3TfL1ZwnuVqJMVmeYpJdp3sWfhR662wYWhQaq8znKH0E8
	 4m6t5Ya6xLn+TpU634h/q9DLnHtxUvdVWB91O2co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31DB7F8014B;
	Tue,  2 Aug 2022 11:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B15CAF8026D; Tue,  2 Aug 2022 11:21:32 +0200 (CEST)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 943E8F8014B
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 11:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 943E8F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RmtA8GO3"
Received: by mail-lf1-x129.google.com with SMTP id w15so21032915lft.11
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SJncKY7BK7Q1rK2/sY+S5nkBUdcsSpyj/0qNEgtHOZo=;
 b=RmtA8GO3jazEWnCh46k8FDInZFSGXkgqCxOnENhER3+VWKFKVH9VeIxQpiEuVQSpsh
 GD10aG3QfeM25pHWV9WTcLrKgDRC+oNr1rF5uBl7G32sG+yj4WacU35g3c9txtpxAXz9
 eA8lgrKntJoIvcqd6+IUdnEyXTGqKbzPKSpZSI7ASXM6yofn1NzpwSPQ3EaK1zh+lx1P
 CpTWd8Qvd4RNOVQtYp5v1VxT2Tj1I8EIl5FBF0UwWQUORZdiefQnUPeYGWItaSg0vObi
 QW3WX9sEZgdssHshPCvwlkewxyZUJRyVmF1sVgxxiUyGRpmaa4f10LnMN6c/g5xWY/Az
 8grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SJncKY7BK7Q1rK2/sY+S5nkBUdcsSpyj/0qNEgtHOZo=;
 b=Op6vJ2+2ZIQXbKK0RfrUCQ1C00p3hTO19E+XKsGgUgWqtemEd5R4BFKH8HxxjWPsOb
 U/j3ybFOzPD/Y7MMN4ijHULbAvMxlpWF48njgefMnuGca51Xz/lm4/MO9HI0O4I+ZeuC
 3Elli/5Swnm9OlXglj8rL7RkdoN0hu2DGU7J4CV11KmwunF0aDh3KTejQOFSU4xW/uJr
 gY67gjnC6N4V/YTzilpl8kexpWjUiL0SSDgWIumTdBDjAecy+iLLbPCAwdcmhlcDHN1N
 2/pxDxQX50Lue5qsG2NcQMrEYrTkhsLO/qRNhdGH6y2I46bprWfxbEKvE9Br++kiCfP6
 rtWg==
X-Gm-Message-State: AJIora8v6OwEvfKovvpEGwKEB6bi/NcrVmjaWloguH9mxBYWDUdnpSNx
 NxeOgpQPTcJiYFIBNRcbY5P7GcImSrVzerD2yto=
X-Google-Smtp-Source: AGRyM1sTowoi9Fpa69durdk0CFQlSTW2SdlSS4WfXh4SpLKHoATsIfjCUHB8v/9pDt8BVfYwe2Qmch70uZpKOVbfs2s=
X-Received: by 2002:a05:6512:1153:b0:48a:201d:5f77 with SMTP id
 m19-20020a056512115300b0048a201d5f77mr6751872lfg.280.1659432084486; Tue, 02
 Aug 2022 02:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <1659060632-4880-1-git-send-email-shengjiu.wang@nxp.com>
 <ba6bc0e8-8b64-aa7f-241e-1e88dd9cfaa5@linaro.org>
In-Reply-To: <ba6bc0e8-8b64-aa7f-241e-1e88dd9cfaa5@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 2 Aug 2022 17:21:13 +0800
Message-ID: <CAA+D8AOfxbv74xoeQ3TP7NkUeduRu=Ez983MDw-KNDBuu=5yxw@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: fsl,
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

On Tue, Aug 2, 2022 at 3:26 PM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 29/07/2022 04:10, Shengjiu Wang wrote:
> > Convert the NXP SAI binding to DT schema format using json-schema.
> >
> > The Synchronous Audio Interface (SAI) provides an interface that
> > supports full-duplex serial interfaces with frame synchronization
> > formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> >
> > Beside conversion, 'fsl,shared-interrupt' and '#sound-dai-cells'
> > are added for they are already used by some dts.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v3
> > - address comments from Krzysztof
> >
> > changes in v2
> > - fix exclusive property issue
> > - fix order issue of compatible, clock-names, dma-names
> >
> >  .../devicetree/bindings/sound/fsl,sai.yaml    | 221 ++++++++++++++++++
> >  .../devicetree/bindings/sound/fsl-sai.txt     |  95 --------
> >  2 files changed, 221 insertions(+), 95 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sai.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.txt
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > new file mode 100644
> > index 000000000000..86ee46755b0c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > @@ -0,0 +1,221 @@
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
> > +      - enum:
> > +          - fsl,vf610-sai
> > +          - fsl,imx6sx-sai
> > +          - fsl,imx6ul-sai
> > +          - fsl,imx7ulp-sai
> > +          - fsl,imx8mq-sai
> > +          - fsl,imx8qm-sai
> > +          - fsl,imx8ulp-sai
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
> > +    description: |
> > +      Configures whether the LSB or the MSB is transmitted
> > +      first for the fifo data. If this property is absent,
> > +      the MSB is transmitted first as default, or the LSB
> > +      is transmitted first.
> > +    type: boolean
>
> The type: boolean goes instead of $ref, not additionally to it. Just
> like below...
>
>
Does this mean that I should remove the $ref  for all the boolean flags?
like fsl,sai-synchronous-rx...

best regards
Wang shengjiu

> +
> > +  big-endian:
> > +    description: |
> > +      required if all the SAI registers are big-endian rather than
> little-endian.
> > +    type: boolean
>
> ... be consistent.
>
> > +
> > +  fsl,sai-synchronous-rx:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      SAI will work in the synchronous mode (sync Tx with Rx) which
> means
> > +      both the transmitter and the receiver will send and receive data
> by
> > +      following receiver's bit clocks and frame sync clocks.
> > +    type: boolean
> > +
>
> Best regards,
> Krzysztof
>
