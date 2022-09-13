Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 675395B71EE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 16:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91571785;
	Tue, 13 Sep 2022 16:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91571785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663080804;
	bh=o1JHq8XAOgAiAgrignzpo9Jlw5lZ7cjxx7NIiY0dmWc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7i8GUAIi/hHjCV0V/wVTAnP4R1wh4lPmK1vPntXwRNY88iE0bLtpjlXLJ2YcxHDc
	 9m7CtKbKmh/Uuyp0CghCr4NmyaEqSC4RW0Huk6nSJ1/Hj5QoyeT3Q+dis91qEO3pem
	 z1O8bwT/+XcHYYGpm6dJuD7s4BrJkz3eXpue58eU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32C5BF8008E;
	Tue, 13 Sep 2022 16:52:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C5A6F80224; Tue, 13 Sep 2022 16:52:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9C94F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9C94F800FE
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so32847597fac.0
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 07:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=65PJEbjFYTeXGfTL+rGK4NnFiV7DNUWrNwWPhf9K4xs=;
 b=gX+di4U2fHal/jB1AAlfDxUBoPBBl4NvpapGUV1eHAqzVbAdZxmJYxcrYBTjpUwVfe
 F4ZHtM+jqH+2W6A3YV7l0e/OapOL+GlCp8YwEEG9z9D+Z10KttZ0AtPCSMNXtCjFSxJK
 CG8uqEzkIOItvlPqXU+yG9/gTnJfIB1YWdC47ZTiV8E643uEeqg78q1W3nGMnzKeyYkP
 Uw1kJ2OyVEHW4wrejcKgK+b1E/VLAFEvRb3sbOAW5p0MOc7kO4gu4ny/8EhamPggwBMa
 P+kTyhGrRC7ITbk5d4pk8udaLGrCLJtbIa974fQ3fs1jbq/6K5zYsQv/heYqV9wW1zli
 1RNg==
X-Gm-Message-State: ACgBeo2j57iW8uuCaeJbp38q8EZRyjs5FRkZ1CYwEOyJA3UZ8yq93hW4
 3+eqOc/Khr9jbg3dHzS9RA==
X-Google-Smtp-Source: AA6agR6td+yioCg7UVwjN1+fuYXabS/DfqUdfH+qW5g8tBKhJrI64w17jpYDB7zKkfooui9z24VdmQ==
X-Received: by 2002:a05:6870:f706:b0:11d:4f5c:e7b0 with SMTP id
 ej6-20020a056870f70600b0011d4f5ce7b0mr1996734oab.49.1663080734854; 
 Tue, 13 Sep 2022 07:52:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o3-20020a056871078300b00127a6357bd5sm3257078oap.49.2022.09.13.07.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:52:14 -0700 (PDT)
Received: (nullmailer pid 3655647 invoked by uid 1000);
 Tue, 13 Sep 2022 14:52:13 -0000
Date: Tue, 13 Sep 2022 09:52:13 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 11/15] ASoC: dt-bindings: qcom,q6adm: convert to
 dtschema
Message-ID: <20220913145213.GA3655614-robh@kernel.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
 <20220910091428.50418-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220910091428.50418-12-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
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

On Sat, 10 Sep 2022 11:14:24 +0200, Krzysztof Kozlowski wrote:
> Convert Qualcomm Audio Device Manager (Q6ADM) bindings to DT schema.
> 
> The original bindings documented:
> 1. APR service node with compatibles: "qcom,q6adm" and
> "qcom,q6adm-v<MAJOR-NUMBER>.<MINOR-NUMBER>",
> 2. Routing child node with compatible "qcom,q6adm-routing".
> 
> The conversion entirely drops (1) because the compatible is already
> documented in bindings/soc/qcom/qcom,apr.yaml.  The
> "qcom,q6adm-v<MAJOR-NUMBER>.<MINOR-NUMBER>" on the other hand is not
> used at all - neither in existing DTS, nor in downstream sources - so
> versions seems to be fully auto-detectable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v3:
> 1. New patch.
> ---
>  .../bindings/soc/qcom/qcom,apr.yaml           |  3 +-
>  .../bindings/sound/qcom,q6adm-routing.yaml    | 52 +++++++++++++++++++
>  .../devicetree/bindings/sound/qcom,q6adm.txt  | 39 --------------
>  3 files changed, 54 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
