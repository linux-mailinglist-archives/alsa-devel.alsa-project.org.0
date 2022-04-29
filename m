Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DC514590
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 11:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18C8182A;
	Fri, 29 Apr 2022 11:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18C8182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651225282;
	bh=zXYWxTxN2ZJHeE/BuyLZBH/MNuSuGSzqHGkBNazw6iA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDN745/q5O+qdHzN7ykM6voCPB6aa63QoD6Ju8vZhQIcoV2nsPwu+FMwwRw9F7rvu
	 +TWtYviEVGojeXS8+nx+WaJe1y4iqSBILBon6F+3iRbfw5PwktZmRTKNWoP3dxo3sV
	 p3/b9f7bTMG7WwCVxf8tYA2AQUBY+dgPHZOaUufk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D50EF80269;
	Fri, 29 Apr 2022 11:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6E05F8025D; Fri, 29 Apr 2022 11:40:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81751F8016E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 11:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81751F8016E
X-UUID: 144feaeb2add4d3b98ffa866a261fc3c-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e54a13ef-e425-4c35-a96e-b8fa1264c69f, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:f0372d2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 144feaeb2add4d3b98ffa866a261fc3c-20220429
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1916973249; Fri, 29 Apr 2022 17:40:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 29 Apr 2022 17:40:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:40:02 +0800
Message-ID: <5e400f7ccb3b208a033e2ad8f220331851ff9c7e.camel@mediatek.com>
Subject: Re: [v4 16/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 29 Apr 2022 17:40:02 +0800
In-Reply-To: <YmqlNV31FrcAyuN9@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-17-jiaxin.yu@mediatek.com>
 <YmqlNV31FrcAyuN9@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

On Thu, 2022-04-28 at 09:31 -0500, Rob Herring wrote:
> On Thu, Apr 28, 2022 at 05:33:53PM +0800, Jiaxin Yu wrote:
> > Add document for mt8186 board with mt6366, da7219 and max98357.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 71
> > +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-
> > mt6366-da7219-max98357.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-
> > da7219-max98357.yaml
> > b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-
> > max98357.yaml
> > new file mode 100644
> > index 000000000000..55e8649f2aea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-
> > max98357.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/sound/mt8186-mt6366-da7219-max98357.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT8186 with MT6366, DA7219 and MAX98357 ASoC sound
> > card driver
> > +
> > +maintainers:
> > +  - Jiaxin Yu <jiaxin.yu@mediatek.com>
> > +
> > +description:
> > +  This binding describes the MT8186 sound card.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8186_mt6366_da7219_max98357_sound
> 
> s/_/-/
> 
Got it.
> > +
> > +  mediatek,platform:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of MT8186 ASoC platform.
> > +
> > +  headset-codec:
> > +    type: object
> 
>        additionalProperties: false
Ditto.
> 
> > +    properties:
> > +      sound-dai:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> 
> sound-dai already has a type, so drop and define how many entries.
> 
Ditto.
> > +    required:
> > +        - sound-dai
> > +

The indentation of this line is incorrect. I will fix it.

> > +  playback-codecs:
> > +    type: object
> 
>        additionalProperties: false
> 
Got it.
> > +    properties:
> > +      sound-dai:
> > +        minItems: 2
> > +        maxItems: 3
> 
> If more than 1 entry, then you need to define what each one is and
> the 
> order. Just like reg, interrupts, clocks, etc.
> 
Hi Rob,

Should I correct them as below?

---
properties:
  sound-dai:
    minItems: 2
    maxItems: 3
    items:
      - items:
          - description: xxx
          - description: yyy
          - description: zzz

> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Drop
> 
Got it.
> > +    required:
> > +        - sound-dai
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - mediatek,platform
> > +  - headset-codec
> > +  - playback-codecs
> > +
> > +examples:
> > +  - |
> > +
> > +    sound: mt8186-sound {
> > +        compatible =
> > "mediatek,mt8186_mt6366_da7219_max98357_sound";
> > +        mediatek,platform = <&afe>;
> > +        pinctrl-names = "aud_clk_mosi_off",
> > +                        "aud_clk_mosi_on";
> > +        pinctrl-0 = <&aud_clk_mosi_off>;
> > +        pinctrl-1 = <&aud_clk_mosi_on>;
> > +
> > +        headset-codec {
> > +            sound-dai = <&da7219>;
> > +        };
> > +
> > +        playback-codecs {
> > +            sound-dai = <&anx_bridge_dp>,
> > +                        <&max98357a>;
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.25.1
> > 

