Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B087E05A5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 16:36:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B15CA1DC;
	Fri,  3 Nov 2023 16:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B15CA1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699025767;
	bh=H+FIDqvsGpexhTlCTW8dnmfKPAYe/y+5wDjQfqcQ0a8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wol+Sx0AozR1z6v384VDtusgkAsfCS8mhFqBCLLW59EsGZ8HM032vgc2ygGcVq07U
	 D3oV+4K2EXQDqHGtCZ+kpIfNvCg48BodTEJUCduy23jtVe3DolgtDTlkrNd3gTYvHr
	 jqoB61UWG7yxbx7vDirbWYlrPW/gZXoIM4dQupsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B5E4F80557; Fri,  3 Nov 2023 16:35:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC79F8020D;
	Fri,  3 Nov 2023 16:35:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E67CDF80290; Fri,  3 Nov 2023 16:35:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by alsa1.perex.cz (Postfix) with ESMTP id B2937F8003C
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 16:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2937F8003C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878812F4;
	Fri,  3 Nov 2023 08:35:44 -0700 (PDT)
Received: from [10.57.81.32] (unknown [10.57.81.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F56B3F64C;
	Fri,  3 Nov 2023 08:34:56 -0700 (PDT)
Message-ID: <ffb08cc2-705a-468e-b6d2-9ce591c08ab4@arm.com>
Date: Fri, 3 Nov 2023 15:34:54 +0000
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
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231102152033.5511-3-duje.mihanovic@skole.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6NX5RUVZQWTXYA5JZSWAZAUOJ6GLS4MT
X-Message-ID-Hash: 6NX5RUVZQWTXYA5JZSWAZAUOJ6GLS4MT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NX5RUVZQWTXYA5JZSWAZAUOJ6GLS4MT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-11-02 3:20 pm, Duje Mihanović wrote:
> Add ARCH_MMP configuration option for Marvell PXA1908 SoC.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> ---
>   arch/arm64/Kconfig.platforms | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6069120199bb..b417cae42c84 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -89,6 +89,17 @@ config ARCH_BERLIN
>   	help
>   	  This enables support for Marvell Berlin SoC Family
>   
> +config ARCH_MMP
> +	bool "Marvell MMP SoC Family"
> +	select ARM_GIC
> +	select ARM_ARCH_TIMER
> +	select ARM_SMMU

NAK, not only is selecting user-visible symbols generally frowned upon, 
and ignoring their dependencies even worse, but for a multiplatform 
kernel the user may well want this to be a module.

If having the SMMU driver built-in is somehow fundamentally required for 
this platform to boot, that would represent much bigger problems.

Thanks,
Robin.

> +	select MMP_PDMA
> +	select PINCTRL_SINGLE
> +	help
> +	  This enables support for Marvell MMP SoC family, currently
> +	  supporting PXA1908 aka IAP140.
> +
>   config ARCH_BITMAIN
>   	bool "Bitmain SoC Platforms"
>   	help
