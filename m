Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFC71C86B2
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 12:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65E51805;
	Thu,  7 May 2020 12:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65E51805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588847390;
	bh=jDbrR6p9S6AsHbJzqscfFVAigpuTA0XfDx4lnLRNdSc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CuXCjB0OibeQWD0ZhvZfRcSY/vlEjsAiVlkd8gZfGLn0sDthiYGR/H4zTLpSd0MQD
	 4wM5cvZO3HNRVjPRL/lUXkZT3YYUqTheGdFZl4cUF8dgndfhevzSbPaRHBgS5JPB4Y
	 cmeicVrWMKrT8FAyWESO5q7bCwvXWsTyq7HZrNV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7273F800AD;
	Thu,  7 May 2020 12:28:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83E1FF8015F; Thu,  7 May 2020 12:28:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2727BF800F6
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 12:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2727BF800F6
IronPort-SDR: P7OtM2SKhksTpLDvBdAM5vVhA5REdDsnEZUaqmVB8vDiYhCTZdKXzd99aroxafBaYymOM1P4zr
 dXNvBbGcuOqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 03:27:46 -0700
IronPort-SDR: Irk2tQgnYo+gbOdg87WicPuaGadj5Kd2audklTbI4Daf6Vohc65d+JjGMoCsueL5LAGvSpkvfH
 hdOHI7pB8+8g==
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; d="scan'208";a="435235371"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.152.99])
 ([10.249.152.99])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 03:27:44 -0700
Subject: Re: KASAN: use-after-free Write in snd_rawmidi_kernel_write1
To: Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <CAFcO6XMGT42wFBxEa01Ee5Msuecm+WiXnn4rc-VWkC4vTzycPg@mail.gmail.com>
 <20200507082302.GF1024567@kroah.com> <s5h8si45ard.wl-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <ecc5f76f-2e87-f634-b98c-9fbcad177d72@linux.intel.com>
Date: Thu, 7 May 2020 12:27:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <s5h8si45ard.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: security@kernel.org, butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 syzkaller <syzkaller@googlegroups.com>
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



On 5/7/2020 11:56 AM, Takashi Iwai wrote:
> On Thu, 07 May 2020 10:23:02 +0200,
> Greg Kroah-Hartman wrote:
>>
>> On Thu, May 07, 2020 at 04:04:25PM +0800, butt3rflyh4ck wrote:
>>> I report a bug (in linux-5.7-rc1) found by syzkaller.
>>>
>>> kernel config: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/v5.7.0-rc1.config
>>> reproducer: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/repro.cprog
>>>
>>> I test the reproducer in linux-5.7-rc4 and crash too.
>>
>> Great, care to create a fix for this and send it to the proper
>> maintainers?  That's the best way to get it fixed, otherwise it just
>> goes in the file with the rest of the syzbot reports we are burried
>> under.
> 
> Don't worry, I already prepared a fix patch below :)
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: rawmidi: Fix racy buffer resize under concurrent
>   accesses
> 
> The rawmidi core allows user to resize the runtime buffer via ioctl,
> and this may lead to UAF when performed during concurrent reads or
> writes.
> 
> This patch fixes the race by introducing a reference counter for the
> runtime buffer access and returns -EBUSY error when the resize is
> performed concurrently.
> 
> Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/r/CAFcO6XMWpUVK_yzzCpp8_XP7+=oUpQvuBeCbMffEDkpe8jWrfg@mail.gmail.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   include/sound/rawmidi.h |  1 +
>   sound/core/rawmidi.c    | 29 ++++++++++++++++++++++++++++-
>   2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
> index a36b7227a15a..334842daa904 100644
> --- a/include/sound/rawmidi.h

(...)

> @@ -1021,6 +1039,7 @@ static long snd_rawmidi_kernel_read1(struct snd_rawmidi_substream *substream,
>   	unsigned long appl_ptr;
>   
>   	spin_lock_irqsave(&runtime->lock, flags);
> +	snd_rawmidi_buffer_ref(runtime);
>   	while (count > 0 && runtime->avail) {
>   		count1 = runtime->buffer_size - runtime->appl_ptr;
>   		if (count1 > count)
> @@ -1040,13 +1059,17 @@ static long snd_rawmidi_kernel_read1(struct snd_rawmidi_substream *substream,
>   			spin_unlock_irqrestore(&runtime->lock, flags);
First unlock
>   			if (copy_to_user(userbuf + result,
>   					 runtime->buffer + appl_ptr, count1)) {
> -				return result > 0 ? result : -EFAULT;
> +				if (!result)
> +					result = -EFAULT;
> +				goto out;

goto -> Second unlock
>   			}
>   			spin_lock_irqsave(&runtime->lock, flags);
>   		}
>   		result += count1;
>   		count -= count1;
>   	}
> + out:
> +	snd_rawmidi_buffer_unref(runtime);
>   	spin_unlock_irqrestore(&runtime->lock, flags);
Second unlock
>   	return result;
>   }

So if I follow this correctly, you call spin_unlock_irqrestore twice in 
case of error?
