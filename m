Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 971993DF0A7
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 16:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E661828;
	Tue,  3 Aug 2021 16:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E661828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628002167;
	bh=W7xGruoFgagqOczxKi+Dlt1wvQUHqlsgsAqJYXjvIDk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fu43SvhFDnTCQVVdFoiKQKLPUyE5ENwt28VezagdK1mrVun3ndrtTlVMe8vsbRQMC
	 p0gTOhT/j0nQdgHm8pnoAyro9sf52Qb4gG3cBMVg4zix3IYqUayvhG9ysvuobQdOV9
	 qBhjixG8iwTluvtRxTeOCI94qbWcHeH+Hh39ppgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D4AF8032C;
	Tue,  3 Aug 2021 16:47:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECC62F80095; Tue,  3 Aug 2021 16:47:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 062F6F80095
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 16:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 062F6F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aj6EY8cT"
Received: by mail-wm1-x332.google.com with SMTP id u15so12646671wmj.1
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zXJUlnoBGlagmYAr+XexyzecT51mX+H3pwaFkbjlB08=;
 b=aj6EY8cTMKDszh3T98BODTFy9mWLgriGn/i2VCnHFI8ZxCeJe5CMvI2KXDc3T5N+Fn
 F1MhInPfqilH/ul4w1jolbeKqPimOJds2qHAZR7gxpkeK+aVCYTUiKh9UxnHIrStJBaM
 BPEc1DzNzvA9lOHcXdTEN+sN/ajPpQQMpbrRxfmxTkhalKYNyOBFLP/8QLnqYUSdJw3V
 UKX2oHlCOg70vWkKVD+cn8VknSy2MBXqV4BoX2LH1JH1XmCAgYG6DymjIQldlgVSsDw3
 f06R6edeoBLjXygCYcERSbj66//u0oBei3ty2fF81gB+0qUtzQ56cmMQaVEmi5xr5n/W
 c55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zXJUlnoBGlagmYAr+XexyzecT51mX+H3pwaFkbjlB08=;
 b=Gyy8Iu/+uyz7Vne9qk06Ka9+pLhtKHWmdtKn4KIhNX0HSod8Hj0tacE+o5u1TLgoWQ
 w9wy/PepQ4fn4+AYw8SFHdlJO9iG67JgM0FCDpLjWcyH8dCJAOsTG417E+l7A7f7vHVo
 vs8pAQVfBaYKdT/uqlJ8NlF4jUPbDfE1iNqu5k4Tdofl4lOEoljSbNDO/RpS/bBx96+q
 8yiehXWc+vaDUDmqUme3erDe38EjVhrhLRtQ8cfSFP2uUK1uvy5LgfMiufhaG8hAiKku
 mgA/Jpxdr2b8uZQcymyPQTsfOKXqQzXxXnuha7JTsCtXdC2wbEE9gNwnmeP/Z1nRum2N
 PPAQ==
X-Gm-Message-State: AOAM532mmSfbHNDTeIhCc66iyH46Dn93xFdl+LbDAM86yL6r5nxumnXq
 EELq6fTp3klsEqK/qkMGjATlDw==
X-Google-Smtp-Source: ABdhPJycOIACXhoY9Jt9L7t4p0koUKqZn+NXs/WRiqFAKK5i/TARsy/DjyqzpSibm8xAmLOwywcXNQ==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr22655586wmj.91.1628002069739; 
 Tue, 03 Aug 2021 07:47:49 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id x21sm2754394wmi.46.2021.08.03.07.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 07:47:49 -0700 (PDT)
Subject: Re: [PATCH v3 16/20] ASoC: qdsp6: audioreach: add topology support
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, bjorn.andersson@linaro.org,
 broonie@kernel.org, robh@kernel.org
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-17-srinivas.kandagatla@linaro.org>
 <05f85ed8-01ce-632b-c744-3fe8995bd17a@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <52c3078b-3d80-3802-ad58-0574d6ce3edc@linaro.org>
