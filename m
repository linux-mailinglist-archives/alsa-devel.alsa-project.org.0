Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4901F58F20B
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 19:59:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3C61631;
	Wed, 10 Aug 2022 19:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3C61631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660154387;
	bh=41GjKLFxWowccsSrL/dJS2INcWXke2o1UBr0x/BQW8o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJQ8Xb+NDN8g3ZtEUzVl6giLAq0tZhkM2ubAH7hE1CsYZe2+5mbCAP+3J4Mt2A2t9
	 Hl8XUVcTrHbc8gd80vTq07FPvRnuaUS4CGpEtlGW57FZq9rPS+4ceZ9oRWnI+bPvw3
	 qBWwidt0KzODGJBHpX7CT9RlNKlTaUW27ruDWnmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07265F8012A;
	Wed, 10 Aug 2022 19:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27E0FF801F5; Wed, 10 Aug 2022 19:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18EB2F8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 19:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18EB2F8012A
Received: by mail-il1-f172.google.com with SMTP id s16so8698015ilp.3
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 10:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=SY02ZkdHYX34GvboJkr16ACg+9RvpT639cg2EBcSKVU=;
 b=xvvjFoomFirpmBGiIRkiGk/zbQMTQuzoXUEL/k6AHThU43ORk1507ICev444E5TnYL
 tecSHQTVsBa3+nPixKaokqoAvF88BQptSEgG4oM8F4sFTVYinXLplRwoB5oPwRyAQEUm
 ysajyPKVtL5KfEZzPbXuW1gpVKZXTvYNQ3XbK1DhzcPieeSA9jhcgOeRyeR66Bwp9lgY
 A0x4ltM6c5CUCaJDYfUz31MLG2tbYohx4ABDrMOcVThtxQzTbf0XSFQ68GQvn8AoRYT9
 BloGBhhOvJ9266n5jV+TPj5y+c7+pscc75UzbjoiYt8NrZIpIeGmn6Lp1pT60+leMLL2
 UXJQ==
X-Gm-Message-State: ACgBeo2xXiOkttix04lE79v4OrBnxwZUuWGmgEPxOc4wDKfKfjGFYL/F
 j++bNroRnqzlQqLADbZNTQ==
X-Google-Smtp-Source: AA6agR7CyLdpEOLqF49H79wXqu/iPyHRTwMYE1VpEee0uUoWBOyXb6YmlWzXeAdJ2yMCJbwNs+ofvA==
X-Received: by 2002:a92:2a0a:0:b0:2d9:2571:f57e with SMTP id
 r10-20020a922a0a000000b002d92571f57emr13004446ile.154.1660154316973; 
 Wed, 10 Aug 2022 10:58:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a027343000000b003316f4b9b26sm7743726jae.131.2022.08.10.10.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 10:58:36 -0700 (PDT)
Received: (nullmailer pid 240872 invoked by uid 1000);
 Wed, 10 Aug 2022 17:58:35 -0000
Date: Wed, 10 Aug 2022 11:58:35 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl, sai: Convert format to json-schema
Message-ID: <20220810175835.GB200295-robh@kernel.org>
References: <1658741467-32620-1-git-send-email-shengjiu.wang@nxp.com>
 <e81d657f-edea-4c5d-e546-e3bdb379c659@linaro.org>
 <CAA+D8AP3o-sRtzBEQEPEOVXW2vACf38fWy=jJ0AGrxTrO=W4yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AP3o-sRtzBEQEPEOVXW2vACf38fWy=jJ0AGrxTrO=W4yA@mail.gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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

On Thu, Jul 28, 2022 at 11:01:16PM +0800, Shengjiu Wang wrote:
> On Tue, Jul 26, 2022 at 4:05 AM Krzysztof Kozlowski <
> krzysztof.kozlowski@linaro.org> wrote:
> 
> > On 25/07/2022 11:31, Shengjiu Wang wrote:
> > > Convert the NXP SAI binding to DT schema format using json-schema.
> > >
> > > The Synchronous Audio Interface (SAI) provides an interface that
> > > supports full-duplex serial interfaces with frame synchronization
> > > formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../devicetree/bindings/sound/fsl,sai.yaml    | 175 ++++++++++++++++++
> > >  .../devicetree/bindings/sound/fsl-sai.txt     |  95 ----------
> > >  2 files changed, 175 insertions(+), 95 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > > new file mode 100644
> > > index 000000000000..adcd77531eba
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > > @@ -0,0 +1,175 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Freescale Synchronous Audio Interface (SAI).
> > > +
> > > +maintainers:
> > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > > +
> > > +description: |
> > > +  The SAI is based on I2S module that used communicating with audio
> > codecs,
> > > +  which provides a synchronous audio interface that supports fullduplex
> > > +  serial interfaces with frame synchronization such as I2S, AC97, TDM,
> > and
> > > +  codec/DSP interfaces.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    minItems: 1
> > > +    maxItems: 2
> >
> > You allow anything here, so it's not acceptable. This has to be strictly
> > defined.
> >
> 
> ok, I will update it.
> 
> >
> > > +    items:
> > > +      enum:
> > > +        - fsl,vf610-sai
> > > +        - fsl,imx6sx-sai
> > > +        - fsl,imx6ul-sai
> > > +        - fsl,imx7ulp-sai
> > > +        - fsl,imx8mq-sai
> > > +        - fsl,imx8qm-sai
> > > +        - fsl,imx8mm-sai
> > > +        - fsl,imx8mn-sai
> > > +        - fsl,imx8mp-sai
> > > +        - fsl,imx8ulp-sai
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    items:
> > > +      - description: receive and transmit interrupt
> > > +
> > > +  dmas:
> > > +    minItems: 2
> >
> > No need for minItems.
> >
> 
> ok
> 
> 
> >
> > > +    maxItems: 2
> > > +    description:
> > > +      Must contain a list of pairs of references to DMA specifiers, one
> > for
> > > +      transmission, and one for reception.
> >
> > Skip description and instead describe items like you did for interrupts.
> >
> 
> ok, will update it
> 
> >
> > > +
> > > +  dma-names:
> > > +    minItems: 2
> > > +    maxItems: 2
> > > +    items:
> > > +      enum:
> > > +        - tx
> > > +        - rx
> >
> > No, this has to be strictly defined, so items with tx and rx (or
> > reversed order).
> >
> 
> two kind of order is needed, seems I need to use
> if - then -else

No, pick the more common one for the schema and fix the dts files for 
the less common case.

Rob
