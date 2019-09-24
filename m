Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE0BC74B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 13:55:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FACA1698;
	Tue, 24 Sep 2019 13:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FACA1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569326108;
	bh=56qxCdQAgZkZtMtgUpZ1voBcbJP+M/OVGduBKcVRiiE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/b2QCZ6HoyHr6nm9zVRHAX6O4m80gQerW+UoQCJjoFk55S4F1711mPt6d5E/xzx9
	 gkxcSI5h5nb6482XnocwwHw6Q9TkpJLESNewqcrbE6CjZNVqu4d/QYEbMcqG3sndCY
	 h0ytOIJHO+5ttDSIKvv7OpE6wWjtFNM1UNOLGNhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34F3CF805F7;
	Tue, 24 Sep 2019 13:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6CB9F80533; Tue, 24 Sep 2019 13:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A407F80533
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 13:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A407F80533
Received: by mail-wm1-f65.google.com with SMTP id v17so1699848wml.4
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 04:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WNfm1Zs8sa/yhnNl+F7HeaUQPH9XBnoe9OCsFmg1tQw=;
 b=tsfqHnfd/1WN7ckRhSjAQ2nrN23e13l2aPBXIn12diByIcvuZZp5VRTlsOjp6iiWT/
 bh1vuN/dDAhyfDG3CKp8vqtTfsnZ+zthHGemxbCiQr3/zr0vkJcpoDhnsc19Shxmo0Ym
 Uga5v5kBRvxu6FjmNieF6reH+QdkNk9LOsxEmqMfVQ0lNQEL5uDyUGd0fCNiDDd/Jk5k
 I1n1a9LdFRNA9BVmcQZE7/u++bGRWVaLGSKuvFgO10pury/DaBNL90AyCVawGTNGGnQt
 5wqXTQ7ecOQ5eCAmpcKeuZnMMoUAJJQ178HVpfdE8UuKHrd3ZssOckO6mtTjuu4pZKAC
 8h3w==
X-Gm-Message-State: APjAAAVy4smPGqgjrG9UFre8ZGKdxvLYgaRewWNKmG+Sy7phfu9jpmVC
 BmH/lEEGJb2humc/N2H17KQ=
X-Google-Smtp-Source: APXvYqxYnHcckWlHgDM9sqY+5/AP8HA4nq5+Sv98PoYYAkBHju2tePuUAxCFnt9r2RofX53c3Q3lkg==
X-Received: by 2002:a05:600c:2386:: with SMTP id
 m6mr2453390wma.164.1569325990427; 
 Tue, 24 Sep 2019 04:53:10 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id b16sm2506984wrh.5.2019.09.24.04.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 04:53:09 -0700 (PDT)
Date: Tue, 24 Sep 2019 13:53:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20190924115307.GA9188@pi3>
References: <CGME20190924114843eucas1p2ea9c36289d3912e022ad7c9070fc00ee@eucas1p2.samsung.com>
 <20190924114838.25482-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924114838.25482-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: i2s: Add clocks' macros
	descriptions
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

On Tue, Sep 24, 2019 at 01:48:38PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> To increase macro readability added descriptions
> to clocks macros.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  include/dt-bindings/sound/samsung-i2s.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/include/dt-bindings/sound/samsung-i2s.h b/include/dt-bindings/sound/samsung-i2s.h
> index 77545f14c379..fd752475c762 100644
> --- a/include/dt-bindings/sound/samsung-i2s.h
> +++ b/include/dt-bindings/sound/samsung-i2s.h
> @@ -2,8 +2,13 @@
>  #ifndef _DT_BINDINGS_SAMSUNG_I2S_H
>  #define _DT_BINDINGS_SAMSUNG_I2S_H
>  
> -#define CLK_I2S_CDCLK		0
> -#define CLK_I2S_RCLK_SRC	1
> -#define CLK_I2S_RCLK_PSR	2
> +/* the CDCLK (CODECLKO) gate clock */
> +#define CLK_I2S_CDCLK 0

I do not find it more readable because of removal of indent after define name. Also the description is not accurate - you documented, not increased readability.

Best regards,
Krzysztof

> +
> +/* the RCLKSRC mux clock (corresponding to RCLKSRC bit in IISMOD register) */
> +#define CLK_I2S_RCLK_SRC 1
> +
> +/* the RCLK prescaler divider clock (corresponding to the IISPSR register) */
> +#define CLK_I2S_RCLK_PSR 2
>  
>  #endif /* _DT_BINDINGS_SAMSUNG_I2S_H */
> -- 
> 2.17.1
> 
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
