Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F620FA96
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 19:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F238E1612;
	Tue, 30 Jun 2020 19:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F238E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593538192;
	bh=5U++g2HmGBCpyrPphTy+2sUv/DIfU92iJ9acD68awis=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z6Vb2OmR6we5LU+Ihay8Z75DCPzmtvPakAak7x9xqTMlOFss4s/XMa+iaqGd+3v+1
	 4sAuJ0C5WfGvvBCQsIjPxghF0y58Qca6iGidZAImU1SVKqyYeMeLyImMr+t6RImbSy
	 /o14QBdlFlYMUWYkWRxVqgw4u4IHq4IbDUsnev8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8285AF8028F;
	Tue, 30 Jun 2020 19:27:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDFB8F801F2; Tue, 30 Jun 2020 19:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2AC2F801F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 19:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2AC2F801F2
IronPort-SDR: SktBDIGJnhY9SlbM0lLSRslEmsezUZGwZ0XqznQqBpCsEuPj75otAEV2IzsA7cySNZkkEYlfde
 oZ1nuhF4hryg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231190526"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="231190526"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 10:26:58 -0700
IronPort-SDR: +/Du3clL+kH8j47dZMptzCZN9CWuzz08ZNLzFF6N/wHXdhzwOhFNUNkIIvEMqSe5Ny45BzUyyt
 pphR8thsCiPA==
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="281307459"
Received: from dnoeunx-mobl.amr.corp.intel.com (HELO [10.254.77.113])
 ([10.254.77.113])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 10:26:57 -0700
Subject: Re: [PATCH 2/5] soundwire: stream: add helper to startup/shutdown
 streams
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200622212332.16277-1-yung-chuan.liao@linux.intel.com>
 <20200622212332.16277-3-yung-chuan.liao@linux.intel.com>
 <20200630160349.GR2599@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5123471d-92f3-8f49-7a2c-d7b70bf442af@linux.intel.com>
Date: Tue, 30 Jun 2020 11:58:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630160349.GR2599@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Thanks Vinod for the review.

>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -13,6 +13,9 @@
>>   #include <linux/slab.h>
>>   #include <linux/soundwire/sdw_registers.h>
>>   #include <linux/soundwire/sdw.h>
>> +#include <sound/core.h>
> 
> Do we really need core header?

No we don't, the only thing needed in sound/soc.h it seems.

>> +#include <sound/pcm.h>
>> +#include <sound/soc.h>
>>   #include "bus.h"
>>   
>>   /*
>> @@ -1826,3 +1829,90 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(sdw_deprepare_stream);
>> +
>> +static int set_stream(struct snd_pcm_substream *substream,
>> +		      struct sdw_stream_runtime *sdw_stream)
> 
> sdw_set_stream() please

it's an internal helper not exported, the choice of not adding a prefix 
was intentional to avoid confusion with exported ones.

>> +{
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct snd_soc_dai *dai;
>> +	int ret = 0;
>> +	int i;
>> +
>> +	/* Set stream pointer on all DAIs */
>> +	for_each_rtd_dais(rtd, i, dai) {
>> +		ret = snd_soc_dai_set_sdw_stream(dai, sdw_stream,
>> +						 substream->stream);
>> +		if (ret < 0) {
>> +			dev_err(rtd->dev,
>> +				"failed to set stream pointer on dai %s",
>> +				dai->name);
> 
> lets use one line and shiny new 100 char limit, would make code read
> better!

yes

>> +			break;
> 
> So on error should unset of stream pointer be done?

it's already done below, see [1]

>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +int sdw_startup_stream(void *sdw_substream)
> 
> Can we have kernel doc style Documentation for exported APIs?

yes, that's a miss indeed.

Though if we follow the existing examples it's not going to be very 
informative, e.g.

/**
  * sdw_disable_stream() - Disable SoundWire stream
  *
  * @stream: Soundwire stream
  *
  * Documentation/driver-api/soundwire/stream.rst explains this API in 
detail
  */

>> +{
>> +	struct snd_pcm_substream *substream = sdw_substream;
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct sdw_stream_runtime *sdw_stream;
>> +	char *name;
>> +	int ret;
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +		name = kasprintf(GFP_KERNEL, "%s-Playback", substream->name);
>> +	else
>> +		name = kasprintf(GFP_KERNEL, "%s-Capture", substream->name);
>> +
>> +	if (!name)
>> +		return -ENOMEM;
>> +
>> +	sdw_stream = sdw_alloc_stream(name);
>> +	if (!sdw_stream) {
>> +		dev_err(rtd->dev, "alloc stream failed for substream DAI %s",
>> +			substream->name);
>> +		ret = -ENOMEM;
>> +		goto error;
>> +	}
>> +
>> +	ret = set_stream(substream, sdw_stream);
>> +	if (ret < 0)
>> +		goto release_stream;

[1]

>> +	return 0;
>> +
>> +release_stream:
>> +	sdw_release_stream(sdw_stream);
>> +	set_stream(substream, NULL);
>> +error:
>> +	kfree(name);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(sdw_startup_stream);
