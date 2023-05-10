Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 015C76FE343
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB0E102F;
	Wed, 10 May 2023 19:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB0E102F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739781;
	bh=F5ds+LcMLaDGkVzsZdJKK8iINzbhG+OZIWrXpTateKs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RTdk/mGc7pG7kHjyN0UJp9Kv2sz5uPP0n+3XhM1kSILY5m3I6czUOOz4WlZ/bEpFD
	 kCi8KB510xilbhXgeMgYDHc+2bDvIjU2RzQIZILrTx9R3+blXLkLP9mf70Jmuf0RbH
	 VtCk5lAtXnPunL2KUereUsFRpaJbn28TPj8thoZI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA22F80567;
	Wed, 10 May 2023 19:27:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8041CF8052E; Wed, 10 May 2023 11:21:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.4 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0337F802E8
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 11:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0337F802E8
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5816224E2A9;
	Wed, 10 May 2023 17:21:25 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 17:21:23 +0800
Received: from [192.168.125.124] (183.27.98.219) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 17:21:22 +0800
Message-ID: <f27b7ee7-f23a-35a2-3b82-71f50871dfcc@starfivetech.com>
Date: Wed, 10 May 2023 17:21:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com>
 <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
 <20230509-overheat-pliable-00d60523637e@spud>
 <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: 
 <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2TZIV7NQLF6JISBLUBHHYXQXOCL7X5XH
X-Message-ID-Hash: 2TZIV7NQLF6JISBLUBHHYXQXOCL7X5XH
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TZIV7NQLF6JISBLUBHHYXQXOCL7X5XH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/5/10 16:33, Emil Renner Berthing wrote:
> On Tue, 9 May 2023 at 20:05, Conor Dooley <conor@kernel.org> wrote:
>>
>> On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
>> > Hi Conor/Emil,
>> >
>> > DT overlay is used to describe combinations of VF2 and hat.
>> > Do you have any comments on this patch ?
>>
>> Up to Emil :)
>>
>> I seem to recall that he said at the linux-riscv sync-up call that we
>> have* that he was not in favour of overlays for hats like this.
>> I'll let him confirm that though, I might very well be misinterpreting or
>> misremembering what he said.
> 
> What probably meant was that I didn't want a bunch of different device
> trees for each combination board * hat. An overlay makes a lot more
> sense. However, looking through the kernel tree there is a surprising
> lack of overlays for hats committed already, so I suspect there is
> some sort of policy around overlays already in place.
Hi Emil,

About the specific usage of overlay for this board + hat, referenced to the following example in kernel:
linux/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtso
That board is connected with imx219 sensor via mipi_csi interface. That patch was accepted in 2022.

So do you think this way is feasible ?
Thanks!

Best regards,
Walker
 
> 
>> Cheers,
>> Conor.
>>
>> * https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a/
