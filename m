Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB60C87CB51
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 11:25:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 063C321B3;
	Fri, 15 Mar 2024 11:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 063C321B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710498353;
	bh=NfFTjprpYpTx/YOcA395cb2tUELkt8+AWxFx0BohTVw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PHUKei2qLMK5wLQWpRP7qWBxcE/DDn7zyb54dOA5wOl80YoWuU1yix22eRspc8WPJ
	 c6PD6pO4BcPWO70v1t1OV5F1k4Y7gViXEYjmXvyMev/XrOzpHfmbUVMZU+G1hSlwR6
	 9bYilFy8A6H78GS8mR9fiSlImo8stVEBbT2plymc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A9F4F8057C; Fri, 15 Mar 2024 11:25:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6A0F8057B;
	Fri, 15 Mar 2024 11:25:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF60FF8028D; Fri, 15 Mar 2024 11:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09B38F800E4
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 11:25:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09B38F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=3e5qa8XD
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33e94c12cfaso1443299f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Mar 2024 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710498307;
 x=1711103107; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=I3EB/6PldhsbhWY9+bYWiu2w8/wr6W5dSP5c/9sIMoI=;
        b=3e5qa8XDZldnK7HwjUIaMDabzt1YlQPAG2qDTgNLMc/0q7L1gZm17EpRpoioAfRHzm
         ghWCKWS9Zfj2xLyS9c2BmBAErqbyZUA2dqqTc3c92/OS/S1LgAMLSmrSXmK6JsRNw9ua
         NcMsPSQ9ekVNhSh6kkVhDJ1wh7FClV+KsO8hWSDvt+XRd2t4UhwfcNY6DcvzcckFF+gq
         +3GsuFf/wlFCifmh9CqSRStSMGpci6auHcQ1jp51C7Y5qnsFP8e6C+eSfFfV9Ru254Zt
         HDojs2ihshIKAm+z1p0WTfyocbHxcGogBW5sisgrmI6tkbhQzCOW6QRaoDmVdjtmWayY
         vNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498307; x=1711103107;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3EB/6PldhsbhWY9+bYWiu2w8/wr6W5dSP5c/9sIMoI=;
        b=v7rbW12k3l9lUF10gUpgaKreTXtXd4ARYndy5bXI1+Oji/EVVQQihNnaLaLn13jqz1
         PsrwRdn/nCHFThY4FoaSrb70e8zVGJLFsVLFlRKFZCW056i2CtK177AK69IRTFP+3UAp
         Ht4EsguOjMptT3QI9LyMVsyGxkOs6EKmTGEkJEx1lU7a5zUuQBJAp7IqqaAJrzinpdSn
         7DGb7WGQc9qVOC+vKFuxhoP50GqGOEYQrvgOqdNLohYWAXAPfOAlLS3qnZBxTGK9gtKl
         Q35W9Hp7xyqRg+D84Ndsg3A6o/mbPD88ALoG8QltwVxceTy9wBag4gFql84wjGQNp+hY
         V7yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4GDOvhTcwmJGP+q+ZlOZzLfklPUztoewHHa9ULs4ZxF8CBOO/SR1BCYQWseDozHKCx0dpH4pmKxuQ1JaSJTr8UUrCv5kYZAS/tok=
X-Gm-Message-State: AOJu0YzAuNiy+16+TGREqX1N2ATkBYKmeRLT4P5hhU2BFjhaFoE4lOtZ
	pju/h1lq5mWZsPhY3Aij8+Lmrw7WBI/irZx3b32+XrkL+wgSJD2qTvzgPekmB58=
X-Google-Smtp-Source: 
 AGHT+IGWDipfwojUVR3R0h/HAg8+ErMHQU1L9DU1QDqUHJY9+2A1t5wePivY0yDxiYGWnr60Q0NDnQ==
X-Received: by 2002:a5d:4cc1:0:b0:33e:7f5c:732c with SMTP id
 c1-20020a5d4cc1000000b0033e7f5c732cmr3060666wrt.62.1710498307090;
        Fri, 15 Mar 2024 03:25:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id
 o14-20020adfe80e000000b0033e8c50fc3fsm2818997wrm.90.2024.03.15.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:25:06 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 13/25] ASoC: dt-bindings: meson: axg-pdm: document
 'sysrate' property
Date: Fri, 15 Mar 2024 11:22:59 +0100
In-reply-to: <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
Message-ID: <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: IVWMFZGTH6K3WCGEJVNGWK6X2FX5XQGS
X-Message-ID-Hash: IVWMFZGTH6K3WCGEJVNGWK6X2FX5XQGS
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVWMFZGTH6K3WCGEJVNGWK6X2FX5XQGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri 15 Mar 2024 at 11:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 15/03/2024 00:21, Jan Dakinevich wrote:
>> This option allow to redefine the rate of DSP system clock.
>
> And why is it suitable for bindings? Describe the hardware, not what you
> want to do in the driver.
>
>> 
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> index df21dd72fc65..d2f23a59a6b6 100644
>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> @@ -40,6 +40,10 @@ properties:
>>    resets:
>>      maxItems: 1
>>  
>> +  sysrate:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: redefine rate of DSP system clock
>
> No vendor prefix, so is it a generic property? Also, missing unit
> suffix, but more importantly I don't understand why this is a property
> of hardware.

+1.

The appropriate way to set rate of the clock before the driver take over
is 'assigned-rate', if you need to customize this for different
platform.

Then you don't have to deal with it in the device driver.

>
> Best regards,
> Krzysztof


-- 
Jerome
