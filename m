Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F31A6C980F
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Mar 2023 23:50:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E0E852;
	Sun, 26 Mar 2023 23:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E0E852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679867416;
	bh=h/FOFixccMfIznOZOfKOlKSlc/tLUu0q9Xt4nNUtjb8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=APuVRKWf0+NOJnh/mkhhrxZu4bYPd2oaPrLs529+aSJIqdezi3h4kuD8ejV3hz1DS
	 Gkoo2w8gGbEan1/wZ3loEZwKFCsLK97C9TXPHysIdL61tO+p32l9NomQhhcEbwBBjk
	 ip2BdWj2wJiIodvEtZHo6GJ/F5HtNo+xhlu3Pf5c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 384A0F8024E;
	Sun, 26 Mar 2023 23:49:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13C57F80272; Sun, 26 Mar 2023 23:49:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89CC0F8021D
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 23:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89CC0F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gn++6Zvn
Received: by mail-oi1-x22f.google.com with SMTP id y184so4999091oiy.8
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Mar 2023 14:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679867348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8jPnc/mNq3d+a+FglCHgJpNdOZEFwd7wj5X3i1Idl2k=;
        b=gn++6ZvnWydiyQDWYLM37Su6Y8V5AelENXkUd1zfa//HNth0qxGvJN+a89bYW+xj5L
         bfX2CxHvmPzI2zOwDeKc1dQM5IlRAAon4lh/hb/Ol5TRreXiVsnui+aobUeYC6VqO517
         R0C1He49n7ubWTQdzZzzP7Lo9HxJdKUSAEOXvw07XY4a8aCwNWHi/BAhEJjNQL2YPpbB
         FbWmvqiwqBh5hvinVOXCzxhDYBLMRskPTfgw4JpblnaEZu6TvpDhjHUVz+dI+ZJbqGhW
         ebahe6bV++hj8P476NOp7FQVOZqLIpHK5KhfvjAf7wJMUnGXywtNPmPQi9Ez5sUugn1j
         WEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679867348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jPnc/mNq3d+a+FglCHgJpNdOZEFwd7wj5X3i1Idl2k=;
        b=m9dhvU8mzpvMNq04NRLajU3qLmG6JkBoi8qPw1jHJ6usHl7ub8sfz5JdeUqO6nJUpr
         dm0A0ZsH+PdN/NP/wA0/y2UgAAWfLWmhE1yOEZ16bXQEX6DEUMyxdPBIh0PBF++dD4Xj
         7XAw2qLs/yb/Y27fsNtKkM5WzODved9duMFhQJkoHKUMC380rwHjI/9Orx5OkmkFC4I4
         m+D1sgHYGPPYIvFBVsqVFS+g2+C0TCXHLWm0sYfV0CcG2w3hWjFtLZSA6Ds2CFteGi2m
         Rc/tCBTb1N9TQcSBPBByKNyHiXu+ZvIiqu6iDuRXY8zWVvoisyOgrFeSc2EKMV4+VXIh
         1s0Q==
X-Gm-Message-State: AO0yUKXs8Izip3gk6cOEieVkEnlby0sMbBDFa28fPeEEmtkgrPxTV5h2
	NsgZLwFoAx34tCIb0CJOY6g=
X-Google-Smtp-Source: 
 AK7set8dH4HtvjhK+fXwyFFt+qdAPbaKRPt8t0aLV6eBrQH8ELAGqmtVsBdJ+8shFunKm/pjE/e2nw==
X-Received: by 2002:a05:6808:6190:b0:384:23da:6e73 with SMTP id
 dn16-20020a056808619000b0038423da6e73mr3879432oib.47.1679867348216;
        Sun, 26 Mar 2023 14:49:08 -0700 (PDT)
Received: from geday ([2804:7f2:8002:df06:a135:1d39:bf0c:2898])
        by smtp.gmail.com with ESMTPSA id
 bl31-20020a056808309f00b00384a45d3106sm10418910oib.58.2023.03.26.14.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 14:49:07 -0700 (PDT)
Date: Sun, 26 Mar 2023 18:49:08 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shenghao Ding <13916275206@139.com>
Subject: Re: [PATCH v7] ASoC: tas2781: Add tas2781 driver
Message-ID: <ZCC91Jhv9+rlb3FM@geday>
References: <20230326143419.11711-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326143419.11711-1-13916275206@139.com>
Message-ID-Hash: 4CNVLAXJO7Z5TSXGVHQ2IYYZQWG6JYHI
X-Message-ID-Hash: 4CNVLAXJO7Z5TSXGVHQ2IYYZQWG6JYHI
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com, shenghao-ding@ti.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, x1077012@ti.com,
 peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CNVLAXJO7Z5TSXGVHQ2IYYZQWG6JYHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

On Sun, Mar 26, 2023 at 10:34:19PM +0800, Shenghao Ding wrote:
> +config SND_SOC_TAS2781
> +	tristate "Texas Instruments TAS2781 speaker amplifier"
> +	depends on I2C
> +	select REGMAP_I2C
> +	select CRC8
> +	help
> +	  Enable support for Texas Instruments TAS2781 Smart Amplifier
> +	  Digital input mono Class-D and DSP-inside audio power amplifiers.
> +	  Note the TAS2781 driver implements a flexible and configurable
> +	  algo coff setting, for one, two, even multiple TAS2781 chips.

You changed coff->coefficient below as suggested by Pierre-Louis Bossart
but you forgot to change it here, and this will surely perplex people
when configuring the kernel.

> +
>  config SND_SOC_TAS5086
>  	tristate "Texas Instruments TAS5086 speaker amplifier"
>  	depends on I2C
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index f1ca18f7946c..5559b9e9cc17 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -262,6 +262,7 @@ snd-soc-tas5805m-objs := tas5805m.o
>  snd-soc-tas6424-objs := tas6424.o
>  snd-soc-tda7419-objs := tda7419.o
>  snd-soc-tas2770-objs := tas2770.o
> +snd-soc-tas2781-objs :=	tas2781-i2c.o tas2781-dsp.o
>  snd-soc-tfa9879-objs := tfa9879.o
>  snd-soc-tfa989x-objs := tfa989x.o
>  snd-soc-tlv320adc3xxx-objs := tlv320adc3xxx.o
> @@ -619,6 +620,7 @@ obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
>  obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
>  obj-$(CONFIG_SND_SOC_TAS2764)	+= snd-soc-tas2764.o
>  obj-$(CONFIG_SND_SOC_TAS2780)	+= snd-soc-tas2780.o
> +obj-$(CONFIG_SND_SOC_TAS2781)	+= snd-soc-tas2781.o
>  obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
>  obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
>  obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
> diff --git a/sound/soc/codecs/tas2781-dsp.c b/sound/soc/codecs/tas2781-dsp.c
> new file mode 100644
> index 000000000000..6a0e9fb5e20f
> --- /dev/null
> +++ b/sound/soc/codecs/tas2781-dsp.c
> @@ -0,0 +1,2232 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
> +//
> +// Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +// https://www.ti.com
> +//
> +// The TAS2781 driver implements a flexible and configurable
> +// algo coefficient setting for one, two, or even multiple
> +// TAS2781 chips.

Here it is OK.

Thanks,
Geraldo Nascimento
