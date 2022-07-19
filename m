Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE89579821
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 13:05:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9118B16B1;
	Tue, 19 Jul 2022 13:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9118B16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658228712;
	bh=/iPqU057OPlr5ueGX0H3uiPtqd38mkubixT2hXyfCL8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bW03b1M40ylf5W+kfGThtPjsBicgnQIWIWAZQ6Fg9V1qgIrMstj7q5xn6TTrAeGiA
	 93f7C4USAGhGm2232fNopv585ImZbn3aFETcvoLKfDNaCRlOcg54JkI4eZIABtz8LK
	 027zYtixXYsHyMLSQNMVZYkEDDSrJgUTpvTtTY0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A17F80118;
	Tue, 19 Jul 2022 13:04:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EE94F801EC; Tue, 19 Jul 2022 13:04:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28552F80118
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 13:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28552F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F5hG1ciI"
Received: by mail-lf1-x130.google.com with SMTP id o7so24129661lfq.9
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F+YPwJ3OalhF2uEWkjDZQjPsGGtm1z0ZYbOsdNSmeBk=;
 b=F5hG1ciIO8BTpnanp2tu67fMURJ1JoFRQAsbWNKS+Qy3/N5k6mavM+zpyEWnGsIdWo
 RuWXixPtQoYxXTpoEJEe4UmuQsWuNyrbXP3aDttJRQ1sVDbH3Wz/oxyWpwpMCmb/r4PZ
 nd3hgz4cjIwihxH3xKIxaZ8hN2H0Be8q6COFpq8YhvYFXfSx7X+d5xBilNwzVM0bOyAL
 CxyPr+gXDfqFvXtkwLPNFm2YVc14Z3kTlgbq7/iPHhyaGoGYZAGEreuNGxOzPLvttrrT
 vLL/krA71tiQdyfBRhDgwlSWNAj42JQDyJtqEOPpM+nIdA7QU8DMmGC8MWhzrlzlyFue
 YXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F+YPwJ3OalhF2uEWkjDZQjPsGGtm1z0ZYbOsdNSmeBk=;
 b=1iRF946Ne2i7ZIQvtjQry7S5xMndhawGClGBCA27PdTzDSc5+2pUVAj3UfgINT6MwS
 pSQdU0nN5gHTTGpn9P0GedyaBP7XNMnZ4qHLrP5QzqccgF5WwQjL9nNrzjwhQVlf8uuK
 K8sPOk8KsfHpXwG3ybLAkO5tUHcIY9kEmechWTOzL7nh2gFSDW1RRT9mIWfmZi4ZYkWY
 hfpkK9NdlHF+377CHxgknl0LtaeCaLPZiBWFqcKw8IcyWYJDjmB3J53lryyy96PIUS4n
 ALM6WQImTTKCD0NCPia3On4h+/5wdbX0zqvhnmg2KDx9r3zJ75fu9jAhH5FRRJbVpGvO
 JLHA==
X-Gm-Message-State: AJIora9VkgwlkZ1mcSzQUlG50OMLoHj6jEr/GqcmplQA0B2TUCSSyn25
 wuI2iJ3afBF0DiR+6WTZK87img==
X-Google-Smtp-Source: AGRyM1ttFWfCdMSUUs3sHQIw2bbRarjjsjCbfQfhB4v3yEDUBVXvq/IImwKAuowuawz9yl8kOULpcg==
X-Received: by 2002:a05:6512:3b9f:b0:489:e009:ae0c with SMTP id
 g31-20020a0565123b9f00b00489e009ae0cmr18648844lfv.213.1658228637111; 
 Tue, 19 Jul 2022 04:03:57 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 11-20020ac25f0b000000b0047862287498sm3153889lfq.208.2022.07.19.04.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 04:03:56 -0700 (PDT)
Message-ID: <ba62b5a9-cf95-8ad2-3bd1-e2f2de5ab6d1@linaro.org>
Date: Tue, 19 Jul 2022 13:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: atmel-classd: Convert to
 json-schema
Content-Language: en-US
To: Ryan.Wanner@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com
References: <20220715162922.660859-1-Ryan.Wanner@microchip.com>
 <20220715162922.660859-2-Ryan.Wanner@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220715162922.660859-2-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 15/07/2022 18:29, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Convert atmel CLASSD devicetree binding to json-schema.
> Change file name to match json-scheme naming.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
