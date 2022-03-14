Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F524D8812
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 16:30:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CC161750;
	Mon, 14 Mar 2022 16:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CC161750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647271811;
	bh=CcGU6DFBmpjGVgnKr8hZJzBEACM90dLUIDGlrQGGHS4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tFQH3UrHMKxuLqcfJLT10ZKzBbbCNETisFqmvtS+t8AZjQ0b543yZLJexjpt+UiiF
	 V4PdNwu0NnFwdEsSclvlXm48Qo1oF+RwYgAqPBWVivWI6JGId5yYUIzsr6xIiSdpkq
	 OXFHJYyHI0A9Whh9USCRu0GZSZcQUcWc838Dqyas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E95F801EC;
	Mon, 14 Mar 2022 16:29:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3CCCF80139; Mon, 14 Mar 2022 16:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4894AF80095
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 16:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4894AF80095
Received: by mail-io1-f41.google.com with SMTP id 195so18750941iou.0
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 08:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m6HtwX9B+I/cwGYS9sFs1EBK8BhKR73Z2a3cdC3BGMg=;
 b=mSAFvpeXNDTUPA4rttIPxGOtaBXn1n+aSGFU/+ZkgZG4kQ9aBgtpWN6CC5C7VnWD/J
 Eer5gKwtjlx0SkkiBN1YsV9g0nZiYASwYJeAux+PJyXBKrtc3FVJuOevf/LLeNTCxVCO
 h69DSsN95HqC0cA87x1ANQYrLsuALxUWHbnykzZ+ysgTi4PxxSkFj/FW7nPti/Z6gmPA
 4zyV6zQOLwQW57Kzzeky40zPvShn11mB8QMUbFVYAOFGG5wf/bbtdsWI84iOc3qUcacc
 A0tIXMNEBTIUJfOfMOxI+ZFTnI4Arijh+Lrqknz5VmYjR9v4f6uRiRK1JOr1fPZ/u+GY
 mLMg==
X-Gm-Message-State: AOAM532AlnQsQWaUMyCpNTpzLH+JrJMiFe07obM/oT/5FFRtjQ0DSoA+
 CXm+x4mm3hg+4YqIpSLzLQ==
X-Google-Smtp-Source: ABdhPJz8r2zMzOR+Daq/ViBSyP3Bs7uRlDXQ3MIRpNLW60TtgExiDCc4dWJQ0gmWm22TOePOpCoXdg==
X-Received: by 2002:a05:6638:12cb:b0:319:c047:6e57 with SMTP id
 v11-20020a05663812cb00b00319c0476e57mr18275449jas.215.1647271731576; 
 Mon, 14 Mar 2022 08:28:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a92cd89000000b002c655c48593sm9392229ilb.67.2022.03.14.08.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 08:28:50 -0700 (PDT)
Received: (nullmailer pid 84320 invoked by uid 1000);
 Mon, 14 Mar 2022 15:28:48 -0000
Date: Mon, 14 Mar 2022 09:28:48 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-max98390-rt5682 document
Message-ID: <Yi9fMM26XHodzvc4@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-6-trevor.wu@mediatek.com>
 <Yip5O3t0Ymyc2h+p@robh.at.kernel.org>
 <fc3c76ab274c12bea9be9e17823fcb4f80ddf764.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc3c76ab274c12bea9be9e17823fcb4f80ddf764.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

On Sat, Mar 12, 2022 at 10:20:21PM +0800, Trevor Wu wrote:
> On Thu, 2022-03-10 at 16:18 -0600, Rob Herring wrote:
> > On Tue, Mar 08, 2022 at 03:24:35PM +0800, Trevor Wu wrote:
> > > This patch adds document for mt8195 board with mt6359, max98390 and
> > > rt5682.
> > > 
> > > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > > ---
> > >  .../sound/mt8195-mt6359-max98390-rt5682.yaml  | 61
> > > +++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-
> > > mt6359-max98390-rt5682.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > > max98390-rt5682.yaml
> > > b/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-
> > > rt5682.yaml
> > > new file mode 100644
> > > index 000000000000..7ec14d61b109
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > > max98390-rt5682.yaml
> > > @@ -0,0 +1,61 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/sound/mt8195-mt6359-max98390-rt5682.yaml*__;Iw!!CTRNKA9wMg0ARbw!zb7eaqdAQfuyPpP5m31L3Q5pdCulclJgnygkkMgYh2M6segUZedd-cYz51-5Q2XDCA$
> > >  
> > > +$schema: 
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zb7eaqdAQfuyPpP5m31L3Q5pdCulclJgnygkkMgYh2M6segUZedd-cYz5187C1ArQA$
> > >  
> > > +
> > > +title: Mediatek MT8195 with MT6359, MAX98390 and RT5682 ASoC sound
> > > card driver
> > > +
> > > +maintainers:
> > > +  - Trevor Wu <trevor.wu@mediatek.com>
> > > +
> > > +description:
> > > +  This binding describes the MT8195 sound card.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt8195_mt6359_max98390_rt5682
> > 
> > You have nodes for each of these components, why do we need new 
> > compatible string for each combination. You can figure out the 
> > combination by looking at each of those nodes.
> > 
> > Second, why does each combination need a new schema doc?
> > 
> > Rob
> 
> Hi Rob,
> 
> I'm not sure whether I can reuse the old schema doc because of the doc
> name and compatible string seems to be specifically for the codec
> combination.
> If I want to reuse the old schema doc, should I change the doc name or
> compatible string? Make the naming more general.

It's fine to either leave it named after the first compatible string or 
rename it if you want.

Rob
