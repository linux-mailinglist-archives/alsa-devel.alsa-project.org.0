Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B009314EC94
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 13:40:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5986A16A9;
	Fri, 31 Jan 2020 13:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5986A16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580474426;
	bh=ui8wPAHicR37d68y9OoD0itDeOFV2sylHvjqoW5ywS4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CRQfTpGlZpZQIlvxhR7eDs6M2x1zCW1iwohoMnqomWsYZUbBlqjsxB6t98ra70/ud
	 C84j6OzbMStohU1h2eUr2xCfIJnVFx8JPrtTdAUdCDBxOGhJCPwsIeWEfpbYK06gPK
	 yjHV1AAg7r7DxsOlgQLACq/T4SWfsh8f9aybUbNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D11F80229;
	Fri, 31 Jan 2020 13:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4F2CF80082; Fri, 31 Jan 2020 13:35:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C70EF80082
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 13:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C70EF80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 04:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="262532994"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2020 04:34:55 -0800
To: Daniel Baluta <daniel.baluta@nxp.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-12-cezary.rojewski@intel.com>
 <21b4a2ecdcf60bca06d7c82c8252bfd2a8ebfd5c.camel@nxp.com>
 <60090086-8f43-5cfe-0754-4c0b1d71da6a@intel.com>
 <59777313561e5ec6f5a3a8a65e315375a3e3bf13.camel@nxp.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <d1382115-7ddc-f3bd-ce52-4bc819326962@intel.com>
Date: Fri, 31 Jan 2020 13:34:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <59777313561e5ec6f5a3a8a65e315375a3e3bf13.camel@nxp.com>
Content-Language: en-US
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "daniel.baluta@gmail.com" <daniel.baluta@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 11/11] ASoC: SOF: Intel: Add Probe
 compress CPU DAIs
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

On 2020-01-29 10:46, Daniel Baluta wrote:
> On Wed, 2020-01-29 at 10:24 +0100, Cezary Rojewski wrote:
>>
>> Thanks for the review Daniel!
>>
>> Tthe example you provided is not very clear to me - same condition
>> is
>> added for both assignments, but I'll try to answer your question.
>>
>> Existing "sof_compressed_ops" don't even exist, as you said it
>> yourself
>> so nothing is lost. Changes within pcm.c are gated by _DEBUG_PROBES
>> anyway so the solution is actually very clean.
>>
>> While DAI can have different cops, platform driver cannot. I'm aware
>> of
>> the problem but till actual compress support for SOF comes out,
>> minimal,
>> probe-only changes were a better choice IMHO. After all, that's not
>> a
>> problem to make this code smarter in the future - not a farseer
>> though,
>> can't predict what you're going to add for SOF-compr :)
>>
> 
> Indeed, we can make the code smarter later but I want to do the code
> cleaner now.
> 
> I think I had a copy paste error when providing the example.
> 
> So, my proposal is to override the platform driver compr_ops field
> with probe compressed ops when CONFIG_SND_SOC_SOF_DEBUG_PROBES is set.
> 
> The code could look like this in the end:
> 
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
>            pd->compr_ops = &sof_compressed_ops;
> #endif
> 
> /* Add a comment explaining that we are doing override in case of
> probes */
> 
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
>            pd->compr_ops = &sof_probe_compressed_ops;
> #endif
> 
> Also, I think there is no need to define the probe compressed ops
> inside pcm.c
> 
> So, instead of
> 
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
> #include "compress.h"
> 
> struct snd_compr_ops sof_compressed_ops = {
>       .copy           = sof_probe_compr_copy,
> };
> EXPORT_SYMBOL(sof_compressed_ops);
> #endif
> 
> We can do:
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
> extern snd_compr_ops sof_probe_compressed_ops;
> #endif
> 
> or even better include a header with the declaration.
> 
> And add the definition of sof_probe_compressed_ops would be somewhere
> in the compressed probe file.
> 
> 

Your comments have been addressed in v4. Non-existant cops usage have 
been re-added and is now overridden by probes when enabled. 
sof_probe_compressed_ops declaration moved to compress.c file as requested.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
