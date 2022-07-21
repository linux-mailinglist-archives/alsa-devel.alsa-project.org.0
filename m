Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185D57C8FD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 12:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97DD61650;
	Thu, 21 Jul 2022 12:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97DD61650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658399501;
	bh=3iGSBTvZJCEljsx9RH0JABfdZ33N1xAJTdn2U9LK1d4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tqbP/qa9OmIPyBdJrhFhXP0eEKyDpKaXLBvk8NpnyejbQrK/YvyJpgi6RK8kJacxP
	 xruP/yOtHnhXnH/f5GG79Po++rsAQE/6WZPuBFlaaLFSiAZQVrqCWSCyD9zjoez8sW
	 TrVsP3RqOe9kj1sZaXsPlXTZSGUpZYdRJSDOdKlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17EA1F80166;
	Thu, 21 Jul 2022 12:30:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99946F8016D; Thu, 21 Jul 2022 12:30:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A25D9F80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 12:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25D9F80166
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id ETRwooD4R0UP7ETRwooLQW; Thu, 21 Jul 2022 12:30:34 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 21 Jul 2022 12:30:34 +0200
X-ME-IP: 90.11.190.129
Message-ID: <a29ea047-4935-4893-108b-f29f46971272@wanadoo.fr>
Date: Thu, 21 Jul 2022 12:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <0fca3271649736053eb9649d87e1ca01b056be40.1658394124.git.christophe.jaillet@wanadoo.fr>
 <20220721100042.GL2338@kadam>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220721100042.GL2338@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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

Le 21/07/2022 à 12:00, Dan Carpenter a écrit :
> On Thu, Jul 21, 2022 at 11:02:22AM +0200, Christophe JAILLET wrote:
>> find_first_zero_bit() returns MAX_COPPS_PER_PORT at max here.
>> So 'idx' should be tested with ">=" or the test can't match.
>>
>> Fixes: 7b20b2be51e1 ("ASoC: qdsp6: q6adm: Add q6adm driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   sound/soc/qcom/qdsp6/q6adm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
>> index 01f383888b62..1530e98df165 100644
>> --- a/sound/soc/qcom/qdsp6/q6adm.c
>> +++ b/sound/soc/qcom/qdsp6/q6adm.c
>> @@ -217,7 +217,7 @@ static struct q6copp *q6adm_alloc_copp(struct q6adm *adm, int port_idx)
>>   	idx = find_first_zero_bit(&adm->copp_bitmap[port_idx],
>>   				  MAX_COPPS_PER_PORT);
>>   
>> -	if (idx > MAX_COPPS_PER_PORT)
>> +	if (idx >= MAX_COPPS_PER_PORT)
>>   		return ERR_PTR(-EBUSY);
> 
> Harshit asked me to write a Smatch check to prevent this bug in the
> future.  I got his email before I got your patch.  :P  Attached.

Well, well, well...
Easy to say afterwards. You got 58 mins to write it. :).

> 
> sound/soc/qcom/qdsp6/q6adm.c:220 q6adm_alloc_copp() warn: impossible find_next_bit condition
> 
> I'll probably try to make this check more generic, but even the simple
> find_first_zero_bit() version will probably find bugs in the future and
> it was pretty simple to write.

You could add find_last_bit(), find_next_zero_bit_le() and 
find_next_bit_le().

> 
> regards,
> dan carpenter
> 
> 

A reduced version of mine was:

@@
expression e1, e2;
statement S;
@@
(
*   e1 = find_first_bit(...);
|
*   e1 = find_last_bit(...);
|
	[... snip ...]
)
     ...
     if (e1 > e2)
         S


(and it takes only a few seconds to scan the whole kernel :) )
