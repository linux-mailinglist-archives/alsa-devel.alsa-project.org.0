Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7C98812D4
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:02:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112741EB;
	Wed, 20 Mar 2024 15:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112741EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943332;
	bh=xrdrLONqXUisegUxaeWCoF7p1xx5KhI42epdweRiOW8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YLQvYDhv/2w3cJjvhMTjuT3yg2oirw5Br/azUn6q2r+EXEgkGB+fdtNyM3jOiyCBE
	 r6lH2RPsR45sMtuHColr1VBdjA914PtZ17yzrzEQ+8gbfWSvQbtySvj9XrcBE8TAG2
	 IrK6YEeMMKSmk4AkpG0Ak/+p4kUDspFb4Wg6gCgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2F7EF8069F; Wed, 20 Mar 2024 15:00:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 115F8F80677;
	Wed, 20 Mar 2024 15:00:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D5EDF804E7; Mon, 18 Mar 2024 00:39:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7683CF80088
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 00:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7683CF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=d2g4D0qY
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7A96D120002;
	Mon, 18 Mar 2024 02:39:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7A96D120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710718787;
	bh=bKsdI1eMZNCKrRBjX4TwkOfAmnVx5pDlExnmUyzw5I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=d2g4D0qYg7zCodKeZgunyPQ2KHFeWySByW3jsDIdDJPoZ45ddkegxgysUiOXg4C4V
	 dKCzGIMi9BrjxQg67RAkFBWIN4xHn8l6Uzhd1hn2Xqy2zDM7RyVemTuTVMJu1a/ww/
	 BmlnccNSzsyV3U6K4jD9fCGzBve5aCH7TNmBFhdfYFDj803QgXT743kOJdiMWYg+v5
	 1itPRU/yii51uY2BbU2auMmX4qV8ZkTEIqANPaliE4gJ1R+RdMRgGOmDib81FFzL0i
	 ETOVXcFgC+4fVWh/MtRgHAdAfBm8HZtpKBkt5p+NQSWWhxf/tC8zXByk80AicK4rgg
	 RAAcvadico93g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 18 Mar 2024 02:39:47 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 18 Mar 2024 02:39:46 +0300
Message-ID: <7d61700d-bfb5-46c6-bd45-a18aecf06a5b@salutedevices.com>
Date: Mon, 18 Mar 2024 02:39:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] ASoC: dt-bindings: meson: t9015: add support for A1
 SoC family
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-12-jan.dakinevich@salutedevices.com>
 <20240317190316.GA2071139-robh@kernel.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240317190316.GA2071139-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
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
Message-ID-Hash: ISF7I7Y6AGGOMFHRMLRZKSA6SOQRCGHO
X-Message-ID-Hash: ISF7I7Y6AGGOMFHRMLRZKSA6SOQRCGHO
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:57:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISF7I7Y6AGGOMFHRMLRZKSA6SOQRCGHO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/17/24 22:03, Rob Herring wrote:
> On Fri, Mar 15, 2024 at 02:21:47AM +0300, Jan Dakinevich wrote:
>> Add "amlogic,t9015-a1" compatible string.
> 
> That's obvious from the diff. Perhaps what does 'a1' mean? What the 
> difference from the existing compatible?
> 

a1 means A1 SoC family. The difference is described in next commit where
this compatible string is added to driver. Should I duplicate here the
explanation from that commit?

>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
>> index 5f5cccdbeb34..ee8bd57dbcf9 100644
>> --- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
>> @@ -21,7 +21,9 @@ properties:
>>  
>>    compatible:
>>      items:
>> -      - const: amlogic,t9015
>> +      - enum:
>> +          - amlogic,t9015
>> +          - amlogic,t9015-a1
>>  
>>    clocks:
>>      items:
>> -- 
>> 2.34.1
>>

-- 
Best regards
Jan Dakinevich
