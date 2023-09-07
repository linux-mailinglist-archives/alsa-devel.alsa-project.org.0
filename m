Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B170E79723F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 14:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6C6D84B;
	Thu,  7 Sep 2023 14:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6C6D84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694089397;
	bh=AqM/1Ux4kw9uOvdefAo9hUZ6akanGK7REomevA1Q+Ik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IUKvMeMOXaP14jaM7EP2NdVGxAZU8DR9SVrxCdchlTaVkZnVwApLCnRMVtVG1JD27
	 q4FmN+AWKF6Hjjf/IS6K9xrfxTPOXlkNW4YWjd+KhbueF+FRBiIy5vHFFKAOFHTy9R
	 E6dPvEoqM/M41PBz89zCbKTGNnXqiWtPjjP1DaNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5774EF80551; Thu,  7 Sep 2023 14:22:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C093F8047D;
	Thu,  7 Sep 2023 14:22:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ABB4F80494; Thu,  7 Sep 2023 14:22:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.5 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DEC9F800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 14:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DEC9F800F5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0349D75;
	Thu,  7 Sep 2023 05:22:52 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F2AD3F7B4;
	Thu,  7 Sep 2023 05:22:13 -0700 (PDT)
Message-ID: <15d1dd8f-a002-8b98-55ba-632427e621cf@arm.com>
Date: Thu, 7 Sep 2023 13:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: snd-cmipci oops during probe on arm64 (current mainline,
 pre-6.6-rc1)
Content-Language: en-GB
To: Antonio Terceiro <antonio.terceiro@linaro.org>
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <ZPelHaX/Lt++kkOm@linaro.org> <877cp3esse.wl-tiwai@suse.de>
 <4f335dd2-8043-c60e-cf84-c2b01c4fee12@arm.com> <ZPjGuCdmPgqznc5t@linaro.org>
 <43632d9d-722c-b14f-336a-eac402ef9362@arm.com> <ZPkcIayHbYJopT6n@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZPkcIayHbYJopT6n@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 37VAD7DUHJIAT5SAFTRKYEZ4FWIVZJE4
X-Message-ID-Hash: 37VAD7DUHJIAT5SAFTRKYEZ4FWIVZJE4
X-MailFrom: robin.murphy@arm.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37VAD7DUHJIAT5SAFTRKYEZ4FWIVZJE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/09/2023 1:41 am, Antonio Terceiro wrote:
> On Wed, Sep 06, 2023 at 08:52:40PM +0100, Robin Murphy wrote:
>> On 2023-09-06 19:36, Antonio Terceiro wrote:
>>> I'm pretty sure I saw reports of people using PCI GPUs on this machine,
>>> but I would need to confirm.
>>
>> GPUs and any other PCIe devices will be fine, since they will use memory
>> BARs - I/O space is pretty much deprecated in PCIe, and as mentioned some
>> systems don't even support it at all. I found a datasheet for CMI8738, and
>> they seem to be right at the other end of the scale as legacy PCI chips with
>> *only* an I/O BAR (and so I guess your card includes a PCIe-PCI bridge as
>> well), so are definitely going to be hitting paths that are less
>> well-exercised on arm64 in general.
> 
> OK, that makes sense. So If I'm able to find a card that is genuinely
> PCIe¹, then it should work?
> 
> ¹ this one has a connector that looks like a PCIe x1, but it's not
>    really PCIe as the chipset was designed for legacy PCI?

Probably - native PCIe endpoints are still allowed to have I/O 
resources, but they are required to be accessible as equivalent memory 
resources as well, so most PCIe drivers are unlikely to care about I/O 
BARs at all.

>>> What info would I need to gather from the machine in order to figure
>>> this out?
>>
>> The first thing I'd try is rebuilding the kernel with CONFIG_INDIRECT_PIO
>> disabled and see what difference that makes. I'm not too familiar with that
>> area of the code, so the finer details of how to debug broken I/O space
>> beyond that would be more of a linux-pci question.
> 
> Tried that, didn't help.

OK, I managed to have a poke around on a full-fat Altra Mt.Jade system, 
and indeed, at least on this one, the firmware is not describing any I/O 
space windows at all:

[    8.657752] pci_bus 0001:00: root bus resource [bus 00-ff]
[    8.663235] pci_bus 0001:00: root bus resource [mem 
0x30000000-0x37ffffff window]
[    8.670715] pci_bus 0001:00: root bus resource [mem 
0x380000000000-0x3bffdfffffff window]
[    8.678926] pci 0001:00:00.0: [1def:e100] type 00 class 0x060000

[and so on for all 11(!) PCI segments...]

...which then leads to a lot of failing to configure I/O at the bridges:

[    9.005653] pci 0000:00:01.0: BAR 13: no space for [io  size 0x1000]
[    9.012006] pci 0000:00:01.0: BAR 13: failed to assign [io  size 0x1000]

...but unfortunately what I don't then have is any endpoint with an I/O 
BAR in that machine to see how that plays out. Either way, though, if 
your machine looks the same as this (i.e. does not report any "root bus 
resource [io ... window]" entries and fails to assign any I/O space), 
then there's no way that card can work, and it would seem to indicate a 
bug somewhere between the PCI layer and the driver that it's able to get 
as far as making an access to something it has no means of accessing.

If on the other hand your firmware is different and *does* claim to have 
I/O windows as well, then something else is going screwy and I don't 
know, sorry.

Cheers,
Robin.
