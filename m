Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8473C4E37AF
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 04:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C07E1710;
	Tue, 22 Mar 2022 04:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C07E1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647920812;
	bh=fmbJKSs9yLohIz/+iPGL6Hu+6GwzwREBzA85drHKKZY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDmo/7SoFSuraAep+ulSBUQb6IGOGfqMfCjhh7nRb8VZow5NKc2Xx9WdMNBPdfQpS
	 8pLWeUy58xl6I4h6cwAsGT5VTsgX/teCnTB6KlAn9I97jOCmt0VkSY1VkbI5p+jhko
	 Aetw+S4XhSnEP7zqq7GrKz/mzsKigWZoeONNpVJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81A8DF800F5;
	Tue, 22 Mar 2022 04:45:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B102F8016C; Tue, 22 Mar 2022 04:45:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D66CF800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 04:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D66CF800F5
X-UUID: e2f1032bd75c4a44aedc03b14251f9a1-20220322
X-UUID: e2f1032bd75c4a44aedc03b14251f9a1-20220322
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1473736653; Tue, 22 Mar 2022 11:45:27 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 11:45:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 22 Mar 2022 11:45:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 11:45:25 +0800
Message-ID: <0e909de12a52ae88633634d868bd5001eef1b830.camel@mediatek.com>
Subject: Re: [v5 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 22 Mar 2022 11:45:24 +0800
In-Reply-To: <YjkLVwvxvOKr30qL@robh.at.kernel.org>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-2-jiaxin.yu@mediatek.com>
 <YjkLVwvxvOKr30qL@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
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

On Mon, 2022-03-21 at 18:33 -0500, Rob Herring wrote:
> On Sat, Mar 19, 2022 at 07:41:08PM +0800, Jiaxin Yu wrote:
> > 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for
> > machines
> > with rt1015p and rt5682s.
> > 2. Adds new property "mediatek,headset-codec" for getting headset
> > codecs.
> > 3. Adds new property "mediatek,speaker-codec" for getting speaker
> > codecs.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 29
> > +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-
> > rt1015-rt5682.yaml
> > b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > rt5682.yaml
> > index a781e7aaaa38..aa0476eedd38 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > rt5682.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > rt5682.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      enum:
> >        - mediatek,mt8192_mt6359_rt1015_rt5682
> >        - mediatek,mt8192_mt6359_rt1015p_rt5682
> > +      - mediatek,mt8192_mt6359_rt1015p_rt5682s
> >  
> >    mediatek,platform:
> >      $ref: "/schemas/types.yaml#/definitions/phandle"
> > @@ -27,6 +28,25 @@ properties:
> >      $ref: "/schemas/types.yaml#/definitions/phandle"
> >      description: The phandle of HDMI codec.
> >  
> > +patternProperties:
> > +  "^mediatek,headset-codec$":
> 
> Fixed string, not a pattern. Move to 'properties'. Drop the vendor 
> prefix too.
> 
Hi Rob,

I originally referred to simple-card.yaml and move "xxx.yyy" to the
patternProperties.

Such as:
# use patternProperties to avoid naming "xxx,yyy" issue
patternProperties:
  "^simple-audio-card,widgets$":
    $ref: "#/definitions/widgets"

But your comment is more reasonable. I will move them to 'properties'
and drop the vendor prefix. Thanks for your review.


> > +    description: Holds subnode which indicates headset dai.
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Standard property, don't need a type or description. Just how many
> and 
> what each one is if more than 1.

Should I describe them as below?

properties:
...
  speaker-codec:
    type: object
    properties:
      sound-dai:
         maxItems: 1
...

> 
> > +        description: List of phandles to the headset codec nodes.
> 
> More than 1?
> 

Sorry, the description here is incorrect, there is only one phandle.

> > +    additionalProperties: false
> > +
> > +  "^mediatek,speaker-codec$":
> > +    description: Holds subnode which indicates speaker dai.
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        description: List of phandles to the speaker codec nodes.
> 
> Same here.
> 
> > +    additionalProperties: false
> > +
> >  additionalProperties: false
> >  
> >  required:
> > @@ -44,6 +64,15 @@ examples:
> >                          "aud_clk_mosi_on";
> >          pinctrl-0 = <&aud_clk_mosi_off>;
> >          pinctrl-1 = <&aud_clk_mosi_on>;
> > +
> > +        mediatek,headset-codec {
> > +            sound-dai = <&rt5682>;
> > +        };
> > +
> > +        mediatek,speaker-codec {
> > +            sound-dai = <&rt1015_l>,
> > +                        <&rt1015_r>;
> > +        };
> >      };
> >  
> >  ...
> > -- 
> > 2.18.0
> > 
> > 

