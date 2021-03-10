Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D813C3349AE
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 22:14:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 553321706;
	Wed, 10 Mar 2021 22:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 553321706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615410866;
	bh=O1zowkont3PqGMU4upFP7F2G1PaTifGVq/IuLfl8LfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Atayscc0YJEC9vfsCsLpvj2pSjNX69VPooDebgMRV9IXo3FAcfFoFbktR88Gn8gF3
	 RoDpx3/Dn70k1cVK4Zfvgq9VCstweNGNLqp8R9gIeeVFo0BeAxqCbCjhY/cSa6i4t+
	 sVjF1rFe3Us8qmJI1ZMESsd+A7WCQcYA1te9mZDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3AA8F801ED;
	Wed, 10 Mar 2021 22:12:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60482F801D8; Wed, 10 Mar 2021 22:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 425C3F8014E
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 22:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 425C3F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WYZBjRLa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C95A364FC8
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 21:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615410758;
 bh=O1zowkont3PqGMU4upFP7F2G1PaTifGVq/IuLfl8LfI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WYZBjRLaPFCYgPZH3zGjEHgk1sT+uabs8U7gSRR4/RrrkjocOzHHDeeRo22vEhFOr
 1Z+8Cs/SSteHRHcceIJHgTBb773fkYJpS+odrrBiWxkHBqeRTKDpCPTs6Ns4n7x560
 KCngergwPWIlvlN4vgQGiUDSH2zAUQM9riQUbpEEOAFP0keaF+DpLATbPa5WjLithE
 EGRRQT2692Fo0r+bp41Zb9lcCt/tddKpx5RzQ7u2WkYY3/gwdeLMWkNz7f/S1ffQ9T
 s4rDAZmArtQFMg4rgZH4mI92nGGI4mcmQznVOqAxoPNk7T7cTGiFCcFLZV0Fk/S8qm
 xarOwPb3Gahwg==
Received: by mail-ej1-f45.google.com with SMTP id r17so41590810ejy.13
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 13:12:37 -0800 (PST)
X-Gm-Message-State: AOAM5324tjiN3nWFVzycBjr8nvsh+pr3m1v5PmaRvxrAkkOSmKVz7aPa
 NAA9+f1r1mAZLXUK+UsrI/couiRkAfUK/WkH7A==
X-Google-Smtp-Source: ABdhPJzumylkbMTmY9AuyDkEfZXR+DTQ+UCDbYWG5q865YkCmk0XtY8s3w1z5tNQTkiFCzwujTIp5t8p8tKAUDabvtY=
X-Received: by 2002:a17:906:2312:: with SMTP id
 l18mr368275eja.468.1615410756158; 
 Wed, 10 Mar 2021 13:12:36 -0800 (PST)
MIME-Version: 1.0
References: <1615209750-2357-1-git-send-email-shengjiu.wang@nxp.com>
 <1615209750-2357-4-git-send-email-shengjiu.wang@nxp.com>
 <20210310024834.GA1623179@robh.at.kernel.org>
 <CAA+D8AM5nH+gwfas_=9gkzaegq4=4q2AfVybBnxM4xU3gOiF4w@mail.gmail.com>
In-Reply-To: <CAA+D8AM5nH+gwfas_=9gkzaegq4=4q2AfVybBnxM4xU3gOiF4w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Mar 2021 14:12:24 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+NcXHtDo+HEFVOEcGqYTx9Heo8dc_R5Nfz1Rr-sAu6YA@mail.gmail.com>
Message-ID: <CAL_Jsq+NcXHtDo+HEFVOEcGqYTx9Heo8dc_R5Nfz1Rr-sAu6YA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
 rpmsg cpu dai driver
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
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

On Wed, Mar 10, 2021 at 6:33 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> Hi Rob
>
> On Wed, Mar 10, 2021 at 10:49 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Mar 08, 2021 at 09:22:27PM +0800, Shengjiu Wang wrote:
> > > fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used
> >
> > Bindings describe h/w blocks, not drivers.
>
> I will modify the descriptions. but here it is a virtual device.  the
> mapping in real h/w is cortex M core, Cortex M core controls the SAI,
> DMA interface. What we see from Linux side is a audio service
> through rpmsg channel.

It's describing the h/w from the view of the OS. It's not important
that it's a Cortex-M, but how you interface to it whether that's
shared registers, mailbox, etc. And it's what resources the block uses
that the OS controls.

