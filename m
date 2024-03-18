Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C08812DB
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37AFF2340;
	Wed, 20 Mar 2024 15:03:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37AFF2340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943424;
	bh=QVvPe8HqF/hEu0sn46LH7OPfrbqHYTjl9rmwiW8KbI4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MDm+KdmIJeWlVCgWg5FE1Vkuj68RkDWGTAzmwuLJCj12IJxqKGtaAFKsTvjbYe0bJ
	 4U2jddYzhtF9IIV9t1UrhfCllOS0XjsacS3s2BtJ/RL13GznYVvD6piSZiQpPzJLYd
	 QcGubDNG2UvgxA7lPd2oZ64Vqr5yieuRAiV/LTh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3690FF8079B; Wed, 20 Mar 2024 15:00:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC9FF80805;
	Wed, 20 Mar 2024 15:00:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E55ABF804E7; Mon, 18 Mar 2024 23:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BC5FF8010B
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 23:44:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BC5FF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=WlS06RNI
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6A2F1100011;
	Tue, 19 Mar 2024 01:44:06 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6A2F1100011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710801846;
	bh=pa+89jrrCMIW8EjfG4aAgry+/vfLF62TIUqpulm7Y9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=WlS06RNIBTg0cU271+LYNhxdIVW8REnQkfL0Eq7bHWiEE2NaTUtuoRzgcod99PVOu
	 90XcrVazKIOpMrrn2Lj5waYPR3pBMpoyE/svDsna6Hn/ncEAfIi4zZg45J34L38rKP
	 lVo4tRAfocFgZCrdouhaItZsCLKbBfZq89MVAWFQJgD6s6aIvAf1uPVna8WJxugmor
	 mr6LDxYqk7REZoeeNrR4tv0MyJNkhX43aJ/+u2MHK2TfgTH/luXpJhpJbSgoUEi8Ou
	 ViJNVVN54rulbLvS7z84IQ4pLJeCbFV/tkIbru90+UwDb6C7lz+ie/jrcPfO/9lnvd
	 wZ99a9nIdhl9w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 19 Mar 2024 01:44:06 +0300 (MSK)
Received: from [172.28.64.112] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 19 Mar 2024 01:44:05 +0300
Message-ID: <bafa1669-e98f-4d45-b5cc-0c707df5ed52@salutedevices.com>
Date: Tue, 19 Mar 2024 01:43:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/25] ASoC: meson: t9015: add support for A1 SoC family
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
 <5f8e8cd2-f9c4-4961-a85d-a0f3217294e6@sirena.org.uk>
 <c4c0e3a3-eaa8-42c6-bbd3-e5c6993dc63b@salutedevices.com>
 <30dadd4c-de10-43a7-baf8-8ddd49f5c80e@sirena.org.uk>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <30dadd4c-de10-43a7-baf8-8ddd49f5c80e@sirena.org.uk>
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
 {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to},
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
Message-ID-Hash: Y6BABE36MQSI7BL2HK4G7IUVUNEKMDBK
X-Message-ID-Hash: Y6BABE36MQSI7BL2HK4G7IUVUNEKMDBK
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:58:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6BABE36MQSI7BL2HK4G7IUVUNEKMDBK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/18/24 16:48, Mark Brown wrote:
> On Sun, Mar 17, 2024 at 07:27:14PM +0300, Jan Dakinevich wrote:
> 
>> Both mic bias and ADC's input mode depends on schematics and should be
>> configurable. What is the better way to give access to these parameters?
>> Device tree?
> 
> Yes.
> 
>>>> +	SOC_SINGLE("ADC Mic Bias Switch", LINEIN_CFG, MICBIAS_EN, 1, 0),
>>>> +	SOC_ENUM("ADC Mic Bias Level", a1_adc_mic_bias_level),
> 
>>> Why would micbias be user controlled rather than a DAPM widget as
>>> normal?
> 
>> Yes, I could use SND_SOC_DAPM_SUPPLY, but it supports only raw values,
>> and doesn't supports enums. Here, I want to use enum to restrict
>> possible values, because only these values mentioned in the
>> documentation that I have.
> 
> A supply is an on/off switch not an enum.  Users should not be selecting
> values at all.

Ok. For me it is great if I am free to move these kcontrols to device tree.

-- 
Best regards
Jan Dakinevich
