Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D06F14CD56B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 14:47:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE2E1A2C;
	Fri,  4 Mar 2022 14:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE2E1A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646401622;
	bh=0rjtYRDyNmpn/IQP9yW9Nhyp5CTYgN9Nx79JFVv5gHE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aenH95NdKYdTt4iQEn9ZLx3HI4bj9caJTikoMfHW24XHdbGuLMygSz+8J+R1Fc7qq
	 n5nz5p0bL0EmA5XRDYDnltnTJFwyak5HYgGsU0Gff5bEFKF3G/FyIMeszn4q8HlD5i
	 knCQSpshRwMFuzdQCDcmJWTzUwDwRyb2MYUldjMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2472F800F0;
	Fri,  4 Mar 2022 14:45:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0752F801EC; Fri,  4 Mar 2022 14:45:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A75DF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 14:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A75DF800F0
Received: by mail-oo1-f52.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso9439860ooa.4
 for <alsa-devel@alsa-project.org>; Fri, 04 Mar 2022 05:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KUpNuUQnXgfSvSQJNQQ/zhupQmOW5yWTQDWjvjsKk7E=;
 b=iBFAoWxAKOvchSaFAky7jwhlpjAA1TxtSu/1AP7pfquTQ6lzG8lAqgZkh7cIZxk5VQ
 iIjiadQsYxqDkRs8Sls+i9moehUqNpdHh/fDOV/gZI28fZZh54bVFPKeQD664/ujZwbV
 rewjuBUNuAj3AHZxPOOGw7YXD/A381ynTAPC30jfBeqJNZm85GAWQIIwTsUA1nzguTVf
 xiN2V+B6Ry9qKd5zOyMx6ZQwColF4x931893XUQOTPE+hOENnZL/moDnLiXPb8HGZE35
 vsUbDoorBWbKevPs1vw8ER7JGGNlUdddJ/5nz3FvfseSzStT6extpWzpq75ReJwS2qa2
 D9VA==
X-Gm-Message-State: AOAM533m1XCwC6Aq9QqJ46fq+LZ63UIIEIbcwk5eM/AB029FF3Vk6OWt
 XuXY976peHx8dKtkJsO6dQ==
X-Google-Smtp-Source: ABdhPJyAnmg/NW3RCU37MQSAswSycJFsenLWW9LE/mVJ6wGvlVv9qf9yxxcE95G3b/2olO4x43Vj7Q==
X-Received: by 2002:a4a:c98d:0:b0:31b:e25d:d98d with SMTP id
 u13-20020a4ac98d000000b0031be25dd98dmr21872880ooq.86.1646401540139; 
 Fri, 04 Mar 2022 05:45:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 c8-20020a4ad788000000b0031ce69b1640sm2299367oou.10.2022.03.04.05.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:45:39 -0800 (PST)
Received: (nullmailer pid 3810487 invoked by uid 1000);
 Fri, 04 Mar 2022 13:45:38 -0000
Date: Fri, 4 Mar 2022 07:45:38 -0600
From: Rob Herring <robh@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] dt-bindings: mfd: Fix pinctrl node name warnings
Message-ID: <YiIYAnLbxHJ3CWYw@robh.at.kernel.org>
References: <20220303194737.2258809-1-robh@kernel.org>
 <20220304095837.GS38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220304095837.GS38351@ediswmail.ad.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 - <patches@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Lee Jones <lee.jones@linaro.org>
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

On Fri, Mar 04, 2022 at 09:58:37AM +0000, Charles Keepax wrote:
> On Thu, Mar 03, 2022 at 01:47:37PM -0600, Rob Herring wrote:
> > The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> > pinctrl: use pinctrl.yaml") resulted in some node name warnings:
> > 
> > Documentation/devicetree/bindings/mfd/cirrus,lochnagar.example.dt.yaml: \
> >  lochnagar-pinctrl: $nodename:0: 'lochnagar-pinctrl' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> > Documentation/devicetree/bindings/mfd/cirrus,madera.example.dt.yaml: \
> >  codec@1a: $nodename:0: 'codec@1a' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> > Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: \
> >  pin-controller@1c0: $nodename:0: 'pin-controller@1c0' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> > 
> > Fix the node names to the preferred 'pinctrl'. For cirrus,madera,
> > nothing from pinctrl.yaml schema is used, so just drop the reference.
> > 
> > Fixes: c09acbc499e8 ("dt-bindings: pinctrl: use pinctrl.yaml")
> > Cc: Rafał Miłecki <rafal@milecki.pl>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > diff --git a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
> > index c00ad3e21c21..975a46f3c46f 100644
> > --- a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
> > @@ -126,7 +126,7 @@ properties:
> >        clock-frequency:
> >          const: 12288000
> >  
> > -  lochnagar-pinctrl:
> > +  pinctrl:
> >      type: object
> >      $ref: /schemas/pinctrl/cirrus,lochnagar.yaml#
> >  
> 
> We also need to update the required properties and the example here.

Yes, see v3.

Rob
