Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604C62C11F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:40:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C584E16A6;
	Wed, 16 Nov 2022 15:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C584E16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668609656;
	bh=KsV5GjtMw3ZFzzVSwgjTMPGv25CAfDmWS/uhyI1LXJA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I6fkvjF4mH6GzlYQ1SxG3qhdsV8VNL7I8RA0sQbnRzKSA24gR1wwqTO6YzKKsYhAn
	 qB7iqba0AfwW1pajmTMXJlwoYAp7tPeK0YahVDmC84/SYC/8kHDt8T1au1UUoBZ+3r
	 ZJoVCEk0b+5wZlrEOMfrPsZO07NLStjcTxqRHi4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 732ADF80557;
	Wed, 16 Nov 2022 15:40:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F015F800B8; Wed, 16 Nov 2022 15:40:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33680F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33680F800B8
Received: by mail-oi1-f170.google.com with SMTP id n205so18713124oib.1
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9UXnbSoKhr6B7CgP63atJ18eZu6ZT1APvR95IW+ans=;
 b=UfeWNxCLANAmHj55nP4aua48ecfHwN6polpJW2h1JaGprfb2sJqUpmoEc6VS2PjtOe
 6mYsU7IBBkeaaMXEDJpgfDuQlI76c292+JTVHFjBv7gnYm8Zpul4V/faAvSUJdc8iZiR
 XEpK+wprRSVXqXaCXJADj4up5wO7sIaTQcrNB6PsQ5RnEf7X/e5IcNn0SJjkEfiddDvc
 AM38/sQRXJ0j1lyh5IC1kN1Na5rmKseL49sfsvPChioe9pH6dNljbWuEEiuYQk6/NMeA
 eqoX2WPee1s2WMBWUI05GuIxaFBRguTbrtOnzmkbeIRRU5QgIyVOc1qiukn6ZrXnFOMI
 53sg==
X-Gm-Message-State: ANoB5pmDumkvU3wenrOodP699gkfk3Be4Q5lNNeoyGvMRjgrqO/j+/Nr
 GtZddk4zeBgsK4pAvIjtLA==
X-Google-Smtp-Source: AA0mqf4T7Fo/pti2o4JPr1i2O1m/JYwIz+DCgvmPSrrQefb0jUu3FeWGi8/7WtA320N6H+Sqw2v/ew==
X-Received: by 2002:aca:3f43:0:b0:35a:8a2b:e901 with SMTP id
 m64-20020aca3f43000000b0035a8a2be901mr1789982oia.249.1668609593171; 
 Wed, 16 Nov 2022 06:39:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w23-20020a056830145700b0066c7733be43sm6594248otp.30.2022.11.16.06.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:39:52 -0800 (PST)
Received: (nullmailer pid 3818195 invoked by uid 1000);
 Wed, 16 Nov 2022 14:39:54 -0000
Date: Wed, 16 Nov 2022 08:39:54 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 05/11] ASoC: dt-bindings: qcom,q6apm: Split to
 separate schema
Message-ID: <166860959282.3818114.17932974394029745059.robh@kernel.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
 <20221115120235.167812-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115120235.167812-6-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Andy Gross <agross@kernel.org>, quic_plai@quicinc.com,
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


On Tue, 15 Nov 2022 13:02:29 +0100, Krzysztof Kozlowski wrote:
> The APR/GPR bindings with services got complicated so move out the Q6APM
> service to its own binding.  Previously the compatible was documented in
> qcom,apr.yaml.  Move most of the examples from its children to this new
> file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: quic_srivasam@quicinc.com
> Cc: quic_plai@quicinc.com
> ---
>  .../bindings/sound/qcom,q6apm-dai.yaml        | 19 ++-----
>  .../devicetree/bindings/sound/qcom,q6apm.yaml | 51 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
