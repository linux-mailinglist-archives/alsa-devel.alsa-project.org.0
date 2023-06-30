Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8374376B
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 10:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31C4784A;
	Fri, 30 Jun 2023 10:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31C4784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688114186;
	bh=tvbli7TtK1Su62y8jiBaK0khetTwzBa7AfE9np0xHyo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ilgvqn+XCenHscCVySLBF/LOOTAc0nnjSHQ7jzW2Z/L10hASm1Kns1eOOJ0orrt9q
	 8xQ/1IvbypijqQBOSCKACuwyG/2lczMsATZUrkNIBeiSbDVKnpVW1cT6D3ojyn0Uwm
	 eHcmBQRxfENqa9AAjLBJmx8CAxfXcHPQ/pF5RCIE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27144F8056F; Fri, 30 Jun 2023 10:34:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BD6EF8056F;
	Fri, 30 Jun 2023 10:34:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76757F80246; Fri, 30 Jun 2023 04:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B341F800E3
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 04:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B341F800E3
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 19FE824E245;
	Fri, 30 Jun 2023 10:12:07 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 10:12:07 +0800
Received: from [192.168.125.93] (183.27.97.206) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 10:12:06 +0800
Message-ID: <16813f18-2188-ad9d-9c06-6bbc845b9d99@starfivetech.com>
Date: Fri, 30 Jun 2023 10:12:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 5/5] riscv: dts: starfive: Add JH7110 PWM-DAC support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-6-hal.feng@starfivetech.com>
 <2a0154ec-7949-f1b1-760f-3ba64d2cff3f@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <2a0154ec-7949-f1b1-760f-3ba64d2cff3f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BXBISFK2AFOXBY4YBJ4EBSCTQT5OQIVU
X-Message-ID-Hash: BXBISFK2AFOXBY4YBJ4EBSCTQT5OQIVU
X-Mailman-Approved-At: Fri, 30 Jun 2023 08:34:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXBISFK2AFOXBY4YBJ4EBSCTQT5OQIVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Jun 2023 17:37:35 +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:09, Hal Feng wrote:
>> Add PWM-DAC support for StarFive JH7110 SoC.
>> 
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         | 50 +++++++++++++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 13 +++++
>>  2 files changed, 63 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index 19b5954ee72d..5ca66a65e722 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -36,6 +36,34 @@ gpio-restart {
>>  		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
>>  		priority = <224>;
>>  	};
>> +
>> +	pwmdac_dit: pwmdac-dit {
>> +		compatible = "starfive,jh7110-pwmdac-dit";
>> +		#sound-dai-cells = <0>;
>> +	};
>> +
>> +	sound {
>> +		compatible = "simple-audio-card";
>> +		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		simple-audio-card,dai-link@0 {
>> +			reg = <0>;
>> +			format = "left_j";
>> +			bitclock-master = <&sndcpu0>;
>> +			frame-master = <&sndcpu0>;
>> +			status = "okay";
> 
> Drop

OK.

> 
>> +
>> +			sndcpu0: cpu {
>> +				sound-dai = <&pwmdac>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&pwmdac_dit>;
> 
> You said it is a transmitter, not a codec...

It is a dummy codec, also known as a dummy transmitter.

Best regards,
Hal
