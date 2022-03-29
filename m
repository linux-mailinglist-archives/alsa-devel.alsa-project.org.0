Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80E4EA45F
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 03:01:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C76E1843;
	Tue, 29 Mar 2022 03:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C76E1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648515716;
	bh=22GH6frhH3nPi1q4vuCGg8eNgMki9EYBfvO8y+3ld8M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oj63/xoq/iS9nRKKUljAb/nZw+3Zpr2ij11hG6A7uLCY1vwKxCBa81cHJaicIRvTx
	 wn7htKiQ+4waiJXNQRVeChWKu7PuCmCko2cMI+ue4DzpRuZXsHEzLdk7QUkxDIAfEf
	 XPj4OV9RvaLK2kaxU6l6OgpGWtTDoV6DkdpMY4ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9F4F80121;
	Tue, 29 Mar 2022 03:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EFF7F8024C; Tue, 29 Mar 2022 03:00:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E73F800CB
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 03:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E73F800CB
Received: by mail-oo1-f50.google.com with SMTP id
 s1-20020a05682003c100b00324b888f165so2781741ooj.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 18:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qsEldasqSmPH+uyKPG9uvo/NU8uKdGNTwdCF9sy/D/E=;
 b=bnO9OQDQ7ZTx0CvPXkB6RnHJE+3dniHX/OSUyEwdGV1wvH0MM6LVkzuShVzYGPBMUB
 LMTeWK1UekxxCCHLfAIXnH+SqEfBJ71IlpaNfC5TN/CyEy+GTDM8u8FcaIAZ3apl8IoJ
 8HkKmgiWoArbXEZfhGNbY4pT/heaOWmNzoerZvOUza7JvdjaPXCth8cltkaRO1//zBU/
 HQKlDgYzvyJzQ5cQIj91Um67+ENzxkbwbaG6GSMpT8VTnNlpz4WgmD1oW/h+BVBtXSow
 0u+rbzYeo7ICVHLNwkAbwfJ1DaDEHZ7BtNIbnIQKXsly6m/1ESHb7oMncOJ2R0Om24eC
 31Qg==
X-Gm-Message-State: AOAM5306xF6uKY+aBZTqGQmbUAVw9c+Zlpvx59OHfEPApO/dW5/mpabY
 KK2wcwfSKMkLGFaxTr9Ukw==
X-Google-Smtp-Source: ABdhPJygqRqHhRk4OiSo6iQBjfgsT2QvY6ZZ2r8mczpG9SMPz5GWtegFSl3boIRZpO//0kXJL1k3YA==
X-Received: by 2002:a4a:1784:0:b0:324:5b06:dd0d with SMTP id
 126-20020a4a1784000000b003245b06dd0dmr75661ooe.77.1648515638332; 
 Mon, 28 Mar 2022 18:00:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r205-20020acadad6000000b002ef824213c9sm8044301oig.55.2022.03.28.18.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 18:00:37 -0700 (PDT)
Received: (nullmailer pid 3398741 invoked by uid 1000);
 Tue, 29 Mar 2022 01:00:36 -0000
Date: Mon, 28 Mar 2022 20:00:36 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: lpass-cpu: Update clocks and
 power domain names for sc7280 platform
Message-ID: <YkJaNJT2yt6UpBZG@robh.at.kernel.org>
References: <1647852981-27895-1-git-send-email-quic_srivasam@quicinc.com>
 <1647852981-27895-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647852981-27895-4-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 dianders@chromium.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 krzysztof.kozlowski@canonical.com, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, agross@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org
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

On Mon, Mar 21, 2022 at 02:26:21PM +0530, Srinivasa Rao Mandadapu wrote:
> Update required clock-names used for MI2S primary path, VA macro's
> codec memory path and HDMI path in sc7280 based platforms.
> Update power domain names required for sc7280 platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml       | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 2c81efb..e9a5330 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -38,8 +38,8 @@ properties:
>      maxItems: 7
>  
>    clock-names:
> -    minItems: 3
> -    maxItems: 7
> +    minItems: 1
> +    maxItems: 10
>  
>    interrupts:
>      minItems: 2
> @@ -62,6 +62,9 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  power-domain-names:
> +    maxItems: 1
> +
>    '#sound-dai-cells':
>      const: 1
>  
> @@ -192,15 +195,19 @@ allOf:
>            oneOf:
>              - items:   #for I2S
>                  - const: aon_cc_audio_hm_h
> +                - const: audio_cc_ext_mclk0
>                  - const: core_cc_sysnoc_mport_core
> +                - const: core_cc_ext_if0_ibit
>                  - const: core_cc_ext_if1_ibit

You can't add new clocks in the middle. That breaks the ABI.

>              - items:   #for Soundwire
>                  - const: aon_cc_audio_hm_h
> +                - const: audio_cc_codec_mem
>                  - const: audio_cc_codec_mem0
>                  - const: audio_cc_codec_mem1
>                  - const: audio_cc_codec_mem2
> +                - const: aon_cc_va_mem0
>              - items:   #for HDMI
> -                - const: aon_cc_audio_hm_h
> +                - const: core_cc_sysnoc_mport_core
>  
>          reg-names:
>            anyOf:
> @@ -228,6 +235,10 @@ allOf:
>                  - const: lpass-irq-hdmi
>                  - const: lpass-irq-vaif
>                  - const: lpass-irq-rxtxif
> +        power-domain-names:
> +          allOf:
> +            - items:
> +                - const: lcx
>  
>        required:
>          - iommus
> -- 
> 2.7.4
> 
> 
