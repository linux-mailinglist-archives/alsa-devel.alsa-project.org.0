Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C939258C86
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A44E11779;
	Tue,  1 Sep 2020 12:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A44E11779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955284;
	bh=MGKnqLB1Ou22tvMwPIOerrs+OgaBk6N/30NyXTiKcuY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pn0u1r1OA67GLFkf29/lj+Rgi2TGO4jJe/D+u4aPyLRxO75eAZtTuh1Wto1afZxCB
	 udCSnu5ziTEG4V+F+tOuAyQ7v1R5JgqnlfEZXm4XP4Ms7N0PEepyZKJKX56C0jJZud
	 gmQLPzDyjecgJgGtEmzfmmHzHTHDpA9ousNUrExE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBF72F800BA;
	Tue,  1 Sep 2020 12:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B272F80217; Tue,  1 Sep 2020 12:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E73ACF801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 12:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E73ACF801EB
Received: by mail-wr1-f65.google.com with SMTP id t10so16825wrv.1
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 03:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=giRtIzkTWnj/UGp/V4sDByGnQWeXY4LNtuNjTm7i638=;
 b=ohb7+nie/3wMeTWDdMT9SC5UhOnp74awAytPCBOI26cDZTs5j7AxtLIBCbsgE6jwpv
 6/kqHfXMMhLmootrWXs3RsD95juNwxA9f4U6x1Q62HrM6O84m8ylCydGmYt9UPvHAiG7
 T4d8Xvuk3rwicF5DPMIzICtkB3o/k0+ZUlN48SnkkMGE717CNeSny72/AyYmbEokhh95
 ngspVwScAyvxTcv5U8pbT+RiTZ0oUm+ie+wAJulbdVGSXSyB+Yk9PBvNzNTLeRUZzYNj
 6/R2yl1Zid1XTwPuTbRowzcI6Id+A/IHVdetVtVfdgV/DuPTmZOXZLMNJ1DW7r9ptwex
 8ihA==
X-Gm-Message-State: AOAM533Ux4r4UtBlCpx7xpPh9xdJjiaqPoH/rAIg6O/Zc9wVJH29Pub8
 28B0cMR7rFtg+3ehuBxV034=
X-Google-Smtp-Source: ABdhPJwK8OxvCf+LETTT3Ik4h2RI46o1x9bZbn8w3PgBgHR26b8+DSaVMTksnsrFbuik4iajwXifkA==
X-Received: by 2002:adf:9ed1:: with SMTP id b17mr1049306wrf.227.1598955170218; 
 Tue, 01 Sep 2020 03:12:50 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id h5sm2534234wrc.45.2020.09.01.03.12.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Sep 2020 03:12:49 -0700 (PDT)
Date: Tue, 1 Sep 2020 12:12:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Lee Jones <lee.jones@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 07/10] arm64: dts: exynos: Replace deprecated "gpios"
 i2c-gpio property in Exynos5433
Message-ID: <20200901101246.GC23793@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-7-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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

On Sat, Aug 29, 2020 at 04:24:58PM +0200, Krzysztof Kozlowski wrote:
> "gpios" property is deprecated.  Update the Exynos5433 DTS to fix
> dtbs_checks warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2c-gpio-0: 'sda-gpios' is a required property
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2c-gpio-0: 'scl-gpios' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--

Applied.

Best regards,
Krzysztof

