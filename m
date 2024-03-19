Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC33B87F9CD
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 09:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16C562BAA;
	Tue, 19 Mar 2024 09:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16C562BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710836965;
	bh=wEOu2J6N3RicgE6VdikhaGkAHK9MlBxWFNBPisxCRwo=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hPqeBMAtZBxIvK/I5DtV3k0RPDmj2Y3UfWId+/ZES8astxqme21UZF3sPJH5QpnH0
	 haT6OXbVwHY31FJ+Jag1gzbBtz82qVKjOdHZi7UK7jMYHJcPLcT8UkrRhLAnEytQdr
	 UFuOyJIfUeJJcsPP9h4/W1hIcTroJrVIqSRZMFWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 589A0F8055B; Tue, 19 Mar 2024 09:29:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B43E4F80587;
	Tue, 19 Mar 2024 09:29:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F0BDF804E7; Tue, 19 Mar 2024 09:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EF22F80093
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 09:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EF22F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=J4yuOR0g
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41461c256c4so5873335e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Mar 2024 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710836913;
 x=1711441713; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hgFFAPN7B2IdqbSbHOUWcvyqPwWPHdQWlex71RuQvmY=;
        b=J4yuOR0gBz2gH4VN/Cz2dhINgC52OUdiYUThjStMgxG5KE13TVeFJa3RQWL33iwJST
         kG2ZBkP4ubi8TbCagqxrgJnVFf9k9/OUcc0VHxVVcICoWQHnyeKZFylEqEFyGc2pGq18
         uE1ehwuPfFSXzJpexeU0IdwjigEupfCcwVxqPgl+fE2oSyBwu2C7E/E9TtCPLI9/QLB2
         Se2pP2dd5eEUmR+rbp+fzMscpudVtLW5D3bVVN6KLwuYeqY2yXto6fcWFyHBVHL3kGAv
         v2L1b6kxjY9sBnq+W73EA4ziB9dqq/lnvqp5t7GlZshI8szP/iMqQFCp7kO2XRmiVVw/
         jPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710836913; x=1711441713;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgFFAPN7B2IdqbSbHOUWcvyqPwWPHdQWlex71RuQvmY=;
        b=dKsid86trZH7ead27NKsIOZppTu7Y9KUbvr9AXlwBi0HcnxaepdrO6v83GxPL7cWcq
         1uY0PLlZqfAzuXWReTQqPjoe6DnK5nzzwl8cA0303XZ289h4QI49bSUFgllxDNp+DPLE
         /pYrQZbWpeMBbfnWnVFz4O7wo5i8BxHBhGOannzP6BP8dyq0AtpRqXcxwfj38vM4aqQN
         Akujgw0zg5M6F4B3o6O9KNdK+kFhogVrSLJa/0utK4XQPOc7x6uR88dbHQVHuTUus5Yb
         A3VVtgcUR0LZGLdwQS7GHOZN9ecDzqSvXc38YlJo8YjOsIgMR5qY9QOsyjw0sbnUHAgy
         MOPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWht4rnxidHqOQAK94CAM0L46s/LnHkeDldkA+bdmu0BuyGRAXiqUizGoEG7L62WVodHhI+5X5ll3F5Ovd5ljCFT8sVI7ZEfhLdzIE=
X-Gm-Message-State: AOJu0Yxbu2XdV4sYJbVd/skI8ZzHb/Z4C3oH8t3Kcr99MjNujStQuA0J
	LSAB1VNjmHe3UMRMGQpzEWKRJ8l5aPUpbakWrUWgbOmxVGUtgrRJzIdcBkSu4t8=
X-Google-Smtp-Source: 
 AGHT+IF8VeQ4xCRzE1F2nR3lm7Kyoo5lbqorbXz3zLlgIR0czhWjHZf4ZYDwVRGEa2XhkhvSTql6LA==
