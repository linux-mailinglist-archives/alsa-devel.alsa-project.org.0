Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CACA47859F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 08:36:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D728A1EF5;
	Fri, 17 Dec 2021 08:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D728A1EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639726609;
	bh=YHQ3XpTSxN1liCVLhPR8XpmX4SKJgUU/4U5+S3PAhp8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r520HA5iUNd4TD/ljaJbYLamVFna7Hbq9NijrwBS5/EcyuL9t/9XVQ6GZVUR2mWfR
	 H4N7wmBBCBLQARVn2d5oxciRHusYi/bKBizA9Q7Iavblhp94DvUrYbrcjPc4Gr2/9m
	 C1+5aUYJ5kC9qS0FG9i23R1X4SOTtPrTpvf6qwlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41EDFF80161;
	Fri, 17 Dec 2021 08:35:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43024F8014D; Fri, 17 Dec 2021 08:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AAE2F800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 08:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AAE2F800F4
X-UUID: 3189f281b0fd48c79882c807775da72b-20211217
X-UUID: 3189f281b0fd48c79882c807775da72b-20211217
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1784386112; Fri, 17 Dec 2021 15:35:21 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 15:35:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Dec 2021 15:35:19 +0800
Message-ID: <dc7a1e56248fa58f184568e1ce4504a9233209e2.camel@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: mt8195: add clock property
 to sound node
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 17 Dec 2021 15:35:20 +0800
In-Reply-To: <YbuOQOH3esG1pFQU@robh.at.kernel.org>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
 <20211215065835.3074-2-trevor.wu@mediatek.com>
 <YbuOQOH3esG1pFQU@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org, shumingf@realtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

On Thu, 2021-12-16 at 13:06 -0600, Rob Herring wrote:
> On Wed, Dec 15, 2021 at 02:58:35PM +0800, Trevor Wu wrote:
> > clocks and clock-names are added to provide MCLK phandle for sound
> > card.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > ---
> >  .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml  | 12
> > ++++++++++++
> >  .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml  | 12
> > ++++++++++++
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > rt1011-rt5682.yaml
> > b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-
> > rt5682.yaml
> > index cf6ad7933e23..b57c856d0cf3 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-
> > rt5682.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-
> > rt5682.yaml
> > @@ -32,11 +32,21 @@ properties:
> >      $ref: "/schemas/types.yaml#/definitions/phandle"
> >      description: The phandle of MT8195 HDMI codec node.
> >  
> > +  clocks:
> > +    items:
> > +      - description: phandle and clock specifier for codec MCLK.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: i2so1_mclk
> > +
> >  additionalProperties: false
> >  
> >  required:
> >    - compatible
> >    - mediatek,platform
> > +  - clocks
> > +  - clock-names
> >  
> >  examples:
> >    - |
> > @@ -44,6 +54,8 @@ examples:
> >      sound: mt8195-sound {
> >          compatible = "mediatek,mt8195_mt6359_rt1011_rt5682";
> >          mediatek,platform = <&afe>;
> > +        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
> > +        clock-names = "i2so1_mclk";
> >          pinctrl-names = "default";
> >          pinctrl-0 = <&aud_pins_default>;
> >      };
> > diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > rt1019-rt5682.yaml
> > b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-
> > rt5682.yaml
> > index 8f177e02ad35..e4720f76f66b 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-
> > rt5682.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-
> > rt5682.yaml
> > @@ -42,11 +42,21 @@ properties:
> >        A list of the desired dai-links in the sound card. Each
> > entry is a
> >        name defined in the machine driver.
> >  
> > +  clocks:
> > +    items:
> > +      - description: phandle and clock specifier for codec MCLK.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: i2so1_mclk
> > +
> >  additionalProperties: false
> >  
> >  required:
> >    - compatible
> >    - mediatek,platform
> > +  - clocks
> > +  - clock-names
> >  
> >  examples:
> >    - |
> > @@ -54,6 +64,8 @@ examples:
> >      sound: mt8195-sound {
> >          compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
> >          mediatek,platform = <&afe>;
> > +        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
> > +        clock-names = "i2so1_mclk";
> 
> Being a virtual node, how does it have clocks? This belongs in the
> h/w device that consumes the clock.

Hi Rob,

I also found the same usages in some bindings from nvidia, like[1].

Based on my understanding, it seems not to be recommended now and 
clocks should only be used for a real hw node, is it correct?

If yes, I will try other way to get the clock I need in alsa machine
driver.

[1] 
https://elixir.bootlin.com/linux/v5.16-rc5/source/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt

Thanks,
Trevor

> >          pinctrl-0 = <&aud_pins_default>;
> >      };
> > -- 
> > 2.18.0
> > 
> > 

