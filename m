Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741C5608E9F
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 18:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA3DBDA1;
	Sat, 22 Oct 2022 18:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA3DBDA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666456914;
	bh=lwG9R2IhTAFTeNcPG4CR38AqPiGtGOTJmWOucubQUoo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FVVhFpYAvQrIMPcBKL1kOQ8aDoSJz1WtjcAKGuYv2N69l17atMqduhhaKzy7KnrFK
	 9ReI8KP5XdelhSuAj6jFO7SsSzl7aIL63tqC4MEJLzskZ4cJQtEmUIMDZWP9sFpoLP
	 Wm3stIKQcTYdCZcg+jbUYLcFN8IywcWsPCddrW7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BDF2F80301;
	Sat, 22 Oct 2022 18:41:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5718DF80301; Sat, 22 Oct 2022 18:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B9FBF80290
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 18:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9FBF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="o+6YQHDq"
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1324e7a1284so7221158fac.10
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QimVpA/xM2p/9j3XXOHUnzRFMhzXweEIX7clrlOcGUQ=;
 b=o+6YQHDqxfQ77fvo5cXuuxEeb5dlFfOxXjR6kMONmcT19bbfftY0EdoCunrFd3IiL5
 S++EQZf212jX8dkzq4URwqiy7j676j3qJXZIqqUTaxCT55a+c0JRLA7Awz2A3YKqLJJa
 G1rCq0Ixlvg4uCi/zDh0yGuFw5YivJRA+EwOIENc1Er8SQbJJIRqYEZPFNb6gW68TPl2
 IlIVHNg3eg/l4A1SixjNDgDWxRAOZv3PKTuzkvBWtZ1UF+cYSUivpiPtrix4Lr3qsIlY
 pMMe0sQukUMff4mJBuv3M9forRPewkx3LARIRXhHWZqqyvYLOJHBkKnbdpT1m0dsQG7R
 2u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QimVpA/xM2p/9j3XXOHUnzRFMhzXweEIX7clrlOcGUQ=;
 b=s6BryJgfpFESNSSn9GrMEd2B4gTXygSeQ58U7ex4ceJ3FG/svo4xfshdBe/qGj0kdf
 K3Gs5gavIqfYakdC3hDAoXIDHmJmxIL3uog+q6Odwjf5tmOs1QNz9fM5EuiKhAQV27Gx
 qYDnb7Kx3w9a9Fn0bkI53AozNc01V74KclkZmzlg2PNx/q46eT5ukc00iOl2pVmkLM2n
 nPN9uI3aDQ1cqDl/lFEkRnKviEInnZ3IT7ouYqCWYjECoOpyNTpgoCOnTPSRdiamYE3H
 8W6eoysMjayWsGL1TOrhzTw4/28AXTJjeyiWWKRKlZ/IZ+YOx2ZnUb9VDDe3MVfrU8UJ
 xsYw==
X-Gm-Message-State: ACrzQf0xV/tBU6PvYKbjEhZ/fVXLFZdzSWLB4TEmSyi4jVUhKAyns0zL
 SueDz1i1oI7YCrr0xIDPgH5b3w==
X-Google-Smtp-Source: AMsMyM7uIMiMDP9LIvFuHmFBJXp+2jG1Qk2DYO4TCJxIdkO8uJ5uHD/aqmm/eNbNn/XxFS6AjiXvrA==
X-Received: by 2002:a05:6870:d29f:b0:132:bd27:825d with SMTP id
 d31-20020a056870d29f00b00132bd27825dmr16079326oae.99.1666456854450; 
 Sat, 22 Oct 2022 09:40:54 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a4abb98000000b00480816a5b8csm9723350oop.18.2022.10.22.09.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 09:40:53 -0700 (PDT)
Message-ID: <168e88f0-4e9c-36c6-6862-207a10239533@linaro.org>
Date: Sat, 22 Oct 2022 12:40:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-3-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021190908.1502026-3-nfraprado@collabora.com>
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

On 21/10/2022 15:09, Nícolas F. R. A. Prado wrote:
> The rt5682s codec can have two supplies: AVDD and MICVDD. Add properties
> for them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> index ea53a55015c4..ca1037e76f96 100644
> --- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
> @@ -90,6 +90,10 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>  
> +  AVDD-supply: true
> +
> +  MICVDD-supply: true

Ach, unacked. Please use lowercase names.

Best regards,
Krzysztof

