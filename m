Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498C62C19F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:57:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFEE9169A;
	Wed, 16 Nov 2022 15:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFEE9169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668610669;
	bh=0xFGt40DTRYlgkFqAi3y2fr1r3eUU3d30LD814L7eeE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uPbJDY8YfMVrab3vPHAd11P73iHshgaPwftWq6jeoTA9W5+5d+FvAOp1I0NGIQkVs
	 +938qikaoplG86L2M/YMF7Obohp9jYsGIUNsjFVtPcN1MV9avbrQxA45JRkQbom2y+
	 piexjz1vZz3aXY5w3mTHeRCyWRwaqu+BxMJsFSSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28116F80238;
	Wed, 16 Nov 2022 15:56:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E6E8F80240; Wed, 16 Nov 2022 15:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C17C4F80169
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C17C4F80169
Received: by mail-oi1-f171.google.com with SMTP id q83so18715478oib.10
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPW1fGxE1mhRMx/p6Fsr3+j14CdHWrLtpScHYKSbOqE=;
 b=ydFh/2WlXjM5VC365O7OdEd37Z5lcNpqpkC2krHMI29pA8lowmLI73EdrftCHmu4YC
 pd2MK6w6Zj5uZnvl9GD+9U9DH1hJX4Fffuy0+PPLsUA7TByBrsXGFy4dcPy/Ha8Zo+CN
 YRS1ki4Vy0TUDo4HvnRBRwn8XBghXuNYLQuz2ogwG0G5pkdfuaUuCyc5FPWLdIJv8jyF
 EwZ8JKjNEjIZTqlJ9AMKIdiosAbPCet/wzSyM0FztdbeKlhLJ7j5cF/05S57OFnUiMxi
 UH399dWOtigrGgJb8fYyup3BmqLQyJiwgc7PfCODfQVm4uNU2N0l8ofHd1wzfjOniu7q
 pu/A==
X-Gm-Message-State: ANoB5plCeYs2MeqgY7FS4yfJgLKOn0UDbybRLEm6V7Go4keLOBtHbvo5
 hCCGXsNJREd6BfxpBhyX0Q==
X-Google-Smtp-Source: AA0mqf7hwfyHvwdhrQp7v01ewBy/80KQA26D36WEUxDucx6nZ98MA0kdQwWAaK9ODXAheGNU1PSQ1Q==
X-Received: by 2002:a05:6808:905:b0:359:d97b:3f6f with SMTP id
 w5-20020a056808090500b00359d97b3f6fmr1809120oih.298.1668610611848; 
 Wed, 16 Nov 2022 06:56:51 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b9-20020aca1b09000000b0035a64076e0bsm6120137oib.37.2022.11.16.06.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:56:51 -0800 (PST)
Received: (nullmailer pid 3839104 invoked by uid 1000);
 Wed, 16 Nov 2022 14:56:53 -0000
Date: Wed, 16 Nov 2022 08:56:53 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 11/11] ASoC: dt-bindings: qcom,q6apm: Add SM8450
 bedais node
Message-ID: <166861061277.3839048.4506198289493413753.robh@kernel.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
 <20221115120235.167812-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115120235.167812-12-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, quic_plai@quicinc.com,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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


On Tue, 15 Nov 2022 13:02:35 +0100, Krzysztof Kozlowski wrote:
> On SM8450 and SC8280XP, the Q6APM is a bit different:
> 1. It is used as a platform DAI link, so it needs #sound-dai-cells.
> 2. It has two DAI children, so add new "bedais" node.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: quic_srivasam@quicinc.com
> Cc: quic_plai@quicinc.com
> ---
>  .../devicetree/bindings/sound/qcom,q6apm.yaml    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
