Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951C6631EBE
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 11:48:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 204B2823;
	Mon, 21 Nov 2022 11:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 204B2823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669027737;
	bh=DiVSxaAZA0YGLZ7G0KBxWdrvglmRmAu7lBkCj+GPiJA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMYww49ChYAqfZLxPgDLVI/xaILETEj7f2+i2U37plEzhe54hrRUK0iKb0NUfyCbA
	 v8lb6pBXWF4/qiC2I5hBgixUa0BbQDhfTJp9EahA2T+3Wmxf6OxUAtJWR3YA+zmv2M
	 8I0S8TbFj7kqadOCKIkuxEnYZeWvAuS0J+h0rH2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2469AF80519;
	Mon, 21 Nov 2022 11:47:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C88BF804D0; Mon, 21 Nov 2022 11:47:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70263F804AB
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 11:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70263F804AB
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NG3x04Qz0zHw2Z;
 Mon, 21 Nov 2022 18:47:00 +0800 (CST)
Received: from [10.174.178.197] (10.174.178.197) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 18:47:34 +0800
Message-ID: <e7206d5c-123a-a12d-e296-175ebd0090d8@huawei.com>
Date: Mon, 21 Nov 2022 18:47:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH -next] ALSA: seq: fix undefined behavior in bit shift for
 SNDRV_SEQ_FILTER_USE_EVENT
To: Takashi Iwai <tiwai@suse.de>
References: <20221121043625.2910001-1-zhongbaisong@huawei.com>
 <87fsecwq6a.wl-tiwai@suse.de>
From: zhongbaisong <zhongbaisong@huawei.com>
Organization: huawei
In-Reply-To: <87fsecwq6a.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.197]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
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



在 2022/11/21 18:35, Takashi Iwai 写道:
> On Mon, 21 Nov 2022 05:36:25 +0100,
> Baisong Zhong wrote:
>>
>> Shifting signed 32-bit value by 31 bits is undefined, so changing
>> significant bit to unsigned. The UBSAN warning calltrace like below:
>>
>> UBSAN: shift-out-of-bounds in sound/core/seq/seq_clientmgr.c:509:22
>> left shift of 1 by 31 places cannot be represented in type 'int'
>> ...
>> Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0x8d/0xcf
>>   ubsan_epilogue+0xa/0x44
>>   __ubsan_handle_shift_out_of_bounds+0x1e7/0x208
>>   snd_seq_deliver_single_event.constprop.21+0x191/0x2f0
>>   snd_seq_deliver_event+0x1a2/0x350
>>   snd_seq_kernel_client_dispatch+0x8b/0xb0
>>   snd_seq_client_notify_subscription+0x72/0xa0
>>   snd_seq_ioctl_subscribe_port+0x128/0x160
>>   snd_seq_kernel_client_ctl+0xce/0xf0
>>   snd_seq_oss_create_client+0x109/0x15b
>>   alsa_seq_oss_init+0x11c/0x1aa
>>   do_one_initcall+0x80/0x440
>>   kernel_init_freeable+0x370/0x3c3
>>   kernel_init+0x1b/0x190
>>   ret_from_fork+0x1f/0x30
>>   </TASK>
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Signed-off-by: Baisong Zhong <zhongbaisong@huawei.com>
>> ---
>>   include/uapi/sound/asequencer.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
>> index 6d4a2c60808d..4c5c4dd15d02 100644
>> --- a/include/uapi/sound/asequencer.h
>> +++ b/include/uapi/sound/asequencer.h
>> @@ -331,7 +331,7 @@ typedef int __bitwise snd_seq_client_type_t;
>>   #define SNDRV_SEQ_FILTER_BROADCAST	(1<<0)	/* accept broadcast messages */
>>   #define SNDRV_SEQ_FILTER_MULTICAST	(1<<1)	/* accept multicast messages */
>>   #define SNDRV_SEQ_FILTER_BOUNCE		(1<<2)	/* accept bounce event in error */
>> -#define SNDRV_SEQ_FILTER_USE_EVENT	(1<<31)	/* use event filter */
>> +#define SNDRV_SEQ_FILTER_USE_EVENT	(1U<<31)	/* use event filter */
> 
> Similarly like the previous patch for PCM, could you update all
> SNDRV_SEQ_FILTER_* to 1U for consistency?
> 
> 
> thanks,
> 
> Takashi

Hi, Takashi
Thank you for your suggestion. I will update all
SNDRV_SEQ_FILTER_* to 1U for consistency in v2.

Baisong Zhong
.

