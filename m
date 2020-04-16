Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1911AB9EF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 09:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0684D1666;
	Thu, 16 Apr 2020 09:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0684D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587022155;
	bh=BHV6KvJ6LWVHSRwbUhq1ObaJfKymZXCz58rNyNiOZdY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5HgelsOeIsAUos43pgVavB0CjjnPMJnSSrQCTcxAlVP7hYN7+prG/C8moPSTodE5
	 wF3YzmI2ANOHIvTZ5p2+KVPiH9GWjNKc2yXxKHiGLEFPbdAMClTjP1ZZqcN+ewq6LF
	 bmoolc6zRAwe3QcnK3n+A6k/W/uDOCUocmQtG70g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 193B5F8021E;
	Thu, 16 Apr 2020 09:27:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F2AFF8016F; Thu, 16 Apr 2020 09:27:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9687EF800AB
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 09:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9687EF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NJcoaFeb"
Received: by mail-wr1-x441.google.com with SMTP id h26so3570582wrb.7
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QxpHiucnhhWIScTRux26ZlKVnMyZxog3DZwM1hu74UY=;
 b=NJcoaFebkFEC/7qlTmJhtWoHhwkOt2K/gdRXFxzWdbjoaCzZkTTDYWJMPxpTxW8ORd
 aqdKBnWmj8kePfOpjU8NPE/K9DebqACnnOY/FjoNYBlalaz3Y7bsKDEIL5UA88ARoLMm
 jLsTpzXX2PUz8MV0Z0FvA4bkhGRJ5KWyld1m4wWCMZo3MjNRlWk17d4JYVtk1hLZ67bj
 s26VJ9CmUDcD6Kc/BNZxY+sr/GLlB5EAsCx8/v0s5n9op7aXDrmyBtKYhq0sSya8+Lvx
 /0YWTdD9FXCJAaR3d/Fsy4pbFIRIFBBLratFGfQH62kukXlOmPMjjWGyit+QrJKZBOrX
 v45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxpHiucnhhWIScTRux26ZlKVnMyZxog3DZwM1hu74UY=;
 b=aYAdyAUjMv/6fxTmmMdZRWoF8t0SLVeZLQfrnwMwpuFpt4XwbsQ+PakBfh+0oMR9jC
 lCUGdpPbvzKh6gXL+jgCqATbtNmjuNh3Nazh5+2DOT9xf8u8NWCPJhAxCDY+ytK7LVKs
 5B1QGBV9GA9XZ0FMhdk0GwktJunaf3U9VeQuDaOUH2dRovs7mgqON3EfFy//2sguQwrs
 qGMPyR4ZUulZt5G4t0E79AFEEbOi1lMQPxKqnttH55zKJ7mbN7650whGtRhWKbGe4okS
 wYtNyYsL8i218pWfrQfP6q5G9Sikh0BMjViwNkomDESGPpA7eYokvIBORnkOWAJbwmJV
 T5Eg==
X-Gm-Message-State: AGi0PuaUYlc6oUyXB550MwQRL9kmRSiECl3XnE0rDN2Dtg9YW5FWybn8
 wwghuiRdFdh3w0EuBZrVnh6umYyZaEY=
X-Google-Smtp-Source: APiQypJqsIciqFOzLwVCqcUPSlriBEOlFHJnwMEFkwbNqkG6VNGQqvq0iwyOSnnG1sOY8gY5eFSegw==
X-Received: by 2002:a5d:49d2:: with SMTP id t18mr16202952wrs.85.1587022041753; 
 Thu, 16 Apr 2020 00:27:21 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id b191sm2542521wmd.39.2020.04.16.00.27.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 00:27:20 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom: apr: Use generic node names
 for APR services
To: Stephan Gerhold <stephan@gerhold.net>, Rob Herring <robh+dt@kernel.org>
References: <20200415081159.1098-1-stephan@gerhold.net>
 <20200415081159.1098-2-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f0735d41-d274-841e-f6d3-69c301726883@linaro.org>
Date: Thu, 16 Apr 2020 08:27:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415081159.1098-2-stephan@gerhold.net>
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
> Device nodes should be named according to the class of devices
> they belong to. Change the suggested names of the subnodes to
> apr-service@<id>, which is already in use in
> arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   .../devicetree/bindings/soc/qcom/qcom,apr.txt | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> index f8fa71f5d84b..2e2f6dc351c0 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> @@ -65,30 +65,30 @@ which uses apr as communication between Apps and QDSP.
>   		compatible = "qcom,apr-v2";
>   		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>   
> -		q6core@3 {
> +		apr-service@3 {
>   			compatible = "qcom,q6core";
>   			reg = <APR_SVC_ADSP_CORE>;
>   		};
>   
> -		q6afe@4 {
> +		apr-service@4 {
>   			compatible = "qcom,q6afe";
>   			reg = <APR_SVC_AFE>;
>   
>   			dais {
>   				#sound-dai-cells = <1>;
> -				hdmi@1 {
> -					reg = <1>;
> +				dai@1 {
> +					reg = <HDMI_RX>;
>   				};
>   			};
>   		};
>   
> -		q6asm@7 {
> +		apr-service@7 {
>   			compatible = "qcom,q6asm";
>   			reg = <APR_SVC_ASM>;
>   			...
>   		};
>   
> -		q6adm@8 {
> +		apr-service@8 {
>   			compatible = "qcom,q6adm";
>   			reg = <APR_SVC_ADM>;
>   			...
> @@ -106,26 +106,26 @@ have no such dependency.
>   		qcom,glink-channels = "apr_audio_svc";
>   		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>   
> -		q6core {
> +		apr-service@3 {
>   			compatible = "qcom,q6core";
>   			reg = <APR_SVC_ADSP_CORE>;
>   		};
>   
> -		q6afe: q6afe {
> +		q6afe: apr-service@4 {
>   			compatible = "qcom,q6afe";
>   			reg = <APR_SVC_AFE>;
>   			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>   			...
>   		};
>   
> -		q6asm: q6asm {
> +		q6asm: apr-service@7 {
>   			compatible = "qcom,q6asm";
>   			reg = <APR_SVC_ASM>;
>   			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
>   			...
>   		};
>   
> -		q6adm: q6adm {
> +		q6adm: apr-service@8 {
>   			compatible = "qcom,q6adm";
>   			reg = <APR_SVC_ADM>;
>   			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> 
