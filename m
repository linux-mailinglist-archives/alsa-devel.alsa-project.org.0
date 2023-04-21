Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AA36EB81D
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 10:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F20DAEB8;
	Sat, 22 Apr 2023 10:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F20DAEB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682153500;
	bh=Bf1WlGxjKYpeBrodqqLzb8cnGPyR/q8T/HS+5nRgKIY=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=ZL+jzqUC+MM7CmxqLeCuhtKYlkBZdSXtAzS4DpBHzaQyhx40HZpZ3lN6+UqKRAb4f
	 ybp9MkfxHaS2uasri7hFpl34Xs5JsYxXalyURAKkCcfvPOEXoMW+sH2Yrz6GjNgMnC
	 hIUzxqY0MCUri7vZG49oCWaxwLsIK/A8ESRBWrM4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8006FF80563;
	Sat, 22 Apr 2023 10:49:23 +0200 (CEST)
Date: Fri, 21 Apr 2023 23:51:25 +0300
Subject: Re: [PATCH] ASoC: max98088: make it selectable
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org
References: <20230421200127.16234-1-fido_max@inbox.ru>
 <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
In-Reply-To: <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 22 Apr 2023 08:49:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XI2XMRFNKDNT7TAJKVXYDSHQ63MBEJEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168215336325.26.1613212599408119948@mailman-core.alsa-project.org>
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
	id 302C9F80053; Fri, 21 Apr 2023 22:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A50F6F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 22:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A50F6F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=qmp70oAJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=gYWQBWMvY3UeVDGzDfQaW4i5kJrCK/WuOdMlO8rxDaQ=;
	t=1682110289;x=1682200289;
	b=qmp70oAJnabOdrBWOJB1G1jlpWIlW5KvxWKW3JFWjpItpo9gtxMbGXfWgrxOaFm7CJGyZO3FF2Gy0AIIiG5uN7jHvnKFQqVkZd2sfgyhx2V3mwIOlumlJJf/wrGrMvmdHPvBkIi5uHLQNskL2u9HMAEHbY6vI3uiy5RcfII9VdLjoffKOT2unEqFVSuiIhSkLPqF/Sg+xOsdpiHcv9FWuSq2tSOZCTskQ9gJR2tX2aFNpBFH9X6plLCEyVbuvypYiSNo2+eVgUNQ4GaaAYn0WZA82M4+9p5tK55eWZOhWgsMoPZ69/YOLbQVh9yxYNdvpSNAZbkusbRN4jwRss+2lA==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1ppxj4-0000FU-Cc; Fri, 21 Apr 2023 23:51:27 +0300
Message-ID: <cd7ad36a-49b5-6093-f2b4-419eb6b52dc1@inbox.ru>
Date: Fri, 21 Apr 2023 23:51:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: max98088: make it selectable
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org
References: <20230421200127.16234-1-fido_max@inbox.ru>
 <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 
 4F1203BC0FB41BD9329E3AD3F81E7346387D3835D9BADB5A32C0BBDBEA4BEA0D182A05F5380850404C228DA9ACA6FE27BD2FEC7B2EC480D5653E5B204532638D58489151BCE2FA36B44736AD55C87E7C
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7678D195E6F08FCA2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063750E64749F09C4ED58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86DE6C21C088EE58F4158FC4562CC8F9F6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7BE1F02509D432EA69FA2833FD35BB23D9E625A9149C048EE0AC5B80A05675ACD6FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B406C66621D3021AFA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB24F08513AFFAC7943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A5F79AB08283FB645401EB61BF43D7DD60609991C996F2CC29F87CCE6106E1FC07E67D4AC08A07B9B06A1CB4668A9CA5FACB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3444047AE358B40754C848B4AAA7C94298F42AE5079A4E1827F3BA8FFA4DF087537383AAA13109451F1D7E09C32AA3244C1C063E2E50C00F331095DA26C297F193A8CE788DE68312050D282625F6E20647
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojr0si6YxBz7R/UWAk/9f13Q==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF51296FB2C240DC7E640ABEF79B99D108298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XI2XMRFNKDNT7TAJKVXYDSHQ63MBEJEE
X-Message-ID-Hash: XI2XMRFNKDNT7TAJKVXYDSHQ63MBEJEE
X-Mailman-Approved-At: Sat, 22 Apr 2023 08:49:21 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XI2XMRFNKDNT7TAJKVXYDSHQ63MBEJEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 21.04.2023 23:41, Krzysztof Kozlowski wrote:
> On 21/04/2023 22:01, Maxim Kochetkov wrote:
>> There is no way to select max98088 from menuconfig right now.
>> Add a Kconfig menu description to allow building the driver standalone.
> 
> Just like many other codecs used in embedded designs. Why exactly this
> one should be user selectable, but others not?

I can tell nothing about any other codecs. But this one has no external 
dependencies. I just need to enable it and assign DT node to bring it 
up. So we can let them be user selectable.

> 
> Best regards,
> Krzysztof
> 
