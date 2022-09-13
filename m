Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 841715B7244
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 16:54:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA1917B5;
	Tue, 13 Sep 2022 16:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA1917B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663080855;
	bh=4uYJu4jMvyb4X4X2wwgAhw+zDaNoZuHpyHrrX+LMbmM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lduuZYgLldZbbV+Je2Ol9VUglniM0AHVnnezZAD5hH+NW4bviPEcH7sAaA+bzNp6L
	 6DffVbjpvSZgkbIUUdcLB3TUz3Qz+A6aF7djE8c1Frv1U/c99CSFdVsH4w7Hipe1YS
	 l7XB5MgeRE6R9/hfMqTBaF4M0fnCqbPrwGF7FC/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB132F80224;
	Tue, 13 Sep 2022 16:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22F01F80269; Tue, 13 Sep 2022 16:53:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1E29F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1E29F800FE
Received: by mail-ot1-f48.google.com with SMTP id
 w22-20020a056830061600b006546deda3f9so8254978oti.4
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 07:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Lsd77rlgCpAEMWqUkzrpyisg9ITe2s4xl/Nuh6eYp+I=;
 b=gliotd0aAkTn6THN/7SFNiw7A2ooEV6Pa0BG4CKz2iB+QR6f4dclR7c+zKaRePbooe
 T2vfPtyJZLRyx4BJG8FITlNhE8vy4wkc95c0qsj/cqCoUgyUad/qiIThx5mjYDbNiS/o
 Ive/bqhWVgqauXmcWb5JyWKU84R2sEdRpugdXxUie6/uUJTQuI0hzeGk7kkh17b/5bzZ
 aoEuUvbKAMTnf4ub4k9taNN3OsJC6VT2j1Rn1dp0S5c4sslk8Wb3WK9ppx1DWWT5tJGu
 x6DzQNBH3JJOih95Y7la7y5ROcaxbJDThkX7R4gDRpBhUVb090JOHxL+cUd6dzCOpKGL
 4lUg==
X-Gm-Message-State: ACgBeo17HRxBe1vpljXhjOIFrm5hAxHJDwxQdJSw/rCZuokjrYnRb0op
 6UvZ5AIk9LxT0jIOEF3ogzYWbL/Zow==
X-Google-Smtp-Source: AA6agR5gQ/TBzv/n/7VNj/jVDgqjLFWls25AXNbU27adRVVFAcpluZhdpOZ8BU3KM4FYbL6a0w+ARA==
X-Received: by 2002:a9d:7a8e:0:b0:655:e0a9:b3c6 with SMTP id
 l14-20020a9d7a8e000000b00655e0a9b3c6mr4691535otn.367.1663080795021; 
 Tue, 13 Sep 2022 07:53:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056830056b00b00636eeba9209sm6109338otc.52.2022.09.13.07.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:53:14 -0700 (PDT)
Received: (nullmailer pid 3657155 invoked by uid 1000);
 Tue, 13 Sep 2022 14:53:13 -0000
Date: Tue, 13 Sep 2022 09:53:13 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 12/15] ASoC: dt-bindings: qcom,q6dsp-lpass-ports:
 cleanup example
Message-ID: <20220913145313.GA3657111-robh@kernel.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
 <20220910091428.50418-13-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220910091428.50418-13-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
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

On Sat, 10 Sep 2022 11:14:25 +0200, Krzysztof Kozlowski wrote:
> Cleanup the example DTS by adding APR and service compatibles, adding
> typical properties, using proper device node names for services and
> fixing indentation to 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Add few more properties.
> 2. Adjust indentation (better).
> ---
>  .../sound/qcom,q6dsp-lpass-ports.yaml         | 48 +++++++++++--------
>  1 file changed, 27 insertions(+), 21 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
