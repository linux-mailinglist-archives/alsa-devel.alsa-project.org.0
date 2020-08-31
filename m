Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E561D257965
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 14:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8144C1752;
	Mon, 31 Aug 2020 14:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8144C1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598877390;
	bh=kArTAMCnRklLSjboZvy3ishXpCwt8hGzMmtpI02TPmY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ABLpPCxEZamPc1JfdLrrNOxLaJEMNqH/cS5UnB+D7+LDn5In265NjYZQb7g0JnsWx
	 Y+t6/gLxZxjGLEhcmxv79VBKhg4jBy7FB9jMM5SCW/rsx9MAq3YiVo7xgz+rh6yqXp
	 eII3+A9HE0ezc0gAmgAEZjzmmwakyRiEYEXN/m5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95C73F80058;
	Mon, 31 Aug 2020 14:34:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08A61F80212; Mon, 31 Aug 2020 14:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63481F80058
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 14:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63481F80058
Received: by mail-ej1-f66.google.com with SMTP id nw23so6845886ejb.4
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 05:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gZ0CJ8Hc1sn63t+kbr2ePS/jsX1/ElRjSGgnzflGJ5c=;
 b=ThZOcVjvsrf+kqy0/UY5yGJ6icrhh3L/Vt26JPGYadr9JTBo6Ae6CjwJVKWjBo8jsy
 vEMvELLYInnXlssThiiqNssxc0ElQkjXl3PjMh8fLL9nqkCqLVtGatRTWPy9G3JNOXzE
 bI2Wcb/ei2aLERZKHnYhcmDjaKVF2/DmTsU556AgIxQnN5jpvx3J6n722uxtzxmQVoYp
 Ajxo1PU0pkn3uZToRbFgzXFLInov7usaKWiX/98gkngVHOu768gDTT9w7fQuo5G8eDf6
 gfAQ0oUqD387OUX0gotQYBM2OI7dleoU6GZcBvwBUx6bWdxjap6Wx+89erLm7F52rVty
 1olQ==
X-Gm-Message-State: AOAM5327l5nipMFdpMvWtvWl0OMSGB4EGe9M26ze4mvrpukkKQT5523r
 ld+xaoLEJHlHyPk4Hxhtbbs=
X-Google-Smtp-Source: ABdhPJwHQ+kbuB17V3EV8bJwx6CZ9YUlL7K7t8FmVxpql1tXRrhoh31zM7AD8jShfHwOzEmNhb7SKA==
X-Received: by 2002:a17:906:edc4:: with SMTP id
 sb4mr956998ejb.144.1598877280585; 
 Mon, 31 Aug 2020 05:34:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id y14sm1576652eje.10.2020.08.31.05.34.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 31 Aug 2020 05:34:39 -0700 (PDT)
Date: Mon, 31 Aug 2020 14:34:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 04/10] dt-bindings: mfd: syscon: Document Samsung Exynos
 compatibles
Message-ID: <20200831123436.GA27700@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142536eucas1p12c539f1cd45195adef96f8b752778fcf@eucas1p1.samsung.com>
 <20200829142501.31478-4-krzk@kernel.org>
 <8b0a42a3-e014-c2ed-7403-021f9a476fc8@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b0a42a3-e014-c2ed-7403-021f9a476fc8@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Mon, Aug 31, 2020 at 02:30:52PM +0200, Sylwester Nawrocki wrote:
> On 29.08.2020 16:24, Krzysztof Kozlowski wrote:
> > Samsung Exynos SoCs use syscon for system registers so document its
> > compatibles.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > index 049ec2ffc7f9..0f21943dea28 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > @@ -40,6 +40,10 @@ properties:
> >                - allwinner,sun50i-a64-system-controller
> >                - microchip,sparx5-cpu-syscon
> >                - mstar,msc313-pmsleep
> > +              - samsung,exynos3-sysreg
> > +              - samsung,exynos4-sysreg
> > +              - samsung,exynos5-sysreg
> > +              - samsung,exynos5433-sysreg
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Do you also have a patch updating Documentation/devicetree/
> bindings/arm/samsung/sysreg.yaml with new compatibles?

Good point. This file should be probably dropped as everything is
documented in syscon.

Best regards,
Krzysztof
