Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49C7E07C7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 18:52:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F874827;
	Fri,  3 Nov 2023 18:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F874827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699033979;
	bh=O/YdEpiL2K2rKu9WYjNvnKVztAqX9GCzc4BkIprUDXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JjHao9fVeVlRKCoEiL+rThQYO0jkdRtHcTqoB5CLuJW1eziC9CcII+1TSC/y3Kkx3
	 7KsylViQZf1vLBzrvXDD0ZX54LHj8XbN0kNZzaCMToZDMM0YDfMaTBsvbagEjdmu8s
	 xfs0jQxjySGAiW/7SbEYATP6I2epgLHTpP7HV7is=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB92BF8020D; Fri,  3 Nov 2023 18:52:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BF4EF8020D;
	Fri,  3 Nov 2023 18:52:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5F56F80290; Fri,  3 Nov 2023 18:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 519CFF8016D
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 18:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 519CFF8016D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F962F4;
	Fri,  3 Nov 2023 10:52:29 -0700 (PDT)
Received: from [10.57.81.32] (unknown [10.57.81.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D4DC3F738;
	Fri,  3 Nov 2023 10:51:41 -0700 (PDT)
Message-ID: <1cbc6def-8255-4a13-99b0-145d3f8ffcac@arm.com>
Date: Fri, 3 Nov 2023 17:51:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/10] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
Content-Language: en-GB
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Leo Yan <leoy@marvell.com>, Zhangfei Gao <zhangfei.gao@marvell.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Kees Cook <keescook@chromium.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli"
 <gpiccoli@igalia.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Karel Balej <balejk@matfyz.cz>
References: <20231102152033.5511-1-duje.mihanovic@skole.hr>
 <20231102152033.5511-3-duje.mihanovic@skole.hr>
 <ffb08cc2-705a-468e-b6d2-9ce591c08ab4@arm.com> <2919185.e9J7NaK4W3@radijator>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <2919185.e9J7NaK4W3@radijator>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4UIVWE6B24QBEM36QGC46OGGRMDYLEFK
X-Message-ID-Hash: 4UIVWE6B24QBEM36QGC46OGGRMDYLEFK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UIVWE6B24QBEM36QGC46OGGRMDYLEFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-11-03 5:02 pm, Duje Mihanović wrote:
> On Friday, November 3, 2023 4:34:54 PM CET Robin Murphy wrote:
>> On 2023-11-02 3:20 pm, Duje Mihanović wrote:
>>> +config ARCH_MMP
>>> +	bool "Marvell MMP SoC Family"
>>> +	select ARM_GIC
>>> +	select ARM_ARCH_TIMER
>>> +	select ARM_SMMU
>>
>> NAK, not only is selecting user-visible symbols generally frowned upon,
>> and ignoring their dependencies even worse, but for a multiplatform
>> kernel the user may well want this to be a module.
>>
>> If having the SMMU driver built-in is somehow fundamentally required for
>> this platform to boot, that would represent much bigger problems.
> 
> The SoC can boot without SMMU and PDMA, but not GIC, pinctrl or the arch
> timer. I see that most other SoCs still select drivers and frameworks they
> presumably need for booting, with the exceptions of ARCH_BITMAIN, ARCH_LG1K
> and a couple others. Which of these two options should I go for?

Well, you don't really need to select ARM_GIC or ARM_ARCH_TIMER here 
either, since those are already selected by ARM64 itself. Keeping 
PINCTRL_SINGLE is fair, although you should also select PINCTRL as its 
dependency.

As an additional nit, the file seems to be primarily ordered by symbol 
name, so it might be nice to slip ARCH_MMC in between ARCH_MESON and 
ARCH_MVEBU.

Cheers,
Robin.
