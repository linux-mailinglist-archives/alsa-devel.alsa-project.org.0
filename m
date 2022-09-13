Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C15B6A58
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 11:10:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2FB11774;
	Tue, 13 Sep 2022 11:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2FB11774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663060238;
	bh=CBVVxuO47/Dr2DZc6tcB4AaNB+X36TCCOPv9vPcg1Ec=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D19CdLUKVORaMcjx6XISixu5++8xfJAnZtCkt/UjzNDxJayii04u0da3zXkguMHUs
	 SZlstIykWU/Zlvv3MNSPoxhBkCQbjPTff/PM8Z27XWTzZqrL/sMb8erPhiYQbFRXLi
	 h4cNZnK6rDy5md7pQ9JeMd8h6Keh4bTWhGdh8iIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05505F800FE;
	Tue, 13 Sep 2022 11:09:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD1CDF8025D; Tue, 13 Sep 2022 11:09:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46353F80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 11:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46353F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yeAEcf9B"
Received: by mail-wr1-x433.google.com with SMTP id h8so12709517wrf.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=NvnQM5buFIVGm1zsvKpl99RN8W6xF+d62qjWE2z+Spo=;
 b=yeAEcf9BIb2Tytfh/GgUgT7KsaSxOS90fj/ZVzqZDtR6K+/gyQYzNg/9xhQwJdH9KJ
 L3uIwiEDaUaOiMJ5ZzS/yGlhugRODPMMoFEvBVRKmUvaYJD9OPactVG7GQd0ZAqXSl3N
 AqqycrzFQtXR/CpwLgA2awRXK0pcRaGtgmy1GxAzBDNW8IDTo2Xj//oLALS/RqcAxcz8
 A2IfzHL+gNT23UdIbsR7yo2WNN6a+y0id+xaw8F5V1gQJbG0zvCDJH5dmYl227ZTgTrI
 z93LLPq3R1mq5HscsTh7Jz+X6RVXZ0oNQbCzBLWqMW/JR0LYFXQs4S7PeMQxTekBDRuP
 rsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NvnQM5buFIVGm1zsvKpl99RN8W6xF+d62qjWE2z+Spo=;
 b=nsSDmDrzsCeKSXxHxp8RnwXMY7GAiWKAs6tZSN9a93XVPw128avQ7iK8WyG4dIwswS
 wBysZsVYYXCX4jsn1k8Tr5j8XrZ0xyNCw0QlblwobtFGve+C3ijQVf0iUAKeojMgAlvE
 RieRZlFseDzv55YBy5qlKbsDz5XQUOuAQ6IpPAYZCHM+sVMpyzIzus4HivcjvVJ95Svc
 YcANlMWXkGiuhqzkA/HtPhuJXedqby1j6iM9iO7oOqrMcR8Uvge0Cy55Gp4Vw0Dz9h+e
 CVaPyF/BvsPNs//V7345OkYEIcVdUXRBwriMGnwQV/g6Cu7BQXONTY7s/mLzHuc97B/F
 FQAw==
X-Gm-Message-State: ACgBeo2B4P3Z8lsj+Knv1KClu0U+DREjIrabm1rXcEOZbte7uDQYQ/xc
 VIC0j6tfbxiXU8hkBYDLiuJ/UtvjrMXx0LCH
X-Google-Smtp-Source: AA6agR4IDhwR/1J/cHRJ9ZZQ0i6GQLw5921b8xdbaeP6XrAcjmbRTEAzcmGEopFWB980sfRqsLTogQ==
X-Received: by 2002:a5d:584c:0:b0:22a:2c6c:617a with SMTP id
 i12-20020a5d584c000000b0022a2c6c617amr15168377wrf.532.1663060169508; 
 Tue, 13 Sep 2022 02:09:29 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff783000000b0021f15514e7fsm11734887wrp.0.2022.09.13.02.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 02:09:28 -0700 (PDT)
Message-ID: <9ebbe240-09ac-42bd-661d-f6b1aaac414e@linaro.org>
Date: Tue, 13 Sep 2022 11:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 10/15] ASoC: dt-bindings: qcom,q6asm: convert to
 dtschema
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
 <20220910091428.50418-11-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910091428.50418-11-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 10/09/2022 11:14, Krzysztof Kozlowski wrote:
> Convert Qualcomm Audio Stream Manager (Q6ASM) bindings to DT schema.
> 
> The original bindings documented:
> 1. APR service node with compatibles: "qcom,q6asm" and
>    "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>",
> 2. actual DAIs child node with compatible "qcom,q6asm-dais".
> 
> The conversion entirely drops (1) because the compatible is already
> documented in bindings/soc/qcom/qcom,apr.yaml.  The
> "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>" on the other hand is not
> used at all - neither in existing DTS, nor in downstream sources - so
> versions seems to be fully auto-detectable.
> 
> Another change done in conversion is adding "iommus" property, which is
> already used in DTS and Linux driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v3:
> 1. Re-order patches, so the change to apr.yaml happens here and we can
>    avoid early `make dt_binding_check` warning.

v3 was reviewed by Rob after I sent it, so let me paste here:
Reviewed-by: Rob Herring <robh@kernel.org>


Best regards,
Krzysztof
