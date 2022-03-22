Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E791D4E427A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 685CD1616;
	Tue, 22 Mar 2022 16:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 685CD1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647961418;
	bh=DmP+HsgHS4e6BLC3kA8dcTMX9A72NBLr8WSj+lusSJ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KBwjzJyLGTUD1g0jk4cKlaHHPuBvAsd8otFPpa58rKmLbsDzvaD2SqPqcXKEVJjfx
	 3sMjGsV0kEg/uJykH5lTIHogwkO/FNYH46OUL/ZKVfjVrWpjn6HSTBrGGBideGca8c
	 PCE2e/qt7jKamcM5v6QywZVD+l16NJdVaK4WDma8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1763F800F5;
	Tue, 22 Mar 2022 16:02:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC838F8016C; Tue, 22 Mar 2022 16:02:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DA63F80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 16:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DA63F80116
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so1952077fac.11
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 08:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LZrnZENFzHAcyG4z8YXGbb1cPaECVD2LaEEDGj9rfYI=;
 b=Ft3e8IQVD6vpaFHlY9XkahFOaKUmz3Y3muuYJoXpbMz8tR1wZLUnNptHKzMPhF5Bou
 Zsu+7IHubTY+uJ2n8zzUfVJymgx9iFwVi/Y18mhXBDoRXOhh84wlqUy4H7LcEC4IecHZ
 oG1UzbOIH4gjaD8fucBimkk8gYEKk4ZGyTzeFcxoUkP9OMs+SbfvF64cJgr6SMihoRdE
 JTIWofP24Ul6Bd0dRHPS6GktvYHzTritGd3wQMDqWk99D4vhHAfnJfcNs/81W6mb0/R+
 +CrGOTOTnEisH5K1fjeBVZYMMWsVs0V8ZKUuvWcA8Jia3coyoqDVPiFppOYJ6tJLtovW
 MP8g==
X-Gm-Message-State: AOAM532CRDtq8yki8Aetrw19gIdfXRDYaE5RjfTwQ5cLLmkW7BxAqPAF
 rAb0XAWQziwctiv0wJQtJQ==
X-Google-Smtp-Source: ABdhPJxdZIXeGXL5BgfAh0JHUsLAqnvcG4qAGL//HhwVWpYiVL440dU2hgKLJXDQsjMwp3OqJlK5gg==
X-Received: by 2002:a05:6870:4789:b0:dd:e6e0:2471 with SMTP id
 c9-20020a056870478900b000dde6e02471mr1892795oaq.195.1647961338852; 
 Tue, 22 Mar 2022 08:02:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm3141414oih.53.2022.03.22.08.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 08:02:17 -0700 (PDT)
Received: (nullmailer pid 2012421 invoked by uid 1000);
 Tue, 22 Mar 2022 15:02:16 -0000
Date: Tue, 22 Mar 2022 10:02:16 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v5 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <Yjnk+AYb0Eo8ufJA@robh.at.kernel.org>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-2-jiaxin.yu@mediatek.com>
 <YjkLVwvxvOKr30qL@robh.at.kernel.org>
 <0e909de12a52ae88633634d868bd5001eef1b830.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e909de12a52ae88633634d868bd5001eef1b830.camel@mediatek.com>
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

On Tue, Mar 22, 2022 at 11:45:24AM +0800, Jiaxin Yu wrote:
> On Mon, 2022-03-21 at 18:33 -0500, Rob Herring wrote:
> > On Sat, Mar 19, 2022 at 07:41:08PM +0800, Jiaxin Yu wrote:
> > > 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for
> > > machines
> > > with rt1015p and rt5682s.
> > > 2. Adds new property "mediatek,headset-codec" for getting headset
> > > codecs.
> > > 3. Adds new property "mediatek,speaker-codec" for getting speaker
> > > codecs.
> > > 
> > > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > ---
> > >  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 29
> > > +++++++++++++++++++
> > >  1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-
> > > rt1015-rt5682.yaml
> > > b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > > rt5682.yaml
> > > index a781e7aaaa38..aa0476eedd38 100644
> > > --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > > rt5682.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > > rt5682.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >      enum:
> > >        - mediatek,mt8192_mt6359_rt1015_rt5682
> > >        - mediatek,mt8192_mt6359_rt1015p_rt5682
> > > +      - mediatek,mt8192_mt6359_rt1015p_rt5682s
> > >  
> > >    mediatek,platform:
> > >      $ref: "/schemas/types.yaml#/definitions/phandle"
> > > @@ -27,6 +28,25 @@ properties:
> > >      $ref: "/schemas/types.yaml#/definitions/phandle"
> > >      description: The phandle of HDMI codec.
> > >  
> > > +patternProperties:
> > > +  "^mediatek,headset-codec$":
> > 
> > Fixed string, not a pattern. Move to 'properties'. Drop the vendor 
> > prefix too.
> > 
> Hi Rob,
> 
> I originally referred to simple-card.yaml and move "xxx.yyy" to the
> patternProperties.
> 
> Such as:
> # use patternProperties to avoid naming "xxx,yyy" issue
> patternProperties:
>   "^simple-audio-card,widgets$":
>     $ref: "#/definitions/widgets"

That was working around an issue and I've now fixed this.

> 
> But your comment is more reasonable. I will move them to 'properties'
> and drop the vendor prefix. Thanks for your review.
> 
> 
> > > +    description: Holds subnode which indicates headset dai.
> > > +    type: object
> > > +    properties:
> > > +      sound-dai:
> > > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > 
> > Standard property, don't need a type or description. Just how many
> > and 
> > what each one is if more than 1.
> 
> Should I describe them as below?
> 
> properties:
> ...
>   speaker-codec:
>     type: object
>     properties:
>       sound-dai:
>          maxItems: 1
> ...

Yes.

Rob
