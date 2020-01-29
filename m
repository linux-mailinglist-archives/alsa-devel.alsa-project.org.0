Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBAC14C80F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 10:28:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F051672;
	Wed, 29 Jan 2020 10:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F051672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580290135;
	bh=qLnoB2heW4xaMEhJ39S1xiDpQzgsaWb7fVsmG6Knr7g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bQ6+B8D0hm0bnuW7fHkGCMsWCE1iVbGhKEuzQ6eN19ZmTNZWBuw+yeEsmd1F0hgnl
	 xUiY2nnzzYaDkLj+QRvbUTftz/lqUX3W5zKUp9g6hE/0rbE/T8w0Luy2nBH538l+YF
	 4E+MpHogab+wG6inj4cwR1Y3X1SrPW0QpnzPfBwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0674F80082;
	Wed, 29 Jan 2020 10:27:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04FBCF8021E; Wed, 29 Jan 2020 10:27:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14537F80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 10:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14537F80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 01:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,377,1574150400"; d="scan'208";a="261742693"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2020 01:24:25 -0800
To: Daniel Baluta <daniel.baluta@nxp.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-12-cezary.rojewski@intel.com>
 <21b4a2ecdcf60bca06d7c82c8252bfd2a8ebfd5c.camel@nxp.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <60090086-8f43-5cfe-0754-4c0b1d71da6a@intel.com>
Date: Wed, 29 Jan 2020 10:24:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <21b4a2ecdcf60bca06d7c82c8252bfd2a8ebfd5c.camel@nxp.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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

On 2020-01-29 09:04, Daniel Baluta wrote:
> I'm not really happy with the changes inside pcm.c
> 
> 
> On Tue, 2020-01-28 at 11:43 +0100, Cezary Rojewski wrote:
>> --- a/sound/soc/sof/pcm.c
>> +++ b/sound/soc/sof/pcm.c
>> @@ -756,6 +756,15 @@ static void sof_pcm_remove(struct
>> snd_soc_component *component)
>>          snd_soc_tplg_component_remove(component,
>> SND_SOC_TPLG_INDEX_ALL);
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
>> +#include "compress.h"
>> +
>> struct snd_compr_ops sof_compressed_ops = {+
>> +       .copy           = sof_probe_compr_copy,
>> +};
>> +EXPORT_SYMBOL(sof_compressed_ops);
>> +#endif
>> +
> 
> Maybe call this structure sof_probe_compressed ops. Othwerwise you will
> conflict with the real sof_compressed_ops.
> 
> 
>>   void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
>>   {
>>          struct snd_soc_component_driver *pd = &sdev->plat_drv;
>> @@ -775,7 +784,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev
>> *sdev)
>>          pd->trigger = sof_pcm_trigger;
>>          pd->pointer = sof_pcm_pointer;
>>   
>> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
>>          pd->compr_ops = &sof_compressed_ops;
>>   #endif
>>          pd->pcm_construct = sof_pcm_new;
>>
> 
> Here you are breaking the non-existent yet compressed support. I would
> leave:
> 
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
>           pd->compr_ops = &sof_compressed_ops;
> #endif
> 
> and only override compr_ops if SND_SOC_SOF_DEBUG_PROBES is set like
> this:
> 
> 
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
>           pd->compr_ops = &sof_probe_compressed_ops;
> #endif
> 
> Also does this mean we cannot support both "real" compressed sound card
> and probes in the same time?
> 
> 

Thanks for the review Daniel!

Tthe example you provided is not very clear to me - same condition is 
added for both assignments, but I'll try to answer your question.

Existing "sof_compressed_ops" don't even exist, as you said it yourself 
so nothing is lost. Changes within pcm.c are gated by _DEBUG_PROBES 
anyway so the solution is actually very clean.

While DAI can have different cops, platform driver cannot. I'm aware of 
the problem but till actual compress support for SOF comes out, minimal, 
probe-only changes were a better choice IMHO. After all, that's not a 
problem to make this code smarter in the future - not a farseer though, 
can't predict what you're going to add for SOF-compr :)

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
