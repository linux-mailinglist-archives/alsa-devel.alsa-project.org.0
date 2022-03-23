Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 288374E4D54
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 08:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 952E116EE;
	Wed, 23 Mar 2022 08:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 952E116EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648020547;
	bh=68AawA6nYNo4ataUj+7L9GrHWGdssfpCzikgmREnwjQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjBnvwUwOkrs42KZMPN8/qVghrGW3VNrGAOpyiMt2f8nF06E7IJeuA3TKq2PelNoI
	 EYJV+kygPHhIEslFxdJcCvXLCgryJa6DZ6+Aan5FW/ERXP7yI8wuPuT3Yswk4irL7F
	 YQVkr7Qk1WW/680dDMwJxRKLBiTLa8HoPr9sM2aM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CE1F80165;
	Wed, 23 Mar 2022 08:28:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DB21F800C1; Wed, 23 Mar 2022 08:27:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 276DDF800C1
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 08:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 276DDF800C1
X-UUID: e15f1e9d55d14d03bebaae2c8d269a2a-20220323
X-UUID: e15f1e9d55d14d03bebaae2c8d269a2a-20220323
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1533571860; Wed, 23 Mar 2022 15:27:40 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 23 Mar 2022 15:27:39 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Mar 2022 15:27:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 15:27:38 +0800
Message-ID: <f7fa502776ce2d28553238fb10289f07de0a1d77.camel@mediatek.com>
Subject: Re: [PATCH v3 3/6] ASoC: dt-bindings: mediatek: mt8195: merge
 mt8195 machine yaml
From: Trevor Wu <trevor.wu@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
Date: Wed, 23 Mar 2022 15:27:39 +0800
In-Reply-To: <20220321233045.22156-1-miles.chen@mediatek.com>
References: <20220321072312.14972-4-trevor.wu@mediatek.com>
 <20220321233045.22156-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, matthias.bgg@gmail.com, aaronyu@google.com,
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

On Tue, 2022-03-22 at 07:30 +0800, Miles Chen wrote:
> Hi Trevor,
> 
> >  
> > -title: Mediatek MT8195 with MT6359, RT1019 and RT5682 ASoC sound
> > card driver
> > +title: Mediatek MT8195 ASoC sound card driver
> 
> s/Mediatek/MediaTek/
> 
> Thanks,
> Miles

OK. I will update it in v4.

Thanks,
Trevor

> >  
> >  maintainers:
> >    - Trevor Wu <trevor.wu@mediatek.com>
> > @@ -14,7 +14,9 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    const: mediatek,mt8195_mt6359_rt1019_rt5682
> > +    enum:
> > +      - mediatek,mt8195_mt6359_rt1019_rt5682
> > +      - mediatek,mt8195_mt6359_rt1011_rt5682
> >  
> >    model:
> >      $ref: /schemas/types.yaml#/definitions/string

