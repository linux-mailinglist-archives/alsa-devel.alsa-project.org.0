Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D464CA032
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 10:02:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2951721A0;
	Wed,  2 Mar 2022 10:01:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2951721A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211729;
	bh=6DFf6QAEaQ3dFhixHL6ES+cZqIHg5lwZsNAQUtNzdcc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gf6TC6/LBB3JmqZDbr7q6FF6tpCHcS5qPWTvp7FMGmnTyGo436VEF99aqpL5pLAI7
	 dluhrAPZwc7ZxwvrGObG0BrH3Jl6xHRVWMlu18/piDa09Pu7Uut6ezN2pFnXpdrNsk
	 z9cMP7uZyEOZAkl4jpQop9yBbGfb2SKcrMdYA1tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04266F808F5;
	Wed,  2 Mar 2022 09:34:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A85F801D5; Wed,  2 Mar 2022 03:46:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84221F80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 03:46:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84221F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LN9nnhqI"
Received: by mail-oo1-xc33.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so423869oot.11
 for <alsa-devel@alsa-project.org>; Tue, 01 Mar 2022 18:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wjdqSaPpltqhLridozcEUTEQoIYV6/3L4YmJnQ5z0lY=;
 b=LN9nnhqICRhttXAVr1od9T1t/Ymtpxhtz4tHsjH3dYjcd3Rkq9C9wMhSXlkrlSYC1A
 DlJ/JptFxg1yVABD2c1AkWjsPC7Du3KLmBhl0PmcAe7J/mlUk1cp6g/yIWvbZRRK/ixo
 +bm5IDVzJdC4fxWuoEI4G5CHndK46TO9kW9KbAaQI641rdN+rU1dvb6VBLEpmuuVwgUt
 80QLDod/jgV5iicQ0WoUYh+G5NUspA9Y6GZrYqrOz6zP3KBF8+B00J/JX/kKtJbsLcZw
 Nn9Y0EtKII81vB9nbqmK7v/AXIDRsz2QxYS4EGE2oGDGOXpVkmABqBHnLwBv01oaAEdI
 u6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wjdqSaPpltqhLridozcEUTEQoIYV6/3L4YmJnQ5z0lY=;
 b=QUOxyyw0GK9x4yD9sOMgyBhEh4IAdzt59ncLYa0DwSpzQznkpOQqj/opOF8LuLrO3f
 Dz8d+ygUzTO4FKK9lCScZq/9FAifXt52tuo2DH0aC75krdKQl8uJQzf4Qik05xGTahN2
 yuLSs95hQBj5iuhWJ40AyLOZ/te9sK6hIPVtBWlTILNpne8IHTYq3QkDw3h4Jx4ltKvr
 hUCZqVLMTghzNw4yBSkKV1BK8TAG1uTl0B9Uemc8QJ696O/Ik05G5u1kFJ1nAyUaEkQ7
 xTet3Ng1Tm9sJfbpHc/UI0ZjqrqC+G34IvQs3h8uRMVz9e8hkVx+Q5jR5iL4uEF2Mra+
 MdDA==
X-Gm-Message-State: AOAM531woC/zS5xN9aSufXK+7Uy6w1yQuw7/vtJI/Sq9lTi1fC71QJCC
 tNlDGQaOpWtT03oYkQb2H/UZsA==
X-Google-Smtp-Source: ABdhPJyABJwssvqzs0MiuFje5MNOUuD4BXQpc8Bd2B6R1kdb3joprE0iJZUcrLXMN5kygRaNyqLzdA==
X-Received: by 2002:a05:6820:1396:b0:31c:59f4:2fe4 with SMTP id
 i22-20020a056820139600b0031c59f42fe4mr13722344oow.10.1646189166017; 
 Tue, 01 Mar 2022 18:46:06 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 23-20020a9d0b97000000b005ad33994e93sm7196700oth.31.2022.03.01.18.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 18:46:05 -0800 (PST)
Date: Tue, 1 Mar 2022 18:47:56 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh7a3Gl6PPamTjY5@ripper>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:36 +0100
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

On Mon 28 Feb 13:38 PST 2022, Rob Herring wrote:

> Another pass at removing unnecessary use of 'allOf' with a '$ref'.
> 
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/connector/usb-connector.yaml         |  3 +--
>  .../bindings/display/brcm,bcm2711-hdmi.yaml       |  3 +--
>  .../bindings/display/bridge/adi,adv7511.yaml      |  5 ++---
>  .../bindings/display/bridge/synopsys,dw-hdmi.yaml |  5 ++---
>  .../bindings/display/panel/display-timings.yaml   |  3 +--
>  .../devicetree/bindings/display/ste,mcde.yaml     |  4 ++--
>  .../devicetree/bindings/input/adc-joystick.yaml   |  9 ++++-----
>  .../bindings/leds/cznic,turris-omnia-leds.yaml    |  3 +--
>  .../devicetree/bindings/leds/leds-lp50xx.yaml     |  3 +--
>  .../devicetree/bindings/mfd/google,cros-ec.yaml   | 12 ++++--------
>  .../devicetree/bindings/mtd/nand-controller.yaml  |  8 +++-----
>  .../bindings/mtd/rockchip,nand-controller.yaml    |  3 +--
>  .../devicetree/bindings/net/ti,cpsw-switch.yaml   |  3 +--
>  .../bindings/phy/phy-stm32-usbphyc.yaml           |  3 +--
>  .../bindings/power/supply/sbs,sbs-manager.yaml    |  4 +---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml      |  3 +--

For the remoteproc binding:

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn
