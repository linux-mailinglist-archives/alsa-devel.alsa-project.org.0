Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19626223753
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 10:46:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BACA81672;
	Fri, 17 Jul 2020 10:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BACA81672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594975591;
	bh=vSq04e1/E7kj+7kdOMfF5AM/SEwTr2XkFns/bQROang=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qy3Sf+K+PYq/hDYx5J0trGT0eEjOQo7YAQNrhTzOPMVusU8ed2me+2nJimzZoKi+M
	 ikOj0Y+1gkq6n+FO4I3zFjYFZOl4rdLfrIYePScFPy5S1IZ0ej7r8y0ylW/Fqq5p9o
	 GkH3hAcKVu+0eWX2nLlmJGj6fYZ5m6SIMXMbA6tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0958AF800E4;
	Fri, 17 Jul 2020 10:44:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B70AF800E4; Fri, 17 Jul 2020 10:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29BEFF800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 10:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29BEFF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="CcrWH877"
Received: by mail-wr1-x441.google.com with SMTP id k6so10160678wrn.3
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=9x6fTHZjafmueEMmRdi+LdlMzC2EII5ZkFzc9Fwx204=;
 b=CcrWH877Ri20PNsFBMBPs4KP9jLSBxVMwMQejX+OakrhCpNGurKvg/YYuWyooyngHO
 PGII9nSP3QITVgwaA4IMlURWO0b7gngGMwk2tXW0Z30dsgpHUZLhxbzH/rTNZ6LaErsg
 7bkbz0aMZlBSeE8sWKk1eu+xm6tMvSYt1dz3W5nHlHPy0+YrsvYM20RZqDXAcgy0hIFY
 IFcZv1BdkCGDXemcAcUKGgqaTS1rWgYSHbLZmWdaW+gVOH6Yvi9Ca51nI3rlF4f4cg4Q
 4J6q5a2drV9N+LEkPNNOqAy8bOGoph8gzskNnKVVKah64U9qztXuUs/d7VCVkGxWUC63
 2AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=9x6fTHZjafmueEMmRdi+LdlMzC2EII5ZkFzc9Fwx204=;
 b=bUCjplEwL0tdNshrB/iZKAUEkI5dfBkYvTXYyW3SYGTe7dpr2GxIOXJxSPP9i669eh
 lI22CDjy6IKau2xMkmhWRspA8Hu6UXA+wg3feuWZXKlWdL36iEJNZhwGPmpFZo/A3GbU
 ikNW3YCq6VZ/KUK9JQmrBJt7QeYf+xUydf0Cz1HHnPfNHtqYGkQdscze61NloXJMXbBj
 NiAnyI6hzkIIDiADuy0VNFXKQ7cI5XQXx2jClybT5o3WCBWj4K5M2W1qupyrnyOWOm2K
 pNSw5W/c8vIn+nOBZ0geD6ROlsLO2ejuCpR1EWgmdy6P8UPe4LD3xhcWxgyGIgKI7Qlq
 SVJQ==
X-Gm-Message-State: AOAM531+bnElT9hp7Fp3l0ICEjBTP0+dwcLGeFbzE9FjzG5zkucX0QF4
 Q7YTHA+lUtNhK+U1MfBZi9otQQ==
X-Google-Smtp-Source: ABdhPJyovxSTvHHpc7ZiBtlMV3klZ1rwvUq3jT7v0dWg3bOYRkcwggR2do8xcR8ffqqZT8dB2S5bOA==
X-Received: by 2002:adf:f311:: with SMTP id i17mr9496093wro.237.1594975477992; 
 Fri, 17 Jul 2020 01:44:37 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k20sm12480834wmi.27.2020.07.17.01.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 01:44:35 -0700 (PDT)
References: <20200717082242.130627-1-jingxiangfeng@huawei.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v2] ASoC: meson: fixes the missed kfree() for
 axg_card_add_tdm_loopback
In-reply-to: <20200717082242.130627-1-jingxiangfeng@huawei.com>
Date: Fri, 17 Jul 2020 10:44:35 +0200
Message-ID: <1j7dv2sf7w.fsf@starbuckisacylon.baylibre.com>
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


On Fri 17 Jul 2020 at 10:22, Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:

> axg_card_add_tdm_loopback() misses to call kfree() in an error path. We
> can use devm_kasprintf() to fix the issue, also improve maintainability.
> So use it instead.
>
> Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/axg-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 89f7f64747cd..47f2d93224fe 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -116,7 +116,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  
>  	lb = &card->dai_link[*index + 1];
>  
> -	lb->name = kasprintf(GFP_KERNEL, "%s-lb", pad->name);
> +	lb->name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-lb", pad->name);
>  	if (!lb->name)
>  		return -ENOMEM;

