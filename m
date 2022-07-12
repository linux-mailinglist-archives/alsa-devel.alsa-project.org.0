Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B36FB57142F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 10:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E370163C;
	Tue, 12 Jul 2022 10:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E370163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657613754;
	bh=XZctOCihLIMHTR8lEe5LmpRBWjuXkuyAQCPbN0pTzrE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tW8gH7RhFFRrQg016J2e54O0su4/UBSUzSVwB6dgBK3phSJwc/ul3yMXlNuuAqr+j
	 aiw0NFrR18GuNcQnZiFl5PrKLuZzyfQeTznE5Jvs9EBKFayPyhC8ze2oWu2hS6FpgK
	 cuEd5OArladwOd9zW/TDdUl7uJkhrruP7N5qS5lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 802C5F802DB;
	Tue, 12 Jul 2022 10:14:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6374F802DF; Tue, 12 Jul 2022 10:14:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C97DF802DF
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 10:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C97DF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XV6LgXVn"
Received: by mail-lf1-x134.google.com with SMTP id n18so10953677lfq.1
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NaYE0YC5oBomgL0PmclsweYRAytccspL/sTByqhvc7I=;
 b=XV6LgXVn8D1tK9kHTYiLURnyiM7aue61n6dT5mNZwp7VGrsl9wcAgZsiYjLgfVeYtY
 AN9vERoMbcUyuYjcRZpPAJPBVrFArEvQt+qd3TDJYQUsDH/Sj5GvbJub9fEv0f1lqfwO
 ogpEjwFHMT3pZlkjoanORhcX+rIHznRkm8Uf0V6plzlcV3t5mTF05LagSSv8Z3WSmI3h
 JU/MUe29p5qYV1wj+6rrfy37pGqEHkd+XkLPWHYwM2bZKTnCR0crQCkbOZvBZ7L5O2JI
 uNx1+XkNSrkXMtuBT3xD27F3T/qjIVbFwJXjeUYUPCI6q2OAu0DWZ7CJkwW0Bpt7rsN9
 pWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NaYE0YC5oBomgL0PmclsweYRAytccspL/sTByqhvc7I=;
 b=cRDVyDZIBA+ubbKARuH627ZjuPL2BCaprIFq/rXAhLHxH7L+IFUz/+KuxnfuiLJpM5
 U0qIBW+O5jMPQxQID1fGys3HJ/mj/FtQDVStiWABdQ6j0CaRoxmkI2pj3c/WEbhBRyji
 EHqoKqodEamoQsQd+AKkMjKQvi2VBSaIFYmkEXM6uLK9RXZWnQXvyJRERlvNwCdVXLOz
 RtNp15sKQfr2BfpGoXq937rqCIzElzPdNbu2hfUYNJs+DGcAEKpiRYeTJG4/u04v4gDv
 P3RnXdAF7UxHNaquNiSm4HDEkjW1Vk6qRGKbSRF//YscRipWDY3zLftCx9rZ/kmjv+Rt
 66Jw==
X-Gm-Message-State: AJIora8IV4jgLlkGhhoNJd18q7irQ9ILtK47jkUzYi3P70o1AS9heCa5
 Ri8W97JUvoItx3k/Dl6QhxIbGA==
X-Google-Smtp-Source: AGRyM1uTRuXVxUGxHjUXtpenfQ8xEOSmzLpVZr/APJjFs1AGo/9O39jOrEr1RmWyohWhys6FfXZczw==
X-Received: by 2002:a05:6512:c0f:b0:489:dc4c:55bd with SMTP id
 z15-20020a0565120c0f00b00489dc4c55bdmr6821749lfu.118.1657613687148; 
 Tue, 12 Jul 2022 01:14:47 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05651203a900b004790a4ce3e5sm2051670lfp.278.2022.07.12.01.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 01:14:46 -0700 (PDT)
Message-ID: <18103915-6ab5-cf23-c5c5-707864b3e049@linaro.org>
Date: Tue, 12 Jul 2022 10:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: atmel,classd: Convert to
 json-schema
Content-Language: en-US
To: Ryan.Wanner@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com
References: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
 <20220711183010.39123-2-Ryan.Wanner@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711183010.39123-2-Ryan.Wanner@microchip.com>
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

On 11/07/2022 20:30, Ryan.Wanner@microchip.com wrote:

One more:

> +
> +examples:
> +  - |
> +    #include <dt-bindings/dma/at91.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    classd: sound@fc048000 {
> +    	compatible = "atmel,sama5d2-classd";
> +    	reg = <0xfc048000 0x100>;
> +        interrupts = <59 IRQ_TYPE_LEVEL_HIGH 7>;

Wrong indentation. I asked about this in v1.


Best regards,
Krzysztof
