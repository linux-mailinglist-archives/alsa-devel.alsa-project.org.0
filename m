Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E300C4328FF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 23:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B25C16C3;
	Mon, 18 Oct 2021 23:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B25C16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634592061;
	bh=j03+gNMAwy6s8wYNxFKbDnRv6LCfxHRbt0adK/qhpaM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=moWSKCtCfSeTBomVwNcWu40j9H8xZ+XF6XrTmgpIWI1joLiJoaKJsOZRjwElhCC0Y
	 vRiK4kArXi4JUz4FCdiUbuq6B28cweB8a+LQddhSU6DYIn3AZGrnEuNwW7Llcb5dUf
	 B0UTJs8vHvsYTUVHxsxCh0f+oR05TjQMm35FrglQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07ED1F80111;
	Mon, 18 Oct 2021 23:19:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C977F80224; Mon, 18 Oct 2021 23:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4820BF80159
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 23:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4820BF80159
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="209160498"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="209160498"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 14:18:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="489809935"
Received: from dsardana-mobl.amr.corp.intel.com (HELO [10.209.189.174])
 ([10.209.189.174])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 14:18:54 -0700
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <991d0129-a566-d078-9174-bccb55e49d01@linux.intel.com>
Date: Mon, 18 Oct 2021 16:18:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018192134.353931-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org
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



On 10/18/21 2:21 PM, Cezary Rojewski wrote:
> HDAudio-extended bus initialization parts are scattered throughout Intel
> ADSP drivers code. Gather them up in snd_hda_ext_bus_init() to provide
> unified initialization point.

What unification are we talking about?

The code for HDaudio differs a great deal between the two Intel drivers,
and specifically the 'nocodec' mode in SOF does not rely on this
library, so there's no burning desire on my side to add this dependency
when we carefully tried to avoid it to use the DMA parts only.

I would add we recently looked at the code and the coupling/decoupling
in this library seems questionable if not broken.

edit: this patch also seems to add a layer of indirection through a
'core' layer, not sure where this is going at all. I must be missing
something.

CC: Ranjani and Kai.

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/sound/hdaudio_ext.h   |  9 ++++++---
>  sound/hda/ext/hdac_ext_bus.c  | 29 ++++++++++++++++++++---------
>  sound/soc/intel/skylake/skl.c |  9 +--------
>  sound/soc/sof/intel/hda-bus.c | 16 +++++++++-------
>  sound/soc/sof/intel/hda.c     |  5 +++--
>  sound/soc/sof/intel/hda.h     |  3 ++-
>  6 files changed, 41 insertions(+), 30 deletions(-)
> 
> diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
> index 375581634143..d1f6e9f7c057 100644
> --- a/include/sound/hdaudio_ext.h
> +++ b/include/sound/hdaudio_ext.h
> @@ -2,11 +2,14 @@
>  #ifndef __SOUND_HDAUDIO_EXT_H
>  #define __SOUND_HDAUDIO_EXT_H
>  
> +#include <linux/pci.h>
>  #include <sound/hdaudio.h>
> +#include <sound/hda_codec.h>
>  
> -int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
> -		      const struct hdac_bus_ops *ops,
> -		      const struct hdac_ext_bus_ops *ext_ops);
> +int snd_hda_ext_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
> +			 const struct hdac_bus_ops *ops,
> +			 const struct hdac_ext_bus_ops *ext_ops,
> +			 const char *model);
>  
>  void snd_hdac_ext_bus_exit(struct hdac_bus *bus);
>  int snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr,
> diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/ext/hdac_ext_bus.c
> index 765c40a6ccba..a89e2e80ea4c 100644
> --- a/sound/hda/ext/hdac_ext_bus.c
> +++ b/sound/hda/ext/hdac_ext_bus.c
> @@ -10,15 +10,17 @@
>   */
>  
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
>  #include <sound/hdaudio_ext.h>
> +#include <sound/hda_codec.h>
>  
>  MODULE_DESCRIPTION("HDA extended core");
>  MODULE_LICENSE("GPL v2");
>  
>  /**
> - * snd_hdac_ext_bus_init - initialize a HD-audio extended bus
> + * snd_hda_ext_bus_init - initialize a HD-audio extended bus
>   * @bus: the pointer to HDAC bus object
>   * @dev: device pointer
>   * @ops: bus verb operators
> @@ -26,28 +28,37 @@ MODULE_LICENSE("GPL v2");
>   *
>   * Returns 0 if successful, or a negative error code.
>   */
> -int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
> -			const struct hdac_bus_ops *ops,
> -			const struct hdac_ext_bus_ops *ext_ops)
> +int snd_hda_ext_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
> +			 const struct hdac_bus_ops *ops,
> +			 const struct hdac_ext_bus_ops *ext_ops,
> +			 const char *model)

missing kernel doc update?

