Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD1E1AB9F6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 09:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA0B715F9;
	Thu, 16 Apr 2020 09:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA0B715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587022200;
	bh=yShRMV3gjZg8suE5QjJ7smmfeVQmhtynQj1x5cOTY+o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ml6tXaDahyzym3A+sVg/afoLa5nacO8u7u5nA5iUVdIOuBQ1fTgjHlRJNy6tQlpvm
	 A+7n3PnotQQNvflxWosFb5nTGieOsO4uRTZBf6wlQ00fTyXGNjnOP6PFLI8YMXlWc7
	 Y7vVn6m7PkPiB5wYD4p1dAs/5m+f7imuidKS4Sxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940D3F8027D;
	Thu, 16 Apr 2020 09:27:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00498F8012E; Thu, 16 Apr 2020 09:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7146BF8013D
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 09:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7146BF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fyqvqiMY"
Received: by mail-wr1-x441.google.com with SMTP id k11so3584146wrp.5
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U8AKWUzItg4HdWG6JpT726BnWeBSPcROVZ9cqP+1HlA=;
 b=fyqvqiMYltvStlD2Vm2BPl597p42K3MeXn79E4X3k+Apxe608DMoOLD8vVJsd1dvWT
 P49teuDbDwy7fOdGMCHmXctl8ZprgvpNP7jaqAz3ZPS4QhVz4INMqxXHxlQRpUIoF2sh
 XibXf1PM2LTvRsN/YNQ2pWeyEIvkL3ZnwcE2tUC893x3h6pt7jrdDnbn0QD16YlDel5G
 nWFyJ4diiVeF9mprFrOYUrzGQMqdBhy6WKPeh8TwWaFtlS+PdoLIxg/kNGir+jfPef6G
 gV5qrMhq8Nv4uwz87156PwJ8Pc80Bga1joBV2Lu3Pe81hdU8Q67JCnX1e0fVxRNXwRTs
 QkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U8AKWUzItg4HdWG6JpT726BnWeBSPcROVZ9cqP+1HlA=;
 b=hqt5zUsCMH5RA+YgCuAfsWLC4MdpF/NjGPhGlLGGfuU76c6+EJQG70O6NLO7MB8v5F
 E/bA2R+hlVBS4D/RSJjszzY/dVT4OVyYYDgdQ3aAT9v/qfIYkXukajCWd/KBXXS20qty
 LTwTzlk4aNEHgZA2lgE5R7NbhIxIsRFTL2zst0DQrbzIOuQL6XKs4RzbrfbhKEdO0p4w
 iwn5HrbyLPj1cThi5eTebz1CGSCQWLdVwFOD8AcdCKazwmsUl38npljajRp72FRusuBc
 NdmT8Vx+s6cf1wp/QoGlgKhGPghq3H6ylumjftc3mFtOSDwk0am+2MkZX8bkrRFevpp5
 vccA==
X-Gm-Message-State: AGi0PuZjLGUj9ng5b8/1z4hOgfc+75/Hy5aiM0WIu7sizbzLJXx0lFqo
 TYNJqikSHnUmaGHDu8GxJ7mGVrFNd8o=
X-Google-Smtp-Source: APiQypIjlhz+XjqBwEJ4FV4yPSk0fGDYE43Q42V8vukOgrbgmUQzAFgB3JhwTJCG9YW/rYXrnYjFDQ==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr19131706wrx.168.1587022048717; 
 Thu, 16 Apr 2020 00:27:28 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id s14sm2681883wme.33.2020.04.16.00.27.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 00:27:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: qdsp6: Suggest more generic node
 names
To: Stephan Gerhold <stephan@gerhold.net>, Rob Herring <robh+dt@kernel.org>
References: <20200415081159.1098-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2000e307-ecab-95b2-55e1-cd368b9759d9@linaro.org>
Date: Thu, 16 Apr 2020 08:27:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415081159.1098-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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



