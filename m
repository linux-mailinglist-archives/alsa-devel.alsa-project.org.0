Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0DC61F712
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 16:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BB5D839;
	Mon,  7 Nov 2022 16:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BB5D839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667833418;
	bh=yxMOyAvFpaoQ5D2SrgR2ayip+R3mqaD4uz06aFKbDgU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvpEQNB+ZOVmjYVc8mJjJoMkyqr7E4j/al2ZZZcTQa9qZhyc9fCa5bviW1mUBAkPw
	 pe7pNlB7K5SnuatEEZ7rlTzFRy5X9jwPzHjh740iqjTcgWLNBe7xosJnDqX30+gV/s
	 ocGVhQBh48FxmA4iMiEoa1x8knLDBShEJyQrm74w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE29F800EC;
	Mon,  7 Nov 2022 16:02:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBFC1F800AE; Mon,  7 Nov 2022 16:02:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFD0FF800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 16:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFD0FF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Sa3GlGhK"
Received: by mail-lj1-x229.google.com with SMTP id d20so16662016ljc.12
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 07:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fODzgR6f5QIFQoQpSBqUjOLDxlY3mnOv7TGRHuzFTmQ=;
 b=Sa3GlGhKz9uFh2xqVF8cJoU3Rjyu+lW99l4UTK5vaJQyJGY6nBEgvS0sw04i2CTloO
 bsEm3VpZONpb7/0esp7CVMuVMI0WhPcfnK4wfKSJBdQZWTliIllDagRJbTVMLjWVfMB/
 y7nOTLmb+q8rBgXSIyLUO8Dy8CFYQ9ra93pHcCjU3iJFxmCcidG9C7lwTRq5WNBrT5zy
 2BI50NMYSP2Jlv+QCsIIVgCnREo91KPRqexIfjimqLibHRiZ8yv3+lw6O6DeppQkqrzx
 j5Jcqd+rbgT+8Izh6bAq+KIbx/7p7XBzgWKhQy8DCK64B7Hr5oesOQiXBYHUndvSskGE
 fBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fODzgR6f5QIFQoQpSBqUjOLDxlY3mnOv7TGRHuzFTmQ=;
 b=VWrqJoWwDCAuQ8TFW1Nu+JZzMA+1MU/fGY+znhfpTYRuOP0kKMNtazLd6Vksa4h0f3
 Rnv2RUaPhJ6kWa0zjej+2+2FOV0MB4YPhBfdFSmQvUPG38Cu9EqD16ubPLTMro69mc90
 dAWk06FoQoZ+9aKSyg5a4NQWcZOi5PnamTQzfFykCt6/43irgDmXB/EmbYFcrkI7ikDc
 BwSpxUI4Bkst5GE0kJfPRfJ8PTmrA605k9Yk5B7LxykHJhslqCvOvP/YcGJg1auw8aUq
 SEIQq8/1EAbgRJapsnkGOcXy0yFl5Ud97W/BE4Lw6v2BdQmcFealORTKivG7WH515BxC
 asZw==
X-Gm-Message-State: ACrzQf232JbpAmNUrtpjLwrQeRG5ScALsG+NGFNCwQVpqsfomOVCACfQ
 d+1Gufz7BdxdIuw0H/wekuaW8Q==
X-Google-Smtp-Source: AMsMyM6B0W0l3KqZ9xRH+gtlHucDMeOI7PEKTYEscM5ZWSFSyC5tIOLxpnuRvNgZsHoxQ2HzMi+yNQ==
X-Received: by 2002:a2e:bc11:0:b0:277:6018:6f07 with SMTP id
 b17-20020a2ebc11000000b0027760186f07mr12809516ljf.16.1667833347512; 
 Mon, 07 Nov 2022 07:02:27 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 x23-20020ac24897000000b0048aee825e2esm1272499lfc.282.2022.11.07.07.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 07:02:26 -0800 (PST)
Message-ID: <88c55827-067c-e6b1-a841-be70c05b7fc4@linaro.org>
Date: Mon, 7 Nov 2022 16:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: Update soundwire slave node names
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1667830844-31566-1-git-send-email-quic_srivasam@quicinc.com>
 <1667830844-31566-2-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1667830844-31566-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

On 07/11/2022 15:20, Srinivasa Rao Mandadapu wrote:
> Update soundwire slave nodes of WSA speaker to match with
> dt-bindings pattern properties regular expression.
> 
> This modifiction is required to avoid dtbs-check errors
> occurred with qcom,soundwire.yaml.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts             | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts              | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 2c08500..983e8a9 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1007,7 +1007,7 @@
>  };
>  
>  &swr0 {
> -	left_spkr: wsa8810-left {
> +	left_spkr: wsa8810@0,3 {

While changing it, make the node names generic, so:

speaker@0,3

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

>  		compatible = "sdw10217211000";
>  		reg = <0 3>;
>  		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
> @@ -1016,7 +1016,7 @@
>  		#sound-dai-cells = <0>;
>  	};
>  
> -	right_spkr: wsa8810-right {
> +	right_spkr: wsa8810@0,4 {

speaker@0,4

and so on...

Best regards,
Krzysztof

