Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891B7447ED
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Jul 2023 10:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D82D7F1;
	Sat,  1 Jul 2023 10:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D82D7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688198896;
	bh=G2QLv2sYBNsXSOZ7k093kvyKkJTEBWckk4QB1QllXVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ral4c48efwd61CV3MhW1dysTgde57MJnfvOftrRIV8skRPPSKd69pZ2sJWirRZ8ik
	 TCm/T7pGiHHTweJklEQGA6G0Z/YFkt8dB6I6YNlwOtE5QIW/YToyPsmdK4v9rH+h/M
	 /OR6sjmGPAZwC42Kt4Ul+i+bviHpJRJo709yMWiI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54E6FF80093; Sat,  1 Jul 2023 10:07:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CDEAF80093;
	Sat,  1 Jul 2023 10:07:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F854F80246; Sat,  1 Jul 2023 10:06:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4234F80093
	for <alsa-devel@alsa-project.org>; Sat,  1 Jul 2023 10:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4234F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uTt9U+aY
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51cb40f13f6so3007393a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 01 Jul 2023 01:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688198796; x=1690790796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2AOA85WPLNeq59zZIQIWUFQQzF6b4WaPXnHpsoj/pM=;
        b=uTt9U+aYLjgWdXce3eySEIwUYyScwz33iTbz8S7vol+S7QzIP9b1Fio3ugyjMzlTEM
         H35JObt6DdDe+ZAcrodw8uN/VW+NQ0CqZ3BQL4MYQyK/VG/jqB9fXAiem+0ABDpT8SMD
         jtIdYLOMBEssloGgEwn0cZsSLT3+MKV5fWePDdwy5GOGUNilj/gsbg/gPIl5znH0T4Wu
         vzEsOA4OW+uHY00syfFg4Kk7fezNivoQaQSTeCBtNOfjXPeHitfb0gcotxrQzmejiOg3
         Ym29/2O6Y8KtJR8Z70kir6HCS6nh0pKIyzJxpXQqPSeCQaqa/GXYh7L3Bhc+EOvvhCfl
         rA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688198796; x=1690790796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2AOA85WPLNeq59zZIQIWUFQQzF6b4WaPXnHpsoj/pM=;
        b=KMf7cNsWE0oaRmOKuS+oMJBJ0//vX63ytqjV4LtuJKSpVranZqbwLMEvo74Ft3OjBx
         ogCOjtHc0B1D6ChKmbGScK6ilmqANjcTYYnKVdSadmQmyYO7lVSRRw+flvOiqO3F2nLg
         vd32gp7CQsvUOk6vYZEvgE80n2cQBY3xRHvBOu0ZVtsoOhLDxa3jJMI2DB7XSoGV0aAj
         nYL8eaQFyRbA7BqDdkCebSkEiEutzPLD1Tjl9yXHf+FfF45mx5p/0CbqRvAxSSMPlPpj
         7fMN5O+i27K5beydI1hhjYNVN25xuPBWqEySU35PXU6yIhZgAyf8TGeHpFV9/tZ9tJt/
         WqTg==
X-Gm-Message-State: ABy/qLb6Ya4F/SpNWicjcubT+KfdBDVXhpnLbmC3zZpJcLfzazUTeicr
	doP+IqNJDpwORzFiwhpoRV61dQ==
X-Google-Smtp-Source: 
 APBJJlEAcfboaxVqaehIP+kbquc2c7WH/RTZTv63cSm62Jc7muAl9JsCRYIb9E82IwV3w1SZdW4oEA==
X-Received: by 2002:a05:6402:64d:b0:51d:9605:28fd with SMTP id
 u13-20020a056402064d00b0051d960528fdmr2861016edx.26.1688198796353;
        Sat, 01 Jul 2023 01:06:36 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id
 i12-20020a170906850c00b00992f81122e1sm1268309ejx.21.2023.07.01.01.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 01:06:35 -0700 (PDT)
Message-ID: <05d97994-49a4-1618-890f-9f5c70c201fa@linaro.org>
Date: Sat, 1 Jul 2023 10:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/11] arm64: dts: qcom: msm8939: Add missing
 'cache-unified' to L2
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Benjamin Li <benl@squareup.com>, James Willcox <jwillcox@squareup.com>,
 Joseph Gates <jgates@squareup.com>, Stephan Gerhold <stephan@gerhold.net>,
 Zac Crosby <zac@squareup.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Max Chen <mchen@squareup.com>, Shawn Guo <shawn.guo@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev, linux-usb@vger.kernel.org,
 Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
 Andy Gross <andy.gross@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-3-6b4b6cd081e5@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-3-6b4b6cd081e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4J5VIEPKAHGFRVVRGCHK7ZF3YMAF3CJE
X-Message-ID-Hash: 4J5VIEPKAHGFRVVRGCHK7ZF3YMAF3CJE
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4J5VIEPKAHGFRVVRGCHK7ZF3YMAF3CJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/06/2023 18:24, Konrad Dybcio wrote:
> Add the missing property to fix the dt checker warning:
> 
> qcom/apq8039-t2.dtb: l2-cache: 'cache-unified' is a required property
> 
> Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 ++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

