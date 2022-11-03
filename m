Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90A618B66
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 23:27:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 198891669;
	Thu,  3 Nov 2022 23:26:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 198891669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667514451;
	bh=SAwZTPw14w6e6XyWuPAwfN+oiSDELY2sNwcrEZNad/0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYJ+jr+8ody3ZuM0Ak2HaTdm7aRPIBj6ZyNSbk5zoGT37glLbNhhP+jNOvY43/8iq
	 VQbIh9UyiUrYOAl1Adj+CdxEkaRfeav0PDM7eUR1QFg80VSOhwWCUlZR9icK9mJWHs
	 lKaIdu7HiCkDnUqQYvjJhyOLi2mRA+FtDtgil+Ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A010F800BF;
	Thu,  3 Nov 2022 23:26:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3BDBF8051E; Thu,  3 Nov 2022 23:26:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE2B7F800BF
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 23:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE2B7F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GL8m1Czu"
Received: by mail-qv1-xf2b.google.com with SMTP id ml12so2151682qvb.0
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pm4RXMLMyayJrb7lXI9IxGRtGOHJZv7BC9yPVfB+mM8=;
 b=GL8m1CzuwZwzNpYIUHbow5Fvi19Ye6qn7FHPSJkUDGa7SGHl1NmnmwTIE2RPPSwVZC
 +Av/sCDTctqtN8YgL186XiH7W6YP6hsYEpbhZdHJuowuM4OzherwAPIIudwEzTghx8J3
 pg0HumM2LiB77w2KM6FvRoalcwXjQntGVF7Htyqr0NQyRAbJw7lXeUmcqpONMu1T+ZkS
 +/F5TMgZipWfMcHQlmvX6gxruNsOnQ3ck5ELgEkEU/QxhxPc5Prud9xndNiAqSKUQobQ
 1JsXNU8GtkuCt7tM1DwiWXLALlBmN5XU60R9tjo3umqEnXW0R+MoC5xnC+IFt9saIjX/
 PrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pm4RXMLMyayJrb7lXI9IxGRtGOHJZv7BC9yPVfB+mM8=;
 b=boFpM1WWTrHyGtcWK7J5vBrqr/iVJA+DtftoFL715OnHTBTwYEBREwEtzT7BV0V9mC
 W8Ep+Wxa8pRlUOcz8wSTS8Eit0QytZoEzkbCzMQ4JWvR0VWxVY56FKTeWE0ydvxexdLF
 sb8MptRmwZe5DWqEZj6JeJAZ9zTkFSvMthYeWaAunUG9CEVOkzkQvpWG9lZnhGNQsY7h
 sq4xVuLhZCDclFwduor2C6z3SRAXVeI/9aqKh6UAwoQzUm2rZmPw4NPTuuQ0Q0JYP7EP
 QktDSx+Okm6dGmezhJx3JhF+MUPBByAzsjNM7fayrR7Ra12qHWRttFgAyZXe6qFknstc
 66vA==
X-Gm-Message-State: ACrzQf1oI8dei8M1wXx9DO4OxxynuIV6SBs3Tm9ikAGzqdiqAKTSld/1
 noxTbHb0M11ev5A0FMa6/EjJlDKQfEwL1A==
X-Google-Smtp-Source: AMsMyM7hZ5+D9gSJ6uhU8oVvFrzmk6OCUfAr9KAFklUH9XwGX9WRYuM+AJbJfAXlFjMU2GCStm9RBQ==
X-Received: by 2002:a05:6214:d0a:b0:4bb:e1a9:4c84 with SMTP id
 10-20020a0562140d0a00b004bbe1a94c84mr24798897qvh.27.1667514385906; 
 Thu, 03 Nov 2022 15:26:25 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05620a127200b006eeb51bb33dsm1532153qkl.78.2022.11.03.15.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 15:26:25 -0700 (PDT)
Message-ID: <1b1aba4b-e260-8bee-a8f6-761946361b11@linaro.org>
Date: Thu, 3 Nov 2022 18:26:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/8] ASoC: dt-bindings: realtek,rt5682s: Add dbvdd and
 ldo1-in supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-3-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028205540.3197304-3-nfraprado@collabora.com>
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

On 28/10/2022 16:55, Nícolas F. R. A. Prado wrote:
> The rt5682s codec has two additional power supply pins, DBVDD and
> LDO1_IN, that aren't currently described in the binding. Add them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

