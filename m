Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A24C45D0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:18:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AC631B40;
	Fri, 25 Feb 2022 14:17:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AC631B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795099;
	bh=urXp8w8aKaecGDFWfGrrVq1BbTAtMoKCnejCzjWv21w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fN6vXr0GE3dkwLyx/Vi8410z5T75+NEb6vJMTwI0cOnks8wrgZyxl2auGvmvJzqeS
	 NLbN2iwIO7J7p6wfjJuJmMwOW2QrzKVzsvcQmk+Y/f3ERzjiGtnQAr1/FhYRaTkvLa
	 +DEVWen6wJc0+qKPMRkUVtqz1qndyUn5+q9FTdp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F3C3F805BE;
	Fri, 25 Feb 2022 14:11:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E18E5F8030F; Thu, 24 Feb 2022 08:47:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2E64F80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 08:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2E64F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="kYfQ7AdK"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D47DE3FCA6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645688812;
 bh=FxOVZjnNiVO0i9jH0i6UiovfwrDBwVKl5GL2sYOaVX4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=kYfQ7AdKpVuWQ47pE+InvtpSOH38WYo2gVGkTi6Sp8RcteBq2x3kUPXSTxtT79Il3
 o2cBPIR4+6OcMtVo3rJiS7N6pxzqZoGylPeNKUmpYqqKUCCuZ/jQoBGJskkE7hESMV
 I66PoAmaHRp2qZGjAQcESmSCH4JiFzr9QJxdY1tBzPzuzlSAqPewtk8kuSI5i4pvwN
 v/uyvW6So2vDEfQ50jl+Yq4qqTDGxBarodYEpLFS3cX5/Qj5Tbo3gS8IMV/H3ghIwl
 Qp8v3qHrKD96HoXiNxr55OcRd7Mc8LrnUcU7T7BKiil14JX01M1yA7uf4qXOksWaaJ
 dupFyWsl8NRAQ==
Received: by mail-ed1-f69.google.com with SMTP id
 m12-20020a056402510c00b00413298c3c42so348210edd.15
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 23:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FxOVZjnNiVO0i9jH0i6UiovfwrDBwVKl5GL2sYOaVX4=;
 b=Y51+7oty7O7YUaHr33JYNKcpSmfiYq5+Tw/OrK0aspq8H0TxoD3Mlo4GPzMRvU8nsS
 M24/lE7/dHMdGFymWR2IzU26wVD5/xR1Gv29U/Ll/kCtsiUedbfxbJpYnaqPI0Qs3TbW
 9BsSOVO/fqUSNHKxbOmywuE/9Qd2yjD5H5/ABhAzs/hAmFtS67m7kW4G/7CvhB0Az52h
 gNA4zrsZx/zF0ll3tZQKtU6rHx9rn7mDrtaLgDfAPtTFeXoAXRkVS069yEV9aJ2gag+I
 urOIyjtN1hzSUbSFjE6fj+/+l2hKjk5wz80VPVMzl2HCYny7KNISSsj20FkLe2ptaoIV
 KvAA==
X-Gm-Message-State: AOAM532tVGFDNJ552KJpePaoM5B25G0aoYXjCpFdBYMmcaudZhISz28P
 Qg+uiJvYcBCE7poGSQSMP8XN1EKqMK7OhNm2bsyr/7Wps1RnyaaiOcjFxOJSY63kYA9hq9Ln5KR
 emtzTWp2OKsyPS3GABOnUuLbGMYggx1NGgnTgAUFd
X-Received: by 2002:a17:907:365:b0:6d1:bf9:9164 with SMTP id
 rs5-20020a170907036500b006d10bf99164mr1290205ejb.598.1645688811412; 
 Wed, 23 Feb 2022 23:46:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyF2QxOV5sZ3l9SN1ANQlm/aYyNKUMNdm1sWIKjHtTsjqFzwsoCzjjUbc5J7jIvGVZuZRXOYQ==
X-Received: by 2002:a17:907:365:b0:6d1:bf9:9164 with SMTP id
 rs5-20020a170907036500b006d10bf99164mr1290164ejb.598.1645688811188; 
 Wed, 23 Feb 2022 23:46:51 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id t24sm914666ejx.187.2022.02.23.23.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 23:46:50 -0800 (PST)
