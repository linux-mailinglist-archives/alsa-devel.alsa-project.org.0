Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D43B0918696
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 18:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D62B1530;
	Wed, 26 Jun 2024 18:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D62B1530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719417755;
	bh=Wx64qhe1qZdNI9piuDe/1BE9IJ2u7wuWxsCaqg+8skI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u/eCRWZWAext23knToAaD1peJQZaJXMDWqnHBb9YbIuLyaaqOfoRJwYr5R02D+m8B
	 j27lg6AQsxnBG1P4I4QUN87hQMJo4MVVlbbijSGrxdkcsmRSeH8XkO6wVkVftHElZ6
	 ROVgovyCo/NHLDCCOt/LQppy73+mcfDEXHq8iJho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 921D7F805B6; Wed, 26 Jun 2024 18:02:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D86D1F804F2;
	Wed, 26 Jun 2024 18:02:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBE64F80423; Wed, 26 Jun 2024 18:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp47.i.mail.ru (smtp47.i.mail.ru [95.163.41.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7E5EF800E4
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 18:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E5EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Rb/DfagM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=+4L+aoviuewCB9omo/DsrXB1B/JwKXRXhHS412MaR/M=; t=1719417711; x=1719507711;
	b=Rb/DfagMIWHHgG+IX44aSxZBoiu278Yr5ijF23lrOyawklWRUPhutSXoWADdBQoMc/1PZTG8gPW
	rEPUjanzIxNY4LErx6lL5mJMBzfUgVaDQV/F/I14d80BgETtMFk8NtO5dvxVVwkIp2rfyyQWLhGAn
	2sSQRQBGPjf1wp6SroeVKXZ9DSFd6t23DevfgR2SF/eL+k7EbBZ/1bS/8HkzJtz4sKaLJwtzB1sYw
	4tH8WaPK6wi9mOyEY44yvHyC7DNI/OKrp+eAhCihHVeuWXGI6wNrC4owv0UPkZKsrJ8novg/DJmPb
	uAYnJAfCTXTJLv2IhEISUFKIQsIgBHNpjxmA==;
Received: by exim-smtp-84f7fbf7d8-xws4d with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1sMV5e-000000000rh-3wQ5; Wed, 26 Jun 2024 19:01:47 +0300
Message-ID: <61bd9289-1ad4-40f6-94c3-1b10dc7f1a13@inbox.ru>
Date: Wed, 26 Jun 2024 19:01:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add master clock handling for nau8824
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, John Hsu <KCHSU0@nuvoton.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240626145931.25122-1-fido_max@inbox.ru>
 <8b6198e7-f82f-46ce-a126-972191c347c4@sirena.org.uk>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <8b6198e7-f82f-46ce-a126-972191c347c4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: exim-smtp-84f7fbf7d8-xws4d;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD99270B3E0DC24D31F7A6FF83E609CEE73CD1A9AD03BE1FF10182A05F5380850401EA75908F9D031693DE06ABAFEAF6705CEA613E07DE41E16BCEF1FCD5BF8CC87CFEC41F7248C3CD5
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BF6699A3AA9BACA6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372BE3E2E75E3847F48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8082199418765B0CBED2DFD256DC6EA0CF73C6075B803342A20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C01A0BB1A02D89336B8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8989FD0BDF65E50FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F7900637F09814068C508CC822CA9DD8327EE4930A3850AC1BE2E735444A83B712AC0148C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 
 0D63561A33F958A5C7BBC09C4F8844FF5002B1117B3ED6968E1D22B648F3D612FB820E9FE7BD014C823CB91A9FED034534781492E4B8EEAD5DF1C2DF01CE7211BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3488E5CD2E691F5566BC21D74A8261C325291A1F2FDEBB9B8FD39004B08049085D93BF6B3AC03483491D7E09C32AA3244CD7E50F55A2B328E577DD89D51EBB7742CADA0FFAA1A907B2EA455F16B58544A284C01B66AE49484A5DA084F8E80FEBD3498BCAF62EB65D490083D0702184784583DB18EBE73F7D69
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLaF05p8kWoqQMBhpGJ2ZBw==
X-Mailru-Sender: 
 689FA8AB762F7393C6D0B12EA33CAA9B4AB9B5CB7CA700A3AAFC94A4184A5FA14A93E9160197D11F90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Message-ID-Hash: OCHXD4RONP2TKOT2R3NLFMLWUXTKTEVJ
X-Message-ID-Hash: OCHXD4RONP2TKOT2R3NLFMLWUXTKTEVJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCHXD4RONP2TKOT2R3NLFMLWUXTKTEVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

26.06.2024 18:32, Mark Brown wrote:
> On Wed, Jun 26, 2024 at 05:59:28PM +0300, Maxim Kochetkov wrote:
>> nau8824 has external MCLK pin. So add enable/disable external clock
>> management.
> 
> You appear to have sent two copies of this series - what's going on
> there?

So sorry about that. It was miss click.
