Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3E2DE86A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 18:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3358717CD;
	Fri, 18 Dec 2020 18:42:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3358717CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608313383;
	bh=zna7iCPKyDnkNnefmd+VXAlu0+pUDFajJeg7xxFchEI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WoOkKF2ofS1eNdXGekr9ODXTFsX+ud78Jas8Z0g42ZfVIaviRNsmbjkjTr5pKfDkK
	 mMsgNgmYjSzaoV8BrZPx2E52mrfNo56TXH9HsiKlwZwc1maIDl7kfzDzmzLtjIZBO9
	 UAV+9Cs9DOal/636HrGsdeI59ro8UU1dTcQC5ipw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BEBCF8014B;
	Fri, 18 Dec 2020 18:41:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98C5CF801F7; Fri, 18 Dec 2020 18:41:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B665F80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 18:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B665F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="LE2xZ95y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=HQh5MnvfaxoI+4jOAMOYaLiSa5/xT3fEKdJw3/ZzAh4=; b=LE2xZ95ygbrup8083xGM1wX1tI
 cUdP8nqPj4pixB9BD1x/RbcfM0ELKfTZ6bj+8cpKJzjexHXMkiTObmDSMSUOxnJqlXi1G0ZezmP/w
 8pmrZ8dqQYX5U8RpViekjAuWJnHowWLPveKMl91JsUSWwfQYolXM0BAULaCYp4xyr67G45JK3iAPj
 dusP1E1aC6w4lruAOKQYtAhtoNsXCxzp8X0NarG/HeZNbYXUCTO+gZu+IyQ6QJdgLDttJ8KShOAD2
 lUUWZ0b3XaO0zUZ5tdjm60topk39mTpqrgwIdCx8aJ1+XYz9Q0lAak88lvv4aflxrLgdIqAN7x5zC
 AShEh9LA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kqJke-000FTb-OD; Fri, 18 Dec 2020 18:41:12 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kqJke-000Txq-KD; Fri, 18 Dec 2020 18:41:12 +0100
Subject: Re: [PATCH] ASoC: meson: Use managed DMA buffer allocation
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
References: <20201218154544.25513-1-lars@metafoo.de>
 <1jeejnnko5.fsf@starbuckisacylon.baylibre.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <fa1f3bcc-885a-9258-6653-3d5a5dc4708e@metafoo.de>
Date: Fri, 18 Dec 2020 18:41:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1jeejnnko5.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26021/Fri Dec 18 13:56:31 2020)
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

On 12/18/20 5:28 PM, Jerome Brunet wrote:
> On Fri 18 Dec 2020 at 16:45, Lars-Peter Clausen <lars@metafoo.de> wrote:
>
>> Using a managed buffer will pre-allocate the buffer using
>> snd_pcm_lib_preallocate_pages() and automatically free it when the PCM is
>> destroyed.
>>
>> In addition it will call snd_pcm_lib_malloc_pages() before the driver's
>> hw_params() callback and snd_pcm_lib_free_pages() after the driver's
>> hw_free() callback.
>>
>> This slightly reduces the boilerplate code of the driver.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> ---
>>   sound/soc/meson/aiu-fifo-i2s.c   |  1 -
>>   sound/soc/meson/aiu-fifo-spdif.c |  1 -
>>   sound/soc/meson/aiu-fifo.c       | 18 ++----------------
>>   3 files changed, 2 insertions(+), 18 deletions(-)
>>
>> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
>> index d91b0d874342..2388a2d0b3a6 100644
>> --- a/sound/soc/meson/aiu-fifo-i2s.c
>> +++ b/sound/soc/meson/aiu-fifo-i2s.c
>> @@ -124,7 +124,6 @@ const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops = {
>>   	.trigger	= aiu_fifo_i2s_trigger,
>>   	.prepare	= aiu_fifo_i2s_prepare,
>>   	.hw_params	= aiu_fifo_i2s_hw_params,
>> -	.hw_free	= aiu_fifo_hw_free,
>>   	.startup	= aiu_fifo_startup,
>>   	.shutdown	= aiu_fifo_shutdown,
>>   };
>> diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
>> index 44eb6faacf44..2fb30f89bf7a 100644
>> --- a/sound/soc/meson/aiu-fifo-spdif.c
>> +++ b/sound/soc/meson/aiu-fifo-spdif.c
>> @@ -158,7 +158,6 @@ const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops = {
>>   	.trigger	= fifo_spdif_trigger,
>>   	.prepare	= fifo_spdif_prepare,
>>   	.hw_params	= fifo_spdif_hw_params,
>> -	.hw_free	= aiu_fifo_hw_free,
>>   	.startup	= aiu_fifo_startup,
>>   	.shutdown	= aiu_fifo_shutdown,
>>   };
>> diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
>> index aa88aae8e517..4ad23267cace 100644
>> --- a/sound/soc/meson/aiu-fifo.c
>> +++ b/sound/soc/meson/aiu-fifo.c
>> @@ -99,11 +99,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>>   	struct snd_soc_component *component = dai->component;
>>   	struct aiu_fifo *fifo = dai->playback_dma_data;
>>   	dma_addr_t end;
>> -	int ret;
>> -
>> -	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
>> -	if (ret < 0)
>> -		return ret;
>>   
>>   	/* Setup the fifo boundaries */
>>   	end = runtime->dma_addr + runtime->dma_bytes - fifo->fifo_block;
>> @@ -124,12 +119,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>>   	return 0;
>>   }
>>   
>> -int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
>> -		     struct snd_soc_dai *dai)
>> -{
>> -	return snd_pcm_lib_free_pages(substream);
>> -}
>> -
>>   static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
>>   {
>>   	struct snd_pcm_substream *playback = dev_id;
>> @@ -187,15 +176,12 @@ void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
>>   int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
>>   		     struct snd_soc_dai *dai)
>>   {
>> -	struct snd_pcm_substream *substream =
>> -		rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>>   	struct snd_card *card = rtd->card->snd_card;
>>   	struct aiu_fifo *fifo = dai->playback_dma_data;
>>   	size_t size = fifo->pcm->buffer_bytes_max;
>>   
>> -	snd_pcm_lib_preallocate_pages(substream,
>> -				      SNDRV_DMA_TYPE_DEV,
>> -				      card->dev, size, size);
>> +	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
>> +				       card->dev, size, size);
> Hi Lars-Peter,
>
> These FIFOs only do playback so to avoid wasting memory
> s/snd_pcm_set_managed_buffer_all/snd_pcm_set_managed_buffer ?

snd_pcm_set_managed_buffer_all() will skip substreams that do not exist. E.g. if the there is not capture support it wont allocate memory for it.

To keep things simple I prefer snd_pcm_set_managed_buffer_all(). snd_pcm_set_managed_buffer() only makes sense if you have a different DMA device for capture and playback or you want different buffer sizes.

