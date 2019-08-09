Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77C877DF
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 12:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24E9F1663;
	Fri,  9 Aug 2019 12:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24E9F1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565348052;
	bh=rsS4iXHxgOT6NKYhXQhfK6t9+VcuwSyvEUbVmjYetDw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T50zYfF8k6HE8qYo++RAqTkBDjgvskB7xs3qTpghBKSDmUhsCcIxNCunl14pKK6Jc
	 lUG04vKnbjsWlrotw0UzjvkK82WAGUwIkncyx9OsvICC0u8Pbam45I142wZ2zMamLa
	 7sILGZBGYiSllVov01TQRIhY79K+VLWsZGs4S79c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D14C7F803F3;
	Fri,  9 Aug 2019 12:52:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EC7CF803F3; Fri,  9 Aug 2019 12:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 889B4F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 12:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 889B4F800E4
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 727189FF0BB6B176E4EA;
 Fri,  9 Aug 2019 18:52:44 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 9 Aug 2019 18:52:39 +0800
To: Takashi Iwai <tiwai@suse.de>
References: <20190809095550.71040-1-yuehaibing@huawei.com>
 <s5hh86qhcyg.wl-tiwai@suse.de>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <da80a1fb-e897-e5a4-0809-2349a92279bb@huawei.com>
Date: Fri, 9 Aug 2019 18:52:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <s5hh86qhcyg.wl-tiwai@suse.de>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, yang.jie@linux.intel.com,
 Takashi Iwai <tiwai@suse.com>, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: Add missing include file
	hdac_hda.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019/8/9 18:04, Takashi Iwai wrote:
> On Fri, 09 Aug 2019 11:55:50 +0200,
> YueHaibing wrote:
>>
>> Building with SND_SOC_SOF_HDA_AUDIO_CODEC fails:
>>
>> sound/soc/sof/intel/hda-bus.c: In function sof_hda_bus_init:
>> sound/soc/sof/intel/hda-bus.c:16:25: error: implicit declaration of function
>>  snd_soc_hdac_hda_get_ops; did you mean snd_soc_jack_add_gpiods? [-Werror=implicit-function-declaration]
>>  #define sof_hda_ext_ops snd_soc_hdac_hda_get_ops()
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: d4ff1b3917a5 ('ASoC: SOF: Intel: Initialize hdaudio bus properly")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Damn, it seems another oversight.
> 
> And now the inclusion in sound/soc/sof/intel/hda.c is superfluous,
> too, so we should just move like
> 
> diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
> index 0caec3a070d3..2b384134a3db 100644
> --- a/sound/soc/sof/intel/hda-bus.c
> +++ b/sound/soc/sof/intel/hda-bus.c
> @@ -11,6 +11,9 @@
>  #include <sound/hdaudio.h>
>  #include "../sof-priv.h"
>  #include "hda.h"
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
> +#include "../../codecs/hdac_hda.h"
> +#endif
>  
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
>  #define sof_hda_ext_ops	snd_soc_hdac_hda_get_ops()
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 7ca27000c34d..dd6c8ad62b3e 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -23,9 +23,6 @@
>  #include <sound/sof/xtensa.h>
>  #include "../ops.h"
>  #include "hda.h"
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
> -#include "../../codecs/hdac_hda.h"
> -#endif
>  
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
>  #include <sound/soc-acpi-intel-match.h>
> 
> 
> Could you check whether this works instead?

It works well, I can send v2 using this, Thanks!

> 
> 
> BTW, the inclusion of "../../codecs/hdac_hdac.h" is very ugly...
> In general if a header file is referred from another driver, it should
> be in a more public place under include/sound.  If any, we can create
> a subdirectory like include/sound/codecs.
> 

Yes, this can be done in another patch.

> 
> thanks,
> 
> Takashi
> 
> .
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
