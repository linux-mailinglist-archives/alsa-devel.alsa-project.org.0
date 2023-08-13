Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1824777A75B
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 17:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545D53E;
	Sun, 13 Aug 2023 17:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545D53E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691940220;
	bh=FQ48e+XQ1afdzUJiYrPSg1RQUcN5DBaQuBC8C72OuW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F2cFpeDYs6fPSkU2UF6fKmsNRNhkboUAPpIIGJPS9+KGiqqquh4pqcQbk/Uair8j8
	 z8ro3F994QrBjd7T88tlIfclwq3ZyVsVJr2ictft1/6jk3WxlQnOiw2l4apWhgy8k+
	 goWrc0q+Zc3FVhTDH3yB3foIMnDD5loDFgJyunBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01388F80552; Sun, 13 Aug 2023 17:22:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B022AF801EB;
	Sun, 13 Aug 2023 17:22:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32FD5F8025F; Sun, 13 Aug 2023 17:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDA6FF801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 17:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDA6FF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Q3uvwX+W
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so4590010a12.1
        for <alsa-devel@alsa-project.org>;
 Sun, 13 Aug 2023 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691940155; x=1692544955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U72ij9H7xly/POAmuR9nZYqDM563QnNZZvNrcGFMct4=;
        b=Q3uvwX+W38PXuccnalF83pEuAl0sXt0s0GtTBY/WJuv6AG0oG3EQBjR4HStycfv6HC
         4LrvSgwnC5C+IrdaZS2HT8jx+7+oxrTLX5x/uvG1w9mrOL8OsddMgHxXyqRTzgIp6Wx1
         j8U5CXH2HSTnXUL9kkWRElcSSBRYeRxeJgydXojH8QBRvfj823ForbSoWBHDiHT5NQO9
         LFad+1AEVusqHj8+Zg5HgdAh2gVcGuImQoOXrixHF0DoSLxTvDZN3lzl04rIUBJgMhiS
         ppD6iFlzhDISDFqgP1DIjSE3+PmaliegaYnmruWtcMEDGpTLhI8an9NQJ6T8M91mek+C
         gx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691940155; x=1692544955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U72ij9H7xly/POAmuR9nZYqDM563QnNZZvNrcGFMct4=;
        b=kAx3/xhUzSP96INUfzXxWThUkGBQbjmfgS6Fptpj2gmhb7OkNggtjmn+uJDJfVmb6S
         P4OT7He1s77/ujBUJrafrwzyRa7PT5La9IJhBBTnSUZ+5oPGikW3MEFZkTQ/hI6m8Dck
         PFV29WR0H3vE5ZxvoXaLxkxC96erG1keMNVZjBMiXrwt5buq0YODXUHRoItuQC+FFvsh
         xtece/ra8VfNyW1+dDntru5dc46dRCNIxorWpw1oq4lR/x7lbisaG6WhZw19LbgNDXZN
         NWh7NdPYXOdtu4cnFpwtHr4oO2+J5sTzHEPK3yP/WSXUXnaovmmvheZPiANmpr++Yp4s
         Wysg==
X-Gm-Message-State: AOJu0Yx5Ko50sLOdfByXQ/LJzuUN4Ef7PD62aD1mOJMZVNZgiwaMq9hY
	qNQzBe6qxjulr+bfoStBlto=
X-Google-Smtp-Source: 
 AGHT+IEq8lcT27+3KXWyXugbFwqrq92P97+ZW1qmGMQsqWgCVvad8+1JiyLdlFsV4rDaqfoiy0EtMg==
X-Received: by 2002:a17:906:5a57:b0:99a:e756:57bf with SMTP id
 my23-20020a1709065a5700b0099ae75657bfmr6293953ejc.7.1691940154549;
        Sun, 13 Aug 2023 08:22:34 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id
 cd19-20020a170906b35300b0098e42bef732sm4632902ejb.183.2023.08.13.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:22:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: perex@perex.cz, tiwai@suse.com, claudiu.beznea@tuxon.dev,
 lgirdwood@gmail.com, broonie@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, peda@axentia.se, lars@metafoo.de,
 nuno.sa@analog.com, povik+lin@cutebit.org, wens@csie.org,
 samuel@sholland.org, robh@kernel.org, u.kleine-koenig@pengutronix.de,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 asahi@lists.linux.dev, linux-sunxi@lists.linux.dev,
 Ruan Jinjie <ruanjinjie@huawei.com>
Cc: ruanjinjie@huawei.com
Subject: 
 Re: [PATCH -next 3/5] ASoC: sunxi: sun4i-spdif: Remove redundant
 of_match_ptr()
Date: Sun, 13 Aug 2023 17:22:31 +0200
Message-ID: <2691934.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230811071426.2343133-4-ruanjinjie@huawei.com>
References: 
 <20230811071426.2343133-1-ruanjinjie@huawei.com>
 <20230811071426.2343133-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Message-ID-Hash: WXICXVPHX6Y35DKN7LEDUS32ZJR5C3BD
X-Message-ID-Hash: WXICXVPHX6Y35DKN7LEDUS32ZJR5C3BD
X-MailFrom: jernej.skrabec@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXICXVPHX6Y35DKN7LEDUS32ZJR5C3BD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne petek, 11. avgust 2023 ob 09:14:24 CEST je Ruan Jinjie napisal(a):
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-spdif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index ff18d4113aac..c2b55d2e5fe1 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -718,7 +718,7 @@ static const struct dev_pm_ops sun4i_spdif_pm = {
>  static struct platform_driver sun4i_spdif_driver = {
>  	.driver		= {
>  		.name	= "sun4i-spdif",
> -		.of_match_table = of_match_ptr(sun4i_spdif_of_match),
> +		.of_match_table = sun4i_spdif_of_match,
>  		.pm	= &sun4i_spdif_pm,
>  	},
>  	.probe		= sun4i_spdif_probe,




