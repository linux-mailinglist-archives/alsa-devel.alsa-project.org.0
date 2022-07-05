Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7F567618
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 20:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 553EB166D;
	Tue,  5 Jul 2022 19:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 553EB166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657044042;
	bh=jWFMuzOwTF/I32i1P2X0zjw0ibfU/WeavbtARFtZfEg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vrt7RS9q+bTx6Cz6OEg7FvEJD12mqsICpD2X1oOm6wk0zIrvdRzhDs2x/Y0uf8kmX
	 pVvLlyanZVXZ9zATXuZVBOrjqUOLyFOf2ERwB2+QhMwxpH6fft4HyRxaUlYX2az4wP
	 qzftXJO6VWZbklAvloiysKrQPL8SAwBQ0ckXdv1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C356BF804B2;
	Tue,  5 Jul 2022 19:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5188BF8015B; Tue,  5 Jul 2022 19:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E0E7F8012A;
 Tue,  5 Jul 2022 19:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E0E7F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MPDymiXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657043973; x=1688579973;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jWFMuzOwTF/I32i1P2X0zjw0ibfU/WeavbtARFtZfEg=;
 b=MPDymiXWWZU/7x/VVbJe0SAxlX3Qv5G3g/kfR0/wVlQTF1KvSbtSFDjE
 v6Z5GG2xiksEWoHIaxAiWlIw0lQRhk++38y5izZsJZw5mU5yzyKCMDTSc
 2JXh50K8c7L/vkZMXMU6yld8nhctJgIRsPHf5fOA71TyZoRFAUmtottOW
 b/ag6Z/0fyUFG0eaW48v/s7fGpGAVTglI0NExFO/hrXT2aIow1WT2MFFK
 TYphu0zgYJLv0FA9kCB+MXyHFRNX8HF1n2M49ToTSFTtKmPRKAJqmLmW3
 O7ghOOThX5SS+CTIpygxST+eIU3r4J3vJhTjQCZRv6T4bQiZEw7+aWvof A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="283456727"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="283456727"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 10:53:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="682608821"
Received: from wxu3-mobl1.amr.corp.intel.com (HELO [10.212.54.191])
 ([10.212.54.191])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 10:53:52 -0700
Message-ID: <09a7734c-dc79-21a1-1b24-9639f2a17e58@linux.intel.com>
Date: Tue, 5 Jul 2022 11:57:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] ASoC: SOF: Intel: bdw: remove duplicating driver
 data retrieval
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220705161102.76250-1-andriy.shevchenko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220705161102.76250-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

> ---
> v2: moved desc assignment closer to its user (Péter)
>  sound/soc/sof/intel/bdw.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
> index 26df780c702e..a446154f2803 100644
> --- a/sound/soc/sof/intel/bdw.c
> +++ b/sound/soc/sof/intel/bdw.c
> @@ -681,11 +681,8 @@ static int sof_broadwell_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	desc = device_get_match_data(dev);
> -	if (!desc)
> -		return -ENODEV;
> -
> -	return sof_acpi_probe(pdev, device_get_match_data(dev));
> +	desc = (const struct sof_dev_desc *)id->driver_data;
> +	return sof_acpi_probe(pdev, desc);
>  }
>  
>  /* acpi_driver definition */
