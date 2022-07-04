Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3116564ECD
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 09:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F59B82B;
	Mon,  4 Jul 2022 09:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F59B82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656920223;
	bh=Q0jhAfVtaXX/0rO/evIVGyVYSNPYOU8ggf+ALIBohTc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBY1hpeO6lrfj3tlT23yW9lDDFRUYIxD2+/jw+ezAzbNOa8pAA3DpRebvJM+kyteC
	 90Ih1L0OMTvCLLRFB7fYz6IYlsbAd7jzqMr7f8OSSaSK71Sd2B3wYU/DQpWXX+yJiY
	 sRAehSj37c08x4Dt+MUVaWmtQg1QlsT0eYJm+2TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC614F80165;
	Mon,  4 Jul 2022 09:36:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B32A3F8014E; Mon,  4 Jul 2022 09:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3330F80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 09:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3330F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RKx4JTAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656920156; x=1688456156;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q0jhAfVtaXX/0rO/evIVGyVYSNPYOU8ggf+ALIBohTc=;
 b=RKx4JTAbxc8DPIQdNoENFrFXXFVU9gxCBwA/8PaDtLFey+prf5sZFEiE
 OzFQn7A+ZQaWbNS4Ee0+is8SJfWMqF6mpXPAdOM5TSNtLg4KZdbdm/LO/
 B5cUwAg6C9+FOoQTRBtZg81WTuLpZ1Tjg/AXICSWpwKSTN7P+bvkEy7jl
 WeJllE/GvwLTJ7fKXU4KrmJWgHKnRgk4c8th3Y3NJRm/MJXuA52xBjEXy
 /OWqFanUcHBpGTiOEwwhs61RODLCNAFUB05knwgO9Y6TI6D75TVdqcpHY
 jSzJAhU4tdw12RGStDRw6nbFVXtjgu6VcemFTcxIISHW4amUGibksSuUE A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="347039966"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="347039966"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 00:35:50 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="567076613"
Received: from rogerior-mobl1.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 00:35:47 -0700
Message-ID: <9c67d656-9990-7206-58b4-3de25d8341a0@linux.intel.com>
Date: Mon, 4 Jul 2022 10:36:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/1] ASoC: Intel: catpt: remove duplicating driver data
 retrieval
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220703145152.62297-1-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220703145152.62297-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 03/07/2022 17:51, Andy Shevchenko wrote:
> device_get_match_data() in ACPI case calls similar to acpi_match_device().
> Hence there is no need to duplicate the call. Just assign what is in
> the id->driver_data.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: dropped device_get_match_data() and rewrote commit message
>  sound/soc/intel/catpt/device.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
> index 85a34e37316d..2eeaeb962532 100644
> --- a/sound/soc/intel/catpt/device.c
> +++ b/sound/soc/intel/catpt/device.c
> @@ -247,6 +247,7 @@ static int catpt_acpi_probe(struct platform_device *pdev)
>  	id = acpi_match_device(dev->driver->acpi_match_table, dev);
>  	if (!id)
>  		return -ENODEV;
> +	spec = (const struct catpt_spec *)id->driver_data;
>  
>  	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
>  	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SST) {
> @@ -254,10 +255,6 @@ static int catpt_acpi_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	spec = device_get_match_data(dev);
> -	if (!spec)
> -		return -ENODEV;
> -
>  	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
>  	if (!cdev)
>  		return -ENOMEM;

We could just pass the "(const struct catpt_spec *)id->driver_data" in
place of spec to catpt_dev_init() and we can get rid of the local
temporary pointer?

If not, then I would cast out the spec before it's use:
spec = (const struct catpt_spec *)id->driver_data;
catpt_dev_init(cdev, dev, spec);

-- 
Péter
