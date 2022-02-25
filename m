Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A04C462C
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:25:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A5C21EF2;
	Fri, 25 Feb 2022 14:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A5C21EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795530;
	bh=cxqgUHzTNvy5TCeKspeRFnRB5oUXV7hv8n/x+HqHevw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2GbwmOgKv1uWgUD3+fieMZ1boU/aHnFVXUMHTRJTfKAn6IaRngPgkrgudrbTXUWY
	 tylIX57yi57psO9w02+X7/S03huzNBtvTwWRf9pMNsAykbG867a6FxYyjWag84svUc
	 NiOdj4cAoGyTrGjE7F4VsSqzW/LBtiHzs8yUBuog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B1E5F80516;
	Fri, 25 Feb 2022 14:17:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C24BDF80516; Fri, 25 Feb 2022 14:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5324DF80511;
 Fri, 25 Feb 2022 14:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5324DF80511
X-UUID: a5b987a552ce40baad5102d79b16cdf3-20220225
X-UUID: a5b987a552ce40baad5102d79b16cdf3-20220225
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 346981014; Fri, 25 Feb 2022 21:17:01 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 25 Feb 2022 21:17:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Feb 2022 21:16:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Feb 2022 21:16:59 +0800
Message-ID: <055296d32d218ccc3285351516b14b4fc8aba238.camel@mediatek.com>
Subject: Re: [PATCH v17 1/2] dt-bindings: mailbox: mtk,adsp-mbox: add mtk
 adsp-mbox document
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 25 Feb 2022 21:16:59 +0800
In-Reply-To: <YheugpFub9ArHDyT@robh.at.kernel.org>
References: <20220224133045.23903-1-allen-kh.cheng@mediatek.com>
 <20220224133045.23903-2-allen-kh.cheng@mediatek.com>
 <YheugpFub9ArHDyT@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 sound-open-firmware@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Mark
 Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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

On Thu, 2022-02-24 at 10:12 -0600, Rob Herring wrote:
> On Thu, Feb 24, 2022 at 09:30:44PM +0800, Allen-KH Cheng wrote:
> > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > 
> > This patch adds document for mediatek adsp mbox
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../bindings/mailbox/mtk,adsp-mbox.yaml       | 52
> > +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-
> > mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-
> > mbox.yaml
> > new file mode 100644
> > index 000000000000..25756837797f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml*__;Iw!!CTRNKA9wMg0ARbw!1-w9zcYC59nNwgZh8GRqYCSfHVTtj2nHfLuwGaqiLdOeCxlBGUkwqcW50EVBYejpHXulQA$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1-w9zcYC59nNwgZh8GRqYCSfHVTtj2nHfLuwGaqiLdOeCxlBGUkwqcW50EVBYejjdYjzJw$
> >  
> > +
> > +title: Mediatek ADSP mailbox
> > +
> > +maintainers:
> > +  - Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > +
> > +description: |
> > +  The MTK ADSP mailbox Inter-Processor Communication (IPC) enables
> > the SoC
> > +  to ommunicate with ADSP by passing messages through two mailbox
> > channels.
> > +  The MTK ADSP mailbox IPC also provides the ability for one
> > processor to
> > +  signal the other processor using interrupts.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt8195-adsp-mbox
> > +
> > +  "#mbox-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    description:
> > +      Physical address base for dsp mbox registers.
> 
> That's fairly obvious. Drop.
> 
> You need to define how many: 'maxItems: 1'
> 
Hi Rob,

thanks for your suggestions and comments.

I will add the number information for reg and interrupts.

Best Regards,
Allen

> > +
> > +  interrupts:
> > +    description:
> > +      adsp mbox interrupt
> 
> Same here.
> 
> > +
> > +required:
> > +  - compatible
> > +  - "#mbox-cells"
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    adsp_mailbox0:mailbox@10816000 {
> > +        compatible = "mediatek,mt8195-adsp-mbox";
> > +        #mbox-cells = <0>;
> > +        reg = <0x10816000 0x1000>;
> > +        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
> > +    };
> > -- 
> > 2.18.0
> > 
> > 

