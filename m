Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72362C0F5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:34:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A844C169C;
	Wed, 16 Nov 2022 15:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A844C169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668609244;
	bh=UDbu42vYiNTJVAVkByGz6XC8tKAdvwQzOC4kPQEt/ic=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vMgtf1gKXGe4S+50sMWbL3IrcWe0cbfSXtoacxYzdySe5Bm50lIUZe1EDzWRB+Lze
	 zik9NHtXpQuCVEYDWVnks07Cv7QKPuvsSU/iHZ8FT3TZPhU91XrbmhptHrKkAS8MJ0
	 /3WW1mvhhGnpV7/OetOj7WY51OXa+mpV2rrvZoIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F6E8F80238;
	Wed, 16 Nov 2022 15:33:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22302F800B8; Wed, 16 Nov 2022 15:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 426FFF800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 426FFF800B8
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so20257900fac.7
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xqn+VpkyaVOXbC/hpj4uzzFiJO18ERrQThzp4BwoimE=;
 b=BRwSI51nmL289iwC7n+xNMGRgwjBd38KRWLbXSXL1x/B6Xv/NKkL7HE7dhUQI5uyK5
 r3Ybc3xQWiXmxlhRgFX2n7XMWLMPccUZIwBR3aAdRkzOSbAoM/pfP9CV3NLSJI+dZiPp
 sQbZ2zyd5GbrLYQngrruAm9639ijlV6kE87bbrdsMNMm2h4xbgn9EIWBoPlo6hNCuZqH
 gPQQ1KFolsWIv7IDJONUkomgnWSzWglFVbQhCUS9qI/RkWZlhVzMM5rUdpiZ40lY7S4m
 dHLPV1xTkbngpIPdF++n/j3p49/+lk3CqMfzq+DPkf2ZQ6i1Jy1e24JFoltTuPcNUSZX
 dbtQ==
X-Gm-Message-State: ANoB5pmHh61A0vRUScQlvQWP7dGM+OGMzHr4n266BNSAOr8MbARjHp85
 FQpIKfw0htWN6XwN8wSptg==
X-Google-Smtp-Source: AA0mqf5NVHnziasxHfj1GRbI3eGEGLdHD1pPC8kYFKj0a6d/3z5N2SnKoAZ8ZP7XBjj9cphDIrTRJA==
X-Received: by 2002:a05:6870:b94:b0:131:842a:110c with SMTP id
 lg20-20020a0568700b9400b00131842a110cmr1864268oab.201.1668609180804; 
 Wed, 16 Nov 2022 06:33:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a26-20020a056830101a00b00667ff6b7e9esm6781696otp.40.2022.11.16.06.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:33:00 -0800 (PST)
Received: (nullmailer pid 3809684 invoked by uid 1000);
 Wed, 16 Nov 2022 14:33:02 -0000
Date: Wed, 16 Nov 2022 08:33:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: qcom,apr: Split services to
 shared schema
Message-ID: <166860918054.3809609.16135727023403702366.robh@kernel.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
 <20221115120235.167812-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115120235.167812-3-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, quic_plai@quicinc.com,
 quic_srivasam@quicinc.com
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


On Tue, 15 Nov 2022 13:02:26 +0100, Krzysztof Kozlowski wrote:
> The APR/GPR nodes are organized like:
> 
>   apr-or-gpr-device-node <- qcom,apr.yaml
>     apr-gpr-service@[0-9] <- qcom,apr.yaml
>       service-specific-components <- /schemas/sound/qcom,q6*.yaml
> 
> The schema for services (apr-gpr-service@[0-9]) already grows
> considerably and is still quite not specific.  It allows several
> incorrect combinations, like adding a clock-controller to a APM device.
> Restricting it would complicate the schema even more.  Bringing new
> support for sound on Qualcomm SM8450 and SC8280XP SoC would grow it as
> well.
> 
> Simplify the qcom,apr.yaml by splitting the services to a shared file
> which will be:
> 1. Referenced by qcom,apr.yaml with additionalProperties:true,
> 2. Referenced by specific bindings for services with
>    additionalProperties:false (not yet in this commit).
> 
> While moving the code, add also required 'reg' and
> 'qcom,protection-domain' to further constrain the bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Keep compatibles in qcom,apr.yaml
> 
> Cc: quic_srivasam@quicinc.com
> Cc: quic_plai@quicinc.com
> ---
>  .../bindings/soc/qcom/qcom,apr-services.yaml  | 54 ++++++++++
>  .../bindings/soc/qcom/qcom,apr.yaml           | 98 +------------------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 58 insertions(+), 96 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
