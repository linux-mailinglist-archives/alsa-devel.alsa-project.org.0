Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18C9B6505
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 15:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3138C168B;
	Wed, 18 Sep 2019 15:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3138C168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568814673;
	bh=sHs/fTSExQ/b7qJehM2NFYam5tMpZmH9WBpEqf4YkS8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Chiz04ZpX7fa2shzoevgltsO/DQJnDGIap8lor752InXdcFTwgTXe+TFcgAvxCIMq
	 o5GXhxH9a1hADNdEd/aHsyBPf0rqdTVM3mWMvOYW5+CvrzRR9bc5A72sbhim7fYZYu
	 RmqZnjBhPWnfYEZvWnKVaaKxLjpHAtowqC8/Pc3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95F39F80506;
	Wed, 18 Sep 2019 15:49:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EB6CF80506; Wed, 18 Sep 2019 15:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46018F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 15:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46018F80146
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 06:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; d="scan'208";a="199049723"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 18 Sep 2019 06:49:20 -0700
Received: from pbossart-mac01.local (unknown [10.251.11.91])
 by linux.intel.com (Postfix) with ESMTP id 5223B5802B0;
 Wed, 18 Sep 2019 06:49:19 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190916212342.12578-1-pierre-louis.bossart@linux.intel.com>
 <20190916212342.12578-9-pierre-louis.bossart@linux.intel.com>
 <20190917055512.GE2058532@kroah.com>
 <ab06c0c9-6224-a7b8-51c2-01226f763b98@linux.intel.com>
 <20190918120629.GD1901208@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c8f21078-1462-5463-ef12-957ebd9ba085@linux.intel.com>
Date: Wed, 18 Sep 2019 08:48:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918120629.GD1901208@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 8/9] soundwire: intel: remove platform
 devices and provide new interface
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

On 9/18/19 7:06 AM, Greg KH wrote:
> On Tue, Sep 17, 2019 at 09:29:52AM -0500, Pierre-Louis Bossart wrote:
>> On 9/17/19 12:55 AM, Greg KH wrote:
>>> On Mon, Sep 16, 2019 at 04:23:41PM -0500, Pierre-Louis Bossart wrote:
>>>> +/**
>>>> + * sdw_intel_probe() - SoundWire Intel probe routine
>>>> + * @parent_handle: ACPI parent handle
>>>> + * @res: resource data
>>>> + *
>>>> + * This creates SoundWire Master and Slave devices below the controller.
>>>> + * All the information necessary is stored in the context, and the res
>>>> + * argument pointer can be freed after this step.
>>>> + */
>>>> +struct sdw_intel_ctx
>>>> +*sdw_intel_probe(struct sdw_intel_res *res)
>>>> +{
>>>> +	return sdw_intel_probe_controller(res);
>>>> +}
>>>> +EXPORT_SYMBOL(sdw_intel_probe);
>>>> +
>>>> +/**
>>>> + * sdw_intel_startup() - SoundWire Intel startup
>>>> + * @ctx: SoundWire context allocated in the probe
>>>> + *
>>>> + */
>>>> +int sdw_intel_startup(struct sdw_intel_ctx *ctx)
>>>> +{
>>>> +	return sdw_intel_startup_controller(ctx);
>>>> +}
>>>> +EXPORT_SYMBOL(sdw_intel_startup);
>>>
>>> Why are you exporting these functions if no one calls them?
>>
>> They are used in the next series, see '[RFC PATCH 04/12] ASoC: SOF: Intel:
>> add SoundWire configuration interface'
> 
> That wasn't obvious :)
> 
> Also, why not EXPORT_SYMBOL_GPL()?  :)

Since the beginning of this SoundWire work, the intent what that the 
code could be reused in non-GPL open-source circles, hence the dual 
license and EXPORT_SYMBOL.
That said, there are cases where the code only makes sense for Linux, or 
relies on symbols that are exported with EXPORT_SYMBOL_GPL, in those 
cases we rely on GPLv2 and EXPORT_SYMBOL_GPL. For this series I added a 
disclaimer in the cover letter that those parts need to be reviewed 
further to make sure there are no conflicts with GPL.
This is an RFC-level contribution to check if my understanding of the 
bus/device/driver model is aligned with recommendations. I've already 
made local improvements by fixing bisect issues, removing warnings, 
improved some sequences, and that GPL question will be revisited before 
I send a formal patch.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
