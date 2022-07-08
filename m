Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7B56B429
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 10:12:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CAC51616;
	Fri,  8 Jul 2022 10:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CAC51616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657267975;
	bh=SXWecdeWGbJ1bKbwcwhyIdl8dOiB3uFOp1b7sLQONpo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rkLtYzVKUyKhFTO3M1cZautuX3GqnIn7GmHksx3Av2oJsQXow9Bnj6wAW6gLV4o1L
	 flgyWV8YC204wKKf+Ezp8op5Fd33Lskr8roWghsMEpyGjXIpy9TiJbkO5P3OHShfJT
	 uswrlFBKQ3teWQ8oCCnKCjTcFAKOny2RBpCHaRos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 837A8F800E9;
	Fri,  8 Jul 2022 10:11:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E203AF80167; Fri,  8 Jul 2022 10:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ED29F800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 10:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ED29F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a8PcvC8T"
Received: by mail-il1-x129.google.com with SMTP id h16so4485694ila.2
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D0Qf6XYpQVz6j4kI9S9/dfIfwmKCeXho7yxm3tWLHDw=;
 b=a8PcvC8T4pJniQ7yqIayMgWH+3gEkHFNYRNhxRMkOr+jhG/UVyB81CyvGH1U4WYubR
 kpQ6Xx8kAmsRhSqkwvV2Wmt1lbaLqIT2v8NsFZiAJfZYikttPD39vSH//rSSnRJNKWvP
 Fd4GpgmjsxOTqwJVm5oWb5g1hbTgrTWJmgv1ydYr/5ZIGUfX/Ra4U9VsVHtVb3hTNdC0
 Ba3uPYLrjTDGkbr9WrQnt3A/kHsQWVzo7qPGW7Xl3yeTNshhdwpBPg/bkWBk8iaMDxys
 n64woJm5X85Tw/NZHT+GJG3SJJ0xSGbjYzuTIWnKfkKwxKgVg1VaWrTs9U4crZuba7d/
 LIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D0Qf6XYpQVz6j4kI9S9/dfIfwmKCeXho7yxm3tWLHDw=;
 b=hbCT0UoHbklZnW0jFKh032/iT3sHeHrS/uYGMcSshGXIwTqjLkGTvNUiK6nKeIT3Dz
 X9prvuYIGYmBCrVoPruv18ef8OZda0NnONLXf3/zeeOjq5KW6/z3Ucci+mBj3NOjzm3i
 qwBCBc9eKgfX/LdsE9OYXi1jIKOnMYZKxnfneG3Ouues0Q0/YwEdM6uPNTq2hijeB3xp
 vaqjDUteRqnafTOjqJHueSpmR1oB8rJsk61mJce0ngwvvTdWApBdR/L2ZJbya6/Z3cvb
 HXGOxA21kRmeTkrMn7AtJ9REPWbnP1sApKdUp1ohAU/Ug+Y4pTwF+A3TF2fPRVqMOZ6j
 /9Eg==
X-Gm-Message-State: AJIora9sTjeai72w6Tq2WvK7116qAEcfuH5tpIcFoX1gK7atl/EznI3l
 /oynpqnHTGCxKV92eqDX/qE=
X-Google-Smtp-Source: AGRyM1v57jK2+8qNDptU7lzeTTrC2OcvyKTWnuxBMkLgal9tNGKAfuHo96gs8C1loeyjFe61SHiZww==
X-Received: by 2002:a05:6e02:1848:b0:2da:af35:e7c3 with SMTP id
 b8-20020a056e02184800b002daaf35e7c3mr1352620ilv.265.1657267904342; 
 Fri, 08 Jul 2022 01:11:44 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 z62-20020a0293c4000000b0033f258426c0sm960209jah.108.2022.07.08.01.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 01:11:43 -0700 (PDT)
Message-ID: <624e365e-0f00-9640-74a7-c16e7c7d3469@gmail.com>
Date: Fri, 8 Jul 2022 10:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zhongjun Tan <hbut_tan@163.com>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.c, tiwai@suse.com, jiaxin.yu@mediatek.com,
 tanzhongjun@coolpad.com, colin.king@intel.com
References: <20220708024651.42999-1-hbut_tan@163.com>
 <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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



On 08/07/2022 10:01, AngeloGioacchino Del Regno wrote:
> Il 08/07/22 04:46, Zhongjun Tan ha scritto:
>> From: Zhongjun Tan <tanzhongjun@coolpad.com>
>>
>> Remove condition with no effect
>>
>> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
>> ---
>>   sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c 
>> b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>> index db71b032770d..6be6d4f3b585 100644
>> --- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>> @@ -295,8 +295,6 @@ static int mtk_adda_pad_top_event(struct 
>> snd_soc_dapm_widget *w,
>>       case SND_SOC_DAPM_PRE_PMU:
>>           if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
>>               regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x39);
>> -        else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
>> -            regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
> 
> I think that this needs some clarification from MediaTek: was 0x31 a typo here?
> 

Looks like the write is covered by the else case already, so we don't need the 
else if here. In any case commit message could be improved.

Regards,
Matthias

> Regards,
> Angelo
> 
>>           else
>>               regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
>>           break;
> 
> 
