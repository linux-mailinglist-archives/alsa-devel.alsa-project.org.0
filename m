Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F8708FC2
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61620200;
	Fri, 19 May 2023 08:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61620200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477167;
	bh=YVV9QXLK3zdKirLife6xNZ0Bitd3ouOLZrBQXVFj5bM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gMhqCEmAwg1VIC/Ipg/RviiCPO0bY3lfv1IxEJViMGT+2zq6XQgqzb4optyYqDoFv
	 SRRY/5p1L6r7AKIrIS1SR4DrAflHYO4tvg+Pduz5qpGI31Ck0SRRzJX8TiBiMZNUpM
	 bcu+DUntFtkwVFx0LadIt5xVhYZIX3jpqW9DLpQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD056F80431; Fri, 19 May 2023 08:18:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70548F8025A;
	Fri, 19 May 2023 08:18:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 491A1F80272; Mon, 15 May 2023 14:36:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ACCFF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 14:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACCFF8016D
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EEBD224DC7D;
	Mon, 15 May 2023 20:36:32 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 20:36:33 +0800
Received: from [192.168.125.124] (113.72.146.187) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 20:36:32 +0800
Message-ID: <29a30bab-1736-5a57-7bdf-3282d90a6a57@starfivetech.com>
Date: Mon, 15 May 2023 20:36:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
To: Conor Dooley <conor.dooley@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-4-walker.chen@starfivetech.com>
 <cd7803a2-38a0-c498-467f-1ef802645527@starfivetech.com>
 <20230515-dragonish-diffuser-48a1c6f4c8ae@wendy>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230515-dragonish-diffuser-48a1c6f4c8ae@wendy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EJJKF4UDFGMDTQPRAOD5HZ7AGU4B736Z
X-Message-ID-Hash: EJJKF4UDFGMDTQPRAOD5HZ7AGU4B736Z
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJJKF4UDFGMDTQPRAOD5HZ7AGU4B736Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/5/15 16:58, Conor Dooley wrote:
> On Mon, May 15, 2023 at 04:44:54PM +0800, Walker Chen wrote:
> 
>> Hi Conor / Emil,
>> 
>> Based on our discussion a few days ago, the new version of patch for dts looks like this,
>> Please help to review and provide your comments if you feel free.
> 
>> On 2023/5/11 17:15, Walker Chen wrote:
> 
> It's only been 4 days chief, of which 2 were the weekend, you don't need
> to bump it yet! You'd be better off asking one of your co-workers to
> review the content, instead of me. I'll happily apply the patch, with
> appropriate review, once the dt-binding has been applied by Mark. I do
> not have the capacity to review the detail of individual patches adding
> peripherals unfortunately.
> Getting your co-workers to look at your patches, and doing the same for
> theirs, is almost always a good idea for speeding up the process

Oh, Conor, perhaps I was too eager to finish the work quickly. Sorry for that!
Maybe I need to ask my co-worker to review firstly as you said.

Best regards,
Walker
