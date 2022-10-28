Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2706119BD
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 19:59:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41D016B0;
	Fri, 28 Oct 2022 19:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41D016B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666979958;
	bh=Xp0culqxofg45iyLZMhLIooxVSJZ0q8rIU0a49RqG/U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HNIOcHvcvz6RM90C343bH4IL7PBSp3x0h4TFrbV+s0STKUG4dZGGA743bVOFN46Y8
	 001HwhPdKt3ZRjbQbVe5+iHLYT6vVgbnmelcdxbH9hS8W+vxUTFlK5PvIwAUhbjsXO
	 vy+PQIR+GjuILJcWA8nQGdbtlekeyDDv0Ir/+vfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA935F804BD;
	Fri, 28 Oct 2022 19:58:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37CECF8025A; Fri, 28 Oct 2022 19:58:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C69A0F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 19:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C69A0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fraNEttc"
Received: by mail-qv1-xf2c.google.com with SMTP id i12so4575409qvs.2
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2rrxegvFg2FU9tdiMVnm2F7JFLebLK8/DzrkdwOia8=;
 b=fraNEttcjrbsQWUwMp/J+ZIx1bUNFBiwkQcyDOQ95PrT/Ks0L8ibhqyrNNhv+O299F
 A6ygkQQlI+xYVk440AFZ+hE3xghWHIBwToMAOFiBqv/00BlolCA8DouG4Mu54Y9tTKh+
 xlROBBFVesNR5GN94eEclsuL2A8mFYnWaSuk/1e0Q+jgACzlyq2SoWxUu0YDy6Rr9UpC
 lMPibTya5CqLdgxez8XUv2QadYFSuD9hDqNRnZeAWrPgM5hEjvGBBTsU1xE6tQEepu4L
 4QXW0AsPMWadTl/iAoAiaK53L8EMsKWejyZGupqUJKGuH1ANvotGiMJZ3O1kVuLOan+K
 7UFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2rrxegvFg2FU9tdiMVnm2F7JFLebLK8/DzrkdwOia8=;
 b=fOZjjB0nKidBwxRB8OTStmc7MhmcuQO2fM24mx1Hhi3aO5MB5pUCpwlW52VnfH55p0
 i2zinqvpPZ+UAlI4oblATA0+Aommjo1iIXsN62rXKBl7x69lc+u3Xa0DA9tcgwklC088
 CH8+3PWD6rhXUfEOKg0Ay3Q0ImOedusMcjx7w0SmkmLHfDyFzjx9Y0Q2Ul6WTpqftol5
 mBy1oCoPSOrrne4Z4WGa3fBGL67/DnwYEIIY6KRB00IgkfIGgIz7ATYfqSiD8eEiGlue
 bi6KIbK1uRLkthI/cFnSLMNTagoqyo80deAUHP0Ak4V03QdYw5p+W8Jp3Qdj2UJJ3kZb
 y1sA==
X-Gm-Message-State: ACrzQf19JRKM0CjejeZED3TjkK4yhCmUel3FJ/pbvWGXSWt7jUA/gI7o
 CnXF9F+/8O79j7SSN7PzUrPjag==
X-Google-Smtp-Source: AMsMyM6quImhJlk5cn6eegtdWzH8grrjs4wtY1GdGHe9oHTnd9M/5Z7LjS0jMuspsFZFxBZYG0eHRg==
X-Received: by 2002:a05:6214:3005:b0:4ad:8042:128a with SMTP id
 ke5-20020a056214300500b004ad8042128amr545569qvb.66.1666979898742; 
 Fri, 28 Oct 2022 10:58:18 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a05620a0e9a00b006bb82221013sm3426268qkm.0.2022.10.28.10.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 10:58:18 -0700 (PDT)
Message-ID: <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org>
Date: Fri, 28 Oct 2022 13:58:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
 <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
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

On 28/10/2022 13:22, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> index 4fc5b045d3cf..212d2982590a 100644
> --- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> @@ -21,6 +21,10 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
>      description: The phandle of MT8186 ASoC platform.
>  
> +  dmic-gpios:
> +    maxItems: 1
> +    description: GPIO for switching between DMICs

Switching how? Enabling? What is the meaning of each GPIO pin value?

> +
>    headset-codec:
>      type: object
>      additionalProperties: false
> @@ -72,6 +76,8 @@ examples:
>          pinctrl-0 = <&aud_clk_mosi_off>;
>          pinctrl-1 = <&aud_clk_mosi_on>;
>  
> +        dmic-gpios = <&pio 23 0>;

Use defines for flags.

Best regards,
Krzysztof

