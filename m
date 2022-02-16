Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF6A4B8452
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:32:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43BAF18AE;
	Wed, 16 Feb 2022 10:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43BAF18AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003921;
	bh=TxinBC92AZGSa5J2VGyGRFzAC61NklN35XU93e0zdDE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbnZvvDkDViAzWn9RQzD8JS6LtdVsNtfisgkBkzDT0HLm+NUfdl4yLKKsZne/EDxW
	 MU32UMSqc6Y1mEUJOeYL620UJMy/d/NocvBFl7u++soLlsQqyfxuhEkHl196YPUubg
	 zbvucfWkNr7IAlMovQ70rIb55TPRUmRLJvSlBJ80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B00F805AE;
	Wed, 16 Feb 2022 10:25:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D568F80118; Wed, 16 Feb 2022 08:33:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 647B2F80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 08:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 647B2F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi
 header.b="eL7Hr/lk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YLqbvNAQ5McurwQxgQURUxYEK/101B81ffBYTWQOubQ=; b=eL7Hr/lkBZAvTbiBImym7WqBQv
 fFtLWY1zFgcvz0Y28ZdTef3hq5UPUDbyOdU9owOcUlMeUyuZ3oyA98+tA7VtWzh/V83PJpmahWg5r
 mvo8+O4dcwNzaE4UT8NttIU5Q9B24c2fgT7vTH888Bt6ebP3Ss7Na0xbwHiYPj0X9IyrjurNjA5eB
 ZWjzedHDsBYGuHo0wwQOWbdJJooJ46j4RrmUOFAYciKhQ5IxMuRrv2wAplC9c/d+YFiFj0HwvJvHq
 KNdq7ecLO91xqhxo3t7F2RmN2eLeyUJ6R9jJqyAbe7jDYAW+nOrk0ELj+fWkrABrJye0Ksa6W80gd
 A3UB8CtA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nKEop-0001Qm-2c; Wed, 16 Feb 2022 09:33:43 +0200
Message-ID: <f0eb82eb-dec6-0870-3896-0973758caebb@kapsi.fi>
Date: Wed, 16 Feb 2022 09:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 4/6] dt-bindings: Add HDA support for Tegra234
Content-Language: en-US
To: Mohan Kumar <mkumard@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 tiwai@suse.com, jonathanh@nvidia.com, spujar@nvidia.com
References: <20220210065057.13555-1-mkumard@nvidia.com>
 <20220210065057.13555-5-mkumard@nvidia.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220210065057.13555-5-mkumard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 2/10/22 08:50, Mohan Kumar wrote:
> Add hda clocks, memory ,power and reset binding entries
> for Tegra234.
> 
> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> ---
>   include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
>   include/dt-bindings/memory/tegra234-mc.h       | 6 ++++++
>   include/dt-bindings/power/tegra234-powergate.h | 9 +++++++++
>   include/dt-bindings/reset/tegra234-reset.h     | 2 ++
>   4 files changed, 21 insertions(+)
>   create mode 100644 include/dt-bindings/power/tegra234-powergate.h
> 
> diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
> index 8d7e66e1b6ef..c014269b7245 100644
> --- a/include/dt-bindings/clock/tegra234-clock.h
> +++ b/include/dt-bindings/clock/tegra234-clock.h
> @@ -30,5 +30,9 @@
>   #define TEGRA234_CLK_PLLC4			237U
>   /** @brief 32K input clock provided by PMIC */
>   #define TEGRA234_CLK_CLK_32K			289U
> +/** @brief CLK_RST_CONTROLLER_AZA2XBITCLK_OUT_SWITCH_DIVIDER switch divider output (aza_2xbitclk) */
> +#define TEGRA234_CLK_AZA_2XBIT			457U
> +/** @brief aza_2xbitclk / 2 (aza_bitclk) */
> +#define TEGRA234_CLK_AZA_BIT			458U
>   
>   #endif
> diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
> index 2662f70c15c6..f538fc442cee 100644
> --- a/include/dt-bindings/memory/tegra234-mc.h
> +++ b/include/dt-bindings/memory/tegra234-mc.h
> @@ -7,6 +7,8 @@
>   #define TEGRA234_SID_INVALID		0x00
>   #define TEGRA234_SID_PASSTHROUGH	0x7f
>   
> +/* NISO0 SMMU STREAM IDs */
> +#define TEGRA234_SID_NISO0_HDA		0x03

Please follow the existing convention in this file.

/* NISO0 stream IDs */
#define TEGRA234_SID_HDA	0x03

>   
>   /* NISO1 stream IDs */
>   #define TEGRA234_SID_SDMMC4	0x02
> @@ -16,6 +18,10 @@
>    * memory client IDs
>    */
>   
> +/* High-definition audio (HDA) read clients */
> +#define TEGRA234_MEMORY_CLIENT_HDAR 0x15
> +/* High-definition audio (HDA) write clients */
> +#define TEGRA234_MEMORY_CLIENT_HDAW 0x35
>   /* sdmmcd memory read client */
>   #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
>   /* sdmmcd memory write client */
> diff --git a/include/dt-bindings/power/tegra234-powergate.h b/include/dt-bindings/power/tegra234-powergate.h
> new file mode 100644
> index 000000000000..3c5575a51296
> --- /dev/null
> +++ b/include/dt-bindings/power/tegra234-powergate.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved. */
> +
> +#ifndef __ABI_MACH_T234_POWERGATE_T234_H_
> +#define __ABI_MACH_T234_POWERGATE_T234_H_
> +
> +#define TEGRA234_POWER_DOMAIN_DISP	3U
> +
> +#endif
> diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
> index 50e13bced642..2ab61c69a3d9 100644
> --- a/include/dt-bindings/reset/tegra234-reset.h
> +++ b/include/dt-bindings/reset/tegra234-reset.h
> @@ -10,6 +10,8 @@
>    * @brief Identifiers for Resets controllable by firmware
>    * @{
>    */
> +#define TEGRA234_RESET_HDA			20U
> +#define TEGRA234_RESET_HDACODEC			21U
>   #define TEGRA234_RESET_SDMMC4			85U
>   #define TEGRA234_RESET_UARTA			100U
>   

