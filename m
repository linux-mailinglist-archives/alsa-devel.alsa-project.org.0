Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A8E1A76EE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 11:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AF016A0;
	Tue, 14 Apr 2020 11:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AF016A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586855130;
	bh=3aWXmT0mjPhKfUPwrWYdpnH9OR6i6eEI+0sdN2hAnZc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIZGAsAK8xKJOk8bCWktcjeDmDOa+yUdvKKAEUaBRSR1qagAvcFDuOJK9qhhyqRF5
	 maF01Ace+peGWBXcv+lWSuOocf3JjlNlWqPlRqvbY0ntebdu5a+9wHlqp0OcaZN0QG
	 e2/2Q9veEKOz4p3DKi5IDM6xBj/BqRsLG/ydRu+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFAE9F800F5;
	Tue, 14 Apr 2020 11:03:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8EA4F8013D; Tue, 14 Apr 2020 11:03:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E951F80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 11:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E951F80115
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 63EA92964518253B8D39;
 Tue, 14 Apr 2020 17:03:37 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.212) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 14 Apr 2020 17:03:22 +0800
Subject: Re: [RFC v2] ALSA: control: fix a error handling exist in
 snd_ctl_elem_add
To: Takashi Iwai <tiwai@suse.de>
References: <20200414065109.6923-1-yangerkun@huawei.com>
 <s5h4ktmlfpx.wl-tiwai@suse.de>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <59873ec6-b18c-a241-40c0-da75d089b128@huawei.com>
Date: Tue, 14 Apr 2020 17:03:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <s5h4ktmlfpx.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.212]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
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



On 2020/4/14 14:54, Takashi Iwai wrote:
> On Tue, 14 Apr 2020 08:51:09 +0200,
> yangerkun wrote:
>>
>> CVE-2020-11725 report that 'count = info->owner' may result a
>> SIZE_OVERFLOW. 'info->owner' represent a pid, and actually, we should
>> use info->count.
>>
>> Signed-off-by: yangerkun <yangerkun@huawei.com>
> 
> The CVE report is simply wrong.  info->owner is used intentionally for
> this specific API to add a user-space control.  For the normal kernel
> kctls, the field is used indeed for storing the pid, but but the
> user-space kctl addition API usage is an exception.
> 
> You can see the another use of info->count of field in the very same
> function at a later point and find it has a different meaning.
> 
> The CVE should be disputed.

Got it! Thanks for your reply.

> 
> 
> thanks,
> 
> Takashi
> 
>> ---
>>   sound/core/control.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> v1->v2: reword the patch head
>>
>> diff --git a/sound/core/control.c b/sound/core/control.c
>> index aa0c0cf182af..c77ca7f39637 100644
>> --- a/sound/core/control.c
>> +++ b/sound/core/control.c
>> @@ -1431,7 +1431,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
>>   		return -ENOMEM;
>>   
>>   	/* Check the number of elements for this userspace control. */
>> -	count = info->owner;
>> +	count = info->count;
>>   	if (count == 0)
>>   		count = 1;
>>   
>> -- 
>> 2.21.1
>>
> 
> .
> 

