Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5F4DBFCA
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 07:59:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097C81884;
	Thu, 17 Mar 2022 07:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097C81884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500362;
	bh=el36fF8A+pR2dD6td1v35JSPZa9m+btey4LxqEfaTSs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vrxqc/HJfrQoQSFwA/XKJMnQsIBY0kkCkIq2vq1tZdxrh70SF1K2zrSjiuaIaeM2T
	 YuVNU7rGXuffhN/sx6GzyktUFSUeF9++4+41DNu2bSjsFsrUNY9dsxgeYPt6dsaalq
	 qZ+nzD9nRssP+aE0EkL9q2RN++hXR8Y5qYkshneo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDEBFF80563;
	Thu, 17 Mar 2022 07:55:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34CC5F8019D; Wed, 16 Mar 2022 13:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41DE0F80084
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 13:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41DE0F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="AzPvMDIV"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 705CA3F1B3
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647432789;
 bh=WEml57iQP8ABbI+mDA7s3AB7OtRvXlB4GSsR8dRD3Dc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=AzPvMDIVUTvjXLnA6KkmxET64ozlqqW2YfDuW88j+WkowtqmbMXHFq4thmFsYV+mJ
 h4GIei1NWBK5yVKCc1z8c0jvjieP/kSiQ8CBetMca5Ta1eWn9qLaGdJbwcIlaHYMb4
 DrcVKQQjXAWj9B1OaGgvyMGK+XEIXdhdo1fOo6NNfBJGfqXw9aKIuK4foGh8O489ZW
 +CCstO4g1pOb8QxvLTZNVtci6rg2j2TvGMeeSaJhK6shZsylLqWwInf5Vw2TiEZs0h
 Ii2sg1upt4/CNZiEGkaX4wtZo7S29LWnEp3WRBDsWkdKYKA9Jvs0x+llWKD5b7j+jy
 xsmpyOz+n7yVA==
Received: by mail-wm1-f71.google.com with SMTP id
 m34-20020a05600c3b2200b0038115c73361so645528wms.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 05:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WEml57iQP8ABbI+mDA7s3AB7OtRvXlB4GSsR8dRD3Dc=;
 b=s/nf184Ec+PGmgDreTwk3lzTojC/VMmEBmZkiBnYoAES4voFKR3CGYhH5kv6xp3tTW
 W6K21uIKU4E5DO/9UzKyrFiuA86/sPDJmck2HNBWbhWg75DAC1MIxkiJPzVLIM3psneN
 m4eZLnw7hhBAgJm7roL9yJ3p+BU5GKVmW1v+U5Ktgk+hDjsRhRKKMa8Z6Ac8a1g/XbZT
 x69Nr4PMOXpOBySGJhY0+qNkMFVUvWG8NHvK7NhXwHWpVfXOEpdGSEVoU5bSafVciggW
 YKN2AI4+5P9NV8IIsVi5VMyWqchSxK3NPkJ6OPiaBDRHmstjy4PtXijfwpCVrcae7kmh
 P4/w==
X-Gm-Message-State: AOAM531OCDdzKc9DmhyArrS0S39rNFw8MNmquKoKXZ0qFyzXhlMTbrhs
 L/j8RIeAHjg4S9UsFGd3zwtIJtM1khCisIus2dImY0KTNOZHmOxK9KrOrvKHZSIhSlO/RZ42dmd
 1bh+xB/6uXl6b3CbzgiIYZAZVoySiOsPBkczXFa7G
X-Received: by 2002:adf:8063:0:b0:1ef:78e3:330 with SMTP id
 90-20020adf8063000000b001ef78e30330mr23936017wrk.424.1647432789102; 
 Wed, 16 Mar 2022 05:13:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7tLnLEOOtwMMJsokfBIh0t57hslQQvVmwtzfcwFM6mg7nh7jx6KQIhSbucvh9csOs9eabrQ==
X-Received: by 2002:adf:8063:0:b0:1ef:78e3:330 with SMTP id
 90-20020adf8063000000b001ef78e30330mr23935984wrk.424.1647432788803; 
 Wed, 16 Mar 2022 05:13:08 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm1541013wre.22.2022.03.16.05.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 05:13:08 -0700 (PDT)
Message-ID: <a323b141-94f1-800a-6a56-6204fa01e968@canonical.com>
Date: Wed, 16 Mar 2022 13:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 01/11] driver: platform: Add helper for safer setting
 of driver_override
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
 <20220312132856.65163-2-krzysztof.kozlowski@canonical.com>
 <CAHp75Vd6yu0OA6wYvPVs8J1wRDPyb6tCYXOjp9poweJd0sfPcw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHp75Vd6yu0OA6wYvPVs8J1wRDPyb6tCYXOjp9poweJd0sfPcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 15/03/2022 18:59, Andy Shevchenko wrote:
