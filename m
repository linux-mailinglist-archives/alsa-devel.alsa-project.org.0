Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBD66ED04D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 16:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C76BF66;
	Mon, 24 Apr 2023 16:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C76BF66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682346448;
	bh=c7DHJOkQW88fnIpJvGmrfst6KPi0Ad81XxnWVE3nZzg=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=A3xD76YbhINa/XIQar1vSOkVttnIMNSPej+zC6+QIlDAqVaEGOP28/AwXlBQ1Qkhx
	 p0drQpk3K2RdtB1xzuf1u5vEbwhG5qsuC7iknOwutUxvWDATIuIToh8IMWQy+u/J3d
	 xpgy4dWiLcCJ0kLxplKNmHUefbyuzHDmSQcT0y6k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 613BDF8053B;
	Mon, 24 Apr 2023 16:25:45 +0200 (CEST)
Date: Mon, 24 Apr 2023 08:07:46 +0300
Subject: Re: [PATCH v2] ASoC: max98090: make it selectable
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org
References: <20230421211950.20972-1-fido_max@inbox.ru>
 <0a2eca07-f266-164c-4a9f-f1000ae4efbc@linaro.org>
In-Reply-To: <0a2eca07-f266-164c-4a9f-f1000ae4efbc@linaro.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 24 Apr 2023 14:25:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBEBJRRV6YJ5H4ZJ467UUBB2HY3QCQ3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168234634459.26.1145154915470924001@mailman-core.alsa-project.org>
From: Maxim Kochetkov via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, shumingf@realtek.com, ryans.lee@analog.com,
 herve.codina@bootlin.com, wangweidong.a@awinic.com,
 ajye_huang@compal.corp-partner.google.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7E9AF8018A; Mon, 24 Apr 2023 07:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F37DF80137
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 07:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F37DF80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=E9nWluW5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=D97O2zjKCLkxW2B/145nKdu1Mzrxu55I4Ti5/wkQD1I=;
	t=1682312874;x=1682402874;
	b=E9nWluW5jw0AewtBMixO3/E2hUZzcWX1KLsnEkLbnYTa6vw1wiklO7ZL/+CyFhEPwlVttUxTdNuE9b1I5rxYQd9pOGa7G3J8etbiFp8Ehd/ZMD+2UKVjwUc3/UtBMRKuJqY0R5guyUgZkbqvQefG+NJw4B1xyISnKn4hgS8XTCf5+6tr3Vg0pzzm1DQun6n/moo25+G2Zo1BhabkQ2Qk8zTMHRWlRXl+oJ2kfd/inXPPoiXvM958GRY6ztlPGFNyfMFTlvQXcXIy939Yd7/Fjazp/dEh4xPyCYngO8vaKtrXULbslEYAowWK/Kjt+wYu9IYAUmKyvSW0TicFGAJlTg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1pqoQW-0007Vt-T5; Mon, 24 Apr 2023 08:07:49 +0300
Message-ID: <7fdf1f95-a9bb-8560-729c-b12bee302376@inbox.ru>
Date: Mon, 24 Apr 2023 08:07:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ASoC: max98090: make it selectable
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org
References: <20230421211950.20972-1-fido_max@inbox.ru>
 <0a2eca07-f266-164c-4a9f-f1000ae4efbc@linaro.org>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <0a2eca07-f266-164c-4a9f-f1000ae4efbc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD9D2463843EA06979DD5780B9AB69B52B2C5C1FF211AD77DF4182A05F53808504095D3117AAF53475C8F7F332B3471583B3A02D8E5F880BB11CB41373429551B58
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FBCED7D376B82B5EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BB680D3A894950458638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D840F0EE7A3A5969AFEDE650467819DBEF6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE0AC5B80A05675ACDC26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B09CDF8F23AD6196DA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CDDB9BF3B882869D543847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A54EE8C99C65B2DEB13A4702118910BE7FB77B1E833D877848F87CCE6106E1FC07E67D4AC08A07B9B0CE135D2742255B35CB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34F05B761BB9C2AA449D340A1D3288F47D1AB0EB90A9776D23601C01C512D2F4DB92514C9C58CBDD911D7E09C32AA3244CA1A546AD50BBA0E5F7A423A7C2989DB705AB220A9D022EBC0D282625F6E20647
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj8e+LbpfNszEqxiCUTM679w==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF54D6B136482AA6E18C0A1EA27AEA2984C98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QBEBJRRV6YJ5H4ZJ467UUBB2HY3QCQ3W
X-Message-ID-Hash: QBEBJRRV6YJ5H4ZJ467UUBB2HY3QCQ3W
X-Mailman-Approved-At: Mon, 24 Apr 2023 14:25:41 +0000
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, shumingf@realtek.com, ryans.lee@analog.com,
 herve.codina@bootlin.com, wangweidong.a@awinic.com,
 ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBEBJRRV6YJ5H4ZJ467UUBB2HY3QCQ3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 23.04.2023 11:22, Krzysztof Kozlowski wrote:
> On 21/04/2023 23:19, Maxim Kochetkov wrote:
>> There is no way to select max98090 from menuconfig right now.
>> Add a Kconfig menu description to allow building the driver standalone.
>> It will allow this codec to be used by any other I2S master without
>> adding extra sound card entry in Kconfig.
> 
> For your sound card, you need extra sound card entry in Kconfig.

Ok. But why do we allow some other codecs to be selectable?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.3-rc7&id=24ae67c582500
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.3-rc7&id=99afc8df8b6f2
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.3-rc7&id=3ac9ce8858ae3


