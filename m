Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8356F2ED8
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:45:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C39B1788;
	Mon,  1 May 2023 08:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C39B1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923522;
	bh=wxxMd/DXotqkcWya9QRJO2Hkzm7Z2hDzwKdIBy1J+RI=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=MR2huze/BHbXRRwxxJOJ73cfClRUSZlRq1tjJz7ggpgLGTr/1HEWD1ioDzN2pECBK
	 p6iBHkk8fY2RQ/CfzlOh++UhfofeDAlW8IvyeqBrwdiYZaefCs5DcH7YFMfT66Axnd
	 FRwEcuTFeAj/GZY7tFwHZElkrGL9GuJPswzPh51E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 352F6F805B4;
	Mon,  1 May 2023 08:40:45 +0200 (CEST)
Date: Wed, 26 Apr 2023 14:31:42 +0300
Subject: Re: [PATCH] ASoC: dwc: add reset support
To: Mark Brown <broonie@kernel.org>
References: <20230421193319.14066-1-fido_max@inbox.ru>
 <b43effb0-0473-4580-afc3-e9652f821bdd@sirena.org.uk>
In-Reply-To: <b43effb0-0473-4580-afc3-e9652f821bdd@sirena.org.uk>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 01 May 2023 06:40:39 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJDKYKQBNSZQWQAWKN327HMGWQGBJ2MV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168292324442.26.3703149012963143495@mailman-core.alsa-project.org>
From: Maxim Kochetkov via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7038DF8025E; Wed, 26 Apr 2023 13:31:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6010F80104
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 13:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6010F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=QCzbA83/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=bFG+ejcKlnMmhBLr+uxOGE+j/g4t6bKAsDK9pt0GNKw=;
	t=1682508709;x=1682598709;
	b=QCzbA83/+K6IR9vtrg88Z2NbR62jF5F/mwv8kzhx0ldmuBbKYoX1XyZ973zwCSCS4OZUidaya0EGwkP1CPCwFpO0XPUzhKkD8RA6aSGr/Yl4mkSwwnNd04a9NdMl4AyincbsOUiGBa54xaIpmARr64vcL4gbAC4Eley67dMSstYJnitELVfUjPBplsH7kpfp2erMslJOqgXqCMqaQnXhXxDdh0VHFV54WE15rY60TN2fsQsTUdMXPnRhEE87gWdxBPhqcvwsVSO5BYpaY2JOlck1DSq5dx6O6ebh03XEtf85NVKS9eIkYig5kMXBo5znd5eUMGzT+1RpQYN9t1y8YA==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1prdN8-0007z4-Ro; Wed, 26 Apr 2023 14:31:43 +0300
Message-ID: <c39ae02a-cc77-effa-8bd3-9ad1e980757b@inbox.ru>
Date: Wed, 26 Apr 2023 14:31:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: dwc: add reset support
To: Mark Brown <broonie@kernel.org>
References: <20230421193319.14066-1-fido_max@inbox.ru>
 <b43effb0-0473-4580-afc3-e9652f821bdd@sirena.org.uk>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <b43effb0-0473-4580-afc3-e9652f821bdd@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD9D2463843EA06979D8AD5FBD21E588C8E756320A3411BB634182A05F538085040B68CFF2D09618ABC9797C8D19B9090C79DFF4F69CCBA9C528B957E2656AFFE40
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BC08626EA5717D14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374D0D183F14C070BA8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85F664CB22E540D83FE5C1B386AC041636F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7C8BAF20080C1CEC69FA2833FD35BB23D9E625A9149C048EE1B544F03EFBC4D572CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B716A69B0CBCFD959A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE0F3BA37685B2B9043847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A57B24BA733827A75D6A3F6C202C3DDD6E8C312436047AD7B0F87CCE6106E1FC07E67D4AC08A07B9B0CE135D2742255B35CB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFE680244A59DD592AFD5229A1D34CBFA045921B03E41FBBA689DD2CBB976E2E5581545B20770F7F5D1FA6BE4777234A25310A6305A9F720CFBA560E0731E6AED30CB5B17375C3CAE6
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojfBa2JodlKEUnHL3bE2u1jQ==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF5F3BC940DFD455DED042561FF9F86780598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IJDKYKQBNSZQWQAWKN327HMGWQGBJ2MV
X-Message-ID-Hash: IJDKYKQBNSZQWQAWKN327HMGWQGBJ2MV
X-Mailman-Approved-At: Mon, 01 May 2023 06:40:39 +0000
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJDKYKQBNSZQWQAWKN327HMGWQGBJ2MV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 26.04.2023 14:29, Mark Brown wrote:
> On Fri, Apr 21, 2023 at 10:33:19PM +0300, Maxim Kochetkov wrote:
>> Some SoC may have resets for I2S subsystem. So add optional reset
>> deassert at startup.
>>
>> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
>> ---
>>   sound/soc/dwc/dwc-i2s.c | 9 +++++++++
>>   sound/soc/dwc/local.h   | 1 +
>>   2 files changed, 10 insertions(+)
> 
> I'd expect to see a binding update along with this?

Sure. Will update in v2
