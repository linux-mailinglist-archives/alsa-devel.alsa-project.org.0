Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697F31416
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 19:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C09E71616;
	Fri, 31 May 2019 19:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C09E71616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559324754;
	bh=ykX9X3kyQ2jF1FtJu1rDfM/6BdvPI2GtwCneovOF5Ds=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQMJf2mPX9OjuNyDf6qbLYxwOXdL3y0e7o1WpWeh5yLS+wY8WePs/SuL8zPdYhUXQ
	 72ukbyUnVR7rc62II0fQG9to+Pbl1KftsPaReyJUd/HrEGFdptNzg2L6lqkrB7J/Ew
	 GiGGFs3lqfMf22iC1eZCd6mYXXL3zrEvcRZg6CtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16FCFF896E5;
	Fri, 31 May 2019 19:44:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A30F896E5; Fri, 31 May 2019 19:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBA1CF80757
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 19:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBA1CF80757
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 10:44:00 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2019 10:44:00 -0700
Received: from mayurda-mobl.amr.corp.intel.com (unknown [10.252.130.8])
 by linux.intel.com (Postfix) with ESMTP id DDDE8580105;
 Fri, 31 May 2019 10:43:59 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <s5h7ea6lfaa.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1f3059d6-b271-f612-c670-e7214674892f@linux.intel.com>
Date: Fri, 31 May 2019 12:43:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5h7ea6lfaa.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Keyon Jie <yang.jie@linux.intel.com>
Subject: Re: [alsa-devel] Why open-coding in sof_hda_bus_init()?
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

On 5/31/19 12:11 PM, Takashi Iwai wrote:
> Hi,
> 
> while looking at SOF code due to the recent debugging session, I
> noticed that sof_hda_bus_init() is basically an open-code of the
> existing snd_hdac_ext_bus_init().  Why don't we simply call
> snd_hdac_ext_bus_init() like below?

It's intentional.
We've been asked since Day1 of SOF on ApolloLake to provide a 
'self-contained' controller-only support that has no dependency on the 
snd_hdac library for solutions where HDaudio links+codecs are not used 
(typically IOT devices). This was driven by the lack of separation 
between layers in that library as well as a desire to have a 
dual-license. That's why you see the init and some of the basic 
utilities re-implemented for SOF.

However for cases where HDaudio+HDMI are required, we didn't want to 
reinvent the wheel - HDaudio is complicated enough - and do make use of 
this snd_hdac library.

We have a config SND_SOC_SOF_HDA that controls in which mode we operate, 
and it enables HDMI by default (for I2S+HDMI solutions). To get external 
HDaudio codecs you need the additional SOF_HDAUDIO_CODEC kconfig.

Does this help?

