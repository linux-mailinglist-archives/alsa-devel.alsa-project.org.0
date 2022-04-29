Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4997D51501B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 18:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C999215C2;
	Fri, 29 Apr 2022 17:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C999215C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651248038;
	bh=XnFy1z0XJDcL+BTquIAReQtW5GmG5iMtUnr0RkkZhG0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sz9Ds3riZu4EfX+l5Eh6fOH5bN9WVZTc8xJAWrKsfO9m/ksRua62f6RXJC4yLQuJP
	 uDNt4RNuZCErPk2RyQxLgYcJ+H5og6MCYAWV6mHjhMFEj/jht02hrh0uIEsEIfqV/2
	 m0+HgSDcZjzvV/He4bgA9TYVrjcLy9Wfdben5//k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 325A3F8007E;
	Fri, 29 Apr 2022 17:59:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 824D3F8007E; Fri, 29 Apr 2022 17:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A8E4F8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 17:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A8E4F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OUSBU7Ia"
Received: by mail-wm1-x336.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso7274353wme.5
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=U8HrbFqgCBfb/RS3uJbNmvqXXJbn594jDlyVmtK764U=;
 b=OUSBU7IakIZzrQL74ICWLqDfwhhkDremyYGPrYch6LLTeJLPScBA4ElPwRmEUb1YQB
 tqXV381ukmV/MHplLtVHw+xzdajJH+PDrEr1gv4SJAOfsQdbSJSl5Fm72o+5rCPIDctU
 YqJZYpgUUmW7hAtlH8TjEB5fko1P5bn53P7fkZg/0WgGvOhMSFHjvE1OCYiIxejwQkJY
 KAw+n0w6x9IcL+81Uu4g+bTQNgfPJbDPIIjdoBBDUwryvfMZNIKV41Z04awYUjcb/CFr
 9IKQSo1DbkmTeYGrpZTAahMJTcVmtfj25Oy+yPlGuNChdBq0unl0u11VxuGcUrRlKD9t
 hGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U8HrbFqgCBfb/RS3uJbNmvqXXJbn594jDlyVmtK764U=;
 b=3LgL447665kHlXgjmaYEzjlVKFdNWR4SH1Sgpuni/U04g2MGXomQajq9psLben3v0u
 zR1LKRJ1zB85WobLRExCsNIer9XO2gn+uaXdFVc4PjpLljcVa1dGpyfLPiAya3w1X/ke
 XTgYq1tClvQzOiRSASKkVd/TA4ggXG4na6fE8GZJcXfhVAIyGbYyE6qUmjzH+xR0SlYf
 +jmaxOCULKZXrhrjgIQmCKXUrxGHVD5+IHft3xQGlgP4fj1Np9/hgGO38K6YbfNUy3Up
 DlxC60HA2JG/0jBlKfzfXod4lFLK8oa2zGEg1WT4crDtH1w5Nvr9Lg6e1XQ1KgWSRQPb
 /s/g==
X-Gm-Message-State: AOAM533r1100cPzADkVCW0jK4SbHAYnCdItnQX0sLkwqIKU7Be75h6dG
 VDTdg+6P1RtTgVx/smQFVf1h3Q==
X-Google-Smtp-Source: ABdhPJww59Ilmdm1wcQYRmLg+RLw05DqkftO7wIpU3DywUjRDqpzisiSnOBqRs/YCLN3xi/gJbV5mg==
X-Received: by 2002:a1c:ed01:0:b0:394:89d:6277 with SMTP id
 l1-20020a1ced01000000b00394089d6277mr3920685wmh.28.1651247968575; 
 Fri, 29 Apr 2022 08:59:28 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 e9-20020a056000178900b0020a9f995a3csm3190248wrg.24.2022.04.29.08.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 08:59:27 -0700 (PDT)
Message-ID: <28a05a2d-06e7-a958-6873-24634423b4e0@linaro.org>
Date: Fri, 29 Apr 2022 16:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] soundwire: qcom: return error when
 pm_runtime_get_sync fails
Content-Language: en-US
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
 <20220426235623.4253-2-yung-chuan.liao@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220426235623.4253-2-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, bard.liao@intel.com
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



On 27/04/2022 00:56, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> For some reason there's a missing error return in two places.
> 
> Fixes: 74e79da9fd46a ("soundwire: qcom: add runtime pm support")
> Fixes: 04d46a7b38375 ("soundwire: qcom: add in-band wake up interrupt support")
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   drivers/soundwire/qcom.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f5fc8c27012a..c40c25f2d264 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -516,6 +516,7 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
>   				    "pm_runtime_get_sync failed in %s, ret %d\n",
>   				    __func__, ret);
>   		pm_runtime_put_noidle(swrm->dev);
> +		return ret;
>   	}
>   
>   	if (swrm->wake_irq > 0) {
> @@ -1258,6 +1259,7 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
>   				    "pm_runtime_get_sync failed in %s, ret %d\n",
>   				    __func__, ret);
>   		pm_runtime_put_noidle(swrm->dev);
> +		return ret;
>   	}
>   
>   	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
