Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7431E6DC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 08:23:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D3715DC;
	Thu, 18 Feb 2021 08:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D3715DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613632987;
	bh=SrK3H7/k6JL8qb24r7JFGL9354EeMfOOpMMn/LBFLZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5TIvajMhKu3C54E0z2hBFMkeFXlSliOfRYhWBMhiKabmX+w211rbCIbNerd+a5Di
	 B+2newC7EGE4G6WLvIDVOHH8VFjzN8V5CxHRZJGeMQbmT2AC/4D6sR85Iy5uyDx4iA
	 RY55kY5Jbix4UQP7yYeCGXoaqlJre+V8R2zX4rQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB375F800E5;
	Thu, 18 Feb 2021 08:21:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25799F8015A; Thu, 18 Feb 2021 08:21:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 913ABF800E5
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 08:21:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 913ABF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mdpH+6Fo"
Received: by mail-qt1-x82d.google.com with SMTP id x3so747909qti.5
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 23:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4CuVJp6htN2y1/Vp8LtCaaMfaPH0Jo1ezQEtxgh7bk=;
 b=mdpH+6FobMXsdaZB85IHeW3r64Vs5Sg4rYLQ5bmOIOqagsYGgBIxrwD41jtF37xVZF
 BtJs+dLUNcu6JAbX1j9/qbszuIFb+yz8ZASbPKX3n89Fxf/rGShVkZWuBJBoV1a/qRKZ
 7N4Xfd/uaDo/51xC71PTE3rkOhCDmEcPCr+f5zHLqrMgICVf1fRFTzEY8XYaIJDNx6NL
 myjNbOtCm0jUeSJAyy4Uh47OoUEYGT/gUVX+24Iir1s6t1nRjUD2OLQGNHhqvzVxMrlh
 E3kqYoqHSH3tjsuk480W9oiBvOxuQ2wPk8Eil28J4j32OUTZSmZVQDhU7M5GAU9KJ2LP
 IG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4CuVJp6htN2y1/Vp8LtCaaMfaPH0Jo1ezQEtxgh7bk=;
 b=cR9rchdFAzCcfwcNjFZoxT0lQpYdMRUBhwn92X1TQh5qIdfedc4Qxz2I9CRZN8AFMu
 44tgyG25DliOCoAj7rEH319TrJIBfhFLiUBWJDsG8CDwNLfzYrs0TFrxhsORIp8flGep
 JPpm0LjcxKEBDWHlAgp1E8flDSVJHl5OSJNtMG0L7RYVnQg2mdumaGIZzhkC9ZlqE3dJ
 SoPXs0Abs7h/tSgNqHvFxxtN4rSAywGFs9pN5aKVy8qyGF0DVvwcOWhHeOe/hqLVCLBZ
 ay9UYuCZWI/BIhhuBSLZHiNbZzCozZCZVVoZKIecrXIUyLrQ8H4TmSxuNDJ9w54xOCFp
 1pFQ==
X-Gm-Message-State: AOAM531EfkWfPUzxmT6wyJ1JD27xBlRNYT03u0mEwPGaUr7DDoeJSgYc
 ccI8GN0OAxyEl/uzeo5k5cFSD7RoNOfXtx9zb+w=
X-Google-Smtp-Source: ABdhPJxYDxHIpH8R50b3lmetoPOD5LNUh7FIOIlLGHYseOIxe+kTql8AAKWjI5pZkC7bn2hCVj6VeG0ssJUHibmXYYY=
X-Received: by 2002:ac8:7b43:: with SMTP id m3mr2919646qtu.121.1613632881637; 
 Wed, 17 Feb 2021 23:21:21 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-4-git-send-email-shengjiu.wang@nxp.com>
 <20210210221252.GA2885308@robh.at.kernel.org>
In-Reply-To: <20210210221252.GA2885308@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Feb 2021 15:21:10 +0800
Message-ID: <CAA+D8APfd8trC8cFsT8k8G54nhrYDrwXxECx9RpDAgw3rco9DQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
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
 linuxppc-dev@lists.ozlabs.org
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

On Thu, Feb 11, 2021 at 6:13 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Feb 07, 2021 at 06:23:51PM +0800, Shengjiu Wang wrote:
> > fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used
> > for getting the user's configuration from device tree and configure the
> > clocks which is used by Cortex-M core. So in this document define the
> > needed property.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > new file mode 100644
> > index 000000000000..2d3ce10d42fc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > @@ -0,0 +1,80 @@
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
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx7ulp-rpmsg
> > +      - fsl,imx8mn-rpmsg
> > +      - fsl,imx8mm-rpmsg
> > +      - fsl,imx8mp-rpmsg
>
> rpmsg is a protocol. What's the h/w block?

On Linux side this driver is a virtual driver, it is running
on Arm Cortex-A core. The h/w block is controlled by
another core (cortex-M core). so this driver actually
doesn't touch any hardware, it just does configuration
for rpmsg channel.

>
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock for register access
> > +      - description: Master clock
> > +      - description: DMA clock for DMA register access
> > +      - description: Parent clock for multiple of 8kHz sample rates
> > +      - description: Parent clock for multiple of 11kHz sample rates
> > +    minItems: 5
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
> > +    description: instance index for rpmsg image
> > +
> > +  fsl,version:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: rpmsg image version index
>
> What are these 2 used for?

fsl,audioindex: As we may support multiple instance, for example
two sound card with one rpmsg channel, this is the instance index.

fsl,version: There are maybe different image running on M core, this
is the image version, different image has different function.


>
> > +
> > +  fsl,buffer-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: pre allocate dma buffer size
> > +
> > +  fsl,enable-lpa:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: enable low power audio path.
> > +
> > +  fsl,codec-type:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Sometimes the codec is registered by
> > +                 driver not the device tree, this items
> > +                 can be used to distinguish codecs
>
> 0-2^32 are valid values?

I should add range for it.

>
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
> > +        status = "okay";
>
> Don't show status in examples.

ok, will remove it.

>
> > +    };
> > --
> > 2.27.0
> >
