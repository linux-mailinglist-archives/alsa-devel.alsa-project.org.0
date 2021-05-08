Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8F377160
	for <lists+alsa-devel@lfdr.de>; Sat,  8 May 2021 13:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D03D168A;
	Sat,  8 May 2021 13:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D03D168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620472581;
	bh=pz8gNBSwsKmNFlS7NNopD3xoPUsNKeS5b2SuYz9+TpM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YrwyO+X0M6+iT92gllRHS9VdXrDH/4K9doyhkwAm51hkEgIl4++7UGoFVBDC7e7NV
	 g5zukxbkr4YOLLyBBolFoWah+clrTXcKmUO73endoBGD6hSvcS7IrF1Q7xl7dzciXq
	 8uuqRgcZcCOHX/lT2Z7BKlGwCPJjQrtjgGKIUuIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9058F80105;
	Sat,  8 May 2021 13:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE1CF8021C; Sat,  8 May 2021 13:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68F62F80105
 for <alsa-devel@alsa-project.org>; Sat,  8 May 2021 13:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68F62F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MEaQk6XP"
Received: by mail-qt1-x830.google.com with SMTP id j19so8527676qtp.7
 for <alsa-devel@alsa-project.org>; Sat, 08 May 2021 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pXbSQAyhG6W2ZQ5ums5vjGpNRe3vyzAhG3D2OB6FJtA=;
 b=MEaQk6XPhXourlRG1ktFxx9flPigPi5AhTwrHElyyTSb6GnddHT2NBqQzAk7pfHBGh
 bxeC3+pH57tIvA67Zb42zGAcZKXFca8aAOfP6/GgJwC3zsVMuMFVYGKdHUVUh9x9fxRz
 AuqV344d7kd4prNGA6D5wBzbTIUZfWhDs1A7RiMm+8zxj1b5bv6/VA94Lmp2cEaF8qvP
 brtOwOdEzI1+3uPAV2G4hmFqWHImm3SpA7dyouODAAP8Mjio6LclJl4ZGBtVrPq4Fi8p
 0+/pQsi16Tp9y3Q1qRTOfWp4qnx2ADsyVbfSyZmqK613n4bOlpNGMAeYOsMaUVGML0CG
 kQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXbSQAyhG6W2ZQ5ums5vjGpNRe3vyzAhG3D2OB6FJtA=;
 b=mbJv0uB1DSZg81Ww6sdS84k/6OvgIUgx2voZPgoXntbwn8EQALh1AraxUb8gGCC2k5
 OeiJ47w8UvpyRzNarvTEFJ6avQCUrxUO+5hyRL5BObdW0KjH/cSWX76D38lfhw+EsE0l
 cGuMIO/S2xvmP6RtZur4dRTaHXRyprEi8wMLw7PSfIQC0zsNhWBgyMTIxskD4yoXwT6g
 29TRPZ+CLGGj8V7r10fmQH1t6znkrvWPBbGX3knJTlv+3EZw5Rr3rmsDOGAbJGshzd5K
 aazc1kc7egz9GN/ZVmKHSdwe7fl91uM1TE9nSnkpH2Yx5/u+qWBOu+8Vx4eLACcPdT17
 VLFg==
X-Gm-Message-State: AOAM533LAI2/Yt9hWfTqzLOlqUoaGwBHicQATdLQkocVxWYpWr8Tccpc
 1jmMcY1HCNil1pc+lnWhhcP2Zktfkk1K1SCyQdo=
X-Google-Smtp-Source: ABdhPJyRCbYhCpRfDI8+hasLkF4yP7yMUxLuTdvAzoQoMJyQJahYYgoI6qqRk4w4Lw9Mgcet1WmcDyaHhNNKa/rS4Jc=
X-Received: by 2002:ac8:47da:: with SMTP id d26mr13187735qtr.292.1620472484696; 
 Sat, 08 May 2021 04:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <1619157107-3734-1-git-send-email-shengjiu.wang@nxp.com>
 <1619157107-3734-2-git-send-email-shengjiu.wang@nxp.com>
 <20210503170030.GA1987906@robh.at.kernel.org>
In-Reply-To: <20210503170030.GA1987906@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 8 May 2021 19:14:33 +0800
Message-ID: <CAA+D8ANFmegm2CgOs8u5+FCrR0gGyA_tQHcPCrh3Sikcm_g47Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc for
 akcodec machine driver
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

Hi

On Tue, May 4, 2021 at 1:01 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 23, 2021 at 01:51:47PM +0800, Shengjiu Wang wrote:
> > Imx-akcodec is a new added machine driver for supporting
> > ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/imx-audio-akcodec.yaml     | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> > new file mode 100644
> > index 000000000000..7419bf7224e9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/imx-audio-akcodec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX audio complex with AK4458/AK5558/AK5552/AK4497 codec
>
> Looks like the existing fsl-asoc-card.txt? You should convert to schema
> and use that. Otherwise, my comments are based on this all being 'new'.

Ok, let's treat it as 'new'

>
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mq-audio-ak4458
> > +      - fsl,imx8mq-audio-ak4497
> > +      - fsl,imx8mq-audio-ak5558
> > +      - fsl,imx-audio-ak4497
> > +      - fsl,imx-audio-ak4458
> > +      - fsl,imx-audio-ak5558
> > +      - fsl,imx-audio-ak5552
>
> I continue to not understand why audio bindings need the codec(s) in the
> compatible strings. Can't you look up the codec thru the audio-codec
> property?

I will try to remove the codecs type from the compatible string and check
the codec type in driver.

>
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  audio-cpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of a CPU DAI controller
> > +
> > +  audio-codec:
> > +    description: The phandle of Codec DAI controllers, there are two
> > +                 controllers maximum.
>
> We have the common 'sound-dai' property. See the simple-card.yaml
> binding.

ok, will use sound-dai.

>
> > +
> > +  audio-asrc:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of ASRC. It can be absent if there's no
> > +                 need to add ASRC support via DPCM.
>
> Needs a vendor prefix.

ok,  can be removed in the next version.

>
> > +
> > +  fsl,tdm:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present, the TDM mode is enabled.
>
> But this one seems like something that could or should be common.

Ok, I will use the common one in the next version.

>
> > +
> > +required:
> > +  - compatible
> > +  - model
> > +  - audio-cpu
> > +  - audio-codec
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    sound-ak4458 {
> > +        compatible = "fsl,imx-audio-ak4458";
> > +        model = "ak4458-audio";
> > +        audio-cpu = <&sai1>;
> > +        audio-codec = <&ak4458_1>, <&ak4458_2>;
> > +    };
> > --
> > 2.17.1
> >
