Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16073DE0C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:47:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835EC1507;
	Mon, 26 Jun 2023 13:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835EC1507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780066;
	bh=EB3sH4aygfzKgkxQn+Hddb8TJGsHlWFfuruIP2mkinc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jgjl14krhhZnisKW0qob1mz8EGG9vZ9bGu+1qVHPVFyXzmVA+Db97nLwjfoQR114J
	 TIPeMkK95aRHCzmAaGLN19GmNIizvmAXE0w/D5zyz0A5m4q8nrB7T38ICI3YDP0+de
	 3dMZpYAaB7H9DbYwRNRebVL9Iv3IQnvJHeMIZO0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1CE4F80603; Mon, 26 Jun 2023 13:43:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E475EF80601;
	Mon, 26 Jun 2023 13:43:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6336AF80141; Sat, 24 Jun 2023 11:20:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1712F80124
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 11:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1712F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yQVzjTKS
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-988883b0d8fso186929166b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687598396; x=1690190396;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfAcGT4J8pUoMJBGxBaLszgHGiS6c9l8JOpUoHeAAOA=;
        b=yQVzjTKSXVmVV9dLLVhjlfW4hSkCHaHSkFp8XKDuppCzQpGHvyVttjnWT3sZWadL6G
         Aptg8K8aHU9euO2VsKWw8w5GNb7iZUmQN6s980dsKNw8bDt/Gg0mjyG+1qbTOWHueIrY
         /Q6bxSUkrx10KI9Bk3ImA6gPyy5RwRLI1IVUQjGo73WdFwY+k9WU2qYNImsGMRH4LVBY
         NGoLGDAz09o/yosqduTlRt/bCpwDw40AnKJvyTtb5EsV6kYLtwXhkQO6myiWdEiHilCp
         eezk0kHCVcUBB/e4mc1VfkMXxJnPCuve2SWX/BdtYwhjQIOCgvko85iNcFXLb/8ecU/N
         rm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687598396; x=1690190396;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfAcGT4J8pUoMJBGxBaLszgHGiS6c9l8JOpUoHeAAOA=;
        b=laxRnN2BtKLjW32WQie4TMXwG+3diEmQNgg7btUMc/8GZuKe9X14QUdN1Y14x66C3e
         Yw0MHM3i8GFh349tg1UJYlj0ngP55CzhaAAcNQl2CzQ0/3WRnAp11qMTWABk2xna9tuG
         7nWDjqnreDFzEkTlp0WhyNJH8s3ZBFXADX1Lw8W1Amoi3chr05NFzfMxCXYgUjTnX8VA
         ng+jIfLsJUa4fE0yviopIXv4R2vdKDzS/+ORvTpx+A0pbHz3ahx9BYDaz7Fdz9TWsuEf
         VKbJEfPb72LLtaPvb6LjwYX0y4U0FL9SlObRXC8i2P3sIg5OdBGN6DzmE9GBShwnctAk
         y1Ig==
X-Gm-Message-State: AC+VfDwwh8fOW3rJfJ7hNnKvLB0iYNExHVrtV2Vu1XBJJCB2sn+PTO7k
	yZBDbIGVIAcTPCWwFBqdO8j+VA==
X-Google-Smtp-Source: 
 ACHHUZ5fG8f481PX14S7vktzFZQMA1l6HoKP1yysFPHfBvGgcLJOb2TMBp2polua7/w5jYwHHssrXQ==
X-Received: by 2002:a17:907:987:b0:987:6372:c31f with SMTP id
 bf7-20020a170907098700b009876372c31fmr16230436ejc.37.1687598396633;
        Sat, 24 Jun 2023 02:19:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 p13-20020a1709060e8d00b00989065149d0sm663324ejf.86.2023.06.24.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:19:55 -0700 (PDT)
Message-ID: <ca3b6a75-2811-6013-28cc-9f6a7854b469@linaro.org>
Date: Sat, 24 Jun 2023 11:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/45] dt-bindings: microchip: atmel,at91rm9200-tcb:
 add sam9x60, sam9x7 compatible
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, sre@kernel.org,
 jerry.ray@microchip.com, horatiu.vultur@microchip.com,
 durai.manickamkr@microchip.com, andrew@lunn.ch, alain.volmat@foss.st.com,
 neil.armstrong@linaro.org, mihai.sain@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-2-varshini.rajendran@microchip.com>
 <074048a2-5153-e013-3562-b5cad2ba0954@linaro.org>
In-Reply-To: <074048a2-5153-e013-3562-b5cad2ba0954@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 2XNKINURC43IODQZ6Z3WNQLDPCA3FSFZ
X-Message-ID-Hash: 2XNKINURC43IODQZ6Z3WNQLDPCA3FSFZ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XNKINURC43IODQZ6Z3WNQLDPCA3FSFZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/06/2023 09:53, Krzysztof Kozlowski wrote:
> On 23/06/2023 22:30, Varshini Rajendran wrote:
>> Add sam9x60, sam9x7 compatible string support in the schema file.
>>
>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>> ---
>>  .../devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml | 
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Un-acked. Actually NAK.

This does not match your DTS. Please test your patches before sending.

Best regards,
Krzysztof

