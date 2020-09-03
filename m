Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A4D25C748
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 18:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC981926;
	Thu,  3 Sep 2020 18:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC981926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599151484;
	bh=2RtfrIJb5ZRLOqfhHZZM9Tv1Uch+g6P3YOoBgzDYitg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CBI18N2eauQnK9IL6N/f58d6b6c6cRgtA4/OVu97Pa0pn3DLD/MXa15Mmbp8GYDvb
	 TNEl1L2tbXXmw56VlTIhGQL2ZiPZaRD7rwby8aGwyYqsq7JjZ3C1x/DUmpd3y6iORA
	 yYon0+V/rx81OQVcW4Zm7FY0LT8lmjZqIjkCtz+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE62F802C3;
	Thu,  3 Sep 2020 18:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B29F802C3; Thu,  3 Sep 2020 18:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 778DEF802A1
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 18:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 778DEF802A1
Received: by mail-il1-f196.google.com with SMTP id t4so3335153iln.1
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 09:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3N9AevB6RmnRGPj8FDy4IK+19+ZllXrOBzHdsEB5tpA=;
 b=rMGe5U8MPDguG4wu3oCdT0zwXb0gZJeGSJsYekNblSIRdc2YwB4simxduf7xWGfvJO
 +TYneEaVRAfKPtTtEYCOSMYc0hq6ZZ3zLIqXsRGFpVYdBpu5cqdckZK1ei/B4SDX+e6R
 22AQfWSX/SnPkQ1/SMaRiFtEACxSiHPjrWTTO1qKA2pNEalD7myfgUZ9MYekBcq7RUai
 ffAuOzPY9sd40ZfvrG6Wejj5xx0GoKBeIUahasV9CKxlbvA/+Xt33ys9EgxtUJ0iFsbX
 IgjTosvB5Ju/UTtHLPedzbtDJRIwFxIuVm0CBQ3lLAXrC6RS8F256RF/pa8s78I4VGzN
 OoNQ==
X-Gm-Message-State: AOAM530a7PgxTDQpu5n+J2Lu6CwY0lWWYYPY1Ue9P3x3EbWYwFV83Jxo
 XHR6sei2OBIFUA7gHb6o/A==
X-Google-Smtp-Source: ABdhPJxRAYyjUZiXDXO4KvACDThXQaoxGDmQVYPWjjr53PXDSj6UE7VQ2ryTEL5P37If/VKc8+Se/A==
X-Received: by 2002:a92:6606:: with SMTP id a6mr3867837ilc.128.1599151368926; 
 Thu, 03 Sep 2020 09:42:48 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id w26sm1755180ili.34.2020.09.03.09.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:42:48 -0700 (PDT)
Received: (nullmailer pid 2924734 invoked by uid 1000);
 Thu, 03 Sep 2020 16:42:46 -0000
Date: Thu, 3 Sep 2020 10:42:46 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: timer: exynos4210-mct: Use
 unevaluatedProperties
Message-ID: <20200903164246.GA2924432@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-3-krzk@kernel.org>
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

On Sat, Aug 29, 2020 at 04:24:54PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. clocks) so use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: timer@101c0000:
>     'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
