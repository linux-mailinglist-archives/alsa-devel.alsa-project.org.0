Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C7258C89
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FCA4178E;
	Tue,  1 Sep 2020 12:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FCA4178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955328;
	bh=XlCTuRG9aKHJrBqJ5YHYjkSJmfNQjeKpw0/g27pnlb8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7g7rLwVPrlD4AfmK7suci+OOpyvQz5suxFCUOkNUG3FqdjNgKwDGPCYs8saHFys6
	 U3ic7qrIGhQz/uDuBhUWE5v2XOWWbwBJvc6QSFuHeT0tPpdv3rC3i1kJgKo/2fy1DI
	 bRclKrJ2Klp8hSJO3QcJFI1NkSzKD5qP4XXdm9zQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6CAFF8028F;
	Tue,  1 Sep 2020 12:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D391CF80278; Tue,  1 Sep 2020 12:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2328FF801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 12:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2328FF801EB
Received: by mail-wr1-f65.google.com with SMTP id j2so856117wrx.7
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 03:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=60OSzGQnLdO/drci+KqV2aNKAQlqAAKks8TSNwdM2FY=;
 b=APIdTxFt4KVulNDto8BLdD4DeGyyQhS3mkikifZekWscA0v14rKwJa7E5mQdjQfskC
 4G0yDRMIzkOvAlAPNaNJs5Ob0J7rpQunKwPDtSC0b1pMwoV5pRIIL3nkdcL+SqdD2ANZ
 U4txL6YC8ldKhmgzHEo1PlaoySl13701JSuaN6EOt+86xFNudCDE0EMrY4feqwI1ePOi
 bOAgugTd+jj+Hwc0SyqVcHy0mNvi7RVaFYWl2xaZ03o6Q5QPBFikVq/OMWaKfRLJ2C2W
 gYkafISJxg8N7OnMXhZb7zWaoOPKQ/kEojb3TKurXrV3umu3D39Q0IJ8wyAZWq0KEXS9
 PuMg==
X-Gm-Message-State: AOAM533V1LWagRuu7fNr1JTBA8WCJdbmpGCIXRYhKvjE+5nirUCtf8nK
 Lg0lYqvMg19XEueIjAtx2sQ=
X-Google-Smtp-Source: ABdhPJxMqwy/axvlMjQ/xJnNPGIvM2iHQeNPPj3R8YD2jG1F8eJm1SltrAiVX5VChjwgA+YtEBCEew==
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr1171095wrx.16.1598955206626; 
 Tue, 01 Sep 2020 03:13:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id c6sm1490149wrr.15.2020.09.01.03.13.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Sep 2020 03:13:26 -0700 (PDT)
Date: Tue, 1 Sep 2020 12:13:22 +0200
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
Subject: Re: [PATCH 08/10] arm64: dts: exynos: Add compatibles to sysreg nodes
Message-ID: <20200901101322.GD23793@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-8-krzk@kernel.org>
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

On Sat, Aug 29, 2020 at 04:24:59PM +0200, Krzysztof Kozlowski wrote:
> System register nodes, implementing syscon binding, should use
> appropriate compatible.  This fixes dtbs_check warnings:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: syscon@13b80000:
>     compatible: ['syscon'] is not valid under any of the given schemas
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---

Applied.

Best regards,
Krzysztof

