Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDE50B927
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA371168B;
	Fri, 22 Apr 2022 15:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA371168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635540;
	bh=r5gIACVwFwXfu+L0SjHY63rmQTmlBYIcuCScaOsuAjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HyJTqIpZeErpkGh+2bal0jlwE6V2O0Oju6IY9JkZj45AgcvhBs5+9ADXQDXAcDK0t
	 j0bOl+6Qc28wMLitiotqTIstq4GVVVS0xUHpVQA3lspNQfmjPq17SeJV/ktLalOYfJ
	 R+r7cx749TOUtAH8NhVCVuQ+8raA3TNJkT4W2/ZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0043F80859;
	Fri, 22 Apr 2022 15:32:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C05EF80125; Wed, 20 Apr 2022 15:48:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA481F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 15:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA481F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fgIkAwqj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B66A60FC8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 13:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7BEC385B4
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650462518;
 bh=r5gIACVwFwXfu+L0SjHY63rmQTmlBYIcuCScaOsuAjk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fgIkAwqjyTOXtgf5lno3ME6WNbtJiZezbksFj92vrbC43pedD7VS6SDFkxxNgYnHq
 p1VfD4yEVIVNYCeVJ78rQmUnz45XkZXwQoCvqGuQYc/gNKiijxrlfA/PrhmLq/b18u
 5NRaySIcic2LGUJeEP9oYSSLlY3UfcG50LMaB3StE4l4gd02z05bm9WyfpG8ZJDZOI
 dTUsuo5+E6lg1BAQuSvgtgzcaw0FnOV3CI8SoTsIsYy0TsbkwR9+BpD3eGb3IncMdL
 0JF84i4GXt2a68+B3akvbxT25iF6txG785pvIBe6rG79GGE/CneI2jYnMf9SXG9/pD
 UGOP6zGjCSJbQ==
Received: by mail-wr1-f41.google.com with SMTP id x18so2396546wrc.0
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 06:48:37 -0700 (PDT)
X-Gm-Message-State: AOAM530LxDPau/WtA0KA2qcaejRjH1wWyNE3nS7SlIrpE6IYLMLokeDL
 ehI1K920y4AkNmHsWc6WEp/BP8btUfp2Pdud9+I=
X-Google-Smtp-Source: ABdhPJwSpIclw+ZwqVR57edT/aQRpFn5BaY64Phs17aAgIE6n54XF3PED3yv14Fv9AL2uDPz7qCh2GbTzsHglUZV1DA=
X-Received: by 2002:a5d:6389:0:b0:207:a7d8:2b64 with SMTP id
 p9-20020a5d6389000000b00207a7d82b64mr15595597wru.12.1650462515957; Wed, 20
 Apr 2022 06:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-41-arnd@kernel.org>
 <20220420134305.fq7pc3fsz5fxkryj@mercury.elektranox.org>
In-Reply-To: <20220420134305.fq7pc3fsz5fxkryj@mercury.elektranox.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Apr 2022 15:48:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Mv-gUoc3hpqvCa1tzvEEwHN6wXDxmy8K5rN8sULQnMw@mail.gmail.com>
Message-ID: <CAK8P3a2Mv-gUoc3hpqvCa1tzvEEwHN6wXDxmy8K5rN8sULQnMw@mail.gmail.com>
Subject: Re: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
To: Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
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

On Wed, Apr 20, 2022 at 3:43 PM Sebastian Reichel <sre@kernel.org> wrote:
> > @@ -15,11 +15,16 @@
> >  #include <linux/gpio.h>
>
> This should be <linux/gpio/consumer.h> now.
>
Fixed now, thanks!

     Arnd