On 15/04/2020 09:11, Stephan Gerhold wrote:
> Change the listed examples to use more generic node names, representing
> the class of the device nodes:
> 
>    - apr-service@<id>
>    - dai@<id>
> 
> Both names are already in use in arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> Also add #address-cells + #size-cells to the q6asm example,
> without them the example produces dtc warnings.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   .../devicetree/bindings/sound/qcom,q6adm.txt  |  2 +-
>   .../devicetree/bindings/sound/qcom,q6afe.txt  | 46 +++++++++----------
>   .../devicetree/bindings/sound/qcom,q6asm.txt  |  7 ++-
>   .../devicetree/bindings/sound/qcom,q6core.txt |  2 +-
>   4 files changed, 30 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm.txt b/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
> index bbae426cdfb1..15c353a20de8 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
> @@ -29,7 +29,7 @@ used by the apr service device.
>   	Definition: Must be 0
>   
>   = EXAMPLE
> -q6adm@8 {
> +apr-service@8 {
>   	compatible = "qcom,q6adm";
>   	reg = <APR_SVC_ADM>;
>   	q6routing: routing {
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> index d74888b9f1bb..4916dd6a0896 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> @@ -100,7 +100,7 @@ configuration of each dai. Must contain the following properties.
>   
>   = EXAMPLE
>   
> -q6afe@4 {
> +apr-service@4 {
>   	compatible = "qcom,q6afe";
>   	reg = <APR_SVC_AFE>;
>   
> @@ -110,12 +110,12 @@ q6afe@4 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> -		hdmi@1 {
> -			reg = <1>;
> +		dai@1 {
> +			reg = <HDMI_RX>;
>   		};
>   
> -		tdm@24 {
> -			reg = <24>;
> +		dai@24 {
> +			reg = <PRIMARY_TDM_RX_0>;
>   			qcom,tdm-sync-mode = <1>:
>   			qcom,tdm-sync-src = <1>;
>   			qcom,tdm-data-out = <0>;
> @@ -125,8 +125,8 @@ q6afe@4 {
>   
>   		};
>   
> -		tdm@25 {
> -			reg = <25>;
> +		dai@25 {
> +			reg = <PRIMARY_TDM_TX_0>;
>   			qcom,tdm-sync-mode = <1>:
>   			qcom,tdm-sync-src = <1>;
>   			qcom,tdm-data-out = <0>;
> @@ -135,43 +135,43 @@ q6afe@4 {
>   			qcom,tdm-data-align = <0>;
>   		};
>   
> -		prim-mi2s-rx@16 {
> -			reg = <16>;
> +		dai@16 {
> +			reg = <PRIMARY_MI2S_RX>;
>   			qcom,sd-lines = <0 2>;
>   		};
>   
> -		prim-mi2s-tx@17 {
> -			reg = <17>;
> +		dai@17 {
> +			reg = <PRIMARY_MI2S_TX>;
>   			qcom,sd-lines = <1>;
>   		};
>   
> -		sec-mi2s-rx@18 {
> -			reg = <18>;
> +		dai@18 {
> +			reg = <SECONDARY_MI2S_RX>;
>   			qcom,sd-lines = <0 3>;
>   		};
>   
> -		sec-mi2s-tx@19 {
> -			reg = <19>;
> +		dai@19 {
> +			reg = <SECONDARY_MI2S_TX>;
>   			qcom,sd-lines = <1>;
>   		};
>   
> -		tert-mi2s-rx@20 {
> -			reg = <20>;
> +		dai@20 {
> +			reg = <TERTIARY_MI2S_RX>;
>   			qcom,sd-lines = <1 3>;
>   		};
>   
> -		tert-mi2s-tx@21 {
> -			reg = <21>;
> +		dai@21 {
> +			reg = <TERTIARY_MI2S_TX>;
>   			qcom,sd-lines = <0>;
>   		};
>   
> -		quat-mi2s-rx@22 {
> -			reg = <22>;
> +		dai@22 {
> +			reg = <QUATERNARY_MI2S_RX>;
>   			qcom,sd-lines = <0>;
>   		};
>   
> -		quat-mi2s-tx@23 {
> -			reg = <23>;
> +		dai@23 {
> +			reg = <QUATERNARY_MI2S_TX>;
>   			qcom,sd-lines = <1>;
>   		};
>   	};
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> index 9f5378c51686..6b9a88d0ea3f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> @@ -51,13 +51,16 @@ configuration of each dai. Must contain the following properties.
>   
>   = EXAMPLE
>   
> -q6asm@7 {
> +apr-service@7 {
>   	compatible = "qcom,q6asm";
>   	reg = <APR_SVC_ASM>;
>   	q6asmdai: dais {
>   		compatible = "qcom,q6asm-dais";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>   		#sound-dai-cells = <1>;
> -		mm@0 {
> +
> +		dai@0 {
>   			reg = <0>;
>   			direction = <2>;
>   			is-compress-dai;
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6core.txt b/Documentation/devicetree/bindings/sound/qcom,q6core.txt
> index 7f36ff8bec18..5cd4cc9b1fde 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6core.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6core.txt
> @@ -15,7 +15,7 @@ used by the apr service device.
>   		   example "qcom,q6core-v2.0"
>   
>   = EXAMPLE
> -q6core@3 {
> +apr-service@3 {
>   	compatible = "qcom,q6core";
>   	reg = <APR_SVC_ADSP_CORE>;
>   };
> 
