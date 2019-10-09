Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80432D1320
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 17:41:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69C8167D;
	Wed,  9 Oct 2019 17:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69C8167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570635689;
	bh=x1FyPjcj9WOxOztt/AqIT/0pIjN4WVrhLC28TrV1Et4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NIeqYgGq9zhfMxeDG7brJQdDNPtcANgF6JBSMxLtZIQrYEc5aAioBUPMCQo+1Dbpx
	 qhbjC6T3k7qkleuQ+Ibs8S9UuGWV4d+jaa0/uvOCJgqh8qJjPrtVRurK22OZBwk5m0
	 2MgyrmwYB46FH8WCDktDZPXmwCsZQV444pohwuac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06D78F80633;
	Wed,  9 Oct 2019 17:37:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D99CF8060F; Wed,  9 Oct 2019 17:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B0C5F802BD
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 17:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B0C5F802BD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 08:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; d="scan'208";a="223620857"
Received: from mmahler-mobl1.amr.corp.intel.com (HELO [10.251.30.188])
 ([10.251.30.188])
 by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2019 08:37:33 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
 <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
 <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
Date: Wed, 9 Oct 2019 09:29:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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



On 10/9/19 3:32 AM, Srinivas Kandagatla wrote:
> Hi Pierre,
> 
> On 14/08/2019 15:09, Pierre-Louis Bossart wrote:
>>
>>
>> On 8/13/19 11:11 PM, Vinod Koul wrote:
>>> On 13-08-19, 20:58, Mark Brown wrote:
>>>> On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis Bossart wrote:
>>>>
>>>>> Indeed. I don't have a full understanding of that part to be 
>>>>> honest, nor why
>>>>> we need something SoundWire-specific. We already abused the 
>>>>> set_tdm_slot API
>>>>> to store an HDaudio stream, now we have a rather confusing stream
>>>>> information for SoundWire and I have about 3 other 'stream' 
>>>>> contexts in
>>>>> SOF... I am still doing basic cleanups but this has been on my 
>>>>> radar for a
>>>>> while.
>>>>
>>>> There is something to be said for not abusing the TDM slot API if it 
>>>> can
>>>> make things clearer by using bus-idiomatic mechanisms, but it does mean
>>>> everything needs to know about each individual bus :/ .
>>>
>>> Here ASoC doesn't need to know about sdw bus. As Srini explained, this
>>> helps in the case for him to get the stream context and set the stream
>>> context from the machine driver.
>>>
>>> Nothing else is expected to be done from this API. We already do a set
>>> using snd_soc_dai_set_sdw_stream(). Here we add the 
>>> snd_soc_dai_get_sdw_stream() to query
>>
>> I didn't see a call to snd_soc_dai_set_sdw_stream() in Srini's code?
> 
> 
> There is a snd_soc_dai_get_sdw_stream() to get stream context and we add 
> slave streams(amplifier in this case) to that context using 
> sdw_stream_add_slave() in machine driver[1].
> 
> Without this helper there is no way to link slave streams to stream 
> context in non dai based setup like smart speaker amplifiers.
> 
> Currently this driver is blocked on this patch, If you think there are 
> other ways to do this, am happy to try them out.

So to be clear, you are *not* using snd_soc_dai_set_sdw_stream?





_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
