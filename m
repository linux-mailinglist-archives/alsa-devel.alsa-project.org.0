Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90938812DA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:03:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 282EE20C3;
	Wed, 20 Mar 2024 15:03:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 282EE20C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943420;
	bh=YvF7eLe7205wxa6RAenyAxtCB0M8C9fT9UInMrApoEY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c+P+x9cH2E81sxGSQXmfQzounBTBSwI7O0X9x6LjwlYtmVA52i0H8BC8oshZNpfLb
	 kteEXKPs3iE9P9vtt3PnH2PhhOlcnR8rXYzWINyZUugNHwwQYxfGKG9nJVt+V3w1+U
	 v6KGn6LxC+y4EXOTVSGbo0r9PDiPbzHpoALyiw5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D247F80794; Wed, 20 Mar 2024 15:00:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8725BF80791;
	Wed, 20 Mar 2024 15:00:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50305F804E7; Mon, 18 Mar 2024 23:36:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D5E7F8010B
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 23:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D5E7F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=J+aHlngq
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E086310000A;
	Tue, 19 Mar 2024 01:35:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E086310000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710801358;
	bh=vPcHUQZVimBhgCl8L1f1HwLGGZYqomI6G5dUIYpgXh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=J+aHlngq9//OVD9HE6Ik14KAs5VWEg57NxJNYzD9iYiuWq45OZAyUMhJz0HXqfp1N
	 aiWgMRNxojFULwjNsxw1oxwj7hMwOPIWhNFAlyRdUaWAJ2sjAO32yOD7eR08Ez2QTM
	 Q1390IWLe4lfY9vuAS4IRRhEEkBZejw/XcxM+8ueUzJ6obYKcRjxt6ZKs3QyXMWYOA
	 iziszeAinZ+nPhqlLhc+F20oqkJzqzxrltZ7KkYJuB+7HXer2DxAeDu1YIJ+JyduG5
	 VM+jNFHlsLUB5UIEaMseXMz22VUxYZlykmEziDmnsVkAy1NUdPaNr/ocv17UQOkkTe
	 jPBin7Ojeet1g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 19 Mar 2024 01:35:58 +0300 (MSK)
Received: from [172.28.64.112] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 19 Mar 2024 01:35:58 +0300
Message-ID: <d4cfef9e-3cae-4f1a-90b3-33d5707596f9@salutedevices.com>
Date: Tue, 19 Mar 2024 01:35:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
 <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
 <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
 <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184250 [Mar 18 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 10 0.3.10
 53c821b925e16276b831986eabc71d60ab82ee60, {Tracking_smtp_not_equal_from},
 {Tracking_from_domain_doesnt_match_to},
 salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2,
 FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/03/18 20:02:00 #24276844
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UHNNISOAQAGFOPM3UTT24DAT7AJ7VJQF
X-Message-ID-Hash: UHNNISOAQAGFOPM3UTT24DAT7AJ7VJQF
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:58:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHNNISOAQAGFOPM3UTT24DAT7AJ7VJQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/18/24 13:17, Jerome Brunet wrote:
> 
> On Sun 17 Mar 2024 at 17:17, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> 
>> On 3/15/24 11:58, Jerome Brunet wrote:
>>>
>>> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>>>
>>>> Existing values were insufficient to produce accurate clock for audio
>>>> devices. New values are safe and most suitable to produce 48000Hz sample
>>>> rate.
>>>
>>> The hifi pll is not about 48k only. I see no reason to restrict the PLL
>>> to a single setting.
>>>> You've provided no justification why the PLL driver can't reach the same
>>> setting for 48k. The setting below is just the crude part. the fine
>>> tuning is done done with the frac parameter so I doubt this provides a
>>> more accurate rate.
>>>
>>
>> You are right, it is not about 48k only. However, there are two issues.
>>
>> First, indeed, I could just extend the range of multipliers to 1..255.
> 
> Why 1..255 ? This is not what I'm pointing out
> 
> According to the datasheet - the range is 32 - 64, as currently
> set in the driver.
> 

Could you point where in the doc the range 32..64 is documented?
Documentation that I have may be not so complete, but I don't see there
any mention about it.

Anyway, range 32..64 of multipliers is not enough to produce accurate
clock, and a need 128 for 48kHz.

> The change you have provided request a multipler of 128/5 = 25,6
> If you put assigned-rate = 614400000 in DT, I see no reason can find the
> same solution on its own.
> 

The reasoning is following. I don't know why 32..64 range was declared
for this clock, and whether it would be safe to extend it and include
128, which is required for 48kHz. But I know, that multiplier=128 is
safe and works fine (together divider=5).

>> But I am unsure if hifi_pll is able to handle whole range of
>> mulptipliers. The value 128 is taken from Amlogic's branch, and I am
>> pretty sure that it works.
> 
>>
>> Second, unfortunately frac parameter currently doesn't work. When frac
>> is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
>> it when try to use 44100Hz and multipliers' range is set to 1..255. So,
>> support of other rates than 48k requires extra effort.
> 
> Then your change is even more problematic because it certainly does not
> disable frac ... which you say is broken.
> 
> That parameter should be removed with a proper comment explaining why
> you are disabling it. That type a limitation / known issue should be
> mentionned in your change.
> 

Handling of frac should not be removed, it should be fixed to achieve
another rates. But that is not the goal of this commit.


>>
>>>>
>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>> ---
>>>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>>>> index 4325e8a6a3ef..00e06d03445b 100644
>>>> --- a/drivers/clk/meson/a1-pll.c
>>>> +++ b/drivers/clk/meson/a1-pll.c
>>>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>>>  	},
>>>>  };
>>>>  
>>>> -static const struct pll_mult_range hifi_pll_mult_range = {
>>>> -	.min = 32,
>>>> -	.max = 64,
>>>> +static const struct pll_params_table hifi_pll_params_table[] = {
>>>> +	PLL_PARAMS(128, 5),
>>>> +	{ },
>>>>  };
>>>>  
>>>>  static const struct reg_sequence hifi_init_regs[] = {
>>>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>>>  			.shift   = 6,
>>>>  			.width   = 1,
>>>>  		},
>>>> -		.range = &hifi_pll_mult_range,
>>>> +		.table = hifi_pll_params_table,
>>>>  		.init_regs = hifi_init_regs,
>>>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>>>  	},
>>>
>>>
> 
> 

-- 
Best regards
Jan Dakinevich
