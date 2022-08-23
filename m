Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C871B59E4A9
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 15:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7684B16B2;
	Tue, 23 Aug 2022 15:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7684B16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661262591;
	bh=V92H1gEX349lVVFUIazDXu6q+pWysBiJiVDAfTzD4CE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gww10ewDM9Q7zECuwJ+/kowbwQi+l7kIC/TG7VKEAYyCLCLBsqFHAiE1/6+30rKZw
	 wb5fdVthabicihSxl6m1hlVXiihjQavhYlGAQgxXCTJqxgx1xjBgrxdKR5Pca4HE/5
	 T9iXugjJ3iTFA6tGtW5JzaovPFWPMIpOZ+4jt/uQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17F17F804E7;
	Tue, 23 Aug 2022 15:48:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5677DF8020D; Tue, 23 Aug 2022 15:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 238D3F8020D
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 15:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238D3F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lnuCGHm/"
Received: by mail-lj1-x22d.google.com with SMTP id u24so7983961lji.0
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=i6g1ytsthnfWXIku4aqH3xhdM/9Ri2X7FyfLWo9ROV8=;
 b=lnuCGHm/PTxz1gMjlh6EwYedDmDSkRIcLQu70CyscsSnw1bFVmYmwYZU7Vskw193FH
 /gaLFbR7JgbcnCLuvFKdex8r461kKWyBn1HdOLi9u6roSHpZKBEwrRM2Zsoh7+rdEsco
 v8unp4dpv0a5xISb/Cl3YsM/lPwz1OSib5tK2KJuRZtzNKu83K17rsTRcMvMU4pWvlOd
 1BLlHWHRD2evfPGxn+b8kZDL+cuUGoa9TdbdupPzwePky/8K2AdrQuEflNXthdxPp1YG
 kLPS2mKpS059ru57iN+9ziA78SGoI4dugzGm0MKb1EajM98qMzCzBGoxKZmSfoCzoFNa
 7UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=i6g1ytsthnfWXIku4aqH3xhdM/9Ri2X7FyfLWo9ROV8=;
 b=W2gPmx7oKTwpGs+Q7SFp2hKPtzeJgWXVHLtTrtt4IKM1UBBMSN6yCB3t2FDnaCSpYC
 X+p+tC34j7yyl/cfEFNR7xSVHxigKusHa/W1puyt+NBAfdZzl6w6IzfJkArlVuDl6Zid
 RYz0AuUYWvHJKb2xFE8cVmbkgHd5JrFxf6WvysugmAOIcDUj7awGGjgRQM5s89EPNW8Z
 iskFh3lnN7AN/79xDlTmtgYB0LnlUTKdDh4uzPKHLXGqo+3VociOZUzOnmSAJb29xhNh
 vKjONO5NQhghDyXsIT7vB/r1qMPSNhm7kucK+d3vhRoZwevln7HsK3HYlE7WN7acNcyV
 mJ+Q==
X-Gm-Message-State: ACgBeo317iIEg2RZrrTvnehsmYQ9TWZz4JYquso32PQUS2ftQxfb3tdC
 qJcMZ8wI9qkRrix6co75xFrJ2g==
X-Google-Smtp-Source: AA6agR6/zduTpM8TBLJ4dYqpdr6hx69FMcRTHKzThqsgckEidignmxKxVwL0wGuNZc9gPHwW/XWewg==
X-Received: by 2002:a05:651c:509:b0:261:c6f5:59e2 with SMTP id
 o9-20020a05651c050900b00261c6f559e2mr3908472ljp.28.1661262510922; 
 Tue, 23 Aug 2022 06:48:30 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a19430d000000b00492eb7205b0sm873422lfa.210.2022.08.23.06.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 06:48:29 -0700 (PDT)
Message-ID: <2bd97f8c-8613-1414-a185-9ef2e17925dd@linaro.org>
Date: Tue, 23 Aug 2022 16:48:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for SOF
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 broonie@kernel.org
References: <20220820075343.13993-1-chunxu.li@mediatek.com>
 <20220820075343.13993-3-chunxu.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820075343.13993-3-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On 20/08/2022 10:53, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be
> retrieved from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be
> specified from DTS
> 
> Signed-off-by: chunxu.li <chunxu.li@mediatek.com>
> ---
>  .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> index 059a7629b2d3..0281984fc916 100644
> --- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> @@ -43,6 +43,16 @@ properties:
>      required:
>        - sound-dai
>  
> +  mediatek,adsp:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

No need for quotes.

Best regards,
Krzysztof
