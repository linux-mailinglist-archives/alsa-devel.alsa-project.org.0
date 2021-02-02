Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340730CC29
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 20:47:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD5F1735;
	Tue,  2 Feb 2021 20:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD5F1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612295260;
	bh=4Mkdjv4G7JeJ/iD581jGhKsEVRSe+mirdACqHR36tUc=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AS1tJtNssHTBbMfg5452Jy1CUllLo1rkLw9KKaP1Yx+oupAVY7E9AYwkItxRbvmT2
	 3iXhevDdvwEU27Cm94wQpauSiHS5QkkUsa3VWup0+9+A7Wn3mr3le5uC07iNaqZWxL
	 Po9O6nAFMj2vTwFSO585tLCahgmEUJ+IiBiB+FjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 259F8F80109;
	Tue,  2 Feb 2021 20:46:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E010CF80171; Tue,  2 Feb 2021 20:46:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DA83F80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 20:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA83F80109
IronPort-SDR: 0ulElppIr2ZrIOQZqxDOa7khMW59YFyS5zEilR5fypDcoXIBLrb4aXuzMDwDYMUHBSiugY3xj2
 xUY45bSsUd9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="199853851"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="199853851"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 11:45:53 -0800
IronPort-SDR: h64eDiPIfkkv7OpD8OQKQZpYmVajOC/dG56z7nCYbFdh1SCCd1nA7Es8LgOGHqeKXpFzHjSqUW
 y3hAHWLu3JVQ==
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="372087794"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.24.26])
 ([10.213.24.26])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 11:45:50 -0800
Subject: Re: [PATCH] ASoC: Intel: catpt: remove unneeded semicolon
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>, perex@perex.cz
References: <1612166481-121376-1-git-send-email-yang.lee@linux.alibaba.com>
 <fb3dd21b-dde6-d9f7-e497-a443f60e7493@intel.com>
Message-ID: <adc3a883-a268-c3a9-b53b-c2ac96ca03db@intel.com>
Date: Tue, 2 Feb 2021 20:45:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <fb3dd21b-dde6-d9f7-e497-a443f60e7493@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 yang.jie@linux.intel.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On 2021-02-01 10:03 PM, Cezary Rojewski wrote:
> On 2021-02-01 9:01 AM, Yang Li wrote:
>> Eliminate the following coccicheck warning:
>> ./sound/soc/intel/catpt/pcm.c:355:2-3: Unneeded semicolon
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>> ---
>>   sound/soc/intel/catpt/pcm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
>> index e5d54bb..88a0879 100644
>> --- a/sound/soc/intel/catpt/pcm.c
>> +++ b/sound/soc/intel/catpt/pcm.c
>> @@ -352,7 +352,7 @@ static int catpt_dai_apply_usettings(struct 
>> snd_soc_dai *dai,
>>           break;
>>       default:
>>           return 0;
>> -    };
>> +    }
>>       list_for_each_entry(pos, &component->card->snd_card->controls, 
>> list) {
>>           if (pos->private_data == component &&
>>
> 
> Hello Yang,
> 
> Your patch is much appreciated.
> 
> I noticed that more mistakes such as this have been made in the code. 
> Could you please also update switch-statements in other parts of catpt 
> (from what I've found, pcm.c has 2 occurrences while loader.c has 1)?
> 

I see now. Patch [1] provided the fixes already but optimization of mine 
[2] done later, overridden part of it. In that case, there's nothing 
else to be done.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

Regards,
Czarek


[1]: https://lore.kernel.org/r/20201101171943.2305030-1-trix@redhat.com
[2]: 
https://lore.kernel.org/r/20201116133332.8530-4-cezary.rojewski@intel.com
