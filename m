Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C235B5B1F41
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:33:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 700F0171A;
	Thu,  8 Sep 2022 15:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 700F0171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662643983;
	bh=OuSWRV3bnfDCt20c0tFF+kWgUXnkMe+EUtIOrTvqa3Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DP8kSd5Q5C5v6yxL2VaYgH2XrfQzkmSehc9964Vzr5bY4V5lA4KSnZ5CI1sALaQJN
	 kztOEPTz2Rd7yH2P9xSjfMnpd75I9l9nCHOjP/KpKL5+wr7bmZgJZNbxmPhbiosLob
	 jyfu9Y17InUa4CaWNpcCsr91/dXv4W1L3s1MSpmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0524DF8023B;
	Thu,  8 Sep 2022 15:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3792F80515; Thu,  8 Sep 2022 15:32:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A71EF8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A71EF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ptC5lx8u"
Received: by mail-lj1-x233.google.com with SMTP id bn9so19897682ljb.6
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ohu6CozGjy5GhPmh3m1Q0H8HEbccCG50CgwFnCzBG1M=;
 b=ptC5lx8ui2N6P9aJgfgD/F4uhtNhf8ZhMAdQGSWGNJjjsoGCpVpb5iWXuz3JTUDXdP
 fJ++bXHzabeC1AT1bMDCssosOPFRXmMhsJueCRRtQk4JPstA0V+AKgvPi2HDoWButk+2
 6jYHd1d5/4QHSccAePsM42YVSYsxWZ68NYKC5vfMDqgiv7xRvIr6oHaTfgCjoqb1bwpW
 tXnXth03V8x03pU+cnwNOvuld4SD1H911urQ08y5dL1A2mC9txdftm0dHz9c8NcSLMSF
 0jhGk4sXoxMxM0fhdM1yFKP4kTz/HK4bnAVkX9FuvicMKiPe6lYJRHnfj2myLr1uihWi
 ChqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ohu6CozGjy5GhPmh3m1Q0H8HEbccCG50CgwFnCzBG1M=;
 b=GNqZvxdTtzFjiXkjr5gg4J078k0J44co8Jcl3V4K22OoQkTdYtpTP/LTliUS+4qS4b
 5sRB3YW74XjGlG3iU3l31YuID+YMwSpdryaj7AP5KAO+aT6VOrFap6UsXnL3+SeRCTBc
 /haV1kMSczIkBA6ZYIHB90BQ8ypaN/lFpMpzO2Df74AVtIm0Lu7Ho+6+aiiwn+8dhZCH
 VFVwlvwLFoO4J/DMzXicHSM2PFHfTg38mUgaRxEejIF/qk03vdDdv0OXIv6+EG0gbb8I
 v2pFxm70uCxexUOAKfls/TwC2pgzqLv+uoh2bKCo8abP+UYMHSfSp0yHs7CPASkmtSN1
 874A==
X-Gm-Message-State: ACgBeo2FeVpUES5I24dSBSxoArJFwsYKAwnMnZoe7YiPQpj1dhY0g1SN
 oIdROOlWQctJuZdOqS/uASCftw==
X-Google-Smtp-Source: AA6agR7Mn8Ot0yeAgeYYRNMj+qOLoKvpoqnimvLBQxheimGNxcIm97oXVTGZg8bmOEsl1kwDWwNeHQ==
X-Received: by 2002:a2e:a787:0:b0:26b:ded1:7652 with SMTP id
 c7-20020a2ea787000000b0026bded17652mr125008ljf.263.1662643916226; 
 Thu, 08 Sep 2022 06:31:56 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a27-20020a05651c031b00b00263630ab29dsm3192690ljp.118.2022.09.08.06.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:31:55 -0700 (PDT)
Message-ID: <6e6b12aa-f516-6ea1-58e5-f46033b84985@linaro.org>
Date: Thu, 8 Sep 2022 15:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/4] ASoC: qcom: sm8250: move some code to common
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
 <20220908063448.27102-4-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908063448.27102-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

On 08/09/2022 08:34, Srinivas Kandagatla wrote:
> SM8450 machine driver code can be reused across multiple Qualcomm SoCs,
> Atleast another 2 of them for now (SM8450 and SM8250XP).

s/Atleast/At least/

> 
> Move some of the common SoundWire stream specific code to common file
> so that other drivers can use it instead of duplicating.
> 
> This patch is to prepare the common driver to be able to add new SoCs support
> with less dupication.

s/dupication/duplication/


> 

Assuming there were no changes against v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
