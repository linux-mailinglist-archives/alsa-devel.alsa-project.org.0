Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB12A2758
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 10:49:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD5E716F1;
	Mon,  2 Nov 2020 10:48:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD5E716F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604310540;
	bh=N4FfuvrlPoXDvUP8x6Iu76ARY+ZxkzzZWgbUYfISUF8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOnogtEWlp1ulrt156jVguXYiS1eJQ5SkRVxzKQFKIiPmjWBXYJsGZceW0UiqXB2q
	 DGKfr9ytgqKUFtF73xRlMXyh4o/S9+iQYRHA3nKFuY7/DY2ceo4+Wu5pB0G29gBTZx
	 ep0a9rz+odYSKxUMBiLwon6Uh8Q8yKJXxCxrqX5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D580F80234;
	Mon,  2 Nov 2020 10:47:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDE5BF80232; Mon,  2 Nov 2020 10:47:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F758F8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 10:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F758F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JmzXZ+2u"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A29lE5b123902;
 Mon, 2 Nov 2020 03:47:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604310434;
 bh=TvYdeezknBZuneD+xrgn92DxaY/94qd+5Q20g4Mz+58=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JmzXZ+2uKN3SbEDrHiRYWYX7N7QHKUh2np15eR7nlrSHU2Iemloc42o7r3m5uSQFq
 n3eGWmmPQsdBvET98oZZHx3J0Y8FakIExTMrTdHXngyh0wPhin01+reV6lVTjl3TWU
 1yY0VmGjzCEoblV5odJvk0425XGpO/4hDi9EmYsQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A29lEnG007234
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Nov 2020 03:47:14 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 2 Nov
 2020 03:47:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 2 Nov 2020 03:47:14 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A29lCbX084591;
 Mon, 2 Nov 2020 03:47:12 -0600
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYyXSBBU29DOiB0aTogZGF2aW5jaS1t?=
 =?UTF-8?Q?casp=3a_fix_error_handling_in_davinci=5fmcasp=5fprobe?=
To: zhangqilong <zhangqilong3@huawei.com>, "perex@perex.cz" <perex@perex.cz>, 
 "tiwai@suse.com" <tiwai@suse.com>
References: <20201102085436.14450-1-zhangqilong3@huawei.com>
 <182d48d4-2866-8e7c-dc28-7f84967260e2@ti.com>
 <e8e537db-cda7-fe9e-5d34-77da8d992a6c@ti.com>
 <7c5bced4ad3f4e348241fbbe28cf7ef5@huawei.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <ab32711e-436a-14b6-8afa-19cfd2da83d6@ti.com>
Date: Mon, 2 Nov 2020 11:47:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7c5bced4ad3f4e348241fbbe28cf7ef5@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
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



On 02/11/2020 11.25, zhangqilong wrote:
> Hi
> 
>>
>> Hi,
>>
>> On 02/11/2020 11.07, Peter Ujfalusi wrote:
>>>
>>>
>>> On 02/11/2020 10.54, Zhang Qilong wrote:
>>>> Forgetting to call pm_runtime_disable if davinci_mcasp_get_dt_params
>>>> failed in function davinci_mcasp_probe, and we should go to error
>>>> handling branch.
>>>
>>> Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>
>> Actually...
>>
>>>
>>>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
>>>> ---
>>>> Changelog:
>>>> V2
>>>> - changed the subject and fixed the description.
>>>> ---
>>>>  sound/soc/ti/davinci-mcasp.c | 6 ++++--
>>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/sound/soc/ti/davinci-mcasp.c
>>>> b/sound/soc/ti/davinci-mcasp.c index 4b46dd827f3f..ec90c23c9e20
>>>> 100644
>>>> --- a/sound/soc/ti/davinci-mcasp.c
>>>> +++ b/sound/soc/ti/davinci-mcasp.c
>>>> @@ -2362,8 +2362,10 @@ static int davinci_mcasp_probe(struct
>> platform_device *pdev)
>>>>  		goto err;
>>>>
>>>>  	ret = davinci_mcasp_get_dt_params(mcasp);
>>>> -	if (ret)
>>>> -		return -EINVAL;
>>>> +	if (ret) {
>>>> +		ret = -EINVAL;
>>>> +		goto err;
>>
>> do not override the error code from davinci_mcasp_get_dt_params(), jut jump
>> to err.
>>
> 
> I have ever thought this point. I can't make sure it's necessary, davinci_mcasp_get_dt_params always return 0 now.
> If it's necessary, I can submit a new patch to fix it. Look forward to your reply sincerely.

right.
davinci_mcasp_get_dt_params() should be void and we don't need the check
in probe for return value.

auxclk-fs-ratio is optional property.

> 
> Thanks, best wish!
> Zhang Qilong
> 
>>>> +	}
>>>>
>>>>  	ret = devm_snd_soc_register_component(&pdev->dev,
>>>>  					&davinci_mcasp_component,
>>>>
>>>
>>> - Péter
>>>
>>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>>
>>
>> - Péter
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
