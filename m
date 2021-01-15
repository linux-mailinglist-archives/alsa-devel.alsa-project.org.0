Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC02F7BA8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 14:04:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEBBB17AB;
	Fri, 15 Jan 2021 14:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEBBB17AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610715871;
	bh=1sSmbT74MAWdX3F/HVg+EzumTjxaXJpTjyVPLaBS/XA=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WAnDSuB6S3MNkAOoATppP++oqXIRP/P9QGQIppkzVJNKuM7s0ba96wVhXaXqwyqR1
	 4l4M5F37m6am+vidfewr+34Nqo4Z/gOF95G7mZ/4TscI4CnenwgtPsW2IpPSr7JQmM
	 NBmY31kLkC8fgoLiyU4wXpdLK74S6ApibHsxcMjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4BD7F80254;
	Fri, 15 Jan 2021 14:02:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6EE5F801ED; Fri, 15 Jan 2021 14:02:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F6D2F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 14:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F6D2F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hucXtmX2"
Received: by mail-lj1-x231.google.com with SMTP id m13so10237346ljo.11
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 05:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ced3NxvYK3fUREKoo4RuGKO8nItMO6rbOL9yPMeNSOA=;
 b=hucXtmX2CLjSjXIeLSPOZ5kLbLG4UtSP8wR/Weha9hA+jClqCuD1CGIg1DAS4NAIVS
 8b+lrciqxAGBr2MJnz5JrRaUc9cGb7AY9E+XRihDqQd/5EYG8xoJ5BJY9Dk4/u4OiEp5
 Udo5JPNQiHQbdP63KJGNhSvQ2pKNCvLiWshOj2XZjFk/73ulW9g5YglPv9n3KQhSd6fR
 GOtp9b/ALqb5L5zm+1ZTYylQeGnuAkanfAjdke63gsHywW70CWSr3eH76r8akVfzhLbw
 N5GHY8YaabL2Apmh50ZOKiMWw6zlZ/oG1djh1V3GSqJl3Of8/hBsww2uW7PuN/il7FUb
 80jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ced3NxvYK3fUREKoo4RuGKO8nItMO6rbOL9yPMeNSOA=;
 b=Ho/L+aoHq+Cjhhz0VSUnafAN3QwYH2bf7UaONxkJQpb4EE6vzBkV5wBnIP02Qxszv/
 2TXsD4yq3u4hPm7e+9UyWVc+93wSOtF+gwyc9YCQyqfiP7VLYYwjz528Yu8Nqwv5MQou
 wTY9QL3a1mq2YwbVkuH6I/4JyjI7BKeXG7j4cm/LaqxW0tg3BAkLvau3ZhJI/r1cDO4J
 M0rzi1tK7FBXbVDxG7zBjxk88w/LP758w3K1c9ykcLxxTAVTJDC7gqvW7ds/aWLOwbh1
 t+ycOh/COH48nMoftoKB5H8nAHTu3Agr3pkPIUl89mdhRKY4GKlJVTCBDijbF4jKet2w
 JnmA==
X-Gm-Message-State: AOAM530nNd7ic9pdevM7F5lxVoFjEI0XWd4S0tGvkNYDnymUxv4GNQ5p
 BgGe/zGNY6zeArCU0+CQFew=
X-Google-Smtp-Source: ABdhPJy1VyYGCB2G9pvcPq97w0TzAlqZ2ViCpO83g6XVhyil0OoITD43h7+sCiO7pF/mO4Td/ZQ4wQ==
X-Received: by 2002:a05:651c:1282:: with SMTP id
 2mr5260045ljc.383.1610715771914; 
 Fri, 15 Jan 2021 05:02:51 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id z9sm892667lfs.183.2021.01.15.05.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 05:02:51 -0800 (PST)
Subject: Re: [PATCH v1 5/5] ASoC: tegra: ahub: Reset hardware properly
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-6-digetx@gmail.com>
Message-ID: <5d99eba8-a169-1dc1-c7ab-0734c67c50b7@gmail.com>
Date: Fri, 15 Jan 2021 16:02:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210112125834.21545-6-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

12.01.2021 15:58, Dmitry Osipenko пишет:
> Assert hardware reset before clocks are enabled and then de-assert it
> after clocks are enabled. This brings hardware into a predictable state
> and removes relying on implicit de-assertion of resets which is done by
> the clk driver.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 33 ++++++++++++++++-----------------
>  sound/soc/tegra/tegra30_ahub.h |  1 +
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 4dbb58f7ea36..246cf6a373a1 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -65,10 +65,20 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
>  {
>  	int ret;
>  
> +	ret = reset_control_assert(ahub->reset);
> +	if (ret)
> +		return ret;
> +
>  	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
>  	if (ret)
>  		return ret;
>  
> +	ret = reset_control_reset(ahub->reset);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
> +		return ret;
> +	}
> +
>  	regcache_cache_only(ahub->regmap_apbif, false);
>  	regcache_cache_only(ahub->regmap_ahub, false);

I just realized that this is incorrect version of the patch which misses
the regcache syncing after the h/w reset. I'll make a v2.
