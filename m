Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C0A7CB4
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 09:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3EBD167D;
	Wed,  4 Sep 2019 09:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3EBD167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567581872;
	bh=rT4CWpv4C/pXf5KTp8PI1FJ1lG9Lnmf0dtpfj2fUdxY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q9tKXK+9QGAAiG3eTfjRIgYyw8tR5rtrrw+saUJ2/i8EKqb77EbUo4YsqkROnVG+1
	 3fcWHHz4+pR6NbkzBVOLXQLEQim+4NObemnf6E20zkyHHQdMNIP6xmkFcuX4LgOw0I
	 /Vh319u5mNcR8koOvT/0nwKCuB52pgSOF/72epAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C97F803D0;
	Wed,  4 Sep 2019 09:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B468CF803A6; Wed,  4 Sep 2019 09:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BA87F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 09:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BA87F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y0KAzybO"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89E3E23402;
 Wed,  4 Sep 2019 07:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567581760;
 bh=x6bRQXtE+JuINtFNse5ZrkGOp3vWHxjVq//MaaJDsH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y0KAzybOASAf9aiT777mX8X2qRWKoYVns4JaOMKfOQ6yz2uD5WDOz/S8r3Rt4QWbN
 ivIguFUliKCQmQHzd+JsEUtCGAeeWVpx8ZBs7rPLspzJO5uyWMeffVR4qDtHE3AV7A
 CW5RI/OV7L0J6wQ44dO2//RR542gdkKHyJbck8J8=
Date: Wed, 4 Sep 2019 12:51:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190904072131.GK2672@vkoul-mobl>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190821201720.17768-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821201720.17768-4-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Pan Xiuli <xiuli.pan@linux.intel.com>, Keyon Jie <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, srinivas.kandagatla@linaro.org,
 jank@cadence.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Rander Wang <rander.wang@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 3/5] ASoC: SOF: Intel: hda: add
	SoundWire IP support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 21-08-19, 15:17, Pierre-Louis Bossart wrote:
> The Core0 needs to be powered before the SoundWire IP is initialized.
> 
> Call sdw_intel_init/exit and store the context. We only have one
> context, but depending on the hardware capabilities and BIOS settings
> may enable multiple SoundWire links.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/sof/intel/hda.c | 40 +++++++++++++++++++++++++++++++++------
>  sound/soc/sof/intel/hda.h |  5 +++++
>  2 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index a968890d0754..e754058e3679 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -57,6 +57,8 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
>  {
>  	acpi_handle handle;
>  	struct sdw_intel_res res;
> +	struct sof_intel_hda_dev *hdev;
> +	void *sdw;
>  
>  	handle = ACPI_HANDLE(sdev->dev);
>  
> @@ -66,23 +68,32 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
>  	res.irq = sdev->ipc_irq;
>  	res.parent = sdev->dev;
>  
> -	hda_sdw_int_enable(sdev, true);
> -
> -	sdev->sdw = sdw_intel_init(handle, &res);
> -	if (!sdev->sdw) {
> +	sdw = sdw_intel_init(handle, &res);

should this be called for platforms without sdw, I was hoping that some
checks would be performed.. For example how would skl deal with this?

> +	if (!sdw) {
>  		dev_err(sdev->dev, "SDW Init failed\n");
>  		return -EIO;
>  	}
>  
> +	hda_sdw_int_enable(sdev, true);
> +
> +	/* save context */
> +	hdev = sdev->pdata->hw_pdata;
> +	hdev->sdw = sdw;
> +
>  	return 0;
>  }
>  
>  static int hda_sdw_exit(struct snd_sof_dev *sdev)
>  {
> +	struct sof_intel_hda_dev *hdev;
> +
> +	hdev = sdev->pdata->hw_pdata;
> +
>  	hda_sdw_int_enable(sdev, false);
>  
> -	if (sdev->sdw)
> -		sdw_intel_exit(sdev->sdw);

this looks suspect, you are adding sdw calls here so how is this getting
removed? Did I miss something...

> +	if (hdev->sdw)
> +		sdw_intel_exit(hdev->sdw);
> +	hdev->sdw = NULL;
>  
>  	return 0;
>  }
> @@ -713,6 +724,21 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>  	/* set default mailbox offset for FW ready message */
>  	sdev->dsp_box.offset = HDA_DSP_MBOX_UPLINK_OFFSET;
>  
> +	/* need to power-up core before setting-up capabilities */
> +	ret = hda_dsp_core_power_up(sdev, HDA_DSP_CORE_MASK(0));
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "error: could not power-up DSP subsystem\n");
> +		goto free_ipc_irq;
> +	}
> +
> +	/* initialize SoundWire capabilities */
> +	ret = hda_sdw_init(sdev);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "error: SoundWire get caps error\n");
> +		hda_dsp_core_power_down(sdev, HDA_DSP_CORE_MASK(0));
> +		goto free_ipc_irq;
> +	}
> +
>  	return 0;
>  
>  free_ipc_irq:
> @@ -744,6 +770,8 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
>  	snd_hdac_ext_bus_device_remove(bus);
>  #endif
>  
> +	hda_sdw_exit(sdev);
> +
>  	if (!IS_ERR_OR_NULL(hda->dmic_dev))
>  		platform_device_unregister(hda->dmic_dev);
>  
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index c8f93317aeb4..48e09b7daf0a 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -399,6 +399,11 @@ struct sof_intel_hda_dev {
>  
>  	/* DMIC device */
>  	struct platform_device *dmic_dev;
> +
> +#if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)

is this really required, context is a void pointer

> +	/* sdw context */
> +	void *sdw;

> +#endif
>  };
>  
>  static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
