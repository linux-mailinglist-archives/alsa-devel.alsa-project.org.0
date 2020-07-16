Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67F2223ED
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 15:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FD921661;
	Thu, 16 Jul 2020 15:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FD921661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594906298;
	bh=8hlS7UYYTnuiTE5jQdUF4hetNXIIo8nmlqX9Q1wE7y4=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HEB7SeDdbmN/801pUzvxjC4gIYR1QiBhxx1uuqZzJlGZoF+z+9ewOcmPM9dF9I1Ya
	 Yw7tBjPmtHxhhFYyiiW07rBZiKEAkHXL92DgDtPFW++vksnPCdBcg2yaJMPvT08r83
	 t8zpJyqkPA8cPCCU1dFT2i1i2M1FgKLOD14Xh7Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC153F8014E;
	Thu, 16 Jul 2020 15:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60568F801EC; Thu, 16 Jul 2020 15:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62D8CF8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 15:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62D8CF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="e4FEY+O3"
Received: by mail-wm1-x343.google.com with SMTP id j18so10311392wmi.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=ekSSt/5t2jmT5g2LzLm9iiouocorbUPUaL0+PSkZByk=;
 b=e4FEY+O3MN9kneCWpjw2AuA6M3EOeHa76eTJCimRqpdrtKBQSSOraxPXNbBS8f8Hzc
 tz6zo/FvGqILsjj+bkWDfBySfy7EQhsxQfhljSHeGFQUXL1R14dAuoybNl747hLEjDPY
 vNppE3yDsKtFgZlvE7vJe6drtvYw7kI2pOfy2MRc5OuRRPF1FSQ8K8uCJQgeihxxobQi
 QVzUMhFg6KbZManF2vD441ml3dsS6g5yEkZFsIp/v/x1LiDzvlWdzu0jxI4KmMVzVDtZ
 mvFloFDMjuuzLmqzI356WyXrn6UiezpZ3f74qnVUym5bzdrugxI4+QulkFaW1qEiGlH3
 oUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=ekSSt/5t2jmT5g2LzLm9iiouocorbUPUaL0+PSkZByk=;
 b=scUODIRoszUs17Siv4fgUXFjcaBu74Ubmwycc+Hz1phuoh7t5Zk9CnkRYBxi1AJR+z
 3s5Evc6hI9U+3bz5SLn5bt2vx+DByvnBwFYGIcQRgipHvzqoq8y6Y/AflDrGbmNwd/GR
 Fy3Qpv2WH684nkVjfSfw1xDFlJq4CoK6K9Wb+8mYNDNYaJ9dneG+zXSkCFeS59co0TUK
 b2ZSkdOwoPFbXglAVZEyECIr75MKWMIsYf9nHrIPm+eoZDWNJLnRVNwELJQgahzVzyCi
 POFxXhkFFf2kes2HJE9moIOFwg2L9X4KWaRsBoLoZpG9k+A873vHhbLYDHT9DxxFqPmF
 rmpQ==
X-Gm-Message-State: AOAM530YCKwmQkeslNHXcuHCD/G+pbcEs+WCCc+/LhiKneLvkLi5FoSb
 VzFAeoaqvnm2k6xbW0Ls9g3Xiw==
X-Google-Smtp-Source: ABdhPJyADBcDb+XzELdoJ99YW8KYEjCgWzkM0ZKScl+XNUWRXJyRD/oosm2ILnxfvcz3p0ggTeii6Q==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr4618549wmf.38.1594906180632; 
 Thu, 16 Jul 2020 06:29:40 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x7sm8945595wrr.72.2020.07.16.06.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 06:29:39 -0700 (PDT)
References: <20200716132558.33932-1-jingxiangfeng@huawei.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH] ASoC: meson: add the missed kfree() for
 axg_card_add_tdm_loopback
In-reply-to: <20200716132558.33932-1-jingxiangfeng@huawei.com>
Date: Thu, 16 Jul 2020 15:29:39 +0200
Message-ID: <1jzh7zegfw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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


On Thu 16 Jul 2020 at 15:25, Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:

> axg_card_add_tdm_loopback() misses to call kfree() in an error path. Add
> the missed function call to fix it.
>
> Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Thanks for fixing this.
Maybe it would be better to use the devm_ variant for the name instead ?

> ---
>  sound/soc/meson/axg-card.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 89f7f64747cd..6eac22ba8b99 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -121,8 +121,10 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  		return -ENOMEM;
>  
>  	dlc = devm_kzalloc(card->dev, 2 * sizeof(*dlc), GFP_KERNEL);
> -	if (!dlc)
> +	if (!dlc) {
> +		kfree(lb->name);
>  		return -ENOMEM;
> +	}
>  
>  	lb->cpus = &dlc[0];
>  	lb->codecs = &dlc[1];

