Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AAA8812CD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:00:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B0F31944;
	Wed, 20 Mar 2024 15:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B0F31944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943235;
	bh=VoSqNLYv2i0ZbSLZdhqqHqA7Sr+JNd2dFFiH2pYAt6I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Om6uJX2OXHaGETO8Cj9LU3EH5tVTPwbUYsXttqNvBICdufj6k1lnlnMj036Lsmfby
	 RKeJDfC7w8quw1AaCOBc20zmiOW2PaUcpp8g9zEllRso2sEWnl7BV3xSuyXXBUVBK2
	 Ll4EPvkb1m9k1eaEnMDugHJbAf/0iFjpCGnjJYk4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3593AF805A8; Wed, 20 Mar 2024 15:00:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C5ADF805A1;
	Wed, 20 Mar 2024 15:00:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8198EF804E7; Sun, 17 Mar 2024 16:20:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB4B5F80088
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 16:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB4B5F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=Z4kUHGOp
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7F206120006;
	Sun, 17 Mar 2024 18:20:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7F206120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710688819;
	bh=V0nv3zgvdKj1Lp4YbBHZoSBadq2eA8+xFKoUJSBsE9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Z4kUHGOpgIiCzFmKxPX172UziPQP3MmtXzVPzlvesuZGwluMZX/bjigs7i5+lXJYO
	 6b9FqZ+r6vlAHIU/wzGgGT94z6UfCoYQUXHy1xTxSn2HrLAmTz0ULFYTXfO4LfiOFc
	 9g4taKa3wMlaJe2D6Ef5VK6K0BRWjGOal61J71l3vdKiIeUCeY/wEVD7xdvf7moVIw
	 PXvUnF7/gcArytcKWO4A5rnMV/2ILBDsztpsrjWVROQ4dGjUvvTcvA9veec4CWA4B3
	 BxdjImQ9mx8cJ7OZigIn9MNGcZA5hCaFuXaJDFIQwPfrH4Jr7BO3VQKepAodb78gkQ
	 cNLMfIrTdStog==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 18:20:19 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 18:20:18 +0300
Message-ID: <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
Date: Sun, 17 Mar 2024 18:19:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1 SoC
 family
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
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
 <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
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
 {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to},
 FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
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
Message-ID-Hash: HJQSNMUCDI4Y5PNLWHZKPXLKM3Y7SXN5
X-Message-ID-Hash: HJQSNMUCDI4Y5PNLWHZKPXLKM3Y7SXN5
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:57:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJQSNMUCDI4Y5PNLWHZKPXLKM3Y7SXN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/15/24 16:33, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 02:21:45AM +0300, Jan Dakinevich wrote:
> 
>>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>> -	.reg_bits	= 32,
>> -	.val_bits	= 32,
>> -	.reg_stride	= 4,
>> +	.reg_bits		= 32,
>> +	.val_bits		= 32,
>> +	.reg_stride		= 4,
>> +	.max_register		= TOACODEC_CTRL0,
>> +	.max_register_is_0	= true,
> 
> If the maximum register is 0 how does the regmap have a stride?

reg_stride inherited from existing code. Apparently, it was meaningless
even before my modifications (the hardware has single register
regardless of max_register declaration) and it should be dropped. But,
is it okay to remove it in the same commit?

-- 
Best regards
Jan Dakinevich
