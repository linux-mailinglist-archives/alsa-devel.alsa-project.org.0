Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F024D6F8A
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Mar 2022 15:21:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 177081750;
	Sat, 12 Mar 2022 15:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 177081750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647094907;
	bh=vj9k2gjhwHB+W+DAy0eWrJjs5N0zRHc1b0JAdBKxCns=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OW/b7OYJPmsAeFb4izAESnnqDbixVrs+F01gZf93Szved6/CO03e2gd5CJXdbDjYD
	 EOdYbEk1L3PFlWjDpExJlidh8w+BgKPY8J5hIh3v94+vdcYm1rAEuOTOYSIbt3zaYn
	 faLAvhHtWSyUWkqReOUQflkK+5FLv1X+YUN6/5qY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F9FF8025C;
	Sat, 12 Mar 2022 15:20:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E09AAF80095; Sat, 12 Mar 2022 15:20:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93D82F80095
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 15:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D82F80095
X-UUID: 3f792280c01248ee9e0fd8e9dcc7048b-20220312
X-UUID: 3f792280c01248ee9e0fd8e9dcc7048b-20220312
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 891404891; Sat, 12 Mar 2022 22:20:23 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 12 Mar 2022 22:20:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Mar 2022 22:20:21 +0800
Message-ID: <fc3c76ab274c12bea9be9e17823fcb4f80ddf764.camel@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-max98390-rt5682 document
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Sat, 12 Mar 2022 22:20:21 +0800
In-Reply-To: <Yip5O3t0Ymyc2h+p@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-6-trevor.wu@mediatek.com>
 <Yip5O3t0Ymyc2h+p@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

On Thu, 2022-03-10 at 16:18 -0600, Rob Herring wrote:
> On Tue, Mar 08, 2022 at 03:24:35PM +0800, Trevor Wu wrote:
> > This patch adds document for mt8195 board with mt6359, max98390 and
> > rt5682.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > ---
> >  .../sound/mt8195-mt6359-max98390-rt5682.yaml  | 61
> > +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-
> > mt6359-max98390-rt5682.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > max98390-rt5682.yaml
> > b/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-
> > rt5682.yaml
> > new file mode 100644
> > index 000000000000..7ec14d61b109
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > max98390-rt5682.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/sound/mt8195-mt6359-max98390-rt5682.yaml*__;Iw!!CTRNKA9wMg0ARbw!zb7eaqdAQfuyPpP5m31L3Q5pdCulclJgnygkkMgYh2M6segUZedd-cYz51-5Q2XDCA$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zb7eaqdAQfuyPpP5m31L3Q5pdCulclJgnygkkMgYh2M6segUZedd-cYz5187C1ArQA$
> >  
> > +
> > +title: Mediatek MT8195 with MT6359, MAX98390 and RT5682 ASoC sound
> > card driver
> > +
> > +maintainers:
> > +  - Trevor Wu <trevor.wu@mediatek.com>
> > +
> > +description:
> > +  This binding describes the MT8195 sound card.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8195_mt6359_max98390_rt5682
> 
> You have nodes for each of these components, why do we need new 
> compatible string for each combination. You can figure out the 
> combination by looking at each of those nodes.
> 
> Second, why does each combination need a new schema doc?
> 
> Rob

Hi Rob,

I'm not sure whether I can reuse the old schema doc because of the doc
name and compatible string seems to be specifically for the codec
combination.
If I want to reuse the old schema doc, should I change the doc name or
compatible string? Make the naming more general.

Thanks,
Trevor   


