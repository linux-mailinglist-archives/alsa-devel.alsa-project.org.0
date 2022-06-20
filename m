Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ACA5513FD
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 11:18:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EAB51940;
	Mon, 20 Jun 2022 11:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EAB51940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655716684;
	bh=ao9OdRfwZ9pjSMMclgdNiPGY/0QZWsyh/Hgmot84dno=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gdH7d3ju8P1qDJwR4Eak+r6/q3ecOwpgYy96wdFY5Ho9U4J64IUTqIekp1g2MMLOS
	 ahRZT53uMUQHkOqow9nUvzMhvgDjUNfH+7WIwB2f0hLm9Hy/qjb4xKU5LrD5SjNmlo
	 pVKCbY0WBdlkRZVwGMLuudXk6OsaIgK3oiNpyVDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A79F800CB;
	Mon, 20 Jun 2022 11:17:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12FF6F804D2; Mon, 20 Jun 2022 11:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99721F800FB;
 Mon, 20 Jun 2022 11:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99721F800FB
X-UUID: 36eef338cfb74a14ab06673e7c6a772d-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:14f07526-6b8b-4088-ae29-c2bd702ee75f, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:14f07526-6b8b-4088-ae29-c2bd702ee75f, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:2f7effe9-f7af-4e69-92ee-0fd74a0c286c,
 C
 OID:a7e4c246682a,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 36eef338cfb74a14ab06673e7c6a772d-20220620
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 401679810; Mon, 20 Jun 2022 17:16:43 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 20 Jun 2022 17:16:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 17:16:41 +0800
Message-ID: <485c9b07fb2a60635e7cd52e710af872733fcff9.camel@mediatek.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: dsp: mediatek: Use meaningful names
 for mbox
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, YC Hung <yc.hung@mediatek.com>, Curtis Malainey
 <cujomalainey@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Date: Mon, 20 Jun 2022 17:16:41 +0800
In-Reply-To: <3830efc5-298d-7887-5718-2cb2a7ad4895@linaro.org>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
 <20220616073042.13229-2-tinghan.shen@mediatek.com>
 <629e761b-e3ad-0861-1937-ad660a8a900b@linaro.org>
 <af32751dd7013a96dac5d165c35e132fda87f2ac.camel@mediatek.com>
 <3830efc5-298d-7887-5718-2cb2a7ad4895@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Hi Krzysztof,

On Mon, 2022-06-20 at 10:51 +0200, Krzysztof Kozlowski wrote:
> On 20/06/2022 08:40, Tinghan Shen wrote:
> > Hi Krzysztof,
> > 
> > On Thu, 2022-06-16 at 06:55 -0700, Krzysztof Kozlowski wrote:
> > > On 16/06/2022 00:30, Tinghan Shen wrote:
> > > > Rename mbox according to actions instead of 'mbox0' and 'mbox1'.
> > > > 
> > > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > > b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > > index b7e68b0dfa13..ca8d8661f872 100644
> > > > --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > > +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > > @@ -50,13 +50,13 @@ properties:
> > > >  
> > > >    mboxes:
> > > >      items:
> > > > -      - description: ipc reply between host and audio DSP.
> > > > -      - description: ipc request between host and audio DSP.
> > > > +      - description: mailbox for receiving audio DSP requests.
> > > > +      - description: mailbox for transmitting requests to audio DSP.
> > > >  
> > > >    mbox-names:
> > > >      items:
> > > > -      - const: mbox0
> > > > -      - const: mbox1
> > > > +      - const: rx
> > > > +      - const: tx
> > > >  
> > > 
> > > Commit msg lacks important piece - do you break any users with this? Do
> > > you have any users of this binding?
> > > 
> > > 
> > > Best regards,
> > > Krzysztof
> > 
> > The 8195 dsp node, which uses this binding, has not yet been added to the 8195 devicetree.
> 
> Could you mention it in the commit msg? Such one sentence is enough.
> 
> With commit msg extended:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof

No problem. I'll udpate commit message at next version.


Thanks,
TingHan



