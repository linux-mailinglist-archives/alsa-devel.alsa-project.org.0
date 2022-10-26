Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D560E3C3
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 16:53:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8C713BD6;
	Wed, 26 Oct 2022 16:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8C713BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666795990;
	bh=sTObLZF+xOdVtgFTD8+jcaHbExSLfuiRLVQZwjreGBc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AUOstKygqjXOqNMk/ArAIBmyb5gloNW2PZhjX9YEhmxYauoSvLIk52gE90BKnIxoh
	 MEAnx96hQc4JOmKrpG0LFGAJrlQsdVlRJKkiwfUs8XHeb8qCeVHRLEUGn9FG+rQGYo
	 +SAdEjZJYOnRIwXa9KlFQe7B8ZP+iM6TXuLAY37E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F55F803DC;
	Wed, 26 Oct 2022 16:52:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E93FF8027C; Wed, 26 Oct 2022 16:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 608D6F8016C
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 16:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 608D6F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AjSJc8sb"
Received: by mail-qk1-x732.google.com with SMTP id a5so10683218qkl.6
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 07:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BRAVl/jwTcV9oATKPy/gFpDCwVtUOLelijvTTaSWnGg=;
 b=AjSJc8sbeB9AS4fvGTqF5hOSH88uRNxiEUF5cwc8f9rtlcA+g5xOJ96dOFLewJ8sg8
 zUIKdFb7J90tDQ+DtAV5ExRVljW7NOqNlKX0FFoy031GHB5Psunydm1h6jpp60PvuyNm
 /8I7o1Ql7yZHIPSp/KaWj65QQO6FB5WTgS2ZMng0KSNHlltE5wkrAbp76Y1p4GP9hPsH
 FklH1IiwWTSdfWTYPrs2XxLPnt/KMENpJ63JsNLayK2m27hW5iCwQcMdsnTsRzRa/swM
 an/gCOX2pr04x8U4hSLxWwQwzNOfT0yu+DM8WFb+ddYZT3N4D3coduusPPA5dmgzgrWC
 N5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BRAVl/jwTcV9oATKPy/gFpDCwVtUOLelijvTTaSWnGg=;
 b=6hjnr2oEHZJf+DixlgxTQk1x/jEI1+zB2EPDAK/4wN3c5MJaqAqdP3H6QMi6vNKBlO
 1+bP1v/jdbumJyiPJi8K/E+M9wwM82vUVpTUNcncyRV3VSIMNqlW4k/PdOin6iK3Uv5e
 SUwzCmWzte9ibN5aMi+mu3EhSIuhPTEceEKrtP5Z01d+HyPdhUXJ+qRGe9G2015lcTk0
 FiXldyuu0cZoOEnDikrixjgUsQDWfJCzy+kzwI92BlY/sVsDObwTHx7T4z94NX9f7VTF
 boflsfIXuWN/xmrM/N+kJxFbgc0RXbwFufsfVUC6dzWlKsordiaA1bus56Q3c9D3mVlw
 9RLQ==
X-Gm-Message-State: ACrzQf1QPXbGfRZYqRDrJNWJ8ouQstLaGPmjdmQRAyC/D5xAV3nYMEgc
 Tw987gXtVYlhRgAb97QNodaAcA==
X-Google-Smtp-Source: AMsMyM5iwidwgAruSNa03zv/AGhLCmH/0fY2+r/Jj+TasH9LX4SwHYqK8c3EVcZjjuFFc5SdGMeeaw==
X-Received: by 2002:a05:620a:4385:b0:6ee:7b48:202e with SMTP id
 a5-20020a05620a438500b006ee7b48202emr31725350qkp.306.1666795926065; 
 Wed, 26 Oct 2022 07:52:06 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a37ab06000000b006bb2cd2f6d1sm3885523qke.127.2022.10.26.07.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 07:52:05 -0700 (PDT)
Message-ID: <895ab493-dcf2-c9e9-7850-3a6aea9a97ee@linaro.org>
Date: Wed, 26 Oct 2022 10:52:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: rockchip: i2s-tdm: Make grf
 property optional
Content-Language: en-US
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>
References: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
 <20221025124132.399729-2-frattaroli.nicolas@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025124132.399729-2-frattaroli.nicolas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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

On 25/10/2022 08:41, Nicolas Frattaroli wrote:
> Turns out most things don't require the GRF, so making the property
> optional is the obvious move.
> 
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

