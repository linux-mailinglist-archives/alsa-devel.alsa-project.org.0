Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED696D652B
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 16:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A086204;
	Tue,  4 Apr 2023 16:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A086204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680618179;
	bh=li5+gFfAbCE/bdKkaHeoL7jrY7J9yrMF0B5zR0P1i2U=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p9DIq09Cawmt4shpRki1vGvcHBVoAqJ8y1wDAbhjjJZRi+HgAkmSWrzaGxSzpwF1Z
	 AUf7nHRF7SIJEGrdHVhP0ucmjL0uG3b9nYZOc2mmKHyc1AzMQZHHDadF6CBQx9b1ZG
	 PC80CB2zX6UbBh//ycib0nmUrrB5GXgrf6J8Ny0o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB02BF801C0;
	Tue,  4 Apr 2023 16:22:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96AC8F8024C; Tue,  4 Apr 2023 16:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32CEBF80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 16:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32CEBF80171
Received: by mail-oi1-f177.google.com with SMTP id bx42so8762627oib.6
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Apr 2023 07:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9ksvzbq2gQvGRcF4d3P6MDp1Pp3aLiB4KPYctYyISA=;
        b=Vfu4G9VmQcVoPz32FG40KUQgOC/ELPyktIWbFt7lv/gIeX6QBKnTI3+jUXPkRMkmfw
         0BOJYWqE9JPWfS/faNzJ8JTyjYmAcl06h9KcijPVDx+6ggIA5Sti414iSwCs1doHqzNH
         JRt0kh+u4fbm3mzhAhtzilpGCl90NekD9HJRMuoemnxIHdbWDtWY2hoqlhxipAbnyBQF
         7ck2AFUpAYTkcVXkZ2ttERLuFn/vWnUXwrGk3wu1zJW0WJq0nigwq+qYrb0C/7e/qT18
         yCpiSmdEcV2xQz9V99dFGD3Xj91ef7AeSUeDsTVidvn5AY9be4aQPWc6oX7gqBSLo1vY
         tIEw==
X-Gm-Message-State: AAQBX9cHeg0vCPYoFGHjkuSOhhILn0pjXl//fmWpq6L/wvQhKy/tftdG
	hm9UC9ZqBtq8yvz1qSOKqg==
X-Google-Smtp-Source: 
 AKy350bfLilcIpHOP2DnsH5J5CDj+2U3bSb1BmQbgZesFcN/dqwmrnUzaqaa+zuxaQlLVp6rk6pDMQ==
X-Received: by 2002:aca:bed5:0:b0:387:205b:70c7 with SMTP id
 o204-20020acabed5000000b00387205b70c7mr1313305oif.13.1680618121888;
        Tue, 04 Apr 2023 07:22:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 p8-20020acabf08000000b003871471f894sm2497572oif.27.2023.04.04.07.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:22:01 -0700 (PDT)
Received: (nullmailer pid 3829375 invoked by uid 1000);
	Tue, 04 Apr 2023 14:21:59 -0000
Date: Tue, 4 Apr 2023 09:21:59 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Message-ID: <20230404142159.GA3827653-robh@kernel.org>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 3P7WAY5ZNN3XIY533CKBQ7V3WQNKRK42
X-Message-ID-Hash: 3P7WAY5ZNN3XIY533CKBQ7V3WQNKRK42
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3P7WAY5ZNN3XIY533CKBQ7V3WQNKRK42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 03, 2023 at 03:24:58PM +0200, Krzysztof Kozlowski wrote:
> The port sample interval was always 16-bit, split into low and high
> bytes.  This split was unnecessary, although harmless for older devices
> because all of them used only lower byte (so values < 0xff).  With
> support for Soundwire controller on Qualcomm SM8550 and its devices,
> both bytes will be used, thus add a new 'qcom,ports-sinterval' property
> to allow 16-bit sample intervals.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soundwire/qcom,soundwire.yaml    | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index c283c594fb5c..883b8be9be1b 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> @@ -86,7 +86,7 @@ properties:
>    qcom,ports-sinterval-low:
>      $ref: /schemas/types.yaml#/definitions/uint8-array
>      description:
> -      Sample interval low of each data port.
> +      Sample interval (only lowest byte) of each data port.
>        Out ports followed by In ports. Used for Sample Interval calculation.
>        Value of 0xff indicates that this option is not implemented
>        or applicable for the respective data port.
> @@ -94,6 +94,19 @@ properties:
>      minItems: 3
>      maxItems: 16
>  
> +  qcom,ports-sinterval:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Sample interval of each data port.
> +      Out ports followed by In ports. Used for Sample Interval calculation.
> +      Value of 0xffff indicates that this option is not implemented
> +      or applicable for the respective data port.
> +      More info in MIPI Alliance SoundWire 1.0 Specifications.
> +    minItems: 3
> +    maxItems: 16
> +    items:
> +      maximum: 0xffff

Why not use uint16-array?

> +
>    qcom,ports-offset1:
>      $ref: /schemas/types.yaml#/definitions/uint8-array
>      description:
> @@ -219,10 +232,15 @@ required:
>    - '#size-cells'
>    - qcom,dout-ports
>    - qcom,din-ports
> -  - qcom,ports-sinterval-low
>    - qcom,ports-offset1
>    - qcom,ports-offset2
>  
> +oneOf:
> +  - required:
> +      - qcom,ports-sinterval-low
> +  - required:
> +      - qcom,ports-sinterval
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 
