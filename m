Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC985B726D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 16:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C1917C6;
	Tue, 13 Sep 2022 16:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C1917C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663080959;
	bh=GRw7s9B89t6gDYx/ARHCD6vGQw+KW101FUIFaP8FdX4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E7TAe0A/wMRK857N/LTGkq/xqgkrvmENbZAXbDw4z6K2fOUuFey9X/B0OmmdQFjY1
	 zaTjpfH4cz8s7FUGgiKgrXK85zsJt7o63G+XN5DR71pi72rat6NQeofl9oltNJjOV5
	 HpUeZpSzRlyTBgONbuFNLGhrEncphNUPGPGWtucg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3088F8025D;
	Tue, 13 Sep 2022 16:55:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE65CF8028B; Tue, 13 Sep 2022 16:55:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CA18F801EC
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CA18F801EC
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-127f5411b9cso32790334fac.4
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 07:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2/8jBgH5RIn75yN488C2+nFWx/pd5MIa7k/cppE49Xc=;
 b=BaiyB3DWzxaMwiuagdJwUwOUhYGPZk4/T0XI+KkR/zsHsvbdDVWnzNJlCMngpk8cYl
 +dTjsYRZsUP62PtiEbUEO0Cr5MoYxkFQBk5Tk4oU5xTtCUN5YhpkNIQoGr2nndPoZHe1
 UyhHM9L9s3+AyRhavSAZg12ubIaHKExdy/IMIBw3JMHmfiVIqzNxaOA+k/jCduBKDGuo
 UqYqtz8DiGQGCOTRfUjF5mpGgS0DT02EpLchmMF17PoOipkzOUm4bnKkAbD0/FL2mqzS
 VU4S2GkzKnA/+a664RvIwr1loiRpg4Md6TOnk6xgY7lTytcpKfAa6/CkRcP2Bxj/h8ox
 TTMA==
X-Gm-Message-State: ACgBeo3CZ0jdqZHxRM5gZnLMlV0cNw6WUTmTdcLdzOar0nIMRY9lFKps
 oKg/HuHpQNXQqWeYmDgLVQ==
X-Google-Smtp-Source: AA6agR6YnP6ot9GFC2YmsPAFaS8mzStQhLIBYsq7Zg+QUzJJFdErvSL6rj1KCpYcElzx/lMxYLblxA==
X-Received: by 2002:a05:6870:f203:b0:10b:ad04:57ff with SMTP id
 t3-20020a056870f20300b0010bad0457ffmr1944683oao.219.1663080893771; 
 Tue, 13 Sep 2022 07:54:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q125-20020acac083000000b003437e4f2510sm5203060oif.11.2022.09.13.07.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:54:53 -0700 (PDT)
Received: (nullmailer pid 3659687 invoked by uid 1000);
 Tue, 13 Sep 2022 14:54:52 -0000
Date: Tue, 13 Sep 2022 09:54:52 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 15/15] dt-bindings: soc: qcom: apr: add missing
 properties
Message-ID: <20220913145452.GA3659654-robh@kernel.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
 <20220910091428.50418-16-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220910091428.50418-16-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>
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

On Sat, 10 Sep 2022 11:14:28 +0200, Krzysztof Kozlowski wrote:
> The APR bindings were not describing all properties already used in DTS:
> 1. Add qcom,glink-channels, qcom,smd-channels and qcom,intents (widely
>    used).
> 2. Add power-domains for MSM8996.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,apr.yaml           | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
