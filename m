Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4620643347C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 13:16:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C61FA1697;
	Tue, 19 Oct 2021 13:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C61FA1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634642159;
	bh=gmc3XDeid3cF5jaNiTbfwy701medVV/tzV8llmL4EvM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KS+fqG5J7DzROWbR518pmLsgf8Ilw75o9ABZdQBPEhyQDKu0gBz9RmuHWSY4X0iYE
	 ew+xSGpwIr0182G1jXxfyW+ld0IzDqIHFZ9sWb8ubKgbMFOWKXua7yv5ZDBRtoSSp6
	 TZM4hiw9gkVfQjbqMfCmXDyrhkZFVfXfon2G2Fnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 306B2F80246;
	Tue, 19 Oct 2021 13:14:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53BC2F80240; Tue, 19 Oct 2021 13:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42B6FF80111
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 13:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42B6FF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="Y9O13jkU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Content-Type:
 References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID
 :Content-Description; bh=bu6OGhxu6euEBzwwXsV/jmjCVMws7HHSTTab2mAQbUg=; b=Y9O1
 3jkUxr8lHuivLPeL7Ifm8+4GI+KVulaW33e8ctjzaM7OGHwg8ogo8Plk12R1S/MFO+FPhyOt1wj2g
 tLUF+T5n1YhBIC0v7I5t0T2heUDfj4jknyERizo44jQb28OjyzuMRodczOYdoTNzpt6ARABm7ESH3
 l2DixjSruQpuS4a494ZYf+rNEtBNQTkKQ/oSXaCE6lMyjms1KmQ/5hKxbnnsW8lAkyoCHPbNnkkUR
 pW75VSqrLUHAuWbrBRtUQsmbRn2hfKdnYC20xDMD/SxVRuAH0i1aMJIoySz+hbtnIoGUsZTCoA1ZK
 wXq5PLdyXnI3X7gbQMKZ0WnYfPUEJg==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mcn4b-00006R-T8; Tue, 19 Oct 2021 12:14:26 +0100
Date: Tue, 19 Oct 2021 12:14:25 +0100
From: John Keeping <john@metanate.com>
To: sugar zhang <sugar.zhang@rock-chips.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rockchip: use generic DMA engine =?UTF-8?B?Y29u?=
 =?UTF-8?B?ZmlndXJhdGlvbuOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJvY2tj?=
 =?UTF-8?B?aGlwLWJvdW5jZXMrc3VnYXIuemhhbmc9cm9jay1jaGlwcy5jb21AbGlzdHMu?=
 =?UTF-8?B?aW5mcmFkZWFkLm9yZ+S7o+WPkeOAkQ==?=
Message-ID: <20211019121425.62f0066d.john@metanate.com>
In-Reply-To: <a5eebd60-da6f-cc56-b1fe-221dc827e097@rock-chips.com>
References: <20211018114844.1746351-1-john@metanate.com>
 <YW1svMVSgBJygfpV@sirena.org.uk>
 <a5eebd60-da6f-cc56-b1fe-221dc827e097@rock-chips.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated: YES
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
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

On Tue, 19 Oct 2021 10:11:27 +0800
sugar zhang <sugar.zhang@rock-chips.com> wrote:

> Actually, I have submit patch[1] to do the same thing a few weeks ago, 
> and explain the original purpose.
> 
> [1] 
> https://x-lore.kernel.org/linux-rockchip/1632792957-80428-1-git-send-email-sugar.zhang@rock-chips.com/

I missed that one!  I've added my R-b now.

Mark, please ignore this patch and consider Sugar's.


Thanks,
John

