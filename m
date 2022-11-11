Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51395625A4D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 13:11:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E221A1664;
	Fri, 11 Nov 2022 13:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E221A1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668168684;
	bh=lUmHd6870TpQS3uLlM5oxDnXhiV0bnzxjXV89eEAd/g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUfXrrziOoDEexmIABoz86HmJr55Z83oeKtBHcRZcMigfIEAMk/3r6t5dFoPYyLhS
	 bxg4iD0MqDi36fNWz6uzhOahEFn5pL8RV1lTyAxwzbEqXq5Jn8MMBJh648Px6wDmVb
	 csRBgqRnx1DtSyvz7aRuYETXwuAuQ2nK5sa5mR0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B2A3F804AB;
	Fri, 11 Nov 2022 13:10:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D8DF8028D; Fri, 11 Nov 2022 13:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 967CEF800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 13:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 967CEF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fb+8Ulj+"
Received: by mail-lj1-x22a.google.com with SMTP id h12so4305898ljg.9
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 04:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=unHednunizHpJ9XYvBpXmDyswFth3w2fStIquZQtGM4=;
 b=fb+8Ulj+zRyO2Cvtl9I917QMAzXK32UPWTI5QSYGEpij5ABswFP7924qVwk32FEIYF
 0/e+X5RZG5epyZNjbV9MT2Gp57yhg76jua/2c47Sq5+4NH7E9KGGWDHILvKXb4ex9P2B
 dkz9GN2D07iOZXz2VDrE8ntzXDDx6gMwNZlBY3cE4Z3aYH4leKe12MAUbUA8CQylfp8X
 fEnUb0Cem51PcMFOv6TskUu+ItjXNacrxFedqM2YbqXaL7/vc5VH9qYQ9co1aQI29gZy
 v4Dsly1HCRoZVqqpbjp7CkRDtc37FplstdOgv/SPSKQCQYYNIR5zI9WA8r3fwBommQyj
 rN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=unHednunizHpJ9XYvBpXmDyswFth3w2fStIquZQtGM4=;
 b=wgL+SRxe/uvOxxFd2ZE72RyS6PJ3XYBc0SWR4M9cKfZYRJeKTAeh0WiqG4XeC1Szcx
 zSu0rZJCpoQzmO0GZq+BRRAkXXrrpnNtgPxQU9qCJZTCNqcNH9hoX7wlL1lsfSfMyyAW
 KamQQPm2tSuAmP8zZkrfpagutouJJ6M8EEZgR3gCC07gjTXt7+Yv96ouCuiTDsej79Qv
 8K1ySZm6Ll1rashiVMGhVTct+ezYjR7a9k3PefrEBGAchJgwjUgQGCTcdM+D+KHfhjLf
 GT1SO3a4C3Anl0vNFAMVUs4WxS7YLEk7WgfvtSglZvFXB/SmC4H9FxL4L6wg7OUOsaym
 evuw==
X-Gm-Message-State: ANoB5plIrXDeORoO/3vrfy13E2inM/TZoUXPQrGmijdQ0+gn5Z7ilcyy
 xuutV4t4bjM/JeomJlTfsvD+/w==
X-Google-Smtp-Source: AA0mqf59BDk8ngoeEGvwxhB9aPi4roFQAKaW4lD9URgYoXD01XXj0+ZbYjZzySAkxgKwcFSTWvjzlw==
X-Received: by 2002:a2e:b602:0:b0:277:8df:88a7 with SMTP id
 r2-20020a2eb602000000b0027708df88a7mr599088ljn.139.1668168623320; 
 Fri, 11 Nov 2022 04:10:23 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a056512315100b004aa95889063sm301404lfi.43.2022.11.11.04.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:10:22 -0800 (PST)
Message-ID: <78602d4c-913a-04b3-dbca-40f672c78a53@linaro.org>
Date: Fri, 11 Nov 2022 13:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/10] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound
 nodes for SM8450
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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

On 11/11/2022 12:35, Krzysztof Kozlowski wrote:
> Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
> some changes to APR/GPR services bindings.  These bindings are part of
> qcom,apr.yaml:
> 
>   apr-or-gpr-device-node <- qcom,apr.yaml
>     apr-gpr-service@[0-9] <- qcom,apr.yaml
>       service-specific-components <- /schemas/sound/qcom,q6*.yaml
> 
> The schema for services (apr-gpr-service@[0-9]) already grows considerably and
> is still quite not specific.  It allows several incorrect combinations, like
> adding a clock-controller to a APM device.  Restricting it would complicate the
> schema even more.  Bringing new support for sound on Qualcomm SM8450 and
> SC8280XP SoC would grow it as well.
> 
> Refactor the bindings before extending them for Qualcomm SM8450 SoC.
> 

I forgot to mention that DTS in progress is available here:
https://github.com/krzk/linux/blob/wip/sm8450/arch/arm64/boot/dts/qcom/sm8450-hdk.dts#L459
https://github.com/krzk/linux/blob/wip/sm8450/arch/arm64/boot/dts/qcom/sm8450.dtsi#L2345

Best regards,
Krzysztof

