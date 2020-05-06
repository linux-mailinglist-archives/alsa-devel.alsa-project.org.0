Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76141C77A9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3950C178F;
	Wed,  6 May 2020 19:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3950C178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588785549;
	bh=DcJWLXvLlvZQGINW6ddP6KoaVYqK7I8DWUPMtCIs4KA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goDHPg7ri8e9SX0m9Rd0TyIK0bxx0N5zMu1n9Ngk3j6NnJ07Icuk9N+z+EuJRaxb7
	 kpOxsQFzZEoGygCeUcATNxn6WQemZF6zir6rIRZMESJHPDz06KKmBYeqStJCalmASJ
	 Y6F6ASnwBZ8smhyE3pgSfwLkAaZQal4Y4xyOJmSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F06BF80234;
	Wed,  6 May 2020 19:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7A70F80249; Wed,  6 May 2020 19:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2493DF800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2493DF800DF
IronPort-SDR: J99daio+VHmk1UTOPVw+ugKqTE+M1VTaRRhBpPbqZCBfPliYnM/16njAIyo+Ywzkhi5o6NzuEH
 f460jZfP3gnw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 10:17:05 -0700
IronPort-SDR: mmH8gbA2BjBKdjfEAqXJ+Q1LVjhtJ6DpPHTVLaW5EwFCvspgIrJAS4jf3YJj2iVJ7dD+TEnUGn
 Ti3vx+20J3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249824162"
Received: from sbhat1-mobl.amr.corp.intel.com (HELO [10.251.3.11])
 ([10.251.3.11])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 10:17:04 -0700
Subject: Re: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
To: Mark Brown <broonie@kernel.org>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
 <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
 <20200506162656.GH5299@sirena.org.uk>
 <DM6PR12MB2633B92B19B337A72B64D0B397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200506164345.GI5299@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2061b12a-cc4b-558f-6fc1-b6bf548e7603@linux.intel.com>
Date: Wed, 6 May 2020 12:17:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506164345.GI5299@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alex Deucher <alexdeucher@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
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



On 5/6/20 11:43 AM, Mark Brown wrote:
> On Wed, May 06, 2020 at 04:33:00PM +0000, Mukunda, Vijendar wrote:
> 
>>>>> +config SND_SOC_AMD_RENOIR_MACH
>>>>> +	tristate "AMD Renoir support for DMIC"
>>>>> +	select SND_SOC_DMIC
> 
>>>> there could be a missing dependency if GPIOLIB is not selected
>>> (SND_SOC_DMIC
>>>> depends on it).
> 
>>> That dependency is wrong, DMICs don't need GPIOs so while a given system
>>> might need DMIC the code should be fine with the stub gpiolib
>>> implementation.  It will mean it won't work on some boards though.
> 
>> For our current implementation, we don't have any GPIOLIB dependency.
>> We just need a generic DMIC driver which should provide codec dai for
>> sound card registration.
> 
> What you've got should be fine then, you should test with a !GPIOLIB
> build just to be sure though and ideally submit a patch fixing the
> SND_SOC_DMIC Kconfig.

if you don't care about gpios, then the only reason to use the dmic 
codec would be the modeswitch and wakeup delays properties. If you don't 
care then a dummy codec would be just fine.
