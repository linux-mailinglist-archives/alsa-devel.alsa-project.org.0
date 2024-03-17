Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C28812C7
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 14:58:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795AC1A2D;
	Wed, 20 Mar 2024 14:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795AC1A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943119;
	bh=xAVsxMnJoqTUvzQY5QFOBDRP+AQP097SoH7H4Z6KpPk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FKbL6v6NUP9kkcGIah0MFEGfDHv2WQulf5bbPzv6T7FHeXbsKGB0ld4JYroJlXPBd
	 AvzDxZyQYZEnwSrcOcu0YXbl2o/t23Zz4JWc1UBeErtGLdiJN1Te9MLUmSteg7mwjl
	 9WNO+ne6zm1zjPWd+NpYU//5+/6A/BO6/qYitvVk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 071DBF805A0; Wed, 20 Mar 2024 14:58:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE16F80564;
	Wed, 20 Mar 2024 14:58:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EBECF804E7; Sun, 17 Mar 2024 15:17:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F7D6F8025F
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 15:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F7D6F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=uv7Lm/X9
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EEF53100004;
	Sun, 17 Mar 2024 17:17:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EEF53100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710685075;
	bh=SQRSKK7y7FzIxWfxLiQrXC7XGIdk++wvMoC5iAR3Cb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=uv7Lm/X9X5z1ZUSUWfoS0ttfd/72rpm6SUnpRRaNa24NwI+up88M2sXcGcvi9f9YN
	 Jig10wMsHnHwV3wanec2UWaKwWicjrcIw9dzuHtmOHhcc7uYxFsB3ysm6RbjCzKe6y
	 jFKr94t1wofL3qvT2jXHDt0cZ9TG2LvhthtFoXo8mnq8bJQBPmuOH+d043V2q04tZW
	 98zrHAAMKuh6hEZvYg4S/n02z1WyFyc8uh7Y4DQZO2og/ahv9LdqCGSLBmonIYf9hv
	 V9kuUDEqBFP9SD9NKttW20YDJR+hHD4daPmB+e6xNuANLo3Bwgo7cs0+9iYR4UQ95k
	 jIktZ299+OK9Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 17:17:55 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 17:17:55 +0300
Message-ID: <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
Date: Sun, 17 Mar 2024 17:17:12 +0300
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
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from},
 {Tracking_from_domain_doesnt_match_to}, FromAlignment: n,
 {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PB7X4CQXWSNDXYYQLUSOKZQGD3DXB63C
X-Message-ID-Hash: PB7X4CQXWSNDXYYQLUSOKZQGD3DXB63C
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:56:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PB7X4CQXWSNDXYYQLUSOKZQGD3DXB63C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/15/24 11:58, Jerome Brunet wrote:
> 
> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
> 
>> Existing values were insufficient to produce accurate clock for audio
>> devices. New values are safe and most suitable to produce 48000Hz sample
>> rate.
> 
> The hifi pll is not about 48k only. I see no reason to restrict the PLL
> to a single setting.
> > You've provided no justification why the PLL driver can't reach the same
> setting for 48k. The setting below is just the crude part. the fine
> tuning is done done with the frac parameter so I doubt this provides a
> more accurate rate.
> 

You are right, it is not about 48k only. However, there are two issues.

First, indeed, I could just extend the range of multipliers to 1..255.
But I am unsure if hifi_pll is able to handle whole range of
mulptipliers. The value 128 is taken from Amlogic's branch, and I am
pretty sure that it works.

Second, unfortunately frac parameter currently doesn't work. When frac
is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
it when try to use 44100Hz and multipliers' range is set to 1..255. So,
support of other rates than 48k requires extra effort.

>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>> index 4325e8a6a3ef..00e06d03445b 100644
>> --- a/drivers/clk/meson/a1-pll.c
>> +++ b/drivers/clk/meson/a1-pll.c
>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>  	},
>>  };
>>  
>> -static const struct pll_mult_range hifi_pll_mult_range = {
>> -	.min = 32,
>> -	.max = 64,
>> +static const struct pll_params_table hifi_pll_params_table[] = {
>> +	PLL_PARAMS(128, 5),
>> +	{ },
>>  };
>>  
>>  static const struct reg_sequence hifi_init_regs[] = {
>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>  			.shift   = 6,
>>  			.width   = 1,
>>  		},
>> -		.range = &hifi_pll_mult_range,
>> +		.table = hifi_pll_params_table,
>>  		.init_regs = hifi_init_regs,
>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>  	},
> 
> 

-- 
Best regards
Jan Dakinevich
