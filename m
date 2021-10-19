Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3446432BB5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 04:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8621516C1;
	Tue, 19 Oct 2021 04:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8621516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634609586;
	bh=kg33YVZW4gHF2S1jekwVN4G2u1ItL0JJYr0ZDzqO8tM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bWHFgKXHb5DBTbV6/f2X1vrrdgS4C3Zn5Pn6emfh0youGC1TJwu49Cf3R1uzIYQ+3
	 05qDNdkOZ4ZWAgDE0WiHee8BSEZ0svdD5qtE6a0akJZddZditoSZIQSA4MUoKgwBBL
	 Qtm/+4QdJeIk0vhOVuSp/dhG+Ofcfl+UN7uWXMuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA65F8026C;
	Tue, 19 Oct 2021 04:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E889F80256; Tue, 19 Oct 2021 04:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.202])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B03BF80111
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 04:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B03BF80111
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id AAA37777;
 Tue, 19 Oct 2021 10:11:30 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.22] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P15799T140581342500608S1634609487799258_; 
 Tue, 19 Oct 2021 10:11:28 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: jay.xu@rock-chips.com
X-RCPT-COUNT: 11
X-LOCAL-RCPT-COUNT: 1
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-UNIQUE-TAG: <a1b08a26befdc9bb34d1ad4def239f33>
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_ASoC=3a_rockchip=3a_use_generic_DMA_eng?=
 =?UTF-8?B?aW5lIGNvbmZpZ3VyYXRpb27jgJDor7fms6jmhI/vvIzpgq7ku7bnlLFsaW51eC1y?=
 =?UTF-8?Q?ockchip-bounces+sugar=2ezhang=3drock-chips=2ecom=40lists=2einfrad?=
 =?UTF-8?B?ZWFkLm9yZ+S7o+WPkeOAkQ==?=
To: Mark Brown <broonie@kernel.org>, John Keeping <john@metanate.com>
References: <20211018114844.1746351-1-john@metanate.com>
 <YW1svMVSgBJygfpV@sirena.org.uk>
From: sugar zhang <sugar.zhang@rock-chips.com>
Message-ID: <a5eebd60-da6f-cc56-b1fe-221dc827e097@rock-chips.com>
Date: Tue, 19 Oct 2021 10:11:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YW1svMVSgBJygfpV@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi Mark, John,

Actually, I have submit patch[1] to do the same thing a few weeks ago, 
and explain the original purpose.

[1] 
https://x-lore.kernel.org/linux-rockchip/1632792957-80428-1-git-send-email-sugar.zhang@rock-chips.com/

