Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396CCBF4D8
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 16:15:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A819A175C;
	Thu, 26 Sep 2019 16:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A819A175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569507311;
	bh=lBVh6iswywJBD8J7X6og7Ag4wcW00Bljh6iYgTEKeG4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iX3vBzK42WEMFPefNaQsODaEhqCjCAYJnbU9oayVpxDGRr+fzxCsgyXK4NAOq0stZ
	 S9LxzOKpV6mE1PA6947z9nmvYCa29WJEs/nWaYqsIYL+t7Ft1131ErBTLJCbbGsF5K
	 ji5yPvYcVwM1HCmDGgEcyAZX+KY7u17LUNGj+JWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05DE4F802BD;
	Thu, 26 Sep 2019 16:13:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12941F803F4; Thu, 26 Sep 2019 16:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6798F80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 16:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6798F80213
Received: by mail-wm1-f65.google.com with SMTP id f22so2766785wmc.2
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 07:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hBZ8CcivE1NYUxc5O3ZPMVIRE/wsSIlTMNpDwyj/BXg=;
 b=plFgSPAZeGRkMtXxtUXv4o9DM1einkDaayfEFSrH025lRYdQYX1J44jIl8lY4gRV1r
 Qnrf0GPAtXfiJHYCvXORmvuUmBccPeklkW9w0fuAopew+KwPg0kxGLwWa1dnBAO0l393
 QN9R/wpOny2M+ESFKWlnI+8WfrXzGB1hTrLV7bqyupoXKz/WoVfcc2GnArQCIDsh9Nk3
 OK29EjG0bjZHu/fjjGYbzQoHM5YGRUaDqPwQq7wr9kRY4w02M4kNhW/DoLJ9omf8VdFx
 jPUYgatH133SBGd0XKQyJXewhm8zfKwrLB67Ny/pCd8vRx5vHFbl6Yi+JhbnWMzBZhrk
 VYDQ==
X-Gm-Message-State: APjAAAX0uNpYG4fZdeRh/os+wjPeewb/Rnx/O+bMmIDZXnUXt7VDXmvO
 dPq3eJtJGckO8PKxwbqAPWs=
X-Google-Smtp-Source: APXvYqwFGmBsmHkzm5BSclLX9I0aHlju/5ZEtE1O/WmLwArVHDoSrkBS7RuTKuyW+Dop4GgKC7Wfrg==
X-Received: by 2002:a1c:9dc1:: with SMTP id g184mr3132920wme.77.1569507200896; 
 Thu, 26 Sep 2019 07:13:20 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id h63sm4348246wmf.15.2019.09.26.07.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:13:20 -0700 (PDT)
Date: Thu, 26 Sep 2019 16:13:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20190926141317.GA16044@pi3>
References: <CGME20190926110226eucas1p24dbb1b39ffa3f607aa28c0c4d9ff6aba@eucas1p2.samsung.com>
 <20190926110219.6144-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926110219.6144-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: samsung: i2s: Document clocks
	macros
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

On Thu, Sep 26, 2019 at 01:02:19PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Document clocks macros with their description
> from 'Documentation/devicetree/bindings/sound/samsung-i2s.txt'
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added proper commit message and description
> - Moved comments to the right side
> 
> Best regards,
> Maciej Falkowski

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
