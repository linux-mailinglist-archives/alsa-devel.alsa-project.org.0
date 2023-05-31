Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A771A3CA
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:08:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A41E80;
	Thu,  1 Jun 2023 18:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A41E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685635716;
	bh=DmfKfAw6OWSTDBhMHGCC3yNzPph540FY0Qc904L0H7A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xt4rb/1E2NBAvfN4Bl/psmotFlE4pfNoGc8eY3TZcZenrBcNFMpWWbbsHWEyJn1BQ
	 1TLIgNyMqxvKBN7pkIgGZ0xSXF+khMNWRNz8C6mQiErLo2omQ5pJ0/eD+OBHyIsh/j
	 PSAj7msuE3YRv4qayYLggcxSvQS+yluNwhsIcipA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53B4CF8065A; Thu,  1 Jun 2023 18:03:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68051F80199;
	Thu,  1 Jun 2023 18:03:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40331F8042F; Wed, 31 May 2023 08:43:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F0DCF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 08:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F0DCF80149
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8398024DDBE;
	Wed, 31 May 2023 14:42:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 14:42:51 +0800
Received: from [192.168.125.80] (113.72.147.198) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 14:42:50 +0800
Message-ID: <0308ad78-5aec-f51f-41d1-40364d87ddc3@starfivetech.com>
Date: Wed, 31 May 2023 14:42:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230526145402.450-1-walker.chen@starfivetech.com>
 <20230526145402.450-4-walker.chen@starfivetech.com>
 <dbb7ca72-fb21-6cc4-0f10-0f17818689db@starfivetech.com>
 <ed0a36ff-c497-9bb3-05d2-ea93285f4d1d@starfivetech.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <ed0a36ff-c497-9bb3-05d2-ea93285f4d1d@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IYPQBOXIY4C4LP3J7PODTJDWBC7HA7UY
X-Message-ID-Hash: IYPQBOXIY4C4LP3J7PODTJDWBC7HA7UY
X-Mailman-Approved-At: Thu, 01 Jun 2023 16:02:28 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYPQBOXIY4C4LP3J7PODTJDWBC7HA7UY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 May 2023 14:30:19 +0800, Walker Chen wrote:
> On 2023/5/31 14:23, Hal Feng wrote:
>> On Fri, 26 May 2023 22:54:02 +0800, Walker Chen wrote:
>>> Add the tdm controller node and pins configuration of tdm for the
>>> StarFive JH7110 SoC.
>>> 
>>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>>> ---
>>>  .../jh7110-starfive-visionfive-2.dtsi         | 40 +++++++++++++++++++
>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 21 ++++++++++
>>>  2 files changed, 61 insertions(+)
>>> 
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>>> index 1155b97b593d..19b5954ee72d 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>>> @@ -214,6 +214,40 @@
>>>  			slew-rate = <0>;
>>>  		};
>>>  	};
>>> +
>>> +	tdm0_pins: tdm0-pins {
>>> +		tdm0-pins-tx {
>> 
>> Use consistent naming, so
>> 
>> 	tdm_pins: tdm-0 {
>> 		tx-pins {
>> 
>>> +			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
>>> +					      GPOEN_ENABLE,
>>> +					      GPI_NONE)>;
>>> +			bias-pull-up;
>>> +			drive-strength = <2>;
>>> +			input-disable;
>>> +			input-schmitt-disable;
>>> +			slew-rate = <0>;
>>> +		};
>>> +
>>> +		tdm0-pins-rx {
>> 
>> 		rx-pins {
>> 
>>> +			pinmux = <GPIOMUX(61, GPOUT_HIGH,
>>> +					      GPOEN_DISABLE,
>>> +					      GPI_SYS_TDM_RXD)>;
>>> +			input-enable;
>>> +		};
>>> +
>>> +		tdm0-pins-sync {
>> 
>> 		sync-pins {
>> 
>>> +			pinmux = <GPIOMUX(63, GPOUT_HIGH,
>>> +					      GPOEN_DISABLE,
>>> +					      GPI_SYS_TDM_SYNC)>;
>>> +			input-enable;
>>> +		};
>>> +
>>> +		tdm0-pins-pcmclk {
>> 
>> 		pcmclk-pins {
>> 
>>> +			pinmux = <GPIOMUX(38, GPOUT_HIGH,
>>> +					      GPOEN_DISABLE,
>>> +					      GPI_SYS_TDM_CLK)>;
>>> +			input-enable;
>>> +		};
>>> +	};
>>>  };
>>>  
>>>  &uart0 {
>>> @@ -221,3 +255,9 @@
>>>  	pinctrl-0 = <&uart0_pins>;
>>>  	status = "okay";
>>>  };
>>> +
>>> +&tdm {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&tdm0_pins>;
>> 
>> 	pinctrl-0 = <&tdm_pins>;
>> 
>> Best regards,
>> Hal
> 
> OK, I'll update these node's name in the next submit.
> Thanks.

With that fixed,
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal
