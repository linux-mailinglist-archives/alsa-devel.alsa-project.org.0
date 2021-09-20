Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEB4122F7
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 20:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 376CD16DD;
	Mon, 20 Sep 2021 20:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 376CD16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632161929;
	bh=ZR+m93oeUmXojjO/NaA9otw2SkwQfC39s1zMGnd2DmY=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8+2wIPT1faiFkq89rRv5fpwU/uSvsHXwEdyXcUyDaardUddH9lnFkuBHfxwJgIxN
	 jR+ZAjUKTXbSefDYRAmQUKCewY8JCcQ2N0TMdO2GTRn+hnBtOQ4dTUdq1SQh6ZZsFo
	 P8yM9TmVELIdESXno5dlh5/kLG2kmtS/IMPf49LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82328F80279;
	Mon, 20 Sep 2021 20:17:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F00CF8025D; Mon, 20 Sep 2021 20:17:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E6AFF80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 20:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6AFF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="a63x+bgf"
Received: by mail-oo1-xc36.google.com with SMTP id
 u15-20020a4a970f000000b0029aed4b0e4eso4197049ooi.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=JjZwsjLoE1v3IYa2GVHYD3KilZhhQVThWYCXDu9nvYo=;
 b=a63x+bgfAIdvw+z6zqMvEu6JrCNqun+9IqImsNVfxFsirapOdMZ+eBj0e2g1IRZA8g
 AhQnWYI3S1LMtRTf3cyc5VHr2OowcGQUtv7/UympQw8t+7yyJIH+q8S1hc4KHM47rWK6
 ICe0PLjGSWwqVqs4PwDznSR8RBSF3gFpTPQfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=JjZwsjLoE1v3IYa2GVHYD3KilZhhQVThWYCXDu9nvYo=;
 b=ljbQe3t2Z+NHBaXb+t8ma1DPIXXcAN3q2wJr6Yl4EeuzK/IcU+2trHX/vhuGj5E4dX
 XPFNDPxs2AtlD+/AhTPIp7/3m3NH3XWim6PGts1BNDL2A06qdiRVNpPDd9zGL8z+icVq
 Uh7MaYs7JqXnsMXCDmJezk5YX8W5P+g9bJ5aJ8KuZmh084UQkgYsXdo7LGsaJJ37mRV1
 +k5B+Dl5CT6FbWl8gKUdkz1GVD8CjVyGEk9yV2Buktj7AE5fWiM43CCXIHXcZiAibw5s
 EiYm5I4uOGqUwxWP0jsXvNk03BJRq2AQR83Pdjdub0jUqMTnR/ciqSAS0WIpQTE/31go
 kx+g==
X-Gm-Message-State: AOAM531yO5iAgv4RqnyraENrrfyG5zL8/vE/hH5LiWtD586TIPfMK3gb
 e8/IkKZDdeX72rCU0E4H2p5Ilw7uzMn7cL3TzaoPOA==
X-Google-Smtp-Source: ABdhPJwVjR/WftKlNJXp2AGVuRgbTEYRYkgthir6kT3bKkja1m6mMkzqMgaNf1nOTAkyliApojmA+4e7jQQ/i3tbxgo=
X-Received: by 2002:a4a:c3c2:: with SMTP id e2mr7886842ooq.8.1632161840976;
 Mon, 20 Sep 2021 11:17:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Sep 2021 11:17:20 -0700
MIME-Version: 1.0
In-Reply-To: <1632123331-2425-2-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-2-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 20 Sep 2021 11:17:20 -0700
Message-ID: <CAE-0n51L7YSA4FDLv_2Q9U3nzxK1YY8hRtZ-G0cs42nomySMTA@mail.gmail.com>
Subject: Re: [PATCH 1/7] ASoC: qcom: Add compatible names in va,wsa,rx,tx
 codec drivers for sc7280
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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

Quoting Srinivasa Rao Mandadapu (2021-09-20 00:35:25)
> Add compatible names for sc7280 based targets in digital codec drivers
> va,wsa,rx and tx.
>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c  | 1 +
>  sound/soc/codecs/lpass-tx-macro.c  | 1 +
>  sound/soc/codecs/lpass-va-macro.c  | 1 +
>  sound/soc/codecs/lpass-wsa-macro.c | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 196b068..520c760 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3578,6 +3578,7 @@ static int rx_macro_remove(struct platform_device *pdev)
>
>  static const struct of_device_id rx_macro_dt_match[] = {
>         { .compatible = "qcom,sm8250-lpass-rx-macro" },
> +       { .compatible = "qcom,sc7280-lpass-rx-macro" },

Please sort alphabetically on compatible string.

>         { }
>  };
>  MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
