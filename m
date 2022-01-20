Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D114495367
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 18:37:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B7A2DA8;
	Thu, 20 Jan 2022 18:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B7A2DA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642700250;
	bh=71Td/7KYqo3yfaiblh7VPCX7ZH0lPxFgazSQw0Ly74Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IIiwCLkWW+msO/iEan8rEKuSt5w8+NJodqW35UVsDVqtTmav+Jm8CofuZVo+QX6V0
	 l1VE4Mbg4Mos15AlozJSaxbETHzWnuTzMVTsuDgdQWgpE678mUuSKP3xGNLoqAiHpA
	 60db875FyMhV1CWX1HvFSVcC6tRn8paLjqFYXNgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24CFBF80134;
	Thu, 20 Jan 2022 18:36:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7EB9F8012E; Thu, 20 Jan 2022 18:36:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EFC2F800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 18:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EFC2F800F2
Received: by mail-ot1-f45.google.com with SMTP id
 v8-20020a9d6048000000b005960952c694so8461948otj.12
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 09:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQlvojQIJlI1LuVZbEtkS+KlAzI9wBW3pw0XQI8LAMk=;
 b=sIglMDXjuI4RIld2Xn5BfUZtBF61kBzhu7hvjRkqHIDi4VvQebiNOzGTNfGbW8A9SP
 aksJ+xr2mK8HNB66oschngiZy0t2sj32ZNIrMkwOfhQctB9E5Zd0xwCgyaadIi1m3x8J
 snxBd4JM8dnswwW4noJSlxrGn2y1MvITUgygRdRSUUOz9PqXHGeLQKhmH5bolEDWM5r1
 h+rUARgJI1bK78hbSBwrj4Y6MEdSOl3oP+iAVSsu//QyjsNBbyN1oyFtAYfxxB4OVqQK
 6V+sHeNCCuKcrpXY4X+/cJK8WY6KOHVV7yDExrVYemBhsXALvGW+yl7KBVPWxf9iXIop
 1noQ==
X-Gm-Message-State: AOAM530TZ1bSvoDYUdsNnGmpwkpFxFNbX/5rvd9BBcxm8myZylBXbJms
 ouyCQgrzFv05tliiKRUClw==
X-Google-Smtp-Source: ABdhPJzCRxVNcMKOq7T+/Z1lxu7In4u72P8sWp+eMD1DsgHGhcN9VmWOc7txoszaZlPCUT1Kd3fnYg==
X-Received: by 2002:a9d:5a01:: with SMTP id v1mr21602978oth.337.1642700179177; 
 Thu, 20 Jan 2022 09:36:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d4sm1651420otq.44.2022.01.20.09.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 09:36:18 -0800 (PST)
Received: (nullmailer pid 1648421 invoked by uid 1000);
 Thu, 20 Jan 2022 17:36:16 -0000
Date: Thu, 20 Jan 2022 11:36:16 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop unnecessary pinctrl properties
Message-ID: <YemdkDfmemrwab2Y@robh.at.kernel.org>
References: <20220119015325.2438277-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015325.2438277-1-robh@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 - <patches@opensource.cirrus.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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

On Tue, 18 Jan 2022 19:53:25 -0600, Rob Herring wrote:
> For a single pinctrl mode, it is not necessary to define pinctrl
> properties as the tools always allow pinctrl properties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/rockchip/rockchip,rk3066-hdmi.yaml         |  8 --------
>  Documentation/devicetree/bindings/input/gpio-keys.yaml |  6 ------
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml  |  9 ---------
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml     | 10 ----------
>  .../devicetree/bindings/sound/samsung-i2s.yaml         |  6 ------
>  5 files changed, 39 deletions(-)
> 

Applied, thanks!
