Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D644D44E7
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 11:44:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8211896;
	Thu, 10 Mar 2022 11:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8211896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646909042;
	bh=HKnog4jUPv78Ewl8NvKqwN5IEDAotFNPtUDK4dUWFWg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gpy+69A5kFWUZbUA+ztySocF1C9AXySviM0Tgrlfcb80OVURN/Y0HScUup31BFWSd
	 ARm5sYbUweH2BhF7/leIDM3fZvH4vLM9kpErjqVuWuQTN89GBL/M1LXgrnMyeyc+jT
	 suDE5oNmlQLSQx/dehYcWIUmW6KVIB64RehXGYDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33DCDF800FD;
	Thu, 10 Mar 2022 11:42:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1B0BF800FD; Thu, 10 Mar 2022 11:42:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A399AF800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 11:42:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A399AF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tIzoauSJ"
Received: by mail-wr1-x434.google.com with SMTP id x15so7200791wru.13
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 02:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QVMbWuHkkDuZtNM8luekJjrN/fjg/FyiWebrna5roZw=;
 b=tIzoauSJ+w5agVaEFio3bpeTlHSNKY7X4l83Kr8LtMdX7pcS3I+jVWWKNLFprL+e3p
 yMRJADedzZG7//YHPb+2zWxhWZ+UaEz7ubkaPixFQZhL4RXi6Oq+9/bQGTSEMWDeKaPq
 sXaYEm3chI4nvNcNVIEOYeOIIMhumUmkyyCX/h4YUmCiQvpecMQTmILjGYlPj8DmVcn4
 XoeSe0geQ5i32wtQn+Ywn4REMUWuwyqFp6XuK/Bn0bkzuZUQlenWReKxabxrAKIRMzS1
 If+tpvYP0RWQVIbRllPeA+KJ8iVWm/KuKZ3IPewdqJxOmzLG0eK+HO+Bndo5SAjFLSJ6
 wWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QVMbWuHkkDuZtNM8luekJjrN/fjg/FyiWebrna5roZw=;
 b=DTI21kwvPADeroIM7NBszVurdkOfaVxpp1QjYqng2cwzE+WZCLJTMwdWhVUEQD3S2M
 aSFXLkhAFevEesNvRiyP5s9mA4lrzGgs8+RbfZLlYC2A8jO0UvjHw9kdGxutpSOJvs9x
 rBURtOwHgvCUbFUCuQB6LC6TEVxzyWqO2i1KyPL677v7AKwhvMHvcqFnGWvE6mQY6rxq
 TrEsO7BYiabfWC+d2JZme6Gw/YIFODTy0+H2SfMj7xHK0yUQe7MTBWC1dVDCbqM9lC52
 vW9bHoK6ZHpsVMEKBvvR1SNJL5sKL2NhopCx4eJb8nkvLTJpl7ASMAItvgBvYyzVmnpu
 tyqw==
X-Gm-Message-State: AOAM533gcVG9+64vmqA9a4B1Hib0dONwPOfMMBHgaVhikra0BRsIWCKQ
 YVHza2TJ/AT8U7loGbYCp1Fanw==
X-Google-Smtp-Source: ABdhPJyY6drV+z0QAzNTPASiA7ycLBG5wzjkdEV9U3cnvDm+EIQxess0YzG0KPe/LtY8rbMKgGefdQ==
X-Received: by 2002:adf:fa41:0:b0:1f0:2118:4832 with SMTP id
 y1-20020adffa41000000b001f021184832mr3016372wrr.571.1646908963682; 
 Thu, 10 Mar 2022 02:42:43 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 g2-20020a5d46c2000000b001f079ba0158sm3751927wrs.60.2022.03.10.02.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 02:42:43 -0800 (PST)
Message-ID: <5e13c1ba-0bf5-e360-c350-e7a1a1402350@linaro.org>
Date: Thu, 10 Mar 2022 10:42:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c5ea7235-8642-6a89-f4ce-bd0861b6e4aa@linaro.org>
 <CA+V-a8tkhERx+8zDae5aWkNQ9Oxd1AamRL=i4TDC2X8RGgAo0w@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CA+V-a8tkhERx+8zDae5aWkNQ9Oxd1AamRL=i4TDC2X8RGgAo0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-arm-msm@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, LKML <linux-kernel@vger.kernel.org>
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



On 10/03/2022 10:23, Lad, Prabhakar wrote:
> On Thu, Mar 10, 2022 at 10:16 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 24/12/2021 16:13, Lad Prabhakar wrote:
>>> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
>>> allocation of IRQ resources in DT core code, this causes an issue
>>
>> Are you saying that we should not be using platform_get_resource(pdev,
>> IORESOURCE_IRQ, ...) on drivers that support DT?
>>
>>> when using hierarchical interrupt domains using "interrupts" property
>>> in the node as this bypasses the hierarchical setup and messes up the
>>> irq chaining.
>>
>> Should this not be fixed in the DT core itself?
>>
> Yes the plan is to fix in the DT core itself (refer [0]).
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
>>>
>>> In preparation for removal of static setup of IRQ resource from DT core
>>> code use platform_get_irq().
>>
>> I would prefer this patch to be part of the series that removes IRQ
>> resource handling from DT core.
>>
> Since there are too many users (which are in different subsystems)
> getting this all in single series would be a pain. As a result it is
> split up into individual subsystems.
Am happy for this to be included in that series,
TBH, this patch make more sense along with that series than by itself.

This would also give better insight of what exactly is changing in 
platform_get_resource() w.r.t handling IRQ resources.


--srini

> 
> Cheers,
> Prabhakar
> 
>>
>> --srini
>>
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> Hi,
>>>
>>> Dropping usage of platform_get_resource() was agreed based on
>>> the discussion [0].
>>>
>>> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
>>> patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>>>
>>> Cheers,
>>> Prabhakar
>>> ---
>>>    drivers/slimbus/qcom-ngd-ctrl.c | 10 ++++------
>>>    1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
>>> index 7040293c2ee8..0f29a08b4c09 100644
>>> --- a/drivers/slimbus/qcom-ngd-ctrl.c
>>> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
>>> @@ -1526,13 +1526,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>>>        if (IS_ERR(ctrl->base))
>>>                return PTR_ERR(ctrl->base);
>>>
>>> -     res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>>> -     if (!res) {
>>> -             dev_err(&pdev->dev, "no slimbus IRQ resource\n");
>>> -             return -ENODEV;
>>> -     }
>>> +     ret = platform_get_irq(pdev, 0);
>>> +     if (ret < 0)
>>> +             return ret;
>>>
>>> -     ret = devm_request_irq(dev, res->start, qcom_slim_ngd_interrupt,
>>> +     ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
>>>                               IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
>>>        if (ret) {
>>>                dev_err(&pdev->dev, "request IRQ failed\n");