> 
> The only thing that differs is the handling of bus->id number, where
> SOF fixes to zero (which was actually done in a patch after the first
> commit).  But judging from the comment, this doesn't seem like a big
> matter, as we assume a single bus, so far...
> 
> 
> thanks,
> 
> Takashi
> 
> ---
> diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
> index b8f58e006e29..f42450a9a7b6 100644
> --- a/sound/soc/sof/intel/Makefile
> +++ b/sound/soc/sof/intel/Makefile
> @@ -7,7 +7,7 @@ snd-sof-intel-ipc-objs := intel-ipc.o
>   
>   snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
>   				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
> -				 hda-dai.o hda-bus.o \
> +				 hda-dai.o \
>   				 apl.o cnl.o
>   
>   snd-sof-intel-hda-objs := hda-codec.o
> diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
> deleted file mode 100644
> index a7e6d8227df6..000000000000
> --- a/sound/soc/sof/intel/hda-bus.c
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> -//
> -// This file is provided under a dual BSD/GPLv2 license.  When using or
> -// redistributing this file, you may do so under either license.
> -//
> -// Copyright(c) 2018 Intel Corporation. All rights reserved.
> -//
> -// Authors: Keyon Jie <yang.jie@linux.intel.com>
> -
> -#include <linux/io.h>
> -#include <sound/hdaudio.h>
> -#include "../sof-priv.h"
> -#include "hda.h"
> -
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> -
> -static const struct hdac_bus_ops bus_ops = {
> -	.command = snd_hdac_bus_send_cmd,
> -	.get_response = snd_hdac_bus_get_response,
> -};
> -
> -#endif
> -
> -static void sof_hda_writel(u32 value, u32 __iomem *addr)
> -{
> -	writel(value, addr);
> -}
> -
> -static u32 sof_hda_readl(u32 __iomem *addr)
> -{
> -	return readl(addr);
> -}
> -
> -static void sof_hda_writew(u16 value, u16 __iomem *addr)
> -{
> -	writew(value, addr);
> -}
> -
> -static u16 sof_hda_readw(u16 __iomem *addr)
> -{
> -	return readw(addr);
> -}
> -
> -static void sof_hda_writeb(u8 value, u8 __iomem *addr)
> -{
> -	writeb(value, addr);
> -}
> -
> -static u8 sof_hda_readb(u8 __iomem *addr)
> -{
> -	return readb(addr);
> -}
> -
> -static int sof_hda_dma_alloc_pages(struct hdac_bus *bus, int type,
> -				   size_t size, struct snd_dma_buffer *buf)
> -{
> -	return snd_dma_alloc_pages(type, bus->dev, size, buf);
> -}
> -
> -static void sof_hda_dma_free_pages(struct hdac_bus *bus,
> -				   struct snd_dma_buffer *buf)
> -{
> -	snd_dma_free_pages(buf);
> -}
> -
> -static const struct hdac_io_ops io_ops = {
> -	.reg_writel = sof_hda_writel,
> -	.reg_readl = sof_hda_readl,
> -	.reg_writew = sof_hda_writew,
> -	.reg_readw = sof_hda_readw,
> -	.reg_writeb = sof_hda_writeb,
> -	.reg_readb = sof_hda_readb,
> -	.dma_alloc_pages = sof_hda_dma_alloc_pages,
> -	.dma_free_pages = sof_hda_dma_free_pages,
> -};
> -
> -/*
> - * This can be used for both with/without hda link support.
> - */
> -void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
> -		      const struct hdac_ext_bus_ops *ext_ops)
> -{
> -	memset(bus, 0, sizeof(*bus));
> -	bus->dev = dev;
> -
> -	bus->io_ops = &io_ops;
> -	INIT_LIST_HEAD(&bus->stream_list);
> -
> -	bus->irq = -1;
> -	bus->ext_ops = ext_ops;
> -
> -	/*
> -	 * There is only one HDA bus atm. keep the index as 0.
> -	 * Need to fix when there are more than one HDA bus.
> -	 */
> -	bus->idx = 0;
> -
> -	spin_lock_init(&bus->reg_lock);
> -
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> -	INIT_LIST_HEAD(&bus->codec_list);
> -	INIT_LIST_HEAD(&bus->hlink_list);
> -
> -	mutex_init(&bus->cmd_mutex);
> -	mutex_init(&bus->lock);
> -	bus->ops = &bus_ops;
> -	INIT_WORK(&bus->unsol_work, snd_hdac_bus_process_unsol_events);
> -	bus->cmd_dma_state = true;
> -#endif
> -
> -}
> diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> index 92d45c43b4b1..a9de6a297b56 100644
> --- a/sound/soc/sof/intel/hda.h
> +++ b/sound/soc/sof/intel/hda.h
> @@ -532,8 +532,11 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset);
>   /*
>    * HDA bus operations.
>    */
> -void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
> -		      const struct hdac_ext_bus_ops *ext_ops);
> +static inline void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
> +				    const struct hdac_ext_bus_ops *ext_ops)
> +{
> +	snd_hdac_ext_bus_init(bus, dev, NULL, NULL, ext_ops);
> +}
>   
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
>   /*
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
