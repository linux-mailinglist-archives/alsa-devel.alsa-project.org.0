Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943C53500E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 15:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E67121704;
	Thu, 26 May 2022 15:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E67121704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653572172;
	bh=ccP+e+0x/nosfshdISjA02x6IJ4c0GPUsuW17I0+Ilk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE+Kgw8qfOgv15demBuip4BguzngHNw7saEXFsZ+T5NOOtNEAkolRdoGzYdIyCfhi
	 ccBhH8al6Q4QCWngIL8tiQXk/i7VuLZJU2e8kfIqpiIfbjs0dd3Gns9JXVusCKmJEp
	 BHr8z8Ws3EidCFcIaWQHvHNKFK2GgEO7VtY2LN+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EA29F8007E;
	Thu, 26 May 2022 15:35:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B832F8014B; Thu, 26 May 2022 15:35:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9D19F80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 15:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D19F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="I7sTwNws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653572105; x=1685108105;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ccP+e+0x/nosfshdISjA02x6IJ4c0GPUsuW17I0+Ilk=;
 b=I7sTwNwsrrk5IwiLxAzxxP4ZnThYsWwNCpJI/ra3z3h1i918/Rqlh/LC
 1R2tGkknAcfwQQeBKO8j797FOeRl1ti5dBXAqmSdVQ6bX3zNmhg+dhUjz
 ahYBIroTXuOS2LnDfn0hWB27d+fh2l7S9WERfkXa0Fa6i6Q48POtywoEd
 8GcqtSjIFMJ+A82d7eLMCsM8RWW5TCzSK0CBH6RTbHUPyRNbPXdshPbQO
 MM/C6yPXNAuz+UNzj/mrlXftDCHTg/JwQj/OFEcG9nNiHwYoVyBRMfW+8
 xHUbu5ocOLAB4kkGxd0JojyVaZKoursSltYPv6jJoNkreBT6h5sdUbWWO A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274262634"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="274262634"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 06:34:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="578867808"
Received: from sgourshe-mobl1.amr.corp.intel.com (HELO [10.251.3.95])
 ([10.251.3.95])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 06:34:55 -0700
Message-ID: <aedf644d-53fd-988e-ce5c-c4727b07d3b1@linux.intel.com>
Date: Thu, 26 May 2022 08:34:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: Intel: common: fix typo for tplg naming
Content-Language: en-US
To: David Lin <CTLIN0@nuvoton.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220526121301.1819541-1-CTLIN0@nuvoton.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220526121301.1819541-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ctlin0.linux@gmail.com, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, liam.r.girdwood@linux.intel.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com, vamshi.krishna.gopal@intel.com
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



On 5/26/22 07:13, David Lin wrote:
> Correct typo form sof-adl-mx98360a-nau8825.tplg to
> sof-adl-max98360a-nau8825.tplg. The reason is tplg naming without naming
> limitaion of length. It will be consistency with sof topology generation.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Moving forward, I will only approve new machines if I also see the
topology changes.

> ---
>  sound/soc/intel/common/soc-acpi-intel-adl-match.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> index e6e52c7b6803..c1385161cdc8 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> @@ -453,7 +453,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  		.drv_name = "adl_mx98360a_nau8825",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &adl_max98360a_amp,
> -		.sof_tplg_filename = "sof-adl-mx98360a-nau8825.tplg",
> +		.sof_tplg_filename = "sof-adl-max98360a-nau8825.tplg",
>  	},
>  	{
>  		.id = "RTL5682",
