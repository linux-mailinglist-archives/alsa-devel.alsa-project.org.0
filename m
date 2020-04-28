Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A282C1BBB5D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 12:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AE3C168E;
	Tue, 28 Apr 2020 12:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AE3C168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588070312;
	bh=Fx1J7yibPLEw6znm8SeTDz6AUktBBl25nlzB07TSD0A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bK+Y+WDZihQzomCaWs7Oc+8r3PtfQcd+UxxhFX/HOHCEF3BrTNLwpSm6ejwJq6xDf
	 S01Bjf7BoBvU6u35DusWIg/AeyaHwf5gfDzbvDCedThNlwZx4gajZMijuaWfzNF/YT
	 k4Va8Xld/+9BEI+066OmBDNJPuaCTSbLX0HS82EY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22B83F801EB;
	Tue, 28 Apr 2020 12:36:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA370F801DB; Tue, 28 Apr 2020 12:36:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79120F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 12:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79120F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="f6wfaq6d"
Received: by mail-wr1-x442.google.com with SMTP id j1so24050795wrt.1
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BHqjt1t2DhfWJ1/1kKGvSeNrwY7VYPAdj03G60NkxGk=;
 b=f6wfaq6dWOosZttEbWFUigERrQKtyelJdzMu3KaOhe+0LwI9pFLOjTiSMzZuuUnqdQ
 x3MOI9EKRfhZWLSjWNdNwE1uXVk1ZZOXgpeWYol8IAO6IhLCK3cmADCySsZO1Vx3EQPu
 W5xirJ5ip6/i/LLqEBJiLl9A5owHAGqXmdPPP83hbkWagVeIrFkoh2FYhvpx70/X3+nT
 gIF4PEdmE3qZgUwSJ0WUjx7xXVvQPrmPzTcJq8qMhFtq7ku4PvdhRLC03ZZjpH5rRdyw
 WXRdo3u5N1qgX3HeyBU/AN+B0CoMFe6YLszKgHajxzLP+PYti+wzgzks93/Vv0W+GgzR
 dnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BHqjt1t2DhfWJ1/1kKGvSeNrwY7VYPAdj03G60NkxGk=;
 b=UbYoVqdk53JNMCVYn+duhEeBtQOvRmT0obAagp21G8ck40581TZw923yQyXbI3jfNV
 tpLbomNMOhmxafBwCgkA8xudUZo1PiyvJktwE2K7eok0Jj41QIjACK9S12jT/NXNGiC7
 lJpuaQP4h1DzFGvP3O3JtX8UrRXRJIqwpikodmgNo3RwuIlHTKINHl41jRGWdHBOonx/
 m1IuLtCZL/SCe/GTTqdBmQ0jbQcyYzu0N5ZXXcrgX/7MYxo3FXMKwJx1a/ZsOFcn3aRg
 JcFvpnKlXhlmSOiwO5Ta3WEdF95q1tKgU+0wUEHQU5JKKOFLZ4xFH2OROS/1sMOqUWg/
 gOwA==
X-Gm-Message-State: AGi0PuZ8i3zVLpVUbMOqYcQphNtwp275nsOB3+QxSxaRomZP+IxyvHRj
 3378N+jNEni+w9Pi23aVusdA7Q==
X-Google-Smtp-Source: APiQypIhwr4oWY9O/EQP4CeY2gIrC2pk0Lyc62kILtt31clrfdbBJtYE6pA/gmyXol5Tg21gBih4OA==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr31423829wrn.89.1588070200647; 
 Tue, 28 Apr 2020 03:36:40 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id q17sm2632337wmj.45.2020.04.28.03.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 03:36:39 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:36:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: wm8994: Silence warnings during deferred probe
Message-ID: <20200428103638.GP3559@dell>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074843eucas1p1a3a265df0c7f14b0aaec25eb65daf606@eucas1p1.samsung.com>
 <20200427074832.22134-5-m.szyprowski@samsung.com>
 <20200427112202.GB4272@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427112202.GB4272@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
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

On Mon, 27 Apr 2020, Mark Brown wrote:

> On Mon, Apr 27, 2020 at 09:48:32AM +0200, Marek Szyprowski wrote:
> > Don't confuse user with meaningless warning about the failure in getting
> > clocks in case of deferred probe.
> 
> >  	if (ret < 0) {
> > -		dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
> 
> This completely eliminates the diagnostics which means that if the clock
> isn't there the user is a bit stuck trying to work out what's missing.
> There should still be a diagnostic.

The driver won't defer forever though.  The final pass should fail
with a different error.  At which point the error will be released to
the system log, no?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
