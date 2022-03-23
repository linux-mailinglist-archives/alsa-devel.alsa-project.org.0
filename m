Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC034E4E45
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 09:30:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4B5172C;
	Wed, 23 Mar 2022 09:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4B5172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648024210;
	bh=1RS7MG4sJrqejbT6wcSzpVIKqn4WujG1lTYtG0ilBN0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PAlIzTXGy6A6+Qure6mWu1hbW5Lpt+UWVktcBf1ZSj8Tpk8mLZcawcMXxp/Vvq2l2
	 otODQUrBy0ZMLaB21xjYKgQczaiu+TVoCcRFpHROXOfhDu6ZyWvNTXYg9+YbDo0mY8
	 RLvh5qBeas9vTuZUtu2vrQ+FT/BdOlsxFoxg/Jw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26249F804D0;
	Wed, 23 Mar 2022 09:29:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 957FFF800F5; Wed, 23 Mar 2022 09:29:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D39F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 09:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D39F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QjPqPeCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648024152; x=1679560152;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1RS7MG4sJrqejbT6wcSzpVIKqn4WujG1lTYtG0ilBN0=;
 b=QjPqPeCnM7Lp9QclOLzd5juUXm1fmD23NhXBDVebWw8W2tD/w54m5Zs3
 kUenEwWwMqd+vOOj4MKb0NMoFUxfyXb9NyBlQ884W3E27b3QXPDn6vh2T
 TDh6/VvZtIL1t5aCspPAl4CvEbETUFHS4cIUyeHoPBRInk1KVzu7/I7Dj
 8/7gpruTUT8EabLKdEXK4vNvU2uCOlyz/cVFmnQEojNnJqiEM2ZgYx4Tf
 2HRXCr4ydoxXEZCPBc893AUPqhvuKUBv8yp4NyaX3CjAXmuORU6K60mWp
 fkDY29syrm5wL8qMVQZxXqK7yjGg21pwrUx7IQQRwc8RiIIkFXd94RVLt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="245527559"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="245527559"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:29:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="560796863"
Received: from arturlex-mobl1.ger.corp.intel.com (HELO [10.99.249.37])
 ([10.99.249.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:29:05 -0700
Message-ID: <f96222e2-dd66-45aa-7615-7fed99479da6@linux.intel.com>
Date: Wed, 23 Mar 2022 09:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/3] update tas27xx.h to support either TAS2764 or
 TAS2780
Content-Language: en-US
To: Raphael-Xu <13691752556@139.com>, broonie@kernel.org
References: <20220323042644.635-1-13691752556@139.com>
 <20220323042644.635-3-13691752556@139.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220323042644.635-3-13691752556@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, raphael-xu@ti.com, shenghao-ding@ti.com,
 navada@ti.com
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

On 3/23/2022 5:26 AM, Raphael-Xu wrote:
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>   sound/soc/codecs/tas27xx.h | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/codecs/tas27xx.h b/sound/soc/codecs/tas27xx.h
> index 67d6fd903c42..02b29c030d37 100644
> --- a/sound/soc/codecs/tas27xx.h
> +++ b/sound/soc/codecs/tas27xx.h
> @@ -1,18 +1,20 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * tas2764.h - ALSA SoC Texas Instruments TAS2764 Mono Audio Amplifier
> + * tas27xx.h - ALSA SoC Texas Instruments TAS2764/TAS2780
> + *		Mono Audio Amplifier
>    *
> - * Copyright (C) 2020 Texas Instruments Incorporated -  https://www.ti.com
> + * Copyright (C) 2022 Texas Instruments Incorporated -
> + *		https://www.ti.com
>    *
> - * Author: Dan Murphy <dmurphy@ti.com>
> + * Author:
>    */
>   
> -#ifndef __TAS2764__
> -#define __TAS2764__
> +#ifndef __TAS27XX__H_
> +#define __TAS27XX__H_
>   
>   /* Book Control Register */
> -#define TAS2764_BOOKCTL_PAGE	0
> -#define TAS2764_BOOKCTL_REG	127
> +#define TAS27XX_BOOKCTL_PAGE	0
> +#define TAS27XX_BOOKCTL_REG	127
>   #define TAS2764_REG(page, reg)	((page * 128) + reg)
>   
>   /* Page */
> @@ -77,6 +79,10 @@
>   #define TAS2764_TDM_CFG3_RXS_SHIFT	0x4
>   #define TAS2764_TDM_CFG3_MASK		GENMASK(3, 0)
>   
> +/* TDM Configuration Reg4 */
> +#define TAS2764_TDM_CFG4		TAS2764_REG(0X0, 0x0d)
> +#define TAS2764_TDM_CFG4_TX_OFFSET_MASK	GENMASK(3, 1)
> +
>   /* TDM Configuration Reg5 */
>   #define TAS2764_TDM_CFG5		TAS2764_REG(0X0, 0x0e)
>   #define TAS2764_TDM_CFG5_VSNS_MASK	BIT(6)
> @@ -89,4 +95,9 @@
>   #define TAS2764_TDM_CFG6_ISNS_ENABLE	BIT(6)
>   #define TAS2764_TDM_CFG6_50_MASK	GENMASK(5, 0)
>   
> -#endif /* __TAS2764__ */
> +/* INT&CLK CFG */
> +#define TAS27XX_CLK_CFG			TAS2764_REG(0X0, 0x5c)
> +#define TAS27XX_CLK_CFG_MASK		GENMASK(7, 6)
> +#define TAS27XX_CLK_CFG_ENABLE		(BIT(7) | BIT(6))
> +
> +#endif /* __TAS27XX__H_ */
> \ No newline at end of file

And this patch should probably go before patch 2, otherwise there will 
be build failure on patch 2?
