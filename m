Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9D5B5C05
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 16:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F6116D2;
	Mon, 12 Sep 2022 16:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F6116D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662992148;
	bh=Mr/qtj5qLZpUlyvDtwGuyPSBEoZd6mHeLT7H4uUqZrc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5d8f3JBilDFPGDEEp0necqy6UpVeyOS5A+25r30BxuGOuHKxj+mxpfpdgYotGfCH
	 dnXfyo2bwDGBkvISQ69/P05jPgU16ml778OINzH1za+N++QlGqok69diFNcuuMW31C
	 wkUKrA5+oiZl+qiaBkVVCkzLdC8uzBgakW7ZRSjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E88D0F8030F;
	Mon, 12 Sep 2022 16:14:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3034CF8027B; Mon, 12 Sep 2022 16:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3BAFF800FE
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 16:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3BAFF800FE
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so13950751fac.13
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 07:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=zjUBlDf7L9Ynqi1H6fGKN/mNwcz/H/7eLC0Jbu7Mkrc=;
 b=3GQGKqyv7Hl+d5dKTS+wwe/9VcyqpmnEiLaMx3CQiSQWwGaT154fGgtgafr5hcS6SV
 uYOwbpRDE1cKZx+khzDqxyS4gzM3fF5QAW5HYO6lhOgOKABS/VtZy9zZqbtpc5GYHjcD
 P29fkHSNCC24du3e8vrPeMmQxrW7tjpHk9THuPUFaFQSM7YMy2MHJx7od7sUu+tOObRd
 ct8AIV+FxGTuKzSWtWkRTCBH101eH6tRJwt/jVsvi7xqT8AZ77xQQXOg/dpKBz5FXUqC
 wtvuFoB1qMrXVlcXfExkHl0BKUGY2TAz/Y21hMLP4jvPbXblg3DWFAp1ra7QqXH80eB6
 vJBg==
X-Gm-Message-State: ACgBeo04qX/toZRmy/6lJobFB/u4elTWSx9yxOwf4Ujlyq9Oycm9IBX6
 ywiuK9yGQN5DXwvJkyNIHQ==
X-Google-Smtp-Source: AA6agR52VoqB+17Gb0BUpHCSjA4obhxCNA59bFjHr4WfcACjZNkTiq/l3Kzt5b9km8c8ddT0yiL62g==
X-Received: by 2002:a05:6808:1202:b0:345:b62b:3756 with SMTP id
 a2-20020a056808120200b00345b62b3756mr9487837oil.165.1662992079011; 
 Mon, 12 Sep 2022 07:14:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m26-20020a0568301e7a00b006339b36127dsm4654253otr.3.2022.09.12.07.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 07:14:38 -0700 (PDT)
Received: (nullmailer pid 1164923 invoked by uid 1000);
 Mon, 12 Sep 2022 14:14:37 -0000
Date: Mon, 12 Sep 2022 09:14:37 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 09/14] ASoC: dt-bindings:: qcom,q6asm: convert to
 dtschema
Message-ID: <20220912141437.GA1164860-robh@kernel.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
 <20220908091946.44800-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908091946.44800-10-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Thu, 08 Sep 2022 11:19:41 +0200, Krzysztof Kozlowski wrote:
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
> Expected warning because the qcom,apr.yaml is being fixed in next commit:
> 
>   Documentation/devicetree/bindings/sound/qcom,q6asm.example.dtb: apr: service@7: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
>     From schema: /home/krzk/dev/linux/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> 
> Changes since v2:
> 1. Rename to qcom,q6asm-dais.yaml (Rob)
> 2. Extend commit msg.
> 
> Changes since v1:
> 1. New patch.
> ---
>  .../bindings/sound/qcom,q6asm-dais.yaml       | 112 ++++++++++++++++++
>  .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
>  2 files changed, 112 insertions(+), 70 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
