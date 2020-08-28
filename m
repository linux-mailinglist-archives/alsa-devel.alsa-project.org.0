Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F12255D76
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 17:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373C218A0;
	Fri, 28 Aug 2020 17:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373C218A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598627379;
	bh=CTPgnklJKTJhhElpPcfrCwcqndo5i+PFRHgLGwaJGiQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GF5CnOBhz4wCW82JieiQYZhCX3ceqp72b9O4bxmH/GP93DO/ZN93oDowTPxI0phs3
	 4S0l4ezjMC+gQ3+ed9HOCY3ZM4t4BjqLVE/QbwhQn65D2n8TgdTiUbzi/+cMKt8I2Z
	 ERiFP4RPHjif0JKgSpo6kdum6rsBiv52ugassp60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69FC8F800EB;
	Fri, 28 Aug 2020 17:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5580F8016F; Fri, 28 Aug 2020 17:07:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95963F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 17:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95963F800EB
IronPort-SDR: VgyFqY2pd7yeS6mwOfYcHxOmdctG23JJz4EvxtKA9deQ2tIprQod9zvML8cSEngBXH5zQUh+DR
 LfjafAkowTsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="154222192"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="154222192"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:07:41 -0700
IronPort-SDR: 3221SinK08aDM3DBF4iZ1zeOb2Dw1HuzNYvFcqfiP5278XKel9wUEhTOKsl79dqCj69wLyapBb
 TRFE+iC8pR/w==
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="300263904"
Received: from lilymao-mobl.amr.corp.intel.com (HELO [10.209.185.175])
 ([10.209.185.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:07:39 -0700
Subject: Re: [PATCH 07/11] soundwire: intel: Only call sdw stream APIs for the
 first cpu_dai
To: Vinod Koul <vkoul@kernel.org>, "Liao, Bard" <bard.liao@intel.com>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
 <20200818024120.20721-8-yung-chuan.liao@linux.intel.com>
 <20200826094636.GB2639@vkoul-mobl>
 <DM6PR11MB407494AEF6D05EFF627CFAFBFF520@DM6PR11MB4074.namprd11.prod.outlook.com>
 <20200828074544.GM2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9eac0f85-1b0f-d2c2-6d1b-15b77707c9b7@linux.intel.com>
Date: Fri, 28 Aug 2020 10:07:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828074544.GM2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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



On 8/28/20 2:45 AM, Vinod Koul wrote:
> On 28-08-20, 01:47, Liao, Bard wrote:
>>> snd_pcm_substream *substream,
>>>>   			goto err;
>>>>   	}
>>>>
>>>> -	ret = sdw_prepare_stream(dma->stream);
>>>> +	/*
>>>> +	 * All cpu dais belong to a stream. To ensure sdw_prepare_stream
>>>> +	 * is called once per stream, we should call it only when
>>>> +	 * dai = first_cpu_dai.
>>>> +	 */
>>>> +	if (first_cpu_dai == dai)
>>>> +		ret = sdw_prepare_stream(dma->stream);
>>>
>>> Hmmm why not use the one place which is unique in the card to call this,
>>> hint machine dais are only called once.
>>
>> Yes, we can call it in machine driver. But, shouldn't it belong to platform
>> level? The point is that if we move the stuff to machine driver, it will
>> force people to implement these stuff on their own Intel machine driver.
> 
> nothing stops anyone from doing that right! machine driver is another
> component so it can be moved there as well

What Bard is saying is that there is nothing board-specific here. This 
is platform-driver code that is independent of the actual machine 
configuration.

Machine drivers can be board-specific, so we would have to add the code 
for prepare/deprepare/trigger to every machine driver.

Today it's true that we worked to have a single machine driver for all 
SoundWire-based devices, so the change is a 1:1 move, but we can't 
guarantee that this would be the case moving forward. In fact, we *know* 
we will need a different machine driver when we parse platform firmware 
to create the card for SDCA support. So in the end there would be 
duplication of code.

See the code we worked on at 
https://github.com/thesofproject/linux/commit/7322e1d25ce2ec9bb78c6e861919f61e0be7cc0b.patch

it'd really a bit silly to have this generic code in the machine driver.

it would be fine to call a set of helpers called from the machine driver 
dailink, but where would we put these helpers? on the ASoC or SoundWire 
sides?


