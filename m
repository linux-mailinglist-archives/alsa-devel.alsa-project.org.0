Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567022B449
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 19:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B872B168A;
	Thu, 23 Jul 2020 19:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B872B168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595524372;
	bh=VmbpHom9AS9xdZwKD40Ryt+W1EieQzQqrpJhL6O41I8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oyvnePcn6IAiOAhSf2NPP2L4CFaU9af7QnrKwK9ZfHL/Fws830u9uR3BNK9jNLlj4
	 NmIl4ZvpEUQDFsSwSCPvUYckcyfS1jyL3joCY9wQnaeCZcNA1uq7Z/RzSkKdWo6Lgb
	 qmuXqWkX7j+LUOvZ+1QzYFDiVKdWBlzYa3XFFn2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B879BF80090;
	Thu, 23 Jul 2020 19:11:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6358BF80212; Thu, 23 Jul 2020 19:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3383DF80090
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 19:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3383DF80090
Received: by mail-io1-f68.google.com with SMTP id d18so7049504ion.0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 10:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CFQA7x0bDHTcOu8RlJmkDybvEkhTzOMXAr85IhgE6JY=;
 b=iIpBDFwz6CqwUnUuV/dpYrzSzX+sLZgvqSKdqPkDZ0vWVgaB1t+tDr14YvnHBbh97e
 T7vooNvnH842nrGhRuQk0FV7omo9xCeVIXYUFu1WvTkOzIGFzWnBnN7G7LkMKjDSY6W2
 7eJ9mSEz/tHp1+xeTqmoVlKsjjwRRWkudVdlXGrqWZKmroEx/SBQ9xl6sZvUqIKGLSNi
 dGBnANSIijp/1HAuOg4ySSNLJVfhqaTs9ybvWDNAz0Ep8hQV1h3+mKvc14fbwSJFLv6P
 O39oi4O/6MLGz6Pnwh9xlWhKcRNEU0RqvcvzkNEvIz2FO0rve7YPTLMwDWnLQWXEkS+e
 9nzg==
X-Gm-Message-State: AOAM5302GJ2AlOkcXH+FXfvmh21UCF3Nh4ebjFL8fQMj7qA1wTeLyXNd
 x31q0FQQIsRVuJsXSxEPTg==
X-Google-Smtp-Source: ABdhPJyxpyI1N+AvgADJ1IcQCxekVn4/AHZTGDaGy92skQR/1/y1qtBhzZcAxyirTjh4HWPn7k/e1g==
X-Received: by 2002:a02:2401:: with SMTP id f1mr5923789jaa.66.1595524255623;
 Thu, 23 Jul 2020 10:10:55 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l17sm1708226ilm.70.2020.07.23.10.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 10:10:55 -0700 (PDT)
Received: (nullmailer pid 546734 invoked by uid 1000);
 Thu, 23 Jul 2020 17:10:53 -0000
Date: Thu, 23 Jul 2020 11:10:53 -0600
From: Rob Herring <robh@kernel.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v4 07/12] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
Message-ID: <20200723171053.GA544557@bogus>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-8-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595413915-17867-8-git-send-email-rohitkr@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org
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

On Wed, Jul 22, 2020 at 04:01:50PM +0530, Rohit kumar wrote:
> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 55 +++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> index 32c2cdb..c21392e 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
>  
>  Required properties:
>  
> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
> +- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> +			  "qcom,lpass-cpu-sc7180"

qcom,sc7180-lpass-cpu

>  - clocks		: Must contain an entry for each entry in clock-names.
>  - clock-names		: A list which must include the following entries:
>  				* "ahbix-clk"
> @@ -18,6 +19,13 @@ Required properties:
>  				* "mi2s-bit-clk3"
>  				* "pcnoc-mport-clk"
>  				* "pcnoc-sway-clk"
> +			: required clocks for "qcom,lpass-cpu-sc7180"
> +				* "audio-core"
> +				* "mclk0"
> +				* "mi2s-bit-clk0"
> +				* "mi2s-bit-clk1"
> +				* "pcnoc-sway-clk"
> +				* "pcnoc-mport-clk"
>  
>  - interrupts		: Must contain an entry for each entry in
>  			  interrupt-names.
> @@ -53,7 +61,8 @@ Required properties for each DAI (represented by a subnode):
>  Note that adding a subnode changes the default to "no lines configured",
>  so both playback and capture lines should be configured when a subnode is added.
>  
> -Example:
> +Examples:
> +1)
>  
>  lpass@28100000 {
>  	compatible = "qcom,lpass-cpu";
> @@ -77,3 +86,45 @@ lpass@28100000 {
>  		qcom,playback-sd-lines = <0 1>;
>  	};
>  };
> +
> +2)
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +
> +lpass_cpu: lpass {
> +	compatible = "qcom,lpass-cpu-sc7180";
> +
> +	reg = <0 0x62F00000 0 0x29000>;
> +
> +	iommus = <&apps_smmu 0x1020 0>;
> +
> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +	clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
> +		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
> +	clock-names = "pcnoc-sway-clk", "audio-core",
> +			"mclk0", "pcnoc-mport-clk",
> +			"mi2s-bit-clk0", "mi2s-bit-clk1";
> +	interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-names = "lpass-irq-lpaif";
> +
> +
> +	#sound-dai-cells = <1>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	mi2s-primary@0 {
> +		reg = <MI2S_PRIMARY>;
> +		qcom,playback-sd-lines = <1>;
> +		qcom,capture-sd-lines = <0>;
> +	};
> +
> +	mi2s-secondary@1 {
> +		reg = <MI2S_SECONDARY>;
> +		qcom,playback-sd-lines = <0>;
> +	};
> +};
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
