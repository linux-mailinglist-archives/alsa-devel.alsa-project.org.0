Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25471333E02
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 14:36:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19FA177B;
	Wed, 10 Mar 2021 14:35:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19FA177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615383360;
	bh=FQF5QS++CZJrCRGa7pavMVC9d4r+n2DsU2loIWqae84=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cw+X8mhZqaBT5FquyMz5zVLFNxncISQptf+FxdK4//+Va7xMt8idm7lzFCKevOIcu
	 vulJ7gcAvbT7SaAjYMCdcc1BtGQy6oTdfPT6seepEDFiBlR1MkFdSTWJlGOQFNWg+R
	 IGf/zZgT2VRftW/QEeG3Nkuq39PIgUYTLg8gzi0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A0BCF8032C;
	Wed, 10 Mar 2021 14:33:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7422F802E7; Wed, 10 Mar 2021 14:33:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 827A3F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 14:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827A3F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bl9foFVu"
Received: by mail-qk1-x72a.google.com with SMTP id g185so16741292qkf.6
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 05:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xATgDCcvjbRfKhf77xL4HQKVKsZXwxoQX6S2FdKT3Oo=;
 b=bl9foFVuWm1U0ekqf1RlZ6JOgyHSxk20HsshPAc/WzmNMQkpqow9aJHwikbBuhzGt5
 jT1S7UCkiQhavHDTqfeS/7Pfr5/IePsLcFDW+xtC3oZT8urNRddeoTEDdbA1IepPMPk+
 opy2by+nNj9L9mcjh3ek7aNkXjf9fKBBKm2Jqgd5tMFigjlDZjBf2JhaP0RIxWNQxb2T
 /+3P/012KMPMRD/pd+hAGnOJoVnTUWu55a3JQpQ9tb6n/wtLR9H0ZJW4J2/1/FeMOnPA
 ckGsAVCt8a/1taU7nsP+U4gCNpvnevNcHi/hhmmnz1IViwSN4ngtMzFuAOU/mXVgcYBY
 nErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xATgDCcvjbRfKhf77xL4HQKVKsZXwxoQX6S2FdKT3Oo=;
 b=ev7d7RiYGVi3Mx1IJT4hPe/a46h+pE5L5Ch2R3cc9FVWcxMkemDjuJUMawPGknobHf
 bRxLpgi5F5P0JyzwJm8d9IyK26RPZOdj2IyCphX6bqyLAjVDqBL57z25ptMUm5rbOP+J
 7I0XgZpWIP/x8d3YgHvtgaoY/MkzhKG4LE/S2JMZ7Lwh7LZw7o/aowDl/HGxRv+LFL8J
 ROzh5aCpN4Y6z5tDgE34qLaNqY3uZSPAMl5usgN1fTek/yPQXEfvu/hnbvcRvTY0UCZF
 dzr7Ypi3BWGYa4lvNaDNmLvip5Sdrt2jKN25UL8zx2C+ysWWJzQoEf2vOdFf2ptRIonS
 Yo7g==
X-Gm-Message-State: AOAM533ybA3Vw1xFMS/MZcL1RvqPPKZUWZOKSNgOGqccYB/ura+ak1ul
 ov0sbkpxp/xP5Pma4SUCY0fkiG6BHgJwyEo+S+k=
X-Google-Smtp-Source: ABdhPJwsnjO9VMCLT+e6qoznWlE6iGQjtNS8w36gj0aKWvcdVWBIbKTu/A3JNEQWuep1O/iNA0xg755nBa0vz1K9AyA=
X-Received: by 2002:a05:620a:89d:: with SMTP id
 b29mr2468495qka.103.1615383202487; 
 Wed, 10 Mar 2021 05:33:22 -0800 (PST)
MIME-Version: 1.0
References: <1615209750-2357-1-git-send-email-shengjiu.wang@nxp.com>
 <1615209750-2357-4-git-send-email-shengjiu.wang@nxp.com>
 <20210310024834.GA1623179@robh.at.kernel.org>
In-Reply-To: <20210310024834.GA1623179@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 10 Mar 2021 21:33:11 +0800
Message-ID: <CAA+D8AM5nH+gwfas_=9gkzaegq4=4q2AfVybBnxM4xU3gOiF4w@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
 rpmsg cpu dai driver
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

Hi Rob

