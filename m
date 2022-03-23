Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 149E14E5485
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 15:47:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3F6163C;
	Wed, 23 Mar 2022 15:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3F6163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648046846;
	bh=EkSDHMY2G6RKQEej6MnbmDxwy7UWMK780mua6hC9F1c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hDjUcBG9LfVOInOqhgTUddcvkWtePUkLMZxdhOYqFiGSzzBBoihW7zJm+9vg6Z/s4
	 8z/IUBOUyBJ0jsOl1saSsUQnaDjpdYGImY4y/5GxGcdU1vMwY6pPEuHDdl+i6702kQ
	 wan9673FHDKrhIUzovahoMs/uAr8jCDYkY4/no80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 208CDF800C1;
	Wed, 23 Mar 2022 15:46:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0117F802DB; Wed, 23 Mar 2022 15:46:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A044FF800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 15:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A044FF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cZaXEPpa"
Received: by mail-wr1-x432.google.com with SMTP id a1so2449127wrh.10
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=osLyPR/OysO0/n11H7AyANhO10/CTJLTc9ULyTX82oc=;
 b=cZaXEPpaknkOxaMXvhQ/HgoGQQU3YKPajtONR43xfSdCDY5mvCG32dpUXAP33seVEl
 8OQt1m76wmS6muVA1bUZgRX7CYPa81owPkhrk1JN3JJncVVzoJ3cyuwt1UTA+SDxmey+
 WTqvzy3ih5pu4sfTv70YVhN7Bb4aVO7vgCL4G5X+1TX/MUreaM/8g1gM4fUuLYzxOuEB
 mA6gW2VhEHSQ1fN1mbUWmirYp9sVNGx64gLIy5Z3WmDPFxvN/ed3jkl6dRZQQuqAuOp+
 5ALQyjz5TFBOMZfrqoye9rXuhCf2tIx0g73qNocysYPw9WZSCFQprDGeszbnJ0+24PeW
 OEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=osLyPR/OysO0/n11H7AyANhO10/CTJLTc9ULyTX82oc=;
 b=0m+9jWzR3xifDaAbWp3QJZ7ULxuDdonDpiZ8EPC6ZbfSgz/FMNoQoQ8Q2Eafh3N9nl
 VNb2Cwig6o3UBycyyu6cSoFAkdgn6uSqRUdIfdTgIV/na/ySWfh6tw8bxLN0yPo5Ytv2
 LvdxWSg3tPkmnR30ulzc6z27p330vy1nz2QvZ3OMlp3UYWZUFUGLxz+ZTTuriS6nTscy
 UwPoNsK5jPRUBvAxk6pS59crEVWisBOpYgMlGLaAlkZTysXGmEB+2pLLUl+5rVrShBGZ
 dBsl/zbTq/+SfuJQzs1MySkPApLZH07PmSfVBW3SBvn7c5E8GI0NolxnbFG2YGlhIKN4
 HRmA==
X-Gm-Message-State: AOAM531ZbvqJbCUwL+O5Z4XZo2An75OinK0+o3qjxpiwT8dgT6fgq6DC
 Qk4UjWUpfJwlHd47ZF8iyII2WA==
X-Google-Smtp-Source: ABdhPJwTcfLiKGZ11ta0GNYR4Mm2J9YZsnvUd4S4bvVfvkGomvEYYHwOhL03vKx+NQVzEU+Tkz2XiQ==
X-Received: by 2002:adf:9794:0:b0:203:e074:1497 with SMTP id
 s20-20020adf9794000000b00203e0741497mr127921wrb.75.1648046770723; 
 Wed, 23 Mar 2022 07:46:10 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b0038b7c4c0803sm4213009wms.30.2022.03.23.07.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 07:46:10 -0700 (PDT)
Date: Wed, 23 Mar 2022 14:46:07 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: mfd: Fix pinctrl node name warnings
Message-ID: <YjsyryNcGm9ku/kF@google.com>
References: <20220303232350.2591143-1-robh@kernel.org>
 <Yjl6fP2Bylv6ud8W@google.com>
 <CAL_Jsq+5GkEaE9sf5HJMaNQLkZUB_q2Qyv2rzADVD7if1MNvqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+5GkEaE9sf5HJMaNQLkZUB_q2Qyv2rzADVD7if1MNvqg@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 - <patches@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

On Wed, 23 Mar 2022, Rob Herring wrote:

> On Tue, Mar 22, 2022 at 2:28 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Thu, 03 Mar 2022, Rob Herring wrote:
> >
> > > The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> > > pinctrl: use pinctrl.yaml") resulted in some node name warnings:
> > >
> > > Documentation/devicetree/bindings/mfd/cirrus,lochnagar.example.dt.yaml: \
> > >  lochnagar-pinctrl: $nodename:0: 'lochnagar-pinctrl' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> > > Documentation/devicetree/bindings/mfd/cirrus,madera.example.dt.yaml: \
> > >  codec@1a: $nodename:0: 'codec@1a' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> > > Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: \
> > >  pin-controller@1c0: $nodename:0: 'pin-controller@1c0' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> > >
> > > Fix the node names to the preferred 'pinctrl'. For cirrus,madera,
> > > nothing from pinctrl.yaml schema is used, so just drop the reference.
> > >
> > > Fixes: c09acbc499e8 ("dt-bindings: pinctrl: use pinctrl.yaml")
> > > Cc: Rafał Miłecki <rafal@milecki.pl>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > v2:
> > >  - Fix lochnagar-pinctrl nodename in example
> > > v3:
> > >  - And fix lochnagar-pinctrl nodename in 'required'. Sigh...
> > > ---
> > >  Documentation/devicetree/bindings/mfd/brcm,cru.yaml         | 4 ++--
> > >  Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml | 6 +++---
> > >  .../devicetree/bindings/pinctrl/cirrus,madera.yaml          | 3 ---
> > >  3 files changed, 5 insertions(+), 8 deletions(-)
> >
> > Requires rebase.  Doesn't presently apply.
> 
> It's already in 5.17.

Oh, I see what's happened.

I provided my Ack on v2 *after* this was posted.

Makes sense, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