Date: Tue, 3 Aug 2021 15:47:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <05f85ed8-01ce-632b-c744-3fe8995bd17a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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


Thanks Amadeusz for quick review,

On 03/08/2021 15:21, Amadeusz Sławiński wrote:
> On 8/3/2021 2:54 PM, Srinivas Kandagatla wrote:
>> Add ASoC topology support in audioreach
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
> 
> ...
> 
>> +
>> +/* DAI Tokens */
>> +#define AR_TKN_DAI_INDEX            1
>> +/* SUB GRAPH Tokens */
>> +#define AR_TKN_U32_SUB_GRAPH_INSTANCE_ID    2
>> +#define AR_TKN_U32_SUB_GRAPH_PERF_MODE        3
>> +#define AR_TKN_U32_SUB_GRAPH_DIRECTION        4
>> +#define AR_TKN_U32_SUB_GRAPH_SCENARIO_ID    5
>> +
>> +/* Container Tokens */
>> +#define AR_TKN_U32_CONAINER_INSTANCE_ID        100
>> +#define AR_TKN_U32_CONAINER_CAPABILITY_ID    101
>> +#define AR_TKN_U32_CONAINER_STACK_SIZE        102
>> +#define AR_TKN_U32_CONAINER_GRAPH_POS        103
>> +#define AR_TKN_U32_CONAINER_PROC_DOMAIN        104
> 
> typo in all of the above and in comment documenting them
> AR_TKN_U32_CONTAINER_ *
> 
.. Not sure how i missed this one.. Its not fixed.

> 
>>   #define APM_AUDIO_DRV_NAME "q6apm-audio"
>> diff --git a/sound/soc/qcom/qdsp6/topology.c 
>> b/sound/soc/qcom/qdsp6/topology.c
>> new file mode 100644
>> index 000000000000..409e19486d57
>> --- /dev/null
>> +++ b/sound/soc/qcom/qdsp6/topology.c
>> @@ -0,0 +1,1114 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2020, Linaro Limited
>> +
>> +#include <sound/soc.h>
>> +#include <sound/soc-dapm.h>
>> +#include <sound/pcm.h>
>> +#include <sound/control.h>
>> +#include <sound/asound.h>
>> +#include <linux/firmware.h>
>> +#include <sound/soc-topology.h>
>> +#include <sound/soc-dpcm.h>
>> +#include <uapi/sound/snd_ar_tokens.h>
>> +#include <linux/kernel.h>
>> +#include <linux/wait.h>
>> +#include "q6apm.h"
>> +#include "audioreach.h"
>> +
>> +struct snd_ar_control {
>> +    u32 sgid; /* Sub Graph ID */
>> +    struct snd_soc_component *scomp;
>> +};
>> +
>> +static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(
>> +                    struct q6apm *apm, uint32_t graph_id,
>> +                    bool *found)
>> +{
>> +    struct audioreach_graph_info *info;
>> +    int ret;
>> +
>> +    spin_lock(&apm->lock);
>> +    info = idr_find(&apm->graph_info_idr, graph_id);
>> +    spin_unlock(&apm->lock);
>> +
>> +    if (info) {
>> +        *found = true;
>> +        return info;
>> +    }
>> +
>> +    *found = false;
>> +    info = kzalloc(sizeof(*info), GFP_KERNEL);
>> +    if (!info)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +
>> +    INIT_LIST_HEAD(&info->sg_list);
>> +    spin_lock_init(&info->sg_list_lock);
>> +
>> +    spin_lock(&apm->lock);
>> +    ret = idr_alloc(&apm->graph_info_idr, info, graph_id,
>> +            graph_id + 1, GFP_ATOMIC);
>> +    spin_unlock(&apm->lock);
>> +
>> +    if (ret < 0) {
>> +        dev_err(apm->dev, "Failed to allocate Graph ID (%x)\n", 
>> graph_id);
>> +        return ERR_PTR(ret);
>> +    }
> need to free info here?

All such instances are now fixed, thanks for spotting these!

--srini
