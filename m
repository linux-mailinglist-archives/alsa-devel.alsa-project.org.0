Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61755B509
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 04:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3ACF847;
	Mon, 27 Jun 2022 04:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3ACF847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656295295;
	bh=QskCU+raZjJmxXDZHmbExAH6tl+71zCrMbaJIp6AG5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VR4v9KGZvfTil8a7UD8R/f4oD8eGnyifLqQ5IFyyAziKvMs1Ia/C3VO/ncAhjQeY8
	 neB5bARlGVOX9bXEeu+kERr8YIXa6kUaxT8dOBXI43yupopPoTDZUZv9yM3k/CB7zH
	 OO/5871RlChgI59ek5RS4L225Y9FRtYugi72sOSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DEC6F8028D;
	Mon, 27 Jun 2022 04:00:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E16C0F8028B; Mon, 27 Jun 2022 04:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2A1BF80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 04:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2A1BF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BikT1a3v"
Received: by mail-lf1-x12e.google.com with SMTP id a4so561577lfm.0
 for <alsa-devel@alsa-project.org>; Sun, 26 Jun 2022 19:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YK+dyaG22RZDCG4t8f5wSYML0JgFESmoF1o5ENnHmFk=;
 b=BikT1a3vzGz0wDAdtSLh+JuBNkI7WORV3aVMUT4m82IWoEoYgQHCixe62UTu5qMIUa
 g0qWldF+vZ2YyNjSm8xSJerS45z2XXBJ+t7qcs+C0QxsdkEAzJ1m0AFkLbzfe7TxLUVJ
 JfEvyxbFN2Hd48LaPcuLLIIOV+20YjaqdpE6u2yMmg1KdcoAbpfVp8yXCBff//1i5ujA
 wYEiFhAcLqRsiZQSWiZYWaTlXFajpQ0l0BEdzbKdVzhQAC5h16e/jLdy6V0xrrUrbUdV
 btfxS3zmsq95MHA/9Z2aGpQ3Vbria4EhlgdyCS06I0C/kB153mVL6pbsr0wyEUpPu3I8
 Dohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YK+dyaG22RZDCG4t8f5wSYML0JgFESmoF1o5ENnHmFk=;
 b=etLb9HflLSEAjLpLX1McbpMD3pxD+Pn/DmL+7XeJWvdPl1igfiVxEAamRFe3AGyE6a
 s2sXyZk3S2iDmY5gBGwFwH5c8GHIXieAhOsQWY40W6S+ocN3Z43AfU5drAnzkHtd/XMR
 tVPal3XV8/6pidU7YhzY2EigRSjydsn/LUe6AvNvE6ieAIIxyvsDqA69c1ZJ01UiL/kU
 HjCumnMYEVSpMIkaPTy72HXowtSu9zuFOjsa9WhMAZwpFU2hZaXa8ad+gKhiYFgA2m9e
 G3WjIAdpE197TtB/b47cmcBYX7/1Wi8jDE97hYvuRi5Z1e2ENCP2TlVS8/9NJaYccVi0
 A/Kg==
X-Gm-Message-State: AJIora/PCRJR6ntOoiOXy6bVecwkNcubDrIxDiHKVvTJAN748z1H5Bxq
 G4DDFtpPNvn8DmwNG1PGm4erkWh7kD1//lBxdq0=
X-Google-Smtp-Source: AGRyM1vXMBITotT3SwvaOceIYgh3QfK1JSazaOLDymUz/lthDHUQcpyJA4jjrCbA06BbtZvMwVxBBls0c3MZlQoxh9U=
X-Received: by 2002:ac2:4c19:0:b0:47f:9f39:768c with SMTP id
 t25-20020ac24c19000000b0047f9f39768cmr6729809lfq.285.1656295225681; Sun, 26
 Jun 2022 19:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <1655980125-24141-1-git-send-email-shengjiu.wang@nxp.com>
 <ac726845-01ec-4f35-7197-4c52fc483644@linaro.org>
In-Reply-To: <ac726845-01ec-4f35-7197-4c52fc483644@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 27 Jun 2022 10:00:14 +0800
Message-ID: <CAA+D8ANyf-k1UO5LOCkSgke0KDcYkAYM-i+RzNL_Tt2w6XmdMQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,
 micfil: Convert format to json-schema
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

On Sat, Jun 25, 2022 at 12:01 AM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 23/06/2022 12:28, Shengjiu Wang wrote:
> > Convert the NXP MICFIL binding to DT schema format using json-schema.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,micfil.txt  | 33 ---------
> >  .../devicetree/bindings/sound/fsl,micfil.yaml | 73 +++++++++++++++++++
> >  2 files changed, 73 insertions(+), 33 deletions(-)
> >  delete mode 100644
> Documentation/devicetree/bindings/sound/fsl,micfil.txt
> >  create mode 100644
> Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.txt
> b/Documentation/devicetree/bindings/sound/fsl,micfil.txt
> > deleted file mode 100644
> > index 1ea05d4996c7..000000000000
> > --- a/Documentation/devicetree/bindings/sound/fsl,micfil.txt
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -NXP MICFIL Digital Audio Interface (MICFIL).
> > -
> > -The MICFIL digital interface provides a 16-bit audio signal from a PDM
> > -microphone bitstream in a configurable output sampling rate.
> > -
> > -Required properties:
> > -
> > -  - compatible               : Compatible list, contains
> "fsl,imx8mm-micfil"
> > -                       or "fsl,imx8mp-micfil"
> > -
> > -  - reg                      : Offset and length of the register set
> for the device.
> > -
> > -  - interrupts               : Contains the micfil interrupts.
> > -
> > -  - clocks           : Must contain an entry for each entry in
> clock-names.
> > -
> > -  - clock-names              : Must include the "ipg_clk" for register
> access and
> > -                       "ipg_clk_app" for internal micfil clock.
> > -
> > -  - dmas             : Generic dma devicetree binding as described in
> > -                       Documentation/devicetree/bindings/dma/dma.txt.
> > -
> > -Example:
> > -micfil: micfil@30080000 {
> > -     compatible = "fsl,imx8mm-micfil";
> > -     reg = <0x0 0x30080000 0x0 0x10000>;
> > -     interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> > -                  <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > -     clocks = <&clk IMX8MM_CLK_PDM_IPG>,
> > -              <&clk IMX8MM_CLK_PDM_ROOT>;
> > -     clock-names = "ipg_clk", "ipg_clk_app";
> > -     dmas = <&sdma2 24 26 0x80000000>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> > new file mode 100644
> > index 000000000000..74c77f4cf7a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,micfil.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP MICFIL Digital Audio Interface (MICFIL)
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description: |
> > +  The MICFIL digital interface provides a 16-bit or 24-bit audio signal
> > +  from a PDM microphone bitstream in a configurable output sampling
> rate.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mm-micfil
> > +      - fsl,imx8mp-micfil
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 4
>
> You should describe the interrupts/items. Similarly to clocks.
>
>
> Ok, let me update it.

Best regards
Wang shengjiu
