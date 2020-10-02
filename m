Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93628134D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 14:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31241F15;
	Fri,  2 Oct 2020 14:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31241F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601643576;
	bh=I5cn5tJAmnSET/hqhq1rcBQTFfpSjCa/B4RGZVIBGLI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJpQb4+xwNZfcn3LTORubeeNN3B+3vwqzRWl8/LFjfrAqPHrbpU9aOjZpu8Z8A5Mw
	 oZHxT7kDXnD6I2Ek55wfxmmbt4S/EIdKWp8PXYeFoaR/o7cnPJghAZtWYqfSPK9XHe
	 fFwwgyPIEDbIC/JHr0gME111e8ruUMfiWFIUtbTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 071F4F80228;
	Fri,  2 Oct 2020 14:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5E95F801F9; Fri,  2 Oct 2020 14:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2261BF800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 14:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2261BF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GHcbG5RA"
Received: by mail-wm1-x341.google.com with SMTP id j136so1669887wmj.2
 for <alsa-devel@alsa-project.org>; Fri, 02 Oct 2020 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=43YMyAraFcnlRIgLFQOPJ4TtLA2BehQoYI4Q0ek9zDk=;
 b=GHcbG5RACdnbf6XvhSlRxqvxF7cKprdivqsvJHAhDo6xLRSjfwNg7DDfHxTDXcBoJl
 EAC5D38Nds6fBzl50XZrxTX3WTmlM0DmILA5kMIK92Rjzs9EiLSnp5MsctzRBQNLP1D1
 pXPTFZ6DhQfYfGiMuRa3H2JJJbXp9F6M8IS7KHr5lw8Js/1/ibQ4wxnzPIWrfyAybytz
 euNFqndzGb7DmbS3beJmOFj+YF5ePCtu6/pIozohlVDuPKBQ3wOUcfpwbgh4YUV/K/7k
 Xqsqw4dagUyKwoSaLooIwz84AIOw+LkiMrj4Y+pUywSxdM22Nky84w7IOlGZwPMojsz5
 ikOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=43YMyAraFcnlRIgLFQOPJ4TtLA2BehQoYI4Q0ek9zDk=;
 b=g74BAtFQ3S5yx9Ec8mUv4jr0+BGUF0sRHQXiNz4Xkg7iFCX1WUh5VIg8qecaWG5vyW
 Wror5wCvDm6R0cTrduk7k3kG8ULvUcSY7tcrA0FFx0JvCUz5FLfl9uIHCCV057e+N3fT
 iUeHPjUhUOBCoQ07RFE5946rwWli6TDm8f2ioxWH8vBuXI0Arr2p7Q/eCC0hBrm02Sbu
 0IKzADA6n4U+HMGxtPC6vsR5Ua43F+A5ss0G0n5hpy1ZSiRKi8FVoNY3FKpmik/kmsjj
 Og8JGvBKWjS963vxnLRK67FpjsxR+EDR9FiWZQ9g7KMMI4RONTJSeqvuB1eVZgClAWmG
 54uA==
X-Gm-Message-State: AOAM5324/xo3qDK5KB94HD58duadlRAzi0I8f8fpOUhBK8Y2RxXrzWeJ
 Dae7MqenW4uTWd5YfM/Kb/4xPYmDDyLzOA==
X-Google-Smtp-Source: ABdhPJxD/MrPY3QcaILADFf85Aye8IYAKX/pGWFsiP5f10GYtQzE9IshZLLurZ3Vr0672gsG51qJPA==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr2782925wme.124.1601643461273; 
 Fri, 02 Oct 2020 05:57:41 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l19sm1704717wmi.8.2020.10.02.05.57.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Oct 2020 05:57:40 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: qcom: fix SDM845 & QDSP6 dependencies more
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20201001183537.5781-1-rdunlap@infradead.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <602e1ffe-e916-17ed-a311-65dc3e3a3638@linaro.org>
Date: Fri, 2 Oct 2020 13:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201001183537.5781-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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



On 01/10/2020 19:35, Randy Dunlap wrote:
> Fix a build error and Kconfig warning in sound/soc/qcom/.
> 
> ld: sound/soc/qcom/qdsp6/q6afe-clocks.o: in function `q6afe_clock_dev_probe':
> q6afe-clocks.c:(.text+0x182): undefined reference to `devm_clk_hw_register'
> ld: q6afe-clocks.c:(.text+0x19d): undefined reference to `of_clk_add_hw_provider'
> 
> After adding "depends on COMMON_CLK" for SND_SOC_QDSP6, the Kconfig
> warning appears because "select" does not honor any "depends on"
> clauses, so fix the dependency for SND_SOC_SDM845 also.
> 
> WARNING: unmet direct dependencies detected for SND_SOC_QDSP6
>    Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y] && COMMON_CLK [=n]
>    Selected by [y]:
>    - SND_SOC_SDM845 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y] && I2C [=y] && SOUNDWIRE [=y]
> 
> Fixes: 520a1c396d19 ("ASoC: q6afe-clocks: add q6afe clock controller")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org

Thanks Randy for fixing this!

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
> ---
>   sound/soc/qcom/Kconfig |    2 ++
>   1 file changed, 2 insertions(+)
> 
> --- linux-next-20201001.orig/sound/soc/qcom/Kconfig
> +++ linux-next-20201001/sound/soc/qcom/Kconfig
> @@ -82,6 +82,7 @@ config SND_SOC_QDSP6_ASM_DAI
>   config SND_SOC_QDSP6
>   	tristate "SoC ALSA audio driver for QDSP6"
>   	depends on QCOM_APR
> +	depends on COMMON_CLK
>   	select SND_SOC_QDSP6_COMMON
>   	select SND_SOC_QDSP6_CORE
>   	select SND_SOC_QDSP6_AFE
> @@ -110,6 +111,7 @@ config SND_SOC_MSM8996
>   config SND_SOC_SDM845
>   	tristate "SoC Machine driver for SDM845 boards"
>   	depends on QCOM_APR && I2C && SOUNDWIRE
> +	depends on COMMON_CLK
>   	select SND_SOC_QDSP6
>   	select SND_SOC_QCOM_COMMON
>   	select SND_SOC_RT5663
> 
