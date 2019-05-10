Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F881A03D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 17:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732881AA6;
	Fri, 10 May 2019 17:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732881AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557502314;
	bh=KftbyjP8SmG6FFG9khYdQwxPq3X5eWGQEEovgJMtiHY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNKuVeRjQsomxOfBpdK9+AxNg/Q/pN92ao2hZrEgX0cEDcJzTZRBLWxwEQpD6P64p
	 pTMZQNBI5XRB6LJHv6eVnrDYmi1uL7hzC9aePPBHEB7qqMcRUXXPvIvHLA6A2GLaSu
	 H1TkfaGB6y228ZqY5JK1f7aQZS0NnKh1QnbqvXtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA1C0F896F0;
	Fri, 10 May 2019 17:30:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D44DBF896FD; Fri, 10 May 2019 17:30:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=PRX_BODY_30,PRX_BODY_72,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2E13F80730
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 17:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2E13F80730
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 08:30:00 -0700
X-ExtLoop1: 1
Received: from sjmeyer-mobl.amr.corp.intel.com (HELO [10.254.97.194])
 ([10.254.97.194])
 by fmsmga001.fm.intel.com with ESMTP; 10 May 2019 08:29:58 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190510023657.8960-1-yuehaibing@huawei.com>
 <s5h7eayn5or.wl-tiwai@suse.de>
 <73c6dd27-895a-adba-a4ef-2992266fcc48@linux.intel.com>
 <s5hlfzempf0.wl-tiwai@suse.de>
 <1e7e1908-a813-6c9b-5b88-122864d3a372@linux.intel.com>
 <s5hbm0amnpl.wl-tiwai@suse.de> <s5h8svemn0u.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <00aa3055-0b97-3ac4-f588-3665bfcb5811@linux.intel.com>
Date: Fri, 10 May 2019 10:29:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5h8svemn0u.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, rdunlap@infradead.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Fix build error with
 CONFIG_SND_SOC_SOF_NOCODEC=m
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/10/19 8:56 AM, Takashi Iwai wrote:
> On Fri, 10 May 2019 15:41:10 +0200,
> Takashi Iwai wrote:
>>
>> On Fri, 10 May 2019 15:34:03 +0200,
>> Pierre-Louis Bossart wrote:
>>>
>>> On 5/10/19 8:04 AM, Takashi Iwai wrote:
>>>> On Fri, 10 May 2019 14:56:29 +0200,
>>>> Pierre-Louis Bossart wrote:
>>>>>
>>>>> On 5/10/19 2:12 AM, Takashi Iwai wrote:
>>>>>> On Fri, 10 May 2019 04:36:57 +0200,
>>>>>> YueHaibing wrote:
>>>>>>>
>>>>>>> Fix gcc build error while CONFIG_SND_SOC_SOF_NOCODEC=m
>>>>>>>
>>>>>>> sound/soc/sof/core.o: In function `snd_sof_device_probe':
>>>>>>> core.c:(.text+0x4af): undefined reference to `sof_nocodec_setup'
>>>>>>>
>>>>>>> Change SND_SOC_SOF_NOCODEC to bool to fix this.
>>>>>>>
>>>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>>>>> Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
>>>>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>>>>
>>>>>> This change would break things severely.  This won't allow to build it
>>>>>> as a module any longer.
>>>>>
>>>>> Isn't this fixed already?
>>>>> See the patch  'ASoC: SOF: core: fix undefined nocodec reference' and
>>>>> Takashi's follow-up to fix the unused variable warning.
>>>>
>>>> Possibly the problem still persists although I haven't seen through my
>>>> local build tests with randconfig.  You can set SND_SOC_SOF=y and
>>>> SND_SOC_NOCODEC=m, i.e. built-in sof-core while nocodec is a module.
>>>
>>> YueHiabing, can you share the config and SHA1 so that we can double check?
>>>
>>> If the problem persists, we can do something like
>>>
>>> config SND_SOF_NOCODEC_SUPPORT
>>> 	bool "SOF nocodec mode support"
>>>
>>> config SND_SOF_NOCODEC
>>> 	tristate
>>>
>>> confir SND_SOC_SOF
>>> 	tristate
>>> 	select SND_SOF_NOCODEC if SND_SOF_NOCODEC_SUPPORT
>>>
>>> that way you propagate the required dependencies
>>
>> Yes, that would work.  OTOH, I see no merit to build an extra module
>> for nocodec.  nocodec.c can be built together with sof-core stuff.

the module has its benefits. Today nocodec includes all possible DAIs, I 
wanted to add module parameters to restrict things a bit for 
tests/debug. It'll be e.g. very helpful for SoundWire to avoid exposing 
the SSP DAIs.

Also nocodec is incompatible with hdaudio/hdmi support at the moment, we 
had all sorts of issues with suspend/resume.

