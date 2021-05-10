Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15915379485
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 18:47:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FC08176D;
	Mon, 10 May 2021 18:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FC08176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620665235;
	bh=5seM//FfA/jfeXoSJKtJrS4SMdZGUfyozh8kott4d0w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHuniCdjo7Am+LFKhXC/VkbhgrcAv7BqjnZWDQP4bNvrCkL6EZhhMumm8bdTWkP/V
	 RpZsHHfe5T9kCfCbqIApCi/B9I1I2QdsAdBMV3gJdv2uMsRElYy2BGh8uS3m+0mmLE
	 ny7CAqBLxw+TfaNLb67TCbw1KUlSkdSD78TAUxN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DC21F800EA;
	Mon, 10 May 2021 18:45:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 996FFF800EA; Mon, 10 May 2021 18:45:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18883F800EA
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 18:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18883F800EA
Received: by mail-oi1-f176.google.com with SMTP id w22so2482277oiw.9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 09:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9higqPKGrnY1IY6VuqVyaPGF4tW6YAqMC+KWAKz/f2M=;
 b=Xy+5oochQHcPmWCmXf7A8+vZbaDHPzMixeHAYxAnGiBKU6dDBKR2BbdlJAECo3858q
 zTBz8KasRbnnh5S0woUkdqHZF2MvqgK0J2Ij5M+sYN3rKbOelubzEI9qJ9nrWGkNebky
 2/9GAqO0/1QDlfCwdpdhbty8HNhuEfEG5KDPR8flHBqb8pV3du1JrOLDZy8SZI9D6WIj
 jG3g/eHhP9nLz66pFNxMV8VW7jklTgG0jzPNbSEf2DecnWmLOMCf4oH/5T+oBGHLG5SI
 af4J4nNRBsKrwThhmucu2KwwN5fxwYU6+aG8cyWoj8JduAyT5SWqw8Mh60ltXmQgIFEv
 I8Hg==
X-Gm-Message-State: AOAM5316zwOyVBW1XXe3nh2LC4dPSvtTubNAhlJo5kBO7mPVkJgx+H6N
 pfstm9KSNbav4jqeZsOZEQ==
X-Google-Smtp-Source: ABdhPJzrDpekbN2l5TxSPDuiWfP8/sG/3dI4sWv+MXhY2apRC5QC50Nmv8BeU/9jsn21sgB3Fmknfw==
X-Received: by 2002:a05:6808:13ca:: with SMTP id
 d10mr10913461oiw.24.1620665139210; 
 Mon, 10 May 2021 09:45:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q130sm2629826oif.40.2021.05.10.09.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 09:45:35 -0700 (PDT)
Received: (nullmailer pid 260896 invoked by uid 1000);
 Mon, 10 May 2021 16:45:32 -0000
Date: Mon, 10 May 2021 11:45:32 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: wcd934x: add bindings for Headset
 Button detection
Message-ID: <20210510164532.GA241925@robh.at.kernel.org>
References: <20210510101201.7281-1-srinivas.kandagatla@linaro.org>
 <20210510101201.7281-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510101201.7281-2-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org
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

On Mon, May 10, 2021 at 11:11:58AM +0100, Srinivas Kandagatla wrote:
> Add bindings required for Multi Button Headset detection.
> WCD934x support Headsets with upto 8 buttons including, impedance measurement
> on both L/R Headset speakers and cross connection detection.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd934x.yaml          | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)

A search tells me this is not v1... 

> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> index e8f716b5f875..b25c6ca4e97c 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> @@ -77,6 +77,64 @@ properties:
>      minimum: 1800000
>      maximum: 2850000
>  
> +  qcom,hphl-jack-type-normally-closed:
> +    description: Indicates that HPHL jack switch type is normally closed
> +    type: boolean
> +
> +  qcom,ground-jack-type-normally-closed:
> +    description: Indicates that Headset Ground switch type is normally closed
> +    type: boolean

I asked before if 'normally closed' was the more common case and you 
said yes. So I'd expect 'open' here, but now you've changed the 
polarity of the property. And now not present is not described at all. 

> +
> +  qcom,mbhc-headset-vthreshold-microvolt:
> +    description: Voltage threshold value for headset detection
> +    minimum: 0
> +    maximum: 2850000
> +
> +  qcom,mbhc-headphone-vthreshold-microvolt:
> +    description: Voltage threshold value for headphone detection
> +    minimum: 0
> +    maximum: 2850000
> +
> +  qcom,mbhc-button0-vthreshold-microvolt:
> +    description: Voltage threshold value for headset button0
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button1-vthreshold-microvolt:
> +    description: Voltage threshold value for headset button1
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button2-vthreshold-microvolt:
> +    description: Voltage threshold value for headset button2
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button3-vthreshold-microvolt:
> +    description: Voltage threshold value for headset button3
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button4-vthreshold-microvolt:
> +    description: Voltage threshold value for headset button4
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button5-vthreshold-microvolt:
> +    description: Voltage threshold value for headset button5
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button6-vthreshold-microvolt:
> +    description: Voltage threshold value for headset button6
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button7-vthreshold-microvolt:
> +    description: Voltage threshold value headset button7
> +    minimum: 0
> +    maximum: 500000

These can all be a single pattern property: 
'^qcom,mbhc-button[0-7]-vthreshold-microvolt$'

Are there inter-dependencies between these properties? Are 0-7 
meaningful or just an index? For the latter case, why not just make this 
an array?

> +
>    clock-output-names:
>      const: mclk
>  
> @@ -159,6 +217,13 @@ examples:
>          qcom,micbias2-microvolt = <1800000>;
>          qcom,micbias3-microvolt = <1800000>;
>          qcom,micbias4-microvolt = <1800000>;
> +        qcom,hphl-jack-type-normally-closed;
> +        qcom,ground-jack-type-normally-closed;
> +        qcom,mbhc-button0-vthreshold-microvolt = <75000>;
> +        qcom,mbhc-button1-vthreshold-microvolt = <150000>;
> +        qcom,mbhc-button2-vthreshold-microvolt = <237000>;
> +        qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +        qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
>          clock-names = "extclk";
>          clocks = <&rpmhcc 2>;
>  
> -- 
> 2.21.0
> 
