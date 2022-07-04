Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F1D564EB1
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 09:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC5BD16E3;
	Mon,  4 Jul 2022 09:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC5BD16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656919949;
	bh=Ir0YeIg1QD17HDbXae1ShnLiqr2IQnnOCfkowLLq25M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KTt1wkND3ZVMWrbD2DyBQxNuWBluZLsrray2XS0AkLD9dWOtvHV2Q7tZAKlUs/N6n
	 6Jhnyl0PFB29u7XH9S4bFLNy3BpND/kG884s1nDLyYtgspLJL5bzU09BzRwp+fCw+1
	 wVHSy4d5VD5fhsS/9wW7xWrTaf7C543G1Z8rAxAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F173F80165;
	Mon,  4 Jul 2022 09:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D87F8014E; Mon,  4 Jul 2022 09:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB5C5F800ED;
 Mon,  4 Jul 2022 09:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB5C5F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zo2aOV3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656919881; x=1688455881;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ir0YeIg1QD17HDbXae1ShnLiqr2IQnnOCfkowLLq25M=;
 b=Zo2aOV3B9pkoQgt25QIPyJsahaJNBxddB5WK1gsr7oOvkFXGkQkfNCYF
 UIhj9odW79uR48UtJYKH4f4ZqC90aa3bTu0S1BicQUazDkwvNdAJHLuJY
 x21wb8C9LJ4bQmOENgfya23qR6nn8Vmh/zDRm9WUuWeH8f5encUj6Zd0j
 pUf2+yvqDkeDO/aCcgAGIUIisTb2FxCuHizcWVpVeLLeDTx/pOur8GV8Q
 LNcVFFJ1g9hEOvcnHwFmmnbRsW8Aluxr7HCf5byjFmrrpeMOhYLYxG+rX
 vJ0PnF0GgVrWfXegclhg7qMisuxXeuOnDHc6LoZDrxC8ds7kzDWGMiKuf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="369384781"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="369384781"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 00:31:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="567075003"
Received: from rogerior-mobl1.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 00:31:02 -0700
Message-ID: <91f156ba-5d93-63d6-5fa0-86614bc370d3@linux.intel.com>
Date: Mon, 4 Jul 2022 10:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v1 1/1] ASoC: SOF: Intel: bdw: remove duplicating driver
 data retrieval
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220703143533.62173-1-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220703143533.62173-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 03/07/2022 17:35, Andy Shevchenko wrote:
> device_get_match_data() in ACPI case calls similar to acpi_match_device().
> Hence there is no need to duplicate the call. Just assign what is in
> the id->driver_data.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/sof/intel/bdw.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
> index 26df780c702e..346813aa3768 100644
> --- a/sound/soc/sof/intel/bdw.c
> +++ b/sound/soc/sof/intel/bdw.c
> @@ -674,6 +674,7 @@ static int sof_broadwell_probe(struct platform_device *pdev)
>  	id = acpi_match_device(dev->driver->acpi_match_table, dev);
>  	if (!id)
>  		return -ENODEV;
> +	desc = (const struct sof_dev_desc *)id->driver_data;
>  
>  	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
>  	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
> @@ -681,11 +682,7 @@ static int sof_broadwell_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	desc = device_get_match_data(dev);
> -	if (!desc)
> -		return -ENODEV;
> -
> -	return sof_acpi_probe(pdev, device_get_match_data(dev));
> +	return sof_acpi_probe(pdev, desc);
>  }

Would it not be simpler to just:

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 26df780c702e..2ee22c2772ba 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -668,7 +668,6 @@ static int sof_broadwell_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct acpi_device_id *id;
-	const struct sof_dev_desc *desc;
 	int ret;
 
 	id = acpi_match_device(dev->driver->acpi_match_table, dev);
@@ -681,11 +680,7 @@ static int sof_broadwell_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	desc = device_get_match_data(dev);
-	if (!desc)
-		return -ENODEV;
-
-	return sof_acpi_probe(pdev, device_get_match_data(dev));
+	return sof_acpi_probe(pdev, (const struct sof_dev_desc *)id->driver_data);
 }
 
 /* acpi_driver definition */
---
We don't use the desc in sof_broadwell_probe(), so we can just pass the id->driver_data

-- 
Péter
