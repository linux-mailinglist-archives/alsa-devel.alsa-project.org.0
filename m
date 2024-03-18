Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF287E79A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 11:45:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78767218F;
	Mon, 18 Mar 2024 11:45:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78767218F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710758723;
	bh=+SOG/JMXzSLzhcPXLSIqOGl5VMrpHzfQZrNkOx8y724=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bw1avC9cg8Z6XXoEyREvdxjwajB9QEfqKFIjdWherUqv5psRRYFP/hih86P3JCAQ+
	 OyqPEIHiQKcKh06mCGOPnmR1AEcpAB+2cRDB1V9udZjoC4iMlyqXNMTjgI9hcbqLE5
	 PuIpA7jj+57gQllI3Yh5rCl/vnqtyxY5fhJnnmP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78626F80571; Mon, 18 Mar 2024 11:44:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1472F80548;
	Mon, 18 Mar 2024 11:44:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E11AF804E7; Mon, 18 Mar 2024 11:44:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82B1DF8010B
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 11:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82B1DF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZOdoLRCx
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-512b3b04995so3695821e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Mar 2024 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710758676;
 x=1711363476; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=KCGPrCwTOITqjTnhSele0x2XpulUBe47CHNWCd7XesU=;
        b=ZOdoLRCx8W5hOA3qw1rkohxNG5WWtAjvMAKKzHjTf+dNOUUUBb5bRRrJPl6Lpvwte/
         0tTJNE6dcK2CiiURNzDkPEi7yOjvkuaMbH0O+lAETKKzrC4Juo5ueyue/RgcDOtUxwVk
         pRTIrU8dPvkurSRS12MVhU88QWfrT+A/4misHzyo5h1JZZpjQnt/aqlYPmVmXWQS1IqI
         dor3L8WqJNCuGSm1tffv4bXZDnLjlPXWIW1ZYdogk0YejwVnLAmQYMh7OVkC+uClFKn9
         lEDQ9XZa7EX6KcS71fXxX4aKC9bcWsK9SdXwcFtLgQvZ8IJvwEGuTkYASeUIUz8+2Gc4
         CVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758676; x=1711363476;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCGPrCwTOITqjTnhSele0x2XpulUBe47CHNWCd7XesU=;
        b=gt1T+v8IpSVkr0UNatfpwZuwyl6ZBMQP/DX2KtTeW3FeV7i9sLdzbcSKugWJnYxE+U
         jgW4KrordoTTiIqGoGtc8XfK+WpUR7gWK87FJJmXIz4JeVpzrMhNuDTtC9pbXiV/0kLM
         SdpiJB4NvX6BahzEjkhriyEgy6eNo0CMh4ARrY2Jccuo+QSpQE78+thUFLfS70erKlRy
         colN+5HBe/FjEoRf3MWhgV3UzGh2l8lRRszr916jKtVTGm4d7VP6gVIDmGv+chLFZJ5C
         /boJzhwfH4qsYCxI2+jppR7iM0/VVVhh2sS/VS/rdR7hBAAXLtK9a+4bRi8PTuR2ruli
         +naw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoxH5CkGKJFOgifourEMEgTS2yl11FaNH/EfuWLm1M21pSgfKBh0qZ1HDzqqUdaorSkLGkTOsMyyWBVtfmYdlIjQ8agH89Ss2+I0Q=
X-Gm-Message-State: AOJu0Yxnr9Z8akpR8Su6iZ98yYHDoLr+2Hczw1Pog/dPWRGsJU6lAi3K
	iGOvJXweNEotdtGIKOEpYct5XrXI4NXpPwAbajx7KBEOAk7XkmYUjC13FwKPj+U=
X-Google-Smtp-Source: 
 AGHT+IHrBhAsRVSFIOS45FQu5E9/DGiPnUOBufbspQxtJ2p2r6r0OzKNwEix9BKbpaZlbyfnUT+a6Q==
X-Received: by 2002:ac2:494f:0:b0:513:c963:895e with SMTP id
 o15-20020ac2494f000000b00513c963895emr7169639lfi.42.1710758676166;
        Mon, 18 Mar 2024 03:44:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b00413ea26f942sm17214532wmq.14.2024.03.18.03.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:44:35 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
 <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
 <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jaroslav  Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1
 SoC family
Date: Mon, 18 Mar 2024 11:42:20 +0100
In-reply-to: <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
Message-ID: <1ja5mvhl9o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 6G2FO7YYBSDAX5S7Q4GFUGOP2EBGS2TW
X-Message-ID-Hash: 6G2FO7YYBSDAX5S7Q4GFUGOP2EBGS2TW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6G2FO7YYBSDAX5S7Q4GFUGOP2EBGS2TW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sun 17 Mar 2024 at 18:19, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/15/24 16:33, Mark Brown wrote:
>> On Fri, Mar 15, 2024 at 02:21:45AM +0300, Jan Dakinevich wrote:
>> 
>>>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>> -	.reg_bits	= 32,
>>> -	.val_bits	= 32,
>>> -	.reg_stride	= 4,
>>> +	.reg_bits		= 32,
>>> +	.val_bits		= 32,
>>> +	.reg_stride		= 4,
>>> +	.max_register		= TOACODEC_CTRL0,
>>> +	.max_register_is_0	= true,
>> 
>> If the maximum register is 0 how does the regmap have a stride?
>
> reg_stride inherited from existing code. Apparently, it was meaningless
> even before my modifications (the hardware has single register
> regardless of max_register declaration) and it should be dropped. But,
> is it okay to remove it in the same commit?

Yes it has a single register, for now. Still the stride is 4.
And assuming the mmio region passed from DT is correct, I'm not sure the
hunk is useful at all.

-- 
Jerome
