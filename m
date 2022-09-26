Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221D5EB4F3
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 01:00:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0453684B;
	Tue, 27 Sep 2022 00:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0453684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664233229;
	bh=zf3WKF4i2zo6WVus81hKg9SKqNlmwdIKOi2heWGUOWM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1TT/cwAd3cxvRdO14ro48uEdzATMlmbWY4XT91VNnMc3xC45Rl5ztSTtNufHwW/V
	 uNDN9MbpVHJ/fBJCFSPL2nfypC/kORnmcs87vtPMhE9vN3vdPOkHvRJ3ROVXTByont
	 grZwnFIPh4NeGobY93/D/XCq/ijYs/AfeT58Xpq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A07E1F80134;
	Tue, 27 Sep 2022 00:59:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79F30F802BE; Tue, 27 Sep 2022 00:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51404F80254
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 00:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51404F80254
Received: by mail-oi1-f170.google.com with SMTP id s125so10079048oie.4
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=G1nYtk8mEOVoyeeft0wUFqBP6nfvgAT1OE7LASp1Y7Q=;
 b=Nc4NsPGFyam774SgL4crld24C2iAWcu2FoUNBv2Im3eFVaJVw8CFFSbq4fnRlri9sq
 2M4s+BJyhD25tNsbvNSQ0gVPG0FNcS3hhIcX2QnWAZmIGq3ubvml5Zn/xl0/9EwEwEeX
 Gya76p6zMs2RB5aAXVIaCoXM/JyRzaPYEy4WrP/otg0JH1oS0xudv+iw3FzDs6oyYOOz
 dmvGat18K8SvG7epigawEqYHH+p0DC+Ki0fjV/6Tm/C0VKGvYzUaVgtVc6+nHV31zoJJ
 qATZW+ABPhu6GTuFQs6cvlF7b8gPI9X1HDWW1hOiWj0CXfeKy2DxHYgj9xE0TnlieYSw
 5ddg==
X-Gm-Message-State: ACrzQf2D5fnQ5yq/8W25279O7j2MH0uXdCo2DrmIzm3eamBd94xIGKws
 OgvieFJaw4lSbLnF9QPpew==
X-Google-Smtp-Source: AMsMyM68dzdCvNHTwgkYRyIWg2iK9c9WNyjxUq8oaywqVSlqKg/Wq2ekbLSidqq2dSUL+cXlDXZnLw==
X-Received: by 2002:aca:1912:0:b0:350:504b:ee13 with SMTP id
 l18-20020aca1912000000b00350504bee13mr513201oii.256.1664233169638; 
 Mon, 26 Sep 2022 15:59:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f47-20020a4a8932000000b0044b491ccf97sm7062458ooi.25.2022.09.26.15.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 15:59:29 -0700 (PDT)
Received: (nullmailer pid 3123199 invoked by uid 1000);
 Mon, 26 Sep 2022 22:59:28 -0000
Date: Mon, 26 Sep 2022 17:59:28 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 11/11] dt-bindings: slimbus: qcom, slim-ngd: convert to DT
 schema
Message-ID: <20220926225928.GA3123152-robh@kernel.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
 <20220923161453.469179-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923161453.469179-12-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

On Fri, 23 Sep 2022 18:14:53 +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm SoC SLIMBus Non Generic Device (NGD) controller
> bindings to DT Schema.
> 
> During conversion add iommus already present in DTS and extend the
> example based on SDM845.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/slimbus/qcom,slim-ngd.yaml       | 120 ++++++++++++++++++
>  .../bindings/slimbus/slim-ngd-qcom-ctrl.txt   |  82 ------------
>  2 files changed, 120 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim-ngd.yaml
>  delete mode 100644 Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
