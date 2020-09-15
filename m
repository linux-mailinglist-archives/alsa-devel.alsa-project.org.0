Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A11C26AA2E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 19:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A611687;
	Tue, 15 Sep 2020 19:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A611687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600189266;
	bh=FcX7hOr5Gq8mHaYvOlxH2EKQb62JS3d4zdTIhhjHRaA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNwiAow3qZHrbXYp+TkJWioFBuq+4Tw5GKJf8cZDTcYHHZk1Lj/RVipQvNQJZjMdC
	 f79P3VeWbhwS4BW1/csHbFbhJtQ6LPhlBttQ9Rq1wGbjPR7fU8/hDIsS0t59f6RDwL
	 1qio/gAAS7xp9B3SbNC/E2i71CjB1aE10QYg4VS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E017F80276;
	Tue, 15 Sep 2020 19:00:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 573E0F8025E; Tue, 15 Sep 2020 19:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A978BF80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 19:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A978BF80146
Received: by mail-io1-f68.google.com with SMTP id d190so4890981iof.3
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 10:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BFviqgFIWRut0eU0K6H+y+f/pPgiXCv3xoSL8tn8HHs=;
 b=ebnvPO2i/EJe4YXdymMMr6FQSVyVcT/Wr564wv0BNYKCkQ5Hcle3Ppf2sbx8WElWDE
 EobZ5keB8xAjKZJc3QFPk7S8B4DqbwZEvWVKnMXmasli0OrglrDO/ymN+yf88QJMbqlJ
 VWMBaoTsgjNHMiNJJRUP+e1CbcSI200X4fq+VwETQ0ez/mZVMgWq7lXELx2a7zgpkXLc
 VFwco3YxGkd9iRD2uUtNZd/Dzc6WEe3jPkg5DFAf70NV28aD9PNn/wYiPozt7w9Vonle
 CT5YaN2qYMj9W0Jh7CS82twNfDJVo15Yl1wNxAEhD3m7WGjfHIQaXNVX3vwrCTzObHYS
 AGZQ==
X-Gm-Message-State: AOAM532WVIzHNpbSO7Lp/6fLeE7XeoqpejFhVqd9cnHLS+MaPQFl7Am+
 GUncjuWAqHwrhWDdtUIzhQ==
X-Google-Smtp-Source: ABdhPJwlOK3415SZU7crEdleYLmA5Xut63SzqKMQt4DXj3NOqdQUDv7Z1Gs9HZKBmjrRx8Wu+CD9eA==
X-Received: by 2002:a5d:840a:: with SMTP id i10mr15791731ion.4.1600189202340; 
 Tue, 15 Sep 2020 10:00:02 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r5sm9320455ilc.2.2020.09.15.09.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:00:01 -0700 (PDT)
Received: (nullmailer pid 2122994 invoked by uid 1000);
 Tue, 15 Sep 2020 16:59:58 -0000
Date: Tue, 15 Sep 2020 10:59:58 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v4 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
Message-ID: <20200915165958.GA2118432@bogus>
References: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
 <010101746ed1d41a-5890a534-9c2c-4203-bce5-46075d7827da-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010101746ed1d41a-5890a534-9c2c-4203-bce5-46075d7827da-000000@us-west-2.amazonses.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
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

On Tue, Sep 08, 2020 at 05:44:39PM +0000, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Adds bindings for lpass hdmi interface
> which can support audio path over dp.
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 51 ++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 09c9bd2..7c2ac0c 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -22,6 +22,7 @@ properties:
>        - qcom,lpass-cpu
>        - qcom,apq8016-lpass-cpu
>        - qcom,sc7180-lpass-cpu
> +      - qcom,sc7180-lpass-hdmi
>  
>    reg:
>      maxItems: 1
> @@ -60,10 +61,12 @@ properties:
>      const: 0
>  
>  patternProperties:
> -  "(^mi2s-[0-9a-f]$|mi2s)":
> +  "^dai@[0-9a-f]$":
>      type: object
> -    description: Required properties for each DAI
> -
> +    description: |
> +      LPASS CPU dai node for each I2S device. Bindings of each node
> +      depends on the specific driver providing the functionality and
> +      properties.
>      properties:
>        reg:
>          maxItems: 1
> @@ -145,6 +148,22 @@ allOf:
>          - iommus
>          - power-domains
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7180-lpass-hdmi
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pcnoc-sway-clk
> +            - const: audio-core
> +            - const: pcnoc-mport-clk
> +      required:
> +        - iommus
> +        - power-domains
> +
>  examples:
>    - |
>      #include <dt-bindings/sound/sc7180-lpass.h>
> @@ -178,12 +197,36 @@ examples:
>              #address-cells = <1>;
>              #size-cells = <0>;
>              /* Optional to set different MI2S SD lines */
> -            mi2s-primary@0 {
> +            dai@mi2s-primary {

The unit address should be a number.

As this is not failing checks, then you are missing an 
'additionalProperties: false'.

>                  reg = <MI2S_PRIMARY>;
>                  qcom,playback-sd-lines = <1>;
>                  qcom,capture-sd-lines = <0>;
>              };
>          };
> +
> +        lpassh@62d87000 {
> +            compatible = "qcom,sc7180-lpass-hdmi";
> +
> +            reg = <0 0x62d87000 0 0x68000>;
> +
> +            iommus = <&apps_smmu 0x1032 0>;
> +
> +            power-domains = <&lpass_hm 0>;
> +
> +            clocks = <&gcc 131>,
> +                 <&lpasscc 6>,
> +                 <&lpasscc 10>;
> +
> +            clock-names = "pcnoc-sway-clk", "audio-core",
> +                          "pcnoc-mport-clk";
> +
> +            #sound-dai-cells = <1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            interrupts = <0 268 1>;
> +        };
>      };
>  
>  ...
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
