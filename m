Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3522C7FDBE1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 16:47:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C05E384A;
	Wed, 29 Nov 2023 16:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C05E384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701272839;
	bh=GE/A8irx9ijSCPblQjbRbRok3+/ld8pEhAvHKMXvPNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HBviQNYZkW2dfw68va9N8dRsn7LlM7F7yrwR3QJ/Yjys2YYQU7u9+rTG+jxo9BVxX
	 NdQXo2ntSyo3Ucu2uNbqaUJDMdA2ExXcNCYIaL2ByjWclrAEAVB0xcvx40VjgXF5lP
	 TiA/M7PhlAiCu9nmrLeRF1iooJrGoUbPDoyE2VN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC1CAF8057F; Wed, 29 Nov 2023 16:46:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40DA3F8057B;
	Wed, 29 Nov 2023 16:46:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5AF6F801D5; Wed, 29 Nov 2023 16:46:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA56FF80166
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 16:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA56FF80166
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6ce2eaf7c2bso4117457a34.0
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 07:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272811; x=1701877611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJ23N4x9xsyS+PdtjpIOJ1tiYnfSGNct1P34OTOLm2k=;
        b=otlFoGYYG0WpN7W0PwquS6mFc0PefGQ/GNcKli5pvkeDN38aL2o6ykTGWvixtPEVfV
         h8NRHeeaqIkIsdCLrb5OMF+iJzOOlSV5tFKlfZXGB/X/yKaJsETa3QBbTUFuqcPIGhGN
         Xpq/KnzQETBFQgK/JQAG4RrhaqeKgFAYsbG7SZTcFsQX+D94KvJBGpQlakQDru05Z+8x
         DZTMyahubClkDx/UwhZ+dNoSsu31y6y8BqLNSMrYqtvu6Y+4jK1YPpi946pp09h0+CKx
         jdGq8WA3n34CXcTgVR+02QVUZ5btmn8Tb+yePcoIVGKS9gWm70i26OYLLvj9FFFYf+Zn
         Fk2g==
X-Gm-Message-State: AOJu0YxT8wEseYwaCMwBBiTKsLHYUDUMY4RNAUGZ5A7PAGA5MZY430xC
	pte608ud14YAc+S87i+ruA==
X-Google-Smtp-Source: 
 AGHT+IH1cW5WeqpkTlob3Rn0FcoRYZoiNqB7GPItDNM4+VO90I/UqzXgHGRDuxBkDGTJ34CdR2GIPg==
X-Received: by 2002:a05:6830:34a9:b0:6d8:138a:dd8b with SMTP id
 c41-20020a05683034a900b006d8138add8bmr16934439otu.33.1701272810799;
        Wed, 29 Nov 2023 07:46:50 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 d22-20020a0568301b7600b006b87f593877sm2023303ote.37.2023.11.29.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:46:49 -0800 (PST)
Received: (nullmailer pid 2542152 invoked by uid 1000);
	Wed, 29 Nov 2023 15:46:48 -0000
Date: Wed, 29 Nov 2023 09:46:48 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8650
 LPASS WSA
Message-ID: <170127280827.2542113.8003220554875038607.robh@kernel.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
 <20231129113014.38837-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129113014.38837-4-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 6RPCQIN76MV4W2AHPVJOLQR6RJR6GZQU
X-Message-ID-Hash: 6RPCQIN76MV4W2AHPVJOLQR6RJR6GZQU
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RPCQIN76MV4W2AHPVJOLQR6RJR6GZQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 29 Nov 2023 12:30:14 +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) WSA
> macro codec, which looks like compatible with earlier SM8550.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

