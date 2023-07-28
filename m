Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA59769198
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:23:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F07FAE8;
	Mon, 31 Jul 2023 11:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F07FAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795417;
	bh=gkPgQGZ+s7FkIex+JFK4GeRD2LKXXIwWVjiBHY0XeUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l8r/VdhWDi49LOoP1MUOHDYv5u+fX55GQYOm9OgCp7kS9DYPtcJFg4EpytRPCMhv5
	 /MHmkc/6uVijxVjk/uDcUvhSsUVWAr9uIfS/lZ0l5jKOnTus5HWtvXVoIsQyVVluOw
	 AgFnbfCcmiXBhVagwrSjKWCh+ma8eKKLGyaCr6m8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18AFFF80639; Mon, 31 Jul 2023 11:18:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D44E2F80639;
	Mon, 31 Jul 2023 11:18:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D40EF8019B; Fri, 28 Jul 2023 18:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 223B7F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 18:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 223B7F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WXsUGfp3
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-317715ec496so2401600f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690562215; x=1691167015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kv1vn8i10uKiVGMZqWV0hp2dp0U/OH8nWn1xPOKpe2E=;
        b=WXsUGfp3JibzzSWaJLOYRCf5x8xXWgYZKzFIf69dgVy9YK8C4NDwHyEDFZXz5w3U4v
         QQOs8VR3xBCFtRC9Uc3C7jDtHbHf/TVcDQbt3KNBbvC3KguUj++OBRSmosar1TXhCfCO
         cgVRNgC2CqwGVozxV9BCvuohUn46t+dccFpMTd9ejv8OKqQcVDJDj14Xf7r2EkIsfxZ5
         ogiBvgZjEDgqBJiNCt+R3MZB3dOH5vA6Wa4t08ltVHwtTVkpajcfwR8vctgSe4BB19fI
         6WAvtCklIkG3U/TnlOkzeYCurxGOclz0CiZwVtqU4t3uUZ/xLeZzpgcwN0UIfUeqn7Sx
         T+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690562215; x=1691167015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kv1vn8i10uKiVGMZqWV0hp2dp0U/OH8nWn1xPOKpe2E=;
        b=i/ghhe4dD52PLbOKwanbU0DmRCKUX7+PU2CHgdmHkzu6DoCVlAvRG68+hvlKMkPklR
         rVYR0MD5Nf6IXQUiC+uaB6bFSFhEVdFHjr08zdRippMMcncdXHPDVrPDh1DGW8jCSV62
         o7LF6/AzsLIOzzZrJWg1MZxTs9/i5GfZ3Kk3zqi3nWcVnCitK5EtYssvp9WyxlZGKebD
         ZthBkxU9C58CuzRGv6k4yCAPAF7q+RvQLm/71W5E7fksjZ6U2KyhzQSTDxXjjdjnalDR
         Y6Wl0aSOKt8yGZA7UrCOAV+gRO2AudT0KLdDopqEdNBlRHwWeIQ88MNpx52YjMuqpdEz
         vY3w==
X-Gm-Message-State: ABy/qLZgTRENYbGLxlPB5fEdgb4TFpwYE98wNXges5SpQB5m+YO+PRSr
	jKUBhVrO29sml0lyS43Ij2hfyw==
X-Google-Smtp-Source: 
 APBJJlFtwmVxo8pxiclcUgLI8fwOIzC/1t6avYTLDMrZvATE9p+eFs+1MvU7kydx7xR6YX3cFZ69Tg==
X-Received: by 2002:a05:6000:11:b0:317:5de3:86fb with SMTP id
 h17-20020a056000001100b003175de386fbmr2171475wrx.10.1690562214762;
        Fri, 28 Jul 2023 09:36:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 p9-20020a5d48c9000000b0031433443265sm5235215wrs.53.2023.07.28.09.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 09:36:54 -0700 (PDT)
Message-ID: <30943376-f895-2eb9-1b00-55ce56f51742@linaro.org>
Date: Fri, 28 Jul 2023 18:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 andi.shyti@kernel.org, tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
 ulf.hansson@linaro.org, tudor.ambarus@linaro.org, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, sre@kernel.org, p.zabel@pengutronix.de,
 olivia@selenic.com, a.zummo@towertech.it, radu_nicolae.pirea@upb.ro,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
 linux@armlinux.org.uk, durai.manickamkr@microchip.com, andrew@lunn.ch,
 jerry.ray@microchip.com, andre.przywara@arm.com, mani@kernel.org,
 alexandre.torgue@st.com, gregory.clement@bootlin.com, arnd@arndb.de,
 rientjes@google.com, deller@gmx.de, 42.hyeyoo@gmail.com, vbabka@suse.cz,
 mripard@kernel.org, mihai.sain@microchip.com,
 codrin.ciubotariu@microchip.com, eugen.hristev@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
 <c0792cfd-db4f-7153-0775-824912277908@linaro.org>
 <20230728-floss-stark-889158f968ea@spud> <20230728180443.55363550@xps-13>
 <20230728-perfectly-online-499ba99ce421@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728-perfectly-online-499ba99ce421@spud>
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
Message-ID-Hash: BDVHUGTKOM5KTPJXHWCYBUVZVWM7F2IT
X-Message-ID-Hash: BDVHUGTKOM5KTPJXHWCYBUVZVWM7F2IT
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:18:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDVHUGTKOM5KTPJXHWCYBUVZVWM7F2IT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/07/2023 18:10, Conor Dooley wrote:
> On Fri, Jul 28, 2023 at 06:04:43PM +0200, Miquel Raynal wrote:
>> Hi Conor,
>>
>> conor@kernel.org wrote on Fri, 28 Jul 2023 16:50:24 +0100:
>>
>>> On Fri, Jul 28, 2023 at 01:32:12PM +0200, Krzysztof Kozlowski wrote:
>>>> On 28/07/2023 12:22, Varshini Rajendran wrote:  
>>>>> This patch series adds support for the new SoC family - sam9x7.
>>>>>  - The device tree, configs and drivers are added
>>>>>  - Clock driver for sam9x7 is added
>>>>>  - Support for basic peripherals is added
>>>>>  - Target board SAM9X75 Curiosity is added
>>>>>   
>>>>
>>>> Your threading is absolutely broken making it difficult to review and apply.  
>>>
>>> I had a chat with Varshini today, they were trying to avoid sending the
>>> patches to a massive CC list, but didn't set any in-reply-to header.
>>> For the next submission whole series could be sent to the binding &
>>> platform maintainers and the individual patches additionally to their
>>> respective lists/maintainers. Does that sound okay to you, or do you
>>> think it should be broken up?
>>
>> I usually prefer receiving the dt-bindings *and* the driver changes, so
>> I can give my feedback on the description side, as well as looking at
>> the implementation and see if that really matches what was discussed
>> with you :)
> 
> Right, that is what I was suggesting. Respective maintainers would get
> the drivers *and* bindings for their subsystems - IOW, each patch is
> sent to what get_maintainer.pl outputs for it.

For reviewers I find the easiest if this is mostly split per subsystem.
There were here few patches for USB, few clk etc, so these easily can be
separate patchsets. All the rest one-liners or one-patch-per-subsystem
could be grouped and set in one patchset, after fixing the threading.

But the moment the patchset grows to 50 it's time to re-think it whether
this grouping is necessary or even beneficial.

This is not a conversion of mach to DT (like ep93xx) which benefits of
doing everything in one step. Therefore my recommendation for this work
is to split it entirely per each subsystem.

Best regards,
Krzysztof

