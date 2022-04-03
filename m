Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A994F088B
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 11:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 006BD1775;
	Sun,  3 Apr 2022 11:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 006BD1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648977256;
	bh=D2itVu7GIoHUR47Nm0OsBTITwtQii9HP5+pPJMzvq4c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lFN7sDMI8aWDBYy1tPH115yXnINyiClhnahEL8qLNfo3YVYtVpbBoGxQIH02YixWB
	 Z3v8XnJUXoksWZRBzHKuc1bH1cqv/RbzZzDLLS1D0+feZw9wf+hc+QR0PyQYKXkll8
	 JqDUkwZbvGwyoZD8cfdsWcVnTD7KtqTmEndzb9Rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C4D7F80100;
	Sun,  3 Apr 2022 11:13:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BCEEF80248; Sun,  3 Apr 2022 11:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6922CF8012A
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 11:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6922CF8012A
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id awI7nFC7WRGzQawI7nw1jb; Sun, 03 Apr 2022 11:13:01 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 03 Apr 2022 11:13:01 +0200
X-ME-IP: 90.126.236.122
Message-ID: <6dd4ac07-397c-1e02-2ac5-2a8f243bfefe@wanadoo.fr>
Date: Sun, 3 Apr 2022 11:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: msm8916-wcd-digital: Fix missing
 clk_disable_unprepare() in msm8916_wcd_digital_probe
Content-Language: en-US
To: =?UTF-8?B?5p6X5aaZ5YCp?= <linmq006@gmail.com>
References: <20220307084523.28687-1-linmq006@gmail.com>
 <93751991-30ce-93a0-0f33-105f99b8dfe3@wanadoo.fr>
 <CAH-r-ZGw+toVfasD-45p4Z4Rryn2advNOZbgJd0g4SGw_Kd6FQ@mail.gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAH-r-ZGw+toVfasD-45p4Z4Rryn2advNOZbgJd0g4SGw_Kd6FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Le 03/04/2022 à 09:15, 林妙倩 a écrit :
> Hi,
> 
> Yes, I agree with you. We should check the error code of
> devm_snd_soc_register_component() and do corresponding
> handling.

You already fixed the first issue, do you mind sending a patch for this 
one as well?

CJ
> 
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> 于2022年4月3日周日 13:51写道：
> 
>> Le 07/03/2022 à 09:45, Miaoqian Lin a écrit :
>>> Fix the missing clk_disable_unprepare() before return
>>> from msm8916_wcd_digital_probe in the error handling case.
>>>
>>> Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
>>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>>> ---
>>>    sound/soc/codecs/msm8916-wcd-digital.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/codecs/msm8916-wcd-digital.c
>> b/sound/soc/codecs/msm8916-wcd-digital.c
>>> index fcc10c8bc625..9ad7fc0baf07 100644
>>> --- a/sound/soc/codecs/msm8916-wcd-digital.c
>>> +++ b/sound/soc/codecs/msm8916-wcd-digital.c
>>> @@ -1201,7 +1201,7 @@ static int msm8916_wcd_digital_probe(struct
>> platform_device *pdev)
>>>        ret = clk_prepare_enable(priv->mclk);
>>>        if (ret < 0) {
>>>                dev_err(dev, "failed to enable mclk %d\n", ret);
>>> -             return ret;
>>> +             goto err_clk;
>>>        }
>>>
>>>        dev_set_drvdata(dev, priv);
>>> @@ -1209,6 +1209,9 @@ static int msm8916_wcd_digital_probe(struct
>> platform_device *pdev)
>>>        return devm_snd_soc_register_component(dev, &msm8916_wcd_digital,
>>>                                      msm8916_wcd_digital_dai,
>>>                                      ARRAY_SIZE(msm8916_wcd_digital_dai));
>>> +err_clk:
>>> +     clk_disable_unprepare(priv->ahbclk);
>>> +     return ret;
>>>    }
>>>
>>>    static int msm8916_wcd_digital_remove(struct platform_device *pdev)
>>
>> Hi,
>> I think that the same should be done for 'priv->mclk' if
>> devm_snd_soc_register_component() returns an error.
>>
>> Can you give it a look?
>>
>> CJ
>>
> 