On 2021/10/18 20:46, Mark Brown wrote:
> On Mon, Oct 18, 2021 at 12:48:44PM +0100, John Keeping wrote:
>> This effectively reverts commit 75b31192fe6a ("ASoC: rockchip: add
>> config for rockchip dmaengine pcm register").
>> There doesn't seem to be any rationale given for why these specific
>> values are helpful.  The generic DMA engine provides sensible defaults
>> here and works well with Rockchip I2S.
>> In fact the period size here is really quite restrictive when dealing
>> with 8 channels of 32-bit data as the effective period size is just 256
>> frames.
> Copying in Jianqun who wrote that patch.  If you're reverting a patch
> it's generally good to make sure the original author is aware,
> particularly if you're unsure as to why the patch does what it does.
>
>> Signed-off-by: John Keeping <john@metanate.com>
>> ---
>>   sound/soc/rockchip/Makefile       |  3 +--
>>   sound/soc/rockchip/rockchip_i2s.c |  3 +--
>>   sound/soc/rockchip/rockchip_pcm.c | 44 -------------------------------
>>   sound/soc/rockchip/rockchip_pcm.h | 11 --------
>>   4 files changed, 2 insertions(+), 59 deletions(-)
>>   delete mode 100644 sound/soc/rockchip/rockchip_pcm.c
>>   delete mode 100644 sound/soc/rockchip/rockchip_pcm.h
>>
>> diff --git a/sound/soc/rockchip/Makefile b/sound/soc/rockchip/Makefile
>> index b10f5e7b136d..6a3e61178152 100644
>> --- a/sound/soc/rockchip/Makefile
>> +++ b/sound/soc/rockchip/Makefile
>> @@ -2,11 +2,10 @@
>>   # ROCKCHIP Platform Support
>>   snd-soc-rockchip-i2s-objs := rockchip_i2s.o
>>   snd-soc-rockchip-i2s-tdm-objs := rockchip_i2s_tdm.o
>> -snd-soc-rockchip-pcm-objs := rockchip_pcm.o
>>   snd-soc-rockchip-pdm-objs := rockchip_pdm.o
>>   snd-soc-rockchip-spdif-objs := rockchip_spdif.o
>>   
>> -obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S) += snd-soc-rockchip-i2s.o snd-soc-rockchip-pcm.o
>> +obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S) += snd-soc-rockchip-i2s.o
>>   obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S_TDM) += snd-soc-rockchip-i2s-tdm.o
>>   obj-$(CONFIG_SND_SOC_ROCKCHIP_PDM) += snd-soc-rockchip-pdm.o
>>   obj-$(CONFIG_SND_SOC_ROCKCHIP_SPDIF) += snd-soc-rockchip-spdif.o
>> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
>> index 7e89f5b0c237..a6d7656c206e 100644
>> --- a/sound/soc/rockchip/rockchip_i2s.c
>> +++ b/sound/soc/rockchip/rockchip_i2s.c
>> @@ -20,7 +20,6 @@
>>   #include <sound/dmaengine_pcm.h>
>>   
>>   #include "rockchip_i2s.h"
>> -#include "rockchip_pcm.h"
>>   
>>   #define DRV_NAME "rockchip-i2s"
>>   
>> @@ -756,7 +755,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
>>   		goto err_suspend;
>>   	}
>>   
>> -	ret = rockchip_pcm_platform_register(&pdev->dev);
>> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "Could not register PCM\n");
>>   		goto err_suspend;
>> diff --git a/sound/soc/rockchip/rockchip_pcm.c b/sound/soc/rockchip/rockchip_pcm.c
>> deleted file mode 100644
>> index 02254e42135e..000000000000
>> --- a/sound/soc/rockchip/rockchip_pcm.c
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
>> - */
>> -
>> -#include <linux/device.h>
>> -#include <linux/init.h>
>> -#include <linux/module.h>
>> -
>> -#include <sound/core.h>
>> -#include <sound/pcm.h>
>> -#include <sound/soc.h>
>> -#include <sound/dmaengine_pcm.h>
>> -
>> -#include "rockchip_pcm.h"
>> -
>> -static const struct snd_pcm_hardware snd_rockchip_hardware = {
>> -	.info			= SNDRV_PCM_INFO_MMAP |
>> -				  SNDRV_PCM_INFO_MMAP_VALID |
>> -				  SNDRV_PCM_INFO_PAUSE |
>> -				  SNDRV_PCM_INFO_RESUME |
>> -				  SNDRV_PCM_INFO_INTERLEAVED,
>> -	.period_bytes_min	= 32,
>> -	.period_bytes_max	= 8192,
>> -	.periods_min		= 1,
>> -	.periods_max		= 52,
>> -	.buffer_bytes_max	= 64 * 1024,
>> -	.fifo_size		= 32,
>> -};
>> -
>> -static const struct snd_dmaengine_pcm_config rk_dmaengine_pcm_config = {
>> -	.pcm_hardware = &snd_rockchip_hardware,
>> -	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
>> -	.prealloc_buffer_size = 32 * 1024,
>> -};
>> -
>> -int rockchip_pcm_platform_register(struct device *dev)
>> -{
>> -	return devm_snd_dmaengine_pcm_register(dev, &rk_dmaengine_pcm_config,
>> -		SND_DMAENGINE_PCM_FLAG_COMPAT);
>> -}
>> -EXPORT_SYMBOL_GPL(rockchip_pcm_platform_register);
>> -
>> -MODULE_LICENSE("GPL v2");
>> diff --git a/sound/soc/rockchip/rockchip_pcm.h b/sound/soc/rockchip/rockchip_pcm.h
>> deleted file mode 100644
>> index 7f00e2ce3603..000000000000
>> --- a/sound/soc/rockchip/rockchip_pcm.h
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -/*
>> - * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
>> - */
>> -
>> -#ifndef _ROCKCHIP_PCM_H
>> -#define _ROCKCHIP_PCM_H
>> -
>> -int rockchip_pcm_platform_register(struct device *dev);
>> -
>> -#endif
>> -- 
>> 2.33.1
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip

-- 
Best Regards!
张学广/Sugar
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.

