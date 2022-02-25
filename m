Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9114C47DF
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 15:47:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F68A1ED8;
	Fri, 25 Feb 2022 15:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F68A1ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645800433;
	bh=TbZJYJF5zJgVwxf4prOk/2MV25bEjANRf62cm0iheCI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=duwRJ61SHQ8bMOJaxEesgL35Ns6nOMPGPq0N0owpmR2zeglF5phNQfpe2G0l7z3cl
	 /hfp7zKXPrwwO29HYRDES8gHlWDmUDfufqBvVsFAWxpZXgB7g16cXZqpbkk/0v2qgs
	 fFNy73hlrDsGD8TsWcVfAkWZmQJv0VT/0Hi3TM3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BD65F80159;
	Fri, 25 Feb 2022 15:46:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A18BCF80132; Fri, 25 Feb 2022 15:46:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F29DF800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 15:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F29DF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qXPQ22tV"
Received: by mail-wr1-x432.google.com with SMTP id r10so4898270wrp.3
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E2KBLCt5EUZGzk+Usn3XihfCPrZhBOOrY51X7LrK7+k=;
 b=qXPQ22tV8hTTCcl41nRsOM+yEDKLu6F+sX7eggV8btG+ttAyeag+/smAXDaccEVwh8
 8hT97NeqhDOWyoFlu3uYrZERJBPLT5mfw/W2aPC62sHsW62KPXNicC2N7MhFRZE+VvTX
 yerCV8iNh55UQdYNyhuHtlxQG+d+wMJ2nQO/YuwiZ8ZGKyo7quLIRg7PPlzbGY/54Uvh
 P+IwHPuV2qDk3qP0cFtbRh2o2BGi0fLk8f6TxSfOpGp2d8ocxOgpeAZPYafyGEbQrVio
 dUiuVYI9u1jFxVhbjRl4VgbP9X2ZrP9wx4nBiTpfuLj4olahE8BDssliio3nHDuPM2lX
 3VRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E2KBLCt5EUZGzk+Usn3XihfCPrZhBOOrY51X7LrK7+k=;
 b=ZMcfiECgRv85M8S/kvRG1/VGb0izADyL+t5mzwO0UeZFTqHckWmws57wEJQJtWcI2+
 XOFUomgvrQ45w6oZLXYg4CxBBhCd/Qw+xF2RtdfieWwQxUK6qIoQMZI+OwVBmojk3Iag
 ggUCd+TOaLt2Itkwh8lumYA9+55mA4RjV6QhlhJPkSWvXG1oxHx34y3ISS1JMMiTlfEK
 XLvJCjlpbcJJFTbtTGrjYt/uPbCBqKM0rmL5xb9ip68nMW7BJ/UyZgq4g9UtWa4c910k
 fRQMfAsAS56Pw7tXsUgeKJ/1KQbxlwdLbYsYZMDVfFdLrmqWHUlTpYP3Sr4sK+2LHKkP
 yCmg==
X-Gm-Message-State: AOAM531ITd5ayN2YCLKIzx4Wm0y31LEionliu3w/w4rGHZwopN66yF0O
 hK7Cj1BiZz8SlK4z4zblSKtXDQ==
X-Google-Smtp-Source: ABdhPJz6RLrpiBO57HR1D1S2AAhegwgXjnxzEBfq7K1HVtDG/eVLOECUsNy/0VUn13MGyph69unF6Q==
X-Received: by 2002:a5d:59af:0:b0:1e4:a027:ce3b with SMTP id
 p15-20020a5d59af000000b001e4a027ce3bmr6171844wrr.318.1645800356946; 
 Fri, 25 Feb 2022 06:45:56 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm3002294wmp.44.2022.02.25.06.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 06:45:56 -0800 (PST)
Message-ID: <a99a59eb-cd59-f566-b98d-486c94f32eec@linaro.org>
Date: Fri, 25 Feb 2022 14:45:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soundwire: qcom: remove redundant wait for completion
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com
References: <1645800257-27025-1-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1645800257-27025-1-git-send-email-quic_srivasam@quicinc.com>
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



On 25/02/2022 14:44, Srinivasa Rao Mandadapu wrote:
> Remove wait_for_completion_timeout from soundwire probe as it seems
> unnecessary and device enumeration is anyway not happening here,
> hence this api is blocking till it completes max wait time.
> Also, as device enumeration event is dependent on wcd938x probe to be
> completed, its of no use waiting here.
> Waiting here increasing the boot time almost 4 seconds and impacting
> other modules like touch screen.
> 
> Fixes: 06dd96738d618 ("soundwire: qcom: wait for enumeration to be complete in probe")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


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
