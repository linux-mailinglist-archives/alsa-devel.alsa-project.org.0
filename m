Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7E608EA1
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 18:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D36BDDC;
	Sat, 22 Oct 2022 18:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D36BDDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666456922;
	bh=ar765sjzksRfHey91APH5XKmdwXY4/b2l9jheqlgYjQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uzTw8gs98v7DTZMd8IRb4dfuAuUXAy06fLV++o8Q1ySuXhzXb7aZ6xnaGK8cJSGNR
	 eqBM9Jau+wTPV/rZWvU/e8whzSHHqXg8MVLse3L5hOBh0xQWOuDw80UqrvUoDldpYe
	 MPImWVov88KLm4COLac1M0Snn/Fym9gfttrGnolw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF576F804F2;
	Sat, 22 Oct 2022 18:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B16FF80290; Sat, 22 Oct 2022 18:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6C5EF80134
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 18:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C5EF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RkvHApUp"
Received: by mail-oi1-x22e.google.com with SMTP id l5so6602692oif.7
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iP77d9Lel75NNTeC/rovMM/7kBmZVdqayVHvuSoNCmA=;
 b=RkvHApUpjHBzk4Yd5ToAi/L9n2T3vrz6EI8ToaFZBvbv/QLTXiA3yZIi/343NzG6sZ
 Tv9QK8nTtNTSnJQvK62ykBZyXc8vL2DV5jphfhH208raoe4D7uTmwr6O5lg1FHFdlFuy
 ovJZFw7nW1cHwmCduOnWgQXO2D6GXMKirSqTTqQrDQukkIPVIwqgx8bjel9c0uHTE+vk
 vwgHlnPDP5hlz7tvQGWYedPUCspBVGd5Wy5jENNHu+qf7HgJkumS1pD76oCxiRtoVS1a
 SPFnz23l/L9LREn8UQ95vmoc9ti1r9npuzz0kr38m1KvfEh58QTy60yNkvJGnSYwwSgP
 XVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iP77d9Lel75NNTeC/rovMM/7kBmZVdqayVHvuSoNCmA=;
 b=lPMhyTeQ1EZ007nwTjtkMdHe5DXxdcHCryq0KBr+ia1AcYuIgB9jV66MF8XpADwsX8
 vW1cePoL4iypYA4CR+qQHFAWWC5DuifK6hsDPEZ9D9XqBK2vo5UwvnIMtnUh9YXPmegY
 M+heq6Vrf11N3TBKJH2x5N6g8wO2ZpzdR0T55fZ/48CDsxVMw0XK6bz71fRLu2OyWb5w
 yEx47MNUk0iqwaloEDxPKruxny2dUpeddH00HocZ6YB6CT+V8Gxu6ma+S71ivzOgD56K
 e1pJOoQ5QXX8tjZxYfGQH+BqcPaGsvDzjI8dQldKvJ/aAVoIVtqZOVedpnMVMO7Fxqi6
 snoA==
X-Gm-Message-State: ACrzQf0Xvez3pNe/Zu8YHthNtcYamOXnpmT3B5QhH2ZSKTvLuej+5vXL
 UkjSoujt5cA9FOmLpwViXkn46g==
X-Google-Smtp-Source: AMsMyM6OxTwHUCLnaaXnogOI8LsSTB6mLrmjmy+fSXld/fD2a28f9s0G5GtafL9kXzltu/uDr+ynWw==
X-Received: by 2002:a05:6808:1384:b0:355:535f:118c with SMTP id
 c4-20020a056808138400b00355535f118cmr11476258oiw.35.1666456865493; 
 Sat, 22 Oct 2022 09:41:05 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 x67-20020a9d37c9000000b006619caef3bdsm2420676otb.25.2022.10.22.09.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 09:41:04 -0700 (PDT)
Message-ID: <f7007c75-9c99-902d-170f-383b7347922c@linaro.org>
Date: Sat, 22 Oct 2022 12:41:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: rt5682: Add AVDD, MICVDD and VBAT
 supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-4-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021190908.1502026-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 21/10/2022 15:09, Nícolas F. R. A. Prado wrote:
> The rt5682 codec can have three supplies: AVDD, MICVDD and VBAT. Add
> properties for them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  Documentation/devicetree/bindings/sound/rt5682.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
> index c5f2b8febcee..5ccf4eaf12a9 100644
> --- a/Documentation/devicetree/bindings/sound/rt5682.txt
> +++ b/Documentation/devicetree/bindings/sound/rt5682.txt
> @@ -48,6 +48,12 @@ Optional properties:
>  
>  - #sound-dai-cells: Should be set to '<0>'.
>  
> +- AVDD-supply: phandle to the regulator supplying AVDD
> +
> +- MICVDD-supply: phandle to the regulator supplying MICVDD
> +
> +- VBAT-supply: phandle to the regulator supplying VBAT

Lowercase.

Best regards,
Krzysztof

