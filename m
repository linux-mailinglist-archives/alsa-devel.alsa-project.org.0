Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD1515554
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 22:17:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3758825;
	Fri, 29 Apr 2022 22:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3758825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651263463;
	bh=4dp06qOEaKW05s5QmALqeOdm2AKjybVwFfK5fyH2Jps=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EU+adWC95xw0P4AJqAHbI720HgNPHaEXUGGFi+Ur0LcN5Mcrk9yXWAumJ6Fsqs0e4
	 Qtu1ztMvavkwmd+hQCr+pDolPj+5UGbkXTwXCqdHLqeoX86eKVtESLmf0xg30BY4iV
	 lC6RBIqs/+9sTxC7zqoOrubw/vVyidPuGORSklmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24396F80269;
	Fri, 29 Apr 2022 22:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF220F8025D; Fri, 29 Apr 2022 22:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 827CCF8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 22:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827CCF8007E
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-e9027efe6aso9182821fac.10
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 13:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tiOACVbwh67uqkrg+v7LDtn9Slnv0D8m91bpuKh0Ev0=;
 b=1uA1ajJU3ftcD+hroQGg8pj9NnTKkhIk7Hwfa7L3m578QP0wUueNaiKrgCoJNbPvrS
 zMDhS+bQt0DjUAuv/aWxUJv+IR6u6st4WUSN2HsKh54W3/vQsqGDmW8MKfCG2ojejuKh
 QwyvNgaDoxCLJiD/+YutWppNe1zFtm3nQ+z08o4LtJcIPwlzSm3kKrq7G0WpkNJz2C01
 Vd/0FM/7U8OI/VJL7m6YcQrLE+o7Dl2mK5y4BeJZOMkyGUx/mynbAC//sjndCsVYfZsb
 q7QDEsUifDQUVQD6Y4ITXFjiqTQAC/ZZcCRhwC5LD/A2TpZLzCZPWDtb2YYXCdSEKYNa
 3MPw==
X-Gm-Message-State: AOAM531/hRTY+1HZMoGeUhjpsuuJvJTSEgykvmjOZKKJkW3Mnduvnb4u
 hu1NMA6vwJZlHUc2Spcl/g==
X-Google-Smtp-Source: ABdhPJw2gDKOW+0tcM8RQuwAxxtSJfYernX60ZZrMMDRUED6g9kqv7Imhf1an1clOEIvD5i6uHJTWA==
X-Received: by 2002:a05:6870:e245:b0:de:9321:9ea3 with SMTP id
 d5-20020a056870e24500b000de93219ea3mr480183oac.79.1651263395259; 
 Fri, 29 Apr 2022 13:16:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i13-20020a54408d000000b00325cda1ffb9sm67047oii.56.2022.04.29.13.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 13:16:34 -0700 (PDT)
Received: (nullmailer pid 2793009 invoked by uid 1000);
 Fri, 29 Apr 2022 20:16:33 -0000
Date: Fri, 29 Apr 2022 15:16:33 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v4 16/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
Message-ID: <YmxHoXfpmC2XxReg@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-17-jiaxin.yu@mediatek.com>
 <YmqlNV31FrcAyuN9@robh.at.kernel.org>
 <5e400f7ccb3b208a033e2ad8f220331851ff9c7e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e400f7ccb3b208a033e2ad8f220331851ff9c7e.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Fri, Apr 29, 2022 at 05:40:02PM +0800, Jiaxin Yu wrote:
> On Thu, 2022-04-28 at 09:31 -0500, Rob Herring wrote:
> > On Thu, Apr 28, 2022 at 05:33:53PM +0800, Jiaxin Yu wrote:
> > > Add document for mt8186 board with mt6366, da7219 and max98357.
> > > 
> > > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > ---
> > >  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 71
> > > +++++++++++++++++++
> > >  1 file changed, 71 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-
> > > mt6366-da7219-max98357.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-
> > > da7219-max98357.yaml
> > > b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-
> > > max98357.yaml
> > > new file mode 100644
> > > index 000000000000..55e8649f2aea
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-
> > > max98357.yaml
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > http://devicetree.org/schemas/sound/mt8186-mt6366-da7219-max98357.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mediatek MT8186 with MT6366, DA7219 and MAX98357 ASoC sound
> > > card driver
> > > +
> > > +maintainers:
> > > +  - Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > +
> > > +description:
> > > +  This binding describes the MT8186 sound card.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8186_mt6366_da7219_max98357_sound
> > 
> > s/_/-/
> > 
> Got it.
> > > +
> > > +  mediatek,platform:
> > > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > > +    description: The phandle of MT8186 ASoC platform.
> > > +
> > > +  headset-codec:
> > > +    type: object
> > 
> >        additionalProperties: false
> Ditto.
> > 
> > > +    properties:
> > > +      sound-dai:
> > > +        $ref: /schemas/types.yaml#/definitions/phandle
> > 
> > sound-dai already has a type, so drop and define how many entries.
> > 
> Ditto.

No need to reply in agreement. Just trim the email instead.

> > > +    properties:
> > > +      sound-dai:
> > > +        minItems: 2
> > > +        maxItems: 3
> > 
> > If more than 1 entry, then you need to define what each one is and
> > the 
> > order. Just like reg, interrupts, clocks, etc.
> > 
> Hi Rob,
> 
> Should I correct them as below?
> 
> ---
> properties:
>   sound-dai:
>     minItems: 2
>     maxItems: 3
>     items:
>       - items:
>           - description: xxx
>           - description: yyy
>           - description: zzz

Drop the outer 'items'. As-is, you are saying you have 1 entry with 3 
cells (1 phandle + 2 arg cells).

Rob
