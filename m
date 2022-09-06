Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B35AF1C9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:06:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE751678;
	Tue,  6 Sep 2022 19:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE751678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662484015;
	bh=jhKER9PIdgnuP3l7rFtgf/+AC1EN7XGWvLWoXq4FO3o=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+7112bsXHoco7swwb+W8OGnttJkZgmWAEOrElc0xtbkCxSPyw5W8lXuaA0d/JV0x
	 4FlotFfb4MlrUu+oPDIZsErXhrHpNvp2aOnkDkEoydhTcZkA40/TIv7qYQ04OraO66
	 vFDWoJBDYuwIqP+4mUDAw6UfUR/p01Qz9oqYRUd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94E43F8047B;
	Tue,  6 Sep 2022 19:04:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51B74F8024C; Tue,  6 Sep 2022 19:04:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08140F8019B
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08140F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FUVuzMiJ"
Received: by mail-wr1-x432.google.com with SMTP id e13so16438955wrm.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JZX7McjmoK3qx9FScx/z6DM7W5b/M9IiSBkj8M3ktmU=;
 b=FUVuzMiJqZPu2Zjwz6SlnlI/mwmo/BbzJBF61EQGnbOy+4E5jcN9JSkIWekGXJ7kO/
 AwUoJNi4Oun8NJDoCDQuD4UC75VLUAzk0IY9MuuY5PN6DHKn820C912phpXRQF2VPFxP
 9dESeYZwH9Zs20LUzai9OfVl3DHIB9p2jCKmw4FEiv6gehThsEme9nM2d5E4NHsfHq9M
 PZlE/lja1JnA/zcuy+MFJtYehoH7cHNX+eN7tE2v1QwSr+wec7fZs8APZ67ww2CxIaq5
 cbljBuzRzQZOGS2ebJBi9sam3TOovNFmU15wZWb/U5EHif5zThYP3inVw26GBCSUiXGr
 XSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JZX7McjmoK3qx9FScx/z6DM7W5b/M9IiSBkj8M3ktmU=;
 b=55aiCcErsHnrr5dzgBrd+J+nq0buWSESO9IaGq4oV7OkEf/N38UDEdlR61eqZISKzB
 pVi//dz1fsGbLw0xIvDav9LdVn8U+5QEnPK4snA0CkkVcj2WoI6gRym7/4zLFEVAaSmB
 6uEQxnVhmnIw9McTlXO57IVoeAl+lvOrO0QqlGCK6mSdr9wfY22W3MN8ew6aHLCu9z9O
 gEiI9rKQTT+RSZu2p5EkN1GfUMHBwYCT0R8MnKUL1DDj15lmnWvcrn6gsUEj8klBUYPN
 ixeDM035i0i0JuF3yr5pN9UV6oE3cN846GZ6jMpldzXBziQNanN/IHiVdlJeLvYCLIu4
 iu/w==
X-Gm-Message-State: ACgBeo3Nc+B9fBhYk4Spzrmv5UaX4ud9Fh/OTkwOJQGwhap2atpcVjj8
 SZo73GvWfuvrUMF8dDbXD6GvHA==
X-Google-Smtp-Source: AA6agR5rdQc7G4b5dGsTKtJPaNM9/uyuR/oHXT1FzGVq24NJYOUNuMvEu3cPgX2X6QsxX0GmnIMIsg==
X-Received: by 2002:a05:6000:2a8:b0:226:e711:67f5 with SMTP id
 l8-20020a05600002a800b00226e71167f5mr20952578wry.359.1662483877162; 
 Tue, 06 Sep 2022 10:04:37 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 h23-20020a05600c2cb700b003a2f2bb72d5sm27050586wmc.45.2022.09.06.10.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 10:04:36 -0700 (PDT)
Message-ID: <15102069-fd91-eb37-c984-5443cd7eb834@linaro.org>
Date: Tue, 6 Sep 2022 18:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/12] ASoC/qcom/remoteproc/arm64: Qualcomm ADSP DTS and
 binding fixes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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

Thanks Krzysztof for tidying this up.

On 06/09/2022 13:16, Krzysztof Kozlowski wrote:
> Hi,
> 
> Dependencies/merging
> ====================
> 1. The DTS patches are independent.
> 2. The binding patches should come together, because of context changes. Could
>     be one of: Qualcomm SoC, ASoC or DT tree.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (12):
>    arm64: dts: qcom: sdm630: align APR services node names with dtschema
>    arm64: dts: qcom: sdm845: align APR services node names with dtschema
>    arm64: dts: qcom: sm8250: align APR services node names with dtschema
>    arm64: dts: qcom: msm8996: fix APR services nodes
>    arm64: dts: qcom: sdm845: align dai node names with dtschema
>    arm64: dts: qcom: msm8996: align dai node names with dtschema
>    arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
>    arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
>    dt-bindings: soc: qcom: apr: correct service children
>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: cleanup example
>    ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
>    dt-bindings: soc: qcom: apr: add missing properties
> 

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

>   .../bindings/soc/qcom/qcom,apr.yaml           | 85 ++++++++++++++++---
>   .../sound/qcom,q6dsp-lpass-clocks.yaml        | 30 +++----
>   .../sound/qcom,q6dsp-lpass-ports.yaml         | 30 +++----
>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 10 +--
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  4 +-
>   arch/arm64/boot/dts/qcom/sdm630.dtsi          |  8 +-
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  2 +-
>   .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |  2 +-
>   .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  4 +-
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          |  8 +-
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 10 +--
>   11 files changed, 124 insertions(+), 69 deletions(-)
> 
