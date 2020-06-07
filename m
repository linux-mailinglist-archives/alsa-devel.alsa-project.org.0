Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6061F0FDA
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jun 2020 22:41:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC811614;
	Sun,  7 Jun 2020 22:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC811614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591562502;
	bh=CYlJBDeJImrFLOl4hMwkWi5YOhP7WYDslE543rLKT2I=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMCCRzi4NFkuXqyTi8iPWo0WWKWbfUBqacsjeZ/BngQWjkfW+lYp8QfGnhMg5PqXq
	 82m3enBXI3onpAzQwAGvyYrK8Waw2O9Y5M4/3FLut9GVU0m2VOAbbXTgyCV0Xd85XX
	 23Cyt5sCQocP6Zib+F+7j794L4AEjbxu0Y40YE+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A99DF80291;
	Sun,  7 Jun 2020 22:40:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BB48F8028D; Sun,  7 Jun 2020 22:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F1BAF800F4
 for <alsa-devel@alsa-project.org>; Sun,  7 Jun 2020 22:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F1BAF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="KdOyqU9N"
Received: by mail-ej1-x644.google.com with SMTP id l12so12217117ejn.10
 for <alsa-devel@alsa-project.org>; Sun, 07 Jun 2020 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=cxAlOko9t8uVXP+cvSgKgh4pcthYDznq/xdMjGJwWF8=;
 b=KdOyqU9ND3HG5d87XzvYCfQ2uByF1009R35nYXeDDMLn3vhVJNmlnwuNBXc0HasUMj
 LyKvjV0OHT0/GFgDE/03M8ppq31jNA/14gxV99DDyqL8qAre2/OHH5LtP6yQKvfznyX2
 LROlH2K/f/dx1Vn/5b4xOX0oA7ArWmNxLbjZ1JVMq+Vnt/1ms3tCRN/hGC71MCrsqjUd
 GIPFEFAU/eZqHJivwmZWwKWtr3PRkJqQ1obBpY+x+MD2ytvfqSzxenTN/wm1iaf4iXcG
 kNiefj+tDTqhRm+1eJYp0/rg7yaWUj0T9E5B1oGeYm2hbTCHEqv2buK6/vOkL0BGK6WX
 fsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=cxAlOko9t8uVXP+cvSgKgh4pcthYDznq/xdMjGJwWF8=;
 b=P4qctqgl64K5SsW/PFjGh/UwAnkkBihfVhfTjGdP9sCp7d0Cu4VEjQCoAGj5/DW7rs
 JlryFww0GOV3m2bOYc7a6+wMAxDIwjFjpwgtCG1c/iOa8Z25txJ+YfIZv4Hw/3nCcsP7
 vWSXtTHjMJeUFl+1+FyyJF2TauBKhNzk1lXo/DbNBmcStLjXPX+aTA1ZMVygOAnBq/JT
 rsQV3yuROBCamKfjN2h8+7x9pX7Jx13GTfMEli5c/hNV39SGIXMTCVXNXCOlE0194bVs
 OQO+NLdreYhDeO+aJlM2Pyv+4quApp98uW4p8vtbXY5CFRB6K0jEANUaffcH3Mt0kd31
 4zkA==
X-Gm-Message-State: AOAM533MAeb3rkFRMOFTjRRKMlpEWEHdZiMWvb0BSHnfnoZ1WscZ7RkZ
 qTXOYFbIyuy+5JMJhM7wTRuarA==
X-Google-Smtp-Source: ABdhPJxhaSuBhybacMUdhNX3W1cQmnqaVuUYl4vqsJiFOjecWMYGoz4GLI7EUeGpnCcBDZ6WR7g6xQ==
X-Received: by 2002:a17:906:a387:: with SMTP id
 k7mr19195332ejz.408.1591562389607; 
 Sun, 07 Jun 2020 13:39:49 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id v29sm10754839edb.62.2020.06.07.13.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 13:39:48 -0700 (PDT)
References: <20200604171216.60043-1-colin.king@canonical.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] ASoC: meson: fix memory leak of links if allocation of
 ldata fails
In-reply-to: <20200604171216.60043-1-colin.king@canonical.com>
Date: Sun, 07 Jun 2020 22:39:47 +0200
Message-ID: <1j7dwik3u4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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


On Thu 04 Jun 2020 at 19:12, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently if the allocation of ldata fails the error return path
> does not kfree the allocated links object.  Fix this by adding
> an error exit return path that performs the necessary kfree'ing.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good, Thx

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/meson-card-utils.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 2ca8c98e204f..5a4a91c88734 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -49,19 +49,26 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>  	links = krealloc(priv->card.dai_link,
>  			 num_links * sizeof(*priv->card.dai_link),
>  			 GFP_KERNEL | __GFP_ZERO);
> +	if (!links)
> +		goto err_links;
> +
>  	ldata = krealloc(priv->link_data,
>  			 num_links * sizeof(*priv->link_data),
>  			 GFP_KERNEL | __GFP_ZERO);
> -
> -	if (!links || !ldata) {
> -		dev_err(priv->card.dev, "failed to allocate links\n");
> -		return -ENOMEM;
> -	}
> +	if (!ldata)
> +		goto err_ldata;
>  
>  	priv->card.dai_link = links;
>  	priv->link_data = ldata;
>  	priv->card.num_links = num_links;
>  	return 0;
> +
> +err_ldata:
> +	kfree(links);
> +err_links:
> +	dev_err(priv->card.dev, "failed to allocate links\n");
> +	return -ENOMEM;
> +
>  }
>  EXPORT_SYMBOL_GPL(meson_card_reallocate_links);

