Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455DC631EB7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 11:48:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D226E868;
	Mon, 21 Nov 2022 11:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D226E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669027712;
	bh=9tJb3eDEJoZPke0Un8yRKr4tUbxdKtNrasCSCIo9+2Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIStZuFI8mcyB/+IqLsNXml4mAe4dfOx1+PhtUWj7r/bL048dqKgZzoZizILlyJGi
	 Vop45ERQY1ynAJGgZ7hJ8hsfSBwx2Gu98A3UcT6yWyEiNvoBbHc9OVV0lpIcA1S9gz
	 wv4EZKNeRRnl0kuEbYuBXcS/wVeCFBrqF6qZ/DvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73148F80115;
	Mon, 21 Nov 2022 11:47:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78219F8028D; Mon, 21 Nov 2022 11:47:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C694F800F3
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 11:47:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C694F800F3
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NG3sq0dvDzFqSg;
 Mon, 21 Nov 2022 18:44:15 +0800 (CST)
Received: from [10.174.178.197] (10.174.178.197) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 18:47:28 +0800
Message-ID: <8e6ba5d1-ed34-1a17-35cb-4b80f1cdb38e@huawei.com>
Date: Mon, 21 Nov 2022 18:47:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH -next] ALSA: pcm: fix undefined behavior in bit shift for
 SNDRV_PCM_RATE_KNOT
To: Takashi Iwai <tiwai@suse.de>
References: <20221121023329.2423665-1-zhongbaisong@huawei.com>
 <87h6yswq7c.wl-tiwai@suse.de>
From: zhongbaisong <zhongbaisong@huawei.com>
Organization: huawei
In-Reply-To: <87h6yswq7c.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.197]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, broonie@kernel.org
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
> On Mon, 21 Nov 2022 03:33:29 +0100,
> Baisong Zhong wrote:
>>
>> Shifting signed 32-bit value by 31 bits is undefined, so changing
>> significant bit to unsigned. The UBSAN warning calltrace like below:
>>
>> UBSAN: shift-out-of-bounds in sound/core/pcm_native.c:2676:21
>> left shift of 1 by 31 places cannot be represented in type 'int'
>> ...
>> Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0x8d/0xcf
>>   ubsan_epilogue+0xa/0x44
>>   __ubsan_handle_shift_out_of_bounds+0x1e7/0x208
>>   snd_pcm_open_substream+0x9f0/0xa90
>>   snd_pcm_oss_open.part.26+0x313/0x670
>>   snd_pcm_oss_open+0x30/0x40
>>   soundcore_open+0x18b/0x2e0
>>   chrdev_open+0xe2/0x270
>>   do_dentry_open+0x2f7/0x620
>>   path_openat+0xd66/0xe70
>>   do_filp_open+0xe3/0x170
>>   do_sys_openat2+0x357/0x4a0
>>   do_sys_open+0x87/0xd0
>>   do_syscall_64+0x34/0x80
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Signed-off-by: Baisong Zhong <zhongbaisong@huawei.com>
>> ---
>>   include/sound/pcm.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
>> index 7b1a022910e8..ec28c2ec89de 100644
>> --- a/include/sound/pcm.h
>> +++ b/include/sound/pcm.h
>> @@ -123,7 +123,7 @@ struct snd_pcm_ops {
>>   #define SNDRV_PCM_RATE_384000		(1<<14)		/* 384000Hz */
>>   
>>   #define SNDRV_PCM_RATE_CONTINUOUS	(1<<30)		/* continuous range */
>> -#define SNDRV_PCM_RATE_KNOT		(1<<31)		/* supports more non-continuos rates */
>> +#define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuos rates */
> 
> Could you rather update all SNDRV_PCM_RATE_* to 1U?
> Otherwise it'll look inconsistent.
> 
> 
> thanks,
> 
> Takashi

Hi, Takashi
Thank you for your suggestion. I will update all
SNDRV_PCM_RATE_* to 1U for consistency in v2.

Baisong Zhong
.
