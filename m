Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EE65AFF08
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 10:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4B4986E;
	Wed,  7 Sep 2022 10:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4B4986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662539525;
	bh=aEjevlprOCAvSls7rjquuTMSPcAR2KgPpFcMrcrKm2A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dM0t+BhZLU1w/bsg5ZAx3fWOLvzyAaBOBvigUCf1+35VFUTcS6DE21kFcrNsdVei/
	 zpK+gIIfuhLmkaYmnriIpKJnlZfaC7ClXJkaY+ipoo/eUu8DGM0FArCSbllIrqlJ8t
	 OPLfL9KeoJtcmgkBfmbfMBPh3fdVXiL35LGHf99w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B626F8011C;
	Wed,  7 Sep 2022 10:31:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 714B0F8028D; Wed,  7 Sep 2022 10:31:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A315AF8011C
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 10:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A315AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wHxxXgOa"
Received: by mail-lj1-x22b.google.com with SMTP id y29so2483836ljq.7
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=HoBu5pVRP0QlH9IyjF/UfBIe/8xVli1mPMeUsv8Z2sM=;
 b=wHxxXgOaPb0hNl/IJP0P+lOmntLkVF5Yp02OoLnxprSjola21wH2Sl47pU32q2dEho
 v3+4xYTvBKFcabjwfshFDu0V4rOeDzT3vKP9BSN8wBi2n9N6o3VUuZfJk/9aOwCYHmYS
 5eRenIKcxScpXLtxpeCdsc/9q4pQJpl15dd9hAKleqeKpx4MORzmNLoMRNLVAhNC1QwY
 qZicXyBsxF0+0bya/Y9S+aegK5DaKN8X4Qdys0tu7Xhud+l8RuNJUr6xbMxR2ORhwojl
 mHh8GyIqGcK2PxlP+L3WZR89c+Ov+L4rmZVitja4c5prSHhoLVBW/wi40zB+JmsxLgFd
 155Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HoBu5pVRP0QlH9IyjF/UfBIe/8xVli1mPMeUsv8Z2sM=;
 b=XMSDjP8J0lK97jaFBSzte3KnvR3bbqllq7xyeSjN4R1jv6Iy0yw2rMn5j3NXILZCC1
 JdnT44loPAPfxrd/rG34ncF51Ln1Dej25vkhiUvQfyFXT8troXE13m82KKv3ZUFb70os
 daIz2X4OwIuLd61Rlf6voRbUyQlaFYHigIX73AbZayJXr8WHZoveW21sWbKvJNcsQ1A4
 FBPOfixcMt7tRRZxj27PWLw7bJY7nVN3lcXXYp6Sxui+cUb4M1KN5jaHesVD2kHs78YI
 rg5Nm6FPbfaoARntQNIdXzaZWOmfHizfYvYGaqcDUFm71tKXGIfmDp+7Q26jrcGGizw0
 OcGg==
X-Gm-Message-State: ACgBeo3W81/xZfMES3VamXdxinGe7oVo3gW+nc2IgQUaLDLGrbxKJX4e
 W+VJL9BQLlxwwCokTpSiOww6Aw==
X-Google-Smtp-Source: AA6agR7IEanWZYdcRnIeSyrGPg0ZoBPFDp/3VMgyRg9nCW7WCbetSuOiEUA1I1IqmDBXvZBOXapokw==
X-Received: by 2002:a05:651c:12cb:b0:25b:fa3f:c3f with SMTP id
 11-20020a05651c12cb00b0025bfa3f0c3fmr681462lje.364.1662539455364; 
 Wed, 07 Sep 2022 01:30:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p15-20020a2eb98f000000b00268d84f8db1sm2467364ljp.92.2022.09.07.01.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 01:30:54 -0700 (PDT)
Message-ID: <7f91afa5-b5bf-4f26-c540-a04e52825248@linaro.org>
Date: Wed, 7 Sep 2022 10:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/12] dt-bindings: soc: qcom: apr: correct service
 children
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
 <20220906121655.303693-10-krzysztof.kozlowski@linaro.org>
 <1662486402.667876.780014.nullmailer@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1662486402.667876.780014.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

On 06/09/2022 19:46, Rob Herring wrote:
> On Tue, 06 Sep 2022 14:16:52 +0200, Krzysztof Kozlowski wrote:
>> The APR bindings were not describing properly children nodes for DAIs.
>> None of the DTSes use unit addresses for the children, so correct the
>> nodes and reference their schema: clock-controller, dais and routing.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/soc/qcom/qcom,apr.yaml           | 38 +++++++++++++------
>>  .../sound/qcom,q6dsp-lpass-clocks.yaml        | 16 ++------
>>  .../sound/qcom,q6dsp-lpass-ports.yaml         | 16 ++------
>>  3 files changed, 35 insertions(+), 35 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.example.dtb: gpr: service@1: '#address-cells', '#size-cells', 'apm-dai@1' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml

I missed one more place with example to fix.

Best regards,
Krzysztof
