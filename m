Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C687511C2C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223DA1616;
	Wed, 27 Apr 2022 18:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223DA1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651075419;
	bh=fqVdjaz6qlAuF6lixzxQYIJp8RiyZt6+dszD4kg0WRU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=onhZRlSCFC8wlbxYKpcJmzUYq7Xrh6GQnY0jimgjTpylTJ6N1jHwKrArlAvjmf1sK
	 jnEY+STLUKMj0S0wZRAzmouUSO/UCv4rIWAeUDqOAkNNFQ//fY/UkshDxPkoMecrRU
	 5dNWI+t1XuTSnxE/qN8askMMTyyKi/6SvAX0PNOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8412BF80506;
	Wed, 27 Apr 2022 18:02:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA288F80253; Wed, 27 Apr 2022 18:02:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42122F8016E
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 18:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42122F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ddkGAJnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651075327; x=1682611327;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fqVdjaz6qlAuF6lixzxQYIJp8RiyZt6+dszD4kg0WRU=;
 b=ddkGAJnRifQKcgDdHV0cvG/8l5XHCo3X2EZVisc/F4sJR8BexHbjuQ57
 bPJk9p+5zNAEo2Q390lsFFbXPA6dsNA1+WQL7QpXSwQw8un7b21XQ2Is4
 op1dHnhfGmDSfhlBypiF7udSnwVNDF60YkF/7LiZpwzLbvD+VHNEVXa+T
 DOFTvRwwkB5VCLts7PtD+hugTGbgg2cWcw3XwHRFF0j9BZLowObXeEPeL
 enNa+8pQIRX6oXrnlOl4kmP4OFrhsrt7901zJnMnVp0BlEcwwwpAlWVQu
 4TzEwNihOaChBuAKYH9/WldsspjRZmTsFDGe3bnjiyDpXaIsPKZZdmU7D g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="352414810"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="352414810"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:56:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="559008211"
Received: from dktowns1-mobl2.amr.corp.intel.com (HELO [10.209.20.44])
 ([10.209.20.44])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:56:38 -0700
Message-ID: <ec01bea7-3757-b891-00d4-2ad6520e2ab5@linux.intel.com>
Date: Wed, 27 Apr 2022 10:52:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for the HP Pro
 Tablet 408
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20220427134918.527381-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220427134918.527381-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 4/27/22 08:49, Hans de Goede wrote:
> Add a quirk for the HP Pro Tablet 408, this BYTCR tablet has no CHAN
> package in its ACPI tables and uses SSP0-AIF1 rather then SSP0-AIF2 which
> is the default for BYTCR devices.
> 
> It also uses DMIC1 for the internal mic rather then the default IN3
> and it uses JD2 rather then the default JD1 for jack-detect.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211485
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans!

> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index d76a505052fb..f81ae742faa7 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -773,6 +773,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>  					BYT_RT5640_OVCD_SF_0P75 |
>  					BYT_RT5640_MCLK_EN),
>  	},
> +	{	/* HP Pro Tablet 408 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pro Tablet 408"),
> +		},
> +		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
> +					BYT_RT5640_JD_SRC_JD2_IN4N |
> +					BYT_RT5640_OVCD_TH_1500UA |
> +					BYT_RT5640_OVCD_SF_0P75 |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>  	{	/* HP Stream 7 */
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
