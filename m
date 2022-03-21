Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA374E429A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:13:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EA8B16DE;
	Tue, 22 Mar 2022 16:13:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EA8B16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647962039;
	bh=/kXvduv1q9zuzxocmi0Bet+y/czzvbRqpS5obe8yyhI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qrfCcfaIxPUoMv8xbI/kffSpvC7PUKDhRNLBQRv1iQ5LsE94bVk1BES/aCqu7RnGS
	 D+bt3seRRTxvRoPTxZqp9AKahSiJ1cfbfqOtZcJgwXnOCRWUDNjqA3GJM7+PDphUL/
	 j2zWmZPVKdAZJDMDD5SBqJqJ9++TWpsfikxRIYEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF84F80543;
	Tue, 22 Mar 2022 16:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B8F8F80227; Tue, 22 Mar 2022 00:31:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 161D1F80109
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 00:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 161D1F80109
X-UUID: 9153bbe7865c4bcc97157c3163476505-20220322
X-UUID: 9153bbe7865c4bcc97157c3163476505-20220322
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1947124393; Tue, 22 Mar 2022 07:30:46 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 07:30:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Mar 2022 07:30:45 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 3/6] ASoC: dt-bindings: mediatek: mt8195: merge mt8195
 machine yaml
Date: Tue, 22 Mar 2022 07:30:45 +0800
Message-ID: <20220321233045.22156-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220321072312.14972-4-trevor.wu@mediatek.com>
References: <20220321072312.14972-4-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Tue, 22 Mar 2022 16:10:02 +0100
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

Hi Trevor,

>  
> -title: Mediatek MT8195 with MT6359, RT1019 and RT5682 ASoC sound card driver
> +title: Mediatek MT8195 ASoC sound card driver

s/Mediatek/MediaTek/

Thanks,
Miles
>  
>  maintainers:
>    - Trevor Wu <trevor.wu@mediatek.com>
> @@ -14,7 +14,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8195_mt6359_rt1019_rt5682
> +    enum:
> +      - mediatek,mt8195_mt6359_rt1019_rt5682
> +      - mediatek,mt8195_mt6359_rt1011_rt5682
>  
>    model:
>      $ref: /schemas/types.yaml#/definitions/string
