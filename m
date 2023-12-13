Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F0813302
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 15:24:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4AE8DFA;
	Thu, 14 Dec 2023 15:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4AE8DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702563887;
	bh=1vJYGEUu6FEdHqSKUkb2sEF37s3GzZ8qfJTlIp8RFfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ocuQmQGqqxWOEUrNwxGpgAU2r37vO7XYmBP/GPKldYfwB+nl5ThDvtTffFyRre/pN
	 J2tE34mdHItdvRndXCJh9RX8nftfOMh+o+Spxh2iebjFHX4H/s3DrG7lhUCHbx9oOH
	 +R1RtWuf+XKmY4Et8K4jv0JjaCSztteRrKLmKSjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E911CF80564; Thu, 14 Dec 2023 15:23:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D525BF8057D;
	Thu, 14 Dec 2023 15:23:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F10ABF8016A; Wed, 13 Dec 2023 21:29:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0905F800D2
	for <alsa-devel@alsa-project.org>; Wed, 13 Dec 2023 21:29:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0905F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R4fDwHjc
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c1e3ea2f2so72485605e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Dec 2023 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702499388; x=1703104188;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zw2AbkoN/4FIKkUWexE+EWqV2AcpdmgqKqjwrsLePhs=;
        b=R4fDwHjcizYBv1EQLVArLZxeY0mFmnz2Y7JAKNmwVfFUJ+XuwIPSZKOZOoE4t9dkBd
         rU6IPzUxTrj4rzKBcVCUJaHuQq3aM2/2V8JPiZtRqkv1CGSZeb9gF5JPypPMHz2AnpFG
         TJXiUgikRoTbcx70irM+6FoVV01epKeLuhB19bmiI4e2y6sIk8LC23PwRRSoBVVvFGY8
         SELeKWzyW6R4AVmCuHOOsuYUtGMzMT0GfNOc2yMvc64AZ+XY6uE63az2f1XvYUIXoiOZ
         j5YVKIWuuq1NWTJogU619hoidFQbXNHgD4P5y9N7ZO20NrHTy+D0Di7rMqtB+L4BkAw4
         xXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499388; x=1703104188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zw2AbkoN/4FIKkUWexE+EWqV2AcpdmgqKqjwrsLePhs=;
        b=n52opHI8y9TLI7ORRVbXhZ0C5/bG1LItKvm2Tk3D9pgTQkwUd6Fcf4yD0bgoA3ARG3
         mFpeW9UBfGxz0JBUwsAP6B6CYr5i74oxuVubjQXiR/rr7Web/1oPVU2xKcOVB2ms81ke
         RB4mV3ivW1VYwBD1ZMZeluQiSxUlpvYLFHc+3ff3frbwq4kLMTDE4D5UK2Z5NoO/aLs0
         LxUq2mrP8+uHuZAsgcKH/vNu489p67V1wDx9pz6PmZl9lMqZShC2+8vr5re8jM+udHNq
         8GCaRZJCG/4Spl8auO11MXXhV7EtjygN+FggxWnbtjoKdgnvk9l0MRVH3/2rddAxSS54
         SeZw==
X-Gm-Message-State: AOJu0Yw3njer0EFqEbffK4amlp4zn5D55r58NiVtJdMEz7kOriVlCSi5
	z9iUspWA7hyWSOqHBxy2Cw==
X-Google-Smtp-Source: 
 AGHT+IG20yw7g9GqI9IbadFk19Exl/zGderaqPqj/VFPT7HLhLixQNc2+B3uD+potrr7JRkM+oOFEA==
X-Received: by 2002:a05:600c:3648:b0:40b:4812:22e2 with SMTP id
 y8-20020a05600c364800b0040b481222e2mr5226786wmq.11.1702499387771;
        Wed, 13 Dec 2023 12:29:47 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:3bf6:bcc0:fe50:883f?
 ([2a02:810b:f40:4300:3bf6:bcc0:fe50:883f])
        by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b0040b36ad5413sm21179364wmq.46.2023.12.13.12.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 12:29:47 -0800 (PST)
Message-ID: <a5889aba-75b6-4671-918b-26a4b9ec12c5@gmail.com>
Date: Wed, 13 Dec 2023 21:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/31] Fix and improve Rockchip RK3128 support
Content-Language: en-US, de-DE
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, Johan Jonker
 <jbx6244@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <2167016.irdbgypaU6@phil>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <2167016.irdbgypaU6@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: knaerzche@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: STJ5YHJOOLXJBS35DOU6TH4M6JXDSEJH
X-Message-ID-Hash: STJ5YHJOOLXJBS35DOU6TH4M6JXDSEJH
X-Mailman-Approved-At: Thu, 14 Dec 2023 14:23:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STJ5YHJOOLXJBS35DOU6TH4M6JXDSEJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Heiko

Am 12.12.23 um 21:03 schrieb Heiko Stuebner:
> Hi Alex,
>
> Am Dienstag, 29. August 2023, 19:16:16 CET schrieb Alex Bee:
>> this series fixes some issues I found when testing my "new" RK3128 board
>> with the mainline kernel and adds some core functionality like SMP bringup,
>> usb and networking.
> before I discard this thread, is everything from here migrated to
> separate serieses or are there patches in this big pile that are still
> relevant on their own, that haven't been applied?
> [I lost track of what did go where ;-) ]

No worries - I kept track :)

Not everything is re-sent yet (sound nodes, RK3126/RK3128 split-up) but 
you can discard this and will re-send everything left in separate series 
(as I said [0])

[0] 
https://lore.kernel.org/linux-arm-kernel/170109134007.42627.12929766893521974712.b4-ty@kernel.org/T/#m63efa1c1379353b5cf764d2f9a260cf0329c864c

Regards,

Alex

>
>
> Thanks
> Heiko
>
>