> On 2021/10/18 20:46, Mark Brown wrote:
> > On Mon, Oct 18, 2021 at 12:48:44PM +0100, John Keeping wrote:  
> >> This effectively reverts commit 75b31192fe6a ("ASoC: rockchip: add
> >> config for rockchip dmaengine pcm register").
> >> There doesn't seem to be any rationale given for why these specific
> >> values are helpful.  The generic DMA engine provides sensible defaults
> >> here and works well with Rockchip I2S.
> >> In fact the period size here is really quite restrictive when dealing
> >> with 8 channels of 32-bit data as the effective period size is just 256
> >> frames.  
> > Copying in Jianqun who wrote that patch.  If you're reverting a patch
> > it's generally good to make sure the original author is aware,
> > particularly if you're unsure as to why the patch does what it does.
> >  
> >> Signed-off-by: John Keeping <john@metanate.com>
> >> ---
> >>   sound/soc/rockchip/Makefile       |  3 +--
> >>   sound/soc/rockchip/rockchip_i2s.c |  3 +--
> >>   sound/soc/rockchip/rockchip_pcm.c | 44 -------------------------------
> >>   sound/soc/rockchip/rockchip_pcm.h | 11 --------
> >>   4 files changed, 2 insertions(+), 59 deletions(-)
> >>   delete mode 100644 sound/soc/rockchip/rockchip_pcm.c
> >>   delete mode 100644 sound/soc/rockchip/rockchip_pcm.h
> >>
> >> diff --git a/sound/soc/rockchip/Makefile b/sound/soc/rockchip/Makefile
> >> index b10f5e7b136d..6a3e61178152 100644
> >> --- a/sound/soc/rockchip/Makefile
> >> +++ b/sound/soc/rockchip/Makefile
> >> @@ -2,11 +2,10 @@
> >>   # ROCKCHIP Platform Support
> >>   snd-soc-rockchip-i2s-objs := rockchip_i2s.o
> >>   snd-soc-rockchip-i2s-tdm-objs := rockchip_i2s_tdm.o
> >> -snd-soc-rockchip-pcm-objs := rockchip_pcm.o
> >>   snd-soc-rockchip-pdm-objs := rockchip_pdm.o
> >>   snd-soc-rockchip-spdif-objs := rockchip_spdif.o
> >>   
> >> -obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S) += snd-soc-rockchip-i2s.o snd-soc-rockchip-pcm.o
> >> +obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S) += snd-soc-rockchip-i2s.o
> >>   obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S_TDM) += snd-soc-rockchip-i2s-tdm.o
> >>   obj-$(CONFIG_SND_SOC_ROCKCHIP_PDM) += snd-soc-rockchip-pdm.o
> >>   obj-$(CONFIG_SND_SOC_ROCKCHIP_SPDIF) += snd-soc-rockchip-spdif.o
> >> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> >> index 7e89f5b0c237..a6d7656c206e 100644
> >> --- a/sound/soc/rockchip/rockchip_i2s.c
> >> +++ b/sound/soc/rockchip/rockchip_i2s.c
> >> @@ -20,7 +20,6 @@
> >>   #include <sound/dmaengine_pcm.h>
> >>   
> >>   #include "rockchip_i2s.h"
> >> -#include "rockchip_pcm.h"
> >>   
> >>   #define DRV_NAME "rockchip-i2s"
> >>   
> >> @@ -756,7 +755,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
> >>   		goto err_suspend;
> >>   	}
> >>   
> >> -	ret = rockchip_pcm_platform_register(&pdev->dev);
> >> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> >>   	if (ret) {
> >>   		dev_err(&pdev->dev, "Could not register PCM\n");
> >>   		goto err_suspend;
> >> diff --git a/sound/soc/rockchip/rockchip_pcm.c b/sound/soc/rockchip/rockchip_pcm.c
> >> deleted file mode 100644
> >> index 02254e42135e..000000000000
> >> --- a/sound/soc/rockchip/rockchip_pcm.c
> >> +++ /dev/null
> >> @@ -1,44 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0-only
> >> -/*
> >> - * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
> >> - */
> >> -
> >> -#include <linux/device.h>
> >> -#include <linux/init.h>
> >> -#include <linux/module.h>
> >> -
> >> -#include <sound/core.h>
> >> -#include <sound/pcm.h>
> >> -#include <sound/soc.h>
> >> -#include <sound/dmaengine_pcm.h>
> >> -
> >> -#include "rockchip_pcm.h"
> >> -
> >> -static const struct snd_pcm_hardware snd_rockchip_hardware = {
> >> -	.info			= SNDRV_PCM_INFO_MMAP |
> >> -				  SNDRV_PCM_INFO_MMAP_VALID |
> >> -				  SNDRV_PCM_INFO_PAUSE |
> >> -				  SNDRV_PCM_INFO_RESUME |
> >> -				  SNDRV_PCM_INFO_INTERLEAVED,
> >> -	.period_bytes_min	= 32,
> >> -	.period_bytes_max	= 8192,
> >> -	.periods_min		= 1,
> >> -	.periods_max		= 52,
> >> -	.buffer_bytes_max	= 64 * 1024,
> >> -	.fifo_size		= 32,
> >> -};
> >> -
> >> -static const struct snd_dmaengine_pcm_config rk_dmaengine_pcm_config = {
> >> -	.pcm_hardware = &snd_rockchip_hardware,
> >> -	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
> >> -	.prealloc_buffer_size = 32 * 1024,
> >> -};
> >> -
> >> -int rockchip_pcm_platform_register(struct device *dev)
> >> -{
> >> -	return devm_snd_dmaengine_pcm_register(dev, &rk_dmaengine_pcm_config,
> >> -		SND_DMAENGINE_PCM_FLAG_COMPAT);
> >> -}
> >> -EXPORT_SYMBOL_GPL(rockchip_pcm_platform_register);
> >> -
> >> -MODULE_LICENSE("GPL v2");
> >> diff --git a/sound/soc/rockchip/rockchip_pcm.h b/sound/soc/rockchip/rockchip_pcm.h
> >> deleted file mode 100644
> >> index 7f00e2ce3603..000000000000
> >> --- a/sound/soc/rockchip/rockchip_pcm.h
> >> +++ /dev/null
> >> @@ -1,11 +0,0 @@
> >> -/* SPDX-License-Identifier: GPL-2.0-only */
> >> -/*
> >> - * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
> >> - */
> >> -
> >> -#ifndef _ROCKCHIP_PCM_H
> >> -#define _ROCKCHIP_PCM_H
> >> -
> >> -int rockchip_pcm_platform_register(struct device *dev);
> >> -
> >> -#endif
> >> -- 
> >> 2.33.1
> >>
> >>
> >> _______________________________________________
> >> Linux-rockchip mailing list
> >> Linux-rockchip@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-rockchip  
> 

