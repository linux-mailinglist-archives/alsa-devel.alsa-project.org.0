Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C776C6FEBDC
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 08:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 821E9F7A;
	Thu, 11 May 2023 08:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 821E9F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683787513;
	bh=DopYvAjhgasmDSPdGb4KP4iiYXMNEUAvCJNX5KifN4I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wp6OqtdnHNUaCUoXdcXd1IuQ7ZCnZuVo+QxVRlBH2EzkOo8Kr5xNEOW8S0fZJVCYV
	 aJ+FQQQHvdFzUbQZ6WiLWx9VsfFyL8/fwjE3+IcUnIEnCVICi8chiUEzZG65RzOHqT
	 kE1CFcn47xC8Jx2a0La06re19oJbcRx8JjHhSsKg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F189DF80310;
	Thu, 11 May 2023 08:44:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 467A3F8032D; Thu, 11 May 2023 05:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-8.3 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B6BCF80217
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 05:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6BCF80217
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EB91682D4;
	Thu, 11 May 2023 11:21:33 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 11 May
 2023 11:21:34 +0800
Received: from [192.168.125.124] (113.72.146.187) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 11 May
 2023 11:21:33 +0800
Message-ID: <ef13177a-2028-9fc9-628a-e3d287758207@starfivetech.com>
Date: Thu, 11 May 2023 11:21:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
To: Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
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
 <f27b7ee7-f23a-35a2-3b82-71f50871dfcc@starfivetech.com>
 <20230510-riveter-ridden-3f056251e623@spud>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230510-riveter-ridden-3f056251e623@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HYMJSLC7TDHFQTWNIB3JXDB5YA6OGLWT
X-Message-ID-Hash: HYMJSLC7TDHFQTWNIB3JXDB5YA6OGLWT
X-Mailman-Approved-At: Thu, 11 May 2023 06:44:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYMJSLC7TDHFQTWNIB3JXDB5YA6OGLWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/5/11 4:22, Conor Dooley wrote:
> On Wed, May 10, 2023 at 05:21:21PM +0800, Walker Chen wrote:
>> On 2023/5/10 16:33, Emil Renner Berthing wrote:
>> > On Tue, 9 May 2023 at 20:05, Conor Dooley <conor@kernel.org> wrote:
>> >>
>> >> On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
>> >> > Hi Conor/Emil,
>> >> >
>> >> > DT overlay is used to describe combinations of VF2 and hat.
>> >> > Do you have any comments on this patch ?
>> >>
>> >> I seem to recall that he said at the linux-riscv sync-up call that we
>> >> have* that he was not in favour of overlays for hats like this.
>> >> I'll let him confirm that though, I might very well be misinterpreting or
>> >> misremembering what he said.
>> > 
>> > What probably meant was that I didn't want a bunch of different device
>> > trees for each combination board * hat. An overlay makes a lot more
>> > sense. However, looking through the kernel tree there is a surprising
>> > lack of overlays for hats committed already, so I suspect there is
>> > some sort of policy around overlays already in place.
> 
>> About the specific usage of overlay for this board + hat, referenced to the following example in kernel:
>> linux/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtso
>> That board is connected with imx219 sensor via mipi_csi interface. That patch was accepted in 2022.
> 
> Hmm, so spoke to Emil again today about it. In the interest of being
> fair, I did go looking at that particular board & looked through their
> documentation for more information on why there are overlays.
> They do actually sell the bits required to use the overlays, based on
> what I saw in their datasheet for the board & wiki. That said, what is
> done for one arm64 platform does not necessarily apply elsewhere ;)
> 
> I'm not against allowing in-tree overlays for hats/capes/daughter-boards
> that come bundled with a board, but accepting ones for a hat that
> someone decided to use theoretically has no limit! The "someone" in this
> case might be a StarFive developer, but it could be any random one of
> your customers next!
> We've got to draw a line somewhere, so my answer to the overlay *in this
> case* is a no. Sorry.
> When you submit your next version, please drop the overlay from this
> patch.

I'm trying to understand what you mean. so the conclusion is that I need to drop the file
 'jh7110-starfive-visionfive-2-wm8960.dtso' from this patch.
When I submit the next version, just keep the TDM node and the pins configuration for TDM in patch [3/3],
need to drop the wm8960 stuff.
Right ?

Best regards,
Walker
