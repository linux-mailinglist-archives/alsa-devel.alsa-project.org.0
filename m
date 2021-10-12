Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A99F42A0B8
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 11:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CBD3169B;
	Tue, 12 Oct 2021 11:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CBD3169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634029631;
	bh=fJtQsww8j9dOoc6mMAIPOJTxzX05EHvn4Zu7QyP4U8A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H8dtDCmC5GvD7JleJo/LR/6aujyAYIaBpx3lmA+3+h1K1eYYqCc0a4jgQ9Var0nNp
	 LlM/KzOVqOZS947kGUGAMJzBPSD7lg565dQcXSZhJMNNQcMxz7tG6QufBGC0a8CnUU
	 HzfgaXXQVElCrDJyTN5EbRztCvIgid3qiDm34KAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E62F80302;
	Tue, 12 Oct 2021 11:05:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCDFBF80212; Tue, 12 Oct 2021 11:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7E36F80302
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 11:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E36F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c7IxciNH"
Received: by mail-wr1-x435.google.com with SMTP id y3so31642283wrl.1
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wr/2NPJuS3pCGpcja/YdLD+ws/Bsmb2EvXsaz8P7nBk=;
 b=c7IxciNHtOvpD93/zJf8U7mD2WwzdWpgTLDmu07hiDi8Wfl4HHdL5aazSay0mgUrPd
 BWzDgu9hbnY2dGuy8OC0n3CwQ/ckOB/bp1oEq17L0WVFtWSNaCDnEglLBNyvWl/Kznaf
 ZPrfxdOfTlZkRlH1ShlbVnyxdcezK92VgTpHJfxf5P4h4MpN4PyHW7X5z3J57bFA3D/k
 0a7pM7AphUImc2xHdrzCi1W2mgUL4wUUI0l26dK0ui35nDLRs5y7lEuFuM+5GaQf1e/S
 TyoUmr5kGUgu3QJCDo0dmCtANxufQAL/hEbl51pzlD34dt9/RqbDdat9+jOUND9oGuVL
 Cbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wr/2NPJuS3pCGpcja/YdLD+ws/Bsmb2EvXsaz8P7nBk=;
 b=YX7XCRAMU2drIUGmFI3dEh14MY/wDXISym9e2l7ISVh1AHEnifM+lnh/Ka5PYB5tvV
 7/jgMjr979k7fNUHWI/z4c6vIFSZ6UWYdq89Tn1jWxmYZ3b4fTLU1nFSZrOsdMVpniby
 zjC5R7NsGvz/pFPoB3C5V6lo1mL4w2MIMTY1tK2QjevWz54VOKBmlI33wDY8c7sDTC19
 6fLSshr43Wlsn+ZG5HkhlpPsz2ILjWsqPGvIpiQkXWsgMIYrF9jwbbeFiaF9MFDDbXBp
 hrcXgvFxlYxiOixxHMXPoEyCo45V92D8ikfmvUizGjCsp6KA6pV5SKamJW5uyWWtEuO7
 qiQw==
X-Gm-Message-State: AOAM530YhjDOfQb8PG6DuhreNMgBMb6/44h0HQmJ7b7eODPZxFiuQrTq
 Lz5x9NZ43tkuqXvJeTen+Zdclg==
X-Google-Smtp-Source: ABdhPJzaM6vlGT8UtCZ7Hx0Ajh7TCVZxn9HXjngx99Nxx4cftOosPSp98BNwQTw4tPX0u8Kke6EvkQ==
X-Received: by 2002:adf:a34c:: with SMTP id d12mr30919653wrb.267.1634029527864; 
 Tue, 12 Oct 2021 02:05:27 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id p8sm1892712wmg.15.2021.10.12.02.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 02:05:27 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] ASoC: qcom: Add compatible names in va,wsa,rx,tx
 codec drivers for sc7280
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
 <1633702144-19017-2-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8886b174-f3d3-7bad-a2b9-ea7def2a36e4@linaro.org>
Date: Tue, 12 Oct 2021 10:05:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633702144-19017-2-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 08/10/2021 15:09, Srinivasa Rao Mandadapu wrote:
> Add compatible names for sc7280 based targets in digital codec drivers
> va,wsa,rx and tx.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   sound/soc/codecs/lpass-rx-macro.c  | 1 +
>   sound/soc/codecs/lpass-tx-macro.c  | 1 +
>   sound/soc/codecs/lpass-va-macro.c  | 1 +
>   sound/soc/codecs/lpass-wsa-macro.c | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 196b068..c2b9333 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3577,6 +3577,7 @@ static int rx_macro_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id rx_macro_dt_match[] = {
> +	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
>   	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
>   	{ }
>   };
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 27a0d5d..5dcae73 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -1843,6 +1843,7 @@ static int tx_macro_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id tx_macro_dt_match[] = {
> +	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
>   	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
>   	{ }
>   };
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 56c93f4..70f09b4 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1472,6 +1472,7 @@ static int va_macro_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id va_macro_dt_match[] = {
> +	{ .compatible = "qcom,sc7280-lpass-va-macro" },
>   	{ .compatible = "qcom,sm8250-lpass-va-macro" },
>   	{}
>   };
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index d3ac318..75baf8e 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2445,6 +2445,7 @@ static int wsa_macro_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id wsa_macro_dt_match[] = {
> +	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
>   	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
>   	{}
>   };
> 
