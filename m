Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F348D734C05
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 09:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EC6782C;
	Mon, 19 Jun 2023 09:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EC6782C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687158119;
	bh=NGtzCLdGtQTvdOT0zy/EjKAA5NPZbD6d75qvTQjSXyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N1CdSKjI3IdMCK7Yr4b3C/uedoh1U1mdlKnI8TYoQRFu3HcYFIiSIGrOb8sZ6+2Jk
	 w7NRa+ZcCimYrYcyY+9b9sQdlfKpadqrI4e69QafqlBeER0KlHYXtO4iYD1TRt9ok/
	 4/BzzxCUDhvNRJqIPw8XIy/mP54rmzwAcJzegIeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07481F80544; Mon, 19 Jun 2023 09:01:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B931DF80132;
	Mon, 19 Jun 2023 09:00:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47D5AF80217; Mon, 19 Jun 2023 09:00:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E88C2F800E5
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 09:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E88C2F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gRNXmtBt
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso440745366b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687158037; x=1689750037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMrqhOmlYjr3CsiKOPMApGZVFUdNvXXzMH8RRQR9SBo=;
        b=gRNXmtBtp53/JI1qbjCmW/EGDGt/iMPRvcxCm+fL38zqAjrb8riGH6SdDR8ZFXh8+s
         +g9KmmTgErl4NyhYnvAJ226EPktiSPSNPH7DgA7kF3zHw/4mYC/6TQzgP1Xg8FLKtkkD
         CmIj6nnjemehAP5fQhc26wYEzk+3X+5wS5D2qokJe4LU4XJ9go+craozn7QkmOur458L
         pKkVcsO2B6m7Ojk8m+pldwODYC9bdtqPhe1Q1AzT7Pn6IMCqvQxTlD9wONR3f/NJh755
         YyYBEAbG3xw+wjm+Vr1yFatM+lXblh+gTB4hbpQwVDZMtEo0guLFiV35VtZczPcmNRi5
         zO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687158037; x=1689750037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMrqhOmlYjr3CsiKOPMApGZVFUdNvXXzMH8RRQR9SBo=;
        b=fE0kc78RPtzz2NvGDaqV3ix1h8I4v+yYwAWigICpKveKg7tBDa4Kcc6kbl0V8NjJd2
         DcZiDs34ihoTiToALwDPNaJUN6BX7QTWjXdGmYyzBvx7LGWwD958Nt79OIwka+fOTK36
         E62tjN4mE3DesZBG3kjj0aDeEj/M8QfPQ/TNBsSgWivBB7qZ/6bk+aVOfjEpFMaVcy1F
         qaXep11QJIHMQCCgy0DjNmZEFHOGmLDPykjGVAWyIWO+jt8m5sO1p7SlQ2P6pgRA0PVM
         R4V4fYI424YmAI1K34tl7zgAs50uzptsc8NEiF1S6mZW6fjK5/TXy8Ig9OqMca+6oncW
         hHbA==
X-Gm-Message-State: AC+VfDy7bcBg19+J+SCb6DBNgQZduaD7rDT0zXMuNVpZnlPBszAUkukZ
	U4lASQZv7XxEJEVvM4PKWsEbnQ==
X-Google-Smtp-Source: 
 ACHHUZ6AlPAXtrfg+1lhoD+C0v75gcko1YN92wwqTA01JUafHGUycqGUdXE3+R8QqBTqZqCD1FCjBg==
X-Received: by 2002:a17:907:7243:b0:986:3783:2949 with SMTP id
 ds3-20020a170907724300b0098637832949mr8506222ejc.52.1687158036982;
        Mon, 19 Jun 2023 00:00:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 n25-20020a05640206d900b0051a594b4eb2sm1103917edy.60.2023.06.19.00.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 00:00:36 -0700 (PDT)
Message-ID: <bd4da934-72b7-67f3-0c9c-c18d3af16e7d@linaro.org>
Date: Mon, 19 Jun 2023 09:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/3] ASoC: Add support for Loongson I2S controller
Content-Language: en-US
To: Yingkun Meng <mengyingkun@loongson.cn>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, broonie@kernel.org,
 lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
 Dan Carpenter <dan.carpenter@linaro.org>, Dan Carpenter <error27@gmail.com>,
 kernel-janitors@vger.kernel.org
References: <20230615122718.3412942-1-mengyingkun@loongson.cn>
 <cf2f3bc9-3141-8d7b-b57d-73eac70a21d2@oracle.com>
 <6901166d-387f-24de-6ffd-1c8eea724718@oracle.com>
 <325dd825-6fa5-0ebc-4b7e-7acf2d2840e4@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <325dd825-6fa5-0ebc-4b7e-7acf2d2840e4@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QDTJJTIMY7D6SJEEQISDRINNQTLDVIV5
X-Message-ID-Hash: QDTJJTIMY7D6SJEEQISDRINNQTLDVIV5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDTJJTIMY7D6SJEEQISDRINNQTLDVIV5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19/06/2023 03:45, Yingkun Meng wrote:
>>>> +    tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
>>>
>>> Smatch detects that tx_data->irq and rx_data->irq are of type 
>>> u32(unsigned) so they can never be negative.
>>>
>>>> +    if (tx_data->irq < 0) {
>>>              ^^^^^^^^ This can never be true.
>>>
>>> Should irq be of type 'int' instead?
>>>
>>>> +        dev_err(&pdev->dev, "dma tx irq invalid\n");
>>>> +        return tx_data->irq;
>>>> +    }
>>>> +
>>>> +    rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
>>>> +    if (rx_data->irq < 0) {
>>>              ^^^ Same problem here.
>>>
>>> Should irq
>>
>> Should 'irq' be of type int instead?
>>
>> As fwnode_irq_get_byname() returns a integer.
>>
> Yes, you are right. I will add a patch to fix the type of 'irq' to int.

Run smatch and sparse on your code before posting. It would find such
trivial mistakes.

Best regards,
Krzysztof

