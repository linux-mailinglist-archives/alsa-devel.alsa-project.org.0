Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19124F8FD6
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DAF818D3;
	Fri,  8 Apr 2022 09:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DAF818D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404238;
	bh=/hx8Yrf99eaTbqv/H/8PL5wwo9NJFVFS2q4y8yzBWXw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tWr0OBMi+HPwkXcq5p0APZAT6p9y6A8odHObRiMlQlgrW0UyppcuquuywRsEWsnOC
	 FIUD1S7XyUwQHiizuJs3cruGzsObVxrHZ2uff7DiRLfzMcgjDK6VMDP2TGOXOSotOr
	 D0VtnYmz8L5ZSWq3Sgd6756Pjni1SnswbfFU52Jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB014F80529;
	Fri,  8 Apr 2022 09:48:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 472F4F800D1; Mon,  4 Apr 2022 11:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9585F800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 11:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9585F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QyIkbrvP"
Received: by mail-wm1-x329.google.com with SMTP id r7so5514278wmq.2
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xry0fvSIyDxjB2H9TftOM1VVr7Z84GMJx65XGE7l1g8=;
 b=QyIkbrvP3PXHYn8SZb3YFGNOU4YEWKwijKbTOMes2v3n/iFjy3E0l83+3PU1OyKdiC
 28W9oIBBI4K+hraVFUC4rWiUr33rPk2ySKcvsAeR22WUXi4iM2aHnZd8Fn1GeAeirYrD
 vpYCRqjh9PypWsECcQ9s8YJ0IOwuqrtnIou1JtT8aMLsJeQiP8+/F14BOx45Pzoc5hOs
 zFVa0z20WuRvfR9IM3W6B7NXFHL5NIRr3q2/9wWYRFFUZeBeGzMux4sUyMGNAuZjF3t0
 mwwwBGsWFJCRgizWUZXY7qrl7cdc2T3DX58d8hKruK4mcWNDpPeP1QmPVvKj4hi4kGzf
 uymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xry0fvSIyDxjB2H9TftOM1VVr7Z84GMJx65XGE7l1g8=;
 b=NTxAv77u8nvXhgjYPq425F62cx8b7mo5XTgdq/lB+0RFjAj7GunRxvbwhL4Ju0CX3P
 GHvZduhrPL97/b3ecP3QnCwqth9DofF0uJFxtrrDtS3aQqRx91iENhQNBkHJiUcB626P
 nK0ft1/UiJexKrVMbZCN0L9W05fsmGLoCEiVQiKB6fm9aBxyCpcogQoQBOapWAlPXxbX
 P4hWmxSWYsrlY2IheIN6lqImNufXWcX5EQrldO/00hoX6aAA2P7tVr8ybm0dedDKLDbt
 F8ts4m9L6ynRQfs7E5RXnisQw03k3fT/NWx2IUK9E52Fj3M4P9JSJIb1Qlr76XHIqyzs
 glug==
X-Gm-Message-State: AOAM5339ScRMr5526MUMAqtB14vSsPpfLeZEMSnf2IHQY2agHFDYpERG
 kIiVdBi4B7VxN9imYa83hKDIAw==
X-Google-Smtp-Source: ABdhPJw+vbnPc6vft6RqA6zSnbRtvDlS1NwlZFp269pvENQ083BNJ7dEdI8BO5JpR9Ta6ymEkaX/jQ==
X-Received: by 2002:a05:600c:3487:b0:38c:9a42:4d49 with SMTP id
 a7-20020a05600c348700b0038c9a424d49mr18900226wmq.29.1649064894420; 
 Mon, 04 Apr 2022 02:34:54 -0700 (PDT)
Received: from [192.168.0.173] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6484000000b002057ad822d4sm9143811wri.48.2022.04.04.02.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 02:34:54 -0700 (PDT)
Message-ID: <2976f4f9-4fda-c04f-45cf-351518f88ec0@linaro.org>
Date: Mon, 4 Apr 2022 11:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 01/12] driver: platform: Add helper for safer setting
 of driver_override
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220403183758.192236-1-krzysztof.kozlowski@linaro.org>
 <20220403183758.192236-2-krzysztof.kozlowski@linaro.org>
 <CAHp75Vczm9f9Bx_w4nW31cnBgwEzPiN-Eqn-7DKZuB+Hew0F=Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAHp75Vczm9f9Bx_w4nW31cnBgwEzPiN-Eqn-7DKZuB+Hew0F=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:12 +0200
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

On 04/04/2022 11:16, Andy Shevchenko wrote:
> On Sun, Apr 3, 2022 at 9:38 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
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
>>
>> Provide a helper which clearly documents the usage of driver_override.
>> This will allow later to reuse the helper and reduce the amount of
>> duplicated code.
>>
>> Convert the platform driver to use a new helper and make the
>> driver_override field const char (it is not modified by the core).
> 
> ...
> 
>> +int driver_set_override(struct device *dev, const char **override,
>> +                       const char *s, size_t len)
>> +{
>> +       const char *new, *old;
>> +       char *cp;
> 
>> +       if (!override || !s)
>> +               return -EINVAL;
> 
> Still not sure if we should distinguish (s == NULL && len == 0) from
> (s != NULL && len == 0).
> Supplying the latter seems confusing (yes, I see that in the old code). Perhaps
> !s test, in case you want to leave it, should be also commented.

The old semantics were focused on sysfs usage, so clearing is by passing
an empty string. In the case of sysfs empty string is actually "\n". I
intend to keep the semantics also for the in-kernel usage and in such
case empty string can be also "".

If I understand your comment correctly, you propose to change it to NULL
for in-kernel usage, but that would change the semantics.

> Another approach is to split above to two checks and move !s after !len.

I don't follow why... The !override and !s are invalid uses. !len is a
valid user for internal callers, just like "\n" is for sysfs.

> 
>> +       /*
>> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
>> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
>> +        * Thus we can store one character less to avoid truncation during sysfs
>> +        * show.
>> +        */
>> +       if (len >= (PAGE_SIZE - 1))
>> +               return -EINVAL;
> 
> Perhaps explain the case in the comment here?

You mean the case we discuss here (to clear override with "")? Sure.

> 
>> +       if (!len) {
>> +               device_lock(dev);
>> +               old = *override;
>> +               *override = NULL;
> 
>> +               device_unlock(dev);
>> +               goto out_free;
> 
> You may deduplicate this one, by
> 
>                goto out_unlock_free;
> 
> But I understand your intention to keep lock-unlock in one place, so
> perhaps dropping that label would be even better in this case and
> keeping it

Yes, exactly.

> 
>        kfree(old);
>        return 0;
> 
> here instead of goto.

Slightly more code, but indeed maybe easier to follow. I'll do like this.


Best regards,
Krzysztof
