Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF9E4F8FCD
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:49:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 557C118D3;
	Fri,  8 Apr 2022 09:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 557C118D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404154;
	bh=JU22GVqt3YFsin8HP04zkf0GPNXOR8Lqs2b49RMLDG8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z1MB+cQvGgVNQQU2qovcPQLefvsgfORaEnotgTS5oEQIPoKMCXfymOxFNxghJ/QKa
	 AeM1ntFjhG4EThWAX1mYMa0nGGnrph8trh5seYytMtTw/y4IKWSv+4K0IIeQcxizMF
	 zM2gtciCyMPCZTkJdUv+1AHcuzx0Xd/Z64NIxwjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D17F7F80054;
	Fri,  8 Apr 2022 09:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90025F80162; Mon,  4 Apr 2022 11:17:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34453F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 11:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34453F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hQlbcki1"
Received: by mail-ej1-x62a.google.com with SMTP id n6so4459317ejc.13
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFF6p4tYsR549sWrfv4bnU2v+ruL8I5/W5YzMr/thlg=;
 b=hQlbcki1WeC3gkSnk83L4xArF1FpAwUwcbPIaOMkJlzK+bh9pgMN60HjAqA9G0XpuC
 3Bprvok5U0s7Z1W/ZawyWzSbHo70bfJbRx7oPeBhE/2fGvpn7wCQbZqlvuNGvgHsVjQq
 r/wKFSU7xB5ZHODeRpMa6ErNEopcgryJWjRJjgXQCJkk3liL7jI4iywOC/rM00bXTbtl
 pmNkssVD/iJNe8tAe5q9UEBT+HP+cJeGalWYEIgNn71NWfAeNK0dD/7xSnaeqbeBCKsb
 THPnJ2jW59TDoW+ic9pCzBwfUOBySS1J3o8UfMTFXNWAg/FIQ3SVn0tuGl33QwLfjnUE
 +cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFF6p4tYsR549sWrfv4bnU2v+ruL8I5/W5YzMr/thlg=;
 b=TTezMV+MdfWLJuFrgKEzejYfG0OBB0D+59gBWLYLDn9RC9tnfZFYvjqpEnUerLwhVK
 51QyPnDUi6nTALjJVlQq+n8GIDkhvUfZwLQAY8YgLfv/jBiOnv6UUVvnpPH5LSFMC9GJ
 PUciMehgSnjTAJfT+ajpPoPZXGnpznmUAqmSOH0fLpyGJ5zE+pKlH5zmMxY6YGHBaurY
 LwZY+6JH/DFnb7d/cEzC4d9vMiKl3xpMaOpp5+TawGLBHFtHKGt+jzqAh5IqIeZmxgLS
 F5RpIarrcGba2F3qxyVmi4qcl2V3FrxLqFcLXiJ8LCqtli0KUzVROYS6hkeCKHe0dIad
 Tq+Q==
X-Gm-Message-State: AOAM530EtTWSz1HjemQuJ48zmOFKjGmXVgTt606jqHbX50mwME3UEGFa
 IQlXR7XKWsZ7mYbgCQoImr8mkct+Lz8MA+Af5hM=
X-Google-Smtp-Source: ABdhPJztVV4vk0bsoiQVYou423ZyvJCH+cGZa4t4gBoSJScuWRUyyZG1JPNItw+pyflHlcb4ktsJ/PrqzuCd6UZZVuc=
X-Received: by 2002:a17:907:e8d:b0:6e0:19e7:9549 with SMTP id
 ho13-20020a1709070e8d00b006e019e79549mr10112344ejc.44.1649063847683; Mon, 04
 Apr 2022 02:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220403183758.192236-1-krzysztof.kozlowski@linaro.org>
 <20220403183758.192236-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220403183758.192236-2-krzysztof.kozlowski@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Apr 2022 12:16:23 +0300
