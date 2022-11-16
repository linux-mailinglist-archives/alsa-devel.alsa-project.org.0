Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C3862C12D
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:42:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E4F169B;
	Wed, 16 Nov 2022 15:41:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E4F169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668609735;
	bh=CIwonDme541HLHEbe7X2ioL+JSsvT/nQXkjcinBP2/M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXQuvF+rLQxyTJgywnoSV5S+cWRTN5TFM0AvbRA+JGoPgdfooNwNEM+hShaeK4vAS
	 AQP8eu9qTo1nlZG3nVZcyB22EAVDzw9DGil3Ob20y9y7VhkgbwXMtrW9giLxC8fHiK
	 sTvsnGuBqLAmvwoBZOBJsT7unt/bgTMIsFDc71YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE34F800B8;
	Wed, 16 Nov 2022 15:41:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F788F80169; Wed, 16 Nov 2022 15:41:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9CDDF800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:41:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9CDDF800B8
Received: by mail-oi1-f181.google.com with SMTP id q83so18663604oib.10
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brFdIdCSdk4c1YSRoT9/yP4QBCF0DsdC9qEoiJM3U6Y=;
 b=05VzY4sRmv/DG49zH+Vuw5TDkaMe+c2weXuPS/10K8Re7XCRCtH4P9AL91+o/mK9+M
 PJZuHcwpURmR3ZPW572hoM16mTaY/K5F2T6IQ9kzQ4JrgaPxZO3ARRpfGuusjw9Eoe1M
 ZtAjgF+UqWgLS7+O7o76A0Mw8iQ1EG58a8CU2+/b6sY4z6oGse0PuAJdCpJQj4qZOPBX
 LXvbBIpQWbyXezjtH57jqXqqgsgo36VpUSQ8FIEMa5sC3cAljdO94jqcQK0T1BkQCiQW
 badyorWp+0XCDeRmtU7vL5zr3UDGiFBKw5bNdGTEYsjxbbtoawtyEz8nx0DZ/xnQpv9b
 8dMg==
X-Gm-Message-State: ANoB5pkUmOKl+UuqCJXXag/Ws7tMCHsgRqUzlMBrviGC/4QtbIP48bEc
 YoBJzC+pLSyaCaChTzZbWr6GuISBkQ==
X-Google-Smtp-Source: AA0mqf7+/UJK9Rx8C+CNmeAkmoblIIOsTe0/ISsySmnlpZyhQKA3ZFwJ9qcXsacwOiZcSoOb7j4fLw==
X-Received: by 2002:a05:6808:1446:b0:34b:7532:2d0e with SMTP id
 x6-20020a056808144600b0034b75322d0emr1779463oiv.109.1668609671847; 
 Wed, 16 Nov 2022 06:41:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y13-20020a4a980d000000b0049e9aacbd3asm6002743ooi.16.2022.11.16.06.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:41:11 -0800 (PST)
Received: (nullmailer pid 3819889 invoked by uid 1000);
 Wed, 16 Nov 2022 14:41:13 -0000
Date: Wed, 16 Nov 2022 08:41:13 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 06/11] ASoC: dt-bindings: qcom,q6adm: Split to
 separate schema
Message-ID: <166860967257.3819826.11515888453674367702.robh@kernel.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
 <20221115120235.167812-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115120235.167812-7-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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


On Tue, 15 Nov 2022 13:02:30 +0100, Krzysztof Kozlowski wrote:
> The APR/GPR bindings with services got complicated so move out the Q6ADM
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
>  .../bindings/sound/qcom,q6adm-routing.yaml    | 22 ++------
>  .../devicetree/bindings/sound/qcom,q6adm.yaml | 51 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
