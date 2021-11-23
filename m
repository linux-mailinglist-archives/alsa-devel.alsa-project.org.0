Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6A45A29C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 13:29:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13F91679;
	Tue, 23 Nov 2021 13:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13F91679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637670567;
	bh=aSBghrm1IFVeFScX0rJhNgjtY6FaAQb7M301Si+6cQc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CbE7W3sfvNkhqd9sQWyVNGuFM3X3kfHoQHgGDn60n7yD5amPGfda4qbHHkffpoe20
	 MN5jJxyx+avA7eLFzzGnukURGNTqm0H5QtZrLNbN8YSyMRQgaQTgJnQNGCKV0/zIZD
	 1HXX1RV0UQ7ZCeOcfaVzl5AQMcI8k9PE88/K7ucM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A95F80430;
	Tue, 23 Nov 2021 13:28:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D3BEF8049E; Tue, 23 Nov 2021 13:28:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F07CF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 13:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F07CF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="deoRU4qN"
Received: by mail-wr1-x432.google.com with SMTP id r8so38588905wra.7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 04:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yk4vffJNmhyLmpnjyEy+b/mnqWZOqNqp4/3VDhbng0o=;
 b=deoRU4qND6iwkrymhQxWiRsIPJt6Q9YvUt6CpsR4Zy4EvDDgjJryYC2M004d31AS2f
 JIsthUToxCI2gAsv22JGRGXE5CXCC7Q0fCtyPdJq2nCJ2YKDW+y/98vgvUK7YFDih0Ui
 fncyP1xsjigRY2N8zEfAvD2p2twvXRNJW2KhOg3Zj4oANO53zAO47xo4z/Vz4fTlWVET
 j1RwQ1Pk14TTKRS/R3nJKY29Hnp79PufxBhdhCkY3Rou1Qd0C7QfC62jk5XEc9cani6q
 QmLWFrRqBQCcgtwlUWKNpqQ1CYllKPMTFgIcxex/CUuHBwL15TJZqnsiZHUnxVOq7a+W
 46mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yk4vffJNmhyLmpnjyEy+b/mnqWZOqNqp4/3VDhbng0o=;
 b=powihnGx45XIs6wckzljX/KuF93r6YGcu8xip/CjpomA9DlQqFX4zcJyIFPoeQafKC
 zoEUuqpWww8RBZsOREH6OffJavWaQQ+a+XEdigkzTphVexZg7UnD96N981URAs7hsbyJ
 VDWXsf/V3wk2SuptUiAYia5ZNz57zWzX4WaX9HsOdYwr/3t3WWLHotPs+l471EMlVRBI
 PwHHgWW+9CtEC9/AWMZ7XqgYA6/qZW4kfPte2a2BIsy3HoICs2VIyX/vjhanHLfbx4ob
 ImoSjzQxEfi72/Vz1ELPc6KOV6Mzb4xZajofJJVV0mY/bgghYWiEBW1k4e0NmTjD/fvm
 tXnA==
X-Gm-Message-State: AOAM5325H1EfvQcQxGEepgTaWLl9rmO8hexOJ5Xe60sVhgnu18jmcJNz
 wRQnXO5me3g9bkJX8o/Lz0ndAg==
X-Google-Smtp-Source: ABdhPJyiqQlIw188u1zX7Z4eH7R9n2zOjpbZon5P3wHX349TMpXURB1VSqL0vDN5pxXS4OQS32YmOw==
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr7169913wrd.178.1637670470556; 
 Tue, 23 Nov 2021 04:27:50 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 21sm968731wmj.18.2021.11.23.04.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 04:27:50 -0800 (PST)
Subject: Re: [PATCH v5 01/10] ASoC: qcom: Move lpass_pcm_data structure to
 lpass header
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
 <1637239714-11211-2-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <958bdcdc-2a33-1b19-a886-68d74d7d9480@linaro.org>
Date: Tue, 23 Nov 2021 12:27:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637239714-11211-2-git-send-email-srivasam@codeaurora.org>
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



On 18/11/2021 12:48, Srinivasa Rao Mandadapu wrote:
> Declare lpass_pcm_data structure in lpass header file instead of
> platform source file to make common use of it by other drivers
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 5 -----
>   sound/soc/qcom/lpass.h          | 5 +++++
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index a59e9d2..a44162c 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -18,11 +18,6 @@
>   
>   #define DRV_NAME "lpass-platform"
>   
> -struct lpass_pcm_data {
> -	int dma_ch;
> -	int i2s_port;
> -};
> -
>   #define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)
>   #define LPASS_PLATFORM_PERIODS		2
>   
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 67ef497..63aaa6f 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -256,6 +256,11 @@ struct lpass_variant {
>   	int num_clks;
>   };
>   
> +struct lpass_pcm_data {
> +	int dma_ch;
> +	int i2s_port;
> +};
> +
>   /* register the platform driver from the CPU DAI driver */
>   int asoc_qcom_lpass_platform_register(struct platform_device *);
>   int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
> 
