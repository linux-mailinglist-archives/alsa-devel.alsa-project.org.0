Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2404056761A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 20:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBBE516F0;
	Tue,  5 Jul 2022 20:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBBE516F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657044078;
	bh=Pfm/RYAueDuO2Oi8EfsfQLxSrg3TUplLuLB+vxlNeh0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STXQYMGE2u9nLqh9fc9ISrPxuPX42P9aRqqJsRMkQbkREurk49/AHm1pxNsio0NuR
	 RwtLg6XxJ5KQEvJIbXYViTiHeD2LOSp5yoOWv9Dgm3daNd+9jK77/cmx0ZZfu38yuu
	 9TupQGJajCjsM9HAEe9y+T0SbeDPnXq7XKyeO7Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD4DF80538;
	Tue,  5 Jul 2022 19:59:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59103F80537; Tue,  5 Jul 2022 19:59:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D680CF80153;
 Tue,  5 Jul 2022 19:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D680CF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nYAfzLjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657043977; x=1688579977;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Pfm/RYAueDuO2Oi8EfsfQLxSrg3TUplLuLB+vxlNeh0=;
 b=nYAfzLjnITBD8b54zOpyRwgYK3RvTOIGMIt1Ck90j09C8G+Df4pqRsax
 5hm4mmFq7EZD0TAmW8ULuObQzYXTYPSBza6VWQovIegUeTM4Bosqo60aS
 BguzC5EabFp1odXhdfxp8OKkBsqJN85pcKZCQAL6PE7bpSA/kKNc+euKk
 nwd5thfXbYp2/UnaPKPHt3wI3j1KqP0VzMcKgMuTaDqHv95kd5BIuuatJ
 C66/I3+5JgNaw8ODtDcIsSDe5ubadbb6xYDgXFw5d8Q7+YgqPakyMeZ5v
 H7HFXiacBfYWDug7xtWdd32lZQCKP59gz5+tX8ABf0j09FkCMhl70hvO3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="283456731"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="283456731"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 10:53:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="682608856"
Received: from wxu3-mobl1.amr.corp.intel.com (HELO [10.212.54.191])
 ([10.212.54.191])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 10:53:53 -0700
Message-ID: <377f2c4a-562b-9384-adfc-8180964c2b42@linux.intel.com>
Date: Tue, 5 Jul 2022 11:57:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] ASoC: SOF: Intel: byt: remove duplicating driver
 data retrieval
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220705161102.76250-1-andriy.shevchenko@linux.intel.com>
 <20220705161102.76250-2-andriy.shevchenko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220705161102.76250-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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



On 7/5/22 11:11, Andy Shevchenko wrote:
> device_get_match_data() in ACPI case calls similar to acpi_match_device().
> Hence there is no need to duplicate the call. Just assign what is in
> the id->driver_data.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Andy!

> ---
> v2: new patch (Pierre)
>  sound/soc/sof/intel/byt.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
> index 4ed8381eceda..e6dc4ff531c3 100644
> --- a/sound/soc/sof/intel/byt.c
> +++ b/sound/soc/sof/intel/byt.c
> @@ -465,10 +465,7 @@ static int sof_baytrail_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	desc = device_get_match_data(&pdev->dev);
> -	if (!desc)
> -		return -ENODEV;
> -
> +	desc = (const struct sof_dev_desc *)id->driver_data;
>  	if (desc == &sof_acpi_baytrail_desc && soc_intel_is_byt_cr(pdev))
>  		desc = &sof_acpi_baytrailcr_desc;
>  
