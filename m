Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B293F60AE0B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ECD460AC;
	Mon, 24 Oct 2022 16:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ECD460AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666622799;
	bh=1Xdc6zLYEYbA/joDrujdupqN+QAqYN/5zZxMq8p42kk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+eY1KwxuEs4z7L+igV9Fxg4wcVIX1a5RPWAxReEwlL/3GGCh7PZ6feeHDjsMDLtP
	 T+CbyOYjbYGgeSkSvD4oUner7mp/SOKCSO7aI/RYz7kOKdzWDbuOzAon/XV1T+0T37
	 YHPcOlYMKrquOtOKwI0UqjYDw7GUx0nD0dOLtqB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 140E5F80558;
	Mon, 24 Oct 2022 16:44:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D2E1F80533; Mon, 24 Oct 2022 15:00:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57A3EF80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 15:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A3EF80506
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-13ba86b5ac0so3111595fac.1
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 06:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+x9joGdXdBFLPPxN1p6d7/jrm+b1E7zu0ZikUl9XbM=;
 b=X4X5rwpnEw3W/AKdWv/F0TOvFVZovgCWR6kyDnsh+yAutAzCFCqP9dDv09eoNoB2gi
 M9yg9gxKiliJCNgBVEQ5ahF3WVVCJiftHckws1kNaM11/WfEiWlfwUEOKA9JsOBNvq+Y
 CNuCU6FL7hYjHDPynUfTu9tSuY5nn9UcxjHFtunvS62CBvNgOER9C1Bh70Oz08FUq22d
 4cdSlRA6o4jae9FT2RF8MmlarEs99bpkfHY3BY8jwhN8RVsp3NCNkLGgJ21jZXe9N3N1
 XY2jOWinN0s+UEyd7f1+crMs+gvnJJ7T7p9Negpnx4+zW69kjFA6+5YxkL0aK5HEDELE
 KCrw==
X-Gm-Message-State: ACrzQf1oy15y/h6IFeVvT7SPQ5vwzohCoVKR7rU9Te96ktrbVFYdcw9U
 IPFGDjSiye4SEyvW7le72Q==
X-Google-Smtp-Source: AMsMyM4RB1x55W7tWXLqKMCfn9+yNGKoyP28eeDXqoWuK46CSg7FurAIxSSG6961lNUtLuCZU2W88g==
X-Received: by 2002:a05:6870:e9a8:b0:133:223f:49a1 with SMTP id
 r40-20020a056870e9a800b00133223f49a1mr38235091oao.114.1666616434841; 
 Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g20-20020a056870c15400b0012796e8033dsm2716705oad.57.2022.10.24.06.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: (nullmailer pid 1652638 invoked by uid 1000);
 Mon, 24 Oct 2022 13:00:35 -0000
Date: Mon, 24 Oct 2022 08:00:35 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
Message-ID: <20221024130035.GA1645003-robh@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
X-Mailman-Approved-At: Mon, 24 Oct 2022 16:44:48 +0200
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dmaengine@vger.kernel.org
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

On Fri, Oct 21, 2022 at 10:22:28PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was marked as deprecated a while ago,
> and for the s3c64xx platform, we marked all except one legacy
> board file as unused.
> 
> This series removes all of those, leaving only s3c64xx support
> for DT based boots as well as the cragg6410 board file.
> 
> About half of the s3c specific drivers were only used on
> the now removed machines, so these drivers can be retired
> as well. I can either merge the driver removal patches through
> the soc tree along with the board file patches, or subsystem
> maintainers can pick them up into their own trees, whichever
> they prefer.

[...]

>  Documentation/arm/index.rst                   |    1 -
>  Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
>  .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
>  Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 --
>  Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
>  Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
>  Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
>  .../arm/samsung-s3c24xx/overview.rst          |  311 ---
>  Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 -
>  Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
>  .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
>  Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
>  .../arm/samsung-s3c24xx/usb-host.rst          |   91 -
>  Documentation/arm/samsung/overview.rst        |   13 -

What about?:

Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
Documentation/devicetree/bindings/mmc/samsung,s3cmci.txt
Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
Documentation/devicetree/bindings/usb/s3c2410-usb.txt

Rob
