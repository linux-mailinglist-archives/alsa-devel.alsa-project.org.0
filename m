Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F22962C10B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:38:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB863169B;
	Wed, 16 Nov 2022 15:37:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB863169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668609494;
	bh=n/lyo7LQUpOieRf65X/Ms+D8GbJr3DSbfJJcVACowOI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SD5E+d8oRnzI22HimEaeCM7i2N49YMC3Y5I2E7jZ0aRVSpBP7EJA1xNrcnCeqs0YW
	 3dFEiYvB/x/sd4OvKpSgCkZsgwRWs+/Nono8B3oDMIoiZSz7fXr9FRq6/Rdam1zSgD
	 +HojeDO/hCiXPCfBZbGmEmv32iPKm1xmoPjTsgxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5372EF80089;
	Wed, 16 Nov 2022 15:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5C65F80169; Wed, 16 Nov 2022 15:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6A00F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6A00F800B8
Received: by mail-oi1-f179.google.com with SMTP id q83so18650202oib.10
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFqEVeiOGdmdH2PP7fid7uM73jsm1VRTwjrkKfa7rbQ=;
 b=8LXS1vAj88dZ5pcR9gty3oItALqx1Wpr+QhXsNdkAofEjDhcq4inlGyB7sfl6XrelG
 WDDf7K/zU15YE0RoAMVb4X8Oq9txdb7aMl/9HgA+pAxrcRIarVd0/WPkGAzVxqS+32eU
 MfP1GHChGqr21fzY5avvr6SU6eTSpBoU7UYBE3r2W0uCdo21qIKRKK3OCwTSfu5AJ2w5
 VQWAj8skpcWl9jiRAxWIsD0/lwgvOfwS4qoVxFPpOUT4CEZ1WCR8p5gOY7Rk6gSPBOEa
 VCScDK3Ih/dbj95St6Fw7xc+3bpvIIsKXLJlpqa7ZwbsWOVoBP1LgAVjqo9nt/bapxTl
 7VRA==
X-Gm-Message-State: ANoB5pl1e9lhrvwZb73iIsGycqfsjqI3I2FkmwihwVsmFhUZK8kXGZZJ
 QPe0w849RvOt+qyEGJU2cFd+9Fz4Vw==
X-Google-Smtp-Source: AA0mqf6xFdK5qLXwDeKCyPu+fMM2QIrZuIBwEkqqZio1DIOYzfGje42p2s8TKZrMX+gIgDSiB4jcCw==
X-Received: by 2002:a05:6808:1486:b0:35a:3662:c693 with SMTP id
 e6-20020a056808148600b0035a3662c693mr1630798oiw.192.1668609430601; 
 Wed, 16 Nov 2022 06:37:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w6-20020a056830110600b0066d12f2441esm6633468otq.27.2022.11.16.06.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:37:09 -0800 (PST)
Received: (nullmailer pid 3814691 invoked by uid 1000);
 Wed, 16 Nov 2022 14:37:12 -0000
Date: Wed, 16 Nov 2022 08:37:11 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 03/11] ASoC: dt-bindings: qcom, apr: Correct and extend
 example
Message-ID: <166860939523.3813949.14489034056819986470.robh@kernel.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
 <20221115120235.167812-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115120235.167812-4-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, quic_plai@quicinc.com,
 Bjorn Andersson <andersson@kernel.org>, quic_srivasam@quicinc.com
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


On Tue, 15 Nov 2022 13:02:27 +0100, Krzysztof Kozlowski wrote:
> Correct the APR/GPR example:
> 1. Use consistent 4-space indentation,
> 2. Add required properties to services nodes, so the binding check
>    passes once schema for these services is improved,
> 3. Add few other properties as APR/GPR is part of a GLINK edge:
>    qcom,glink-channels and qcom,intents.
> 4. Drop unnecessary services, to make the example compact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch.
> 
> Cc: quic_srivasam@quicinc.com
> Cc: quic_plai@quicinc.com
> ---
>  .../bindings/soc/qcom/qcom,apr.yaml           | 61 ++++++++++++-------
>  1 file changed, 39 insertions(+), 22 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
