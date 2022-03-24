Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEB4E5E60
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 06:58:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C330E163A;
	Thu, 24 Mar 2022 06:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C330E163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648101504;
	bh=JPEhl+B8N188uJWvtoiCP3d178qHUp/B+L82POWDU5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J16in5bW3x9Yz/PafTgZeuwMz9uARRxps9EIkOUKjhibJhvHMPrItDi0LpK0Q6/rj
	 7I1PtsN2ejQ96tZ1t2DJAif0o1x8I63jjMUj4uljrqXJ2LWpAnqDKU9S3cHtVXIlkN
	 QOAQdip+9fBVSVjYmRDyWsxP0NsAJcF3qwyUNVMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FF30F800AA;
	Thu, 24 Mar 2022 06:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5E99F800AA; Thu, 24 Mar 2022 06:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01109F800AA
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 06:57:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01109F800AA
X-UUID: eb6e6d1b03e74206b05e4b9be9c1a174-20220324
X-UUID: eb6e6d1b03e74206b05e4b9be9c1a174-20220324
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2025374543; Thu, 24 Mar 2022 13:57:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 13:57:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Mar 2022 13:57:00 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <trevor.wu@mediatek.com>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: mediatek: mt8195: merge mt8195
 machine yaml
Date: Thu, 24 Mar 2022 13:57:00 +0800
Message-ID: <20220324055700.28736-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220324053851.27350-4-trevor.wu@mediatek.com>
References: <20220324053851.27350-4-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 tzungbi@google.com, miles.chen@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

> Because the same binding components can be shared by all codecs
> combinations, we only reserve one binding file for mt8195 machine driver
> and rename to a generic name.
> 
> We use compatible string to separate different codec combination instead
> of creating a new binding file for new codec combination.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
>---

...snip...

>diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
>similarity index 87%
>rename from Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
>rename to Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
>index 8f177e02ad35..04953f5b44a4 100644
>--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
>+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
>@@ -1,10 +1,10 @@
> # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> %YAML 1.2
> ---
>-$id: http://devicetree.org/schemas/sound/mt8195-mt6359-rt1019-rt5682.yaml#
>+$id: http://devicetree.org/schemas/sound/mt8195-mt6359.yaml#
> $schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>-title: Mediatek MT8195 with MT6359, RT1019 and RT5682 ASoC sound card driver
>+title: MediaTek MT8195 ASoC sound card driver
> 

I also tested:
'make dt_binding_check DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml'
and it wotks fine.

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

> maintainers:
>   - Trevor Wu <trevor.wu@mediatek.com>
>@@ -14,7 +14,9 @@ description:
> 
> properties:
>   compatible:
>-    const: mediatek,mt8195_mt6359_rt1019_rt5682
>+    enum:
>+      - mediatek,mt8195_mt6359_rt1019_rt5682
>+      - mediatek,mt8195_mt6359_rt1011_rt5682
> 
>   model:
>     $ref: /schemas/types.yaml#/definitions/string
>-- 
>2.18.0
>
>
