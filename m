Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DCC5AFA94
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 05:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D20CAE9;
	Wed,  7 Sep 2022 05:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D20CAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662521280;
	bh=xPpd+5CwvnDzYrNZuibZU7InZ7IPceWflr26RBpfFPU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmAJFU/kgFgSjew3Y3JUDf7HuRDQrl1nAjQ4LquGbpR5ZzJxuFgiaPBlYy34CSFCg
	 FYYb70Pesyn+/6/DYtlMp5mm66Zlb12V45RoxK15BNYyX/KtGuolq09jd45H8JnyEf
	 TWVBkfaTAzEV2ASYnISkyJp9pV7gYvGrmEu8W1Qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D57F80118;
	Wed,  7 Sep 2022 05:27:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBE36F8028D; Wed,  7 Sep 2022 05:26:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 557D8F8011C
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 05:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 557D8F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org
 header.b="Zfrz6fe6"
Received: by mail-ot1-x330.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso9404476otp.7
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 20:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ZXmqcDwCNHYT98hHW5xGO1fd6xJaEvG9lWSh2f3hy/o=;
 b=Zfrz6fe6Lo9OTxr6Ld7B12LdCNi7ipVOK16cY/oT88UV3+svcizdul7KOGXqYEBXko
 UGC5PTG8Tr7zmeEDcbGH3zbvRbZHaAobvoMle8ptzBbHakxwURUlbhHHWKTMrDgPcrpV
 eKYvp/X2iGg3GMzbm3+YemhVtu7cfdSBNINYiXaUQ0J2iJv2zrdeK1a1wCEASpQb41fb
 okdtHYhJkKgLsN+dUVpkmKPXoRc7zFd4fCjt4lva0XQFBOOyEgFg59SBoKtq/URxVLlh
 cuHpGQLb/tt6Dmcag1M55BAYLz49Yqv//5ljnW0J0962LOjJ0NrLs0cu/NPEw8pQUltC
 11Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZXmqcDwCNHYT98hHW5xGO1fd6xJaEvG9lWSh2f3hy/o=;
 b=Q+R8WBlgC3mol33tA8H41Po/wQLPpPwHAezzh/LrGF/IWOnsZeYdaViS3zKX1Wr4tK
 5wCsTHZqtMgzJJOctK6NQQgsbt77Ml5swftXmJu7tNRJvo1YTjRLRV90kajIB8Zykb88
 fuipUno7ElVDbFQf9Ai+jnNLmUbxoFgLyvw/c9iKB2AHzGt2losGIGBitz5hoj9Z04yW
 KwRYNDmtT8iwxri8+/XupzFI+aoxflAYUL/5pWr+AW6hmhTbTzPeG5lhGXfgr9/QaWOS
 lSXC8MqKJ+jBoYdeFOcJ8pXwGi3D8HGWM8rqJETK22AfnhOdOsEZ5RPwWk2nueyRLHpb
 cILQ==
X-Gm-Message-State: ACgBeo0BFfV2XFNOS1D3iiS9LRLJPFAzqEzgIL6Rsw61WVBr/PhbfIrZ
 gdqqDCaV6Ol8Lm1oCDO5BJoMwg==
X-Google-Smtp-Source: AA6agR7YsmduzcN42HFQdUUCbrwuK36JyuKORNqNhUEkKjFlcOBhSt9x9LiHfpoT+hWgIJFU6yQwvg==
X-Received: by 2002:a9d:4545:0:b0:636:cd1e:494f with SMTP id
 p5-20020a9d4545000000b00636cd1e494fmr670321oti.132.1662521197431; 
 Tue, 06 Sep 2022 20:26:37 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 v14-20020a0568301bce00b0063911de9fd8sm6795403ota.24.2022.09.06.20.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 20:26:36 -0700 (PDT)
Message-ID: <a2d5acff-10fd-31da-a04d-f0ecee3c5a44@kali.org>
Date: Tue, 6 Sep 2022 22:26:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 02/12] arm64: dts: qcom: sdm845: align APR services node
 names with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
 <20220906121655.303693-3-krzysztof.kozlowski@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220906121655.303693-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 9/6/22 7:16 AM, Krzysztof Kozlowski wrote:
> DT schema expects APR services node names to be "service":
>
>    qcom/sdm630-sony-xperia-nile-voyager.dtb: remoteproc@15700000: glink-edge:apr:service@4: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 98d34b5e1df2..8e7b577f78c2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -767,13 +767,13 @@ apr {
>   				#size-cells = <0>;
>   				qcom,intents = <512 20>;
>   
> -				apr-service@3 {
> +				service@3 {
>   					reg = <APR_SVC_ADSP_CORE>;
>   					compatible = "qcom,q6core";
>   					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>   				};
>   
> -				q6afe: apr-service@4 {
> +				q6afe: service@4 {
>   					compatible = "qcom,q6afe";
>   					reg = <APR_SVC_AFE>;
>   					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> @@ -785,7 +785,7 @@ q6afedai: dais {
>   					};
>   				};
>   
> -				q6asm: apr-service@7 {
> +				q6asm: service@7 {
>   					compatible = "qcom,q6asm";
>   					reg = <APR_SVC_ASM>;
>   					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> @@ -798,7 +798,7 @@ q6asmdai: dais {
>   					};
>   				};
>   
> -				q6adm: apr-service@8 {
> +				q6adm: service@8 {
>   					compatible = "qcom,q6adm";
>   					reg = <APR_SVC_ADM>;
>   					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";


Tested on the Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

