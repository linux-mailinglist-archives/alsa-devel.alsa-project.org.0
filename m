Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F362B47D
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 09:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4796A1695;
	Wed, 16 Nov 2022 09:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4796A1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668585876;
	bh=2h/NFIikqOyu8ZNBlMZKKQreLPcLCsLahskQtMrr8Nc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a5gv6AplIPUfrsHUSFA765VTPToRmJ+kd6b+Mi5xgxMh93HJ/S5LmbYB5aiGW9kmq
	 ho2GKqVaFbxWbTKPkjAqNfrqrbVHqg8PKDqulhlCoMaPoag+t0saOPRp9GRr24NcaD
	 CpGng76ygZcWfgo8yMojCHyu4DUrN/iV5aTF+rk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2875F80238;
	Wed, 16 Nov 2022 09:03:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47331F80169; Wed, 16 Nov 2022 09:03:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 359F8F80089
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 09:03:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 359F8F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JU1gIejp"
Received: by mail-lj1-x236.google.com with SMTP id l8so20754845ljh.13
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 00:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h0SEv5+njF+NHP7in5GWyHvs6+61ZdhKoUhW5pFUx6k=;
 b=JU1gIejpkKuUWbOJmZBiobS407EzSG2JN6btj1k5B5e48yWLAXwm84GVv2d8W4iCZE
 kuKGaJWb+aTKp//7ft3khW0XVRwYMlFZZMOCdCuVesm3nYyBsrMeW4m8Te2/DIQbvP6U
 nQV3h5oqhDklhTK6HBHnPIvXA3MdMiAXdmS66UmhUVB3kb5ffCDupq7ergXreNJ5vVMO
 HHA10COZNV7xjmZUkKPrzSZ2ihSgA2RrSra0GUf2n+86/ao0Hhnk8PUsnWkgUcIqkcF3
 0TZW11CtAvL6MJUNxOcLlwCvAXM/3WGsNIP3/4PcGg+R6TFoUgMMtCTDXnuNSvEQ8Ky1
 MxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h0SEv5+njF+NHP7in5GWyHvs6+61ZdhKoUhW5pFUx6k=;
 b=yNj+lYTbrr9OhwKkqjLVxecRV68ZIq0cSCCyNn8/Sgu7Xoe1XHZELIFMowfTu2Yezq
 YKcbB+jl9tGaFzNHeQ52tQ91A+HUPmD1vH0lkse2wCIz73dQcvTBsWnhkghCsFw847GW
 g7Ln3qa6l5zXiyMXzYBGUd3t4I2an1OJLUG3v9ulR4JU/cx0n76iRGIrmg0nlD8KqWaV
 V6HolYwLFtB0uV9WoWjIutiJrXpqQUndNGbpk+mS08Q7T9tUGYJzbQrU/cafAfzRZES0
 5bhUDkpYLF5B9SMuG/AJaYsTCyKUIfR7z0g1AuI9Xil4Rba0AH/FxGYNG4OLW3CMZyYi
 3r4A==
X-Gm-Message-State: ANoB5pm5Zz2kngkmqLz94FaPu8MAzYUXv2eeTyDHRgAEmmDU/hu7spQA
 Mi6fJBZWmamr/nCKHcYseNk3Zd1O6hu3m74N
X-Google-Smtp-Source: AA0mqf5tzrv9NDMC+SYz6A93cuTjMOX8upQj3+hLyU1Z+1nYPCDI3NcXemsbgnBGl2BdqoI4g/3tig==
X-Received: by 2002:a2e:300c:0:b0:277:524c:f83d with SMTP id
 w12-20020a2e300c000000b00277524cf83dmr7704707ljw.217.1668585812252; 
 Wed, 16 Nov 2022 00:03:32 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 f30-20020a05651c02de00b00277045dcb5bsm2860501ljo.97.2022.11.16.00.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 00:03:31 -0800 (PST)
Message-ID: <03e16d55-0110-bc3a-705f-a2a47d2876cc@linaro.org>
Date: Wed, 16 Nov 2022 09:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: dt-bindings: sun50i-dmic: Add D1 compatible string
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20221116034621.37762-1-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116034621.37762-1-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On 16/11/2022 04:46, Samuel Holland wrote:
> The Allwinner D1 SoC has a DMIC codec like the one in the H6. It appears
> to be register-compatible with the H6 variant, and the existing Linux
> driver has been tested on a D1-based board, the Lichee RV 86 Panel.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

