Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C98579825
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 13:05:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5470916D9;
	Tue, 19 Jul 2022 13:05:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5470916D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658228755;
	bh=IbqsdSjWATKN+YNE/+Qb/CMCqHoCdth+9xUa4POZgNk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdnZ/LEst92AUv9PKfAjLsdlbbFUP/7oJ0n+T3jH6/OFNXMVrStYZ8+eqHUs4Omg3
	 vJfZxBtyxue5fcwrdar5O2wJGmkzjyBK26B+Mj8JFUgd/KHJja2bIIkoG84t+/EyD6
	 w3177XuGKeyEKf2+4sv5wWqAClWQzrLktcMxswCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C431FF8016D;
	Tue, 19 Jul 2022 13:05:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16875F8028B; Tue, 19 Jul 2022 13:05:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70A26F80224
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 13:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70A26F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s3SRJ6/k"
Received: by mail-lj1-x229.google.com with SMTP id 19so16967971ljz.4
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 04:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EX19RpTLgpzKcCJO8mDxPYr2eZCUlJJYLs40GJ/aDtE=;
 b=s3SRJ6/kPB9R99UVkk665l3uCz1jjAO4bxRMm6Mp1nfnXdVeb6zW6map6ov6BrtRCZ
 clj/jGjEay1UIEB1sXQgCKGLyOAFolccLC8dyjBzdoS8q5v0O9fmM6h2cdkLj/hvtpLt
 MrAHDSxWRVUBZwwnJ7sQCrnJSdNvMmu2xV89kRvtGFq+IZ9Q6uYqmOBRJ4d1WUQkkYPP
 WSBkkv8JHfyf0O887nmYU9G7zbMBaymD9ajnX6OprjEJi2PnNfVqr19PijTrcfPx0qcU
 PxeQ68n7NpjWOpI56FSSX04lOw9L8TZk+CuySjX3CbQY+BZrIQLkrXt8AWwhEphwa90R
 ti6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EX19RpTLgpzKcCJO8mDxPYr2eZCUlJJYLs40GJ/aDtE=;
 b=E4EEb3xRMBSupQoVJR9WXvw1nHRL+yOwYMHBez3zwQv/O4HfBEjKtFr0QUL3TK1A4P
 H5CZFmWdzAaDADOliS+DKbD/DecIcV7QYQu98FjhUlZ82QkhgzbCO7smQPzetZbmUO3+
 MK2I6PTNFKSS9zBDp9rtSqof85HXxbbRTp6q11RTU6IdqysnGd2gKyEUaGk/URaWp1+A
 w7TjhwTab6uiUV3CIZJfeJybc1J4Bp+uL01rWlluUR3W9sKURQPWvQQaV2ajWAGLzHe/
 2CwyKLIwzanunS+yOxJolzUudd8VRq5JFt+1t8OJvF7rQcLKPCacBw9apiZu0UVW+Jk0
 xzog==
X-Gm-Message-State: AJIora+Nge+MMLXQxe814VT8ECFPygc2xdeCF612oWBMzac9eqhPnHD/
 oq4VC0FmrBS5XYnifQqqzrBDPg==
X-Google-Smtp-Source: AGRyM1t1ByyKQvuvfe41Tkvj/zYbbhsK14gV6ydWq1VeAlZ4j7rEjFY23wSBgIriw+qgh2nbPfxQnA==
X-Received: by 2002:a2e:a490:0:b0:25d:7609:1fbf with SMTP id
 h16-20020a2ea490000000b0025d76091fbfmr14767979lji.432.1658228692354; 
 Tue, 19 Jul 2022 04:04:52 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 c3-20020a2ebf03000000b0025dabcba63csm1659273ljr.17.2022.07.19.04.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 04:04:51 -0700 (PDT)
Message-ID: <13fd6d44-c645-0935-9fc6-aeebcb96b9cf@linaro.org>
Date: Tue, 19 Jul 2022 13:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: atmel-classd: PDMIC convert to
 json-schema
Content-Language: en-US
To: Ryan.Wanner@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com
References: <20220715162922.660859-1-Ryan.Wanner@microchip.com>
 <20220715162922.660859-3-Ryan.Wanner@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220715162922.660859-3-Ryan.Wanner@microchip.com>
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
> Convert Atmel PDMIC devicetree binding to json-schema.
> Change file naming to match json-schema naming.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
> v1 -> v2:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
