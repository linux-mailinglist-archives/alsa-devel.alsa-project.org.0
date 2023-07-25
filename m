Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC937617AD
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83B4150E;
	Tue, 25 Jul 2023 13:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83B4150E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690286000;
	bh=9/YvjBPcLH30RK+bbBDWlVYN+1BP0YZqmwCForWIemM=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p0zh+PZkMPpH7OXSToQpRzAHekk5Cfu3RgtztxtviPd8FkxkxNKyflZamgiA3rPbq
	 oTdKlOhh/cLCdQG2EehtPO0razf52tHqJZrraOcUObYo+GLWwdiAZC7Bbf7sSwiMx9
	 xy/YqVBm1ElWf1J2belKChv2BD1sGw+HkjAb/1k4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EC8EF80549; Tue, 25 Jul 2023 13:51:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 326C9F80548;
	Tue, 25 Jul 2023 13:51:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D55DDF8019B; Tue, 25 Jul 2023 10:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A4F9F80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 10:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A4F9F80153
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 90D1C83D4;
	Tue, 25 Jul 2023 16:27:31 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 25 Jul
 2023 16:27:31 +0800
Received: from [192.168.125.84] (183.27.99.135) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 25 Jul
 2023 16:27:30 +0800
Message-ID: <62ddb368-d714-8986-9904-2e44edfb069c@starfivetech.com>
Date: Tue, 25 Jul 2023 16:27:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
From: Hal Feng <hal.feng@starfivetech.com>
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
 <20230626110909.38718-2-hal.feng@starfivetech.com>
 <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
 <0312262c-28c0-9445-c6f7-2079a57db8c7@starfivetech.com>
 <c0244a98-4c91-93d8-a3e4-5210d0b3f205@linaro.org>
 <d046796e-34a0-56e5-a740-6a1fcf41d216@starfivetech.com>
Content-Language: en-US
In-Reply-To: <d046796e-34a0-56e5-a740-6a1fcf41d216@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2KCQB6F4DBMCYD53GVSF244ASIXYHAC5
X-Message-ID-Hash: 2KCQB6F4DBMCYD53GVSF244ASIXYHAC5
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:51:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Jul 2023 11:22:50 +0800, Hal Feng wrote:
> On Sat, 1 Jul 2023 10:17:51 +0200, Krzysztof Kozlowski wrote:
>> On 30/06/2023 03:57, Hal Feng wrote:
>>> On Mon, 26 Jun 2023 17:34:56 +0200, Krzysztof Kozlowski wrote:
>>>> On 26/06/2023 13:09, Hal Feng wrote:
>>>>> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
>>>>
>>>> ...
>>>>
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - "#sound-dai-cells"
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    pwmdac-dit {
>>>>> +        compatible = "starfive,jh7110-pwmdac-dit";
>>>>> +        #sound-dai-cells = <0>;
>>>>
>>>> BTW, I don't see any resources here. Neither in the driver. I think you
>>>> just added this for driver, not for a real hardware.
>>> 
>>> Yes, this is a dummy PWM-DAC transmitter as described in the title. The
>>> StarFive JH7110 PWM-DAC module doesn't need a hardware codec, but a
>>> dummy codec is needed for the driver.
>> 
>> Bindings are no for drivers, therefore with such reasoning the answer
>> is: drop entire binding. If you think otherwise, please give me some
>> more details about the hardware.
> 
> I agreed. I will drop this binding and the compatible in patch 2. Thanks.

Hi, Krzysztof,

Could I use the dummy spdif codec [1][2] which is already upstream? The dummy
spdif codec is really compatible with the one which JH7110 PWM-DAC needed.
They are mostly similar.

[1] Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
[2] sound/soc/codecs/spdif_transmitter.c

In that way, patch 1 & 2 can be dropped and patch 5 will be modified as follows.

+	pwmdac_dit: pwmdac-dit {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "left_j";
+			bitclock-master = <&sndcpu0>;
+			frame-master = <&sndcpu0>;
+
+			sndcpu0: cpu {
+				sound-dai = <&pwmdac>;
+			};
+
+			codec {
+				sound-dai = <&pwmdac_dit>;
+			};
+		};
+	};

Best regards,
Hal
