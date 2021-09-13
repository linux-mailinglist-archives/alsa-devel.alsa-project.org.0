Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F96409D6F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 21:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780131797;
	Mon, 13 Sep 2021 21:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780131797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631562652;
	bh=a24FDyzqX7d4tIye33bktSX81PVtTRio6j6km2SH8ao=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LT7hxvEym8RoaaGalYBDYXkG20cYlEoeGvnomO2Zi5JmM0pyer+/VgaDtyELRpCiX
	 1XGvKUSTiy5je75LSXX/KsJCS/1yTosCpOMapvRr/E2sgF5eUeZevFFKG3RG0uYybv
	 q7yEk+dzmx54abLAfeIuXzC9aAnDN15P351iYedo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E01EF802E8;
	Mon, 13 Sep 2021 21:49:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41025F8027C; Mon, 13 Sep 2021 21:49:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AF3BF80128
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 21:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF3BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="oEi+EQkT"
Received: by mail-ot1-x32d.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso14950401otp.1
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=yw1b9fZ1lnCtG8cegvzmoiB8uewJHdwQglsWdbmU568=;
 b=oEi+EQkTL3cI5BWuIOLe986IYt7QuXhKHrWvB2PKhVGBwtcewfViIp+vKPLd5Jh8Ga
 +SQebu6ypyjpH7bVj9+T7Y+zTjLLpfdff0Gg278iQWfJvD5izP55iv4Q3ODx1PMWuD7r
 aw8u/G3gjbhXzPyaBPtLRqpJD2AUwiWN1C07M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=yw1b9fZ1lnCtG8cegvzmoiB8uewJHdwQglsWdbmU568=;
 b=4A6JPYvYj8xscpuz3caeVz5Xm2GPab98wnS67ISbzwR95YOUb+D9yHPBhcILcGxmz4
 /DHDGlUO2je3LSZgmqK3XxVaKUMEUtxXx42EOy2fWOZmYMK7KXcZKCo6ymgGgEeGuMh+
 qpQiBK9hknuMQa341OWnrVzmTWrMUDytY9hINItmJi9g6tfwpqBMQZ+Uaw/ZoXCfmioc
 IOFLV9ct8uEuYZtBi6JgsVjdHlNhxXayOcv8ZnXyJtpXzNCW5A/B5bP+M/3ZENNOEDw5
 pfQ/ThLMOlaRfJ9PdX2KEDltzWG0MNlmwxXaWyGqoeLPpB7fMBJm40HLk/QM7HOaEoc+
 2jcg==
X-Gm-Message-State: AOAM533ThwTlJBg5bOcZjcc0IyoQguKPtgUfsD24CMP1+tbyeopInbvS
 8JujSmR8ZWD9HcFpYerL3M+jqCmC8/V7nGG06+m6PQ==
X-Google-Smtp-Source: ABdhPJz3o79dJM5zC1pjJ+LQMjOTyr1vev2/NGN4jY/c2ZfYnAk+xuiWK8/sXZPYqgI/zUyQOWM/DC8C0/FJ2jSbiDw=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr11183152ote.126.1631562564916; 
 Mon, 13 Sep 2021 12:49:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 12:49:24 -0700
MIME-Version: 1.0
In-Reply-To: <1631539062-28577-3-git-send-email-srivasam@codeaurora.org>
References: <1631539062-28577-1-git-send-email-srivasam@codeaurora.org>
 <1631539062-28577-3-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 13 Sep 2021 12:49:24 -0700
Message-ID: <CAE-0n50i9rm6fcuyjCCPXjtxTyXwAiRVx91dXT4BDpbGA-tKjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: SC7280: Add machine driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2021-09-13 06:17:42)
> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
> new file mode 100644
> index 0000000..906910c
> --- /dev/null
> +++ b/sound/soc/qcom/sc7280.c
> @@ -0,0 +1,343 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> +//
> +// sc7280.c -- ALSA SoC Machine driver for sc7280
> +
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>

Looks like the include should be <linux/input.h> instead. I see that
practically no other code in the kernel is including the uapi header as
it's for userspace, not kernel. The uapi header is included in input.h
though so it's not actually all that different.

> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +
> +#include "../codecs/wcd938x.h"
> +#include "common.h"
> +#include "lpass.h"
> +
[...]
> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card;
> +       struct sc7280_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       struct snd_soc_dai_link *link;
> +       int ret, i;
> +
> +       /* Allocate the private data */

This comment is worthless.

> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card = &data->card;
> +       snd_soc_card_set_drvdata(card, data);
> +
> +       card->owner = THIS_MODULE;
> +       card->driver_name = "SC7280";
> +       card->dev = dev;
> +
> +       ret = qcom_snd_parse_of(card);
> +       if (ret)
> +               return ret;
> +
> +       for_each_card_prelinks(card, i, link) {
> +               link->init = sc7280_init;
> +               link->ops = &sc7280_ops;
> +       }
Nitpick: Newline here.

> +       return devm_snd_soc_register_card(dev, card);
> +}
> +
