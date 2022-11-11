Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08295625FAB
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 17:39:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B13167C;
	Fri, 11 Nov 2022 17:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B13167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668184752;
	bh=1JFCEKXqpMb8zeKEah1qjuqdfqNiwnPKTZlaiCBRAUA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cv+d3BYflOOqLwAwA6ObBgimxkiokdsy5oecY8XqxkD0RZrGkEdipjR3fTyomHLAF
	 uRmwUDQldf77Z/f1tiXXdt1bHCEgSwL2/sUNmtDol9COBB4QcZR8LMXAR64AFAx8nJ
	 Lk7zXUlLXqPWopdgbbSwtg7LAACbdjtUCqXcJR+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42949F804AB;
	Fri, 11 Nov 2022 17:38:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 176F2F804AB; Fri, 11 Nov 2022 17:38:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C69AAF80162
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 17:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C69AAF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oZCyUTC9"
Received: by mail-wm1-x32f.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so3482938wmb.0
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JaZVtFPPaLB1/chqLl5fXGZ9i1oLa0XpBUVRRJxd9cI=;
 b=oZCyUTC9OW+Gao72Y6/Jy0WiGm29zM05RoR72zuCvODktorROYHO90I0wv148pxUJ3
 AK61RQ5U62x4Rnv5wOt/kwbKT5vkWIIPdCRPXskn4CArmJgmYxukx8Hh8N76iuaCMrd7
 MW4BNKE8I6AEM2OdLf7LnD4v5v7FD0+MyVozjtociVgHUjoblN1xGqLciTssf0vn8yCz
 qZZlviM95ZPISMODwyEEmZBjsaEbNadI2eRHZwsGxZK/LPmRtWGtB2Pg6WvIsgmsaEbR
 hMnqAU42OrbaqPR7sqSKj7H1sU3uW9peKaVCDtg0ihVjd3g0A3w17vX2/J5XbztGcgsE
 fnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JaZVtFPPaLB1/chqLl5fXGZ9i1oLa0XpBUVRRJxd9cI=;
 b=TY5FdH2vinJ99F2gTZwHCdwJVwcCwzkc2IYgFxoV8NGaUoTIb9VeubfeO8iIaI6E48
 v/lZ3T5FMNX0/t/D/mk5Tv6NJd9/0palrqkNer3zKnGHQybM+LMt732QS4Q8wKd+o2fh
 +CLHsl80iUMU/XpDbjVRWabPVTM4AqkenATaoSiexAyk234CUufCmCSHKDWhY7+LxU29
 5BYhyIjmPU2kOpeAL4UjKrmJxIoUftZSkz+EfzMNAhlpSfKbANFjE5B3wesfWu2UnejF
 ZnAsEPO/Yl7U0loyWQQabazd4KdpWgojdAZh497Ocg4KVwubX606tQt6qPdPygGLCUaN
 ildQ==
X-Gm-Message-State: ANoB5pmbgR1mE+ISmpL6XmPCFh3pOZvuNIEiVFgJm47gIkvv7DSPwqKQ
 QnD5Surs89TMnF5MMP/cFB9Byg==
X-Google-Smtp-Source: AA0mqf6HUq6BrzK2oEKsXnAtk4vpxLbFgDJjdJOF9mPjgwAHthV3NwQdmBi7OGwhXnGVxnyF073M6Q==
X-Received: by 2002:a05:600c:204d:b0:3cf:a3c4:59b3 with SMTP id
 p13-20020a05600c204d00b003cfa3c459b3mr1854849wmg.198.1668184686366; 
 Fri, 11 Nov 2022 08:38:06 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 w9-20020adfee49000000b00228cd9f6349sm2265623wro.106.2022.11.11.08.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 08:38:05 -0800 (PST)
Message-ID: <49722205-bd5b-8241-d2ff-7eb956e05ec1@linaro.org>
Date: Fri, 11 Nov 2022 16:38:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] ASoC: codecs: wsa883x: use correct header file
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221108001829.5100-1-rdunlap@infradead.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221108001829.5100-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>
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



On 08/11/2022 00:18, Randy Dunlap wrote:
> Fix build errors when GPIOLIB is not set/enabled:
> 
> ../sound/soc/codecs/wsa883x.c: In function 'wsa883x_probe':
> ../sound/soc/codecs/wsa883x.c:1394:25: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
>           wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
> ../sound/soc/codecs/wsa883x.c:1395:49: error: 'GPIOD_FLAGS_BIT_NONEXCLUSIVE' undeclared (first use in this function)
>           GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> ../sound/soc/codecs/wsa883x.c:1414:9: error: implicit declaration of function 'gpiod_direction_output'; did you mean 'gpio_direction_output'? [-Werror=implicit-function-declaration]
>           gpiod_direction_output(wsa883x->sd_n, 1);
> 
> Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Banajit Goswami <bgoswami@quicinc.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: alsa-devel@alsa-project.org
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



> v2: add the correct header file instead of messing with GPIOLIB in Kconfig
> 
>   sound/soc/codecs/wsa883x.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -- a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -7,7 +7,7 @@
>   #include <linux/debugfs.h>
>   #include <linux/delay.h>
>   #include <linux/device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