> On Sat, Mar 12, 2022 at 5:16 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Several core drivers and buses expect that driver_override is a
>> dynamically allocated memory thus later they can kfree() it.
>>
>> However such assumption is not documented, there were in the past and
>> there are already users setting it to a string literal. This leads to
>> kfree() of static memory during device release (e.g. in error paths or
>> during unbind):
>>
>>     kernel BUG at ../mm/slub.c:3960!
>>     Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>>     ...
>>     (kfree) from [<c058da50>] (platform_device_release+0x88/0xb4)
>>     (platform_device_release) from [<c0585be0>] (device_release+0x2c/0x90)
>>     (device_release) from [<c0a69050>] (kobject_put+0xec/0x20c)
>>     (kobject_put) from [<c0f2f120>] (exynos5_clk_probe+0x154/0x18c)
>>     (exynos5_clk_probe) from [<c058de70>] (platform_drv_probe+0x6c/0xa4)
>>     (platform_drv_probe) from [<c058b7ac>] (really_probe+0x280/0x414)
>>     (really_probe) from [<c058baf4>] (driver_probe_device+0x78/0x1c4)
>>     (driver_probe_device) from [<c0589854>] (bus_for_each_drv+0x74/0xb8)
>>     (bus_for_each_drv) from [<c058b48c>] (__device_attach+0xd4/0x16c)
>>     (__device_attach) from [<c058a638>] (bus_probe_device+0x88/0x90)
>>     (bus_probe_device) from [<c05871fc>] (device_add+0x3dc/0x62c)
>>     (device_add) from [<c075ff10>] (of_platform_device_create_pdata+0x94/0xbc)
>>     (of_platform_device_create_pdata) from [<c07600ec>] (of_platform_bus_create+0x1a8/0x4fc)
>>     (of_platform_bus_create) from [<c0760150>] (of_platform_bus_create+0x20c/0x4fc)
>>     (of_platform_bus_create) from [<c07605f0>] (of_platform_populate+0x84/0x118)
>>     (of_platform_populate) from [<c0f3c964>] (of_platform_default_populate_init+0xa0/0xb8)
>>     (of_platform_default_populate_init) from [<c01031f8>] (do_one_initcall+0x8c/0x404)
> 
>>     (do_one_initcall) from [<c0f012c0>] (kernel_init_freeable+0x3d0/0x4d8)
>>     (kernel_init_freeable) from [<c0a7def0>] (kernel_init+0x8/0x114)
>>     (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> 
> I believe you may remove these three.

Sure (for this and later comments).

> 
>> Provide a helper which clearly documents the usage of driver_override.
>> This will allow later to reuse the helper and reduce amount of
> 
> the amount
> 
>> duplicated code.
> 
>> Convert the platform driver to use new helper and make the
> 
> a new
> 
>> driver_override field const char (it is not modified by the core).
> 
> ...
> 
>> +/**
>> + * driver_set_override() - Helper to set or clear driver override.
>> + * @dev: Device to change
>> + * @override: Address of string to change (e.g. &device->driver_override);
>> + *            The contents will be freed and hold newly allocated override.
>> + * @s: NUL terminated string, new driver name to force a match, pass empty
> 
> NUL-terminated? (44 vs 115 occurrences)
> 
>> + *     string to clear it
>> + * @len: length of @s
>> + *
>> + * Helper to set or clear driver override in a device, intended for the cases
>> + * when the driver_override field is allocated by driver/bus code.
>> + *
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +int driver_set_override(struct device *dev, const char **override,
>> +                       const char *s, size_t len)
>> +{
>> +       const char *new, *old;
>> +       char *cp;
>> +
>> +       if (!dev || !override || !s)
>> +               return -EINVAL;
>> +
>> +       /*
>> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
>> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
>> +        * Thus we can store one character less to avoid truncation during sysfs
>> +        * show.
>> +        */
>> +       if (len >= (PAGE_SIZE - 1))
>> +               return -EINVAL;
>> +
>> +       new = kstrndup(s, len, GFP_KERNEL);
>> +       if (!new)
>> +               return -ENOMEM;
>> +
>> +       cp = strchr(new, '\n');
>> +       if (cp)
>> +               *cp = '\0';
> 
> AFAIU you may reduce memory footprint by
> 
> cp = strnchr(new, len, '\n');
> if (cp)
>   len = s - cp;
> 
> new = kstrndup(...);
>

Indeed, thanks.

Best regards,
Krzysztof
