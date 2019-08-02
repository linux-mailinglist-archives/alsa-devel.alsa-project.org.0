Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 483577FEFA
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 18:54:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB20216D2;
	Fri,  2 Aug 2019 18:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB20216D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564764858;
	bh=QcSAZ1o621igY5mgVfSSCHwtYNDieGWKC2/Q7XaZGx8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZcYBLXU4a8UOLpLluB2yYruXyiB5CsfArQnpO+4SUT0A7q/7Rr7xpvFSOhp7wihI
	 QpCUTtdLT7NyI4fvqOz+0/sSSLeKOWq7paKjQImMhQKIBALSvrUArQgPvAM1m3/GA7
	 h8d2ilmz20kqeKmVea6Iuz4em18/4mYEaw/aUAgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13B61F8048F;
	Fri,  2 Aug 2019 18:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BC27F8048F; Fri,  2 Aug 2019 18:52:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8594BF800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 18:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8594BF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 09:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="257031873"
Received: from mvicidom-mobl.amr.corp.intel.com (HELO [10.254.92.34])
 ([10.254.92.34])
 by orsmga001.jf.intel.com with ESMTP; 02 Aug 2019 09:52:27 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-7-pierre-louis.bossart@linux.intel.com>
 <20190802115537.GI12733@vkoul-mobl.Dlink>
 <6da5aeef-40bf-c9bb-fc18-4ac0b3961857@linux.intel.com>
 <20190802155738.GR12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <884a13fc-08eb-10c9-de9c-50cf38ff533d@linux.intel.com>
Date: Fri, 2 Aug 2019 11:52:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802155738.GR12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 06/40] soundwire: intel: prevent
 possible dereference in hw_params
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



On 8/2/19 10:57 AM, Vinod Koul wrote:
> On 02-08-19, 10:16, Pierre-Louis Bossart wrote:
>>
>>
>> On 8/2/19 6:55 AM, Vinod Koul wrote:
>>> On 25-07-19, 18:39, Pierre-Louis Bossart wrote:
>>>> This should not happen in production systems but we should test for
>>>> all callback arguments before invoking the config_stream callback.
>>>
>>> so you are saying callback arg is mandatory, if so please document that
>>> assumption
>>
>> no, what this says is that if a config_stream is provided then it needs to
>> have a valid argument.
> 
> well typically args are not mandatory..
> 
>> I am not sure what you mean by "document that assumption", comment in the
>> code (where?) or SoundWire documentation?
> 
> The callback documentation which in this is in include/linux/soundwire/sdw_intel.h
> 

/**
  * struct sdw_intel_ops: Intel audio driver callback ops
  *
  * @config_stream: configure the stream with the hw_params
  */
struct sdw_intel_ops {
	int (*config_stream)(void *arg, void *substream,
			     void *dai, void *hw_params, int stream_num);
};

all parameters are mandatory really, not sure what you are trying to get at.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
