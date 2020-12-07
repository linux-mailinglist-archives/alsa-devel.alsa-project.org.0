Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8422D0DC0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 11:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1894A16C6;
	Mon,  7 Dec 2020 11:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1894A16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607335631;
	bh=mbdnDeM634K08qwjxYyJuEtz4HRQnAyF3t41nK+2SEg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jYomgp0ed+9l/pIElPutjbIR4Mkn7zuqBDdtag0ZlP6yGmvgX4MCdChN44B8LJOv5
	 402b/nXBVovv54AGOtqYrA6G5v14Sk0LKTKkhoBpot7UGUBTO7+U6UsS76B1zDb3oa
	 rEG8mU2pITq0p4A+GQWJIjUUDRbdVn6U/QSGIzYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32AA0F800E1;
	Mon,  7 Dec 2020 11:05:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6588CF8020D; Mon,  7 Dec 2020 11:05:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79E95F800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 11:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E95F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="OxRE8BId"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=O+DgigRpc24x+4b4t+Veuzx3kLFrrtWQAX9oEw7jbpI=; b=OxRE8BIdxoo5rpWz6C2wuOQwkc
 6IirI8DcgDyJz2p2Pk5MSEaNXndoVIb8d7aHbsh2vfwvdpckpuObvw4LRCpoytgKt6BvUxN9CHsN5
 2ln/KV7jOEwRu5efzNKpRzaVmEFz34nQyFMi/XmmKxaInnX+8Z+G94l/3NAaOinwuWVfcfbLdPnq/
 89vtfohUdZD4bdWkHbJyMGBfVZWEsjpPmES5ojGU1zrEWGTk3t7ghVCvOMCZJBfHvZnubGwV+mHkv
 Fjx3o2QtpP9MaXFOusQ/ErWSx4/a/n8X+8MI3kGykvLOC4QvkqB9NjmpDIH3SR6kZ3oSG+a8GqcHe
 C8nAm1VQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kmDOP-0007Hu-H4; Mon, 07 Dec 2020 11:05:17 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kmDOP-000EZ7-Aa; Mon, 07 Dec 2020 11:05:17 +0100
Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "Sia, Jee Heng" <jee.heng.sia@intel.com>,
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
 <20201118145055.GW4077@smile.fi.intel.com>
 <CO1PR11MB5026A81C4294BEF4EE5EF923DAFB0@CO1PR11MB5026.namprd11.prod.outlook.com>
 <BYAPR11MB30465A81744EA686D2502DB69DF50@BYAPR11MB3046.namprd11.prod.outlook.com>
 <e9bae9eb-6b8b-5a8c-eba0-d7f5da955987@metafoo.de>
 <20201130110915.GI4077@smile.fi.intel.com>
 <74ed61e1-67d9-d7b7-0619-fbe61ad7a583@metafoo.de>
 <CO1PR11MB502600945CC303756DBBC30ADAF40@CO1PR11MB5026.namprd11.prod.outlook.com>
 <BYAPR11MB3046DFC48A045ADA72D0F9369DF00@BYAPR11MB3046.namprd11.prod.outlook.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <17462280-244f-0c1e-61f2-6dd197dbcd2d@metafoo.de>
Date: Mon, 7 Dec 2020 11:05:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB3046DFC48A045ADA72D0F9369DF00@BYAPR11MB3046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26010/Sun Dec  6 15:42:07 2020)
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
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

