Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B49613D5B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 19:30:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92EDB167D;
	Mon, 31 Oct 2022 19:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92EDB167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667241001;
	bh=KmpZz6ktjP7+A9mZwyc/aqW39QGUMXLnVlW6v3Ksbmk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kZJ13JHI88ti6+b6F7+wBFtuWJ/PApQTvp0b+/Gm+mRJAPySaaxZDLsUa7GPutKoo
	 2N96ry+skg6aYtCZtT2aLLwat/L47JAW3MiWKoxntjFbRcAjD/jkeDsT7RBpwHFCNb
	 yp4By5iExKdFl3GkxHXEqQpLPpQKXdaZp6mTwe4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3016F804FF;
	Mon, 31 Oct 2022 19:28:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B32F800E1; Mon, 31 Oct 2022 19:28:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6272DF800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 19:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6272DF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OKiMbfMl"
Received: by mail-wm1-x332.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso11348377wma.1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ESah86fGc7L+Xbl/WXQlaeWbmtq7glSFyBOHkEwRjqA=;
 b=OKiMbfMlnlrjIVC7hqN1GYU7bYVxo8PqmAJSpyszeI5Kr351mcEpP4ZUPw15jrTSkM
 fTuiEXLF3N5/7rw4RmrUH3y50sidwjoYGEFpgufEQfpiOouV7t7LkdWWNiHgea9LAH2I
 oqflhu6Ld3hywlOJ/UCfWhSfKMhuN98oTFdbszWK1RnkM+kT7g9ZhwOA21eqYihSMLWd
 xIKeE1wNvcKXkzADTSZN66Yn0kOtdIg0M6SPxG8NJRAr0yMw/FWAyvopenK4WTDm5RQ5
 9INbzv8vy5tEzrvOle7+Q48OryUwgB1TN+q16HWwrpoN/NplcwcQgnrp6i5eaqg2XLtv
 hFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ESah86fGc7L+Xbl/WXQlaeWbmtq7glSFyBOHkEwRjqA=;
 b=VC6WHUI6aRDvB1lvkxK7oLGGFPKWRuge0q4IlmtDt+rIRwJ2WDg8gwJTjijkK543R5
 VlfFsYczdHqvbe4GpVod5CvYsL+9Y25SfxvTwA2Eztg2EMqd1GJPe4GAQdNDSC7irAp1
 z8vDtPc1W/UZHqur/tyGake4I4JcS/MkrrMKva32gFLK9WnrRsnVjmy+A9R4/fynGm4/
 ecFcOKog0yOX/PJ82jO8+1KjjGznjjAhgxEoM6AghsUjwBcfoPSxOQgkwENn4Ai5qOUh
 sghUUl0yUPjfRGgC6Buav0ZJzNjAVL511swSnzLPGB5fcw78prIncL4ltuM+4XGKcmfo
 IqcA==
X-Gm-Message-State: ACrzQf2IOoGEMfhYdlIgkNcvMbnqPUQTOOYMC4vG4Y5eTyOZKW89l6eq
 wiAszfk/fvZTXoPxgl5u09rlAQ==
X-Google-Smtp-Source: AMsMyM6LZLbegfSTuGAx7nz+anwW1Np5zaqnxyRYWtVfOMGGgUCeTnXu7wrpu2A1gpL3YkX0uRa8BA==
X-Received: by 2002:a05:600c:1694:b0:3cf:56a9:fe64 with SMTP id
 k20-20020a05600c169400b003cf56a9fe64mr14035284wmn.112.1667240917252; 
 Mon, 31 Oct 2022 11:28:37 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 bx7-20020a5d5b07000000b00228cbac7a25sm7795160wrb.64.2022.10.31.11.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 11:28:36 -0700 (PDT)
Message-ID: <addac524-a168-16ba-c736-5b116b6e98af@linaro.org>
Date: Mon, 31 Oct 2022 18:28:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH -next] slimbus: qcom-ngd: Fix build error when
 CONFIG_SLIM_QCOM_NGD_CTRL=y && CONFIG_QCOM_RPROC_COMMON=m
Content-Language: en-US
To: Zheng Bin <zhengbin13@huawei.com>, gregkh@linuxfoundation.org,
 krzysztof.kozlowski@linaro.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20221027095904.3388959-1-zhengbin13@huawei.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221027095904.3388959-1-zhengbin13@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 27/10/2022 10:59, Zheng Bin wrote:
> If CONFIG_SLIM_QCOM_NGD_CTRL=y, CONFIG_QCOM_RPROC_COMMON=m, COMPILE_TEST=y,
> bulding fails:
> 
> drivers/slimbus/qcom-ngd-ctrl.o: In function `qcom_slim_ngd_ctrl_probe':
> qcom-ngd-ctrl.c:(.text+0x330): undefined reference to `qcom_register_ssr_notifier'
> qcom-ngd-ctrl.c:(.text+0x5fc): undefined reference to `qcom_unregister_ssr_notifier'
> drivers/slimbus/qcom-ngd-ctrl.o: In function `qcom_slim_ngd_remove':
> qcom-ngd-ctrl.c:(.text+0x90c): undefined reference to `qcom_unregister_ssr_notifier'
> 
> Make SLIM_QCOM_NGD_CTRL depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON) to fix this.
> 
> Fixes: e291691c6977 ("slimbus: qcom-ngd-ctrl: allow compile testing without QCOM_RPROC_COMMON")
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---

Applied thanks,

--srini
>   drivers/slimbus/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
> index 2ed821f75816..a0fdf9d792cb 100644
> --- a/drivers/slimbus/Kconfig
> +++ b/drivers/slimbus/Kconfig
> @@ -23,7 +23,7 @@ config SLIM_QCOM_CTRL
>   config SLIM_QCOM_NGD_CTRL
>   	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
>   	depends on HAS_IOMEM && DMA_ENGINE && NET
> -	depends on QCOM_RPROC_COMMON || COMPILE_TEST
> +	depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON)
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	select QCOM_QMI_HELPERS
>   	select QCOM_PDR_HELPERS
> --
> 2.31.1
> 
