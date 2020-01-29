Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DD14D086
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 19:31:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3038167B;
	Wed, 29 Jan 2020 19:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3038167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580322671;
	bh=JXtRH/vJdBiqkJCvnNsGEmTAlC6RuKTOLxPbNLJrzA0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZiZ2x1yq9kucAo/qN6Ve5QK4PQlheoWrEZ4epUnHCRaa9IuO3M/IQboqDmJIgswu9
	 o7akIUO+XLYENpGYWv8EgH7bvRcgLKQD83Onoh3hwoI6jxiSQ50NYzlk9+/GN++Stf
	 8zrjYN+ttMRT0uYeCVJrIenyH3jMt4NKmGiuWaEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBDE3F80123;
	Wed, 29 Jan 2020 19:29:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9D62F8021E; Wed, 29 Jan 2020 19:29:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1910F80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 19:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1910F80123
Received: by mail-ed1-f42.google.com with SMTP id g19so761657eds.11
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 10:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4qkJva2WsjlzXbLrXwOCyzngWVPfhRPEm+QIF0TxRCs=;
 b=PjMXkh+6WMRDat96Grr28LaAhYl+A6oo1vPWg8NwI1JlElF1Re0Xw1BHhaz/qz7rWV
 BN6G+T+QifGmBhz2BgjdeTp4huOHjKnR5n/07sZvzWMgQgjM4x6iPUni+x14EBgm98KM
 z2mWoztmWs8XHMGQcSfsPwrMQUOz66gPws+URF5HGn8v0lpvgLH/Mq3DXI5JrAF8ZVw4
 w9R5uJPCXfbLwHdb0QlhzUi+2Pf3rg9f42WYyo7uEiaZBgCwIZq+YRMvrQoQeYx57mP+
 DIJvj7Fu/SIyO2oMEKAIdnvJiwugGMy2mKfD/XJzX6w2hZWy9F6sCOCgATwoyb/3a6ky
 d9bw==
X-Gm-Message-State: APjAAAUMCp9CXBH6v4SZVSEq+PL8MoCCHOR1PZvIvUIQERTgUXkhMaTU
 G0WukLH6kYh7s9F/eBaNXVk=
X-Google-Smtp-Source: APXvYqz1/cdG+k42XUqB4QSIVvZhpddvdczacL56EyIVANpjoiUGIhsZmLCd2Gpp1rr/aNnryIFmnw==
X-Received: by 2002:a17:906:3cea:: with SMTP id
 d10mr719187ejh.32.1580322561227; 
 Wed, 29 Jan 2020 10:29:21 -0800 (PST)
Received: from kozik-lap ([194.230.155.229])
 by smtp.googlemail.com with ESMTPSA id x2sm311343edi.95.2020.01.29.10.29.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jan 2020 10:29:20 -0800 (PST)
Date: Wed, 29 Jan 2020 19:29:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200129182918.GA13626@kozik-lap>
References: <5e31aaaa.1c69fb81.a7667.f187@mx.google.com>
 <20200129161113.GE3928@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129161113.GE3928@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 kernel-build-reports@lists.linaro.org, Sangbeom Kim <sbkim73@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] next/master boot: 148 boots: 10 failed,
 136 passed with 2 untried/unknown (next-20200129)
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

On Wed, Jan 29, 2020 at 04:11:13PM +0000, Mark Brown wrote:
> On Wed, Jan 29, 2020 at 07:54:18AM -0800, kernelci.org bot wrote:
> 
> Today's -next fails to boot on Odroid X2 and XU3 with exynos_defconfig
> or multi_v7_defconfig with SMP=n.  It appears to get stuck in a loop
> probing the I2S secondary DAI for some reason:
> 
> 12:07:05.997409  <6>[    6.421596] exynos-bus: new bus device registered: soc:bus_mscl ( 84000 KHz ~ 666000 KHz)
> 12:07:05.997653  <4>[    6.429763] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
> 12:07:06.006838  <4>[    6.439652] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
> 12:07:06.015764  <4>[    6.448666] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
> 
> and so on ad infinitum.  Vanilla multi_v7_defconfig is fine and just
> displays a saingle copy of that log message.  Full logs and other
> details here:
> 
> 	https://kernelci.org/boot/id/5e3176467f121dbdef2824fc/
> 	https://kernelci.org/boot/id/5e317b7322dcdaa3e5282500/
> 	https://kernelci.org/boot/id/5e317c0f6bfd765fb42824f1/
> 	https://kernelci.org/boot/id/5e317517be8559c7542824f1/
> 
> I don't *think* it's an audio issue as mainline seems fine and all the
> ASoC changes have already landed in mainline for this merge window.

Thanks for the report.

Marek spotted it as well and sent a patch

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