Message-ID: <CAHp75Vczm9f9Bx_w4nW31cnBgwEzPiN-Eqn-7DKZuB+Hew0F=Q@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] driver: platform: Add helper for safer setting
 of driver_override
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stuart Yoder <stuyoder@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Sun, Apr 3, 2022 at 9:38 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Several core drivers and buses expect that driver_override is a
> dynamically allocated memory thus later they can kfree() it.
>
> However such assumption is not documented, there were in the past and
> there are already users setting it to a string literal. This leads to
> kfree() of static memory during device release (e.g. in error paths or
> during unbind):
>
>     kernel BUG at ../mm/slub.c:3960!
>     Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>     ...
>     (kfree) from [<c058da50>] (platform_device_release+0x88/0xb4)
>     (platform_device_release) from [<c0585be0>] (device_release+0x2c/0x90)
>     (device_release) from [<c0a69050>] (kobject_put+0xec/0x20c)
>     (kobject_put) from [<c0f2f120>] (exynos5_clk_probe+0x154/0x18c)
>     (exynos5_clk_probe) from [<c058de70>] (platform_drv_probe+0x6c/0xa4)
>     (platform_drv_probe) from [<c058b7ac>] (really_probe+0x280/0x414)
>     (really_probe) from [<c058baf4>] (driver_probe_device+0x78/0x1c4)
>     (driver_probe_device) from [<c0589854>] (bus_for_each_drv+0x74/0xb8)
>     (bus_for_each_drv) from [<c058b48c>] (__device_attach+0xd4/0x16c)
>     (__device_attach) from [<c058a638>] (bus_probe_device+0x88/0x90)
>     (bus_probe_device) from [<c05871fc>] (device_add+0x3dc/0x62c)
>     (device_add) from [<c075ff10>] (of_platform_device_create_pdata+0x94/0xbc)
>     (of_platform_device_create_pdata) from [<c07600ec>] (of_platform_bus_create+0x1a8/0x4fc)
>     (of_platform_bus_create) from [<c0760150>] (of_platform_bus_create+0x20c/0x4fc)
>     (of_platform_bus_create) from [<c07605f0>] (of_platform_populate+0x84/0x118)
>     (of_platform_populate) from [<c0f3c964>] (of_platform_default_populate_init+0xa0/0xb8)
>     (of_platform_default_populate_init) from [<c01031f8>] (do_one_initcall+0x8c/0x404)
>
> Provide a helper which clearly documents the usage of driver_override.
> This will allow later to reuse the helper and reduce the amount of
> duplicated code.
>
> Convert the platform driver to use a new helper and make the
> driver_override field const char (it is not modified by the core).

...

> +int driver_set_override(struct device *dev, const char **override,
> +                       const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;

> +       if (!override || !s)
> +               return -EINVAL;

Still not sure if we should distinguish (s == NULL && len == 0) from
(s != NULL && len == 0).
Supplying the latter seems confusing (yes, I see that in the old code). Perhaps
!s test, in case you want to leave it, should be also commented.

Another approach is to split above to two checks and move !s after !len.

> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;

Perhaps explain the case in the comment here?

> +       if (!len) {
> +               device_lock(dev);
> +               old = *override;
> +               *override = NULL;

> +               device_unlock(dev);
> +               goto out_free;

You may deduplicate this one, by

               goto out_unlock_free;

But I understand your intention to keep lock-unlock in one place, so
perhaps dropping that label would be even better in this case and
keeping it

       kfree(old);
       return 0;

here instead of goto.

> +       }
> +
> +       cp = strnchr(s, len, '\n');
> +       if (cp)
> +               len = cp - s;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;
> +
> +       device_lock(dev);
> +       old = *override;
> +       if (cp != s) {
> +               *override = new;
> +       } else {
> +               kfree(new);
> +               *override = NULL;
> +       }
> +       device_unlock(dev);
> +
> +out_free:
> +       kfree(old);
> +
> +       return 0;
> +}


-- 
With Best Regards,
Andy Shevchenko
