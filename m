Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4534D2DCFAF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 11:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1E9C174B;
	Thu, 17 Dec 2020 11:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1E9C174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608201993;
	bh=bTTb/cvpNDUrEio1sijsxF53hiWc1E8AtESIjUt8HNI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZ2HYs0DtLUT89xjB3qbw/4Ouuu+OZn4EzznAGAr13r1QRQ1YUNfTQOBh5E2x8J9n
	 X+Ky6+t4ObZwCU30VetgvV6XmXIJEATPGPJPfLFj6ZN/mi2bTvmhrUPkKaDmocANll
	 fhU1xqbyP4kh/Qo27i3fst2cabMDqeq/lzAhRA4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0908F8014B;
	Thu, 17 Dec 2020 11:44:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D62F5F80260; Thu, 17 Dec 2020 11:44:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9107CF80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 11:44:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9107CF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="KSqYBT8c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=L+YdKSAitreUN4tqczxAQRC86va3RNnQmUA8K2tUr9o=; b=KSqYBT8c0LlWwImBD2JkW0mRIY
 /bFTo0j15/zPNUlAloxgBKZgNGzVtAYJD4b46Q4R/2RO+HgPC0A8wjkHXlc+UkryLtfA1aPI3WkNr
 /Z80VlsPTMZGVPzXxab+Vz5/lUqXJgMa6WyRCFAIVF7X3TVzytSluaREPzEdH6xXOknCAkkGZcBWP
 JftleKJ/uH+v28lO7HIgMpfLVqPVkp7Ra153SYMUfajUtruFYQgT/PuH8Ix0ixRCRAMIULcKOBLZ8
 5c6T8AmKbjsCNiLvkTpJ/czeWMULK+lfDcLSIkVi+9Bl+sMutvo4YvvbS/hSDUpb8vrD84dlAnqKx
 bui3/9+Q==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kpqln-000BAI-TP; Thu, 17 Dec 2020 11:44:27 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kpqln-0006Dm-Ma; Thu, 17 Dec 2020 11:44:27 +0100
Subject: Re: [PATCH v1 ] ALSA: core: memalloc: add page alignment for iram
To: Takashi Iwai <tiwai@suse.de>
References: <1608221747-3474-1-git-send-email-yibin.gong@nxp.com>
 <05c824e5-0c33-4182-26fa-b116a42b10d6@metafoo.de>
 <s5h5z50n4dd.wl-tiwai@suse.de> <s5h1rfon3ho.wl-tiwai@suse.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <01cbc568-d476-5d19-9131-ed1ee24385c9@metafoo.de>
Date: Thu, 17 Dec 2020 11:44:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <s5h1rfon3ho.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26019/Wed Dec 16 15:36:02 2020)
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, xiang@kernel.org,
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

On 12/17/20 11:14 AM, Takashi Iwai wrote:
> On Thu, 17 Dec 2020 10:55:42 +0100,
> Takashi Iwai wrote:
>> On Thu, 17 Dec 2020 10:43:45 +0100,
>> Lars-Peter Clausen wrote:
>>> On 12/17/20 5:15 PM, Robin Gong wrote:
>>>> Since mmap for userspace is based on page alignment, add page alignment
>>>> for iram alloc from pool, otherwise, some good data located in the same
>>>> page of dmab->area maybe touched wrongly by userspace like pulseaudio.
>>>>
>>> I wonder, do we also have to align size to be a multiple of PAGE_SIZE
>>> to avoid leaking unrelated data?
>> Hm, a good question.  Basically the PCM buffer size itself shouldn't
>> be influenced by that (i.e. no hw-constraint or such is needed), but
>> the padding should be cleared indeed.  I somehow left those to the
>> allocator side, but maybe it's safer to clear the whole buffer in
>> sound/core/memalloc.c commonly.
> That said, something like below (totally untested).
> We might pass the pass-aligned size to dmab->bytes field instead of
> keeping the original value, too.

We'd need this for those APIs that also pass the size to the free() 
function. Like dma_free_coherent() and free_pages_exact(), but maybe 
those round up internally as well.

I had a quick look and I could not find any place were the code relies 
on the requested buffer size being stored in dmab->bytes. In fact we 
already reuse the buffer if  there is an allocated buffer that is larger 
than the requested buffer (See snd_pcm_lib_malloc_pages), so this should 
be OK.

>
>
> Takashi
>
> ---
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -126,6 +126,7 @@ static inline gfp_t snd_mem_get_gfp_flags(const struct device *dev,
>   int snd_dma_alloc_pages(int type, struct device *device, size_t size,
>   			struct snd_dma_buffer *dmab)
>   {
> +	size_t orig_size = size;
>   	gfp_t gfp;
>   
>   	if (WARN_ON(!size))
> @@ -133,6 +134,7 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
>   	if (WARN_ON(!dmab))
>   		return -ENXIO;
>   
> +	size = PAGE_ALIGN(size);
>   	dmab->dev.type = type;
>   	dmab->dev.dev = device;
>   	dmab->bytes = 0;
> @@ -177,7 +179,8 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
>   	}
>   	if (! dmab->area)
>   		return -ENOMEM;
> -	dmab->bytes = size;
> +	memset(dmab->area, 0, size);
> +	dmab->bytes = orig_size;
>   	return 0;
>   }
>   EXPORT_SYMBOL(snd_dma_alloc_pages);


