Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB725C750
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 18:45:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73B2192E;
	Thu,  3 Sep 2020 18:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73B2192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599151531;
	bh=RXn8B7cMLtnL6JgR3+E2Ro4t6hQahjnuOLHVgAJzfZY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iTGC6g+tnmoP7uCGgiEYc57qW62XZdAVXUTftJJP7D5DjYYCprPl7n9ED8DVYKzEI
	 S5Fc5WkhmfYuyn462nNo3eSxaY5pyPDgmCUr4F04VXulQTDp8w7Vy/LnwopIe+YPOo
	 2ElxAGVev0uq5R0z5xMEazpwa/rpBgqIUDu+3bgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8D04F8021D;
	Thu,  3 Sep 2020 18:43:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9FB7F802D2; Thu,  3 Sep 2020 18:43:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C9AAF8021D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 18:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C9AAF8021D
Received: by mail-io1-f66.google.com with SMTP id m17so3641897ioo.1
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 09:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vm4YZ0rV7T1k22Okll5l0Zfn2qIEM+/b9DI6foS5uOU=;
 b=i+4LshemTQGcjYVtw353FGBhA4MjQWSF/YzB/TGzeiNamVEJ8QPFv2jZjDE3uwiWjI
 F7KeKi/EbQKlw7ngA/zHs1GyTFick4NXNtRkk1jr/VBnr17wiwdImcOx7HvhqRuhAqsx
 OkB+uM/bRvMK1svU4OC7FPAcUNrRI3P/qM/MKvxscv9dySJfcxmPBG4qQ01g+vn0dHvs
 /lYNhU4xmnqRbgNWDvsDxhCWQvjRmlNukvKyezF7YJt8dP50A6/aT5qNZoppIyHI8h+s
 P6QR28xAvaZwLLWUjREPW3wX3RhBBO3z3YOhlUIUmdHJCDu4kDLbPX6QGLrKqHfhf78b
 kztQ==
X-Gm-Message-State: AOAM530VXdIwUdOZxrUooFRur8+S4mFRCLf0Kx1EVYfH0dIF3SqDHK3q
 bzUAn/dQ9a4wMs4hcnirBw==
X-Google-Smtp-Source: ABdhPJxdGWvSm91m5o4p27kxDEJ3BksNrLtWiBafKboKccHq8iHXL8Nu/05NN9zEgfjXFSxDiBv6CA==
X-Received: by 2002:a02:834a:: with SMTP id w10mr4193188jag.63.1599151401695; 
 Thu, 03 Sep 2020 09:43:21 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id w12sm1483444ioa.8.2020.09.03.09.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:43:21 -0700 (PDT)
Received: (nullmailer pid 2925553 invoked by uid 1000);
 Thu, 03 Sep 2020 16:43:19 -0000
Date: Thu, 3 Sep 2020 10:43:19 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 06/10] dt-bindings: sound: samsung-i2s: Use
 unevaluatedProperties
Message-ID: <20200903164319.GA2925151@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-6-krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
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

On Sat, Aug 29, 2020 at 04:24:57PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2s@11440000:
>     Additional properties are not allowed ('power-domains', '#address-cells', 'interrupts', '#size-cells' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/samsung-i2s.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
