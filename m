Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54A443BD8
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 04:29:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A71168E;
	Wed,  3 Nov 2021 04:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A71168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635910194;
	bh=SreUSEHtYS8JaT14ItVvyzWO0VoedA81b9DJ4N93sn8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GJIoimKMZfv5dvq86j9vtV/rF1lucYdeNqLKydICQDE1BALp1mKAIfddrAgS6XJok
	 hfxjgG83/CxMj1YmH9OFXhI4hB3MNVnK/jbXY8WPukACoBUMDp9EEQHuTSiXtQmlND
	 Ii+kw9S43Y62n/gmsp+W6TTrlwmuPIVafP8BOUNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B2B5F800D2;
	Wed,  3 Nov 2021 04:28:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4A70F8026A; Wed,  3 Nov 2021 04:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D9B4F80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 04:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D9B4F80224
Received: from dggeme762-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HkXGq4Q85z1DHxq;
 Wed,  3 Nov 2021 11:25:55 +0800 (CST)
Received: from [10.174.179.252] (10.174.179.252) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Wed, 3 Nov 2021 11:27:59 +0800
Subject: Re: [PATCH -next] ALSA: timer: Fix use-after-free problem
To: Takashi Iwai <tiwai@suse.de>
References: <20211102134107.35126-1-wangwensheng4@huawei.com>
 <s5h5ytaps0n.wl-tiwai@suse.de>
From: "wangwensheng (C)" <wangwensheng4@huawei.com>
Message-ID: <3b02dd76-d952-e38e-bc0c-c8a121919720@huawei.com>
Date: Wed, 3 Nov 2021 11:27:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <s5h5ytaps0n.wl-tiwai@suse.de>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.252]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 rui.xiang@huawei.com, broonie@kernel.org, joe@perches.com
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



ÔÚ 2021/11/2 22:10, Takashi Iwai Ð´µÀ:
> On Tue, 02 Nov 2021 14:41:07 +0100,
> Wang Wensheng wrote:
>>
>> When the timer instance was add into ack_list but was not currently in
>> process, the user could stop it via snd_timer_stop1() without delete it
>> from the ack_list. Then the user could free the timer instance and when
>> it was actually processed UAF occurred.
>>
>> This issue could be reproduced via testcase snd_timer01 in ltp - running
>> several instances of that testcase at the same time.
>>
>> What I actually met was that the ack_list of the timer broken and the
>> kernel went into deadloop with irqoff. That could be detected by
>> hardlockup detector on board or when we run it on qemu, we could use gdb
>> to dump the ack_list when the console has no response.
>>
>> To fix this issue, we introduce a new flag SNDRV_TIMER_IFLG_ACKING to
>> indicate the state where the timer instance is in ack_list but not
>> currently processed and check against the new flag in snd_timer_stop1()
>> and delete it from ack_list if the flag is set.
>>
>> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
> 
> Thanks for the patch.  Just through a quick glance, I wonder whether
> it'd be easier to do list_del_init(&timeri->ack_list) unconditionally
> before the check of timeri->flags in snd_timer1_stop().  Ditto for
> active_list.  So something like:
> 

Thanks for your suggestions. It looks much more efficient and easier and 
is also effective. I will take this as a second version.

> --- a/sound/core/timer.c
> +++ b/sound/core/timer.c
> @@ -624,13 +624,13 @@ static int snd_timer_stop1(struct snd_timer_instance *timeri, bool stop)
>   	if (!timer)
>   		return -EINVAL;
>   	spin_lock_irqsave(&timer->lock, flags);
> +	list_del_init(&timeri->ack_list);
> +	list_del_init(&timeri->active_list);
>   	if (!(timeri->flags & (SNDRV_TIMER_IFLG_RUNNING |
>   			       SNDRV_TIMER_IFLG_START))) {
>   		result = -EBUSY;
>   		goto unlock;
>   	}
> -	list_del_init(&timeri->ack_list);
> -	list_del_init(&timeri->active_list);
>   	if (timer->card && timer->card->shutdown)
>   		goto unlock;
>   	if (stop) {
> 
> 
> Takashi
