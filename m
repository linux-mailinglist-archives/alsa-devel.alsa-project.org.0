Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E29481CFF77
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 22:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE2A16D3;
	Tue, 12 May 2020 22:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE2A16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589315896;
	bh=V1faE6a7XsnceIUJEv8dfxP/NhxHuwQ4Vd5glygzKBQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcIqvkx3Ha9wORdQvkJKQ/CbPuFC3LcllvGk3/Ye94ZvYto69zVAxuwf7jiERd0R1
	 tk+Qr5ieWkO/xM4EhCAxqngP/uRGy2ZYgZaUMxh4RZcVpnh05LCXMooHrP4e6i+1gD
	 WwDqThZg08bGW3p+6ZHaLjd/XpgnRIFo+LpUW+2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22FA9F80158;
	Tue, 12 May 2020 22:36:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F04AF8014C; Tue, 12 May 2020 22:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6473BF800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 22:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6473BF800E3
IronPort-SDR: PpSEu2hnIN3rQw1LVUGiWCH6vq9TljuTJ1gaEKpMLvsG34VxDHFngeQGtiU+zBnQX5nfIXW9dS
 /3UvpPbIvQiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 13:36:23 -0700
IronPort-SDR: QsEFkt9oSvwRv+5T/+ebygf7pLuAiF/LS0YrrDqttTIcZhzx2uDjdYDkMl9iCVdeyD+E+mKiG9
 yGoaCHUtJFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,385,1583222400"; d="scan'208";a="463681251"
Received: from ahlayhel-mobl1.amr.corp.intel.com (HELO [10.254.65.241])
 ([10.254.65.241])
 by fmsmga005.fm.intel.com with ESMTP; 12 May 2020 13:36:23 -0700
Subject: Re: [PATCH v2 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-10-alexander.deucher@amd.com>
 <3c131eb1-9f5c-fd37-687c-182888774e08@linux.intel.com>
 <CADnq5_NHzg5dVhbx9ZqNDgVZVWfGaUteVtxLRORCXVM6UOP1nQ@mail.gmail.com>
 <565ebd07-e515-c84c-f4c5-7997dbac308b@linux.intel.com>
 <BYAPR12MB2632FF6DE6FBA71764F40E1197BE0@BYAPR12MB2632.namprd12.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <13e8c823-466c-cee3-ed93-071ecece02f5@linux.intel.com>
Date: Tue, 12 May 2020 15:36:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB2632FF6DE6FBA71764F40E1197BE0@BYAPR12MB2632.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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



>>>>> +     pm_runtime_set_autosuspend_delay(&pci->dev,
>> ACP_SUSPEND_DELAY_MS);
>>>>> +     pm_runtime_use_autosuspend(&pci->dev);
>>>>> +     pm_runtime_allow(&pci->dev);
>>>>> +     pm_runtime_mark_last_busy(&pci->dev);
>>>>> +     pm_runtime_put_autosuspend(&pci->dev);
>>>>
>>>> usually there is a pm_runtime_put_noidle() here?
>>>
>>> I'm not sure.
>>>
>>>>
>>>> [...]
>>>>
>>>>>     static void snd_rn_acp_remove(struct pci_dev *pci)
>>>>>     {
>>>>>         struct acp_dev_data *adata;
>>>>> @@ -260,6 +302,9 @@ static void snd_rn_acp_remove(struct pci_dev
>> *pci)
>>>>>         ret = rn_acp_deinit(adata->acp_base);
>>>>>         if (ret)
>>>>>                 dev_err(&pci->dev, "ACP de-init failed\n");
>>>>> +     pm_runtime_put_noidle(&pci->dev);
>>>>> +     pm_runtime_get_sync(&pci->dev);
>>>>> +     pm_runtime_forbid(&pci->dev);
>>>>
>>>> doing a put_noidle() followed by a get_sync() and immediately forbid()
>>>> is very odd at best.
>>>> Isn't the recommendation to call get_noresume() here?
>>>>
>>>
>>> I'm not sure here either.  Is there some definitive documentation on
>>> what exact sequences are supposed to be used in drivers?  A quick
>>> browse through drivers that implement runtime pm seems to show a lot
>>> of variation.  This sequence works.  I'm not sure if it's optimal or
>>> not.
>>
>> We based our sequence on the comments in drivers/pci/pci-driver.c
>>
>> /*
>>    * Unbound PCI devices are always put in D0, regardless of
>>    * runtime PM status.  During probe, the device is set to
>>    * active and the usage count is incremented.  If the driver
>>    * supports runtime PM, it should call pm_runtime_put_noidle(),
>>    * or any other runtime PM helper function decrementing the usage
>>    * count, in its probe routine and pm_runtime_get_noresume() in
>>    * its remove routine.
>>    */
> 
> If I understood correctly, below should be  the correct sequence rite ?
> 
> acp pci driver probe sequence:
> 
> pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
> pm_runtime_use_autosuspend(&pci->dev);
> pm_runtime_put_noidle(&pci->dev);
> pm_runtime_allow(&pci->dev);	

sounds about right. We added an extra pm_runtime_mark_last_busy() to 
make sure the information is updated, but that's probably on the 
paranoid side.
> 	
> acp pci driver remove sequence:
> 
> pm_runtime_get_noresume(&pci->dev);
> pm_runtime_disable(&pci->dev);
> 
> I have still have a doubt.
> Do we need to call pm_runtime_disable() explicitly  in this case ?

we don't call pm_runtime_disable().
