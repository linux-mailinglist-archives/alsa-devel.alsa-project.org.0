Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFDC433DAA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 19:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B146D16A3;
	Tue, 19 Oct 2021 19:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B146D16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634665228;
	bh=NY+RPfHPczEzNtflTtZAafkCxlpZ1W4zBIkdPNrsb98=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cs7APInut2PNXj8CVZoyCJyxra8ahnoOAfNVQyQX5pULmTHAZgW5PLs0oJaI0Z43S
	 WbQbrrk+NmDS4dERrbeTXK6i7X4h343DsuXg2ranRBf1K1GzXwxjlgMaN4Y9zHKI2d
	 O3ThhiP42JvnrX6Hm8oMYBcY7YR/f8qbvEUk34DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 324DEF8019B;
	Tue, 19 Oct 2021 19:39:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21CE7F80240; Tue, 19 Oct 2021 19:39:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F613F80111
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 19:39:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F613F80111
Received: from [192.168.1.18] ([92.140.161.106]) by smtp.orange.fr with ESMTPA
 id ct4qmJ5v2PNphct4qm4mlQ; Tue, 19 Oct 2021 19:39:06 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 19 Oct 2021 19:39:06 +0200
X-ME-IP: 92.140.161.106
Subject: Re: [PATCH] ASoC: codecs: Fix WCD_MBHC_HPH_PA_EN usage
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 yang.lee@linux.alibaba.com
References: <988948f7f266aa00698704687537335b7e6a67b2.1634455711.git.christophe.jaillet@wanadoo.fr>
 <3ff34912-19e6-4d52-e9da-0e78ceb1d2ff@linaro.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <c01b6669-d0f7-aab5-3aca-02f19be8a319@wanadoo.fr>
Date: Tue, 19 Oct 2021 19:39:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3ff34912-19e6-4d52-e9da-0e78ceb1d2ff@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Le 19/10/2021 à 15:47, Srinivas Kandagatla a écrit :
> 
> 
> On 17/10/2021 08:31, Christophe JAILLET wrote:
>> 'hphpa_on' is known to be false, so the if block at the end of the 
>> function
>> is dead code.
> 
> Yes, this is a dead code we should remove it.

Ok, thanks for the clarification.

> 
> This code was part of moisture detection logic which is not enabled in 
> upstream code yet.

If 'yet' is the important word of the sentence, maybe the best is to 
leave the code as-is.
If you prefer it to be removed, I can send a patch if it helps.

> 
> During Moisture detection if the PA is on then we switch it off and do 
> moisture measurements and at the end of the function we restore the 
> state of PA.
> 
>>
>> Turn it into a meaningful code by having 'hphpa_on' be static. Use is 
>> as a
>> flip-flop variable.
> 
> No, It does not.
> 
> Have you even tested this patch in anyway?

No, as said below the ---, the purpose of this patch was not to be 
correct (or tested). It was only to draw attention on odd things.

CJ



> 
>>
>> Fixes: 0e5c9e7ff899 ("ASoC: codecs: wcd: add multi button Headset 
>> detection support")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> The purpose of this patch is not to be correct (!) but to draw attention
>> on several points:
>>     - in 'wcd_mbhc_adc_hs_rem_irq()', the "if (hphpa_on)" path is dead 
>> code
>>       because 'hphpa_on' is known to be false
>>     - What is this magic number '3'?
>>       All 'wcd_mbhc_read_field()' look for 0 or non-0
>>     - a 'mutex_[un]lock()' in an IRQ handler looks spurious to me
>>
>> Instead of this (likely broken) patch, it is likely that something is
>> missing elsewhere. Maybe in 'wcd_mbhc_adc_hs_ins_irq()'.
>> I also guess that 'hphpa_on' should be read for somewhere else.
>> ---
>>   sound/soc/codecs/wcd-mbhc-v2.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c 
>> b/sound/soc/codecs/wcd-mbhc-v2.c
>> index 405128ccb4b0..783d8c35bc1b 100644
>> --- a/sound/soc/codecs/wcd-mbhc-v2.c
>> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
>> @@ -1176,7 +1176,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int 
>> irq, void *data)
>>       struct wcd_mbhc *mbhc = data;
>>       unsigned long timeout;
>>       int adc_threshold, output_mv, retry = 0;
>> -    bool hphpa_on = false;
>> +    static bool hphpa_on = false;
>>       mutex_lock(&mbhc->lock);
>>       timeout = jiffies + 
>> msecs_to_jiffies(WCD_FAKE_REMOVAL_MIN_PERIOD_MS);
>> @@ -1212,6 +1212,9 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int 
>> irq, void *data)
>>       if (hphpa_on) {
>>           hphpa_on = false;
>> +        wcd_mbhc_write_field(mbhc, WCD_MBHC_HPH_PA_EN, 0);
>> +    } else {
>> +        hphpa_on = true;
>>           wcd_mbhc_write_field(mbhc, WCD_MBHC_HPH_PA_EN, 3);
> 
> Just remove this dead code.
> 
> --srini
>>       }
>>   exit:
>>
> 

