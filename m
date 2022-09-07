Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5705B0C04
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 20:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F283166A;
	Wed,  7 Sep 2022 20:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F283166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662573734;
	bh=qKfy08njOwbkVVnILGUK4PCJyfdZWCgviDb563fnxXs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKm4HPQEOxAs8fmeBjju8Dte9GQ16eAQUjKW3Gv03dTmYaFLc7G9jouIo8uyPbVpf
	 m2vO7y6VD0qk0K72OUhsm8yESiYcun9EJ4lDqGb4B0C7jN9YgGCM7yD7Lcwak50VQZ
	 aJIeCC6+niLPuuwb5Rpa1mV3xvDKil4EGeMx7PQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB98AF80118;
	Wed,  7 Sep 2022 20:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFE4AF8023B; Wed,  7 Sep 2022 20:01:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CA6AF8023B
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 20:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA6AF8023B
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-1225219ee46so38062755fac.2
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 11:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=CcKlit7HWPI71ZUe/GljJgB5zkSi4EijYD98Jqq648E=;
 b=AAaZGnfX5yYTxv37AZJcw8TkRIeo7Z5mdnwoIing1BpQoAXWS0K05m/ldFncNTxEvW
 uhUkap+0oT52jmr4YzD1Oyki+UeYrsLHiy674XB4ERcNd0No6FEGWGQ0zkANnKXd6GFx
 VjPVMirJmzse9tM269iG8JIEODrKeLcn5DfLy0VBz010IQ0W+VlgNzYcYxxaOAh/oVRb
 gvLLIAOAWkZEpoCXmKnbJCNkae+tQolxaOfpvjBsWyCLn7a3GEEm5C3733fNLsIuzPSX
 My8tnYj/ufxDPavJDjoxGy+iNw773Pw9jCpdI4jMaO5o9HXcpi8sbVnkucDXNbN+qMUs
 LLbA==
X-Gm-Message-State: ACgBeo0EihWp3MAG7GbG8FgSA4qc49jotepSg8TbcaQkOeWLEvVT1MXS
 +5v3KRt+zHfw/m0WeQo+Iw==
X-Google-Smtp-Source: AA6agR4biI7Jy8t1a+y/JH8nraXYykytOrk/m+fs/VxKBmcF6nuftmhGQC4Flf3XySFMmoHn+de8wA==
X-Received: by 2002:a05:6808:199f:b0:343:3592:4dea with SMTP id
 bj31-20020a056808199f00b0034335924deamr1940962oib.163.1662573664559; 
 Wed, 07 Sep 2022 11:01:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s25-20020a056870631900b00127fbb7afffsm949675oao.5.2022.09.07.11.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 11:01:04 -0700 (PDT)
Received: (nullmailer pid 3803412 invoked by uid 1000);
 Wed, 07 Sep 2022 18:01:03 -0000
Date: Wed, 7 Sep 2022 13:01:03 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 10/14] dt-bindings: soc: qcom: apr: correct service
 children
Message-ID: <20220907180103.GA3803351-robh@kernel.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
 <20220907101556.37394-11-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907101556.37394-11-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>,
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

On Wed, 07 Sep 2022 12:15:52 +0200, Krzysztof Kozlowski wrote:
> The APR bindings were not describing properly children nodes for DAIs.
> None of the DTSes use unit addresses for the children, so correct the
> nodes and reference their schema: clock-controller, dais and routing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Correct also sound/qcom,q6apm-dai.yaml (Rob)
> ---
>  .../bindings/soc/qcom/qcom,apr.yaml           | 68 ++++++++++++++++---
>  .../bindings/sound/qcom,q6apm-dai.yaml        | 10 +--
>  .../sound/qcom,q6dsp-lpass-clocks.yaml        | 16 ++---
>  .../sound/qcom,q6dsp-lpass-ports.yaml         | 16 ++---
>  4 files changed, 66 insertions(+), 44 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
