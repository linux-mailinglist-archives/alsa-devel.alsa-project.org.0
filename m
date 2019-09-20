Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F25B8FCE
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 14:29:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B111683;
	Fri, 20 Sep 2019 14:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B111683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568982588;
	bh=euw/zCooeh9QFNP94a2mOeMBHX9ek/OaaVXtRtGHcwg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=neuAboV26/HW1yZyK9QYTEzwJnAO4CXkqftuAeSiGWo8vcs+enwNcvMsIavW4n/Cf
	 Ef6WxPQX3zzjxHatS1F4JHctEaiAKiZrWXHhQ7ESTEzTLsG3mq9RavX8JTM0spcZwK
	 4TlZGoCwNGQT1G325FRUgBjkjZnEqKj0Frd3Qn74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C66F80535;
	Fri, 20 Sep 2019 14:28:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14811F80535; Fri, 20 Sep 2019 14:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF27DF800C7
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 14:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF27DF800C7
Received: by mail-wr1-f68.google.com with SMTP id r5so6538985wrm.12
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 05:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GA3pOvw9cvyvH9sQ+qekD5v2QhBspBBVn0FQG6OPUYU=;
 b=hzuUPkJO1jLbse6G+fPCsR/I9kSGyTCYYS6tipMCy/lZjICgeQXYLKpw6bcsCN9E8F
 vglMTyfakCvVEldOVvEzp7b1eqAJPWblVblwcFqTRGdT5c4KCP1qF/NOD2BchJsoOy4l
 uMoBZ9zSbvuOWRDlpBv91lGA2JbWIrmT4oyT5J1YVHkPIlNz73JTo3WAeW/Z7S9cDx/N
 JqAUgeZj5pNTyhcY8/D/NSQkGvTyppFT0F6+5g7pfv4Om4+9oJPqmWfKRQsT+35JrW2Y
 5JHVhswbQtc/wKjglDxBbqu49Gdxodp0pl8jUH2CYpsr47AyBPNaOIbQS6lN6Bacyz81
 +++w==
X-Gm-Message-State: APjAAAV8NpgWqMa3z6m3N5+HWj5FdlCfK4Ll/fOiEOOYCVM+llUyT7qe
 ko+iWU3/QmhgePvuaLvqO10=
X-Google-Smtp-Source: APXvYqxmnGq2oEEutMlmvckBo6TPiKxSSizcfXtvJxNZXc6nbSs9KT2dgYsJ0qwY1AyhJqAnzhcTjg==
X-Received: by 2002:a5d:430f:: with SMTP id h15mr11854947wrq.177.1568982499009; 
 Fri, 20 Sep 2019 05:28:19 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id n8sm2186709wma.7.2019.09.20.05.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 05:28:18 -0700 (PDT)
Date: Fri, 20 Sep 2019 14:28:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20190920122815.GB26862@pi3>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <CGME20190920121525eucas1p27562c205c41200221540b720c9084fb4@eucas1p2.samsung.com>
 <20190920121431.31678-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920121431.31678-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ARM: dts: exynos: split phandle in
	dmas property
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Sep 20, 2019 at 02:14:30PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Change representation of phandle array as then
> dt-schema counts number of its items properly.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 14 +++++++-------
>  arch/arm/boot/dts/exynos5410.dtsi |  6 +++---
>  arch/arm/boot/dts/exynos5420.dtsi | 14 +++++++-------
>  3 files changed, 17 insertions(+), 17 deletions(-)

Looks good, I'll take it after merge window but why this is in-reply-to
(inside thread) of completely different patchset?

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
