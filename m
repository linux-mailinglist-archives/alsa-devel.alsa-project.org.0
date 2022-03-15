Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BFD4DBFC6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 07:58:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EE61852;
	Thu, 17 Mar 2022 07:57:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EE61852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500312;
	bh=mQkn9o/oTYSn/qPED3CZ6MW7DvfgJAtJBi7yHXxbwBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gY+mk75P9gqkDu24M37QQjuWLOF9o8Bf7MHBl1V6AfLtOzZewWBYJeFP39UfZakTg
	 QhUES38eZFo97Y2VDn5p4iutVzWCYq3LKBw0jD/QASY6dwFupcSndFF96kdyyViZKg
	 oo6o7lNumFGDqzFC9m52B3DeXv94/ElgcYFbarkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E89B7F80543;
	Thu, 17 Mar 2022 07:55:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E43CF80162; Tue, 15 Mar 2022 19:01:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 054DDF80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 19:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 054DDF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X459zaz8"
Received: by mail-ed1-x52a.google.com with SMTP id m12so25185936edc.12
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 11:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9egEby/kGDQx/H2AywacJdMEq9UWb27T57iBP6MKY/M=;
 b=X459zaz8rBpHmz1eWRM/nXKPoCcWwgv93mgo1kUIqKJmmrFSVbFmtlBkSyc7oZbqEA
 9iE/wpN2ldzWFyDARevE8q4aWwftUcTWrj/hZGCp5c/nWOErfTWiotj502O2E3wRub8x
 fAvwgbWwEpPPMZKlHleAIZ5b3NuCDHQaUCu3o6zMz3Pk9oBOWUhxp7FqU8z4OYlvff33
 vjwTCIZda48THwgM2za8HjIs/dPh3/+wx8u7uUvYGGau/xbCmqh8QSdYU72RKq3dM+TV
 7s/9EfIhX6BorS0N3xa1MT7AdVO4JDq0rPwvec+a1/gkrmCnUuEgVF5WsgvwobwSbCSf
 ZFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9egEby/kGDQx/H2AywacJdMEq9UWb27T57iBP6MKY/M=;
 b=R0DaBwqbzx4gPN+dmJCxKpClCZFTCELTsQevtXwPmQ8QcqIMcvbyIi+0rvoGepTO/E
 2nv9F2Ee9YnOp5//L9n8UfKBHFvTo3kuJhh6qkb/QrsOi0Z22borr3dHv5cGkxplerhK
 wZCiBKUU/T4QKEWJ/lukO2SqWY1BWCw1rNQGg8QRu1cxK2bZccwPRR20xwGihoZwtsDB
 ouWz7qiLKN2x+cfPmNQjZg5FbdttcdoW0ujVLJcDdqJyqD2mv8r4I1TXR3bwarjiYy7b
 DbxeLXad0Ph4uuYnHn+Q+Iw96GHJDzs1/I3daTfGtdXCziDpJBvBiqpWymbeVfvAAirG
 grWQ==
X-Gm-Message-State: AOAM530y81+exCHxoAV62+Ukevto2sAmmM6aadiZEfyNU1mLiATZhRlW
 bYiWDcvxCARDNuYkgoWRPaiwvVWHyRwQfXTOFQ0=
X-Google-Smtp-Source: ABdhPJz09b9Fm75ixFJtzUGUkS6dUid3EAUCrWF+jfN6zd2zyejpSwybW8/2BkPFf2PjWP6mgqXTNKVgn2eTNF92NTk=
X-Received: by 2002:a05:6402:3589:b0:416:7de7:cdde with SMTP id
 y9-20020a056402358900b004167de7cddemr26440456edc.218.1647367269998; Tue, 15
 Mar 2022 11:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
 <20220312132856.65163-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220312132856.65163-2-krzysztof.kozlowski@canonical.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Mar 2022 19:59:56 +0200
Message-ID: <CAHp75Vd6yu0OA6wYvPVs8J1wRDPyb6tCYXOjp9poweJd0sfPcw@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] driver: platform: Add helper for safer setting
 of driver_override
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stuart Yoder <stuyoder@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, Jason Wang <jasowang@redhat.com>,
 linux-remoteproc@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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

On Sat, Mar 12, 2022 at 5:16 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
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

>     (do_one_initcall) from [<c0f012c0>] (kernel_init_freeable+0x3d0/0x4d8)
>     (kernel_init_freeable) from [<c0a7def0>] (kernel_init+0x8/0x114)
>     (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)

I believe you may remove these three.

> Provide a helper which clearly documents the usage of driver_override.
> This will allow later to reuse the helper and reduce amount of

the amount

> duplicated code.

> Convert the platform driver to use new helper and make the

a new

> driver_override field const char (it is not modified by the core).

...

> +/**
> + * driver_set_override() - Helper to set or clear driver override.
> + * @dev: Device to change
> + * @override: Address of string to change (e.g. &device->driver_override);
> + *            The contents will be freed and hold newly allocated override.
> + * @s: NUL terminated string, new driver name to force a match, pass empty

NUL-terminated? (44 vs 115 occurrences)

> + *     string to clear it
> + * @len: length of @s
> + *
> + * Helper to set or clear driver override in a device, intended for the cases
> + * when the driver_override field is allocated by driver/bus code.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int driver_set_override(struct device *dev, const char **override,
> +                       const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!dev || !override || !s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;
> +
> +       cp = strchr(new, '\n');
> +       if (cp)
> +               *cp = '\0';

AFAIU you may reduce memory footprint by

cp = strnchr(new, len, '\n');
if (cp)
  len = s - cp;

new = kstrndup(...);

> +       device_lock(dev);
> +       old = *override;
> +       if (cp != new) {
> +               *override = new;
> +       } else {
> +               kfree(new);
> +               *override = NULL;
> +       }
> +       device_unlock(dev);
> +
> +       kfree(old);
> +
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko
