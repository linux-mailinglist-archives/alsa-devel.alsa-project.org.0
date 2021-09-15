Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4140C41D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 13:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C47FA1836;
	Wed, 15 Sep 2021 13:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C47FA1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631704030;
	bh=tKb1CLsakMxOOQ2GYuE+k3I3M8ieERR0Kv+Y9YYM5vI=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRrkxUFGfNnIa1TKj2zQ8XD6ZXbbvjgdol/H04RdacEnV4uF4ZZeInj1bdtYe/+bD
	 czyzkPS/Pbc7Q1pEzlKuOeIh483pME4B6XKnLxksXZvy3m16KZOVywi3ZuAXQbQkqi
	 VRmxI/kV+MWWDBJLzTd7Y2N0tp0wuxcGB6ID23qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D94FF80117;
	Wed, 15 Sep 2021 13:05:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 144F7F8027C; Wed, 15 Sep 2021 13:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06713F800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 13:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06713F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="frTU9ozR"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631703950; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=oFYOphu9er1kSJGp6Y6sVZhQq4tL7St6PiF6qEExbaw=;
 b=frTU9ozRkFFLHtYHtkKOK2BhVvSHwhO5WL4TQyqhAtJAKKgT/6/ni2PVtD8RTXScdQKVDmr3
 0vak0h0Ytos2eUW6JvrkHQSM0IxuiVaI9VYx7NKfu7HXKZilYlVMKuEKd6+Xy+s9LxJGwPWZ
 rNvVs7xpvc/vpRMhEhWCH/l1HSg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6141d379ec62f57c9a67b2e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Sep 2021 11:05:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BE7FFC4361A; Wed, 15 Sep 2021 11:05:27 +0000 (UTC)
Received: from [10.242.137.170] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 54B07C4338F;
 Wed, 15 Sep 2021 11:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 54B07C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 2/2] ASoC: qcom: SC7280: Add machine driver
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1631539062-28577-1-git-send-email-srivasam@codeaurora.org>
 <1631539062-28577-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n50i9rm6fcuyjCCPXjtxTyXwAiRVx91dXT4BDpbGA-tKjg@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <7e179a64-2fe8-e761-c247-90ba55fcba82@codeaurora.org>
Date: Wed, 15 Sep 2021 16:35:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n50i9rm6fcuyjCCPXjtxTyXwAiRVx91dXT4BDpbGA-tKjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 9/14/2021 1:19 AM, Stephen Boyd wrote:

Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2021-09-13 06:17:42)
>> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
>> new file mode 100644
>> index 0000000..906910c
>> --- /dev/null
>> +++ b/sound/soc/qcom/sc7280.c
>> @@ -0,0 +1,343 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> +//
>> +// sc7280.c -- ALSA SoC Machine driver for sc7280
>> +
>> +#include <linux/gpio.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <sound/core.h>
>> +#include <sound/jack.h>
>> +#include <sound/pcm.h>
>> +#include <sound/soc.h>
>> +#include <uapi/linux/input-event-codes.h>
> Looks like the include should be <linux/input.h> instead. I see that
> practically no other code in the kernel is including the uapi header as
> it's for userspace, not kernel. The uapi header is included in input.h
> though so it's not actually all that different.
Okay Will change accordingly!!!
>
>> +
>> +#include <dt-bindings/sound/sc7180-lpass.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
>> +
>> +#include "../codecs/wcd938x.h"
>> +#include "common.h"
>> +#include "lpass.h"
>> +
> [...]
>> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
>> +{
>> +       struct snd_soc_card *card;
>> +       struct sc7280_snd_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct snd_soc_dai_link *link;
>> +       int ret, i;
>> +
>> +       /* Allocate the private data */
> This comment is worthless.
Okay. Will remove it.
>
>> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       card = &data->card;
>> +       snd_soc_card_set_drvdata(card, data);
>> +
>> +       card->owner = THIS_MODULE;
>> +       card->driver_name = "SC7280";
>> +       card->dev = dev;
>> +
>> +       ret = qcom_snd_parse_of(card);
>> +       if (ret)
>> +               return ret;
>> +
>> +       for_each_card_prelinks(card, i, link) {
>> +               link->init = sc7280_init;
>> +               link->ops = &sc7280_ops;
>> +       }
> Nitpick: Newline here.
Okay.
>
>> +       return devm_snd_soc_register_card(dev, card);
>> +}
>> +

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

