Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436E0166F53
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 06:46:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D85AC16AE;
	Fri, 21 Feb 2020 06:45:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D85AC16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582263960;
	bh=zIbhDddUmHa5TDC+r759H6FNHteXpJm1mrsiM0r4H4c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XP81WWEr6PkLcFLKjYVTikKAaQnlpZPDPZlR5/xWoyciiVNpd69zF1kH2xPbLGux8
	 Hlr5Jx3qkd9le0BdZG4CESTRBlEyx9vXvxJYgeTouQw6sDJZSNq19HnMvpmFp3mCoX
	 pNU1OuBS3vyQVj4OnjCO4NoWDXQQeYAws4VwzDuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CED25F80273;
	Fri, 21 Feb 2020 06:44:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6388F8025F; Fri, 21 Feb 2020 06:44:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91965F800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 06:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91965F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eMNaCUJE"
Received: by mail-lf1-x143.google.com with SMTP id z5so553595lfd.12
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 21:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2UgAnj6jZp1qG1YLmVU+s8neLldQ2RYmNJhZiIaSc/0=;
 b=eMNaCUJEGRDUtZkbDe8gOuqJY4E/7nOx7YQNd/AXSD9oN1/VBQk4tkoCZl+ogomTUr
 7wAsVSWMAtiUG+nYc0I49wT/MdT77hECH6riPK5hWQ/oVhMIdUUyZXfdZqhz1Kbf/mMA
 V07lLX5i4aHYK32v9caq6E/oILqdGvuIvzDtJP0T1LPMGn1rtkiubshymLKZAlmDwBWd
 oXffxa8Q17ZlYFjBUT7WnEuZQtWKATSeMWN+XjUQcAv/6vg2ToWCA5DDJtEp26cjRNtn
 uhtZi5EcBOwkMWHChUJPAQUbad/7znFyx2tum31Y9tEVmYRT4oSn4Tp2Mr4yTOvQ7ww7
 tbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2UgAnj6jZp1qG1YLmVU+s8neLldQ2RYmNJhZiIaSc/0=;
 b=g24l4Ca3O4KFQTfYV8ZoRNgs1ybQgyWfRcRniezJTRl1BNpWGfN/npZZcdy+S5vX9I
 r4DBDRk4q0R3U6/jj77hec0rbJLuObyOIT1RbBIbQlf5gGhjPJtercMoB8AXSdj4L4kH
 1wO6Wwppkpuk3WNe00hOQ+sPTPXcQCI4m/5Ncdsi1M4zt1oGKzQIcYkJzhA9mvloSpS8
 SMmYagP1/jicm5x3rr826dkdmaaGJggXd5e9hce+Z22P3mEn7XmKU+f2mN+b0iHhUvDs
 mmnr9XEiGVsDsos3yfABlycANba2KO5O/TccgofKVYy3Z6wARBFrU/9xpIOyrBDziRO9
 ENaw==
X-Gm-Message-State: APjAAAX6oq0iuZnpeYNKFMEcynO+NPaKU6WxdCU1ucuvhNv1MnxqVxNl
 pgl7IUE4cRJAtC294msofpQ=
X-Google-Smtp-Source: APXvYqzgn8/o821KnPadYfAQcIxUDrXlnyZSa/bLptkr5D3/jPIQ303Yf3UYNNBuGJs94SgI0ruKEw==
X-Received: by 2002:ac2:54b5:: with SMTP id w21mr18980569lfk.175.1582263852420; 
 Thu, 20 Feb 2020 21:44:12 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id d20sm878742ljg.95.2020.02.20.21.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 21:44:11 -0800 (PST)
Subject: Re: [PATCH v3 10/10] arm64: defconfig: enable AHUB components for
 Tegra210 and later
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-11-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2276bbe3-b01f-33b3-b28a-2b579678a745@gmail.com>
Date: Fri, 21 Feb 2020 08:44:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-11-git-send-email-spujar@nvidia.com>
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
> This patch enables following configs:
>  +CONFIG_TEGRA_ACONNECT=m
>  +CONFIG_SND_SOC_TEGRA=m
>  +CONFIG_SND_SOC_TEGRA210_AHUB=m
>  +CONFIG_SND_SOC_TEGRA210_DMIC=m
>  +CONFIG_SND_SOC_TEGRA210_I2S=m
>  +CONFIG_SND_SOC_TEGRA186_DSPK=m
>  +CONFIG_SND_SOC_TEGRA210_ADMAIF=m

There is no needed to duplicate contents of the patch in the commit's
description, otherwise:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

> This patch helps to register AHUB and its clients (I2S, DMIC, DSPK, ADMAIF)
> with ASoC core. Since AHUB is child of ACONNECT, config TEGRA_ACONNECT is
> enabled as well.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c8801be..784ca4f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -207,6 +207,7 @@ CONFIG_FW_LOADER_USER_HELPER=y
>  CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>  CONFIG_HISILICON_LPC=y
>  CONFIG_SIMPLE_PM_BUS=y
> +CONFIG_TEGRA_ACONNECT=m
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_RAW_NAND=y
> @@ -590,6 +591,12 @@ CONFIG_SND_SOC_RK3399_GRU_SOUND=m
>  CONFIG_SND_SOC_SAMSUNG=y
>  CONFIG_SND_SOC_RCAR=m
>  CONFIG_SND_SUN4I_SPDIF=m
> +CONFIG_SND_SOC_TEGRA=m
> +CONFIG_SND_SOC_TEGRA210_AHUB=m
> +CONFIG_SND_SOC_TEGRA210_DMIC=m
> +CONFIG_SND_SOC_TEGRA210_I2S=m
> +CONFIG_SND_SOC_TEGRA186_DSPK=m
> +CONFIG_SND_SOC_TEGRA210_ADMAIF=m
>  CONFIG_SND_SOC_AK4613=m
>  CONFIG_SND_SOC_ES7134=m
>  CONFIG_SND_SOC_ES7241=m
> 

