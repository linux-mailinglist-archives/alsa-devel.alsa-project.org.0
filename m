Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7554122B74
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 13:27:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BA861668;
	Tue, 17 Dec 2019 13:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BA861668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576585652;
	bh=vmuozhI6URolsnT1an4OyqoE0Fi6yCpJQ3Yq5B7e+gU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iiff81GIXmBh9fSSs4MT2fepmSue7VsfzlfOgASWao30NO95Mbci250V2i0c9gm+H
	 Qa0avz+SNtzHdK0twDzqiJRv1czakIJOGVjHiXSviqXlLB5k7ny0XqfGfiB8xwO87C
	 5UxdzucK1bwGZ39O0tE7WF3WKAnD7hmGQwUCnk0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF006F80234;
	Tue, 17 Dec 2019 13:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA9DF8020B; Tue, 17 Dec 2019 13:22:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F9B5F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F9B5F8020B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 04:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="298034937"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga001.jf.intel.com with ESMTP; 17 Dec 2019 04:22:39 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20191217095851.19629-1-cezary.rojewski@intel.com>
 <20191217095851.19629-6-cezary.rojewski@intel.com>
 <s5hzhfr1c8u.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <1e361e1c-00ba-f8e4-14a8-b636eee6e29c@intel.com>
Date: Tue, 17 Dec 2019 13:22:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <s5hzhfr1c8u.wl-tiwai@suse.de>
Content-Language: en-US
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Divya Prakash <divya1.prakash@intel.com>, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 5/7] ALSA: core: Implement compress page
 allocation and free routines
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


On 2019-12-17 11:24, Takashi Iwai wrote:
> On Tue, 17 Dec 2019 10:58:49 +0100,
> Cezary Rojewski wrote:
>>
>> Add simple malloc and free methods for memory management for compress
>> streams. Based on snd_pcm_lib_malloc_pages and snd_pcm_lib_free_pages
>> implementation.
> 
> I see no user of these functions in the series.  How these are
> supposed to be used?
> 
> 
> Takashi
> 

I've given github links in the cover letter although I could have been 
more descriptive here too..

Probing pull request link:
https://github.com/thesofproject/linux/pull/1276/

Commits implementing compr flow:
- ASoC: SOF: Generic probe compress operations
https://github.com/thesofproject/linux/pull/1276/commits/217025f0fdad7523645a141ad2965dff4923a229

- ASoC: SOF: Intel: Probe compress operations
https://github.com/thesofproject/linux/pull/1276/commits/fb3e724a54bf859f039b2b0b03503a52e1740375

Methods: sof_probe_compr_set_params and sof_probe_compr_free of "ASoC: 
SOF: Generic probe compress operations" commit make use of these.

Basically it shares the concept of simple HDA PCM stream setup. During 
the development process, we decided to split the "introduction" and 
"usage" parts and thus this set of 7patches had spawned - covers the 
introduction. Actual probing patches take care of the "usage".

Czarek

>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Signed-off-by: Divya Prakash <divya1.prakash@intel.com>
>> ---
>>   include/sound/compress_driver.h |  5 ++++
>>   sound/core/compress_offload.c   | 42 +++++++++++++++++++++++++++++++++
>>   2 files changed, 47 insertions(+)
>>
>> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
>> index 00f633c0c3ba..6ce8effa0b12 100644
>> --- a/include/sound/compress_driver.h
>> +++ b/include/sound/compress_driver.h
>> @@ -67,6 +67,7 @@ struct snd_compr_runtime {
>>    * @metadata_set: metadata set flag, true when set
>>    * @next_track: has userspace signal next track transition, true when set
>>    * @private_data: pointer to DSP private data
>> + * @dma_buffer: allocated buffer if any
>>    */
>>   struct snd_compr_stream {
>>   	const char *name;
>> @@ -78,6 +79,7 @@ struct snd_compr_stream {
>>   	bool metadata_set;
>>   	bool next_track;
>>   	void *private_data;
>> +	struct snd_dma_buffer dma_buffer;
>>   };
>>   
>>   /**
>> @@ -212,6 +214,9 @@ snd_compr_set_runtime_buffer(struct snd_compr_stream *stream,
>>   	}
>>   }
>>   
>> +int snd_compr_malloc_pages(struct snd_compr_stream *stream, size_t size);
>> +int snd_compr_free_pages(struct snd_compr_stream *stream);
>> +
>>   int snd_compr_stop_error(struct snd_compr_stream *stream,
>>   			 snd_pcm_state_t state);
>>   
>> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
>> index f34ce564d92c..dfb20ceb2d30 100644
>> --- a/sound/core/compress_offload.c
>> +++ b/sound/core/compress_offload.c
>> @@ -488,6 +488,48 @@ snd_compr_get_codec_caps(struct snd_compr_stream *stream, unsigned long arg)
>>   }
>>   #endif /* !COMPR_CODEC_CAPS_OVERFLOW */
>>   
>> +int snd_compr_malloc_pages(struct snd_compr_stream *stream, size_t size)
>> +{
>> +	struct snd_dma_buffer *dmab;
>> +	int ret;
>> +
>> +	if (snd_BUG_ON(!(stream) || !(stream)->runtime))
>> +		return -EINVAL;
>> +	dmab = kzalloc(sizeof(*dmab), GFP_KERNEL);
>> +	if (!dmab)
>> +		return -ENOMEM;
>> +	dmab->dev = stream->dma_buffer.dev;
>> +	ret = snd_dma_alloc_pages(dmab->dev.type, dmab->dev.dev, size, dmab);
>> +	if (ret < 0) {
>> +		kfree(dmab);
>> +		return ret;
>> +	}
>> +
>> +	snd_compr_set_runtime_buffer(stream, dmab);
>> +	stream->runtime->dma_bytes = size;
>> +	return 1;
>> +}
>> +EXPORT_SYMBOL(snd_compr_malloc_pages);
>> +
>> +int snd_compr_free_pages(struct snd_compr_stream *stream)
>> +{
>> +	struct snd_compr_runtime *runtime = stream->runtime;
>> +
>> +	if (snd_BUG_ON(!(stream) || !(stream)->runtime))
>> +		return -EINVAL;
>> +	if (!runtime->dma_area)
>> +		return 0;
>> +	if (runtime->dma_buffer_p != &stream->dma_buffer) {
>> +		/* It's a newly allocated buffer. Release it now. */
>> +		snd_dma_free_pages(runtime->dma_buffer_p);
>> +		kfree(runtime->dma_buffer_p);
>> +	}
>> +
>> +	snd_compr_set_runtime_buffer(stream, NULL);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(snd_compr_free_pages);
>> +
>>   /* revisit this with snd_pcm_preallocate_xxx */
>>   static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
>>   		struct snd_compr_params *params)
>> -- 
>> 2.17.1
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
