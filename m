Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252594F3117
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 14:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C09D317E7;
	Tue,  5 Apr 2022 14:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C09D317E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649162312;
	bh=1ud5r/QhyM8Dq4C18Y70IntlBRVMW6vdgJqBsoUVTWk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CterZyy/3msddkYuVd61PFarEdptdyv/V7MDWxDmBdwqQGXqmllMBXVGxSMgbqhoH
	 qUt0GGEEPTd8E6aysAo+cZKR0QIhMAqOj4ebxVSxhhXu34Ss6Ig6iItYykKNv2k9Iq
	 MtVIr8kgQhVVhZCQp5zYKU2orA727Is2a3WlKu/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFBBF8012C;
	Tue,  5 Apr 2022 14:37:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89D36F8012C; Tue,  5 Apr 2022 14:37:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 54CDAF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 14:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54CDAF8012C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BE56D6E;
 Tue,  5 Apr 2022 05:37:25 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A44BC3F5A1;
 Tue,  5 Apr 2022 05:37:24 -0700 (PDT)
Message-ID: <e1dc64d3-d5b3-07f1-5fd6-c132fc247bb6@arm.com>
Date: Tue, 5 Apr 2022 13:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ALSA: emu10k1: Stop using iommu_present()
Content-Language: en-GB
To: Takashi Iwai <tiwai@suse.de>
References: <5ac9b54285b2189b848da2595408eb3cae8e5e9d.1649160813.git.robin.murphy@arm.com>
 <s5ha6cz7lxt.wl-tiwai@suse.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <s5ha6cz7lxt.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 tiwai@suse.com, alsa-devel@alsa-project.org
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

On 2022-04-05 13:29, Takashi Iwai wrote:
> On Tue, 05 Apr 2022 14:13:33 +0200,
> Robin Murphy wrote:
>>
>> iommu_get_domain_for_dev() is already perfectly happy to return NULL
>> if the given device has no IOMMU. Drop the unnecessary check.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> This will change the code behavior.  The current code does nothing if
> no IOMMU is found, but after your removal of the check, the code
> reaches to emu->iommu_workaround = true incorrectly.

Ah, right you are - I should have looked more closely at the second 
check, where of course "domain &&" wants tweaking to "!domain ||" as 
well. I'll send a v2 in a bit...

Thanks,
Robin.

> 
> 
> thanks,
> 
> Takashi
> 
>> ---
>>   sound/pci/emu10k1/emu10k1_main.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
>> index 86cc1ca025e4..5ffab343b89c 100644
>> --- a/sound/pci/emu10k1/emu10k1_main.c
>> +++ b/sound/pci/emu10k1/emu10k1_main.c
>> @@ -1751,9 +1751,6 @@ static void snd_emu10k1_detect_iommu(struct snd_emu10k1 *emu)
>>   
>>   	emu->iommu_workaround = false;
>>   
>> -	if (!iommu_present(emu->card->dev->bus))
>> -		return;
>> -
>>   	domain = iommu_get_domain_for_dev(emu->card->dev);
>>   	if (domain && domain->type == IOMMU_DOMAIN_IDENTITY)
>>   		return;
>> -- 
>> 2.28.0.dirty
>>
