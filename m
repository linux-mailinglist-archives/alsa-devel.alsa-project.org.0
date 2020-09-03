Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A125C747
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 18:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBCC8190E;
	Thu,  3 Sep 2020 18:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBCC8190E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599151474;
	bh=C62qZtvU1LK8ekrlPR4F28bMHDUImJe8bnDuR7yrADw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KrbdRtDB7ft4NVsB8nZ1t3CVs0bLcy34GB0n0xoz60BkcHkhfRcS81lu4jv9eQ/tF
	 u49A1d1Afod0efy+V3JEJ4sonpTpW3Q4rv6ZTIgUFNVIiFNHM7gv0myJjuE5EfC2om
	 9YfaEeZXgLekL/qSdLBNTi/J65V2ugVwwSsSQ+es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21F7CF8025F;
	Thu,  3 Sep 2020 18:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90E24F80278; Thu,  3 Sep 2020 18:42:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B66DDF800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 18:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B66DDF800F0
Received: by mail-il1-f193.google.com with SMTP id w8so3286138ilj.8
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 09:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Sphnv+kZz9m5G/Scys4rI5dlFuqK5i9UXTX5h29xxM=;
 b=nfT8wqgNXbf8TqoCudOTt5mCB5qwcku1xffC9XAXmAKIaqhkX2TWa4BmsaVrL5hylK
 s6JanhDnlsGAdCkPTvdXlBXkzD6AeD9Mursy64FAFO5Ae3vlsNy9UTZp7QtckyZ3IapX
 8qLTX4CKX9Rg7w7kG/UDE8vXPLvmt5tyDB9iTdSfNUvoVzL5Ol/t+Ag9gAxQ1sOuKa7C
 E518NCZxAFnLIkKHaUp/d2unbYH9EwqpFRKOvW2W6qo+aiI8po1V9aiESqa7CK22km2w
 eSk2IJ7HWK3TNmR4Rm22ZdpxQalFj1IaRb/FxWKTzyayBfMCkuFxSvxAjUPHdpndgdYc
 xgLA==
X-Gm-Message-State: AOAM532yp7wOMVrg8ye8GhwT8IfroQcLKdw9U5kPg3x+19RfkZcuvgmh
 rE0iBItEphNUlhwmr8MB2A==
X-Google-Smtp-Source: ABdhPJyf5z2NqnEUDQWThMqUbFgeD+F0Z4y8wVXxVNOYbxoIN6ARDFco2WA47g884qz86E7kb3prsQ==
X-Received: by 2002:a92:bf0a:: with SMTP id z10mr4215186ilh.39.1599151345148; 
 Thu, 03 Sep 2020 09:42:25 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id p78sm1578646iod.0.2020.09.03.09.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:42:24 -0700 (PDT)
Received: (nullmailer pid 2924166 invoked by uid 1000);
 Thu, 03 Sep 2020 16:42:23 -0000
Date: Thu, 3 Sep 2020 10:42:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: gpu: arm,mali-midgard: Use
 unevaluatedProperties
Message-ID: <20200903164223.GA2923881@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-2-krzk@kernel.org>
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

On Sat, Aug 29, 2020 at 04:24:53PM +0200, Krzysztof Kozlowski wrote:
> Additional properties or nodes actually might appear (e.g. operating
> points table) so use unevaluatedProperties to fix dtbs_check warnings
> like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: gpu@14ac0000:
>     'opp_table' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
