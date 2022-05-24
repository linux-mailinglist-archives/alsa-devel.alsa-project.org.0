Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA3532583
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 10:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F915163A;
	Tue, 24 May 2022 10:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F915163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653381594;
	bh=aZmYk6+eppTKV/ij8ArI13IEMWwpvXjDGoItqBk0NuE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bN2KkNPjmE8QRqtU+G1UBYHjLWelHaMPAQYgTxGOBPno6wt6iG6uUI5hsIQipVd4n
	 RVGeuL0+pDiF9qF59Oy5cE82Num17V9+2ADEQTxwSRd7Y9clJKCR9i29yy7Bl96tky
	 EHBX6W5J5YZxPKrR54dmfvL2SGZvfavavS9RNhCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA836F80100;
	Tue, 24 May 2022 10:38:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 851C3F804D1; Tue, 24 May 2022 10:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D63F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 10:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D63F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="XDO/GA5K"
Received: from [192.168.0.109] (unknown [123.112.66.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id E26D5417A5; 
 Tue, 24 May 2022 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653381527;
 bh=VNR4eScLfrmFR4iOgTNL30qgCPsrORbgtxEB2ypnmxI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=XDO/GA5KlEWQalItcedHn9I9veQh/Pu8ny5oIKm3CKrKZeSnRAQBLo4x+qEloelJu
 rmg2mPrxtVxyFGIovTsC0p7ixD8E7LxvQApXFiNsWOOhm26q4EIZm2Qc3ldQElGYDI
 wokiol/dSN82uCnmDOPUFEzkBR0q3FGeWBLO1OpPNND2x1+W6D8P7cqC+/ce4TO5++
 pmv2+h8W0R5hkK+TLMZSU5fzfDad++NFwB60Yp0GEliEqDWigKHBW0psKJDpo98VMD
 81u1vCfgpGKHIXOMj+3HiILeFG7SeylgAltNI9Cw6Em4mXum9iT36+jhApWiUVQQew
 Yn0CLkjwI0pcA==
Message-ID: <d756972a-d010-7e9c-9dcf-f26ae6edc16c@canonical.com>
Date: Tue, 24 May 2022 16:38:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: nau8822: choose the best master clock prescalar
Content-Language: en-US
To: David Lin <ctlin0.linux@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220524033309.30289-1-hui.wang@canonical.com>
 <9e1eb15c-ca3a-dc04-1f8d-4ea71e32cce8@gmail.com>
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <9e1eb15c-ca3a-dc04-1f8d-4ea71e32cce8@gmail.com>
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


On 5/24/22 16:07, David Lin wrote:
> On 2022/5/24 上午 11:33, Hui Wang wrote:
>> We have an imx6sx EVB with the codec nau8822, when playing the audio
>> with 48k sample rate, the audio sounds distorted and obviously faster
>>
<snip>
>> -            div = i;
>>           }
>>           dev_dbg(component->dev, "master clock prescaler %x for fs 
>> %d\n",
>>               div, rate);
>
> Regarding to your environment with input MCLK is 24 MHz, I think you 
> should enable PLL for the internal process of codec.
>
> So you should do the following calls/operations:
>
Thanks for your suggestion. In our case, we use the simple-card as the 
machine driver, the simple-card hard-codes the 2nd parameter of 
snd_soc_dai_set_sysclk() to 0, and we don't plan to write a new machine 
driver since sound quality is pretty good if setting to 46875Hz.

So according to your experience, does the new algorithm bring any side 
effect or break existing platforms? If so, we have to write a new 
machine driver (that is a big effort).

Thanks,

Hui.

> //PLL
>     ret = snd_soc_dai_set_sysclk(codec_dai, NAU8822_CLK_PLL,
>                       24000000, SND_SOC_CLOCK_IN);
>     if (ret < 0 )
>         dev_err(card->dev, "failed to set codec sysclk: %d\n", ret);
>
>     ret = snd_soc_dai_set_pll(codec_dai, 0, 0,
>                   24000000, 256 * params_rate(params));
>     if (ret < 0 )
>
>         dev_err(card->dev, "failed to set codec pll: %d\n", ret);
>
> David
>
