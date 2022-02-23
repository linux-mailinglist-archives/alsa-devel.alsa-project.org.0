Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4854C1558
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 15:24:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F6481AAA;
	Wed, 23 Feb 2022 15:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F6481AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645626248;
	bh=GxjdOSZturduP0ramCT4kogXspKqrhe0TCCvSE2jzDg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RKP3bc6lkdwdN/71awee6bkynICaJGEdlkWfPJEWPvIpMKK2zAu8fAExKAor3Gv1Z
	 0NO3NIAZj0j1N6X/oZ09EalLN+AH/f4D2/usRdYjZA+O7CmWJlg/8LVY8eNqq18tYo
	 e4yp2kM30qT98a9ObEiCYt5KF9gUCQKsoP0kpktc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA32AF800B6;
	Wed, 23 Feb 2022 15:23:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC03F80237; Wed, 23 Feb 2022 15:22:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E58DF80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 15:22:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E58DF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="KprZCbbn"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4BB473F1DD
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645626167;
 bh=UkXoPF9GFsyAWsCPL3ryOH3fKN9jJKmB8GGxrcEoohU=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=KprZCbbn9roHI76H3j/ZoMkRIaG+CEATaMj+2Zz8rEdG9iHpHB0b5QiRpqTrY/bVj
 nZI2AdL2jNVcY0KA/s1yh/EtXgtzjRzKQS47WKnxXg9sNcUVVDBNOw7uFYsdHJJGIy
 WvwsVL+Kgv+wpyfNwLE1rs9FgEbK5vuUUtbp0kcVdi9HTKYsKJjoZPkevXORaKD2P3
 AU5qH9Efl8faRmCz71Fsrd9M13G52a56P37CML/QUFaKGneArevM+LaKZY88/Tz4Ru
 mPIdF8H0eKkXO5NyWcsgCnWHrItwE4uaCNeoYbwdcBQUdIe+bAEkl7T5fgqHwUv8XB
 WiK+ELItfF/kA==
Received: by mail-ej1-f71.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso7147393ejc.22
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 06:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UkXoPF9GFsyAWsCPL3ryOH3fKN9jJKmB8GGxrcEoohU=;
 b=0eGmlOhY62M7DI459eTipXMLoS9LH1bQ2uBd7U9s8DUY2QnFY8qZE3dQ/R0kTVj4Mn
 lqgyPX6b+ircZSzZ2ufa0NwHiR0kry+biizk/3yzKyIE/zu4wn8VlILlALfedkkz+XW6
 sD3JSrb51TeBokGUb2rhmH9V3+xd7ZSTudNff7tjJY6hD/rn0e0ioWeLyE7LUqq4m5K2
 YQunpbHRR4C+eQ2olu70hEy/wND91JTp1SfzDdcA3k9bnKAoCMJ+U/psb/hiL8w0Y4IE
 eSRk4GRVmm+I1sJGzgkbeO/n6Tp9JhsPjdfpZbU7FRf6YeRXTSTDYrksFMZNlHlpRVPC
 DkSQ==
X-Gm-Message-State: AOAM531B6dP/xo1Ppa+gfIgwwatgN8tqDGnJlvAeyibMotfSW6dlsYYv
 DZKsxsHYEmU5qnWrQHUiEDMfjShwJY7uMMEgq+X6StRh31nS3VpK2ilveUsgA/E9D9P9p22qZ4N
 6DLxd/vighYx0iYzrm3OgRWBUOiELcly8rPe8lTqP
X-Received: by 2002:a05:6402:1cae:b0:410:d3ae:3c8a with SMTP id
 cz14-20020a0564021cae00b00410d3ae3c8amr30820300edb.215.1645626166977; 
 Wed, 23 Feb 2022 06:22:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1+uin+sD6tlXUeggUaMrdcvpbhQG85O0fMULNFHN+DWoNxV6JXqumR8Csk+bhXTmYR8AoJw==
X-Received: by 2002:a05:6402:1cae:b0:410:d3ae:3c8a with SMTP id
 cz14-20020a0564021cae00b00410d3ae3c8amr30820260edb.215.1645626166707; 
 Wed, 23 Feb 2022 06:22:46 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id hp7sm2475722ejc.144.2022.02.23.06.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 06:22:45 -0800 (PST)
Message-ID: <636e5b92-8ed8-35a1-d6e9-516d5b35be91@canonical.com>
Date: Wed, 23 Feb 2022 15:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Abel Vesa <abel.vesa@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
 <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
 <afa7001d-901e-55bf-b8dc-77051b1e7f78@canonical.com>
 <0442526f-b6d9-8868-ac1c-dd11a2d3b2ab@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <0442526f-b6d9-8868-ac1c-dd11a2d3b2ab@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23/02/2022 15:04, Robin Murphy wrote:
> On 2022-02-22 14:06, Krzysztof Kozlowski wrote:
>> On 22/02/2022 14:51, Rasmus Villemoes wrote:
>>> On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
>>>> Hi,
>>>>
>>>> Drivers still seem to use driver_override incorrectly. Perhaps my old
>>>> patch makes sense now?
>>>> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
>>>>
>>>> Not tested - please review and test (e.g. by writing to dirver_override
>>>> sysfs entry with KASAN enabled).
>>>
>>> Perhaps it would make sense to update the core code to release using
>>> kfree_const(), allowing drivers to set the initial value with
>>> kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
>>> will continue to work [but if they kstrdup() a string literal they could
>>> be changed to use kstrdup_const].
>>
>> The core here means several buses, so the change would not be that
>> small. However I don't see the reason why "driver_override" is special
>> and should be freed with kfree_const() while most of other places don't
>> use it.
>>
>> The driver_override field definition is here obvious: "char *", so any
>> assignments of "const char *" are logically wrong (although GCC does not
>> warn of this literal string const discarding). Adding kfree_const() is
>> hiding the problem - someone did not read the definition of assigned field.
> 
> That's not the issue, though, is it? If I take the struct 
> platform_device definition at face value, this should be perfectly valid:
> 
> 	static char foo[] = "foo";
> 	pdev->driver_override = &foo;


Yes, that's not the issue. It's rather about the interface. By
convention we do not modify string literals but "char *driver_override"
indicates that this is modifiable memory. I would argue that it even
means that ownership is passed. Therefore passing string literal to
"char *driver_override" is wrong from logical point of view.

Plus, as you mentioned later, can lead to undefined behavior.

> 
> And in fact that's effectively how the direct assignment form works 
> anyway - string literals are static arrays of type char (or wchar_t), 
> *not* const char, however trying to modify them is undefined behaviour.
> 
> There's a big difference between "non-const" and "kfree()able", and 
> AFAICS there's no obvious clue that the latter is actually a requirement.

Then maybe kfreeable should be made a requirement? Or at least clearly
documented?


Best regards,
Krzysztof
