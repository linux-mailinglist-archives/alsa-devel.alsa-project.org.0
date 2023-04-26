Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD96F2ED9
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:45:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2B61759;
	Mon,  1 May 2023 08:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2B61759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923540;
	bh=PDoAuTtTE7b3I7ka4def2PN916iDup771G8+Sqx6ZJs=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=fMUeT7iGiVFXpwDvmwA137NsgCkV9/vHrTBrMthggUds4DrRbQyX22BX+Uvriqdmq
	 d1R4lNF0k55iHmRKMGEUGIMj6GCvuqkfFsCj1hTiaVf5PN0nbH68qYumCmxfXpkipf
	 r/bNiax5Ubyqllfv5+f8NbuYBQWgAg+l+6lIIlJQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93339F805BB;
	Mon,  1 May 2023 08:40:46 +0200 (CEST)
Date: Wed, 26 Apr 2023 14:32:15 +0300
Subject: Re: [PATCH] ASoC: dwc: add reset support
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <20230421193319.14066-1-fido_max@inbox.ru>
 <20230426075735.GE4724@pengutronix.de>
In-Reply-To: <20230426075735.GE4724@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEXOCPN6HP4CJ23HOHHAMQ42BIPYCJOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168292324583.26.17754677569196564451@mailman-core.alsa-project.org>
From: Maxim Kochetkov via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AE44F8025E; Wed, 26 Apr 2023 13:32:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DC06F800AC
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 13:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC06F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=lauevXXm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=pxeqg3AHTV+8IXGwaO3NYlcKzuBDaOWNCJ42yBu5J8I=;
	t=1682508740;x=1682598740;
	b=lauevXXmaOqylPQLRTq9U3RMKQxWusgYRcmxPTDlFy/EXxpAGVK7o2iyhkB7EzVKewn0kxTdlSDS1sqLx3TM1ygMPIZlI7GZTBruIyAyc9I35XuImof/tb4U9RuYUowemulb+fSf7un1/we2XASeo8jJDHKOhr65a3M7EhqBipQ9rMmb6fyIcI8NhFT2T9yb9V43uVuZgG4+Wc4q3rI1jCxuz9P24ivjtrdrEROxQ6wEg3XzmOj0EMVyVy7zHr0uhfnAdA8DCDYhsR3PWv8EhyGkCUwGtgbbNKfZYpBCp7+OoUokcx92d1+yVlMRiv10C/cyS1IqYy4bb6AS3wSHBg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1prdNg-0008ID-7W; Wed, 26 Apr 2023 14:32:16 +0300
Message-ID: <14d0f4ac-6b18-500d-3b5a-5b8ea660bd08@inbox.ru>
Date: Wed, 26 Apr 2023 14:32:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: dwc: add reset support
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <20230421193319.14066-1-fido_max@inbox.ru>
 <20230426075735.GE4724@pengutronix.de>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230426075735.GE4724@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 
 4F1203BC0FB41BD9D2463843EA06979DE23325B7280796A2740FA2079F73D3CB182A05F538085040F98E536E8D8D5987C396D3CBF856326D202B01D93D5A838B8F5EA1A153A80C0B
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D99F96657F58F1038638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D810F84172D4EB2573D53C0E1A0FD09C186F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7B857F55CE090FEC39FA2833FD35BB23D9E625A9149C048EE38D4DC57D478E688C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B74D777F676D12575A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE0F3BA37685B2B9043847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A5D5E6AB1FF3D900F41C4CFBB9C85FAAE9298C2AB1F70652C0F87CCE6106E1FC07E67D4AC08A07B9B06A1CB4668A9CA5FACB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF8AB29F95B2A19C07D96AE0E1953380BCE3FFB58D7A9CD7D898A06B141617B0DE2DF5FAC740BFE7CD1FA6BE4777234A25A986C529AEC62ADFD13DC29F6BCCF96C0CB5B17375C3CAE6
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojfBa2JodlKEW7cjzn1gkwFg==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF55D932250086B873E7611539958D05B5598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IEXOCPN6HP4CJ23HOHHAMQ42BIPYCJOX
X-Message-ID-Hash: IEXOCPN6HP4CJ23HOHHAMQ42BIPYCJOX
X-Mailman-Approved-At: Mon, 01 May 2023 06:40:39 +0000
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEXOCPN6HP4CJ23HOHHAMQ42BIPYCJOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 26.04.2023 10:57, Philipp Zabel wrote:
> Hi Maxim,
> 
> On Fri, Apr 21, 2023 at 10:33:19PM +0300, Maxim Kochetkov wrote:
>> Some SoC may have resets for I2S subsystem. So add optional reset
>> deassert at startup.
>>
>> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
>> ---
>>   sound/soc/dwc/dwc-i2s.c | 9 +++++++++
>>   sound/soc/dwc/local.h   | 1 +
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
>> index acdf98b2ee9c..8c8bc7116f86 100644
>> --- a/sound/soc/dwc/dwc-i2s.c
>> +++ b/sound/soc/dwc/dwc-i2s.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/io.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/module.h>
>> +#include <linux/reset.h>
>>   #include <linux/slab.h>
>>   #include <linux/pm_runtime.h>
>>   #include <sound/designware_i2s.h>
>> @@ -648,6 +649,14 @@ static int dw_i2s_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dev->i2s_base))
>>   		return PTR_ERR(dev->i2s_base);
>>   
>> +	dev->reset = devm_reset_control_array_get_optional_shared(&pdev->dev);
>> +	if (IS_ERR(dev->reset))
>> +		return PTR_ERR(dev->reset);
>> +
>> +	ret = reset_control_deassert(dev->reset);
> 
> Since this is a shared reset control, matching reset_control_assert()
> calls are required in the subsequent error paths and in dw_i2s_remove().

Sure. Will update in v2
