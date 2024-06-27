Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A0919F27
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 08:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 774001944;
	Thu, 27 Jun 2024 08:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 774001944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719469025;
	bh=yn1EXQ33os732gYNCftBCiSlAe05r4zpnGb7T8V2XmU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LnLTsj/S0VYx92YPXr4LjLwgvJXWl09TwSjS8kF9CpG2b3oyxkh7YQln4XHZAyA36
	 Rvc3aAArJ03w8pCAPKCZBvLydaRbM37qHK4Zv+b9c6Nb7vWHbUahQIsXGTTohiZ5MD
	 A/EQApGedSVHhCVu+BGY/jkQxeDOP6uiWh8y+xvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AEFFF80423; Thu, 27 Jun 2024 08:16:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5BDBF80578;
	Thu, 27 Jun 2024 08:16:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8B3CF80423; Thu, 27 Jun 2024 08:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp35.i.mail.ru (smtp35.i.mail.ru [95.163.41.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B91EF800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 08:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B91EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=tz2bM4ff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=YvwWvKWbkaWStnEiMFA8kYmzXbyPKBVBYZ5S12a/KBg=; t=1719468914; x=1719558914;
	b=tz2bM4ff4jZFlklc9Jcnww0SFiHl+1SC3K5AczJEhcXeaZTJWyrDnFhQzg7aLWEijMF3MsyXhih
	d9K4TGXovsJ6G45I/llqsFiZAEPOgX+p6VkHjXP1YK0vyNtFfrHV90qHo/zN+CTXZWoZXebskRbcl
	t4XhJHc+bD0GhXCg56pD/PyB+OphMmlXcQs4U6+AARCGmwb6zxZGoi8crAnIVC4Rr4Knm1hX5HX13
	JI+oSRm0c7ZajU4H3JEVe6YBPZKpXFdqd0lzLsKgK1isNioMFIRgny358FK0ElM1868Ntw4NmRLM0
	fBvCV2mYRf791EHfr+E3AD9cbdsxQmAjOpmg==;
Received: by exim-smtp-84f7fbf7d8-hgbp6 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1sMiPX-000000008C2-2oWL; Thu, 27 Jun 2024 09:15:12 +0300
Message-ID: <920995ce-9913-4fd4-aa54-2c5d60bac03b@inbox.ru>
Date: Thu, 27 Jun 2024 09:15:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: nau8824: Add master clock handling
To: AS50 KCHSU0 <kchsu0@nuvoton.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lin <ctlin0@nuvoton.com>,
 Seven Lee <wtli@nuvoton.com>, Wallace Lin <sjlin0@nuvoton.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20240626145931.25122-1-fido_max@inbox.ru>
 <20240626145931.25122-2-fido_max@inbox.ru>
 <30267661-fec3-ec5c-4973-8b2013f14056@nuvoton.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <30267661-fec3-ec5c-4973-8b2013f14056@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-84f7fbf7d8-hgbp6;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD99270B3E0DC24D31F1F92A1EFA9339B6F13BB3ED69C1CEC2D182A05F5380850402F8F1B328E395C4A3DE06ABAFEAF670550096AF54BC23A5CEDBD76CFFC2372100009D0EC9FC8B3C9
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A4C4638C9DDF45FCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BC4B0F5721B555078638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D891E17E1EDA14ED313A31D7088E697C7A263CC7B33B595DFE20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A3E989B1926288338941B15DA834481FA18204E546F3947C062BEEFFB5F8EA3EF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDB19F53EE528DD389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735E4A630A5B664A4FFC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 
 0D63561A33F958A520D77219636251CE5002B1117B3ED696BDCFAFB884F138F5A9DAB4B68AE4D22F823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF0DF3AADD24675CB0C318DB682A04B147C73544D50CF578BB89A015165E8B947C80BEFAEC9D272008443676941C84C1C84A7CEF38EA62B6ACBD14DE81B3D0697273A32D8B02A34957F37A8DA3E9B01C3902C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWooCpS6sRoHegQ==
X-Mailru-Sender: 
 689FA8AB762F7393C6D0B12EA33CAA9B7633336BEC2AC87DD47657217676579CD31CAF3E9C4EBF1190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: GMWI7HKRNFCEDCOMHSSUMTSHO45ZP2PG
X-Message-ID-Hash: GMWI7HKRNFCEDCOMHSSUMTSHO45ZP2PG
X-MailFrom: fido_max@inbox.ru
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMWI7HKRNFCEDCOMHSSUMTSHO45ZP2PG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

27.06.2024 03:44, AS50 KCHSU0 wrote:

>>
>> +       nau8824->mclk = devm_clk_get(component->dev, "mclk");
>> +       if (PTR_ERR(nau8824->mclk) == -EPROBE_DEFER)
>> +               return -EPROBE_DEFER;
>> +
>>          return 0;
>>   }
> 
> Would it be better to move the retrieval of mclk property to the
> function nau8824_read_device_properties? All properties can be read
> together.

Sure. I will do it in V2.

