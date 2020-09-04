Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBAE25D6A0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 12:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B50BF1AF3;
	Fri,  4 Sep 2020 12:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B50BF1AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599216175;
	bh=xrV/MNfwo0lPJ72VXvbW+1agEROQ4FUOrKNQR9GHZDg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnKWF/rxUEvO6kHPqZt1OjRIfpdFpoy3/7vy77sUEXW7rTbheBiwB1b0bCfD0sC1u
	 cyQNsrWY2qcR2ko1E83bN+FU8/FHJ0PzXgmMir/3178Gefwc18xNvr/aoVmopy3vXH
	 OutoQXN+DJhEedPekRjJ6T+Xw8Xgu+dNXampXHl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E08EDF80113;
	Fri,  4 Sep 2020 12:41:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A697FF80257; Fri,  4 Sep 2020 12:41:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89FCBF80113
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 12:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89FCBF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="A8RehVNj"
Received: by mail-wr1-x443.google.com with SMTP id z4so6255936wrr.4
 for <alsa-devel@alsa-project.org>; Fri, 04 Sep 2020 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AGBcS2K0ImWeFfrWpXAI/Xo9a8mhl/De79Zkj63qpo8=;
 b=A8RehVNj2xNOT/YL0vidlBxy+xDK9yHRYixalgDgUzpDo0b2eWBf91ky71RbcCgfLI
 DSUxy5yGwMgvxqu2EHmf6TyyQKvfmM8vyx21XwUgomecbTqPw+Bu7ifHxTDobz3xrrSN
 Kw6co+OlPpAwUfCQuG9m6IsytM808G+9eMJPWCVrbeEXbf4uIyxfN6l/4SuLfQRK8jAm
 ZrixQptcS2fmcPcDzTkuA3kiZBb33JUdnadF/BvwS1Tw1e+wM2peYT7wSutrbzLMyiJ3
 ahIiKveyR3l8fkxoFDO6OV+EMlf5kFbj0OdiL8M+3esTGP23zrwqxWayWnzK3lpPbsP3
 UAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGBcS2K0ImWeFfrWpXAI/Xo9a8mhl/De79Zkj63qpo8=;
 b=J+s290AjMdWv6lbMdxxyYGIE8zpASpJ1uhbpuzQbeTOWfMMhdrBqRK3gj8WGlK1Ujl
 5hIfCM6cbqeMDAhKzv4WwKsheJQ1tBH6qPUo4N/Thm+XGR1xAigdHTdYj4TroYHDh3Ca
 WhQqqUUXoB4iyT+XwQSFpm0RUj9B8rjhJvX2ieSRJKu/E8Q2lslsNQv9XTQx5HkywWyK
 xC2FvUDvIdWsFCipLxXI3ZutDgPsqR/TUGN/Dv+9Cx7F4tiBHZocIvJi5guOb514FgBe
 oqPApbeQfOlU3EgBzJFC9bYoCs3+W7tD7dPPV4tIOEw+7SsaIQC15I0qpg5Q6LPkD4BP
 mTJQ==
X-Gm-Message-State: AOAM533skWZah4IR/o2hGjPK+XGnrgmhpYxKRxKE9tcoG3Y0s9hG3sFJ
 lTM0xQXulzo2WfuW0FE2kAmiOw==
X-Google-Smtp-Source: ABdhPJyYDoIzAUGsvrlxti84wRUhnYjSfHM11wVKMy+B6EhxhYo/CAqxDEzFb+cyF2MVww28hUddEQ==
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr6771808wrm.216.1599216063406; 
 Fri, 04 Sep 2020 03:41:03 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h2sm10621197wrp.69.2020.09.04.03.41.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 03:41:02 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-3-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0aa914dd-6a6e-208d-d29f-214a84dfd8a2@linaro.org>
Date: Fri, 4 Sep 2020 11:41:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1598855964-1042-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 31/08/2020 07:39, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Adds bindings for lpass hdmi interface
> which can support audio path over dp.
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 51 ++++++++++++++++++++--
>   1 file changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 09c9bd2..7c2ac0c 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -22,6 +22,7 @@ properties:
>         - qcom,lpass-cpu
>         - qcom,apq8016-lpass-cpu
>         - qcom,sc7180-lpass-cpu
> +      - qcom,sc7180-lpass-hdmi

Why do we need a new compatible per interface, IMO, you should just use 
the existing compatible.
Or please explain the reasons why we need this?

>   
>     reg:
>       maxItems: 1
> @@ -60,10 +61,12 @@ properties:
>       const: 0
>   
>   patternProperties:
> -  "(^mi2s-[0-9a-f]$|mi2s)":
> +  "^dai@[0-9a-f]$":
>       type: object
> -    description: Required properties for each DAI
> -
> +    description: |
> +      LPASS CPU dai node for each I2S device. Bindings of each node
> +      depends on the specific driver providing the functionality and
> +      properties.
>       properties:
>         reg:
>           maxItems: 1
> @@ -145,6 +148,22 @@ allOf:
>           - iommus
>           - power-domains
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
>   examples:
>     - |
>       #include <dt-bindings/sound/sc7180-lpass.h>
> @@ -178,12 +197,36 @@ examples:
>               #address-cells = <1>;
>               #size-cells = <0>;
>               /* Optional to set different MI2S SD lines */
> -            mi2s-primary@0 {
> +            dai@mi2s-primary {
>                   reg = <MI2S_PRIMARY>;
>                   qcom,playback-sd-lines = <1>;
>                   qcom,capture-sd-lines = <0>;
>               };
>           };
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
>       };
>   
>   ...
> 
