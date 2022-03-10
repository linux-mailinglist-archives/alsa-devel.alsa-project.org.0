Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F494D4B96
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 16:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B818192F;
	Thu, 10 Mar 2022 16:00:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B818192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646924451;
	bh=gSIXry74BXZrNqGQPSMUvAtkT2ZX4kHq7QJZIyDNbG0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMbrb1eOKImNgZpeXeaaOZB2LYtDTejwfbLuIbRLhr/8V9jLRHRmyGKMr1GziDivg
	 c6Z1xWL/1svfecU/JQ5wJpCU2/GQUKAOtU+2g3UCiGMth/kFV4vsWXxyLjMNP8DUpU
	 4hvrA1jqcfQCLZzdFXl4YhU4uBbZAWUM1wQh8In8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B39D5F800D2;
	Thu, 10 Mar 2022 15:59:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 542A3F80137; Thu, 10 Mar 2022 15:59:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC80CF8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 15:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC80CF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="X782N19d"
Received: by mail-wr1-x42d.google.com with SMTP id i8so8398689wrr.8
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WfdM7IjnkQbW/GFyl7ZAZWNjxtALccG+KyqYcmtUGo8=;
 b=X782N19daHKUabLfmL0UoMX7eNDRn81afXG0CWoRE6Cz3LlTu8p8F0X5iacBU0vy/l
 LdoEuvB+D66xW13jaIyHfVFOcb56AcApZhf4Yrpu5YQEWuxTB5E21Pns7ldjDgvZjCps
 YHw5a8OpdFXiLOikzgKwqtmzqu5EFeYcgv3N8HY+zJ8g67TgeJrLOAGfp6daFfhQlzHY
 uu/Ig22PZG7a1ivhNepdqhjoISabu4Kfx5VPgaLPfO9KcImpAzpU9RXMj+xYeln9TdYT
 7DZO/P5OUnderhapxJpAUvOk4wpCA/HBCBhapeK6Y3g4VWCen058QniPzWQNPudYy271
 iaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WfdM7IjnkQbW/GFyl7ZAZWNjxtALccG+KyqYcmtUGo8=;
 b=51hiSpixrrATgCbVcIJw5gzIaouMpHQHvfFFGyxcvgf6ojRC1FqcInT2ka9ZAiUv6U
 0Op3IYSir6ccmUv4arAgP8k/rUK7ThDhZkU1779XGhVjoezKf7FDaC+gCpcJ8iHIeVuJ
 R5iUgXWgZVru3U1T3zuVpe8iAjDOBtGT9+UNqI9ynVt9LtDExZEYNo6aqVwBNR04PRk8
 o45SQ4l/oyeYUaY7lwGwznpA8IBkIFDW3QIoPNoftlCr5J0/ElwnmKPjU4ZGNjo8+GGB
 GCubl/B7e5h1qwWn0iwp1gZ7u2KMyrCKB664z0A1xloi+2hYY1uovwloxn30A7EaXMHx
 /5eg==
X-Gm-Message-State: AOAM532ML/wpYKPNCsioLcD3i2Or9sbtT7axR9DZ6d9PYuaCGzI0rFer
 5o89NlteKlawF0eWBJSdjpRRiQ==
X-Google-Smtp-Source: ABdhPJxf/wxaLrByJQKeLfO+RTYrRC8nU2ZTBjpj+9snBKtvZmDtOG0GOlbl0kzwhkTQ7TDx1Fp2DA==
X-Received: by 2002:a05:6000:188e:b0:1f1:f8f0:f75a with SMTP id
 a14-20020a056000188e00b001f1f8f0f75amr3714496wri.682.1646924371520; 
 Thu, 10 Mar 2022 06:59:31 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a5d554b000000b001f0326a23ddsm4303394wrw.70.2022.03.10.06.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 06:59:31 -0800 (PST)
Message-ID: <c3e75761-e554-d8b1-f41d-f7bed5a0cce7@linaro.org>
Date: Thu, 10 Mar 2022 14:59:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5ea7235-8642-6a89-f4ce-bd0861b6e4aa@linaro.org>
 <CA+V-a8tkhERx+8zDae5aWkNQ9Oxd1AamRL=i4TDC2X8RGgAo0w@mail.gmail.com>
 <5e13c1ba-0bf5-e360-c350-e7a1a1402350@linaro.org>
 <CAL_Jsq+CWKvkHMNhAa3o_rSLy_+AoHi6wkB3MRM8O3jJ5sG_Wg@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAL_Jsq+CWKvkHMNhAa3o_rSLy_+AoHi6wkB3MRM8O3jJ5sG_Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>, Andy Gross <agross@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
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



On 10/03/2022 14:14, Rob Herring wrote:
> On Thu, Mar 10, 2022 at 4:42 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 10/03/2022 10:23, Lad, Prabhakar wrote:
>>> On Thu, Mar 10, 2022 at 10:16 AM Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 24/12/2021 16:13, Lad Prabhakar wrote:
>>>>> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
>>>>> allocation of IRQ resources in DT core code, this causes an issue
>>>>
>>>> Are you saying that we should not be using platform_get_resource(pdev,
>>>> IORESOURCE_IRQ, ...) on drivers that support DT?
> 
> We should be using platform_get_irq(). (period, on all platform drivers)
> 

Thanks, I see why is it preferred.

Code as of now will not prevent drivers from calling 
platform_get_resource(..IORESOURCE_IRQ).

Are we planning to enforce this in any way?

>>>>> when using hierarchical interrupt domains using "interrupts" property
>>>>> in the node as this bypasses the hierarchical setup and messes up the
>>>>> irq chaining.
>>>>
>>>> Should this not be fixed in the DT core itself?
>>>>
>>> Yes the plan is to fix in the DT core itself (refer [0]).
>>>
>>> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>>>
>>>>>
>>>>> In preparation for removal of static setup of IRQ resource from DT core
>>>>> code use platform_get_irq().
>>>>
>>>> I would prefer this patch to be part of the series that removes IRQ
>>>> resource handling from DT core.
>>>>
>>> Since there are too many users (which are in different subsystems)
>>> getting this all in single series would be a pain. As a result it is
>>> split up into individual subsystems.
>> Am happy for this to be included in that series,
>> TBH, this patch make more sense along with that series than by itself.
> 
> No it doesn't. This is no different than converting to devm_* variants
> or other cleanups to match current preferred styles.
> 
> Treewide cross subsystem clean-ups are a huge pain to merge. Why would
> you ask for that when it is clearly not necessary?

Only reason for this ask was to understand how platform_get_resource() 
will change moving forward, if this is something that you are planning 
to include in your fix patches.

I can go ahead and apply the patch, if that helps.

--srini
> 
> Rob
