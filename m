Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBC4C46B1
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:38:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319561F14;
	Fri, 25 Feb 2022 14:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319561F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645796308;
	bh=1uHLwWpwB8HOBp3NAT5D9FuYyS2yGPL4LuppNAyJnko=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPJ1enxivGyj0DINZF7mlGUb3oVrQF7XGMoJs1gU9XLARuW8uI6LDwrpS6OWzE2LC
	 rS7uic8JeC8icUqKG9qAW7J247yA8pZax1iFezYZgFQE991sq3gDnKWdkU/7drbEVt
	 2pc4IWFj0mrJXogtHHzSqv5B5LY/cuUaovru7zbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67F6EF80159;
	Fri, 25 Feb 2022 14:37:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1270F80132; Fri, 25 Feb 2022 14:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6AA9F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 14:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6AA9F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qnSHncmv"
Received: by mail-wm1-x333.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1695181wmp.5
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 05:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LLpFgz78t1oyzWMh4Y4sBh571G9i6nh/jXJ+jWwza7k=;
 b=qnSHncmvDNQSyhYwHGMPduQc2VHvZllkFXUi8WCqlPYsqHsGyxR7diTmu96tNyuXTX
 9x+bEH6fjmLd7nsN9gI993CY2H8nLTNdPb6gMW7NirEFAE7nBZBJprOTc39xjriFm4mu
 XAPm0YAplY9IcafACSXZHkVYKY+pUxToW8/h5YP2QbePSEZq3kUOXiy1rAIDTXxEzBMp
 WVabxd+aXfZqvKx1VEX6pl3lsbfhk/TpDsJEJJBqfsdViqm/75f5hWJVLMJQeblI7pN8
 3oMkXBdzlipXLk6CcWSaY4eDW0EGo9il0p7ext2xodaVi7ogy4RUR9CqDTV6Cbbow4zs
 BkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LLpFgz78t1oyzWMh4Y4sBh571G9i6nh/jXJ+jWwza7k=;
 b=aLnBkJ1dVUSWrx3JP02G6UQmpZuSOVRC89EP6xwr1jXILreMyp34CmtF3Hk7mxpptB
 5X6iYp3Hn+//9pmye8R+8YT8GF0l7R4DoEkYwrWfA+q/UlY00PVlv7c2Z86fJe23Dvui
 6fKioOIf8pQqgNaUWdGc30vnsuOVwtIGpVKJZd8uULhwICb4kTJr5QVYeZjz9ldEapta
 8OL+QD5Ip864HG93h6lStvTTyYDaEtIf5v3oI0M9zAs+dTLfmPK0SMELtUPyn0zx7BvF
 fSdsw7HLrIQs+FQRgKQBU1vNk+Hi8EVx8FOLa4B559LB49rN7JbiC8mHDS6tgslg9cEF
 YgqA==
X-Gm-Message-State: AOAM532Nyaew3XSYLz/IkUCG4Fqaav6BuNTFwOdbv4E4tGL4HNa9dcHU
 erncj31bBp8SJXnnLuT/8to9KhK4Ls+2cA==
X-Google-Smtp-Source: ABdhPJzlbmW009bfZhIOcWbIfq2JDYEC5ZLuIC33VFPLGDBy/EY9ndE8Zc9MvpIUd5BXrDsqFTyknA==
X-Received: by 2002:a05:600c:3d06:b0:37b:f831:2a98 with SMTP id
 bh6-20020a05600c3d0600b0037bf8312a98mr2759914wmb.36.1645796223402; 
 Fri, 25 Feb 2022 05:37:03 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm2406589wro.26.2022.02.25.05.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 05:37:02 -0800 (PST)
Message-ID: <861cd4c1-43a9-8175-7ad1-e7e51f5781b4@linaro.org>
Date: Fri, 25 Feb 2022 13:37:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] soundwire: qcom: remove redundant wait for completion
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org, koul@kernel.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com
References: <1645795667-20176-1-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1645795667-20176-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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



On 25/02/2022 13:27, Srinivasa Rao Mandadapu wrote:
> Remove wait_for_completion_timeout from soundwire probe
> as it seems unnecessary and device enumeration is anyway not
> happening here.

May be some details on the side effects of this wait would be good to 
add in the log.

> Also, as device enumeration event is dependent on wcd938x probe to be
> completed, its of no use waiting here.

fix tag is missing

Fixes: 06dd96738d618 ("soundwire: qcom: wait for enumeration to be 
complete in probe")

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>   drivers/soundwire/qcom.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 5481341..9a32a24 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1309,8 +1309,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	}
>   
>   	qcom_swrm_init(ctrl);
> -	wait_for_completion_timeout(&ctrl->enumeration,
> -				    msecs_to_jiffies(TIMEOUT_MS));
>   	ret = qcom_swrm_register_dais(ctrl);
>   	if (ret)
>   		goto err_master_add;
