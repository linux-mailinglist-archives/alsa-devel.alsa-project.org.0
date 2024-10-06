Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D6992133
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 22:35:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CFFD828;
	Sun,  6 Oct 2024 22:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CFFD828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728246945;
	bh=BOB8z6S4m7Arz9F28cP4HWF7U8MzWTx6sOY/S8Q9Pc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+SWrt56mdZNzKe1nh8qq9DO+GjaxWKSWctuYDWhoiEXN37C6iz8olcFCeMw0Iy4e
	 wpPkDOmuVvrRTOL8aFawIbJJBh7CKvVnybXMmXfw+ukbAVqxgr5DgYpJRaYSSKsTZN
	 eka5nXRY8ATFK+tWJhC2azWmABHwHvOO6dESdlBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D3E4F80568; Sun,  6 Oct 2024 22:35:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B4E4F805B0;
	Sun,  6 Oct 2024 22:35:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A833F80528; Sun,  6 Oct 2024 22:34:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B891F80496
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 22:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B891F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=o5cL3fjr
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5398e58ceebso3313602e87.0
        for <alsa-devel@alsa-project.org>;
 Sun, 06 Oct 2024 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246895; x=1728851695;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsSwteNpIsR1xjaiiCzJ87ajABbsMquYMbxyKUsa7Z8=;
        b=o5cL3fjrBN9C3ZoNjLHhr8LMGARZFQnv4ok/jBsWRGxxSgYZ0kDUCBZiGSDpPHTQbP
         69XCKsOmzsKqZFmBQDWfvjcWt2wkjfpjrZHFB84JxV7JtSreMTYTIiNOWDRFJnsRuCMA
         hgak/vD2Duu256eeo9JHC38TDT9sYtdm2IglDr5zoLcigjUzxfthQaCzBwB39hbbyekE
         IbeC3oLBfvalhMS96NjrqDQKaObGLAmaLpwd8A4TSTZ3GG11yH832hk09S3SoIOynu6R
         s3mM0QxPG48tZuBKz3G6xh/bd4xIS7Sg2Gcpgc8dpJvevNSMnzgEKpr8q6Ms12gIsXZV
         ldug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246895; x=1728851695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsSwteNpIsR1xjaiiCzJ87ajABbsMquYMbxyKUsa7Z8=;
        b=X4B3ji7jJoV9NuLsoizPQQpnimHOHfbV7s+DY5Di6a4tDLzOolZogiJoDhCAaJp6fg
         uW12d6nWPQnb/WNUNmer9XnuWNXzlCRWBTkCYb5mZrXd7q4zUqX8rugy9NLk9ZJ8g1YA
         UInXFyQYL5s+SNFS3i9L+j93Hymfs6hMgJMvtUn5lfyvQxDh8ZL94mJ1UK0MnOGF2kVw
         i46MKHRGt/mYssOa2f8XufBbp7H3Djej+/k+AweKc+SfkLTP7vBvV3je1cqR8SGJrqeT
         ThyB2ik20YZT7mqcYqrW0hDJo9VYX8ieWxtg6ZWofjvsLuoHziUsAHAznRcBDG06gODP
         gnpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrmoN+a3NfC3OhKDSQge6PgkLCvqn3722HoBIVpsaCcxMXc0/a9Fys0kwbtEHrec+kFMApzVsKAD6z@alsa-project.org
X-Gm-Message-State: AOJu0Yw+GECXwAcajfupU4wVEhq1i96F3hFnV35pnxGxQysveqC/E4Kx
	AgEoAtu00UjO8/y4VPfq5mQDab1+3c5KPQye1ddcLUVyQ3jt90mwBpKX3PS6S48=
X-Google-Smtp-Source: 
 AGHT+IEGpqKPZnYf+c49PCJtMCsHlNlfYiXoM0A4iU65uHRBMlYdcbTJgw/9IEtv/T0uzP6otOuyAg==
X-Received: by 2002:a05:6512:1056:b0:539:950b:139c with SMTP id
 2adb3069b0e04-539a626196amr3816459e87.12.1728246895194;
        Sun, 06 Oct 2024 13:34:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec83b5sm612915e87.81.2024.10.06.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:34:54 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:34:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org,
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
 linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm4250: add LPASS LPI pin
 controller
Message-ID: <6siuxtimluikddn6seerbsyb2kkz6vncxfawleabotqcz4jy7e@ze53gesagjlb>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-6-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-6-alexey.klimov@linaro.org>
Message-ID-Hash: 4X6XPE235R44FYKTZ5P72Z5GVDABYRJR
X-Message-ID-Hash: 4X6XPE235R44FYKTZ5P72Z5GVDABYRJR
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4X6XPE235R44FYKTZ5P72Z5GVDABYRJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 02, 2024 at 03:20:13AM GMT, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI)
> pin controller device node required for audio subsystem on
> Qualcomm QRB4210 RB2.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm4250.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> index c5add8f44fc0..37c0e963e739 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
>   */
>  
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "sm6115.dtsi"
>  
>  &CPU0 {
> @@ -36,3 +37,18 @@ &CPU6 {
>  &CPU7 {
>  	compatible = "qcom,kryo240";
>  };
> +
> +&soc {
> +	lpass_tlmm: pinctrl@a7c0000 {

Please add the node to sm6115.dtsi and override the compat string here.

> +		compatible = "qcom,sm4250-lpass-lpi-pinctrl";
> +		reg = <0x0 0xa7c0000 0x0 0x20000>,
> +		      <0x0 0xa950000 0x0 0x10000>;

Please pad address to 8 hex digits: reg = <0x0 0x0a7c0000 0x0 0x20000>

> +
> +		clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "audio";
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&lpass_tlmm 0 0 26>;
> +	};
> +};
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
