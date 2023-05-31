Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE371775C
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 08:58:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A294207;
	Wed, 31 May 2023 08:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A294207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685516304;
	bh=tIitTh7T6GMC32MoyTW5sUjvl6nwdrBlmcYWLHLDIf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G6qmBjP05CqkDnhWjuHxjdYkzfvgpZRSyt173zIs8LKXcWBf+FL7QYn1aF73//pH9
	 5pCYqAMJ0x6Xx0rM80kJmC6XrzWCjzTcB56tUl/T38ZAjEjqDXKy5+ZRESmCwWsXlR
	 QJ7U4INrv8SJolxIvmQ9cJ2p/b1ly3XV7Y/GzuPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEDEFF804FC; Wed, 31 May 2023 08:57:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F411F8026A;
	Wed, 31 May 2023 08:57:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02F28F8042F; Wed, 31 May 2023 08:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5D0FF80086
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 08:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5D0FF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fMFgfFRH
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5149e65c218so5206997a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 30 May 2023 23:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685516232; x=1688108232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zT4hWvO+05+c9BNBT9jLKJhOVWpxKJ0fJ2bZlxyHp3w=;
        b=fMFgfFRH2oKpRqT2ngwoG7OVNjzftGze+7bCsyKX8BPD9bFqofDMAUVPCoEnQHK7YZ
         P9GIyQhfD38i4+ZCGDARXcEYm6X5cRIC4tL5T+qbNbkgeShDMzkTLWzr9oYDt0+f+JWl
         lHzDF1iYCMCPrdpof6K5qUxlFGUwcFYF/GLZO65/NMu6OKwhNzWz1cd/d8wdE+j3pUOz
         lMePApuIuf6d/zdItcp1XEsmzrxB6T6pgzjGopOR1xlFS+ZkuKGA7bsqaJpY4Q6LL23f
         uvstk79rsZFVpgFpPX5fCbzRB2qe6jaDE4E+ZywGX9/CsaInpvUDHcLgwfmb322vcwZg
         ruCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685516232; x=1688108232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zT4hWvO+05+c9BNBT9jLKJhOVWpxKJ0fJ2bZlxyHp3w=;
        b=Qycfyt5xWUNeE++M5HaWBEmrxRd6ltXdHqDw2QxfZdx7NmsFIHToCKqnZejs5TndpT
         ZY0SMq3uEcsif6K+UsWuvICXc8aa6wfLfG6IpYPFsxBFubEIl51ZLnhx+j58LJYMsfXf
         xonOLS16MjvpVH/8oUmKilAGMu9T+m0UZ1WkqwqTvRDuXFXC5qupLGo+jQeE4F4Jkoy6
         9q6JeopDWv4tT9+YsMpGyqs4JdVRUW2XqrGAwzIlKZ5JKIRZDeirw4JpQ/Vm360eWTN/
         my7z5u7DKVYIYRt+4KP7V1GJFvIV364sZjsdyTH5H3ok0fnb3YqjbGSYo8C5WJMn4sp8
         q+cw==
X-Gm-Message-State: AC+VfDyo36LcfXq+PwCuwfuLf9jDnBeYTsJqraP/4IHbTY28QjB61Mdd
	x1fjiVybUpzDJ26zVbo/p9scMA==
X-Google-Smtp-Source: 
 ACHHUZ5x5SACtt0xW0b6cmpAiNLg6lb938Dymx8uZU0YcrSBw25hfhVk5P/RfqzyOE7B6a2bNngPfw==
X-Received: by 2002:aa7:d591:0:b0:514:c43e:3881 with SMTP id
 r17-20020aa7d591000000b00514c43e3881mr277960edq.35.1685516232672;
        Tue, 30 May 2023 23:57:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 h23-20020aa7c617000000b005147503a238sm5308899edq.17.2023.05.30.23.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 23:57:12 -0700 (PDT)
Message-ID: <367c3d26-b406-9ddc-e0ca-717994ed1c4a@linaro.org>
Date: Wed, 31 May 2023 08:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/7] dt-bindings: restrict node name suffixes
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Dipen Patel <dipenp@nvidia.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Dilip Kota <eswara.kota@linux.intel.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, timestamp@lists.linux.dev,
 linux-watchdog@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530-banister-luxurious-d33a5d289749@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530-banister-luxurious-d33a5d289749@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6T6D4PZHHFG2V4TRAPYUJPBI37LDZ5GX
X-Message-ID-Hash: 6T6D4PZHHFG2V4TRAPYUJPBI37LDZ5GX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6T6D4PZHHFG2V4TRAPYUJPBI37LDZ5GX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/05/2023 19:11, Conor Dooley wrote:
> On Tue, May 30, 2023 at 04:48:44PM +0200, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Tree-wide cleanup of DTS node name suffixes "-N", e.g. "pwm-5", so we allow
>> only decimal numbers.  In few cases narrow the pattern to also disallow
>> multiple suffixes, e.g. "pwm-5-5".
> 
> I figure there'll be quite a bit of stuff to fix up afterwards?
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Quick grep shown zero fixes needed.

Best regards,
Krzysztof