> > > for getting the user's configuration from device tree and configure the
> > > clocks which is used by Cortex-M core. So in this document define the
> > > needed property.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 118 ++++++++++++++++++
> > >  1 file changed, 118 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > > new file mode 100644
> > > index 000000000000..5731c1fbc0a6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > > @@ -0,0 +1,118 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/fsl,rpmsg.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP Audio RPMSG CPU DAI Controller
> > > +
> > > +maintainers:
> > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > > +
> > > +description: |
> > > +  fsl_rpmsg cpu dai driver is virtual driver for rpmsg audio, which doesn't
> > > +  touch hardware. It is mainly used for getting the user's configuration
> > > +  from device tree and configure the clocks which is used by Cortex-M core.
> > > +  So in this document define the needed property.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx7ulp-rpmsg
> > > +      - fsl,imx8mn-rpmsg
> > > +      - fsl,imx8mm-rpmsg
> > > +      - fsl,imx8mp-rpmsg
> > > +
> > > +  model:
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    description: User specified audio sound card name
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Peripheral clock for register access
> > > +      - description: Master clock
> > > +      - description: DMA clock for DMA register access
> > > +      - description: Parent clock for multiple of 8kHz sample rates
> > > +      - description: Parent clock for multiple of 11kHz sample rates
> > > +    minItems: 5
> >
> > If this doesn't touch hardware, what are these clocks for?
>
> When the cortex-M core support audio service, these clock
> needed prepared & enabled by ALSA driver.
>
> >
> > You don't need 'minItems' unless it's less than the number of 'items'.
>
> Ok, I will remove this minItems.
>
> >
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: ipg
> > > +      - const: mclk
> > > +      - const: dma
> > > +      - const: pll8k
> > > +      - const: pll11k
> > > +    minItems: 5
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  fsl,audioindex:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [0, 1]
> > > +    default: 0
> > > +    description: Instance index for sound card in
> > > +                 M core side, which share one rpmsg
> > > +                 channel.
> >
> > We don't do indexes in DT. What's this numbering tied to?
>
> I will remove it. it is not necessary
>
> >
> > > +
> > > +  fsl,version:
> >
> > version of what?
> >
> > This seems odd at best.
> >
>
> I will remove it.  it is not necessary
>
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [1, 2]
> >
> > You're going to update this with every new firmware version?
> >
> > > +    default: 2
> > > +    description: The version of M core image, which is
> > > +                 to make driver compatible with different image.
> > > +
> > > +  fsl,buffer-size:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: pre allocate dma buffer size
> >
> > How can you have DMA, this doesn't touch h/w?
>
> The DMA is handled by M core image for sound playback
> and capture. we need to allocated buffer in Linux side.
> here just make the buffer size to be configurable.

Do we set audio buffer sizes for other audio devices in DT? If not,
why is this special? If so, why is it not common.

> > > +  fsl,enable-lpa:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description: enable low power audio path.
> > > +
> > > +  fsl,rpmsg-out:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description: |
> > > +      This is a boolean property. If present, the transmitting function
> > > +      will be enabled.
> > > +
> > > +  fsl,rpmsg-in:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description: |
> > > +      This is a boolean property. If present, the receiving function
> > > +      will be enabled.
> > > +
> > > +  fsl,codec-type:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [0, 1, 2]
> > > +    default: 0
> > > +    description: Sometimes the codec is registered by
> > > +                 driver not by the device tree, this items
> > > +                 can be used to distinguish codecs.
> >
> > How does one decide what value to use?
>
> I will add more description:
> 0: dummy codec
> 1: WM8960 codec
> 2: AK4497 codec

I assume the last 2 cases have nodes in DT (pointed to by
'audio-codec'), so this is redundant.

> > > +
> > > +  audio-codec:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: The phandle of the audio codec
> >
> > The codec is controlled from the Linux side?
>
> yes.
>
> >
> > > +
> > > +  memory-region:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle to the reserved memory nodes
> > > +
> > > +required:
> > > +  - compatible
> > > +  - fsl,audioindex
> > > +  - fsl,version
> > > +  - fsl,buffer-size
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    rpmsg_audio: rpmsg_audio {
> > > +        compatible = "fsl,imx8mn-rpmsg";
> > > +        fsl,audioindex = <0> ;
> > > +        fsl,version = <2>;
> > > +        fsl,buffer-size = <0x6000000>;
> > > +        fsl,enable-lpa;
> >
> > How does this work? Don't you need somewhere to put the 'rpmsg' data?
>
> The rpmsg data is not handled in this "rpmsg_audio" device, it is just to
> prepare the resource for rpmsg audio function, the clock, the memory
> the power...
>
> The rpmsg data is handled in imx-pcm-rpmsg.c and imx-audio-rpmsg.c
> These devices is registered by imx remoteproc driver.

Then what is 'memory-region' for? You need that, a mailbox, or ???
somewhere in DT.

Rob
