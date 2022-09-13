Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6485B719A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 16:46:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3676179F;
	Tue, 13 Sep 2022 16:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3676179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663080376;
	bh=Sb3gnGWHPJRhdrwN7UahAnKLy7CUaYalfistuWpJMSE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXP7dDjcoZSEazxf0dTrb2OLHlxGoA9YB/bcC9nQfVxHrdrxRuN8SNemnHap5ojF6
	 2aqeK7Jk84JCXan+pNm9Hy55Xm3f+RU8ix379RVWAKbKW4AxIbe4x3y1f/cwbt38p9
	 +x1LPeuXFNa9aSYP6OOf20zwrWr7oP4NzsgBPlX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F65F8008E;
	Tue, 13 Sep 2022 16:45:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E30F80224; Tue, 13 Sep 2022 16:45:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17100F8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17100F8008E
Received: by mail-ot1-f45.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso8232423otb.6
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 07:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=xD+cIArTBa7fVBRdEjR/+V87yxIC1vBaLkxPyYv0Th0=;
 b=yMifKxHYJ5vDLT526lFKsw7IR8+tKVS4b1fAmndkhA07uqUaL0pAi1La3UyDVv9uty
 wCrU4VkLq+ExRSMhobMngdGeUl/LXQZ31ThPNglcgxkOnBZl2VZqM9APcL4ip2LaHmi1
 3kkeF3Y1LUv8w782VVcofBI4eHX79Yt3jz8gszloV5Z/e7mVTV7dSWRjYErEh3wkyiGW
 da1lnEwSC5d82JnftF/G8NtXctiiTkedeSnjNGswFy23UXhzWIZn64hzvJoIGBLVtY6c
 6JZnVk+LLPiuySane/rHAA+PfTck1eZIkeejSBdt4NKV7BDLpUWgWMlDw8N1cAHvpHec
 +J4w==
X-Gm-Message-State: ACgBeo2ExfnvjQDhCFCalB35AiWjc2DiCl8iR1YOkhdW+aPSKkasfh3y
 KC+TgvEydQBMj5U/aZhBJA==
X-Google-Smtp-Source: AA6agR4nLyXa50aImdwEZSQdv3+eOb+hOyj5GXYnsnCdxRmF2RaS6mIFx4dObfBoRtnCV01fWl/P6Q==
X-Received: by 2002:a05:6830:2684:b0:638:8768:238a with SMTP id
 l4-20020a056830268400b006388768238amr12851007otu.230.1663080306873; 
 Tue, 13 Sep 2022 07:45:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x126-20020acae084000000b0034480f7eec4sm5175163oig.12.2022.09.13.07.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:45:06 -0700 (PDT)
Received: (nullmailer pid 3646146 invoked by uid 1000);
 Tue, 13 Sep 2022 14:45:05 -0000
Date: Tue, 13 Sep 2022 09:45:05 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,q6afe: remove binding
Message-ID: <20220913144505.GA3646113-robh@kernel.org>
References: <20220910090856.49271-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220910090856.49271-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
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

On Sat, 10 Sep 2022 11:08:56 +0200, Krzysztof Kozlowski wrote:
> qcom,q6afe is already documented in soc/qcom/qcom,apr.yaml.  The
> version-based compatibles ("qcom,q6afe-v<MAJOR-NUMBER>.<MINOR-NUMBER>")
> are not used (neither in upstream nor in downstream DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,q6afe.txt  | 20 -------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
