Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C66D4C14
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:38:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12BA13E;
	Mon,  3 Apr 2023 17:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12BA13E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536321;
	bh=U1bSCWFZ2p1KoyfbCUAzylQhzl56q5YKQC/UB+F+h5M=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UUwFY6Vx2bNsa7ZLEkpPv9Kq5pPYZOMz7wcxxwZ9HeT/4sC1DiIGOP65fAqolA4Cf
	 nihDlg3QAMozje5twHhzvs0bZ7SSEUN1daklnmnaultXOYCUCxQqaaSWuLZ58W2N4/
	 QAzyf3MWcMDU8oVqZ7xs/UXInYjIR7ax4vOJru/w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7FC2F8052D;
	Mon,  3 Apr 2023 17:36:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D36F8024C; Mon,  3 Apr 2023 14:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-7.4 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A43AEF80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 14:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43AEF80171
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4C03824DFFD;
	Mon,  3 Apr 2023 20:17:41 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:17:41 +0800
Received: from [192.168.125.145] (183.27.97.179) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:17:40 +0800
Message-ID: <670fbeaf-334b-b6d7-d48c-0828c5f1d841@starfivetech.com>
Date: Mon, 3 Apr 2023 20:17:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 1/3] dt-bindings: sound: Add TDM for StarFive JH7110
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-2-walker.chen@starfivetech.com>
 <c999da90-1cb9-c767-23bc-c28d37708cf2@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <c999da90-1cb9-c767-23bc-c28d37708cf2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FB2N2U3S25OQ7GSS62BRAJZCYA6NOIGX
X-Message-ID-Hash: FB2N2U3S25OQ7GSS62BRAJZCYA6NOIGX
X-Mailman-Approved-At: Mon, 03 Apr 2023 15:36:51 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FB2N2U3S25OQ7GSS62BRAJZCYA6NOIGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/3/30 15:39, Krzysztof Kozlowski wrote:
> On 29/03/2023 17:33, Walker Chen wrote:
>> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/sound/starfive,jh7110-tdm.yaml   | 95 +++++++++++++++++++
>>  1 file changed, 95 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>> new file mode 100644
>> index 000000000000..d65b9ed781ef
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>> @@ -0,0 +1,95 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-tdm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 TDM Controller
>> +
>> +description: |
>> +  The TDM Controller is a Time Division Multiplexed audio interface
>> +  integrated in StarFive JH7110 SoC, allowing up to 8 channels of
>> +  audio over a serial interface. The TDM controller can operate both
>> +  in master and slave mode.
>> +
>> +maintainers:
>> +  - Walker Chen <walker.chen@starfivetech.com>
>> +
> 
> Missing allOf: with $ref to dai-common.

Indeed missing allOf, thank you for kind reminding.

> 
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - starfive,jh7110-tdm
>> +
>> +  reg:
>> +    maxItems: 1
> 
> (...)
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - dmas
>> +  - dma-names
>> +  - "#sound-dai-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tdm: tdm@10090000 {
> 
> Drop tdm label, not used.

Ok, will drop it.

Best regards,
Walker


