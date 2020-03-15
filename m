Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03E185FA6
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 21:01:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C904187D;
	Sun, 15 Mar 2020 21:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C904187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584302518;
	bh=yAIznbE5XJi2UgPRWw7vpaLBPAOb9AL2eKciv1BYXXk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vRg3mcKebNqRHzeWLh6Ufy0d+Gz3j/UM1eHdEHh7NV7314FP7isto1v1XbtccaIl0
	 xsisUVk6sbPXqfBN9QyNaeq1OY96XGj05UO86ftW22Qx3qg2DD6dD+kBQRSnv9+qaM
	 WtWA1VwhHch6kBNWF382UEK1Eq4tNom7olLAWtlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AF71F800CD;
	Sun, 15 Mar 2020 21:00:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAD86F8013D; Sun, 15 Mar 2020 21:00:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F4A1F8013D
 for <alsa-devel@alsa-project.org>; Sun, 15 Mar 2020 21:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F4A1F8013D
IronPort-SDR: OQ2n5S88T3zG+HbSjo+T8cYOmUeUsMCIqnTYdsvm6e6JTLwPIteL1gvI7n5bsxk8WXBUY/KZLc
 lA9shOtRuP0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2020 13:00:00 -0700
IronPort-SDR: dVRMO/zdODO8Q2S+WkUiaXJnDridycl7pNmALWr8qyZnl63JuysegLPC9/ug1eJdbSyQSzGJ5B
 ykmz/CwYWxMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,557,1574150400"; d="scan'208";a="267345524"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.138.187])
 ([10.249.138.187])
 by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2020 12:59:59 -0700
Subject: Re: [PATCH v2 07/10] ASoC: Intel: (cosmetic) simplify structure
 member access
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200312194859.4051-1-pierre-louis.bossart@linux.intel.com>
 <20200312194859.4051-8-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <6007244b-3f4e-6ea8-7747-8376da95b6ca@intel.com>
Date: Sun, 15 Mar 2020 20:59:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312194859.4051-8-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org
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

On 2020-03-12 20:48, Pierre-Louis Bossart wrote:
> From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> 
> Fix a clumsy structure member dereference in all machine drivers.
> 

> diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
> index 1a302436d450..058abf3eec50 100644
> --- a/sound/soc/intel/boards/bdw-rt5650.c
> +++ b/sound/soc/intel/boards/bdw-rt5650.c
> @@ -298,7 +298,7 @@ static int bdw_rt5650_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	/* override plaform name, if required */
> -	mach = (&pdev->dev)->platform_data;
> +	mach = pdev->dev.platform_data;
>   	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt5650_card,
>   						    mach->mach_params.platform);
>   

hmm, how about native getter in device.h:
	mach = dev_get_platdata(&pdev->dev);
