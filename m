Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2172A74297F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:24:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69037F1;
	Thu, 29 Jun 2023 17:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69037F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688052277;
	bh=uEZ+i5d2u82iYj67d+xX7ScW+fCo0ujDDDUeVm1r1s0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cbv0s1N4rUUTMe5gM2/V07tRK/a/+caFxC96ukhJOSp/MU+ceLjEM2bJJECoHypA9
	 S25LDc/lWzrX+2zvHqdwd5rkuf1g+xIidjRHjTy9fA3Zbix75SjKByEFDZz7KcGMPF
	 o92thKP3BtPdMmtEaLd7U01tc/FQiAuwGF1fZTN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 589E6F80169; Thu, 29 Jun 2023 17:23:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E94B9F80212;
	Thu, 29 Jun 2023 17:23:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEAD2F80246; Thu, 29 Jun 2023 17:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C5E4F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C5E4F80169
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7836272f36eso33544239f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 08:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052220; x=1690644220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIbzwk+16IGxV6FWzckLUrfZmaj1Jf5Ee41P3nY/4zc=;
        b=c/FAVy6dbOrUAtlmFEn/+ITvAbsICMIDEYSxjdoFeSHj0shuXDYeYUwNPrl21ie8mq
         Y58tBeUTKLzgD/SwQ+VIEBwIEwCDvyz0EB6qyYrdkr9NCPSm2r42pDUFuITlx7ixXaUG
         b39Biudi/h3KRyYG3ZYbS6QBhajGqbevgLlsTuF62Zg0N2BNlxRgToeNakiSechxlvti
         /Z2+JLBPgoc4d9MMX1kddEiTBNUGc7C8qFnWlOM7kuPg567kdchu1srxzxwTTbM2O043
         nHDPsHhpYEn3aIxv8UJSxnl5LluKqRXZLypeaVp7wknHZdIOUsXff7amtU4uKXZ7cci3
         B/GQ==
X-Gm-Message-State: AC+VfDyMu8IwCfbomDIpeS9M4Biej75THOAEspRBzLfdcypaqhGd5AJP
	w/WgpFe8GBWmcmFLDwulpA==
X-Google-Smtp-Source: 
 ACHHUZ4BPmwhYeRuCB1b3WD8WeQpdEUY5Y/vga5MesEG9brj/gXSLEqJny1Nwo0NSJlCoeZIxy778g==
X-Received: by 2002:a5e:9508:0:b0:785:fbe8:1da0 with SMTP id
 r8-20020a5e9508000000b00785fbe81da0mr5086305ioj.15.1688052219729;
        Thu, 29 Jun 2023 08:23:39 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 ei23-20020a05663829b700b0042ad757be01sm2260064jab.121.2023.06.29.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:23:38 -0700 (PDT)
Received: (nullmailer pid 3060526 invoked by uid 1000);
	Thu, 29 Jun 2023 15:23:35 -0000
Date: Thu, 29 Jun 2023 09:23:35 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Benjamin Li <benl@squareup.com>,
	James Willcox <jwillcox@squareup.com>, Joseph Gates <jgates@squareup.com>,
	Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
	Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>,
	Shawn Guo <shawn.guo@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vincent Knecht <vincent.knecht@mailoo.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>,
	Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 08/11] dt-bindings: usb: ci-hdrc-usb2: Fix handling
 pinctrl properties
Message-ID: <20230629152335.GA3055525-robh@kernel.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-8-6b4b6cd081e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627-topic-more_bindings-v1-8-6b4b6cd081e5@linaro.org>
Message-ID-Hash: 6YM2VEVGXW6FQVJA7KR4BCXW6GG3AP6Q
X-Message-ID-Hash: 6YM2VEVGXW6FQVJA7KR4BCXW6GG3AP6Q
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YM2VEVGXW6FQVJA7KR4BCXW6GG3AP6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 27, 2023 at 06:24:24PM +0200, Konrad Dybcio wrote:
> Untangle the bit messy oneOf trees and add the missing pinctrl-2 mention
> to handle the different pinctrl combinations.
> 
> Fixes: 4c8375d35f72 ("dt-bindings: usb: ci-hdrc-usb2: convert to DT schema format")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 27 ++++++----------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 782402800d4a..24431a7adf3e 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -199,17 +199,6 @@ properties:
>        In case of HSIC-mode, "idle" and "active" pin modes are mandatory.
>        In this case, the "idle" state needs to pull down the data and
>        strobe pin and the "active" state needs to pull up the strobe pin.
> -    oneOf:
> -      - items:
> -          - const: idle
> -          - const: active

These are no longer valid values? The description still mentions them.

> -      - items:
> -          - const: default
> -          - enum:
> -              - host
> -              - device
> -      - items:
> -          - const: default
>  
>    pinctrl-0:
>      maxItems: 1
> @@ -357,17 +346,15 @@ allOf:
>              - const: active
>      else:
>        properties:
> +        pinctrl-2:

This should be implicitly allowed. Is it not?

I'm reallly at a loss as to what problem this patch solves.

> +          maxItems: 1
> +
>          pinctrl-names:
>            minItems: 1
> -          maxItems: 2
> -          oneOf:
> -            - items:
> -                - const: default
> -                - enum:
> -                    - host
> -                    - device
> -            - items:
> -                - const: default
> +          items:
> +            - const: default
> +            - const: host
> +            - const: device
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.41.0
> 
