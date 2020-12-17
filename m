Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 404962DD367
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 15:58:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04981892;
	Thu, 17 Dec 2020 15:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04981892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608217129;
	bh=7vn3uE43+DKZBAMQFPzJpqtnKAWS38altDX5beAJkU0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uc9+qKo+fzc2BNAIjSPsnM78dO7lTHlZmIt1+zoVhAQLnh9PKZOtuwyQ28ZFIhgwb
	 1IDew59DMeP+bESQukPWul3+ivp0Ilhzx7t1TumS5WscJojmD+ySQzHcG7gi9ZhdxY
	 FN5PW2TaGVt3a50sqE9X61BtXOPlclKm/xWZRV9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21AF8F800C7;
	Thu, 17 Dec 2020 15:57:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A43CF800C7; Thu, 17 Dec 2020 15:57:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F86CF800C7
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 15:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F86CF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="KehhMYv5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=+wEP/J/NPkJK/JzQ5t+YuRXzjvZxB21EzmXcGJJV1Rw=; b=KehhMYv5lvjMPqm7/hKCKrNFIQ
 8+gVJR04x6S4u0RXCp29xmXw5XsDR9/VFoDOvRtyOY0ma7bljJZtvHvFSzfAXJ1K/I9WGMWjKh4nX
 Y2D4fH/a+Ag3EhOvYrCbPU0DP9oO1pUqL5b9u7x1ObTp8mgLgtRHXPdXmBQhOARrGiQxjSFH1NiUH
 gj3id8yJ+Ja7REuXmmmuQPqwq78OqmIEANjGEbeLOttX8YfEJE5pyB3vkT1oa/XEFsPywH6b5ZGBn
 eo/kgxJvF1Olgd8yquXjHSRc4Lpl4BvxIV86nxQbqET1XxiKiZrGimKqTEyGRGgiyhCkTFs6LW4gv
 9E4yuwjw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kpuiE-0000Pj-LJ; Thu, 17 Dec 2020 15:57:02 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kpuiE-000WcE-Du; Thu, 17 Dec 2020 15:57:02 +0100
Subject: Re: [PATCH v1 ] ALSA: core: memalloc: add page alignment for iram
To: Takashi Iwai <tiwai@suse.de>
References: <1608221747-3474-1-git-send-email-yibin.gong@nxp.com>
 <05c824e5-0c33-4182-26fa-b116a42b10d6@metafoo.de>
 <s5h5z50n4dd.wl-tiwai@suse.de>
 <70074f62-954a-9b40-ab4a-cb438925060c@metafoo.de>
 <s5hmtyclmig.wl-tiwai@suse.de>
 <8e103a2b-1097-6d54-7266-34743321efac@metafoo.de>
 <s5hwnxgjysq.wl-tiwai@suse.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <1fc18b56-effa-9dbc-8263-00c632e163e7@metafoo.de>
Date: Thu, 17 Dec 2020 15:57:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <s5hwnxgjysq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26019/Wed Dec 16 15:36:02 2020)
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, xiang@kernel.org,
 Robin Gong <yibin.gong@nxp.com>, akpm@linux-foundation.org
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

