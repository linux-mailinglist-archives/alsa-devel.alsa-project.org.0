Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3777F41E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 12:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E952583B;
	Thu, 17 Aug 2023 12:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E952583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692267122;
	bh=ovuTD4KI74YKzl71dlerPvjRqfcymJEin6V6o6wXpfM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BC7CxikpGFXAP4kDaUFCL61leOwVQgB6ra8GrMmKH11DTxL/yMrAqZYOdTWYmBsms
	 OVTIEy0gTgHUZxRB8Lk0OjSsRsmJloFNcNQAW7aiSJ9Dn0LOBDjwPrnzZT/ocJvAqe
	 RfMMUeMXQ7vtwO4I3oXRy2RmO7Ru4A9FcrUC/DDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC7AAF8016D; Thu, 17 Aug 2023 12:10:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF72F80549;
	Thu, 17 Aug 2023 12:10:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 219DBF8016D; Thu, 17 Aug 2023 09:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-8.2 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C78EBF800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 09:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C78EBF800D1
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRG9G4zYyztSNl;
	Thu, 17 Aug 2023 15:00:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 17 Aug 2023 15:03:55 +0800
Message-ID: <021dc4f3-f544-237d-489f-2296c574ec62@huawei.com>
Date: Thu, 17 Aug 2023 15:03:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] ALSA: pcmtest: Drop unnecessary error check for
 debugfs_create_dir
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230817063922.282746-1-ruanjinjie@huawei.com>
 <87bkf6w4go.wl-tiwai@suse.de>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <87bkf6w4go.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-MailFrom: ruanjinjie@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 34OLYKCZ77RDCTR7DGSOL2J4Z4TUAYCI
X-Message-ID-Hash: 34OLYKCZ77RDCTR7DGSOL2J4Z4TUAYCI
X-Mailman-Approved-At: Thu, 17 Aug 2023 10:10:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34OLYKCZ77RDCTR7DGSOL2J4Z4TUAYCI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/8/17 14:47, Takashi Iwai wrote:
> On Thu, 17 Aug 2023 08:39:22 +0200,
> Ruan Jinjie wrote:
>>
>> This patch removes the error checking for debugfs_create_dir in
>> pcmtest.c. This is because the DebugFS kernel API is developed
>> in a way that the caller can safely ignore the errors that
>> occur during the creation of DebugFS nodes. The debugfs APIs have
>> a IS_ERR() judge in start_creating() which can handle it
>> gracefully. So these checks are unnecessary.
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> 
> I believe debugfs is mandatory in this case (it's a test module that
> manipulates / gets notification via debugfs), hence it makes sense to
> check the error.

So the error check is necessary!

> 
> Maybe we should add a dependency on CONFIG_DEBUG_FS in Kconfig?

I think it's ok!

> 
> 
> thanks,
> 
> Takashi
> 
>> ---
>>  sound/drivers/pcmtest.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
>> index 7f170429eb8f..9360b3bb771e 100644
>> --- a/sound/drivers/pcmtest.c
>> +++ b/sound/drivers/pcmtest.c
>> @@ -669,8 +669,6 @@ static int init_debug_files(int buf_count)
>>  	char len_file_name[32];
>>  
>>  	driver_debug_dir = debugfs_create_dir("pcmtest", NULL);
>> -	if (IS_ERR(driver_debug_dir))
>> -		return PTR_ERR(driver_debug_dir);
>>  	debugfs_create_u8("pc_test", 0444, driver_debug_dir, &playback_capture_test);
>>  	debugfs_create_u8("ioctl_test", 0444, driver_debug_dir, &ioctl_reset_test);
>>  
>> -- 
>> 2.34.1
>>
