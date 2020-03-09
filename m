Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F072717EBB2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 23:08:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E648166D;
	Mon,  9 Mar 2020 23:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E648166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583791723;
	bh=qKaO45qNRTjtePak8BWTIQQIxxlCUMs8AB/O6l4v2ys=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPLLYPOsCIpSGJDLi8Ue3NniKbw2vpxiKsGk4qqQ137qZvLTrfPEIlYCEB2AI0hxC
	 X9K295yxL2G8WAENpzj8Kg+YV+zYWCSWMLnlXbHiGF+bCnRF8ClJn4aVFQYZrdxfoW
	 ratm3mbOTwgMD8dscQ8NaxIbd/H2obyTBSjbzgGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CED60F80227;
	Mon,  9 Mar 2020 23:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 437DDF8021D; Mon,  9 Mar 2020 23:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E93BF801EB
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 23:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E93BF801EB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 15:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="388711041"
Received: from bnkannan-mobl.amr.corp.intel.com (HELO [10.254.6.234])
 ([10.254.6.234])
 by orsmga004.jf.intel.com with ESMTP; 09 Mar 2020 15:06:04 -0700
Subject: Re: [PATCH 1/7] ASoC: Intel: Skylake: Remove superfluous chip
 initialization
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <20200305145314.32579-2-cezary.rojewski@intel.com>
 <ec7c8c11-80aa-d252-26e8-bf5d1ff95fb7@linux.intel.com>
 <8dc83af4-c4af-1bdd-5d59-f13598037f96@intel.com>
 <cd43e35c-bd32-37d0-7379-1113912d0fd5@linux.intel.com>
 <ee9d28f3-c793-e955-4c7b-cd75b4539631@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8b9c920c-79fe-bd11-eaac-cfb2e8006a20@linux.intel.com>
Date: Mon, 9 Mar 2020 13:41:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ee9d28f3-c793-e955-4c7b-cd75b4539631@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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



On 3/9/20 12:43 PM, Cezary Rojewski wrote:
> On 2020-03-09 17:48, Pierre-Louis Bossart wrote:
>>> DRM is quite a tree, you got to be more specific. Tested with i915=m 
>>> and DRM=m. I hope we mean the same thing when mentioning 'race'. 
>>> There is an obvious initialization race between hda bus drv and i915 
>>> which requires one to follow a tight operation order in order to not 
>>> lose i915 codec on hda link and thus be able to enumerate it properly.
>>
>> I meant CONFIG_DRM=m, yes, thanks for the clarification.
>>
>> With the DRM as module, it took more time to establish the 
>> communication. That's probably changed if we do all the inits in a 
>> workqueue now.
>>
> 
> So, does the DRM=m & i915=m test satisfy you?

Yes, that's all I wanted to confirm.

>>>
>>> On top of that, as you mentioned (by the link) this series addresses 
>>> missing DMIC configuration in conjunction with HDA +/- iDisp AND 
>>> shields against no-NHLT configuration. On Dell XPS 9350 lack on of 
>>> NHLT was the biggest problem - that's why I'd like that issue not to 
>>> be forgotten about.
>>
>> yes, but we don't want the driver to be auto-selected on SKL w/o 
>> DMICs, since it'd break existing devices who don't have a topology 
>> file installed.
> 
> My patch does not touch any of kconfig stuff. I'd prefer anything that 
> goes into disable/enable kconfig bucket to be split into a separate 
> patch. Don't believe SKL somehow gets automatically selected on these. 
> On the machines I've tested fixes with, legacy HDaudio driver was the 
> primary option/ drv.
