Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F94D122B0C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 13:15:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F032D1658;
	Tue, 17 Dec 2019 13:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F032D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576584944;
	bh=AEA8ipRMllzRl0X27rSzlLk7Ao36JE1kt3gyJgm2F+I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rv0fVmv3GQ8WIZlQu/kLjJ8FIUalNaV8xNcrxjvaGzHigAMIxRL54lWEwsSSjvdVx
	 KMHm3ExDddikbLzNkSJrvNqnLx/eKgeOq6DK4wx2N8/MK6YpaZMd3iU4K+Qa3iHwWa
	 g5204S+y39sFDNJO4xnGPrsujrlJRqEuStKJh/RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F5B6F80266;
	Tue, 17 Dec 2019 13:13:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C5D9F8025F; Tue, 17 Dec 2019 13:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC747F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC747F8020B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 04:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="298032164"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga001.jf.intel.com with ESMTP; 17 Dec 2019 04:13:37 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20191217095851.19629-1-cezary.rojewski@intel.com>
 <20191217095851.19629-5-cezary.rojewski@intel.com>
 <s5h1rt32quc.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <22099cfc-c3a0-5c97-e508-31132dbd8a72@intel.com>
Date: Tue, 17 Dec 2019 13:13:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <s5h1rt32quc.wl-tiwai@suse.de>
Content-Language: en-US
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH 4/7] ALSA: core: Expand DMA buffer
	information
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 2019-12-17 11:23, Takashi Iwai wrote:
> On Tue, 17 Dec 2019 10:58:48 +0100,
> Cezary Rojewski wrote:
>>
>> Update DMA buffer definition for snd_compr_runtime so it is represented
>> similarly as in snd_pcm_runtime. While at it, modify
>> snd_compr_set_runtime_buffer to account for newly added members.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   include/sound/compress_driver.h | 35 ++++++++++++++++++++++++---------
>>   1 file changed, 26 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
>> index bc88d6f964da..00f633c0c3ba 100644
>> --- a/include/sound/compress_driver.h
>> +++ b/include/sound/compress_driver.h
>> @@ -23,7 +23,6 @@ struct snd_compr_ops;
>>    * struct snd_compr_runtime: runtime stream description
>>    * @state: stream state
>>    * @ops: pointer to DSP callbacks
>> - * @dma_buffer_p: runtime dma buffer pointer
>>    * @buffer: pointer to kernel buffer, valid only when not in mmap mode or
>>    *	DSP doesn't implement copy
>>    * @buffer_size: size of the above buffer
>> @@ -34,11 +33,14 @@ struct snd_compr_ops;
>>    * @total_bytes_transferred: cumulative bytes transferred by offload DSP
>>    * @sleep: poll sleep
>>    * @private_data: driver private data pointer
>> + * @dma_area: virtual buffer address
>> + * @dma_addr: physical buffer address (not accessible from main CPU)
>> + * @dma_bytes: size of DMA area
>> + * @dma_buffer_p: runtime dma buffer pointer
>>    */
>>   struct snd_compr_runtime {
>>   	snd_pcm_state_t state;
>>   	struct snd_compr_ops *ops;
>> -	struct snd_dma_buffer *dma_buffer_p;
>>   	void *buffer;
>>   	u64 buffer_size;
>>   	u32 fragment_size;
>> @@ -47,6 +49,11 @@ struct snd_compr_runtime {
>>   	u64 total_bytes_transferred;
>>   	wait_queue_head_t sleep;
>>   	void *private_data;
>> +
>> +	unsigned char *dma_area;
>> +	dma_addr_t dma_addr;
>> +	size_t dma_bytes;
>> +	struct snd_dma_buffer *dma_buffer_p;
> 
> Why do we need to have both dma_buffer_p and its values?
> For consistency with PCM stream?
> 
> For PCM, dma_area, dma_addr and dma_bytes are the primary data, which
> aren't necessarily set by the dma_buffer but manually set up by the
> driver.
> 
> Just wondering.

Yeah, this is simply for consistency reasons. As referred to in previous 
reply, I'd like to see compr & PCM being tightly coupled in the future 
so separate page allocation functions are not required. Whether this is 
entirely possible or not I not know yet, although I'm an optimist when 
it comes to that subject.

If it indeed comes to that, having shared concepts and consistent API 
makes it much easier for one to refactor.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