On 12/17/20 3:24 PM, Takashi Iwai wrote:
> On Thu, 17 Dec 2020 14:16:48 +0100,
> Lars-Peter Clausen wrote:
>> On 12/17/20 12:06 PM, Takashi Iwai wrote:
>>> On Thu, 17 Dec 2020 11:59:23 +0100,
>>> Lars-Peter Clausen wrote:
>>>> On 12/17/20 10:55 AM, Takashi Iwai wrote:
>>>>> On Thu, 17 Dec 2020 10:43:45 +0100,
>>>>> Lars-Peter Clausen wrote:
>>>>>> On 12/17/20 5:15 PM, Robin Gong wrote:
>>>>>>> Since mmap for userspace is based on page alignment, add page alignment
>>>>>>> for iram alloc from pool, otherwise, some good data located in the same
>>>>>>> page of dmab->area maybe touched wrongly by userspace like pulseaudio.
>>>>>>>
>>>>>> I wonder, do we also have to align size to be a multiple of PAGE_SIZE
>>>>>> to avoid leaking unrelated data?
>>>>> Hm, a good question.  Basically the PCM buffer size itself shouldn't
>>>>> be influenced by that (i.e. no hw-constraint or such is needed), but
>>>>> the padding should be cleared indeed.  I somehow left those to the
>>>>> allocator side, but maybe it's safer to clear the whole buffer in
>>>>> sound/core/memalloc.c commonly.
>>>> What I meant was that most of the APIs that we use to allocate memory
>>>> work on a PAGE_SIZE granularity. I.e. if you request a buffer that
>>>> where the size is not a multiple of PAGE_SIZE internally they will
>>>> still allocate a buffer that is a multiple of PAGE_SIZE and mark the
>>>> unused bytes as reserved.
>>>>
>>>> But I believe that is not the case gen_pool_dma_alloc(). It will
>>>> happily allocate those extra bytes to some other allocation request.
>>>>
>>>> That we need to zero out the reserved bytes even for those other APIs
>>>> is a very good additional point!
>>>>
>>>> I looked at this a few years ago and I'm pretty sure that we cleared
>>>> out the allocated area, but I can't find that anymore in the current
>>>> code. Which is not so great I guess.
>>> IIRC, we used GFP_ZERO in the past for the normal page allocations,
>>> but this was dropped as it's no longer supported or so.
>>>
>>> Also, we clear out the PCM buffer in hw_params call, but this is for
>>> the requested size, not the actual allocated size, hence the padding
>>> bytes will remain uncleared.
>> Ah! That memset() in hw_params is new.
>>> So I believe it's safer to add an extra memset() like my test patch.
>> Yea, we definitely want that.
>>
>> Do we care about leaking audio samples from a previous
>> application. I.e. application 'A' allocates a buffer plays back some
>> data and then closes the device again. Application 'B' then opens the
>> same audio devices allocates a slightly smaller buffer, so that it
>> still uses the same number of pages. The buffer from the previous
>> allocation get reused, but the remainder of the last page wont get
>> cleared in hw_params().
> That's true.  On the second though, it might be better to extend that
> memset() in hw_params to assure clearing the whole allocated buffer.
> We can check runtime->dma_buffer_p->bytes for the actual size.
>
> Also, in the PCM memory allocator, we make sure that the allocation is
> performed for page size.
>
>
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 47b155a49226..6aabad070abf 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -755,8 +755,15 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
>   		runtime->boundary *= 2;
>   
>   	/* clear the buffer for avoiding possible kernel info leaks */
> -	if (runtime->dma_area && !substream->ops->copy_user)
> -		memset(runtime->dma_area, 0, runtime->dma_bytes);
> +	if (runtime->dma_area && !substream->ops->copy_user) {
> +		size_t size;
> +
> +		if (runtime->dma_buffer_p)
> +			size = runtime->dma_buffer_p->bytes;
> +		else
> +			size = runtime->dma_bytes;

I'm not sure.

Not all drivers use snd_pcm_lib_malloc_pages() and 
runtime->dma_buffer_p->bytes might not be a multiple of PAGE_SIZE.

On the other hand if it is mmap-able, the underlying buffer must be a 
multiple of PAGE_SIZE. So a simple memset(..., PAGE_ALIGN(size)) should 
work.

But we'd risk breaking drivers that do not reserve the remainder of the 
page and use it for something else.

Maybe what we need is a check that runtime->dma_area is page aligned and 
runtime->dma_bytes is a multiple of PAGE_SIZE. With a warning at first 
and then turn this into a error a year later or so.

> +		memset(runtime->dma_area, 0, size);
> +	}
>   
>   	snd_pcm_timer_resolution_change(substream);
>   	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);


