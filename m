Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46600691DEC
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 12:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22360846;
	Fri, 10 Feb 2023 12:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22360846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676027704;
	bh=nl+TCgRmNTnPvLD6FpJe+NNiqX1jnrvEm3clEjFHUTY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PHDazzHA5hMf2SFgRBEIizV9CGtqGfeDH/xEn05r3SRLjF+W9IDbNEpWwKtM5WKse
	 wzi06EXGdMY9wTwhJqrOyNJPI/0eIQAKnh/DV5wX4DYBEXshvj0OsPEkxWtqB655Ce
	 ZHcy6a7xC+7gtha8lRRlwVTd0zou/jhZH7mQxhd4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0831F800B8;
	Fri, 10 Feb 2023 12:14:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2A8CF8018A; Fri, 10 Feb 2023 12:14:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED9FAF800B8
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 12:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9FAF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EzYFV0WX
Received: by mail-wm1-x334.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso6050525wms.0
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 03:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5b+yVSfBFeZHjbbMYH6BQhmXFltHa3Qt3/YVtSfAf1A=;
        b=EzYFV0WX/cXIrguAo5DNgvSDhZTz8eNXyu7IwoN+GmDXPvfzld7Gt0d+0FDICPGQit
         hwqJGhUYdXhiE1NZTyaNn6asWYaFdjG9GrpDNnNLzKXpkLsDk4yicw6ezMDUwb6I1BE8
         fN6aowfYcUJRC4gLAfpPyiZCv1hhb6ZtX/qUkRuZ7ZnUXWdoKIjBkCwY2iigvlpz41H3
         DTQj35jQFl+PWEoK4gnblwo+bGF8mNZySlsB0dhouXWnE0nHTPcFKViowtqQdiQoiAUg
         L/FRLcyFtD3tnYkBo3XOeA/mCT2LUHxdj/LeEoo0tcAzHKcRVN97RcK6PmEgb2R2ZF0G
         zrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5b+yVSfBFeZHjbbMYH6BQhmXFltHa3Qt3/YVtSfAf1A=;
        b=moReF70hBnbr63aqqnngptpJBKwX7Q12mFjgsFysL7sXFYWvFI53seE7ernZ0qDUwo
         Vsfb/hLbJ5T4XM/pwQZWP7GsbTyX0YpTWRak9F/EcIJfl92hEE/X2smmwjoEpG+6x2yj
         KWgX68BQO71U3/0ohWH3cx/8D5s9u7OVvsx/4NmKqLP9/KzVYVkTaLTOYnxRefB/ou8v
         zKQQa/1LCFQXxMflZegWb5zrZ8hWuZ5aw6yd92p2RINtzWY+Vse9krC1q3GIZ5eNqzXn
         YUPq5ESoV4Iz36ScH5M2/w1EeM+pe1k9YRQ9JYcqU4ZZ36EwbP/P6hh2AT5Ldwkcmqyz
         1ipA==
X-Gm-Message-State: AO0yUKVh/DqOXCWGL2HYyl48Jl0MFV2iy7MUplOS8141uYuqtWfyHdI7
	s/qNWlIk/6jvUyeShvMHZaBtoA==
X-Google-Smtp-Source: 
 AK7set/pOE7BMe56hO0DEZ5F9vS1ipJHrd5K89AnU0ajKIXsAw5OZ+LT5izjSQ0DLsFjqKokOVg4vw==
X-Received: by 2002:a05:600c:329d:b0:3dd:97d6:8f2e with SMTP id
 t29-20020a05600c329d00b003dd97d68f2emr12260341wmp.17.1676027639995;
        Fri, 10 Feb 2023 03:13:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003dc4a47605fsm8076413wmb.8.2023.02.10.03.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:13:59 -0800 (PST)
Message-ID: <a68d90d9-ed26-1493-55f8-8e3d60501179@linaro.org>
Date: Fri, 10 Feb 2023 12:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 4/8] arm64: dts: qcom: sc7280: Update VA/RX/TX macro
 clock nodes
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org,
 quic_mohs@quicinc.com
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-5-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-5-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R5XOEVDRLA2EKYILGJXSNB54IAGVZB2U
X-Message-ID-Hash: R5XOEVDRLA2EKYILGJXSNB54IAGVZB2U
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Update VA, RX and TX macro and lpass_tlmm clock properties and
> enable them.

Please explain why power domains have to be disabled here and not in SoC
DTSI. I still do not get why these clocks are not inputs for every case
- also non-AudioReach. The hardware is the same...

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 5e99f49..9b04491 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -108,6 +108,43 @@
>  	};
>  };
>  
> +&lpass_rx_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;



Best regards,
Krzysztof

