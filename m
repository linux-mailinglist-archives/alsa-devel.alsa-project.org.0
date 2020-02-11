Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC511597E9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 19:15:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 722A9165F;
	Tue, 11 Feb 2020 19:14:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 722A9165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581444917;
	bh=aL4U2NIsxHOWXhljrOZCliHgofRNS5snv4v2XlewECU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEVnU4qsQdp5bpXGYlFFPO01jU5A0f27nOfmQ6Hb3Fp2wWdQeSftCmwOnYV9Ug/gy
	 Q5vgDUcuiYESYT/cP6DwHdsmOu2UJlXamxOhlHpN4N13vlo4f3k2ihjHw02tLzZW25
	 sjfEsd25ysiKN2ykkvgsevSzYgIJI8v2Iqn/6P6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC86DF800E7;
	Tue, 11 Feb 2020 19:13:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F05FBF80145; Tue, 11 Feb 2020 19:13:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 131F4F800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 19:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 131F4F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vKBQdf7s"
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98D882086A
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581444803;
 bh=3riax90X3cB1LTgwegasbmXkNo83BsShz5HQj87AsSg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vKBQdf7sq8abEa5O+/jfAR/LrlO09VRq0Z8A4pR8a4/sVqTwKbBjz0b+jF4mKUjJz
 cbaIxk3EQNVW6V0EEQQtrPeEUrmfiWllfOzuhSsW7m9ur/R0BZ0zlVs25gOQg+kvxl
 W33tqbKqHX0dSPBeI6mowsfPGrsH3gclSmBnKwmI=
Received: by mail-qk1-f173.google.com with SMTP id v2so6103521qkj.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 10:13:23 -0800 (PST)
X-Gm-Message-State: APjAAAUEjjmQX14x7tLWZrEd1ExXXQYtKMe+o/QwyagBIf+RXNJLm93C
 6GqUfo5MfCOwGzNg3MP1G+UwJ5nyvyebgIp9WA==
X-Google-Smtp-Source: APXvYqwRNNy+ur96m7q6c3i3fkxvIT/TIzcSWdajVPSiLV011854FY1lIs7P3ivinO4cTTgIv5XuOleMFRvHINxetz0=
X-Received: by 2002:a37:6042:: with SMTP id u63mr6765137qkb.119.1581444802651; 
 Tue, 11 Feb 2020 10:13:22 -0800 (PST)
MIME-Version: 1.0
References: <20200130135040.22575-1-olivier.moysan@st.com>
 <20200206182125.GA23274@bogus>
 <843b9213-99c0-ec9f-bde6-4745a9cb6221@st.com>
In-Reply-To: <843b9213-99c0-ec9f-bde6-4745a9cb6221@st.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Feb 2020 12:13:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJECUKkvZ1rt=4p5sMku3id973drEqLDvMZp8Fr+wx9tA@mail.gmail.com>
Message-ID: <CAL_JsqJECUKkvZ1rt=4p5sMku3id973drEqLDvMZp8Fr+wx9tA@mail.gmail.com>
To: Olivier MOYSAN <olivier.moysan@st.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: dt-bindings: stm32: convert sai to
	json-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Feb 7, 2020 at 7:42 AM Olivier MOYSAN <olivier.moysan@st.com> wrote:
