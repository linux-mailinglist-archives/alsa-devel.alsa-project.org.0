Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F166743760
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 10:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B8986F;
	Fri, 30 Jun 2023 10:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B8986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688114146;
	bh=9b9leFalzk0V4sPrxJT2oF+eZIlrAcwt7fvPjR9EfWo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fdrOKTm2mWBKHWBounx/ujfylaB7GNjMRKwOimZwLctJ7ogrBfTnkMoeu3zrjUmAG
	 zY/ekj4w1lU1dyaEJmkLQFPF1eN9ZbLr+taJVaHZpJjvBIuXloPtv/SHOFu4/YzRbH
	 vVfesAHdA9F+n1CnkT3kNa0v2BRzgbNHbVjOCBok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B08F2F805A1; Fri, 30 Jun 2023 10:33:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CC29F805A1;
	Fri, 30 Jun 2023 10:33:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D320F80246; Fri, 30 Jun 2023 03:57:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACA06F80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 03:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA06F80169
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0DD8124DE30;
	Fri, 30 Jun 2023 09:57:04 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:57:04 +0800
Received: from [192.168.125.93] (183.27.97.206) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:57:03 +0800
Message-ID: <0312262c-28c0-9445-c6f7-2079a57db8c7@starfivetech.com>
Date: Fri, 30 Jun 2023 09:57:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
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
 <20230626110909.38718-2-hal.feng@starfivetech.com>
 <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QL36ZZLE7UUTAP2G3GZMZLBND5XKVD62
X-Message-ID-Hash: QL36ZZLE7UUTAP2G3GZMZLBND5XKVD62
X-Mailman-Approved-At: Fri, 30 Jun 2023 08:33:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QL36ZZLE7UUTAP2G3GZMZLBND5XKVD62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Jun 2023 17:34:56 +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:09, Hal Feng wrote:
>> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
> 
> ...
> 
>> +required:
>> +  - compatible
>> +  - "#sound-dai-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pwmdac-dit {
>> +        compatible = "starfive,jh7110-pwmdac-dit";
>> +        #sound-dai-cells = <0>;
> 
> BTW, I don't see any resources here. Neither in the driver. I think you
> just added this for driver, not for a real hardware.

Yes, this is a dummy PWM-DAC transmitter as described in the title. The
StarFive JH7110 PWM-DAC module doesn't need a hardware codec, but a
dummy codec is needed for the driver.

For a similar implementation, you can refer to
sound/soc/codecs/spdif_transmitter.c

Best regards,
Hal
