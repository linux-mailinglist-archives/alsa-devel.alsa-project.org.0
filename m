Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BA373DDE7
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D670EC0;
	Mon, 26 Jun 2023 13:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D670EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779634;
	bh=sNg3DtCi3hYXw8K4WBBqWRjhit6ijE3zPSZBpOLFmbA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sx4cVc8Xo1hzL2TTbotnWVZP0HJOc4mVeLOAutJv6Rzhk6bB31x5SEAc/U36ee2VQ
	 bAa47F/e2kGiqNFyiamSJd1s1G0TG0bEjYcq37TpwXq0hTe3iq6RIRx9ZoJMz6/ij+
	 PJ5WcoBDNs6XcNKJS+msvZ69+065ybCTJIKkBhbc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DBEFF8080A; Mon, 26 Jun 2023 13:29:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A577F807DC;
	Mon, 26 Jun 2023 13:29:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50449F80141; Sat, 24 Jun 2023 10:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1795BF80124
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1795BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LX7W+yoL
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b4769a2ee5so22879731fa.3
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593731; x=1690185731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48cLWxnO4hI8zObsw227oEYYKk0Y5PALRubNPuDO6vc=;
        b=LX7W+yoLVPlIwV1XGxBXwL2aJbtTMbGUVQFZjuzrXh0wV6QHjP/6CddCD/E2flMRhT
         vztsT0AxCVeYXrgCMazYCdwatn1oodAQYgEbYryOhgT9SawgGTiTsh+csgQdP6kNUyxe
         7+u8BPExqHZ7ZFyAJTcps4WTaIR9QoQUvOV8w9bGMoxE+6/N2/+adQYLXS0sGTiNN0KJ
         gcAcX+MzinSjOAga9K0bDpv84dH0l28yQim8n3ipOwgzwqkd/hgTSXelx4MOAJGDwm1c
         nahyrk+ER/vkBjbl1S6GBta/vg4KMt2zZaWLKqwbibfr91+e82MBHrvqwzlM62GfwzTs
         ebBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593731; x=1690185731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48cLWxnO4hI8zObsw227oEYYKk0Y5PALRubNPuDO6vc=;
        b=R2zanYJQTDHU9uA8ixmHZliwt6A9ndj+VCUWP2vQwBMVILn0C2zXCAyoDdodhiAVDq
         G37V4fPHTLuMcXbkRamHwAM14501uMVurh7reHlpejTIuI1BUm5upDr7aIVDAkWGFgsG
         0sLeaESGpNTBZ4q44+Fk1BpeDrF7nUBoJ9RQKfP025B3SB9wtBoQHtSpBRVwGkTu0cUI
         Y4MG8QUP+9IaOBAE8YCAA5f6jE9A3iYyywmlCWg3+xhyDNpJxXC9cQYv6tCmVyqWvnAx
         5k/gD9Pt+rslKf+8whWtDiIvOqWXr2/ltPw3PkmKTv20tHYcVORK8UcgZ4P2UOlRGoMg
         VrVg==
X-Gm-Message-State: AC+VfDzwQ98yR2gd1XKvuM0DbeHe728tgnxHu76Z7HR/fKnA0iqy5kG2
	4PRYWBQxTM/e9KbLigrBkmiytw==
X-Google-Smtp-Source: 
 ACHHUZ62t6tmUqM8Yzti6qrq+RSBqmnbfIcQEwHs80C3q6C7j1x32A4aVswUaxA77ONO0Q35Bn2RsQ==
X-Received: by 2002:a2e:a0d8:0:b0:2b5:7f93:b3ad with SMTP id
 f24-20020a2ea0d8000000b002b57f93b3admr8673190ljm.16.1687593730934;
        Sat, 24 Jun 2023 01:02:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 dv9-20020a170906b80900b00982a077599fsm590940ejb.110.2023.06.24.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:10 -0700 (PDT)
Message-ID: <91773b0f-b337-c5d2-68e9-4d240920f659@linaro.org>
Date: Sat, 24 Jun 2023 10:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 29/45] dt-bindings: rtt: at91rm9260: add sam9x7
 compatible
Content-Language: en-US
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
 <20230623203056.689705-30-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-30-varshini.rajendran@microchip.com>
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
Message-ID-Hash: G2WGW2JGBLFJY4Z2I3ZKGV3O2M3MLHUL
X-Message-ID-Hash: G2WGW2JGBLFJY4Z2I3ZKGV3O2M3MLHUL
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2WGW2JGBLFJY4Z2I3ZKGV3O2M3MLHUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add compatible for SAM9X7 RTT.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> index b80b85c394ac..2d5cce1c1331 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> @@ -20,6 +20,7 @@ properties:
>            - const: atmel,at91sam9260-rtt
>        - items:
>            - const: microchip,sam9x60-rtt
> +          - const: microchip,sam9x7-rtt
>            - const: atmel,at91sam9260-rtt

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.

Best regards,
Krzysztof