X-Received: by 2002:adf:a358:0:b0:341:8666:ce2e with SMTP id
 d24-20020adfa358000000b003418666ce2emr913294wrb.0.1710836912716;
        Tue, 19 Mar 2024 01:28:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a757:fdcf:e3d7:eaed])
        by smtp.gmail.com with ESMTPSA id
 ay25-20020a5d6f19000000b0033e3cb02cefsm11883313wrb.86.2024.03.19.01.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:28:32 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
 <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
 <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
 <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
 <d4cfef9e-3cae-4f1a-90b3-33d5707596f9@salutedevices.com>
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
Date: Tue, 19 Mar 2024 09:21:27 +0100
In-reply-to: <d4cfef9e-3cae-4f1a-90b3-33d5707596f9@salutedevices.com>
Message-ID: <1jsf0mfwwg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 6FITQRESFVKONLX35NCKLNN5CCEI2LL6
X-Message-ID-Hash: 6FITQRESFVKONLX35NCKLNN5CCEI2LL6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FITQRESFVKONLX35NCKLNN5CCEI2LL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue 19 Mar 2024 at 01:35, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/18/24 13:17, Jerome Brunet wrote:
>> 
>> On Sun 17 Mar 2024 at 17:17, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>> 
>>> On 3/15/24 11:58, Jerome Brunet wrote:
>>>>
>>>> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>>>>
>>>>> Existing values were insufficient to produce accurate clock for audio
>>>>> devices. New values are safe and most suitable to produce 48000Hz sample
>>>>> rate.
>>>>
>>>> The hifi pll is not about 48k only. I see no reason to restrict the PLL
>>>> to a single setting.
>>>>> You've provided no justification why the PLL driver can't reach the same
>>>> setting for 48k. The setting below is just the crude part. the fine
>>>> tuning is done done with the frac parameter so I doubt this provides a
>>>> more accurate rate.
>>>>
>>>
>>> You are right, it is not about 48k only. However, there are two issues.
>>>
>>> First, indeed, I could just extend the range of multipliers to 1..255.
>> 
>> Why 1..255 ? This is not what I'm pointing out
>> 
>> According to the datasheet - the range is 32 - 64, as currently
>> set in the driver.
>> 
>
> Could you point where in the doc the range 32..64 is documented?
> Documentation that I have may be not so complete, but I don't see there
> any mention about it.
>
> Anyway, range 32..64 of multipliers is not enough to produce accurate
> clock, and a need 128 for 48kHz.

A1 datasheet v0.4 - Section 7.6.3.2

>
>> The change you have provided request a multipler of 128/5 = 25,6
>> If you put assigned-rate = 614400000 in DT, I see no reason can find the
>> same solution on its own.
>> 
>
> The reasoning is following. I don't know why 32..64 range was declared
> for this clock, and whether it would be safe to extend it and include
> 128, which is required for 48kHz. But I know, that multiplier=128 is
> safe and works fine (together divider=5).

You have not answer my remark.
Mainline does not do everything like the AML SDK does. Saying you are
copying it because you know it works (in your opinion) is not good
enough.

I'm telling you that your hack is not necessary and so far, you have not
demonstrated that it is.

Also the multiplier range in m/n, not m alone.

>
>>> But I am unsure if hifi_pll is able to handle whole range of
>>> mulptipliers. The value 128 is taken from Amlogic's branch, and I am
>>> pretty sure that it works.
>> 
>>>
>>> Second, unfortunately frac parameter currently doesn't work. When frac
>>> is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
>>> it when try to use 44100Hz and multipliers' range is set to 1..255. So,
>>> support of other rates than 48k requires extra effort.
>> 
>> Then your change is even more problematic because it certainly does not
>> disable frac ... which you say is broken.
>> 
>> That parameter should be removed with a proper comment explaining why
>> you are disabling it. That type a limitation / known issue should be
>> mentionned in your change.
>> 
>
> Handling of frac should not be removed, it should be fixed to achieve
> another rates. But that is not the goal of this commit.

You argued that frac was broken and that was partly why you introduced
this work around. I'm telling you this approach is incorrect.

So either :
* Remove frac for now, until it is fixed, because it is broken and add
  comment clearly explaining that quirk.
* Or fix it now.

Your choice.

>
>
>>>
>>>>>
>>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>>> ---
>>>>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>>>>> index 4325e8a6a3ef..00e06d03445b 100644
>>>>> --- a/drivers/clk/meson/a1-pll.c
>>>>> +++ b/drivers/clk/meson/a1-pll.c
>>>>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>>>>  	},
>>>>>  };
>>>>>  
>>>>> -static const struct pll_mult_range hifi_pll_mult_range = {
>>>>> -	.min = 32,
>>>>> -	.max = 64,
>>>>> +static const struct pll_params_table hifi_pll_params_table[] = {
>>>>> +	PLL_PARAMS(128, 5),
>>>>> +	{ },
>>>>>  };
>>>>>  
>>>>>  static const struct reg_sequence hifi_init_regs[] = {
>>>>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>>>>  			.shift   = 6,
>>>>>  			.width   = 1,
>>>>>  		},
>>>>> -		.range = &hifi_pll_mult_range,
>>>>> +		.table = hifi_pll_params_table,
>>>>>  		.init_regs = hifi_init_regs,
>>>>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>>>>  	},
>>>>
>>>>
>> 
>> 


-- 
Jerome
