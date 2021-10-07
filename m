Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23806425168
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 12:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9162165E;
	Thu,  7 Oct 2021 12:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9162165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633603545;
	bh=j+SjbNRNcDI71sYc0z6fma0x2kHr9x5XDw3Lrm6AzYU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V96XLUaW17AN/pjdgkExER94GF0O7XoK88cLdDtfsShh61EdNfQLFVvQKYifqtCS3
	 K+M8gZGNWnfEyp7+3zUUaEzCuPv+0uhjAb4Jkscm8oAORBm/rRN6wBNNiq2q6Flmia
	 7KjNJojBJqFx0Ktawdc5AJzMx/EoESPQ9AgMRG9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F6A8F80259;
	Thu,  7 Oct 2021 12:44:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99F22F8027D; Thu,  7 Oct 2021 12:44:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA0D4F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 12:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA0D4F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="A/ctinh/"
Received: by mail-wr1-x42c.google.com with SMTP id r18so17691207wrg.6
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3r67xCci0neztBxAHtXQxOTNTLTcg0zp3S6KOv2sEww=;
 b=A/ctinh/LmGU0bsbKYZ/RJWjDQXeWNF+a+WfQF6FgnT58X7zxbi3z3nz4vcyO3uLDv
 n0/9UMH5E07gxO9pEmd5653LWBnY41nANxUa2jmlxRcrxlXz0nXC/Lm9+uE3xKeQQMCs
 f4rzcWofocwJStwmjb5zt11rsKtGxIS0IltojgSk1OJnIwLOpUY+sBmvJ+74pyJKGSOe
 o0fFNMe+Q8B9//7Xe1bL/0g3DJBnvxy5dxwu6SUs2m8Gjg7M2/Xq5/s+YCGFIDYxRLle
 mwJB5nf5rUVBRMRGVxssb5UwrglBHl+0I/4D5CapnpiVuRqG0npW4ilP6RCeqM5g59DH
 wWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3r67xCci0neztBxAHtXQxOTNTLTcg0zp3S6KOv2sEww=;
 b=J6LA/Gm9WRQc8iCDrNVTkR08ncqaiEtHMb846/YFnpSHJD5IZJPLcy2Qeph/RGYI93
 ng9v1IurPx0j52zUMABe+MChuFJUe9N1IvPMLJo5uTMVOFHHXYN3bRRhdToWPjkSxGBL
 aetxQ/P9GSufK9cn2kK9LkpibN5cIk9r6AWFiQ+6c0gyBu81a/+X+E9A+DawNHXrJrMs
 OQQr5Vj7cRbbB2XCEw4OxKQbYvUb0iW3aEmpNHmEOvD1a6PbjOCE3AQANsaot368OBSz
 XsOQbrlNp5m7nFvps19DbMxFqaf5uJUT629DwWjRoA8R7FNo1ZNqHNXUoUom6lGMXes1
 1l7w==
X-Gm-Message-State: AOAM531bYAnzd/TPup6ZN0EUF+hOUpLJ/wkpjACQqUwgcgjonbZahBKP
 85QKKXNBH0ig4Fi4Aobo1kXmnA==
X-Google-Smtp-Source: ABdhPJwQbGU7M7S6lJx3kwLHiGUmc8npWrgEkePais+zSlwLwkIT/lJ377n6zjb5ZkqiTUOpu3TsrQ==
X-Received: by 2002:adf:a48c:: with SMTP id g12mr4379486wrb.341.1633603458528; 
 Thu, 07 Oct 2021 03:44:18 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id c25sm5173296wml.37.2021.10.07.03.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:44:17 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: dt-bindings: lpass: add binding headers for
 digital codecs
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1631109831-1360-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <04210158-e999-a3a3-ee53-ac9024ab9120@linaro.org>
Date: Thu, 7 Oct 2021 11:44:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631109831-1360-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi Srinivasa,


On 08/09/2021 15:03, Srinivasa Rao Mandadapu wrote:
> Add header defining for lpass internal digital codecs rx,tx and va
> dai node id's.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes since v1:
>      -- Add missing dai node ID's
> 
>   include/dt-bindings/sound/qcom,lpass.h | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 


Mark has already applied v1, 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/include/dt-bindings/sound/qcom,lpass.h?id=bfad37c53ae6168d03ab06868ea44e77995c43d5

Can you please rebase on top of sound-next so that we endup with correct 
defines.

--srini

> diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
> index 7b0b80b..a9404c3 100644
> --- a/include/dt-bindings/sound/qcom,lpass.h
> +++ b/include/dt-bindings/sound/qcom,lpass.h
> @@ -10,6 +10,37 @@
>   
>   #define LPASS_DP_RX	5
>   
> +#define LPASS_CDC_DMA_RX0 6
> +#define LPASS_CDC_DMA_RX1 7
> +#define LPASS_CDC_DMA_RX2 8
> +#define LPASS_CDC_DMA_RX3 9
> +#define LPASS_CDC_DMA_RX4 10
> +#define LPASS_CDC_DMA_RX5 11
> +#define LPASS_CDC_DMA_RX6 12
> +#define LPASS_CDC_DMA_RX7 13
> +#define LPASS_CDC_DMA_RX8 14
> +#define LPASS_CDC_DMA_RX9 15
> +
> +#define LPASS_CDC_DMA_TX0 16
> +#define LPASS_CDC_DMA_TX1 17
> +#define LPASS_CDC_DMA_TX2 18
> +#define LPASS_CDC_DMA_TX3 19
> +#define LPASS_CDC_DMA_TX4 20
> +#define LPASS_CDC_DMA_TX5 21
> +#define LPASS_CDC_DMA_TX6 22
> +#define LPASS_CDC_DMA_TX7 23
> +#define LPASS_CDC_DMA_TX8 24
> +
> +#define LPASS_CDC_DMA_VA_TX0 25
> +#define LPASS_CDC_DMA_VA_TX1 26
> +#define LPASS_CDC_DMA_VA_TX2 27
> +#define LPASS_CDC_DMA_VA_TX3 28
> +#define LPASS_CDC_DMA_VA_TX4 29
> +#define LPASS_CDC_DMA_VA_TX5 30
> +#define LPASS_CDC_DMA_VA_TX6 31
> +#define LPASS_CDC_DMA_VA_TX7 32
> +#define LPASS_CDC_DMA_VA_TX8 33
> +
>   #define LPASS_MCLK0	0
>   
>   #endif /* __DT_QCOM_LPASS_H */
> 
