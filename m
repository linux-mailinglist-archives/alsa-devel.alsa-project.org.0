Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A71FBBD1
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 18:34:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82CB8167D;
	Tue, 16 Jun 2020 18:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82CB8167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592325257;
	bh=SniOW5su7ympt3qGGpdW4ltjnESnkHaGEtvcCCup4ZY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eyNdD8CEQQK2t4jnbvjhVy6KVZAJ19dQJLTG36w46ye1xBgAjx7yoeI+9e7Kr9pyv
	 liED2bo6BphjJ/VsMuO+S433tvyXAWQjjtHfrUEduohV0tmg1saMjnlfnR4S/2nxfu
	 /X5Z9dQtwkNzjM+NuFdxUqAMbhCbRmU3o1y3luEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D79DF80101;
	Tue, 16 Jun 2020 18:32:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66FDDF8022B; Tue, 16 Jun 2020 18:32:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 865D4F80114
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 18:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 865D4F80114
IronPort-SDR: DUo0uO1rUUdiYDnmTl1GOgkwoXxZdBh+0Xv/+yFT+IXwYJI9ClJ1HY2rm1k5gPnsTdQbXBo0z6
 i1uni62Ukn9Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 09:32:24 -0700
IronPort-SDR: Q/IwApU6zMMsA6tuZH3ooelCGfIsWreqG6Df2t3gpmUl8/HW9u+I1BFkPY+7CpAtghEDbKnu00
 Pgaqi/VFUcqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="298969481"
Received: from nafrose-mobl.amr.corp.intel.com (HELO [10.254.107.226])
 ([10.254.107.226])
 by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2020 09:32:22 -0700
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
To: Stephan Gerhold <stephan@gerhold.net>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net> <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616155544.GA8891@gerhold.net>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7cbc9233-e5f2-03e0-5659-cf22dea75e53@linux.intel.com>
Date: Tue, 16 Jun 2020 11:32:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616155544.GA8891@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 6/16/20 10:55 AM, Stephan Gerhold wrote:
> On Tue, Jun 16, 2020 at 10:05:39AM -0500, Pierre-Louis Bossart wrote:
>>
>>
>> On 6/16/20 9:52 AM, Mark Brown wrote:
>>> On Tue, Jun 16, 2020 at 09:23:25AM -0500, Pierre-Louis Bossart wrote:
>>>> On 6/16/20 4:02 AM, Stephan Gerhold wrote:
>>>>> On Tue, Jun 16, 2020 at 10:54:17AM +0200, Stephan Gerhold wrote:
>>>
>>>>>> For the QCOM case it may be feasible to set dpcm_playback/dpcm_capture
>>>>>> appropriately because it is basically only used with one particular
>>>>>> DAI driver. But simple-audio-card is generic and used with many
>>>>>> different drivers so hard-coding a call into some other driver like
>>>>>> Srinivas did above won't work in that case.
>>>
>>>> Doesn't simple-card rely on DT blobs that can also be updated?
>>>
>>> DT is an ABI just like ACPI - it's just more featureful.  Many systems
>>> can easily update their DTs but not all of them and users don't always
>>> want to try to keep it in lock step with the kernel.  Stuff like this is
>>> why I've been dubious about putting DPCM things in there, it's too much
>>> of a hard coding of internal APIs.
>>
>> ok, but is there any actual use of dpcm_playback/capture outside of C code?
>>
>> simple-card.c and audio-graph-card do hard-code but that's done with C in
>> the driver:
>>
>> 	ret = asoc_simple_parse_daifmt(dev, cpu_ep, codec_ep,
>> 				       NULL, &dai_link->dai_fmt);
>> 	if (ret < 0)
>> 		goto out_put_node;
>>
>> 	dai_link->dpcm_playback		= 1;
>> 	dai_link->dpcm_capture		= 1;
>>
>>
>> that that should be fixed based on the DAI format used in that dai_link - in
>> other words we can make sure the capabilities of the dailink are aligned
>> with the dais while parsing the DT blobs.
> 
> But how do you know which capabilities to set? The device tree doesn't
> tells us that. We could add some code to look up the snd_soc_dai_driver
> early, based on the references in the device tree (basically something
> like snd_soc_of_get_dai_name(), see
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/soc-core.c#n2988)
> 
> At least to me that function doesn't exactly look trivial though,
> and that's just to properly fill in the dpcm_playback/capture
> parameters. Essentially those parameters only complicate the current
> device tree use case,  where you want the DAI link to be for both
> playback/capture, but restricted to the capabilities of the DAI.
> 
> Just wondering if setting up dpcm_playback/capture properly is worth it
> at all in this case. This isn't necessary for the non-DPCM case either,
> there we automatically set it based on the DAI capabilities.

We can add a simple loop for each direction that relies on
snd_soc_dai_stream_valid() to identify if each DAI is capable of doing 
playback/capture.

