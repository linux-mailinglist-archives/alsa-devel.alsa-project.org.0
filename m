Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1568812C9
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 14:58:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53A5C1914;
	Wed, 20 Mar 2024 14:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53A5C1914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943139;
	bh=mACvWHc/sDSGl1pEWdfQ6+2WTvuB/H3LPCOT9PEacq4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JXmFE/Dpvf9gu3iV4LN0NFj7yJcCbMyE9qxIRlSMpYM9gynv5iYovMwqLg6HKHO4Y
	 GkxsZTmSgRO8Kjg+c8jVAMfplQm0fXZdz7FyH5BW5u8rmY2G/w1t9PFn/C5LUzT22G
	 ajGZpd/SEZz+Cc+p75ws3ObvTvxYyghjcGI/LrGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91D53F805B5; Wed, 20 Mar 2024 14:58:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9045F805B5;
	Wed, 20 Mar 2024 14:58:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B996F804E7; Sun, 17 Mar 2024 15:30:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91758F8025F
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 15:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91758F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=o04TGxXH
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 46CC2120006;
	Sun, 17 Mar 2024 17:29:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 46CC2120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710685797;
	bh=U7iGhIFEEZJr2pptTT9ef5adqscsVQVXDtlJaym04/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=o04TGxXHCIs+xdCGFZjuqAqJVDHx6+acGPFOJSTYaI6LnxXuT8PcQ2yvRfSAbQQIk
	 4meOHYBpCBtgy/6fctGtrJgHf9RoHbQC5eYtno1SL599F8tytgg/CiwhCp8Osay7L9
	 Fic1MUlA5kG6N9L8C5c8T1boCun87MWSgBEP5oNEUUhBfjk/xX7tJvibi212XHDZqB
	 kgeVfleDZbV3+LhqdLQKJr06dAulZcGzbggyE5O2wYng6Y4wBesR6mKm1yxL4aMynW
	 OVCBmur3qSylI22aidgBK/5UDVhbBzQZBBzNmjILssrsGHJQV25KrvxHzWRuz+Kvr0
	 WFngVLFSl9yvg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 17:29:57 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 17:29:56 +0300
Message-ID: <5a541ea3-ac4b-4606-9b6a-b103084b30b5@salutedevices.com>
Date: Sun, 17 Mar 2024 17:29:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/25] ASoC: dt-bindings: meson: g12a-toacodec: add
 support for A1 SoC family
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
 <20240314232201.2102178-9-jan.dakinevich@salutedevices.com>
 <f91ea77c-8170-4ae6-850f-3d5715d83855@linaro.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <f91ea77c-8170-4ae6-850f-3d5715d83855@linaro.org>
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
Message-ID-Hash: FGP3GW46EC7QZUEAJLVFSPR6ZCIDAA23
X-Message-ID-Hash: FGP3GW46EC7QZUEAJLVFSPR6ZCIDAA23
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:57:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGP3GW46EC7QZUEAJLVFSPR6ZCIDAA23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I mean the following... This commit adds new defines to
meson-g12a-toacodec.h header. These defines are used in the following way:

sound-dai = <&toacodec TOACODEC_IN_A>;
sound-dai = <&toacodec TOACODEC_CAPTURE_OUT_A>;

So, can you make an advise how to call something like "&toacodec" to
which I declare new parameters.

On 3/15/24 12:58, Krzysztof Kozlowski wrote:
> On 15/03/2024 00:21, Jan Dakinevich wrote:
>> Add "amlogic,t9015-a1" compatible string and new device tree phandle
>> options.
> 
> I don't understand the second part. You did not add any options, no
> phandles. You added some defines for something, so say what are these
> "something".
> 
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  .../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml     | 1 +
>>  include/dt-bindings/sound/meson-g12a-toacodec.h              | 5 +++++
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
>> index 23f82bb89750..c47604aa590f 100644
>> --- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
>> @@ -26,6 +26,7 @@ properties:
>>        - items:
>>            - enum:
>>                - amlogic,sm1-toacodec
>> +              - amlogic,a1-toacodec
> 
> Keep alphabetical order. Don't stuff new entries to the end...
> 
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Best regards
Jan Dakinevich
