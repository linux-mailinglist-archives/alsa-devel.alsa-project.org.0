Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E31A16C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 18:26:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CAE21895;
	Fri, 10 May 2019 18:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CAE21895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557505573;
	bh=iD4fsKYhEniOzWK42SqxIj623G2824I1pERqG84Gaf0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LqL7JK6BoDJvo4THKcj+iZcqu7svssBOkcsCWeXrfTtJkWUbkC4ra6oUQ2uFkPU9S
	 Zhj7q+P4ieUw5LqG62sVzQiWAy2u6UWoQaM4KeGwW1qS37znLkMQmX5lHrqIy7VEEN
	 i/rufdSi4F6VidLtlc2Pj2Fq/5EYWfgsbDgo1DS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F2DDF8970E;
	Fri, 10 May 2019 18:24:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D25B1F896FD; Fri, 10 May 2019 18:24:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F9BEF89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 18:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9BEF89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 09:24:20 -0700
X-ExtLoop1: 1
Received: from bgtruong-mobl1.amr.corp.intel.com (HELO [10.252.205.232])
 ([10.252.205.232])
 by fmsmga007.fm.intel.com with ESMTP; 10 May 2019 09:24:19 -0700
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, rdunlap@infradead.org
References: <20190510023657.8960-1-yuehaibing@huawei.com>
 <20190510132940.28184-1-yuehaibing@huawei.com>
 <9284cd65-98e3-5f7e-1427-8245dd84edcd@linux.intel.com>
 <34a5afbc-c165-78aa-0269-7362b523195a@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fc8fa6ea-b32c-0866-cc96-1cee2e2baae1@linux.intel.com>
Date: Fri, 10 May 2019 11:24:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <34a5afbc-c165-78aa-0269-7362b523195a@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V2] ASoC: SOF: Fix build error with
 CONFIG_SND_SOC_SOF_NOCODEC=m
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/10/19 8:50 AM, YueHaibing wrote:
> On 2019/5/10 21:36, Pierre-Louis Bossart wrote:
>> On 5/10/19 8:29 AM, YueHaibing wrote:
>>> Fix gcc build error while CONFIG_SND_SOC_SOF_NOCODEC=m
>>>
>>> sound/soc/sof/core.o: In function `snd_sof_device_probe':
>>> core.c:(.text+0x4af): undefined reference to `sof_nocodec_setup'
>>>
>>> Change IS_ENABLED to IS_REACHABLE to fix this.
>>
>> this just hides the issue instead of fixing it.
>> please send the config+sha1 so that we can check.
> 
> Sure,  config sha1 5fdc79b550c1d850eee604aa58bad4d6da9223f0

Indeed there is an issue. will send a patch shortly to alsa-devel.
Thanks for spotting this.

> 
>>
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Suggested-by: Takashi Iwai <tiwai@suse.de>
>>> Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>> V2: use IS_REACHABLE
>>> ---
>>>    sound/soc/sof/core.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
>>> index 32105e0..38e22f4 100644
>>> --- a/sound/soc/sof/core.c
>>> +++ b/sound/soc/sof/core.c
>>> @@ -259,7 +259,7 @@ int snd_sof_create_page_table(struct snd_sof_dev *sdev,
>>>    static int sof_machine_check(struct snd_sof_dev *sdev)
>>>    {
>>>        struct snd_sof_pdata *plat_data = sdev->pdata;
>>> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
>>> +#if IS_REACHABLE(CONFIG_SND_SOC_SOF_NOCODEC)
>>>        struct snd_soc_acpi_mach *machine;
>>>        int ret;
>>>    #endif
>>> @@ -267,7 +267,7 @@ static int sof_machine_check(struct snd_sof_dev *sdev)
>>>        if (plat_data->machine)
>>>            return 0;
>>>    -#if !IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
>>> +#if !IS_REACHABLE(CONFIG_SND_SOC_SOF_NOCODEC)
>>>        dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
>>>        return -ENODEV;
>>>    #else
>>>
>>
>>
>> .
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
