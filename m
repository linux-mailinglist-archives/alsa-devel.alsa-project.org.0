Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD32F30F191
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 12:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D3BF16F8;
	Thu,  4 Feb 2021 12:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D3BF16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612436845;
	bh=K8HpAGV5wSYHJMr0BbNNrzuboVU057iohUK1wYM4GeQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y0g+90GQCLqQp76Y9gKQT7jhNVQI4S70qUgZlYqAi96nADPjgRiycDM0OL/f4GfhB
	 rqKmC1b+F3DKB+5GPiolj7Li/WBsO1vP/XH5d3pz4EKieIKTKT5PPsDjJMMWX0uQMl
	 jVxQbiifRTTuJIzjhC9aQx7hTaIS3R8tjvEp09i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B3FF801F7;
	Thu,  4 Feb 2021 12:05:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E410F80171; Thu,  4 Feb 2021 12:05:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53A30F80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 12:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53A30F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="E70uKg/M"
Received: by mail-wr1-x429.google.com with SMTP id d16so2937953wro.11
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 03:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nMRiKhF7YdCgOeER5/NiAuJBBtviujq5B9oy3dlX03I=;
 b=E70uKg/MRPTULPpl5mj6qG+BRKRrLmajLV1IyZ19uIZ14o/TO3orBt7KBZKXSSr9o4
 ILMkmBADWGfuuqC56MFyXL/r7poT7EPXc1uL9XigvCazGfgHczanfZnspZet3HGp78iH
 /WSHG9ec4B56sDZ/W5tCNTAIar/82/lvb+oCvVQkmbyFIr5N3a5okH2z+BKTqieQLHxK
 6U5n1XP8zu4r4mxfWKmBtWOyha3GQw5nZBXntiwl0q/TXSr8+wNaNXsohop/+A7y1tO/
 Q24NJpckrN5Td8yjGDSVvHk3Ar+ntXwxMtwy+IwzsVtMC24NGL5TnZErOq/S4RNVyWfy
 Ud+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nMRiKhF7YdCgOeER5/NiAuJBBtviujq5B9oy3dlX03I=;
 b=egZCG+MX1KjN55NmQL3rot1sRZ1vkxNAqzAe0yMQRfnBiCzAd4tcJYZSG79nYgJ+h5
 CF/Ofkw8vu+LkN4UyUuWyG4+SNq7dDGhCzmrSMyEZW0LBeSpMjtm2dUQuYXnN3eBx7Uc
 HSczqs0soZ4rifxCVfzM1KJ7AxlRksNvH9GkbGhVbMZvKPYwjojTHAltWR2BgQLvjhKB
 VBtWaLbTx3C9dggbSQ7DGtqFOVT2i4oQkAOKvBjvMt8KPoLxawvNsmQ/mAr1N9WMUvcU
 bzyg2pIKWRHXiTpJCzehVq7pRt9FUkC5LAD2YqFPXd9OasIy/sOYdNa2/xzvrndgQemP
 ua9g==
X-Gm-Message-State: AOAM531MonuRuyRaHJ5JmRhEMzAd2dQCSrFIBwrHK1ccRkl7NIFO9Jtl
 ckdwbFYMs/x72sXsunrBzIELpg==
X-Google-Smtp-Source: ABdhPJxO2JfQyC3D7WqY8EhxrgYNhSNeNcJjRb8nFwiSv4sh1GmXoJNTFTX8W9c5KCuomd1Yom6Qeg==
X-Received: by 2002:a5d:6282:: with SMTP id k2mr8950132wru.159.1612436741988; 
 Thu, 04 Feb 2021 03:05:41 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id c62sm5811380wmd.43.2021.02.04.03.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:05:41 -0800 (PST)
Date: Thu, 4 Feb 2021 11:05:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
Message-ID: <20210204110539.GE2789116@dell>
References: <20210123121313.79530-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210123121313.79530-1-hdegoede@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Sat, 23 Jan 2021, Hans de Goede wrote:

> Hi all,
> 
> Here is v4 of my series to rework the arizona codec jack-detect support
> to use the snd_soc_jack helpers instead of direct extcon reporting.
> 
> This is done by reworking the extcon driver into an arizona-jackdet
> library and then modifying the codec drivers to use that directly,
> replacing the old separate extcon child-devices and extcon-driver.
> 
> This brings the arizona-codec jack-detect handling inline with how
> all other ASoC codec driver do this. This was developed and tested on
> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
> 
> There are various interdependencies between the patches in this
> series, so IMHO it would be best if this entire series would be merged
> through the MFD tree.
> 
> Note this series applies on top of my "[PATCH v4 0/5] MFD/ASoC: Add
> support for Intel Bay Trail boards with WM5102 codec" series.
> 
> Changes in v4:
> - Add sound/soc/codecs/arizona-jack.c to the WOLFSON MICROELECTRONICS DRIVERS
>   MAINTAINERS section
> - Small codying style tweaks to the "ASoC: arizona-jack: Cleanup logging" patch
> 
> Changes in v3:
> - Move the bugfix patches to earlier in the series so that they
>   apply to drivers/extcon/extcon-arizona.c so that they can be
>   cherry-picked into the stable series
> - Split runtime_pm_get -> runtime_pm_get_sync changes out into their
>   own patch
> - Simply move drivers/extcon/extcon-arizona.c to
>   sound/soc/codecs/arizona-jack.c instead of first adding arizona-jack.c
>   as a copy and then later removing extcon-arizona.c
> - Some other small tweaks, see individual patch changelogs
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (13):
>   mfd: arizona: Drop arizona-extcon cells
>   extcon: arizona: Fix some issues when HPDET IRQ fires after the jack
>     has been unplugged
>   extcon: arizona: Fix various races on driver unbind
>   extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol")
>     call
>   extcon: arizona: Always use pm_runtime_get_sync() when we need the
>     device to be awake
>   ASoC/extcon: arizona: Move arizona jack code to
>     sound/soc/codecs/arizona-jack.c
>   ASoC: arizona-jack: Move jack-detect variables to struct arizona_priv
>   ASoC: arizona-jack: Use arizona->dev for runtime-pm
>   ASoC: arizona-jack: convert into a helper library for codec drivers
>   ASoC: arizona-jack: Use snd_soc_jack to report jack events
>   ASoC: arizona-jack: Cleanup logging
>   ASoC: arizona: Make the wm5102, wm5110, wm8997 and wm8998 drivers use
>     the new jack library

>   ASoC: Intel: bytcr_wm5102: Add jack detect support

Can't apply this patch ...

>  MAINTAINERS                                   |   3 +-
>  drivers/extcon/Kconfig                        |   8 -
>  drivers/extcon/Makefile                       |   1 -
>  drivers/mfd/arizona-core.c                    |  20 -
>  sound/soc/codecs/Makefile                     |   2 +-
>  .../soc/codecs/arizona-jack.c                 | 577 +++++++-----------
>  sound/soc/codecs/arizona.h                    |  44 ++
>  sound/soc/codecs/wm5102.c                     |  12 +-
>  sound/soc/codecs/wm5110.c                     |  12 +-
>  sound/soc/codecs/wm8997.c                     |  14 +-
>  sound/soc/codecs/wm8998.c                     |   9 +
>  sound/soc/intel/boards/bytcr_wm5102.c         |  28 +-

... since this file doesn't exist?

>  12 files changed, 325 insertions(+), 405 deletions(-)
>  rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (76%)
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
