Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275173977A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 08:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6725822;
	Thu, 22 Jun 2023 08:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6725822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687415481;
	bh=clm0QOYuc2e6fNkYBzvbJWAJyQh6y6QQr7io1EDGiuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eZXm5tGS3gogwwUio3VseyEnHRbdyn/o9fdhRYufhb92G+Gl/b5Hv6tvvlfYPkbZ9
	 zG9mYLHYNQTygw4ERHXku5eLQOoQaGlVVFR6+JYcfr+BwZbK5HkRySztcoSSEuxvyJ
	 g1ZxEEx4icqzQr3uymFzyyuuBJtWp8pBdlP6Q56o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20CC2F801D5; Thu, 22 Jun 2023 08:30:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97F13F80132;
	Thu, 22 Jun 2023 08:30:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C274F80141; Thu, 22 Jun 2023 08:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 073A0F80124
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 08:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073A0F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=fHypRKst
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=3FGTaC6K/NFfUNL8PLCH7DO8xw20xS+mYBro3gsoPbM=;
	t=1687415415;x=1687505415;
	b=fHypRKstO2rU7xokQ9rrZqDkkd2bGCD2X3yTyM9fTbtyNgCEemciU9/J5SlfDSI9lMdAKKPkVh6yuB7hpxmccIriM9xLbwl8dF/hkl7Og1yaxSg7rhOjIyWhhag2o/KjrZp6lcuNqi1DBCMahyID3dsud+rSZ0XrM2KQFkZ88WMGGkasCYCRdrCwM9nsv96Qubi3ChO3KMWPuo+fyUvEaWWIfHwRAk4EC4hlg5s16GVwcGi53h1KVJ6lNYFdDWFRGSc3pTtbgxIUPQqhITtADP4lEatiw60+JknJsZvwrby/qEguhZJICyqYTAjpCPH+58gJlHQxI2zVVa35jVcyqg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qCDpb-00005j-8u; Thu, 22 Jun 2023 09:30:12 +0300
Message-ID: <45c62cab-a779-e843-9f98-a0d14d2bc97b@inbox.ru>
Date: Thu, 22 Jun 2023 09:30:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
References: <20230621115328.156457-1-fido_max@inbox.ru>
 <3805dc65-113f-453a-90a9-2ae6204004ba@sirena.org.uk>
 <e6be75f6-054f-6c3b-00b4-a5e112bcefc3@inbox.ru>
 <b763d08e-f751-480c-96b6-339a53856768@sirena.org.uk>
 <ed9606a4-4be6-7403-6e32-1c045ac0bdf6@inbox.ru>
 <adbe1b82-9478-4462-ace9-968723a6ce3f@sirena.org.uk>
 <0ada8334-4006-438f-8461-5c4c8e13f65d@inbox.ru>
 <c054b036-d5fd-482b-adc4-913edbcd007c@sirena.org.uk>
 <08fb24b9-ab7d-da27-5ab7-e1d3270c8b43@inbox.ru>
 <b83bf5c9-5998-4683-8f28-1eff432742ed@sirena.org.uk>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <b83bf5c9-5998-4683-8f28-1eff432742ed@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD95D99986233CC4DDC5BACE53C59198470BA2B0E86AC3ED26E182A05F538085040D3F6310D864BF15DA0B26DB8FD81A6B9EC225F296CC7A0E3FF745A73D065D8BC
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3589DC202DD7369EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745476ED688D943148638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D895CDFF3EE515D565BD09ED9F9360DF866F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74F330F0740BBDD1F9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B5F22DA640E95B789A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C468D16C903838CAB43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A53DE6B35F26F4283D711EDF93985658556150D91D5E08810DF87CCE6106E1FC07E67D4AC08A07B9B0CE135D2742255B35CB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34CC972AA0E2E780C476C1E509B6607834BDD63EDAF0E17BC297CBD7956EB80C8AD6D151E477532E2A1D7E09C32AA3244C29CA0A78F1CB1061C60AEDFAA0F3C17C8A6D4CC6FBFAC25140799AC538031D0DB6C6411D86935C892AB2189BCAD71E73D640157F23F2FFE137E69C174A41D00C
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojB41c+mu8Ac9iayBvkF8qCQ==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986BD96E781C3C62A48AF3162B3DCF41C84598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: C2FMFZUMBOHNAGFANQ42NPUDI3PX6XQB
X-Message-ID-Hash: C2FMFZUMBOHNAGFANQ42NPUDI3PX6XQB
X-MailFrom: fido_max@inbox.ru
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2FMFZUMBOHNAGFANQ42NPUDI3PX6XQB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 21.06.2023 23:46, Mark Brown wrote:
>> Ok. How about that:
>> ---
>>   sound/soc/codecs/max98090.c | 52 ++++++++++++++++++++-----------------
>>   sound/soc/codecs/max98090.h |  2 ++
>>   2 files changed, 30 insertions(+), 24 deletions(-)
> 
> That looks plausible, yes.
> 
> I do note that the driver ignores tdm_width (and the entire TDM
> configuration) when configuring BCLK, I guess it only works in clock
> consumer mode for TDM?  If that's the case there should really be some
> validation, and there should probably be a check for slot width being 16
> since that looks like the only thing supported.  Those were already
> broken though.

Yep, tdm_width is not used in the driver and I can drop it. We already 
have slot_width validation in set_tdm_slot(), so only 16 is allowed. I 
didn't check/use clock provider mode. But it looks fine for me. 
set_fmt() just sets frame width here: 32 - by default, 48/64 - 3/4 slots 
if configured. We also check slots count in set_tdm_slots(). It will 
work for I2S/TDM.
