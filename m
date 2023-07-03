Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96D274555F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 08:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A7C220C;
	Mon,  3 Jul 2023 08:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A7C220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688365194;
	bh=8iby7AbCF9UWP65IdF9RbSVrQ14JOfsYIuXL0MfM8Vs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gKaTPj0/7h7zTjCFz/Hv94JBS4NOEhu9tLjtNA6HbXXgihHdBSxd7H5A++jHWbYaX
	 ohQfzqKgca/4P6lOO6ijZfLpR5W6F9ZpM/JDfPJXwXtiGPKvKgyslxqz01gvB26BpJ
	 uBaOrrpnSPSh7SW+O1nS6iKnmSUPDv5RhSZzU1ZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E00D3F80104; Mon,  3 Jul 2023 08:19:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CE26F80124;
	Mon,  3 Jul 2023 08:19:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBE3BF8055A; Mon,  3 Jul 2023 08:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4E11F8055A
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 08:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E11F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KOUuBLgi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F4CC60C99;
	Mon,  3 Jul 2023 06:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5377C433C9;
	Mon,  3 Jul 2023 06:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688364977;
	bh=8iby7AbCF9UWP65IdF9RbSVrQ14JOfsYIuXL0MfM8Vs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KOUuBLgip3qcxF+EfRwDVVYUwV0m/+HSMAtVW/Q8kEKIVVgbH4e1uTn1f9yUPd8KO
	 RrG4ABQtMs2/nAkNgC/A1nN0UeofcH2n7sV4hhlcniXsh016PmdsfbJ7kY5A7PFqLS
	 UwvGc0nrXX5KGkeSMgmZBStk5mH7ov3T8uLx7aPLX+FynAu0SN6wzXvoLwAzl0s9Q7
	 BVV+U4dtv9bxS1BLSy9TGRofyFDSQuIRC2GDG8nXb86OmLH5CaCe2YUUCYo9dXYVKY
	 NIlID3jiDSZZlw6K31RpmUPpeJ84gOYDenFv6+2vW2p8HMa8dsEWG/QSkeDiRetiyh
	 7TZypdiFjjvEA==
Date: Mon, 3 Jul 2023 08:16:10 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?=         <u.kleine-koenig@pengutronix.de>, Mark Brown
 <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Antti Palosaari <crope@iki.fi>, Sergey Kozlov
 <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, Yasunari Takiguchi
 <Yasunari.Takiguchi@sony.com>, Michael Krufky <mkrufky@linuxtv.org>,
 Matthias Schwarzott <zzam@gentoo.org>, Akihiro Tsukada <tskd08@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 3/4] lib/math/int_log: Replace LGPL-2.1-or-later
 boilerplate with SPDX identifier
Message-ID: <20230703081610.5ffea861@sal.lan>
In-Reply-To: <20230619172019.21457-4-andriy.shevchenko@linux.intel.com>
References: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
	<20230619172019.21457-4-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CA7NGKEJ5WBOU4XNLK4QLAUCFBLIKVET
X-Message-ID-Hash: CA7NGKEJ5WBOU4XNLK4QLAUCFBLIKVET
X-MailFrom: mchehab@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CA7NGKEJ5WBOU4XNLK4QLAUCFBLIKVET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Mon, 19 Jun 2023 20:20:18 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> Replace license boilerplate in udftime.c with SPDX identifier for
> LGPL-2.1-or-later.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  include/linux/int_log.h | 11 +----------
>  lib/math/int_log.c      | 11 +----------
>  2 files changed, 2 insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/int_log.h b/include/linux/int_log.h
> index 332306202464..0a6f58c38b61 100644
> --- a/include/linux/int_log.h
> +++ b/include/linux/int_log.h
> @@ -1,17 +1,8 @@
> +/* SPDX-License-Identifier: LGPL-2.1-or-later */
>  /*
>   * Provides fixed-point logarithm operations.
>   *
>   * Copyright (C) 2006 Christoph Pfister (christophpfister@gmail.com)
> - *
> - * This library is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU Lesser General Public License as
> - * published by the Free Software Foundation; either version 2.1 of
> - * the License, or (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> - * GNU Lesser General Public License for more details.
>   */
>  
>  #ifndef __LINUX_INT_LOG_H
> diff --git a/lib/math/int_log.c b/lib/math/int_log.c
> index ea98fc0b3fe2..8f9da3a2ad39 100644
> --- a/lib/math/int_log.c
> +++ b/lib/math/int_log.c
> @@ -1,17 +1,8 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later
>  /*
>   * Provides fixed-point logarithm operations.
>   *
>   * Copyright (C) 2006 Christoph Pfister (christophpfister@gmail.com)
> - *
> - * This library is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU Lesser General Public License as
> - * published by the Free Software Foundation; either version 2.1 of
> - * the License, or (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> - * GNU Lesser General Public License for more details.
>   */
>  
>  #include <linux/bitops.h>