On Wed, Mar 10, 2021 at 10:49 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 08, 2021 at 09:22:27PM +0800, Shengjiu Wang wrote:
> > fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used
>
> Bindings describe h/w blocks, not drivers.

I will modify the descriptions. but here it is a virtual device.  the
mapping in real h/w is cortex M core, Cortex M core controls the SAI,
DMA interface. What we see from Linux side is a audio service
through rpmsg channel.

>
> > for getting the user's configuration from device tree and configure the
> > clocks which is used by Cortex-M core. So in this document define the
> > needed property.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 118 ++++++++++++++++++
> >  1 file changed, 118 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > new file mode 100644
> > index 000000000000..5731c1fbc0a6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,rpmsg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Audio RPMSG CPU DAI Controller
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description: |
> > +  fsl_rpmsg cpu dai driver is virtual driver for rpmsg audio, which doesn't
> > +  touch hardware. It is mainly used for getting the user's configuration
> > +  from device tree and configure the clocks which is used by Cortex-M core.
> > +  So in this document define the needed property.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx7ulp-rpmsg
> > +      - fsl,imx8mn-rpmsg
> > +      - fsl,imx8mm-rpmsg
> > +      - fsl,imx8mp-rpmsg
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock for register access
> > +      - description: Master clock
> > +      - description: DMA clock for DMA register access
> > +      - description: Parent clock for multiple of 8kHz sample rates
> > +      - description: Parent clock for multiple of 11kHz sample rates
> > +    minItems: 5
>
> If this doesn't touch hardware, what are these clocks for?

When the cortex-M core support audio service, these clock
needed prepared & enabled by ALSA driver.

>
> You don't need 'minItems' unless it's less than the number of 'items'.

Ok, I will remove this minItems.

>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ipg
> > +      - const: mclk
> > +      - const: dma
> > +      - const: pll8k
> > +      - const: pll11k
> > +    minItems: 5
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  fsl,audioindex:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description: Instance index for sound card in
> > +                 M core side, which share one rpmsg
> > +                 channel.
>
> We don't do indexes in DT. What's this numbering tied to?

I will remove it. it is not necessary

>
> > +
> > +  fsl,version:
>
> version of what?
>
> This seems odd at best.
>

I will remove it.  it is not necessary

> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2]
>
> You're going to update this with every new firmware version?
>
> > +    default: 2
> > +    description: The version of M core image, which is
> > +                 to make driver compatible with different image.
> > +
> > +  fsl,buffer-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: pre allocate dma buffer size
>
> How can you have DMA, this doesn't touch h/w?

The DMA is handled by M core image for sound playback
and capture. we need to allocated buffer in Linux side.
here just make the buffer size to be configurable.
>
> > +
> > +  fsl,enable-lpa:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: enable low power audio path.
> > +
> > +  fsl,rpmsg-out:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present, the transmitting function
> > +      will be enabled.
> > +
> > +  fsl,rpmsg-in:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present, the receiving function
> > +      will be enabled.
> > +
> > +  fsl,codec-type:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2]
> > +    default: 0
> > +    description: Sometimes the codec is registered by
> > +                 driver not by the device tree, this items
> > +                 can be used to distinguish codecs.
>
> How does one decide what value to use?

I will add more description:
0: dummy codec
1: WM8960 codec
2: AK4497 codec

>
> > +
> > +  audio-codec:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of the audio codec
>
> The codec is controlled from the Linux side?

yes.

>
> > +
> > +  memory-region:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the reserved memory nodes
> > +
> > +required:
> > +  - compatible
> > +  - fsl,audioindex
> > +  - fsl,version
> > +  - fsl,buffer-size
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    rpmsg_audio: rpmsg_audio {
> > +        compatible = "fsl,imx8mn-rpmsg";
> > +        fsl,audioindex = <0> ;
> > +        fsl,version = <2>;
> > +        fsl,buffer-size = <0x6000000>;
> > +        fsl,enable-lpa;
>
> How does this work? Don't you need somewhere to put the 'rpmsg' data?

The rpmsg data is not handled in this "rpmsg_audio" device, it is just to
prepare the resource for rpmsg audio function, the clock, the memory
the power...

The rpmsg data is handled in imx-pcm-rpmsg.c and imx-audio-rpmsg.c
These devices is registered by imx remoteproc driver.


I will update this document in v5

Best regards
Wang Shengjiu
