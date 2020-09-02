Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A9B25B0B8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 18:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 587691886;
	Wed,  2 Sep 2020 18:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 587691886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599062887;
	bh=FjNqcIHsh7BzHOMd1Jic3POpDVsD+qe7+fq8mnsJI50=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+jrlRqhcqp6j0J4D56aWvanZpJk3L4Mxnuhndfb1GASWw4rw5EPgBdb1bNFjet6+
	 zJq10zUpfxp5jKqkJXYkUkC9uwQa4Vd9SFO353sjYDFTg0LtbuRE5NLS0PjR3lHbsS
	 o4mogRDP6EPtoxhjMyiaxa1pZzQMhPSvBnCWqefU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E949F8024A;
	Wed,  2 Sep 2020 18:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 197EAF80212; Wed,  2 Sep 2020 18:06:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43330F800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 18:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43330F800BA
Received: by mail-ed1-f67.google.com with SMTP id q21so5491327edv.1
 for <alsa-devel@alsa-project.org>; Wed, 02 Sep 2020 09:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o/k/jl8kCbC36+2FeLOHphrZjREiZCdM+WriURHXorE=;
 b=cKBqO+hve8QwZhqllOsBMFlkQ0PugfsKWM/yqfG5zMdlPsolPOXbgtUDEXGPIzRgRU
 PenuNyJ5uVEzDuPdvvgJUaj2VRPawecJuFekU+EpCgsRoxW4X/qnOxAcQctK3Nms8yo0
 YF4QOS+W0/gYib0iS2m1vlEQA75IFG6BChfw0BlsO7UIUQCbuxc1Hx/OYAl9R445fCxQ
 kMx27D1noDXBPmzzfR62xGuGsR6EOIhi4avjbrXAdpK0XDb1vuWd6Bt+A3EKp1idT9dh
 hrCKqyB9LQJ2Kt7gF11Os/srwfi7zSJK0dWmB9FhBH7ZvcVNtld1tgRM7SMQo5szDint
 +K/g==
X-Gm-Message-State: AOAM533o1kB2P/Mj95RfqTGqxyP6d9Sp0KHeDAvHmxcdxyq2uzHsLAKc
 fI4TBOSUht4dEU9aAXAB9MI=
X-Google-Smtp-Source: ABdhPJwJuyNgxyGPCkUCKgxVeWeN3ahgf+XnMGbzf/ZL2QQEUetIvvJw1gbkJlFGZoRrBdx+Cq2i1g==
X-Received: by 2002:a50:d7d0:: with SMTP id m16mr772218edj.105.1599062772890; 
 Wed, 02 Sep 2020 09:06:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id z5sm4657068ejm.111.2020.09.02.09.06.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Sep 2020 09:06:12 -0700 (PDT)
Date: Wed, 2 Sep 2020 18:06:09 +0200
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
Subject: Re: [PATCH 04/10] dt-bindings: mfd: syscon: Document Samsung Exynos
 compatibles
Message-ID: <20200902160609.GA21555@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-4-krzk@kernel.org>
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

On Sat, Aug 29, 2020 at 04:24:55PM +0200, Krzysztof Kozlowski wrote:
> Samsung Exynos SoCs use syscon for system registers so document its
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

As pointed by Sylwester, I will send a follow up to remove other YAML
file. This patch could be dropped.

Best regards,
Krzysztof

