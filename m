Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207E835BB3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 08:35:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4981C741;
	Mon, 22 Jan 2024 08:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4981C741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705908918;
	bh=FMSjJS1WV5njtl/Y28CewL/VTjUBcIvACGaXMr5ZtWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oZvm1rs+VZ5rAc9UIB4y7Djf6Y8ubgrQdM75B8srkhXwwrZw3zUQ/xyla1UhLNHJa
	 gyDsIpevWoWmbBr+QNAopcHDnySUeTsu/xGmwER+k9WrNzgSBO8Hl0sYWuy93VGCd3
	 Pu24y3BEAuva1V42/HVUS1onIGKxvxqto/h9C/20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDCDAF802BE; Mon, 22 Jan 2024 08:34:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F0BF8057E;
	Mon, 22 Jan 2024 08:34:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5028F8025F; Mon, 22 Jan 2024 08:34:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42D0CF80149
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 08:34:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42D0CF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bEls0NK8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 952C16106D;
	Mon, 22 Jan 2024 07:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D25C433F1;
	Mon, 22 Jan 2024 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705908860;
	bh=FMSjJS1WV5njtl/Y28CewL/VTjUBcIvACGaXMr5ZtWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEls0NK8UEGPwSV9O5f0KT6MWVj03wkHBHN8PBWz8ns6/D3b/srmK4/3wbmH+V4uQ
	 FFqAB5aEgMk8pQxWeLXwII9rhB/8Xm1j+WHxC4HufIsJJ0ZGdKXmGjCHbvHpF4nYAy
	 +BE3Z3RqEGW4YH6K28Pva9ESUeR6U98z4jcXC09CrgNOuxoyOfRiQ7/XPvMCwIk3Lk
	 wocjF8NhI1B/1cAcejUjRSPOkogeZWVd45so/OsHuCDFWKYlnecPY4cQT76OTgbzJG
	 WUi508pRBTPTOMt2X9lDajOmvbpnit3kIjah7WPMVMXTsJK8vBsOAPAFuNIQ38OjWY
	 G2G+NX9zCOJDw==
Date: Mon, 22 Jan 2024 13:04:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 02/13] drivers: soundwire: amd: update license
Message-ID: <Za4aeN7vJ-Ln2fxA@matsya>
References: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
 <20240110094416.853610-3-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110094416.853610-3-Vijendar.Mukunda@amd.com>
Message-ID-Hash: BSRKIH7M4CVH7DHUF3VCGW2HE3ZIRCP4
X-Message-ID-Hash: BSRKIH7M4CVH7DHUF3VCGW2HE3ZIRCP4
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSRKIH7M4CVH7DHUF3VCGW2HE3ZIRCP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10-01-24, 15:14, Vijendar Mukunda wrote:

Why is the title "drivers: soundwire: "

git log drivers/soundwire/amd*
Tells me you didnt do that in past why now..?

> Update license to dual license to align with Sound Open Firmware (SOF)
> driver as SOF uses dual license.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c   | 4 ++--
>  drivers/soundwire/amd_manager.h   | 2 +-
>  include/linux/soundwire/sdw_amd.h | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 3a99f6dcdfaf..afa2d83b7e69 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>  /*
>   * SoundWire AMD Manager driver
>   *
> @@ -1207,5 +1207,5 @@ module_platform_driver(amd_sdw_driver);
>  
>  MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
>  MODULE_DESCRIPTION("AMD SoundWire driver");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS("platform:" DRV_NAME);
> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
> index 5f040151a259..f57165bbb9d9 100644
> --- a/drivers/soundwire/amd_manager.h
> +++ b/drivers/soundwire/amd_manager.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>  /*
>   * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
>   */
> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
> index 41dd64941cef..56b4117c087a 100644
> --- a/include/linux/soundwire/sdw_amd.h
> +++ b/include/linux/soundwire/sdw_amd.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>  /*
>   * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
>   */
> -- 
> 2.34.1

-- 
~Vinod
