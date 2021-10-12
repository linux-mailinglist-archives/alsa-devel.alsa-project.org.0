Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A758D42A096
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 11:05:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0F8168B;
	Tue, 12 Oct 2021 11:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0F8168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634029556;
	bh=ifgNcAB2SNLRjQPj48ikB/L7+o+Vq9ZN17N1zylgUDQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l6t++bl6thX9gJ8HWTCQ5DKUeRbyHMZ5QCPK2pCbk6qCoKqddaCg0zmd5l/98ViA/
	 Ay5A2LZrY0Jx4OxuHKOjRoR+Pow3Xu6n574KlXzRjkj7F1ljofyyG1scPc4wIckoD4
	 mHeZZ4ygaW9AS04HloCVgaIhbbhhylkTtN+1p7Aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A946DF801F7;
	Tue, 12 Oct 2021 11:04:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62D1AF80245; Tue, 12 Oct 2021 11:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36525F800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 11:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36525F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OUCqqoYl"
Received: by mail-wr1-x435.google.com with SMTP id e12so64707440wra.4
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nM9ryI+c+NLtTNUZo2AiWUoKoEPFgkQ1TAdM3Mn2iis=;
 b=OUCqqoYliTYGu9oksn4qZr2MyPWixyHxjPTni2yDBH1kmgpybP40V9gCaPPdkiIr7u
 PkPxey9VPJZ/TNZS3NiV2AzsmP736DOYJKF8jYVVCsnIwNS3liD1B2gqbNrpyK2YGzto
 K43oDQU9dxwfR7PVP2cfjhMeILXRQ4bRPoa40Fhgg+IMULk5UksDqwKgdupIdkEGftqm
 DxRbmQRRSvQzD+ZQRH6D4+AyVbI6CFd2NdISUClrRDtOk2Cm1eTq9OUbznMi9wz3lcam
 qg7afqFWap7t4DqaiVhLN2ib5AOttDy/YQoMDnggEodqWiZgYxUv6Xw8VxsOYEtvNMrH
 uq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nM9ryI+c+NLtTNUZo2AiWUoKoEPFgkQ1TAdM3Mn2iis=;
 b=52CcaMwJ/50jiCqFpTvMg0bvdyrIH8AhBDeYsWLH9x+023rXE8NOUSLtBRtg5lAySf
 2831eXzo37e6Z1z3G02NFSQGGK0QzbgIWncuG2uVrKhpRk2PzYWOwhpbon5YhWADgegj
 k6LDZ3OZKtMsaiPgQ1SobT6T6jNKCbaOgBGYq+aQSDg2Kz2RE0PCV7hJHIOrE43Bn5g2
 s2tdemuKwEJmJIk6FEXMqkzLAjDh84/Lt96hFPXeKCgOOrdKDcnkYClR2rzDAsRvuBUN
 MItrI7O6ovpbN4rthZFRpKL4knyjUpbidUbcwusBpDDnVgKLb+6aMmBTIfg69pze9PnF
 pWYw==
X-Gm-Message-State: AOAM533drna/n8c5vg6HR+V998CtMeoTbyvx165Hxh2Jexka+UptLB9M
 qp6BCVd1c4kL54zTRLnbGfzTxA==
X-Google-Smtp-Source: ABdhPJzldmhbBry7GuAupyMrQ6kcGWOkrHsnOW8VChM5aqK1EEGJqirPQaDdD4vD8TnhCDjQXD0xLg==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr4093213wmi.143.1634029470271; 
 Tue, 12 Oct 2021 02:04:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id b19sm1987114wmb.1.2021.10.12.02.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 02:04:29 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] ASoC: qcom: dt-bindings: Add compatible names for
 lpass sc7280 digital codecs
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
 <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8e042343-a40e-d00f-31a8-8368160329e4@linaro.org>
Date: Tue, 12 Oct 2021 10:04:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
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
> Update compatible names in va, wsa, rx and tx macro codes for lpass sc7280
> 

TBH, I was also expecting the clks that are mandatory for sc7280 in this 
binding patch.

I think we need this and this will allow us to validate on the dt-entries.



--srini
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 4 +++-
>   Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 4 +++-
>   Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 4 +++-
>   Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 +++-
>   4 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index 443d556..bc762b3 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-lpass-rx-macro
> +    enum:
> +      - qcom,sc7280-lpass-rx-macro
> +      - qcom,sm8250-lpass-rx-macro
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> index 6b5ca02..74f5386 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-lpass-tx-macro
> +    enum:
> +      - qcom,sc7280-lpass-tx-macro
> +      - qcom,sm8250-lpass-tx-macro
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index 679b49c..99f2c36 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-lpass-va-macro
> +    enum:
> +      - qcom,sc7280-lpass-va-macro
> +      - qcom,sm8250-lpass-va-macro
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
> index 435b019..13cdb8a 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-lpass-wsa-macro
> +    enum:
> +      - qcom,sc7280-lpass-wsa-macro
> +      - qcom,sm8250-lpass-wsa-macro
>   
>     reg:
>       maxItems: 1
> 
