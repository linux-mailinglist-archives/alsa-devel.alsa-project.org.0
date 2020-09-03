Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBD325C745
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 18:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFB7C1913;
	Thu,  3 Sep 2020 18:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFB7C1913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599151430;
	bh=VafyGkd2RQV3WY1NMwd4BTj7aNE+8uY7ba0Z+FNdfrQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L+a24aMARh87itnijamBu75Bx4puRXntciWqyrXZ9epRdzW2TdhzYYLztl4bidorv
	 fgwMEnhr4D/7sPibtWTUzqhk7Z+4FXnVYzexANT1/3A0tQS1QI244YyNiqjMoWyKb3
	 awFH65EWJK47VKASlrkZKgNcpBTX1aIoDJqPkQmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D8CF8020D;
	Thu,  3 Sep 2020 18:42:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ABCFF80217; Thu,  3 Sep 2020 18:42:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76FF4F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 18:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76FF4F801DA
Received: by mail-io1-f67.google.com with SMTP id d190so3642333iof.3
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 09:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wd2vM2P8GP7stt4qpcMkqIPITIt3Ct2eJFilR5ppWPI=;
 b=XIf2lTP5lwH9Xmj6T2qRXd+4+qy3cogOcPAQ5+L7it+0jmYMq1/YQWwuZ3pySGc3+q
 y2GtnsVDXwjiEeeYwcTXZVhZBdkpOk9EhBGqZeeAiOw0pm+n52QJopmjVd4Ck7Lndvt7
 JaWmHp0PoTGrNl10Kjth/V5raECUNIC3JCfJEhTgnc9D39iw1menBJbKapDy0Uc9FMEZ
 3NcY8sHeXG1ycbtG252pKo0KMwBerJtKS7xJmyXiX26t4ejRB2YglrdIcufYXiMvXPQ5
 RXiVcv3h61TqsVhEoSY0z4N3o9joUGqEO5xZomtdZzqPpnoabHbHcSDXaKRkQkxYVaQB
 uJdQ==
X-Gm-Message-State: AOAM533tMYm123NlU2ibh9q6NNy7LBy92q9XS30WsgCy1GuYkhnkTTEA
 HAlQZdcZnKeZ9B7BxHPbcg==
X-Google-Smtp-Source: ABdhPJzDecNUqKQf1RpxUDZRVZ3zNdbS9KNP+UvJxBO5cwkdQiDLk1fX4u9oDum9yV0Oyy8pM76AHg==
X-Received: by 2002:a6b:8fc9:: with SMTP id r192mr3940678iod.24.1599151311395; 
 Thu, 03 Sep 2020 09:41:51 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id k16sm1482659ioc.15.2020.09.03.09.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:41:50 -0700 (PDT)
Received: (nullmailer pid 2923306 invoked by uid 1000);
 Thu, 03 Sep 2020 16:41:49 -0000
Date: Thu, 3 Sep 2020 10:41:49 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
 unevaluatedProperties
Message-ID: <20200903164149.GA2922901@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
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

On Sat, Aug 29, 2020 at 04:24:52PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. assigned-clocks) so
> use unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
>     'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
