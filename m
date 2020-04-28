Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09A1BBB5F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 12:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960981686;
	Tue, 28 Apr 2020 12:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960981686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588070361;
	bh=4T9XwV/ppWKN/8lv3Wb5TqYljZl0WWOWVZLuQqZhyto=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNjtoxN732hoURbQdiXpDuiEzKexkt+K5M/j8Fm5of0C1YB86x6+paV3IHS3f5qro
	 nNPkYGKA/n8nqvzDEjq+utXNF41F5bl7Qt63DphuOiio+KOiPqtoIGVJuqgv3EVAJY
	 lZ7UrrjYhcNsOK2xPQ9SEkT5j0Pf7zJTAQiIAb+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FA2F8024A;
	Tue, 28 Apr 2020 12:37:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD971F8021C; Tue, 28 Apr 2020 12:37:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7120CF801DB
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 12:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7120CF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FXE7jWkX"
Received: by mail-wm1-x342.google.com with SMTP id u16so2265818wmc.5
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=D8psmyYEtN8Z2pq4q8A6sTe4dHln0Jw+fnsaaC8uTYk=;
 b=FXE7jWkXt/8YDgD5af9Adko3ZoKRvikJM9bS23w8DI+jgkRjz18xtRrogbbmjbNYiG
 1KSB4F6mLsF4rybsW4R+Z/JUPtDyt8Gra9jHJiMp+376YAv/1QL36xbbzf8h5RwcQMEG
 nGqfgX7GbV1Sjn2StNzrUC1hi+2W6K+ka2/GxW6ZRuvcqcwYe/xZ0wFw65vC3dOC8FmK
 xha3sP6foA3+kbLp9cHY/2CTlwOgEFGYtPXCb8Gleiy3F/MeVwslCCkdzxOQr7HsL7iW
 eNQa3BRuh7u3Omz5BcX0JH92/Xq0kzh2GmsHa/zr/Met8ZlQHkqkrdGGsIPpMbH0CvXc
 8/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=D8psmyYEtN8Z2pq4q8A6sTe4dHln0Jw+fnsaaC8uTYk=;
 b=mNJmTQJrCUrAKn9w/nRaHGEq+UZrYq06uAwCMN4aLcfVtUL5WI9jmjEN81YIyepcfG
 xBCREri7IC8SlUXO2L6eZVmPhwZLK2aMZPjpa9RZ5nc411TnHqpkWLGTek6xe1pjvGpw
 3FXhBhJtspmopMaJFhyrtuFCLI70uzKKZKvYWWlEsAYoJMhYGPmq/kSK6rezenRkiFyz
 qY5m6MmHu/DHcdviqJA1a/utk0cCDThKMkGO/zQtNO/zCSqeMD9294j/lakuvNJcvYLf
 95URdT7gm/R8DSoHyZ1udPpW16ba4ypIjuTD9r9yhtlGw94T1cRSPi3htiyUfawk16VE
 ZBnw==
X-Gm-Message-State: AGi0PubuArCjL9WhrITi2hAxCcNCvbbtnVOHo885LBsGGOiOOj/uK6PK
 CSIj0EnR/BCkHVuj7qFYrUtV3w==
X-Google-Smtp-Source: APiQypK8X1fXoKcP9x6DDd/rjoa5KhpafxYy9uVPe4QqZ8y7ujJuURQ6h3E5Fy/v6bbENVt1m3CqAA==
X-Received: by 2002:a1c:5683:: with SMTP id k125mr3743532wmb.17.1588070224229; 
 Tue, 28 Apr 2020 03:37:04 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id h5sm25593874wrp.97.2020.04.28.03.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 03:37:03 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:37:02 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/4] mfd: wm8994: Fix driver operation if loaded as modules
Message-ID: <20200428103702.GQ3559@dell>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074842eucas1p1abfb9af74f0d898ba381700f37820318@eucas1p1.samsung.com>
 <20200427074832.22134-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427074832.22134-2-m.szyprowski@samsung.com>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Mon, 27 Apr 2020, Marek Szyprowski wrote:

> WM8994 chip has built-in regulators, which might be used for chip
> operation. They are controlled by a separate wm8994-regulator driver,
> which should be loaded before this driver calls regulator_get(), because
> that driver also provides consumer-supply mapping for the them. If that
> driver is not yet loaded, regulator core substitute them with dummy
> regulator, what breaks chip operation, because the built-in regulators are
> never enabled. Fix this by annotating this driver with MODULE_SOFTDEP()
> "pre" dependency to "wm8994_regulator" module.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/mfd/wm8994-core.c | 1 +
>  1 file changed, 1 insertion(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
