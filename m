Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E75B1CAE
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 14:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C8416F4;
	Thu,  8 Sep 2022 14:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C8416F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662639714;
	bh=Qvpfo1K8BtdNRRcV9S5Mf5mch444f9Dz8135A3XCGzo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rg1rCe1//r0CvFdp9VjgcGf8T4zCFPJHie3vAFmvyrswKo1WwUY/BiPRlj9YTKaig
	 BsEgHJUScob3+RMhKthpet/OFdHxaiN6/EQQ3kjZO5QoQ3S4Xst1emqWRN9PZoUJCb
	 jg+ewr+VFnkbJ9fnjA2SGxQ2lKvbOw8fLMgpc1Pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C66DCF801F7;
	Thu,  8 Sep 2022 14:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6849AF8011C; Thu,  8 Sep 2022 14:20:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB851F8011C
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 14:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB851F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lYk5Cwl1"
Received: by mail-lf1-x12c.google.com with SMTP id bq23so27421942lfb.7
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 05:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ZlfvZ8tQr5gNlUoouZ3I9uNRBlKistdcE0MDcCmrbq4=;
 b=lYk5Cwl1ThhWYFUC/pQfIp7A8QMyj8x/zUm/1s/COaudKrgFe5IPBhLNuWG5Trg0Jn
 MJOfvY8J+XqxwZDTDPF0gBV3hip+vFdnX32JaOD/turJT3vyHK5L5gC2XPudecHwH9P5
 VyM6NaGK+XvOVmnuFVl8rJoWLYCfOYHdv6JwZb/TMZtcLGbiqV6stEmh+WLC9y7rysJr
 +q8KF7RUh8epOBMfdNi+/Eb83XferTCf7HToUMIhHYuyVO6ANib62PhMfHJnzSEq1Qpf
 t281+Bfhq80x511FOMO/LYUxSLLK7WJZOKKy3AumgJpIU/qtPmngdLN+NRnmddWrvAWL
 Gk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZlfvZ8tQr5gNlUoouZ3I9uNRBlKistdcE0MDcCmrbq4=;
 b=OgbW6ceqNoJk2PMvoV//IxuvcNgcjDXKAvWwd2aDVt0FcnBaaKL5dg4z1p0lojUn/H
 JMf+NhRZRsiADKECqXmnIXsZjMIfqVEUcQLwGIA1iSugiFF1is9cDQ/Xmd6j1a1SL9/7
 a7oW7jIu1cfkhjkv73tulmHAmGNZrJZsbmHtb2jKVFO6cTF0PxpY2At2+C+iF+dXyZUt
 1oQ2SXU4sijACfa+r7Q3k01KqmWEWbbeSLeT4LduUwcY1UkjgflIZCuTBBZtCOMfA+rW
 3oL6eseBcwX1WDUpNQj5cFlPwTA3nrvW5Y9+2kmxQpIMrKxo8iVxwcIRNNwRliJiefYe
 TReA==
X-Gm-Message-State: ACgBeo1w1+LvA2Fi9zGlmsHpEguYiAw2m86Ht6EYarVFilxfFM5CmfN1
 F0gdDBDC3NoO5LFMpVYnUiJ6Yw==
X-Google-Smtp-Source: AA6agR7VMqh8oJ3l0AiaXQ9a3lUiXGzxnL5vBOUpqUUZWZrosS4vE1RT8abc3K2o+aleCTQ3rc4TPw==
X-Received: by 2002:a05:6512:2252:b0:494:7a42:6ba9 with SMTP id
 i18-20020a056512225200b004947a426ba9mr2558006lfu.273.1662639643696; 
 Thu, 08 Sep 2022 05:20:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u10-20020ac258ca000000b0048b0975ac7asm361973lfo.151.2022.09.08.05.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 05:20:43 -0700 (PDT)
Message-ID: <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
Date: Thu, 8 Sep 2022 14:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220907135827.16209-1-astrid.rost@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907135827.16209-1-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>, kernel@axis.com,
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

On 07/09/2022 15:58, Astrid Rost wrote:
> Add devicetree parameters to control the insertion, release and press
> debounce times.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>  Documentation/devicetree/bindings/sound/ts3a227e.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ts3a227e.txt b/Documentation/devicetree/bindings/sound/ts3a227e.txt
> index 21ab45bc7e8f..a4aa4154c54c 100644
> --- a/Documentation/devicetree/bindings/sound/ts3a227e.txt
> +++ b/Documentation/devicetree/bindings/sound/ts3a227e.txt
> @@ -17,6 +17,15 @@ Optional properies:
>        Select 0/1/2/3/4/5/6/7 to specify MICBIAS voltage
>        2.1V/2.2V/2.3V/2.4V/2.5V/2.6V/2.7V/2.8V
>        Default value is "1" (2.2V).
> + - ti,debounce-release: key release debounce (datasheet section 9.6.7).

Use standard property units "-ms".

Anyway new properties cannot be accepted. This has to be converted to DT
schema (YAML).

Best regards,
Krzysztof
