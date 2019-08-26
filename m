Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82F9D731
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 22:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD92167A;
	Mon, 26 Aug 2019 22:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD92167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566850008;
	bh=+18mWDMSRtKku/V85ay0mawOxzV551RcNu+zDkH9JbE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tG4tTdT0OGE/2Bhc/cW3kOoZLcyf5Ml7FzM2lKdtD9SlK5mqcXMfdKlBaS/b5ped+
	 LE9nymf3lLTG6sypLtnSFfMHSAD10OM3NFePgCIUcslXiQTbbLCCiry5Pj3USVCiu+
	 fUwt2DhHSpYlEPQwkdBCn9b02PLjWNYiVRVw9ZJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BDF6F802BC;
	Mon, 26 Aug 2019 22:05:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9649CF80362; Mon, 26 Aug 2019 22:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6923CF801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 22:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6923CF801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 13:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="331588105"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.150])
 ([10.252.26.150])
 by orsmga004.jf.intel.com with ESMTP; 26 Aug 2019 13:03:30 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-30-cezary.rojewski@intel.com>
 <f025c4c4-4987-e3c0-302f-1ee47dba60ac@linux.intel.com>
 <1d289b44-cd68-bee5-498b-953186d99150@intel.com>
 <19ee20ec-2b29-639b-6181-05f4582a8f18@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <58e4a176-3f91-ab5f-1cc8-48a5b4c9bc52@intel.com>
Date: Mon, 26 Aug 2019 22:03:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <19ee20ec-2b29-639b-6181-05f4582a8f18@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 29/35] ASoC: Intel: Skylake: Flip SST
 initialization order
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

On 2019-08-26 18:39, Pierre-Louis Bossart wrote:
> 
> 
> On 8/24/19 5:54 AM, Cezary Rojewski wrote:
>> On 2019-08-23 22:18, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 8/22/19 2:04 PM, Cezary Rojewski wrote:
>>>> To this date Skylake SST were following ill flow of initialization by
>>>
>>> 'ill' as in 'sick'? that's probably a bit strong and judgmental?
>>> or is this a typo?
>>>
>>
>> ill seems like a perfect opposite of healthy, ain't it? Because 
>> certainly, the initialization pattern observed in /skylake is 
>> everything but healthy.
> 
> I don't know what 'healthy' means either in this context.
> 
> s/ill/incorrect/?
> 

In essence, most of what is required is actually done even in existing 
/skylake init. How it is done leaves a lot to be desired, though. 
Initialization is cleaned up to improve code quality and make it look 
cohesive - removal of duplications, usage of sst-framework functions and 
so on.

Followup segments - including but not limited to power-management - 
touch this stuff quite a bit. With initialization updated, each 
power-management patch fixes single spot rather than 3 (skl-sst, 
bxt-sst, cnl-sst). Should probe more readable and easy to review.

That's why I described it via 'ill'.
Although I do agree, could have chosen a better description.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
