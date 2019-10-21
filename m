Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F5ADE379
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 07:05:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5661674;
	Mon, 21 Oct 2019 07:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5661674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571634358;
	bh=Q3TzL6u4GxLo688ud5In89eFNoIt/m8BZcN//EeWNbs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eugg00DzSsJ/xaNzZx2qHqf0jwjPepEbGyRNY4qyYFUa/f4sDMX+0LMKo4oJpIgTc
	 NwpqUnm5OEx/oIlA4VU5FdXbbx3WGmS7PDPPI/O0SB4hB7QxBbZYBBR1SkSGEfTdZS
	 U9Ohw+ZBxFn3GwLXFhn7lf9G7qjlfj6ClF1jb9ZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75357F80635;
	Mon, 21 Oct 2019 07:01:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2CDEF80368; Mon, 21 Oct 2019 04:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF364F800C0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 04:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF364F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HBXUvt04"
Received: by mail-pg1-x543.google.com with SMTP id 15so1439961pgt.7
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 19:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+XgAS3p3ETrEIu1jjk49WnshOluu9ziyQFPp12n3bCU=;
 b=HBXUvt040GMIEwLCNj0cv5hSZlRkL/uSj5D7wLWdq/dK4otL0nVEbSqZR/yA3O2Og9
 AGWR8nz33JcyPwt0cVzYqNq50Faf18+z3imXfVGexdoVV7YqaTAx1/VUr9tWFd1T5Cbb
 Tf3GaNcBURk5SkpU/x/jomYDDMhIfJxW71YTg5rvruJX3ueO8ezhfGPDpZ8h4aBGcFO7
 kumSOPEltTLr+L4+0n9vUg4CWg75RR45G4UAxyVxqOpn3JU7cI+2DI4kkwOVZWPX+nFt
 EIZgqQsA7otGwkMKpKWeRDE8Vka9aexA24uKnw1PmWmT0weSSgJHTEGbfcCA0RE8KN8b
 2ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+XgAS3p3ETrEIu1jjk49WnshOluu9ziyQFPp12n3bCU=;
 b=DLUgBkvcKSepd5Y1cJpuBs6juu7RIm4NCiWUgdcUU5M8UQbA7D4S0J9oDJEeHuLYlL
 7ZQ/9q7b8yjdbUgNN8CWksyMpLnvkBr7TmHduky3gyJdhT5vg42nrMjqKEauMPnp7zcb
 X9Ch6r/JY+DPeM3baM82vpTAUie8bImKu3VEOgb0++PpYewGGHFfWAnnJs8byWnlQUmO
 Ww4kvO5lQkUfhaWGRUs1ZHsE9HPbjndCoOdtEDfGDoxJ/VtWv0F8t1ThBmIQOK4GwZI0
 rAiF9toJlYwIbd9Z7aG9huRrxcUZye+dyiskGpINH/3RjsX21vut+zdnN/stXoH/oAF0
 ihAQ==
X-Gm-Message-State: APjAAAVr7MP863A61HKe1ZwLxs8WKAQw2nKcYWds/Y298FAXgyj9/PYZ
 CkOWAfBWXk7Psg5XBqz7l0vS1Q==
X-Google-Smtp-Source: APXvYqwgXGc8U+6JV2azREgJVpwvucEYJlBr8fKvxMlwaeCP9tIcS23wt/WioWPY0VSEsf3wqmlSTg==
X-Received: by 2002:a63:4e52:: with SMTP id o18mr11185515pgl.153.1571624859157; 
 Sun, 20 Oct 2019 19:27:39 -0700 (PDT)
Received: from localhost ([122.172.151.112])
 by smtp.gmail.com with ESMTPSA id f17sm20835265pgd.8.2019.10.20.19.27.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Oct 2019 19:27:38 -0700 (PDT)
Date: Mon, 21 Oct 2019 07:57:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191021022736.yu6unspozqf5634p@vireshk-i7>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-5-arnd@arndb.de>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 21 Oct 2019 07:01:38 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mtd@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [alsa-devel] [PATCH 05/46] ARM: pxa: split up mach/hardware.h
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

On 18-10-19, 17:41, Arnd Bergmann wrote:
> The mach/hardware.h is included in lots of places, and it provides
> three different things on pxa:
> 
> - the cpu_is_pxa* macros
> - an indirect inclusion of mach/addr-map.h
> - the __REG() and io_pv2() helper macros
> 
> Split it up into separate <linux/soc/pxa/cpu.h> and mach/pxa-regs.h
> headers, then change all the files that use mach/hardware.h to
> include the exact set of those three headers that they actually
> need, allowing for further more targeted cleanup.
> 
> linux/soc/pxa/cpu.h can remain permanently exported and is now in
> a global location along with similar headers. pxa-regs.h and
> addr-map.h are only used in a very small number of drivers now
> and can be moved to arch/arm/mach-pxa/ directly when those drivers
> are to pass the necessary data as resources.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/cpufreq/pxa2xx-cpufreq.c              |  1 +
>  drivers/cpufreq/pxa3xx-cpufreq.c              |  1 +

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
