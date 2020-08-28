Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79937255868
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 12:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB1C618A7;
	Fri, 28 Aug 2020 12:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB1C618A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598609475;
	bh=5jQnPaJ15b3lgrTqEccYq7TYJVSW+QMza4rGFIuayPw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3nUGzAjru+LBTmXOv7VF+htbBKsXWYEZmw0YUdY11p+u3n7zo+CMoDXpNt7k0N7j
	 URsfIztzAroW5SC8w9yO9g+EOpw07V9mhNDI10RXKFqxChDJYYU/nAB/JftvBjMD8o
	 HPb6q1o+6D3hytXlYF97OeST7VE0TulpYq486znc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 758B8F8020C;
	Fri, 28 Aug 2020 12:09:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3484F801F2; Fri, 28 Aug 2020 12:09:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8C6FF80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 12:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C6FF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YDvbZll7"
Received: by mail-wm1-x343.google.com with SMTP id c19so519514wmd.1
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=m1YLyJUJCn3oBul9/khpe2532Xp6POTXvt7taeRkGPU=;
 b=YDvbZll7Ma7sTT+UPVORezULJlnx2tLfQ5IeE3Ehw57Kq2kkU/64SeqXuWw20swHB3
 DRSP1n7jHPr8urmDdaKZSWN+tS6LcvCpPSGokVwqyHBZ5IvOprC+08jw+ruC99ayLMuG
 8atji1mzhlt/j6cS1lgrOfyGuwEcNpksJ0etGBqElxC6aXiAhR+hQzrS0PzcfF7Qd6Ux
 oXeBNlOxbPHK4b0Zo0A84nlF+KGFkhzVo040o6iK1myBSFcKSWVru5dkp0z4tzSwLfK7
 LP9lNSlKR5ZaMMfDdYgCsNu4oLwPZAVk2SssF2ZcRVPK5CD3bjwFQU1KXK3W6xzh8aEN
 yqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=m1YLyJUJCn3oBul9/khpe2532Xp6POTXvt7taeRkGPU=;
 b=fxgXmqrOxFDs2S2ZAqOgO3s9i/Giq4d8Je9yAtbOLSoWaxXcAz5FgA6FJKqYmMbWOa
 d1yRVfHshBUnfonZ/bPHyqAAGyghEYmGTVslnasHn55U9kyFSMjStCsvh0vFscpmEMC8
 vLiEU3xmUdDYIRUPe8nmC7P4Vi6Coomgum8IweMDu3lZfbQBT9JGRX0fFojTz+iK/j21
 acHYo7V76RfvvJf6SDNSR/W34xC8pg+zrzctCQY/4JzwhPILQ+TIyl+shX0+OfQ35Rnc
 oS2Ghc6oSh6tYu3DB01dTXAw6ws6XG0TiBBjO/2iijMGzEPOJluF1MWH+BBD2fmd5RGk
 ip0w==
X-Gm-Message-State: AOAM532FWF5MU/vzZF8YHTvCp898iLrUEv74+PL7vQV3EvYpTGBqlkO5
 2HD7frUSATwZ6SMIXPYseVgRaw==
X-Google-Smtp-Source: ABdhPJxgckZPiiORSGh1t7YPnXLaoCx7sqGLxWs0rDpMahar5tKh4ddv01PRLYLdrPq+EKDyrsXwZg==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr837248wmb.179.1598609380973; 
 Fri, 28 Aug 2020 03:09:40 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id c206sm1419164wmf.47.2020.08.28.03.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:09:40 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:09:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] mfd: madera: Simplify with dev_err_probe()
Message-ID: <20200828100938.GH1826686@dell>
References: <20200826144935.10067-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200826144935.10067-1-krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Wed, 26 Aug 2020, Krzysztof Kozlowski wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/madera-core.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