>  {
> +	struct hdac_bus *base = &bus->core;
>  	int ret;
>  
> -	ret = snd_hdac_bus_init(bus, dev, ops);
> +	ret = snd_hdac_bus_init(base, &pdev->dev, ops);
>  	if (ret < 0)
>  		return ret;
>  
> -	bus->ext_ops = ext_ops;
> +	base->ext_ops = ext_ops;
>  	/* FIXME:
>  	 * Currently only one bus is supported, if there is device with more
>  	 * buses, bus->idx should be greater than 0, but there needs to be a
>  	 * reliable way to always assign same number.
>  	 */
> -	bus->idx = 0;
> -	bus->cmd_dma_state = true;
> +	base->idx = 0;
> +	base->cmd_dma_state = true;
> +	base->use_posbuf = 1;
> +	base->bdl_pos_adj = 0;
> +	base->sync_write = 1;
> +	bus->pci = pdev;
> +	bus->modelname = model;
> +	bus->mixer_assigned = -1;
> +	mutex_init(&bus->prepare_mutex);
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_init);
> +EXPORT_SYMBOL_GPL(snd_hda_ext_bus_init);
>  
>  /**
>   * snd_hdac_ext_bus_exit - clean up a HD-audio extended bus
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index 5b1a15e39912..95de41d14e56 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -886,16 +886,9 @@ static int skl_create(struct pci_dev *pci,
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
>  	ext_ops = snd_soc_hdac_hda_get_ops();
>  #endif
> -	snd_hdac_ext_bus_init(bus, &pci->dev, NULL, ext_ops);
> -	bus->use_posbuf = 1;
> +	snd_hda_ext_bus_init(hbus, pci, NULL, ext_ops, "sklbus");
>  	skl->pci = pci;
>  	INIT_WORK(&skl->probe_work, skl_probe_work);
> -	bus->bdl_pos_adj = 0;
> -
> -	mutex_init(&hbus->prepare_mutex);
> -	hbus->pci = pci;
> -	hbus->mixer_assigned = -1;
> -	hbus->modelname = "sklbus";
>  
>  	*rskl = skl;
>  
> diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
> index 30025d3c16b6..5d5081f80e88 100644
> --- a/sound/soc/sof/intel/hda-bus.c
> +++ b/sound/soc/sof/intel/hda-bus.c
> @@ -8,6 +8,7 @@
>  // Authors: Keyon Jie <yang.jie@linux.intel.com>
>  
>  #include <linux/io.h>
> +#include <linux/pci.h>
>  #include <sound/hdaudio.h>
>  #include <sound/hda_i915.h>
>  #include "../sof-priv.h"
> @@ -53,24 +54,25 @@ static const struct hdac_bus_ops bus_core_ops = {
>  /*
>   * This can be used for both with/without hda link support.
>   */
> -void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev)
> +void sof_hda_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
> +		      const char *model)
>  {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> -	snd_hdac_ext_bus_init(bus, dev, &bus_core_ops, sof_hda_ext_ops);
> +	snd_hda_ext_bus_init(bus, pdev, &bus_core_ops, sof_hda_ext_ops, model);
>  #else /* CONFIG_SND_SOC_SOF_HDA */
>  	memset(bus, 0, sizeof(*bus));
> -	bus->dev = dev;
> +	bus->core.dev = &pdev->dev;
>  
> -	INIT_LIST_HEAD(&bus->stream_list);
> +	INIT_LIST_HEAD(&bus->core.stream_list);
>  
> -	bus->irq = -1;
> +	bus->core.irq = -1;
>  
>  	/*
>  	 * There is only one HDA bus atm. keep the index as 0.
>  	 * Need to fix when there are more than one HDA bus.
>  	 */
> -	bus->idx = 0;
> +	bus->core.idx = 0;

why is this level of indirection through 'core' needed in this code
which doesn't use the hdaudio-ext library?

the changes here have nothing to do with snd_hda_ext_bus_init()?

> -	spin_lock_init(&bus->reg_lock);
> +	spin_lock_init(&bus->core.reg_lock);

same, we've just added reg_lock everywhere, why use a different one

>  #endif /* CONFIG_SND_SOC_SOF_HDA */
>  }
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index fbc2421c77f8..03a68d286c7c 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -609,8 +609,9 @@ static int hda_init(struct snd_sof_dev *sdev)
>  	bus = sof_to_bus(sdev);
>  
>  	/* HDA bus init */
> -	sof_hda_bus_init(bus, &pci->dev);
> +	sof_hda_bus_init(hbus, pci, hda_model);
>  
> +#if !IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
>  	bus->use_posbuf = 1;
>  	bus->bdl_pos_adj = 0;
>  	bus->sync_write = 1;
> @@ -619,7 +620,7 @@ static int hda_init(struct snd_sof_dev *sdev)
>  	hbus->pci = pci;
>  	hbus->mixer_assigned = -1;
>  	hbus->modelname = hda_model;
> -

spurious line change

> +#endif
>  	/* initialise hdac bus */
>  	bus->addr = pci_resource_start(pci, 0);
>  	bus->remap_addr = pci_ioremap_bar(pci, 0);
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 1195018a1f4f..a4ec88f36512 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -635,7 +635,8 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev);
>  /*
>   * HDA bus operations.
>   */
> -void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
> +void sof_hda_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
> +		      const char *model);
>  
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
>  /*
> 
