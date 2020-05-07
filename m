Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B521C94EA
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 17:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10DD91831;
	Thu,  7 May 2020 17:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10DD91831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588864998;
	bh=rJQ9hJm6PWscvfwEnHYeRUxYOGW/onGbT7I5EAclAic=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSxm7d9GNQfLV3cSEGyyRMCZfjLPgsVFxftppT6+dGUwz1IF2jxLi8bMaZoHL4cUY
	 TEPNPiyUFpm7nF5ckNOgK8mY9KMgvbVtm9J8jrKwwjEBtzbFeJIAkoIykfX4xZrISj
	 GrWBYMn+O3XoIkMUIHO5V5bI6zTqGyfX6w3WmnYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28A89F80162;
	Thu,  7 May 2020 17:21:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C322AF8015F; Thu,  7 May 2020 17:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8626FF800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 17:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8626FF800AD
IronPort-SDR: MrgmjMn16+RobtJJvoGjGc1nbI0bEVDCFhcHvVexFELwZHny64jSVKSpQ3ZmjeIemDjtyWTEHc
 qTNj70mqKV/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:21:14 -0700
IronPort-SDR: 5J29ruaGMH5XGJKXxGEC0MWsiJM/hQXOVxoqjSi2JMDxyyWqzlWkB+dmWSUDGHMfJFOph70X3w
 4m87lXcqArHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="407671044"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.26.86])
 ([10.213.26.86])
 by orsmga004.jf.intel.com with ESMTP; 07 May 2020 08:21:10 -0700
Subject: Re: [PATCH 2/2] ASoC: Intel: Use readq to read 64 bit registers
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20200507133405.32251-1-amadeuszx.slawinski@linux.intel.com>
 <20200507133405.32251-2-amadeuszx.slawinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <2a96904f-9e11-42a6-5c7f-61e9d614e62d@intel.com>
Date: Thu, 7 May 2020 17:21:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200507133405.32251-2-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On 2020-05-07 15:34, Amadeusz Sławiński wrote:
> In order to fix issue described in:
> "ASoC: Intel: sst: ipc command timeout"
> https://patchwork.kernel.org/patch/11482829/
> 
> use readq function, which is meant to read 64 bit values from registers.
> On 32 bit platforms it falls back to two readl calls.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Reported-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/common/sst-dsp.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/common/sst-dsp.c b/sound/soc/intel/common/sst-dsp.c
> index ec66be269b69..36c077aa386e 100644
> --- a/sound/soc/intel/common/sst-dsp.c
> +++ b/sound/soc/intel/common/sst-dsp.c
> @@ -10,7 +10,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/delay.h>
>   
>   #include "sst-dsp.h"
> @@ -34,16 +34,13 @@ EXPORT_SYMBOL_GPL(sst_shim32_read);
>   
>   void sst_shim32_write64(void __iomem *addr, u32 offset, u64 value)
>   {
> -	memcpy_toio(addr + offset, &value, sizeof(value));
> +	writeq(value, addr + offset);
>   }
>   EXPORT_SYMBOL_GPL(sst_shim32_write64);
>   
>   u64 sst_shim32_read64(void __iomem *addr, u32 offset)
>   {
> -	u64 val;
> -
> -	memcpy_fromio(&val, addr + offset, sizeof(val));
> -	return val;
> +	return readq(addr + offset);
>   }
>   EXPORT_SYMBOL_GPL(sst_shim32_read64);
>   
> 

Looks good, thanks Amadeo.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
