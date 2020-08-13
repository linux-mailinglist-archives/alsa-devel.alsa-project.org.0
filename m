Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57D2431B5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 02:26:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E681668;
	Thu, 13 Aug 2020 02:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E681668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597278394;
	bh=cU6RGnoncnYoMCinV1zeDEN84CTD3u0eRzmC+sWV9Yg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F79e5cQZHACFe/GeTcWSDTL591fgJZS75stZPevNaZWQeqiEUWVxfyFFAObRe3Jua
	 V9Txwdq26NqT8mRFI/1gc+NtQGgNx01CXeQaZiHjo+VB4BfrOGzOx6E3gasPhLzLMx
	 JmiEKsofJn0zltoaaOhyqfsXp24k5ZIw7vByhfEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52632F8022D;
	Thu, 13 Aug 2020 02:24:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3712F8022B; Thu, 13 Aug 2020 02:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 SUBJECT_DRUG_GAP_L,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E1A0F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 02:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E1A0F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="janc2rzC"
Received: by mail-lj1-x243.google.com with SMTP id t6so4220988ljk.9
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 17:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gwuRbsafJP8ISlOi3BJD/DTlryrf3+Ufz6ONoYmN8Cg=;
 b=janc2rzCfPrV3szeglM91wrUIIoUk9PShPbTLwHqSIHsKnHYEY4E2zwkaBvWhdNQ1W
 RxJPNvamviy/AodULq33Viu2RLg9nzCPbc48oLVaj5mq3RBJMkbrznWBEL2xnpQNSpk1
 wWn+Yi7GYI5aFH9O47e+F9q6EyQuod1aasrvcAmoiXKrte0ezU3iJk6kr6lO9QZPlYlt
 dYAQR41fk/ey32YPQHO3kwWN98bx0MglrPwugRZXQtof5HcKmA+icIJJY09aIQvHZk+k
 RAPm/WQtE6yqqvdWo0EIXvG627ugM+PF7uz0f4Jh0ZnEV45TCygVHJJRfbBOcfTvKxDH
 VWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gwuRbsafJP8ISlOi3BJD/DTlryrf3+Ufz6ONoYmN8Cg=;
 b=jR4Ox4f+ukBh3+UK5ciAoEibz1u2ls9YtyiP4mhi+0uoR9dPpNSpksAMEKcLLmRZi9
 v8QQY8NhxQ/85iusubjfh7ZFOi2BHClwGP3WFjY84acoZzlDG91+npny5do+6xKO0/rl
 6UMYK8D9/uTbicfa1lrBKuk5zj1/cFvTep4qboYIPkFpHA/jDi7vwB6SFuT2ilZz/HmS
 1/w0yPHVnrhyVQPd+VgTZAPMHfzuvWzlyGVkBgnNUGodRpl/gX3HRqb8g2dHcs1x+I82
 NK/yeDX5rvZgnS3Mzx16UFY6j+OanN4m0C3Q/xXypQv7EeDQximjvUte39MRKlbbuf1s
 iRVQ==
X-Gm-Message-State: AOAM530ImvpkPcy/+DF+6uoUtLfskkRIo7XTK4Jl7vsGIyo/mm3XX7Ak
 zDg+V5hYsrzduRNjl2WrM/fey6js
X-Google-Smtp-Source: ABdhPJxn2xxQ3JGiSMdj5N3uj42Xe67P8W0+f37cwmSXORwfJX2X+7icfK82tq8Cxi9aiB6OAp4wdg==
X-Received: by 2002:a05:651c:505:: with SMTP id
 o5mr769785ljp.306.1597278274140; 
 Wed, 12 Aug 2020 17:24:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id h6sm810501lfc.84.2020.08.12.17.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 17:24:33 -0700 (PDT)
Subject: Re: Request to pick up couple NVIDIA Tegra ASoC patches into 5.7
 kernel
To: Sasha Levin <sashal@kernel.org>
References: <2db6e1ef-5cea-d479-8a7a-8f336313cb1d@gmail.com>
 <20200813000800.GM2975990@sasha-vm>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4991edb7-011d-2dc4-e684-797b6504a122@gmail.com>
Date: Thu, 13 Aug 2020 03:24:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813000800.GM2975990@sasha-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Erik Faye-Lund <kusmabite@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Stable <stable@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
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

13.08.2020 03:08, Sasha Levin пишет:
> On Wed, Aug 12, 2020 at 10:14:34PM +0300, Dmitry Osipenko wrote:
>> Hello, stable-kernel maintainers!
>>
>> Could you please cherry-pick these commits into the v5.7.x kernel?
>>
>> commit 0de6db30ef79b391cedd749801a49c485d2daf4b
>> Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>> Date:   Mon Jan 13 23:24:17 2020 -0800
>>
>>    ASoC: tegra: Use device managed resource APIs to get the clock
>>
>> commit 1e4e0bf136aa4b4aa59c1e6af19844bd6d807794
>> Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>> Date:   Mon Jan 13 23:24:23 2020 -0800
>>
>>    ASoC: tegra: Add audio mclk parent configuration
>>
>> commit ff5d18cb04f4ecccbcf05b7f83ab6df2a0d95c16
>> Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>> Date:   Mon Jan 13 23:24:24 2020 -0800
>>
>>    ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()
>>
>> It will fix a huge warnings splat during of kernel boot on NVIDIA Tegra
>> SoCs. For some reason these patches haven't made into 5.7 when it was
>> released and several people complained about the warnings. Thanks in
>> advance!
> 
> They never made it in because they don't have a stable tag, a fixes tag,
> or do they sound like they fix a problem :)
> 
> Do you have a reference to the issue at hand here?

https://lore.kernel.org/lkml/64b70163-05be-e4f9-2dbc-5088ac2a3af9@nvidia.com/

> Either way, 5.7 is alive for only about 1 or 2 weeks, is anyone still
> stuck on 5.7?
> 

I didn't know that 5.7 is about to die, let's not bother with it then.
Thanks!
