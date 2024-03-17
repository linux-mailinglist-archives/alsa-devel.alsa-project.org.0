Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 190F48812D2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98CE4192C;
	Wed, 20 Mar 2024 15:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98CE4192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943302;
	bh=gmZqrtyjjwD9R4sglF2+1zq31ebpUlWiHqXoiN/atwI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UYC0pmhlVj1BIODiafdwKiJ5+jrP7uOCMFSqqIevBO6aloVWwkmtXeOWHanYjz+q6
	 JYXoyGU+QABZzOfdAKRWYUkflLSWoOY5529QnYL2QHj1pPU3erqk2odL1CnMskDtpB
	 0SSpXPnjSaYQ5M4rXv7eILybxBBWsBzOlE/KzEps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75699F80563; Wed, 20 Mar 2024 15:00:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDCEDF80636;
	Wed, 20 Mar 2024 15:00:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54D89F804E7; Sun, 17 Mar 2024 17:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B683CF8025F
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 17:35:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B683CF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=Ara94oKz
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9E21D100003;
	Sun, 17 Mar 2024 19:35:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9E21D100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710693349;
	bh=Ho5gEdZl2vZzSp+HXgGh6i6bfV8nU1CpEhQEWuG2/+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Ara94oKz7OXqeuBEALrfmD21Q7S2/FkFqw9Rm4p1sWOnZzgnr1kRs62lsXW1DO7ok
	 wu+D+HmHLdD6ji8551aC9cvT/8hgancPp+ia70XsCCIz6BMnQXJl/eXHf2Lxh0rFVm
	 97LlkfOIS0UrIiP67Bji/8E5MyAa3++cbccunkLwfKx+I3E2wnPpWrcjOpgYlxO5FU
	 psBttpHSrNxMsYt3RXhy2z4rNOl72SERA9vopOkTg6XaOar25tzy6d+pLHKHyh61++
	 NGnhmG/bL2V8/zvLGsSGeR+/dwv1SxixreFtfha++c4DlLD7uZZdB8ieCblfJxpV1V
	 c0Y81H3ervWxA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 19:35:49 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 19:35:48 +0300
Message-ID: <54e924ae-4d45-4337-aeae-32eebe773b63@salutedevices.com>
Date: Sun, 17 Mar 2024 19:35:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/25] ASoC: dt-bindings: meson: axg-pdm: document
 'sysrate' property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
 <827c4f17-043e-4e09-aea6-0fee22d1b234@salutedevices.com>
 <16a22924-054d-4d50-9f32-cc07c0bbbdf4@linaro.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <16a22924-054d-4d50-9f32-cc07c0bbbdf4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
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
Message-ID-Hash: O4XVWJT6JWG6HJPQAVYKIUAE3GRWSDHP
X-Message-ID-Hash: O4XVWJT6JWG6HJPQAVYKIUAE3GRWSDHP
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:57:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4XVWJT6JWG6HJPQAVYKIUAE3GRWSDHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/17/24 19:27, Krzysztof Kozlowski wrote:
> On 17/03/2024 16:55, Jan Dakinevich wrote:
>>
>>
>> On 3/15/24 13:00, Krzysztof Kozlowski wrote:
>>> On 15/03/2024 00:21, Jan Dakinevich wrote:
>>>> This option allow to redefine the rate of DSP system clock.
>>>
>>> And why is it suitable for bindings? Describe the hardware, not what you
>>> want to do in the driver.
>>>
>>
>> What do you mean? I am adding some new property and should describe it
>> in dt-bindinds. Isn't it?
> 
> No, if the property is not suitable for bindings, you should not add it
> in the first place. So again: explain what sort of hardware, not driver,
> problem you are solving here, so we can understand why do you need new
> property. Otherwise use existing properties or no properties, because we
> do not define all possible clocks in the bindings.
> 
> Let's be clear: with such commit msg explanation as you have, my answer
> is: no, driver should set clock frequency and you do not need this
> property at all.
> 

Could you please take a look on answer to "Jerome Brunet
<jbrunet@baylibre.com>"'s message on the same thread. There, I am trying
to explain what I am solving by this commit.

I would be happy to avoid this w/a, but currently this is the best I
came up with.

> Best regards,
> Krzysztof
> 

-- 
Best regards
Jan Dakinevich
