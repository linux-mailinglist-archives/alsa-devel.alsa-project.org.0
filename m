Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E24566585E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 10:59:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C2DCE424;
	Wed, 11 Jan 2023 10:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C2DCE424
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673431155;
	bh=OyxXEQ0imQPB2cFRQnFLA0MEm9sui8GV2YOvy14k4v8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Brpie6bhujoyofWqUTX0hBIVSd7ghlGq2004OWyM/kzm/MCy0WY8kEf8c/leOVTlM
	 ryJ5FCqy1jARh8LDd4ZteFQdUhBdwnL+e4Y89uZCJKUWiIcxeNbQrl0ckRECkdrJH3
	 hT0t4L+R2xXELqzqRmWrOzjzCAbWehi/D06JIjvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F72CF80425;
	Wed, 11 Jan 2023 10:58:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36B59F803DC; Wed, 11 Jan 2023 10:58:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D8C9F8026A
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 10:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D8C9F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RNHLAM9U
Received: by mail-wr1-x42d.google.com with SMTP id e3so5256288wru.13
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 01:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3CHpIDH1rMG1Owv5eVtyw16nuH+y+qhna5O7yLLSeRw=;
 b=RNHLAM9UMNWjzNdMdG9Xyke7V2tvwiaMWk2yetrWIWk9PiP/TiIgBaI7hQJ48yicT4
 ikwmc6VkZcZmcvmInImlhlTcbzYAdTtI0ONi7CsZfA/3YVmrSVuC6Lj5FmVYzx9abd2z
 IbpjEW7Fe0Um491Fc2PgQwnUgaK8c+u/gHBtfSORSP1rSCb8HbiQY7ZgqFvK7jTK/1vr
 MUHsO9KB+uPJQItW/4BEcTne3K4I6ZuK1oa8sfXQzHAlwRaT5w5ilr97DBqfJD9cgewo
 NWUgqy4lD4+ZXvkI/W53F2X28SAzkNK4d/r/0BXXP4t3zVLrdhBmcLjZf3NySRS0ECLc
 PHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3CHpIDH1rMG1Owv5eVtyw16nuH+y+qhna5O7yLLSeRw=;
 b=5I/LnimT2Sv01bSyKuCjWEcGWrxVqJLnbaVjhcN6/DbgKyihG7K3hKqViuKTTqsMR+
 JWcLqPr+ZcTSMJaaUzNuGPJoWrT8v5xMAvbLYJI26503x/t0PX182mJ8O58+NhMub+/H
 /sywarJOHoiTfGe4TOVVzgbNkzxhyNdK9luOA6ZGGBQUcoYB+tOMwJLAZSK/NUz10ckb
 bu+ooDXOCFgsso0HrGvtmpv8xXffhdKPwRAWRyjqgf6L4b2E+ik3Tqko2UryI2FwCg+q
 ZgNJK/if/8KYNKVi2FG/oqpUduCtj78gL8fPyG5lDyw9aMBfBw8Qx99mQgI+oEFl/ZL7
 GXhg==
X-Gm-Message-State: AFqh2ko06ryJ1h1wVVcduEb6o9+8zGMrHw9btqYsbyf3X38Yero3dPS4
 MpWjxOaYq9IJ5raqPnJHk99tMA==
X-Google-Smtp-Source: AMrXdXvOO92JdADUb6pK4nZXTuSXDpapYvVg5c/tyfJN2x9QXp+QTXqy7lCQx9L1qO0ZWPHWZu3bXw==
X-Received: by 2002:adf:fb88:0:b0:242:1809:7e17 with SMTP id
 a8-20020adffb88000000b0024218097e17mr40370295wrr.6.1673431094509; 
 Wed, 11 Jan 2023 01:58:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm3053607wrm.78.2023.01.11.01.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:58:14 -0800 (PST)
Message-ID: <1dfade07-f8c4-2e16-00dc-c7d183708259@linaro.org>
Date: Wed, 11 Jan 2023 10:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 08/10] dt-bindings: sound: Add support for QMC audio
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-9-herve.codina@bootlin.com>
 <c393e532-d466-366b-a390-65de47c58b6a@linaro.org>
 <20230110090728.2024b5eb@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110090728.2024b5eb@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10/01/2023 09:07, Herve Codina wrote:
>>> +      qmc-chan:  
>>
>> Missing vendor prefix.
> 
> Will be changed to 'fsl,qmc-chan'
> 
>>
>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array  
>>
>> Why this is not a phandle?
> 
> I have try '$ref: /schemas/types.yaml#/definitions/phandle'
> 
> I have an error from make dt_binding_check: 
>   dai@16:fsl,qmc-chan:0: [4294967295, 16] is too long
> 
> I need a phandle with an argument ie <&qmc 16>.
> Is there an alternative to phandle-array to handle this case ?

OK, then you need items like here:
https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42


Best regards,
Krzysztof

