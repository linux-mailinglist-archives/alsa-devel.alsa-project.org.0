Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99192532772
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 12:23:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5FF16F6;
	Tue, 24 May 2022 12:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5FF16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653387837;
	bh=5Io/h6/VRakQKRMUKEOhnbpXGR19NxU9zFWTsMzvSAs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pj+361F+nQMKOoVt9Yj3m1Mb00Or65eP8vxIcp+2DiKI4bLlGG2DiXOK7+loLfBxq
	 9AEHKQ1YBo9jIoFOju9lXqOulr+3EKvcQWT3mW3/FoTv58NgP1qgf0YeO05ENRkXrK
	 sHjuXfeItLZL6F72zSMGvw1EoMULI1L914p2Sxvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DA24F804CC;
	Tue, 24 May 2022 12:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5133DF80116; Tue, 24 May 2022 12:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1BCBF80116
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 12:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1BCBF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dhOslRkx"
Received: by mail-pg1-x52e.google.com with SMTP id r71so15998303pgr.0
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FHkvj96lD5L4+5KYVz6itu6tz7E4LTR2tAbmmQhX7mE=;
 b=dhOslRkxYURc7RMJyr2WAHRIvGAWig0pwq3hG1ZupXU/nJ2IjcmsSYXSfcj2cwaJHk
 sot8cxZps3bSHg6qvy7A8CV5sbcOLUu8Tg0nDEHtxS0JrE9s1+xlfp/atH0TJCYDMseY
 WQDlpCHreNhWAUuJv+3nbct5T+t+xLtL/bht7K1h+7YenFc3LXkNfiP3RZhdKqYADcH0
 GfB2CXI27EwPt99RxmkxMaaDkPmKNITBfmcwMs8KE7GFWsAlVfDc9zFmAl0+ScjnS5Ge
 YvZ8Za+mEbCh4tvwThBvzgG+WFYgJqfrGE6ca6DEqh39N6DuO1M5Jbf0qS1PnkKNs08o
 Jxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FHkvj96lD5L4+5KYVz6itu6tz7E4LTR2tAbmmQhX7mE=;
 b=eDsVYvxNdBIuxBwc/dj0Y4g0RE8fgijaQEKMkIq62kxQ7xwpNMI4lEgWhz7Gft9nEM
 R2uycw9I/zYGWZjT+WXfj2C2x471lyijPN9bM2EKjAj2DhtqIIeqV+HtaZp65jq+Em62
 g6QntX2Z0ziuwMdNbqpU7hcYrQwAj48gV0EjFe38ovxfRADDqSche9NE1vlkT9u3YKgq
 kpCoMBBq2SDhDd9uWRkYRaEjxwSTGbXUQohXyvZYAFJR/GF0etBVTBh8DSL9sarIa5yG
 IuCZp7hn5ChIbb6Mf8fD22sNBjSy5Md/aDgJ6vzwqu55whmpWwNKN0cxkuSIgi7mrQeK
 CpMw==
X-Gm-Message-State: AOAM530r1xDlErV85ZIl9OnYHUGjRycT/l8T8gwC+YqIMbnLbGNejPT9
 xaL71AZ5DqGvmjyCBue0DP4=
X-Google-Smtp-Source: ABdhPJzcLlejIs2QmD5uJE08BYtmOh2ZkR5oJYFKzYj1fixpXsIrBDEdbZMVVU9NM067C1aEPrUUug==
X-Received: by 2002:a65:558d:0:b0:3f5:f26d:f420 with SMTP id
 j13-20020a65558d000000b003f5f26df420mr24000303pgs.434.1653387763918; 
 Tue, 24 May 2022 03:22:43 -0700 (PDT)
Received: from [192.168.0.103] (39-13-101-104.adsl.fetnet.net. [39.13.101.104])
 by smtp.gmail.com with ESMTPSA id
 p42-20020a056a0026ea00b00518bbe1794bsm2163484pfw.76.2022.05.24.03.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 03:22:43 -0700 (PDT)
Message-ID: <bf52d764-ae62-921f-bfdd-503c42e4a85f@gmail.com>
Date: Tue, 24 May 2022 18:22:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] ASoC: nau8822: choose the best master clock prescalar
Content-Language: en-US
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220524033309.30289-1-hui.wang@canonical.com>
 <9e1eb15c-ca3a-dc04-1f8d-4ea71e32cce8@gmail.com>
 <d756972a-d010-7e9c-9dcf-f26ae6edc16c@canonical.com>
From: David Lin <ctlin0.linux@gmail.com>
In-Reply-To: <d756972a-d010-7e9c-9dcf-f26ae6edc16c@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, YHCHuang@nuvoton.com, SJLIN0@nuvoton.com,
 kchsu0@nuvoton.com, David Lin <CTLIN0@nuvoton.com>
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

On 2022/5/24 下午 04:38, Hui Wang wrote:
>
> On 5/24/22 16:07, David Lin wrote:
>> On 2022/5/24 上午 11:33, Hui Wang wrote:
>>> We have an imx6sx EVB with the codec nau8822, when playing the audio
>>> with 48k sample rate, the audio sounds distorted and obviously faster
>>>
> <snip>
>>> -            div = i;
>>>           }
>>>           dev_dbg(component->dev, "master clock prescaler %x for fs 
>>> %d\n",
>>>               div, rate);
>>
>> Regarding to your environment with input MCLK is 24 MHz, I think you 
>> should enable PLL for the internal process of codec.
>>
>> So you should do the following calls/operations:
>>
> Thanks for your suggestion. In our case, we use the simple-card as the 
> machine driver, the simple-card hard-codes the 2nd parameter of 
> snd_soc_dai_set_sysclk() to 0, and we don't plan to write a new 
> machine driver since sound quality is pretty good if setting to 46875Hz.
>
> So according to your experience, does the new algorithm bring any side 
> effect or break existing platforms? If so, we have to write a new 
> machine driver (that is a big effort).
>
> Thanks,
>
> Hui.
>
Even you can hear better sound quality than original, it don't still 
have better performance(THD+N) than MCLK is 256FS. Generally,  we will 
suggest the below that for customer support.
1. Check dts description from simple-card about the value of mclk-fs is 
256? The reason is nau8822 codec just support 256FS. Besides, the I.MX 
EVB should be with flexible clock generation.
2. Based on the flexible clock generation, you should input 12.288Mhz as 
MCLK, so the simple-card is suitable for your case with low effort.
3. If your MCLK is always 24MHz, PLL enable is preferred as previous 
mention. One is to implement/porting a machine driver, the other is to 
revise asoc_simple_hw_params callback function from simple-card-utils.c.
>> //PLL
>>     ret = snd_soc_dai_set_sysclk(codec_dai, NAU8822_CLK_PLL,
>>                       24000000, SND_SOC_CLOCK_IN);
>>     if (ret < 0 )
>>         dev_err(card->dev, "failed to set codec sysclk: %d\n", ret);
>>
>>     ret = snd_soc_dai_set_pll(codec_dai, 0, 0,
>>                   24000000, 256 * params_rate(params));
>>     if (ret < 0 )
>>
>>         dev_err(card->dev, "failed to set codec pll: %d\n", ret);
>>
>> David
>>
