Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89A623168
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:25:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371C516B2;
	Wed,  9 Nov 2022 18:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371C516B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014708;
	bh=fgnwXGO1Bb4aCnKewzIuYRvhEkYVBD+qJB8W/774hk0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghr6xYkgWpikHkiJ9ghjsGmMvObZ1phKREIo5p/kLOWHtcTWbFUV1g7qcXo7kV5MQ
	 dCH6niwBaaKj3K8AKd/bxESB4t16gKYTb5bodS/Y4Fs8F1X9do4MsFlNRJOTjJYFk1
	 zfjDgJZmHouQUrDArKEJVlcvuoLtgkUvIQV6bocw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71DBBF80611;
	Wed,  9 Nov 2022 18:16:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F2AF8025A; Mon,  7 Nov 2022 16:48:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58BA0F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 16:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58BA0F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CZ8TGNRl"
Received: by mail-ed1-x52c.google.com with SMTP id r14so18247109edc.7
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 07:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PFZbCwEAf5xvmFibQbTSCqyngiA1gCMbpOH+dBVu8iE=;
 b=CZ8TGNRlE5jmJffm9Yx0cmQI4SfkpxDCjF0CUs2Eo78TqWT6+m/jyXCqqzr0l482Nf
 bZ5N559p66DFquV0L7YT6toyJmIMaAzdHaSVJhA3fsSLwj2u6dSuId1C7haefteeYblH
 g28tShiu7o6XNcbT9DIRO0DOF9TsaAMDwQgfDek1ekvzeXEQ1SPswpUVBHKwaCt11pNz
 Lylxs6d2TprhGOql/pyKa0d6d3jO5AK2uqREQdAykb0/oUef2BIpJJUQ0PO3ST/QQNZW
 mGLU4TzPtjlpsFOS5ZHtyW73YEYhFtFEjxNPj6eRhlZ7Q5VPgi5irG7Y9qWs69ffQ+7t
 5sQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PFZbCwEAf5xvmFibQbTSCqyngiA1gCMbpOH+dBVu8iE=;
 b=mRVONBDWji6g9HZiEjL04jT0ZgKNp6WAvBGEDEimvveSvy310TBJITV6Y5ZU7tMrOi
 rSvzrAlKEOn7OJDJ42g2A9kdeWmvfVAObDvT3qLkQZETwW6DgPRfnP68QBaCpF0aEg5l
 uvEd+qpelIpmHpUY/KxVcTJqkhfLEkEPbnV3K5lS9PPq4LgNhrUg6mApaLqKjFRMVVwP
 x9zQ++hviz1jqSm/9SFUZuRrCcvVTPySqVQTtm66BeShRfSVT3pnY+8EbVEIo/UtiYvt
 kDZBNMAIugz1J7OccRucJ/qKc+xfpqbMJOBh61ifr6F7tbqYrGwtnQCYGrZ3wRhEHaTk
 KGCg==
X-Gm-Message-State: ACrzQf0llsdyoFTkx07ghXBZPz93EwCww+rZRSg7jFDGL3eq2xsasvAF
 jXCHx/NVQnmDSz0lUfRV+k2ASQ==
X-Google-Smtp-Source: AMsMyM4C4BS78FBPn0mzYLjEHkzToQ5EH3PogrfSySzn/OQCGvYBG56Zr7WlIdFu1ic0QJe9/FVAzg==
X-Received: by 2002:a50:cd07:0:b0:464:63b:1017 with SMTP id
 z7-20020a50cd07000000b00464063b1017mr28653410edi.364.1667836098543; 
 Mon, 07 Nov 2022 07:48:18 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05640212d200b0044ef2ac2650sm4337439edx.90.2022.11.07.07.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 07:48:17 -0800 (PST)
Message-ID: <49407328-de28-9018-321b-c649c5bc7435@linaro.org>
Date: Mon, 7 Nov 2022 16:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Remove redundant soundwire
 property
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, mka@chromium.org
References: <1667830844-31566-1-git-send-email-quic_srivasam@quicinc.com>
 <1667830844-31566-3-git-send-email-quic_srivasam@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1667830844-31566-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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



On 07/11/2022 15:20, Srinivasa Rao Mandadapu wrote:
> Remove redundant property qcom,port-offset in soundwire
> controller nodes.
> This patch is required to avoid dtbs_check errors with
> qcom,soundwie.yaml
> 
> Fixes: 12ef689f09ab ("arm64: dts: qcom: sc7280: Add nodes for soundwire and va tx rx digital macro codecs")
> Fixes: 24f52ef0c4bf ("arm64: dts: qcom: sm8250: Add nodes for tx and rx macros with soundwire masters")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 -
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 748eef6..71be873 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2317,7 +2317,6 @@
>   			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
>   			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
>   			qcom,ports-lane-control =	/bits/ 8 <0x00 0x01 0x00>;
> -			qcom,port-offset = <1>;
>   
>   			#sound-dai-cells = <1>;
>   			#address-cells = <2>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index eb5a10c..0f430ca 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2360,7 +2360,6 @@
>   			qcom,ports-word-length =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
>   			qcom,ports-block-group-count =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
>   			qcom,ports-lane-control =	/bits/ 8 <0xFF 0x00 0x01 0x00 0x01>;
> -			qcom,port-offset = <1>;
>   			#sound-dai-cells = <1>;
>   			#address-cells = <2>;
>   			#size-cells = <0>;
