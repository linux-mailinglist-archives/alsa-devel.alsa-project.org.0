Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2847B87E786
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 11:41:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26B202369;
	Mon, 18 Mar 2024 11:41:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26B202369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710758499;
	bh=i5ixDYb3wbENoImw8j5KKJEmWmhgfjQSVNTIJMv1DhY=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IS0nMuXvNZHqzPo2QRgDccVPjBWdtJzD/f1VcRTtsSbvtBLeLp6pBzkQczSrAm0MF
	 424T0flatRKIPy90nTvowHEDoohKzB5X52fHAhfCmtEr4tGDhuPTSzm/InnGoKiVAK
	 kPe+OigkSP5UOR/X2Qkox+pmyPhVEN6GyEM9NOJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A50DF80579; Mon, 18 Mar 2024 11:41:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B40F2F8059F;
	Mon, 18 Mar 2024 11:41:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 723FDF804E7; Mon, 18 Mar 2024 11:40:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B168FF80088
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 11:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B168FF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=olRBZnRN
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4140a9f25adso9954785e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Mar 2024 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710758445;
 x=1711363245; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=xNzf7P8nz60f5DqiZ1A/ORzVISDkI6sI6tCR2mQw6JE=;
        b=olRBZnRNdVWnz+Z9TlXAqIZ7yBOM1ePWa4+rKDXTblAw1NQRHpvzDBnDFhZRlKGtte
         679pCZSYRXG1nip64vVoi3S3Pv+DPkIWCLlvfS4fLqLzlvlulflromXXZacYpPH+Xrky
         l08PrZNyAo18VG8KfVQ2X9wwwsRk7/UDjQjGsUctEm+CzSPPQ0149iwJlSKs4U+/7b+X
         S2wsi1/FCsepP7+eDw3QPWdLAD3pkZFKfw78YeyQEbdxMqio6XLrFNd5FK5PcdHiQM7o
         5QFDj8BhmSFQ6ckit3PQKqv8nmmF3UhHze9NoXKPF2Fhb8HHejGe2D71uimP0nqgVjz0
         k1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758445; x=1711363245;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNzf7P8nz60f5DqiZ1A/ORzVISDkI6sI6tCR2mQw6JE=;
        b=vOiBCwAsam0AxFkLa+xiLeJkqz9a/z/2uHkwiwk18bCZR6hZKCRVZ4KU0a97QEsblG
         E3eCqSpHnskAQzAIbuQa4aFxPFK2/PYaTeivyx+H7Ea6GDTZJWv6uiummsLUw3FBp3J8
         IvrWbyUY01w11f3a0iXs3WZjgoPHu/i51xdO5r3JENuWN1x3VJIi5w+q9/qXa56Cvdjd
         lUEd6X8CqmxKY5YtutmSn5KYRsR3KgLemiWT8Cw0PF1ySF+zfURFmjISYCg1Zmhvxtr1
         xeAGizSy9qa25lujd/owmEmx4h4DMlfqqHFEckgwKkjbqXnsgSC5Aw3558NbMPiWHhGg
         DIrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6ex0TS4ozD6SA7U6/FVdoMsJdCi752gqUN0G82xy29xTwjJwlzPNezaSAEixc8vUYO1tlgHCYFbvFqlORgm0pAD7mA1Gvxlvb38w=
X-Gm-Message-State: AOJu0YwnPGx2XakeEn+vZnPcxtGSPgjYExKgzpRjqavspshQMxYVPAJe
	/Pg7FdnHXNZ7C5kMj8gBR82Y3OMPvchLmnjCDAIZHcESp7Z5kxKMoos2W88ZMJA=
X-Google-Smtp-Source: 
 AGHT+IF2NPmkDgNrJwjlDs0dlEQjbzK0dB/C1p7NsE17fQtvvBPtrHxeI38T1w1hQ953d1PS97HQkQ==
X-Received: by 2002:a05:600c:4707:b0:414:ca1:6531 with SMTP id
 v7-20020a05600c470700b004140ca16531mr3050478wmo.41.1710758445095;
        Mon, 18 Mar 2024 03:40:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c155300b00414105c4cd9sm2909256wmg.21.2024.03.18.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:44 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
 <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
 <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Date: Mon, 18 Mar 2024 11:17:14 +0100
In-reply-to: <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
Message-ID: <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: SC6LLKYYACSWCFT36VXVUYZAJM3LAZJL
X-Message-ID-Hash: SC6LLKYYACSWCFT36VXVUYZAJM3LAZJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SC6LLKYYACSWCFT36VXVUYZAJM3LAZJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sun 17 Mar 2024 at 17:17, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/15/24 11:58, Jerome Brunet wrote:
>> 
>> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>> 
>>> Existing values were insufficient to produce accurate clock for audio
>>> devices. New values are safe and most suitable to produce 48000Hz sample
>>> rate.
>> 
>> The hifi pll is not about 48k only. I see no reason to restrict the PLL
>> to a single setting.
>> > You've provided no justification why the PLL driver can't reach the same
>> setting for 48k. The setting below is just the crude part. the fine
>> tuning is done done with the frac parameter so I doubt this provides a
>> more accurate rate.
>> 
>
> You are right, it is not about 48k only. However, there are two issues.
>
> First, indeed, I could just extend the range of multipliers to 1..255.

Why 1..255 ? This is not what I'm pointing out

According to the datasheet - the range is 32 - 64, as currently
set in the driver.

The change you have provided request a multipler of 128/5 = 25,6
If you put assigned-rate = 614400000 in DT, I see no reason can find the
same solution on its own.

> But I am unsure if hifi_pll is able to handle whole range of
> mulptipliers. The value 128 is taken from Amlogic's branch, and I am
> pretty sure that it works.

>
> Second, unfortunately frac parameter currently doesn't work. When frac
> is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
> it when try to use 44100Hz and multipliers' range is set to 1..255. So,
> support of other rates than 48k requires extra effort.

Then your change is even more problematic because it certainly does not
disable frac ... which you say is broken.

That parameter should be removed with a proper comment explaining why
you are disabling it. That type a limitation / known issue should be
mentionned in your change.

>
>>>
>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>> ---
>>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>>> index 4325e8a6a3ef..00e06d03445b 100644
>>> --- a/drivers/clk/meson/a1-pll.c
>>> +++ b/drivers/clk/meson/a1-pll.c
>>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>>  	},
>>>  };
>>>  
>>> -static const struct pll_mult_range hifi_pll_mult_range = {
>>> -	.min = 32,
>>> -	.max = 64,
>>> +static const struct pll_params_table hifi_pll_params_table[] = {
>>> +	PLL_PARAMS(128, 5),
>>> +	{ },
>>>  };
>>>  
>>>  static const struct reg_sequence hifi_init_regs[] = {
>>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>>  			.shift   = 6,
>>>  			.width   = 1,
>>>  		},
>>> -		.range = &hifi_pll_mult_range,
>>> +		.table = hifi_pll_params_table,
>>>  		.init_regs = hifi_init_regs,
>>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>>  	},
>> 
>> 


-- 
Jerome
