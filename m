Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F44166F30
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 06:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19FE416B5;
	Fri, 21 Feb 2020 06:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19FE416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582263001;
	bh=QLdYeK406O7EI1XKzB12wGZajtBbkuCRJ5XX93rB0xI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjzKD52o/FHaPS0M4soksHOMjuocTQXtIFSjiPlP9vdrMsVf/UnTuJ2MGcQip4zJE
	 enZzka1Kaa/R6yENa3dhSpjyrWyMIymA8R96sZV1y+C82zVai83qQGyadsBslCdBMT
	 lufBl2pnrNaY8yXZa2cFhTbkATtyGUjdfhDcU8IY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F83CF80273;
	Fri, 21 Feb 2020 06:28:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B2F2F8025F; Fri, 21 Feb 2020 06:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC88BF800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 06:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC88BF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iR/Hnhsw"
Received: by mail-lf1-x143.google.com with SMTP id f24so566840lfh.3
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 21:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=53gVHOVv+aazLVffnAnZapThLxuxSIM6yvCzFavsnfo=;
 b=iR/HnhswRBJL0Eb1YhkshQ71r8WZae6s4qyPXEHFu1b3G/BwJGgfoTZEN/7NbiTeVY
 wJcjGcaRiLLkplm0dxXtJtMKSRd4S+h5thVN0BJ6pzca7M+/D/UoVd7ueUSDNxKbuih2
 cx7eRCAaMXE6p97TXrl2RtHyvO87oraaNkt7CuF773rqooTm+EMV2zStQXm5dkmGwPQP
 tEa4is0Oc6e0xGlVo7YO+5hutXKoTwxlUZzlHXz720uWKTaBVTI8iJKnZC5jIuEJbBaS
 js5XdhRE5VDOCWHwlA4G3FtMaj3izXanmukoI0P0aOnBBHCSDSoHUUfBluGYl6OWOgn8
 NdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=53gVHOVv+aazLVffnAnZapThLxuxSIM6yvCzFavsnfo=;
 b=jbh60BcYDLMhSJSA4dx9tqq5h1DzafnxS63lsRXMv8POBU3gww366jgp4YGgPH6S2y
 KfUxqfwchLnHbZf4ZiDmHKvoxK/1gkDedW6f7/hZSn9Kt8aVbEEBP+hWDwBEHQ4sA82d
 tRtcJpz6ksJ/cijVieo1Hio5kScPkzC7osfn7EleP0sHHmT5alCbeDbJ7dp5XOw5B33j
 55Rpbse4N/2dATXySG40pgy+qydHH1llDtRXOZE1kKK6M5rogWtk9XIrrkA92bOdQsQM
 +LhoS55Oq8ef6642KaxyLXwb7uz61WH58yVOHAbRlRSlpB5oB70hmti4A4U6h+rGlCvj
 D4Ng==
X-Gm-Message-State: APjAAAXWFeeR3D36cFNQUFDRPxbgkpe0G727acwvJ7GNcdz3nj72Nmt8
 C/1Dd0ZAvHjsjF3ChsRJr8E=
X-Google-Smtp-Source: APXvYqyiPLAcLmfgNz8dfxXwbYBLTptG6VXSzZJ+C7dVJ8PZhJq6nscU8y34IZsubI8W7nKWqe2djA==
X-Received: by 2002:ac2:44a7:: with SMTP id c7mr7647289lfm.32.1582262877961;
 Thu, 20 Feb 2020 21:27:57 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id f16sm876606ljn.17.2020.02.20.21.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 21:27:57 -0800 (PST)
Subject: Re: [PATCH v3 02/10] ASoC: tegra: add support for CIF programming
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-3-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8c39dbe9-a2b9-62e8-3a26-32cc747d0e60@gmail.com>
Date: Fri, 21 Feb 2020 08:27:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-3-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

20.02.2020 09:34, Sameer Pujar пишет:
> Audio Client Interface (CIF) is a proprietary interface employed to route
> audio samples through Audio Hub (AHUB) components by inter connecting the
> various modules.
> 
> This patch exports an inline function tegra_set_cif() which can be used,
> for now, to program CIF on Tegra210 and later Tegra generations. Later it
> can be extended to include helpers for legacy chips as well.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/tegra/tegra_cif.h | 63 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 sound/soc/tegra/tegra_cif.h
> 
> diff --git a/sound/soc/tegra/tegra_cif.h b/sound/soc/tegra/tegra_cif.h
> new file mode 100644
> index 0000000..ecc0850
> --- /dev/null
> +++ b/sound/soc/tegra/tegra_cif.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * tegra_cif.h - TEGRA Audio CIF Programming
> + *
> + * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
> + *
> + */
> +
> +#ifndef __TEGRA_CIF_H__
> +#define __TEGRA_CIF_H__

For completeness here should be:

#include <linux/regmap.h>

...
> +static inline void tegra_set_cif(struct regmap *regmap, unsigned int reg,
> +				 struct tegra_cif_conf *conf)
> +{
...
> +	regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
> +}
> +
> +#endif
> 

Otherwise:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
