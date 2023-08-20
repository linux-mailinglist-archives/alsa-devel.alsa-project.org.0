Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF4781FE0
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 22:33:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9793E825;
	Sun, 20 Aug 2023 22:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9793E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692563628;
	bh=sDastp6wGXGDp5Sf1LRa9hgjJD8FEzLv9CMOpD8ImPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s+OG+Fp82D9F+yOnKkPWkalBrGfleaIKNVP3khhrLXVM9pbxK0OKJmVX3nbiWpm2p
	 JaazTIQC0lfwCcxJY5KhjV9jhBGwzysY4u0bP/Y55eAxrxWzZvWg6AlSFfMFgWvq4L
	 oOCRG4QJCEtvwH/jv8iNOsSM5+iS7LkYJzWEfuuA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39E0CF80508; Sun, 20 Aug 2023 22:32:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A869CF8016C;
	Sun, 20 Aug 2023 22:32:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8423F80199; Sun, 20 Aug 2023 22:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34DD6F800F8
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 22:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34DD6F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EBd76ZBD
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso41969251fa.0
        for <alsa-devel@alsa-project.org>;
 Sun, 20 Aug 2023 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692563540; x=1693168340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZxBeLwRDLKLAdBdsYAHXWMJXrTZi5pLoEbnjRzYS4E=;
        b=EBd76ZBDi/sJ+0hGN8EQmzSDo4YJyPtakXUx8wshf1mosdbVpUCDEIMURO7yt9HLO/
         WiO9ri1/Xe2RX++ugvn9fhzOjOhW1lMMvQkZfvW2hbT1bac4pAx2lFs0YmIxYZsE7NjR
         tMVlIv9Yr4HIjzY/wGDheAMtmz01iIc3LmS1Ozw1yoefJqbFj4oHrUK51B1JxDb216IB
         Ws6gUBVBEqVmBL5yqEwqaaN6ZnBlhiG1vZu7d5fveD5W5BrFFin4gVdWxac/XrcdM5TP
         JVe9mm5/daSHRWKwiFqewbDZRZFJZcLEShX/gPijbHxJqPmbGMMy2UYKCRFdjMoMzzRz
         IgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692563540; x=1693168340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZxBeLwRDLKLAdBdsYAHXWMJXrTZi5pLoEbnjRzYS4E=;
        b=cytUzdMW0BLz2ixCW4k5bqXgIvpvdsg2dP9JvpTZ4gC3RsUQotxT47ILKfuVczq+L4
         0bLk3/dMdswQnc4KOVO5N45PnA5kX/JlzetNXPzHZ+G9lO3rbTIVFyYmouPTuPpaAolr
         imx4qlQKPgMDO0DL6nsGbTf5KApF8fqcp9H5toolSS+irZmfcNi9kjXmR4mRRpq7A91+
         KxtnS0jeYeXEFn1Iu1ZOiBQzFB8bMzCFp+4ILZ+71ttJeD4UW+uWsO0XLwZYKqLH0nEb
         As0EAdUVA5GgfI9ZbwMRBvvAVwUl+nPi3LYJpwIYk7ySuFL16OU1Raa2rQixEuBa2Mjp
         5yBw==
X-Gm-Message-State: AOJu0YzJWMFQbvpZHKsMJza05vrGIikC956MOw6y7Xc+Q6tLDTgmj8IH
	4lxqp34YLRk3u6zi5uGR/nSBcQ==
X-Google-Smtp-Source: 
 AGHT+IHc+KIlPROAh1yE20iteSRYjcUQXrs0OvVtxTfoLJCAI1Cr/o8PJizOqvstNyNzlNZK438+fQ==
X-Received: by 2002:a2e:3802:0:b0:2b6:decf:5cbd with SMTP id
 f2-20020a2e3802000000b002b6decf5cbdmr3339728lja.36.1692563539609;
        Sun, 20 Aug 2023 13:32:19 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 ga10-20020a170906b84a00b00992b2c55c67sm5198948ejb.156.2023.08.20.13.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 13:32:19 -0700 (PDT)
Message-ID: <f5b16676-04b9-7864-ffa7-1c48f3c2ca9c@linaro.org>
Date: Sun, 20 Aug 2023 22:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230820175655.206723-1-aford173@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230820175655.206723-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VLQMQ464VSUWK3VLZC6JWUKPRIJ232LP
X-Message-ID-Hash: VLQMQ464VSUWK3VLZC6JWUKPRIJ232LP
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLQMQ464VSUWK3VLZC6JWUKPRIJ232LP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/08/2023 19:56, Adam Ford wrote:
> The i.MX8MP appears to have the same easrc support as the Nano, so
> add imx8mp as an option with a fallback to imx8mn.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> index bdde68a1059c..2d53b3b10f2c 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> @@ -14,7 +14,11 @@ properties:
>      pattern: "^easrc@.*"
>  
>    compatible:
> -    const: fsl,imx8mn-easrc
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx8mp-easrc
> +          - const: fsl,imx8mn-easrc

You need here also const for fsl,imx8mn-easrc, otherwise you do not
allow it alone. Test it for fsl,imx8mn-easrc DTS - you will notice warnings.

Best regards,
Krzysztof