Message-ID: <3e4f387b-53fb-b031-223c-88adac7d4dae@canonical.com>
Date: Thu, 24 Feb 2022 08:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/11] driver: platform: add and use helper for safer
 setting of driver_override
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
 <20220223191310.347669-2-krzysztof.kozlowski@canonical.com>
 <20220223162538-mutt-send-email-mst@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223162538-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
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

On 23/02/2022 22:33, Michael S. Tsirkin wrote:
> On Wed, Feb 23, 2022 at 08:13:00PM +0100, Krzysztof Kozlowski wrote:
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
>>     (do_one_initcall) from [<c0f012c0>] (kernel_init_freeable+0x3d0/0x4d8)
>>     (kernel_init_freeable) from [<c0a7def0>] (kernel_init+0x8/0x114)
>>     (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
>>
>> Provide a helper which clearly documents the usage of driver_override.
>> This will allow later to reuse the helper and reduce amount of
>> duplicated code.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  drivers/base/driver.c           | 44 +++++++++++++++++++++++++++++++++
>>  drivers/base/platform.c         | 24 +++---------------
>>  include/linux/device/driver.h   |  1 +
>>  include/linux/platform_device.h |  6 ++++-
>>  4 files changed, 54 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/base/driver.c b/drivers/base/driver.c
>> index 8c0d33e182fd..79efe51bb4c0 100644
>> --- a/drivers/base/driver.c
>> +++ b/drivers/base/driver.c
>> @@ -30,6 +30,50 @@ static struct device *next_device(struct klist_iter *i)
>>  	return dev;
>>  }
>>  
>> +/*
>> + * set_driver_override() - Helper to set or clear driver override.
>> + * @dev: Device to change
>> + * @override: Address of string to change (e.g. &device->driver_override);
>> + *            The contents will be freed and hold newly allocated override.
>> + * @s: NULL terminated string, new driver name to force a match, pass empty
> 
> Don't you mean NUL terminated?

Yeah, NUL.

> Do all callers really validate that it's NUL terminated?

Good point, the callers use it in device attributes (sysfs) only, so it
might come non-NUL. Previously this was solved by kstrndup() which is
always terminating the string.


> 
>> + *     string to clear it
>> + *
>> + * Helper to setr or clear driver override in a device, intended for the cases
> 
> set?
D'oh!

> 
>> + * when the driver_override field is allocated by driver/bus code.
>> + *
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +int driver_set_override(struct device *dev, char **override, const char *s)
>> +{
>> +	char *new, *old, *cp;
>> +
>> +	if (!dev || !override || !s)
>> +		return -EINVAL;
>> +
>> +	new = kstrndup(s, strlen(s), GFP_KERNEL);
> 
> 
> what's the point of this kstrndup then? why not just kstrdup?

Thanks, it's a copy-paste. Useless now, but I'll pass the count directly
from the callers and then this will be NULL-terminating it.

> 
>> +	if (!new)
>> +		return -ENOMEM;
>> +
>> +	cp = strchr(new, '\n');
>> +	if (cp)
>> +		*cp = '\0';
>> +
>> +	device_lock(dev);
>> +	old = *override;
>> +	if (strlen(new)) {
> 
> We are re-reading the string like 3 times here.

Yep, the same in old code. I guess we could compare just pointers -
whether 'cp' is not NULL and different than 's'.

> 
>> +		*override = new;
>> +	} else {
>> +		kfree(new);
>> +		*override = NULL;
>> +	}
>> +	device_unlock(dev);
>> +
>> +	kfree(old);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(driver_set_override);
>> +
>>  /**
>>   * driver_for_each_device - Iterator for devices bound to a driver.
>>   * @drv: Driver we're iterating.
>> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
>> index 6cb04ac48bf0..d8853b32ea10 100644
>> --- a/drivers/base/platform.c
>> +++ b/drivers/base/platform.c
>> @@ -1275,31 +1275,15 @@ static ssize_t driver_override_store(struct device *dev,
>>  				     const char *buf, size_t count)
>>  {
>>  	struct platform_device *pdev = to_platform_device(dev);
>> -	char *driver_override, *old, *cp;
>> +	int ret;
>>  
>>  	/* We need to keep extra room for a newline */
>>  	if (count >= (PAGE_SIZE - 1))
>>  		return -EINVAL;
> 
> Given everyone seems to repeat this check, how about passing
> in count and doing the validation in the helper?

Good idea.

> We will then also avoid the need to do strlen and strchr.

The strlen() could be removed, but the strchr() should stay. What
solution do you have in mind to remove strchr()?

Thanks for review.


Best regards,
Krzysztof
