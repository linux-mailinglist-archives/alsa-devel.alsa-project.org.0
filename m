Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F827E0587
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 16:25:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13DAD825;
	Fri,  3 Nov 2023 16:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13DAD825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699025109;
	bh=wcKqp6aArmNcCYn8hLe9W+8wHLGk+Okob0DDUItHYu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MDfXJ8bOngKIAQJ6MtGSQQN/V7KCSeWohcw/16TpfoVZsJfi3AOBl1IkdEwh2upqK
	 qpii8FvsphsRtdMLZVuW8ZQ0ZyIN2xEnxy3QH6cBRnQG9PZiFx1bieN/st+EzMb+Es
	 tMo5Xw5G8RiOLk5pvMZBiMNry2FhgNDyVX8YrlnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFEC6F80537; Fri,  3 Nov 2023 16:23:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DD5BF8020D;
	Fri,  3 Nov 2023 16:23:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2592BF80290; Fri,  3 Nov 2023 16:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B3D0F8003C
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 16:23:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B3D0F8003C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AECC2F4;
	Fri,  3 Nov 2023 08:24:20 -0700 (PDT)
Received: from [10.57.81.32] (unknown [10.57.81.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6FC03F64C;
	Fri,  3 Nov 2023 08:23:31 -0700 (PDT)
Message-ID: <3b4ac48b-e29d-415f-89f1-6d354f18c4a4@arm.com>
Date: Fri, 3 Nov 2023 15:23:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/10] ASoC: pxa: Suppress SSPA on ARM64
Content-Language: en-GB
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Duje_Mihanovi=C4=87?=
 <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Leo Yan <leoy@marvell.com>,
 Zhangfei Gao <zhangfei.gao@marvell.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>,
 kernel test robot <lkp@intel.com>
References: <20231102152033.5511-1-duje.mihanovic@skole.hr>
 <dc7aaff0-f767-494e-9a3a-40fcacc1674e@sirena.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <dc7aaff0-f767-494e-9a3a-40fcacc1674e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XYRKQ5WC55BLK2Z2TC33ICFA5W7YZU4K
X-Message-ID-Hash: XYRKQ5WC55BLK2Z2TC33ICFA5W7YZU4K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYRKQ5WC55BLK2Z2TC33ICFA5W7YZU4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-11-02 3:26 pm, Mark Brown wrote:
> On Thu, Nov 02, 2023 at 04:20:29PM +0100, Duje Mihanović wrote:
>> The SSPA driver currently seems to generate ARM32 assembly, which causes
>> build errors when building a kernel for an ARM64 ARCH_MMP platform.
>>
>> Fixes: fa375d42f0e5 ("ASoC: mmp: add sspa support")
>> Reported-by: kernel test robot <lkp@intel.com>
> 
>>   	tristate "SoC Audio via MMP SSPA ports"
>> -	depends on ARCH_MMP
>> +	depends on ARCH_MMP && ARM
> 
> This isn't a fix for the existing code, AFAICT the issue here is that
> ARCH_MMP is currently only available for arm and presumably something in
> the rest of your series makes it available for arm64.  This would be a
> prerequisite for that patch.
> 
> Please don't just insert random fixes tags just because you can.

FWIW it doesn't even seem to be the right reason either. AFACIT the 
issue being introduced is that SND_MMP_SOC_SSPA selects SND_ARM which 
depends on ARM, but after patch #8 ARCH_MMP itself will no longer 
necessarily imply ARM. The fact that selecting SND_ARM with unmet 
dependencies also allows SND_ARMAACI to be enabled (which appears to be 
the only thing actually containing open-coded Arm asm) is tangential.

Robin.
