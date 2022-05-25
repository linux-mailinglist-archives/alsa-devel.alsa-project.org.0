Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0AE5335DF
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 05:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 093161669;
	Wed, 25 May 2022 05:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 093161669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653449732;
	bh=O5ShUL04Y8DYfFz2oqQlJX455CbkAwJDwJrIXEBxlsg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qKZ7RWHmetg8KLDSzkT3MPl32Eg1AkL9WJ0v2gBJ9zdqJXOtF9qAepd0nl174ozda
	 5aYrruY8Wt+p5MC/8II3CYnRBVHuxPw8IxWxhPIhuy923xUhfPHKYeZt7Lox8THBRX
	 O7MsuyX0p4rKvVjXHHYK+DD/sZuvzu9OVfgtxCpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6780EF801EC;
	Wed, 25 May 2022 05:34:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8733CF8016D; Wed, 25 May 2022 05:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F30CF80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 05:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F30CF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="H0nsJLXO"
Received: from [192.168.0.109] (unknown [123.112.66.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id BC7EA3F33E; 
 Wed, 25 May 2022 03:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653449662;
 bh=u7zU8VENwMpjZRwoc3dPmw0LIYj0IDwKJSS1j18/2Bc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=H0nsJLXOLXXEzabxR41q2366P+RLmSBXYHvjxop25wUe0neUZT9SVn4BY/0SWkRs9
 miywFGQTmSFcSz9NyTDvRIZQZVdivdWo7pWeXf1BOVLnQOoGWLRNWafDf3fdeDYQ9i
 Q7/dtHrmyA5hpdrSnhkIYOx334VVcaBnY5OE4QmKIPRYnm5LglmWheyV9vocQVWryJ
 GWaNZUCZmnu1yKJ60HNvskjx1HcBTfmKQxV/Axnp2sd34nSwpTMKnj5mq1x/SA815m
 tdF9WtpDipk3OT2zaTAN2Qk71q2JO87uOlGqZKKh2vu2xuKJ7o793Z+uYVtxqbYsJh
 lo3KjvSmn5m8A==
Message-ID: <f91bb93f-9129-fa1b-b939-fe521e726d42@canonical.com>
Date: Wed, 25 May 2022 11:34:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: nau8822: choose the best master clock prescalar
Content-Language: en-US
To: David Lin <ctlin0.linux@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220524033309.30289-1-hui.wang@canonical.com>
 <9e1eb15c-ca3a-dc04-1f8d-4ea71e32cce8@gmail.com>
 <d756972a-d010-7e9c-9dcf-f26ae6edc16c@canonical.com>
 <bf52d764-ae62-921f-bfdd-503c42e4a85f@gmail.com>
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <bf52d764-ae62-921f-bfdd-503c42e4a85f@gmail.com>
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


On 5/24/22 18:22, David Lin wrote:
> On 2022/5/24 下午 04:38, Hui Wang wrote:
>>
>> On 5/24/22 16:07, David Lin wrote:
>>> On 2022/5/24 上午 11:33, Hui Wang wrote:
>>>> We have an imx6sx EVB with the codec nau8822, when playing the audio
>>>> with 48k sample rate, the audio sounds distorted and obviously faster
>>>>
>> <snip>
>>>> -            div = i;
>>>>           }
>>>>           dev_dbg(component->dev, "master clock prescaler %x for fs 
>>>> %d\n",
>>>>               div, rate);
>>>
>>> Regarding to your environment with input MCLK is 24 MHz, I think you 
>>> should enable PLL for the internal process of codec.
>>>
>>> So you should do the following calls/operations:
>>>
>> Thanks for your suggestion. In our case, we use the simple-card as 
>> the machine driver, the simple-card hard-codes the 2nd parameter of 
>> snd_soc_dai_set_sysclk() to 0, and we don't plan to write a new 
>> machine driver since sound quality is pretty good if setting to 46875Hz.
>>
>> So according to your experience, does the new algorithm bring any 
>> side effect or break existing platforms? If so, we have to write a 
>> new machine driver (that is a big effort).
>>
>> Thanks,
>>
>> Hui.
>>
> Even you can hear better sound quality than original, it don't still 
> have better performance(THD+N) than MCLK is 256FS. Generally,  we will 
> suggest the below that for customer support.
> 1. Check dts description from simple-card about the value of mclk-fs 
> is 256? The reason is nau8822 codec just support 256FS. Besides, the 
> I.MX EVB should be with flexible clock generation.
> 2. Based on the flexible clock generation, you should input 12.288Mhz 
> as MCLK, so the simple-card is suitable for your case with low effort.
> 3. If your MCLK is always 24MHz, PLL enable is preferred as previous 
> mention. One is to implement/porting a machine driver, the other is to 
> revise asoc_simple_hw_params callback function from simple-card-utils.c.

OK, got it. Thanks.


>>> //PLL
>>>     ret = snd_soc_dai_set_sysclk(codec_dai, NAU8822_CLK_PLL,
>>>                       24000000, SND_SOC_CLOCK_IN);
>>>     if (ret < 0 )
>>>         dev_err(card->dev, "failed to set codec sysclk: %d\n", ret);
>>>
>>>     ret = snd_soc_dai_set_pll(codec_dai, 0, 0,
>>>                   24000000, 256 * params_rate(params));
>>>     if (ret < 0 )
>>>
>>>         dev_err(card->dev, "failed to set codec pll: %d\n", ret);
>>>
>>> David
>>>
