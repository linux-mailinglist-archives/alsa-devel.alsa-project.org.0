Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B42625FBE
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 17:43:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7FC1166F;
	Fri, 11 Nov 2022 17:42:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7FC1166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668184988;
	bh=E2RUEhNrhmh1jK82aaX1iTdR4D7/KsdkTKhEUimnYis=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAwyGVVCW0UZI9UmaZKlMvb9lI9yag9JjzoH6EVaZLqjO7CIvEigtSqhby1lYiMOL
	 wWpdXJZeOvoPRDct2ykLJnOPaxwxVXPOwukCy3pFSMXFrh1niR4PKTnUMiz1cc5m8h
	 MibP38y/1dFJuDU53ldDq61I8EtL8Kv1HZC0QlmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6143EF80249;
	Fri, 11 Nov 2022 17:42:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40493F8028D; Fri, 11 Nov 2022 17:42:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15645F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 17:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15645F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CVsNX79H"
Received: by mail-wr1-x433.google.com with SMTP id w14so7137674wru.8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 08:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KRDq3YvWP3xlx40agy7LwTpV95X9uRpVaWN3hJZiIrE=;
 b=CVsNX79HlQ0xGOF1Z1TKcpj8NMOVjQOldIQpoV1xWeKqERQAHxdQfwaVlfzXCpjA/0
 QFuj9ImG3K0oOKY+xgpIvc06pSuEnvTxfITNulGEfv/Q+VluUGXs6XGbLS7JHWMk8Ncq
 62Y5wSWP1JUVMzcXLtKhZ5cpoQgqkj+DhD6oU4rIn/YOvky3+//LewKDXNxVSSFQt2gB
 rgBq/8DDq74p0bOp0yWsSzJl6ppvhItIllWn3wG8hxANEprfRGg0FryKrHFr9vUVn5Jb
 RAj0NVLpco40QSCw2A/B+Zftk81f26r3BkkCM3vzoEUTJKZffoczl1c1+ycdSvbxYt/C
 OGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KRDq3YvWP3xlx40agy7LwTpV95X9uRpVaWN3hJZiIrE=;
 b=AiZAuWEBSPKSwQjk9RwALmSl/ucWpEB8ghtXxxneNThWhMK/RWy2Ob7Br7E1p031yT
 c+XjAqcE26lndjcpYO7qmEJpRYfAh0VH+ZbToHm/ziZQX4Y/TGoua8X+apJyjRs04196
 eZ2plo0Ua1g4A5BIbvJ0uXkfJX4dFIOifq5wcx0dR8XflwkU4PPQDKAaWZ1FmZuyeibW
 pSapjy7RiZPvRcCfFM+Z0/+IdPzMIf/1skLy/V3bTt4aO5SMlBbwFYrVblw3p33pdk+w
 E4duVmVzSnOC3uHc+dId2KkNNtEJSVRXM8lVw46RFBBNfzi/6QyS6Str5IQXRHqDgdt9
 k+8A==
X-Gm-Message-State: ANoB5pnYYSyZV9RAfDMgc5fImaEVwzZ1GI6SImidALPOPV3rtJHUYsJQ
 mkyaWJZROSpNa5ilRhHAPPfXAg==
X-Google-Smtp-Source: AA0mqf4CB8B5ldRLG2ZTP+StIEXMyDGoczXmUgfdXQ4MPh8CPep7VpfwIc0MBXZUi8VEgrQHfbasnQ==
X-Received: by 2002:adf:f08a:0:b0:22e:37d1:b598 with SMTP id
 n10-20020adff08a000000b0022e37d1b598mr1796487wro.377.1668184924029; 
 Fri, 11 Nov 2022 08:42:04 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 r15-20020a05600c35cf00b003a84375d0d1sm10299100wmq.44.2022.11.11.08.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 08:42:03 -0800 (PST)
Message-ID: <7cdb914a-df88-ca11-45d3-d370d5c94bcd@linaro.org>
Date: Fri, 11 Nov 2022 16:42:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wsa883x: Use proper shutdown GPIO
 polarity
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
 <20221110133512.478831-2-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221110133512.478831-2-krzysztof.kozlowski@linaro.org>
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



On 10/11/2022 13:35, Krzysztof Kozlowski wrote:
> The shutdown GPIO is active low (SD_N), but this depends on actual board
> layout.  Linux drivers should only care about logical state, where high
> (1) means shutdown and low (0) means do not shutdown.
> 
> Invert the GPIO to match logical value.
> 
> Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> 
> Changes since v1:
> 1. None.
> ---
>   sound/soc/codecs/wsa883x.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index c7b10bbfba7e..77a7dd3cf495 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -1392,7 +1392,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>   	}
>   
>   	wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
> -						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> +						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
>   	if (IS_ERR(wsa883x->sd_n)) {
>   		dev_err(&pdev->dev, "Shutdown Control GPIO not found\n");
>   		ret = PTR_ERR(wsa883x->sd_n);
> @@ -1411,7 +1411,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>   	pdev->prop.simple_clk_stop_capable = true;
>   	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>   	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> -	gpiod_direction_output(wsa883x->sd_n, 1);
> +	gpiod_direction_output(wsa883x->sd_n, 0);
>   
>   	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
>   	if (IS_ERR(wsa883x->regmap)) {
