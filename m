Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0760CBCC
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B919524C;
	Tue, 25 Oct 2022 14:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B919524C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666700856;
	bh=knDABm5NSMrbZuiceX9h3rNk5pa9y46eVVVBSsbX8sc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuzCSipUmF24TawBDefIDWXV4oH4jNERaCOpDBvbl0eoYIF2sNN9Z6CvZ7RjHKudb
	 YNxhAvE62X6iqNL4LDh4tlDPM4mDVRBwxTmgmby+i5j6y8aAR4KgmnVXY2OJ78P4PW
	 BFoLqTVGYcK7Q8KF6j5WKohfnT2w3Qpg06M/SvtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB7EF80100;
	Tue, 25 Oct 2022 14:26:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41F2DF80431; Tue, 25 Oct 2022 14:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B65AF80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B65AF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mc5CW/Wy"
Received: by mail-qt1-x832.google.com with SMTP id f22so7344992qto.3
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oUDb55F/wfKgAhE2ejE3CixOIq1tXHhPMaApHmafj2Q=;
 b=mc5CW/Wy/umHxhLgQjZyDuOSj4FMWvayMAg4Fz05HyEgTOV1I3xtPDntJqN3qECuAY
 mTWwp3gWzZUYduHK27vPviL8D9qjRYxf5bvSoe2skauZMjZMD5QSYufE+TkE79bheePI
 BYdpYkZjF4zgHQz82nq8idhex+dcPNESXtjeoB/ZPUISjMIuN7NmmYhrAkTgpwqhr3an
 oYkQIlBl1y5AHgMxt4md2zlTmTg0pyU2y9zLMtzuS2pD6GGaWjF/TYLqWQgOYpW3lrf/
 ybSzcaQYmuD73eMQaTYCIInP7K9wpcqdgl0iUsTt5MBsqL9QF6HJrZre/A4FRGiiy2Dx
 ULbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oUDb55F/wfKgAhE2ejE3CixOIq1tXHhPMaApHmafj2Q=;
 b=oJmJ6sbYA5I9XZg/+JcHyuUrwNOgjsIHAWdjrK5ypV2emRmM82+SWV5gK+87d3alS1
 wDGBkOdYlNhJORWkbec+ZtccHlPHeHi/tXDSYCYN7efhgjMVpxMLKyFOyPOTeRgyX6Ww
 2nhAJIVXRng8BmteRZFlvdf+eKfuTjzFByQWeVgh/c4EetMF5v7LjsQmuss8qO7Eo+FM
 fJSTQpeuo6UtUAbF/oa8qe/gzTxBi1AqXd2x2xQOjINakOk0lr78H7z3MOfGW1yP4uCs
 geuS3MHuEXaVDQkzSFjahkNFtjn73CRpu+g2vgu6Agx2D2V2P7ctNB48TpqY3HyZWPdD
 w5/w==
X-Gm-Message-State: ACrzQf1EQ+qItqIZDrF0Zvz3pVIwM7nM14yrWS+b2sVuoMdNpqryYgcr
 A/H0UEkngou+p9ThSvl3pKA1Ng==
X-Google-Smtp-Source: AMsMyM61ygt5D1dzc4qIV7FXHvxMV6ZkNXtAYZ84UiLNQnpIO0kLe8vSEVEg46x8MtbEqNw0Yxwkkw==
X-Received: by 2002:a05:622a:11d0:b0:39d:322:7c38 with SMTP id
 n16-20020a05622a11d000b0039d03227c38mr25465827qtk.291.1666700792138; 
 Tue, 25 Oct 2022 05:26:32 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05620a409200b006ce515196a7sm2005039qko.8.2022.10.25.05.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 05:26:31 -0700 (PDT)
Message-ID: <0175808e-2cd5-8689-1a94-172d67e4eb57@linaro.org>
Date: Tue, 25 Oct 2022 08:26:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-3-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024220015.1759428-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Derek Fang <derek.fang@realtek.com>,
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

On 24/10/2022 18:00, Nícolas F. R. A. Prado wrote:
> The rt5682s codec can have two supplies: AVDD and MICVDD. They are
> already used by sc7180-trogdor-kingoftown.dtsi, so document them in the
> binding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Added mention that property is already used in a DT to the commit
>   message

You already got an ack for it. Don't ignore it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

