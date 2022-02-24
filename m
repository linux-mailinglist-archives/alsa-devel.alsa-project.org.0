Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7424C35EE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 20:33:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C056318A5;
	Thu, 24 Feb 2022 20:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C056318A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645731179;
	bh=8fzO6xsGypf89iE5ldgMfK891u+yiHlggE9whj1cKCs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cEvqtrDJw55LE9d8bsl3ZXFTrsgEfQsYoWaQ58qDvSqyyre8TK5PN6vTj8sLsWfaI
	 PE4c/V3G/IFse4km+6czW+RQBlBQpihzwMhK4TdeyMjvat5eM8tQK/ajUYo7aHIV3N
	 fDbPgxvRFK2iXMa/+J8iugSBA16v6YeFstDqdzCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2848DF80310;
	Thu, 24 Feb 2022 20:31:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A018FF8030F; Thu, 24 Feb 2022 20:31:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53BD7F800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 20:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53BD7F800F3
Received: by mail-oi1-f177.google.com with SMTP id x193so4521165oix.0
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 11:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZiafZeplBWhT7qA6TILDu8RUDYpdcUkSvNy49Uo79Y4=;
 b=cKGVTrTDVr2MWavLmJ0w8n3DyP6netdCZjHQ+mx7LGofNmW3ibI78OO8mOnsdLS8qI
 bycox/deXD1DnK9aPOh78Q61HPae0SWrevRt+ApGufj4cOzv5dNf3sGlsTI5tqDMDxtN
 bQmCMDc4ggfieMjpfm3ZHbkY0p86L+sseu7GvDmpHZYZcY2bqV01mPHj5G9ZrIq7LKJW
 WPsvDzKjX4M9jJgGg+yhOauX6s6TL8vuOsDV2ualOxnX3eM19ckCD9wWOW6iI6Al4y5X
 xEugs6v1Wka8DW2exG3yX1MoEzkFmUXQMBgT65cKbbk1tNKshGYvT/vUA573xJ/M2Z6M
 CksQ==
X-Gm-Message-State: AOAM531n4QTIa0ktz49XvqucCj35UCqtkG/XJnpMo5gvGsJALmGXmcaT
 YDupVJsIQ4xpmWG2NTkd4g==
X-Google-Smtp-Source: ABdhPJwZKPUfwn6b609ImZjzM72DsS1EGoc6MqGOxqYPh0gRQ8a18eVWjrPShbIcgD6oyXqcu+p1kQ==
X-Received: by 2002:a05:6808:138e:b0:2d5:1ed5:e0ac with SMTP id
 c14-20020a056808138e00b002d51ed5e0acmr2252281oiw.214.1645731103283; 
 Thu, 24 Feb 2022 11:31:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 v7-20020a4aa507000000b0031c01a4ef37sm79465ook.32.2022.02.24.11.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:31:42 -0800 (PST)
Received: (nullmailer pid 3451260 invoked by uid 1000);
 Thu, 24 Feb 2022 19:31:41 -0000
Date: Thu, 24 Feb 2022 13:31:41 -0600
From: Rob Herring <robh@kernel.org>
To: Mohan Kumar <mkumard@nvidia.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: Add HDA support for Tegra234
Message-ID: <YhfdHd2LPc+ifFTS@robh.at.kernel.org>
References: <20220216092240.26464-1-mkumard@nvidia.com>
 <20220216092240.26464-5-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216092240.26464-5-mkumard@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Feb 16, 2022 at 02:52:38PM +0530, Mohan Kumar wrote:
> Add hda clocks, memory ,power and reset binding entries
> for Tegra234.
> 
> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
>  include/dt-bindings/memory/tegra234-mc.h       | 6 ++++++
>  include/dt-bindings/power/tegra234-powergate.h | 9 +++++++++
>  include/dt-bindings/reset/tegra234-reset.h     | 2 ++
>  4 files changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/power/tegra234-powergate.h
> 
> diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
> index 2529e7ec0bf4..2ab651916127 100644
> --- a/include/dt-bindings/clock/tegra234-clock.h
> +++ b/include/dt-bindings/clock/tegra234-clock.h
> @@ -64,4 +64,8 @@
>  #define TEGRA234_CLK_PLLC4			237U
>  /** @brief 32K input clock provided by PMIC */
>  #define TEGRA234_CLK_CLK_32K			289U
> +/** @brief CLK_RST_CONTROLLER_AZA2XBITCLK_OUT_SWITCH_DIVIDER switch divider output (aza_2xbitclk) */
> +#define TEGRA234_CLK_AZA_2XBIT			457U
> +/** @brief aza_2xbitclk / 2 (aza_bitclk) */
> +#define TEGRA234_CLK_AZA_BIT			458U
>  #endif
> diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
> index 2662f70c15c6..c42fe61fba5e 100644
> --- a/include/dt-bindings/memory/tegra234-mc.h
> +++ b/include/dt-bindings/memory/tegra234-mc.h
> @@ -7,6 +7,8 @@
>  #define TEGRA234_SID_INVALID		0x00
>  #define TEGRA234_SID_PASSTHROUGH	0x7f
>  
> +/* NISO0 stream IDs */
> +#define TEGRA234_SID_HDA		0x03
>  
>  /* NISO1 stream IDs */
>  #define TEGRA234_SID_SDMMC4	0x02
> @@ -16,6 +18,10 @@
>   * memory client IDs
>   */
>  
> +/* High-definition audio (HDA) read clients */
> +#define TEGRA234_MEMORY_CLIENT_HDAR 0x15
> +/* High-definition audio (HDA) write clients */
> +#define TEGRA234_MEMORY_CLIENT_HDAW 0x35
>  /* sdmmcd memory read client */
>  #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
>  /* sdmmcd memory write client */
> diff --git a/include/dt-bindings/power/tegra234-powergate.h b/include/dt-bindings/power/tegra234-powergate.h
> new file mode 100644
> index 000000000000..3c5575a51296
> --- /dev/null
> +++ b/include/dt-bindings/power/tegra234-powergate.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license please.

> +/* Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved. */
> +
> +#ifndef __ABI_MACH_T234_POWERGATE_T234_H_
> +#define __ABI_MACH_T234_POWERGATE_T234_H_
> +
> +#define TEGRA234_POWER_DOMAIN_DISP	3U
> +
> +#endif
> diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
> index ba390b86361d..178e73a687f0 100644
> --- a/include/dt-bindings/reset/tegra234-reset.h
> +++ b/include/dt-bindings/reset/tegra234-reset.h
> @@ -10,6 +10,8 @@
>   * @brief Identifiers for Resets controllable by firmware
>   * @{
>   */
> +#define TEGRA234_RESET_HDA			20U
> +#define TEGRA234_RESET_HDACODEC			21U
>  #define TEGRA234_RESET_I2C1			24U
>  #define TEGRA234_RESET_I2C2			29U
>  #define TEGRA234_RESET_I2C3			30U
> -- 
> 2.17.1
> 
> 
