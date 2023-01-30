Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B56816C9
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 17:47:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E60E085D;
	Mon, 30 Jan 2023 17:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E60E085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675097220;
	bh=7TnxnDL6sOPeKME426fnoBb2LpMx6BEWRmPV9j5lEzY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UnXyWrby8tTstSxuWfiKKC6FXSlK4NO8+pFnNNKvCbv5TaufCC+XN6IDY4Wwshivf
	 FM7V2rBf6oVwcMQOyf52wGMfSM2jH0RpVvYITFnHMMOhONn/sqozhHALz9ogzhgcx4
	 /306UlBkfOTpCYxdrhNimFYzxt/iiS2uG0bdMZRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED0FF80236;
	Mon, 30 Jan 2023 17:46:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2A16F80155; Mon, 30 Jan 2023 17:45:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E17DF80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 17:45:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E17DF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YDUJdXOa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675097154; x=1706633154;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7TnxnDL6sOPeKME426fnoBb2LpMx6BEWRmPV9j5lEzY=;
 b=YDUJdXOa5FGZ3zDE0hnJMyOGtE93lpjCS70ZArRFSVWWLaaqFSwJc83L
 +/J7G+iLqnygqUsHtzXgla9NsjeP5+4Cq1G2KKRoCdzjle82Nm8D0xkgm
 Iervd4QxD1WW+T7Utv6ok5iipxcDRVh/KXiRWfHON4UxEqhqpJ4qFMQ3q
 1MkL0Rz8J4bT2vPXbwM45qWlun7id19zl6X7aWsuOwgkc/dL2nvxAc1HA
 rgrO+bj1bvek/QMgfWbJQfWjqSL7BQOxbA1JjIf7FoVH7C7CiWiCECist
 RURMTBwgdLmGw2uwcwP/h4kBhHO2oqIJrTANyUPpOu2JhEpj3bDh3KVO5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307260813"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="307260813"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732763599"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="732763599"
Received: from inuber-mobl5.amr.corp.intel.com (HELO [10.212.58.60])
 ([10.212.58.60])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:48 -0800
Message-ID: <960b66c7-f476-b40c-b507-6932ff51ce76@linux.intel.com>
Date: Mon, 30 Jan 2023 10:32:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/8] ASoC: cs42l42: Add SOFT_RESET_REBOOT register
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-3-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230127165111.3010960-3-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/27/23 10:51, Stefan Binding wrote:
> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> The SOFT_RESET_REBOOT register is needed to recover CS42L42 state after
> a Soundwire bus reset.
> 
> This is required to be set whenever there is severe/hard bus reset.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  include/sound/cs42l42.h    | 5 +++++
>  sound/soc/codecs/cs42l42.c | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
> index 1d1c24fdd0cae..3994e933db195 100644
> --- a/include/sound/cs42l42.h
> +++ b/include/sound/cs42l42.h
> @@ -34,6 +34,7 @@
>  #define CS42L42_PAGE_24		0x2400
>  #define CS42L42_PAGE_25		0x2500
>  #define CS42L42_PAGE_26		0x2600
> +#define CS42L42_PAGE_27		0x2700
>  #define CS42L42_PAGE_28		0x2800
>  #define CS42L42_PAGE_29		0x2900
>  #define CS42L42_PAGE_2A		0x2A00
> @@ -720,6 +721,10 @@
>  
>  #define CS42L42_SRC_SDOUT_FS		(CS42L42_PAGE_26 + 0x09)
>  
> +/* Page 0x27 DMA */
> +#define CS42L42_SOFT_RESET_REBOOT	(CS42L42_PAGE_27 + 0x01)
> +#define CS42L42_SFT_RST_REBOOT_MASK	BIT(1)
> +
>  /* Page 0x28 S/PDIF Registers */
>  #define CS42L42_SPDIF_CTL1		(CS42L42_PAGE_28 + 0x01)
>  #define CS42L42_SPDIF_CTL2		(CS42L42_PAGE_28 + 0x02)
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index 2fefbcf7bd130..82aa11d6937be 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -293,6 +293,7 @@ bool cs42l42_readable_register(struct device *dev, unsigned int reg)
>  	case CS42L42_SPDIF_SW_CTL1:
>  	case CS42L42_SRC_SDIN_FS:
>  	case CS42L42_SRC_SDOUT_FS:
> +	case CS42L42_SOFT_RESET_REBOOT:
>  	case CS42L42_SPDIF_CTL1:
>  	case CS42L42_SPDIF_CTL2:
>  	case CS42L42_SPDIF_CTL3:
> @@ -358,6 +359,7 @@ bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
>  	case CS42L42_LOAD_DET_DONE:
>  	case CS42L42_DET_STATUS1:
>  	case CS42L42_DET_STATUS2:
> +	case CS42L42_SOFT_RESET_REBOOT:
>  		return true;
>  	default:
>  		return false;
