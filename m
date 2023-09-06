Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08FF7944AA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 22:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4AB3825;
	Wed,  6 Sep 2023 22:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4AB3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694032711;
	bh=YUMawwcsDkhDzL/8bfag2G8G8BEIRjrPkjW644p/Lfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DqqCUVsmXM75Quwde5o0qgffUmZRS1X1bsKy69LbaLtynTcSticKyMNMBGXv8lKFE
	 RYBwGS3LtRoI2dlm9yrGzIO2pLhGQJeK6WSSZ85aj8Id9mjwBIm2eUtMU9MhAicP6B
	 gCXavmZt+fJkXDU16H8i9+wAuv6atdI+BYoMzzQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CB3AF80537; Wed,  6 Sep 2023 22:37:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B35D8F8047D;
	Wed,  6 Sep 2023 22:37:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08E0FF80494; Wed,  6 Sep 2023 22:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F7AAF80431
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 22:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F7AAF80431
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96EAB106F;
	Wed,  6 Sep 2023 13:38:03 -0700 (PDT)
Received: from [10.57.5.192] (unknown [10.57.5.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC9F3F67D;
	Wed,  6 Sep 2023 13:37:23 -0700 (PDT)
Message-ID: <9e48fb7c-72a5-241a-004a-5f6791a81475@arm.com>
Date: Wed, 6 Sep 2023 21:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: snd-cmipci oops during probe on arm64 (current mainline,
 pre-6.6-rc1)
Content-Language: en-GB
To: Geraldo Nascimento <geraldogabriel@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <ZPelHaX/Lt++kkOm@linaro.org> <877cp3esse.wl-tiwai@suse.de>
 <4f335dd2-8043-c60e-cf84-c2b01c4fee12@arm.com> <ZPjGuCdmPgqznc5t@linaro.org>
 <ZPjM7op/B/CGCF/N@geday>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZPjM7op/B/CGCF/N@geday>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3Q5NXKVU54UY5HRZAKR2E2ZI2A5FYEBK
X-Message-ID-Hash: 3Q5NXKVU54UY5HRZAKR2E2ZI2A5FYEBK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Q5NXKVU54UY5HRZAKR2E2ZI2A5FYEBK/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-06 20:03, Geraldo Nascimento wrote:
> On Wed, Sep 06, 2023 at 03:36:40PM -0300, Antonio Terceiro wrote:
>> On Wed, Sep 06, 2023 at 01:49:16PM +0100, Robin Murphy wrote:
>>> On 2023-09-06 07:10, Takashi Iwai wrote:
>>>> On Wed, 06 Sep 2023 00:01:01 +0200,
>>>> Antonio Terceiro wrote:
>>>>>
>>>>> Hi,
>>>>>
> 
> Hi Antonio, my 2 cents:
> 
>>>>> I'm using an arm64 workstation, and wanted to add a sound card to it. I bought
>>>>> one who was pretty popular around where I live, and it is supported by the
>>>>> snd-cmipci driver.
> 
> Specifically, which arm64 workstation? I'm guessing Compute Module 4 IO
> Board + Raspbery Pi CM4? This detail is important because the stack
> trace you provided only references generic PCI calls and there's a need
> to know exactly which PCIe driver could be failing. Is it pcie-brcmstb?

Bit bigger than a Pi... ;)

 > [  +0,006259] Hardware name: ADLINK AVA Developer Platform/AVA 
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308) 
09/08/2022

They look like pretty nice boxes - https://www.ipi.wiki/pages/com-hpc-altra


Robin.
