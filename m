Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6D391C6E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 17:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41012172E;
	Wed, 26 May 2021 17:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41012172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622044277;
	bh=Qax+SOxpYs8RwJItsYii2EYbytRwdHwy+p/JOgprtC8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYToewtel/B6Bs9e98NVtBEvv6apS0FFoxlueBGxLFjc2npB0oYo5kBbFMeqnOBbR
	 pu6Gsk6jme11MNvP8Ki3lvspaJh7rj0DMYXklzDtyNotxxYRGkswPtITPudFYZ71xK
	 TzaDk/elbrJFRZZBS6NeFjnDtH8al1VxNcFmyCCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2015F8024D;
	Wed, 26 May 2021 17:49:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE3A7F8025C; Wed, 26 May 2021 17:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57470F8024D
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 17:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57470F8024D
Received: from mail-vs1-f70.google.com ([209.85.217.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1llvml-0005fy-Rc
 for alsa-devel@alsa-project.org; Wed, 26 May 2021 15:49:31 +0000
Received: by mail-vs1-f70.google.com with SMTP id
 q16-20020a67d7900000b0290228198e77b6so418931vsj.23
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 08:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUY/OX0+pta5kTvyLKotdE7y+h+efskwB6GqpwrAtbE=;
 b=AMzusaUEQ7FnFtL1uob91nV8Bf1SH24anGiEilIpoOCkHlNDOJydHux3c8Ivh/CqEY
 oIy9Pzh/1vdSFpPOulJeDd2QF1drMA97PxUlRWfkIh9gIHVxKY2WwMejUlN9C0udX1Bt
 eBsEFvE6uxrm2/G38Q9VSc+Icv+28sdw67heZmWJ0X30VGhffuz1r+IXMrlcbvyzk8MU
 R1vpjydd/xdu7z6Y70QT/7/V8KRZgYePBQkBEry4wJkdt5TSxuqm4GDQ33ERe5MhQucx
 10jrmPsEztFebRGMvetJvlU/pwpDhy1fziYb6+mfrkkL5TA+QKwIiOkJd6KEK7ag2Hc9
 2uRQ==
X-Gm-Message-State: AOAM531OHKVTkicqqILjDiNHR6U+KiMzHz1KqahzGC8M4Ve8ZqOiJVbr
 MoHIcDuyDlvyOg8ySL/SYZR1EDipq4EbCFM+29olY4tC25VFwszf/uTnTk98rVuFDAPTjtETsvM
 NkMEw2/1c7xrynewGv4UmfSKBtBDxBQ+u0Iy0S1Rl
X-Received: by 2002:a05:6102:c2:: with SMTP id
 u2mr31702927vsp.33.1622044170968; 
 Wed, 26 May 2021 08:49:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvefn6kxtU4lD+c0/LmjrXRf549ePApFZ2JMocX7btTNnsZ72vHEsRMfGiA3/hAMPICFaOMQ==
X-Received: by 2002:a05:6102:c2:: with SMTP id
 u2mr31702889vsp.33.1622044170743; 
 Wed, 26 May 2021 08:49:30 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.6])
 by smtp.gmail.com with ESMTPSA id o2sm2258084vsq.30.2021.05.26.08.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 08:49:29 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: samsung: midas_wm1811: Fix build error when
 CONFIG_GPIOLIB is not set
To: Wei Yongjun <weiyongjun1@huawei.com>, Simon Shields
 <simon@lineageos.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210526144339.2392592-1-weiyongjun1@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d1aad7a0-a27e-286f-1bcf-51b035d1d8ae@canonical.com>
Date: Wed, 26 May 2021 11:49:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526144339.2392592-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 26/05/2021 10:43, Wei Yongjun wrote:
> Fix build error when CONFIG_GPIOLIB is not set:
> 
> sound/soc/samsung/midas_wm1811.c: In function 'midas_fm_set':
> sound/soc/samsung/midas_wm1811.c:205:3: error:
>  implicit declaration of function 'gpiod_set_value_cansleep';
>  did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
>   205 |   gpiod_set_value_cansleep(priv->gpio_fm_sel, 1);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~
>       |   gpio_set_value_cansleep
> sound/soc/samsung/midas_wm1811.c: In function 'midas_probe':
> sound/soc/samsung/midas_wm1811.c:445:22: error:
>  implicit declaration of function 'devm_gpiod_get_optional';
>  did you mean 'devm_clk_get_optional'? [-Werror=implicit-function-declaration]
>   445 |  priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~
>       |                      devm_clk_get_optional

The fix does not match the error. The consumer.h has necessary stubs for
!GPIOLIB case.

To fix this error, you do not depend on GPIOLIB, but include proper
header (consumer.h). The dependency (with compile test) is still nice,
but for runtime fix, not build time, which is a separate patch.


Best regards,
Krzysztof

> sound/soc/samsung/midas_wm1811.c:445:61:
>  error: 'GPIOD_OUT_HIGH' undeclared (first use in this function);
>  did you mean 'GPIOF_INIT_HIGH'?
>   445 |  priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
>       |                                                             ^~~~~~~~~~~~~~
>       |                                                             GPIOF_INIT_HIGH
> 
> Fixes: fd0ea9cd9698 ("ASoC: samsung: Add sound support for Midas boards")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  sound/soc/samsung/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index a2221ebb1b6a..22be597b1dd9 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -228,6 +228,7 @@ config SND_SOC_SAMSUNG_ARIES_WM8994
>  config SND_SOC_SAMSUNG_MIDAS_WM1811
>  	tristate "SoC I2S Audio support for Midas boards"
>  	depends on SND_SOC_SAMSUNG
> +	depends on GPIOLIB
>  	select SND_SAMSUNG_I2S
>  	select SND_SOC_WM8994
>  	help
> 