> 
> I mean a patch like below.
> 
> 
> Takashi
> 
> diff --git a/include/sound/sof.h b/include/sound/sof.h
> index 4640566b54fe..1af70800f6dc 100644
> --- a/include/sound/sof.h
> +++ b/include/sound/sof.h
> @@ -92,9 +92,4 @@ struct sof_dev_desc {
>   	const struct sof_arch_ops *arch_ops;
>   };
>   
> -int sof_nocodec_setup(struct device *dev,
> -		      struct snd_sof_pdata *sof_pdata,
> -		      struct snd_soc_acpi_mach *mach,
> -		      const struct sof_dev_desc *desc,
> -		      const struct snd_sof_dsp_ops *ops);
>   #endif
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index b204c65698f9..9c280c977d55 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -44,7 +44,7 @@ config SND_SOC_SOF_OPTIONS
>   if SND_SOC_SOF_OPTIONS
>   
>   config SND_SOC_SOF_NOCODEC
> -	tristate "SOF nocodec mode Support"
> +	bool "SOF nocodec mode Support"
>   	help
>   	  This adds support for a dummy/nocodec machine driver fallback
>   	  option if no known codec is detected. This is typically only
> diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
> index 8f14c9d2950b..09222be6d1b8 100644
> --- a/sound/soc/sof/Makefile
> +++ b/sound/soc/sof/Makefile
> @@ -2,14 +2,12 @@
>   
>   snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
>   		control.o trace.o utils.o
> +snd-sof-$(CONFIG_SND_SOC_SOF_NOCODEC) += nocodec.o
>   
>   snd-sof-pci-objs := sof-pci-dev.o
>   snd-sof-acpi-objs := sof-acpi-dev.o
> -snd-sof-nocodec-objs := nocodec.o
>   
>   obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
> -obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
> -
>   
>   obj-$(CONFIG_SND_SOC_SOF_ACPI) += sof-acpi-dev.o
>   obj-$(CONFIG_SND_SOC_SOF_PCI) += sof-pci-dev.o
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 32105e0fabe8..744f7f465173 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -502,6 +502,18 @@ int snd_sof_device_remove(struct device *dev)
>   }
>   EXPORT_SYMBOL(snd_sof_device_remove);
>   
> +static int __init snd_sof_init(void)
> +{
> +	return platform_driver_register(&sof_nocodec_audio);
> +}
> +module_init(snd_sof_init);
> +
> +static void __exit snd_sof_exit(void)
> +{
> +	platform_driver_unregister(&sof_nocodec_audio);
> +}
> +module_exit(snd_sof_exit);
> +
>   MODULE_AUTHOR("Liam Girdwood");
>   MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
>   MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
> index f84b4344dcc3..11811591bd81 100644
> --- a/sound/soc/sof/nocodec.c
> +++ b/sound/soc/sof/nocodec.c
> @@ -8,7 +8,6 @@
>   // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
>   //
>   
> -#include <linux/module.h>
>   #include <sound/sof.h>
>   #include "sof-priv.h"
>   
> @@ -77,7 +76,6 @@ int sof_nocodec_setup(struct device *dev,
>   				    &sof_nocodec_card);
>   	return ret;
>   }
> -EXPORT_SYMBOL(sof_nocodec_setup);
>   
>   static int sof_nocodec_probe(struct platform_device *pdev)
>   {
> @@ -93,7 +91,7 @@ static int sof_nocodec_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static struct platform_driver sof_nocodec_audio = {
> +struct platform_driver sof_nocodec_audio = {
>   	.probe = sof_nocodec_probe,
>   	.remove = sof_nocodec_remove,
>   	.driver = {
> @@ -101,9 +99,3 @@ static struct platform_driver sof_nocodec_audio = {
>   		.pm = &snd_soc_pm_ops,
>   	},
>   };
> -module_platform_driver(sof_nocodec_audio)
> -
> -MODULE_DESCRIPTION("ASoC sof nocodec");
> -MODULE_AUTHOR("Liam Girdwood");
> -MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_ALIAS("platform:sof-nocodec");
> diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> index 1e85d6f9c5c3..3ae55d15820f 100644
> --- a/sound/soc/sof/sof-priv.h
> +++ b/sound/soc/sof/sof-priv.h
> @@ -559,6 +559,17 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
>    */
>   extern struct snd_compr_ops sof_compressed_ops;
>   
> +/*
> + * nocodec platform binding
> + */
> +extern struct platform_driver sof_nocodec_audio;
> +
> +int sof_nocodec_setup(struct device *dev,
> +		      struct snd_sof_pdata *sof_pdata,
> +		      struct snd_soc_acpi_mach *mach,
> +		      const struct sof_dev_desc *desc,
> +		      const struct snd_sof_dsp_ops *ops);
> +
>   /*
>    * Kcontrols.
>    */
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
