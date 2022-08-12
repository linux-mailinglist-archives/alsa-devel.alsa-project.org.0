Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F03065912AE
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 17:13:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A542829;
	Fri, 12 Aug 2022 17:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A542829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660317190;
	bh=acilcILRqbibtGRaXrkN5n/FClb+JHCStjOt/vMeTLU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8F04zrSON62FwgN/9aV23cgO6rCFdn1Kvci0G6WkKxSUoWZC/Aw7g+wcrW6tMx3h
	 /P4vpHfeGA4lT6JLuSob/maJ9Bx/PoK4tRpq+BFV+zCJ05rwMVNga/xYd6SGA8+k4F
	 Zhgga1GD1av8KjWcSIQ8tkSWn4pVgF5+7Xwf9na4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9156F8026D;
	Fri, 12 Aug 2022 17:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43405F8026A; Fri, 12 Aug 2022 17:12:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 758E5F8014B
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 17:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 758E5F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LUL17oQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660317123; x=1691853123;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=acilcILRqbibtGRaXrkN5n/FClb+JHCStjOt/vMeTLU=;
 b=LUL17oQgo53m1QWN8gX100nbM9ErrkYCt6bbytMFeXqjOxy892EDKDxS
 KphrFLy2mzsD/vKpFbVxxPlv62F/aBzOBgMPVVjVfxusFkHmK/vUVhBCV
 AaWw3VCejbiUkJLkIrh4TGC65kRSoh7hZqXo0s8qioFx6JDyUG7JWZFWz
 rzEPPbinvb3DKBB0K+5D1T9W/GXoq9Tb5UHEkdIyiNQp+vSP07r0wXmHX
 kfSWuXLj7L+Xt9lWBaNBrXu82PfgEzAPn+9M5r05UIYSaFSRxNqS5qsk/
 dXvuPi4T1ac+zmUve/6mX/JZ3Uy6oQ+0SgUzt4UZBS10goXYl8CE8iKYk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="274667285"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="274667285"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 08:11:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="634670147"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.73])
 ([10.99.241.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 08:11:55 -0700
Message-ID: <c2e99c2c-01b6-e89a-5a56-264504dfa428@linux.intel.com>
Date: Fri, 12 Aug 2022 17:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/2] ASoC: codecs: add support for ES8326
Content-Language: en-US
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
References: <20220804091800.744316-1-zhuning0077@gmail.com>
 <20220804091800.744316-2-zhuning0077@gmail.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220804091800.744316-2-zhuning0077@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, devicetree@vger.kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
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

On 8/4/2022 11:18 AM, Zhu Ning wrote:
> The ES8326 codec is not compatible with ES8316 and requires
> a dedicated driver.
> 
> Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
> Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
> ------
> v5 fix compile error
> ---

...

> +
> +static const struct snd_soc_dai_ops es8326_ops = {
> +	.hw_params = es8326_pcm_hw_params,
> +	.set_fmt = es8326_set_dai_fmt,
> +	.set_sysclk = es8326_set_dai_sysclk,
> +};
> +
> +static struct snd_soc_dai_driver es8326_dai = {
> +	.name = "ES8326 HiFi",
> +	.playback = {
> +		.stream_name = "Playback",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = SNDRV_PCM_RATE_8000_96000,

coeff_div table seems to contain rates up to 48000, seems like 
SNDRV_PCM_RATE_8000_48000 would be a better value here?

> +		.formats = es8326_FORMATS,
> +		},
> +	.capture = {
> +		.stream_name = "Capture",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = SNDRV_PCM_RATE_8000_96000,

Same here?

> +		.formats = es8326_FORMATS,
> +		},
> +	.ops = &es8326_ops,
> +	.symmetric_rate = 1,
> +};
> +

...

> --- /dev/null
> +++ b/sound/soc/codecs/es8326.h
> @@ -0,0 +1,187 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * es8326.h -- es8326 ALSA SoC audio driver
> + * Copyright Everest Semiconductor Co.,Ltd
> + *
> + * Authors: David Yang <yangxiaohua@everest-semi.com>
> + */
> +
> +#ifndef _ES8326_H
> +#define _ES8326_H
> +
> +#define CONFIG_HHTECH_MINIPMP	1
> +
> +/* ES8326 register space */
> +
> +#define ES8326_RESET_00		0x00
> +#define ES8326_CLK_CTL_01	0x01
> +#define ES8326_CLK_INV_02	0x02
> +#define ES8326_CLK_RESAMPLE_03	0x03
> +#define ES8326_CLK_DIV1_04	0x04
> +#define ES8326_CLK_DIV2_05	0x05
> +#define ES8326_CLK_DLL_06	0x06
> +#define ES8326_CLK_MUX_07	0x07
> +#define ES8326_CLK_ADC_SEL_08	0x08
> +#define ES8326_CLK_DAC_SEL_09	0x09
> +#define ES8326_CLK_ADC_OSR_0A	0x0a
> +#define ES8326_CLK_DAC_OSR_0B	0x0b
> +#define ES8326_CLK_DIV_CPC_0C	0x0c
> +#define ES8326_CLK_DIV_BCLK_0D	0x0d
> +#define ES8326_CLK_TRI_0E	0x0e
> +#define ES8326_CLK_DIV_LRCK_0F	0x0f
> +#define ES8326_CLK_VMIDS1_10	0x10
> +#define ES8326_CLK_VMIDS2_11	0x11
> +#define ES8326_CLK_CAL_TIME_12	0x12
> +#define ES8326_FMT_13		0x13
> +
> +#define ES8326_DAC_MUTE_14	0x14
> +#define ES8326_ADC_MUTE_15	0x15
> +#define ES8326_ANA_PDN_16	0x16
> +#define ES8326_PGA_PDN_17	0x17
> +#define ES8326_VMIDSEL_18	0x18
> +#define ES8326_ANA_LOWPOWER_19	0x19
> +#define ES8326_ANA_DMS_1A	0x1a
> +#define ES8326_ANA_MICBIAS_1B	0x1b
> +#define ES8326_ANA_VSEL_1C	0x1c
> +#define ES8326_SYS_BIAS_1D	0x1d
> +#define ES8326_BIAS_SW1_1E	0x1e
> +#define ES8326_BIAS_SW2_1F	0x1f
> +#define ES8326_BIAS_SW3_20	0x20
> +#define ES8326_BIAS_SW4_21	0x21
> +#define ES8326_VMIDLOW_22	0x22
> +
> +#define ES8326_PGAGAIN_23		0x23
> +#define ES8326_HP_DRIVER_24		0x24
> +#define ES8326_DAC2HPMIX_25		0x25
> +#define ES8326_HP_VOL_26		0x26
> +#define ES8326_HP_CAL_27		0x27
> +#define ES8326_HP_DRIVER_REF_28		0x28
> +#define ES8326_ADC_SCALE_29		0x29
> +#define ES8326_ADC1_SRC_2A     0x2a
> +#define ES8326_ADC2_SRC_2B     0x2b
> +#define ES8326_ADC1_VOL_2C     0x2c
> +#define ES8326_ADC2_VOL_2D     0x2d
> +#define ES8326_ADC_RAMPRATE_2E		0x2e
> +#define ES8326_2F			0x2f
> +#define ES8326_30			0x30
> +#define ES8326_31			0x31
> +#define ES8326_ALC_RECOVERY_32		0x32
> +#define ES8326_ALC_LEVEL_33		0x33
> +#define ES8326_ADC_HPFS1_34		0x34
> +#define ES8326_ADC_HPFS2_35		0x35
> +#define ES8326_ADC_EQ_36		0x36
> +#define ES8326_HP_CAL_4A		0x4A
> +#define ES8326_HPL_OFFSET_INI_4B	0x4B
> +#define ES8326_HPR_OFFSET_INI_4C	0x4C
> +#define ES8326_DAC_DSM_4D		0x4D
> +#define ES8326_DAC_RAMPRATE_4E		0x4E
> +#define ES8326_DAC_VPPSCALE_4F		0x4F
> +#define ES8326_DAC_VOL_50		0x50
> +#define ES8326_DRC_RECOVERY_53		0x53
> +#define ES8326_DRC_WINSIZE_54		0x54
> +#define ES8326_HPJACK_TIMER_56		0x56
> +#define ES8326_HP_DET_57	0x57
> +#define ES8326_INT_SOURCE_58	0x58
> +#define ES8326_INTOUT_IO_59	0x59
> +#define ES8326_SDINOUT1_IO_5A	0x5A
> +#define ES8326_SDINOUT23_IO_5B	0x5B
> +#define ES8326_JACK_PULSE_5C	0x5C
> +
> +#define ES8326_PULLUP_CTL_F9	0xF9
> +#define ES8326_HP_DETECT_FB	0xFB
> +#define ES8326_CHIP_ID1_FD	0xFD
> +#define ES8326_CHIP_ID2_FE	0xFE
> +#define ES8326_CHIP_VERSION_FF	0xFF
> +

Can hexadecimal suffix in above defines be dropped? It seems unnecessary 
to me.