On 12/5/20 1:55 AM, Sit, Michael Wei Hong wrote:
>
>>> -----Original Message-----
>>> From: Lars-Peter Clausen <lars@metafoo.de>
>>> Sent: 01 December 2020 4:22 PM
>>> To: Shevchenko, Andriy <andriy.shevchenko@intel.com>
>>> Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>;
>> Sia, Jee
>>> Heng <jee.heng.sia@intel.com>; pierre-
>> louis.bossart@linux.intel.com;
>>> Rojewski, Cezary <cezary.rojewski@intel.com>;
>>> liam.r.girdwood@linux.intel.com; vkoul@kernel.org;
>> tiwai@suse.com;
>>> broonie@kernel.org; alsa-devel@alsa-project.org
>>> Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-
>> pcm: Add
>>> custom prepare and submit function
>>>
> ...
>>>> Why should we split than resplit if we may do it in one go?
>>>> Why then we have DMA capabilities returned to the
>> consumers.
>>>> So, I have that we need to optimize DMA SG list preparation
>> in a way
>>>> that consumer gets SG list cooked in accordance with DMA
>>> limitations / requirements.
>>>
>>> The API that the audio drivers use request a period DMA
>> transfer for
>>> length N split into M segments with the callback being called
>> after
>>> each segment.
>>>
>>> How that is implemented internally in the DMA does not matter
>> as long
>>> as it matches those semantics. E.g. if the segment is longer than
>> what
>>> the DMA can handle it can split it into two segments internally
>> and
>>> call the callback every second segment.
>>>
>>> The way this API works there isn't even really a possibility for
>> the
>>> client side to split periodic transfers.
>>>
>>> Btw. 1024 beats per segment seems excessively small, I don't
>>> understand how somebody would design such an DMA. Was
>> the assumption
>>> that the DMA will never transfer more than PAGE_SIZE of
>> contiguous
>>> memory? Or do we not understand the documentation
>> correctly?
>> [>>] The segment size is 1024 items. The item size could be 8bits,
>> 16bits or 32bits. So, set_max_seg_size() is set to 1024*4bytes.
>>
>>
>>> - Lars
> Hi All,
>   
> In order to fulfil Andy request on optimizing the linked-list at the DMA client side, we proposed a few changes to the soc-generic- dmaengine and DMAENGINE API due to the AxiDMA's nature operation in number of items.
>   
> Add New DMAENGINE API:
> // For DMA driver to set the max items in a segment 1. dma_set_max_seg_items(struct device *dev, unsigned int size)
>
> // For DMA client to retrieve the max items supported in a segment 2. dma_get_max_seg_items(struct device *dev)
>
> #1 and #2 above are the critical API needed to be exposed to the DMA Clients so that DMA Clients can use it to calculate the appropriate segment length before pass it to the DMA driver.
> If #1 and #2 are No Go, then splitting linked-list in DMA client can't be achieve.
>
> ASoC changes:
> 1. Adding variable to snd_pcm_hardware to store DMA limitation information.
> 2. soc-generic-dmaengine-pcm to register DMA limitation exposed by DMA driver using API provided above.
> 3. dmaengine_pcm_prepare_and_submit in pcm_dmaengine.c to check the number of items needed calculated from userspace and configure the dma accordingly if the number of items exceeds the DMA items limitation.
> 4. dmaengine_pcm_dma_complete in pcm_dmaengine.c to check the number of items needed calculated from userspace and update position according to DMA limitation, to trigger period_elapse appropriately.
>
> All of the above are needed in order to facilitate storing of the DMA limitation info and using the info to configure the DMA appropriately within the DMA limits.
> #3 and #4 implements a check against the number of items needed based on userspace provided information and the DMA item limit, if the limit is exceeded, the maximum limit of the DMA is used to configure the DMA transfers.
> e.g.
> bytes_to_samples returns a value higher than the maximum item limit of the DMA, the driver will pass the maximum usable limit of the DMA using samples_to_bytes to the DMA driver. This will make the DMA driver to use longer linked-list and would not need to do the resplitting at the DMA driver.
>
> Below is the snapshot of the code showing how soc-generic- dmaengine make use of the new API to calculate the segment length.
> ---------------------------------------------------------------------------------------------------------------------------------------------
> Code change in pcm.h
>
> struct snd_pcm_hardware {
> 	......
>
> 	size_t buffer_bytes_max;	/* max buffer size */
> 	size_t period_bytes_min;	/* min period size */
> 	size_t period_bytes_max;	/* max period size */
> 	unsigned int periods_min;	/* min # of periods */
> 	unsigned int periods_max;	/* max # of periods */
> 	size_t fifo_size;		/* fifo size in bytes */
>
> --> Add variable for dma max item numbers
> 	e.g: unsigned int dma_item_max;	/* max # of dma items */
>
> 	......
> };
>
>
> ---------------------------------------------------------------------------------------------------------------------------------------------
> Code change in soc-generic-dmaengine-pcm.c
>
> static int
> dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
> 				   struct snd_pcm_substream *substream) {
> 	......
>
> 	memset(&hw, 0, sizeof(hw));
> 	hw.info = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
> 			SNDRV_PCM_INFO_INTERLEAVED;
> 	hw.periods_min = 2;
> 	hw.periods_max = UINT_MAX;
> 	hw.period_bytes_min = 256;
> 	hw.period_bytes_max = dma_get_max_seg_size(dma_dev);
> 	hw.buffer_bytes_max = SIZE_MAX;
> 	hw.fifo_size = dma_data->fifo_size;
>
> --> Add code to register MAX_DMA_Items limitation using API exposed by
> --> dma
> 	e.g: hw.dma_item_max = dma_get_max_item_number(dma_dev);
>
> 	......
> }
>
> ---------------------------------------------------------------------------------------------------------------------------------------------
> Code change in pcm_dmaengine.c
>
> static void dmaengine_pcm_dma_complete(void *arg) {
> 	......
>
> 	struct snd_pcm_runtime *runtime = substream->runtime;
> 	int blocks;
>
> -->Add code to convert period bytes to number of DMA items passed down
> -->from user space
> 	e.g : blocks = bytes_to_samples(runtime, snd_pcm_lib_period_bytes(substream));
> --> Add code to check number of DMA items from user space vs DMA
> --> limitation and update position accordingly
> 	e.g:
>
> 	if (blocks > hw.dma_item_max)
> 		prtd->pos += samples_to_bytes(runtime, MAX_DMA_BLOCKS);
> 	else
> 		prtd->pos += snd_pcm_lib_period_bytes(substream);
>
> 	......
> }
>
> static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream) {
> 	......
>
> 	struct snd_pcm_runtime *runtime = substream->runtime;
> 	int blocks;
>
> --> Add code to convert period bytes to number of DMA items passed down
> --> from user space
> 	e.g: blocks = bytes_to_samples(runtime, snd_pcm_lib_period_bytes(substream));
> 	......
>
> --> Add code to check if the number of blocks used exceed the DMA
> --> limitation and prepare DMA according to limitation instead of
> --> information taken from userspace
> 	e.g:
> 	if (blocks > hw.dma_item_max)
> 		desc = dmaengine_prep_dma_cyclic(chan,
> 			substream->runtime->dma_addr,
> 			snd_pcm_lib_buffer_bytes(substream),
> 			samples_to_bytes(runtime, MAX_DMA_BLOCKS), direction, flags);
> 	else
> 		desc = dmaengine_prep_dma_cyclic(chan,
> 			substream->runtime->dma_addr,
> 			snd_pcm_lib_buffer_bytes(substream),
> 			snd_pcm_lib_period_bytes(substream), direction, flags);
>
> 	......
> }
>
Hi,

I don't think this approach will work. If you setup a DMA transfer with 
a different configuration that what was requested your audio will glitch.

If you really want to limit your period size you need to install a range 
constraint on the SNDRV_PCM_HW_PARAM_PERIOD_SIZE parameter.

But I'd highly recommend against it and just split the transfer into 
multiple segments in the DMA driver. Needlessly limiting the period size 
will increase the number of interrupts during audio playback/recording 
and hurt the power efficiency of your system.

- Lars