>
> Hi Rob,
>
> On 2/6/20 7:21 PM, Rob Herring wrote:
> > On Thu, Jan 30, 2020 at 02:50:40PM +0100, Olivier Moysan wrote:
> >> Convert the STM32 SAI bindings to DT schema format using json-schema.
> >>
> >> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> >> ---
> >>   .../bindings/sound/st,stm32-sai.txt           | 107 ----------
> >>   .../bindings/sound/st,stm32-sai.yaml          | 193 ++++++++++++++++++
> >>   2 files changed, 193 insertions(+), 107 deletions(-)
> >>   delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.txt
> >>   create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> >
> >> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> >> new file mode 100644
> >> index 000000000000..33dca007fc86
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> >> @@ -0,0 +1,193 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/st,stm32-sai.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: STMicroelectronics STM32 Serial Audio Interface (SAI)
> >> +
> >> +maintainers:
> >> +  - Olivier Moysan <olivier.moysan@st.com>
> >> +
> >> +description:
> >> +  The SAI interface (Serial Audio Interface) offers a wide set of audio
> >> +  protocols as I2S standards, LSB or MSB-justified, PCM/DSP, TDM, and AC'97.
> >> +  The SAI contains two independent audio sub-blocks. Each sub-block has
> >> +  its own clock generator and I/O lines controller.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - st,stm32f4-sai
> >> +      - st,stm32h7-sai
> >> +
> >> +  reg:
> >> +    items:
> >> +      - description: Base address and size of SAI common register set.
> >> +      - description: Base address and size of SAI identification register set.
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +
> >> +  ranges:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  resets:
> >> +    maxItems: 1
> >> +
> >> +  "#address-cells":
> >> +    const: 1
> >> +
> >> +  "#size-cells":
> >> +    const: 1
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description: pclk feeds the peripheral bus interface.
> >> +      - description: x8k, SAI parent clock for sampling rates multiple of 8kHz.
> >> +      - description: x11k, SAI parent clock for sampling rates multiple of 11.025kHz.
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      enum: [ pclk, x8k, x11k ]
> >> +    minItems: 3
> >> +    maxItems: 3
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - ranges
> >> +  - "#address-cells"
> >> +  - "#size-cells"
> >> +  - clocks
> >> +  - clock-names
> >> +
> >> +patternProperties:
> >> +  "^audio-controller@[0-9a-f]+$":
> >> +    type: object
> >> +    description:
> >> +      Two subnodes corresponding to SAI sub-block instances A et B
> >> +      can be defined. Subnode can be omitted for unsused sub-block.
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        description: Compatible for SAI sub-block A or B.
> >> +        enum:
> >> +          - st,stm32-sai-sub-a
> >> +          - st,stm32-sai-sub-b
> > pattern: 'st,stm32-sai-sub-[ab]'
> I will change this in v2
> >> +
> >> +      "#sound-dai-cells":
> >> +        const: 0
> >> +
> >> +      reg:
> >> +        maxItems: 1
> >> +
> >> +      clocks:
> >> +        items:
> >> +          - description: sai_ck clock feeding the internal clock generator.
> >> +          - description: MCLK clock from a SAI set as master clock provider.
> >> +        minItems: 1
> >> +        maxItems: 2
> >> +
> >> +      clock-names:
> >> +        items:
> >> +          - const: sai_ck
> >> +          - const: MCLK
> >> +        minItems: 1
> >> +        maxItems: 2
> >> +
> >> +      dmas:
> >> +        items:
> >> +          - description: SAI sub-block is configured as a capture DAI.
> >> +          - description: SAI sub-block is configured as a playback DAI.
> >> +        minItems: 1
> >> +        maxItems: 1
> > This is defining that dmas has 2 entries, but then limits it to the 1st
> > entry only.
> dma can be either "rx" or "tx", but not both.
> Maybe, the following syntax is more appropriate:
>
>        dmas:
>          maxItems: 1
>
>        dma-names:
>          description: |
>            rx: SAI sub-block is configured as a capture DAI.
>            tx: SAI sub-block is configured as a playback DAI.
>          items:
>            - enum: [ rx, tx ]

Yes, but for a single entry you can drop 'items'.

>
> >> +
> >> +      dma-names:
> >> +        items:
> >> +          - enum: [ rx, tx ]
> >> +
> >> +      st,sync:
> >> +        description:
> >> +          Configure the SAI sub-block as slave of another SAI sub-block.
> >> +          By default SAI sub-block is in asynchronous mode.
> >> +          Must contain the phandle and index of the SAI sub-block providing
> >> +          the synchronization.
> >> +        allOf:
> >> +          - $ref: /schemas/types.yaml#definitions/phandle-array
> >> +          - maxItems: 1
> >> +
> >> +      st,iec60958:
> >> +        description:
> >> +          If set, support S/PDIF IEC6958 protocol for playback.
> >> +          IEC60958 protocol is not available for capture.
> >> +          By default, custom protocol is assumed, meaning that protocol is
> >> +          configured according to protocol defined in related DAI link node,
> >> +          such as i2s, left justified, right justified, dsp and pdm protocols.
> >> +        allOf:
> >> +          - $ref: /schemas/types.yaml#definitions/flag
> >> +
> >> +      "#clock-cells":
> >> +        description: Configure the SAI device as master clock provider.
> >> +        const: 0
> >> +
> >> +    required:
> >> +      - compatible
> >> +      - "#sound-dai-cells"
> >> +      - reg
> >> +      - clocks
> >> +      - clock-names
> >> +      - dmas
> >> +      - dma-names
> >         additionalProperties: false.
> >
> >> +
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: st,stm32f4-sai
> >> +
> >> +  - then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 2
> >> +          maxItems: 2
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            enum: [ x8k, x11k ]
> > Define the order.
> >
> Do you mean, adding in clocks property  :
>            items:
>              - description: x8k, SAI parent clock for sampling rates
> multiple of 8kHz.
>              - description: x11k, SAI parent clock for sampling rates
> multiple of 11.025kHz.

That too, but for clocks you need:

clock-names:
  items:
    - const: x8k
    - const: x11k

> But, it seems to me that this is redundant with previous definition of
> clocks property.

It's not because it's clocks in different positions.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
