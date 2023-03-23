Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1076C6A2B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:58:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD0B6EC4;
	Thu, 23 Mar 2023 14:57:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD0B6EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679579905;
	bh=iso66AJgN26iFn+GhQjJv1sSkC9KzaauszCdj/saEIM=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ou9OfNAkc82OxISlCaGqmbVcKtZ/7GRfVAUNMsbZYia62xM8KNfKtQA6GIv+hRqcA
	 dCrHOWZ8Nsu05u90aOX+C6KGuQC5WGa4mh6tHg3cIW3mNxP5VEC1ufqCW3ge/F5W+N
	 5YZcFUm6TYP+foN2mNBTRolEJ/Gz+/oV93BOuYrU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8726F8027B;
	Thu, 23 Mar 2023 14:57:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92EFAF802E8; Thu, 23 Mar 2023 14:57:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 343EAF80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 14:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 343EAF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PzDrElI8
Received: by mail-qt1-x836.google.com with SMTP id g19so1430059qts.9
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679579845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0UGsNG9W2UNoFjKyA3o9SiIejcO47eu8yFQSpE9OdRs=;
        b=PzDrElI8d//E88KzlNQY0S7DnaQI6jMaVTRjxQG2/24vqEDUl3v8eOFIFLbEhlMiCY
         xbKk/iVjjqH17t43fDNG9ZxrXsA0fOomC6/jDawCYMHxOB9Y7gIKhYanOa0NdgQd0Tir
         AP0ntaA0L5934i17YnX7azpE4YgRy7QRCNYTnWIWpvwmfCTMzxM/vU+LnRalrf4ykVQO
         ++YP02zeGsmVJtvlXStzv3aQwkBQUAsCOTXqo3HDlOI3ohkDjPhv+JClrKOxx6zCvw9n
         wpLRmjvaOhwjGJPe2E6CL+RS1Hn1k3pBWn0ufI+CQEN8t4zfATsciu3w+r2fbK6xcjZv
         nVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679579845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UGsNG9W2UNoFjKyA3o9SiIejcO47eu8yFQSpE9OdRs=;
        b=bG+jm597dJhkPq6HZUtpP4xJ/oW+sBJY+F7B7Bt/PTQTBv8vWYenDtk+v8Lp7ZuJ+V
         lkkTLhJXiI4q51zVqJzvYjQg3RTKM1cPU3RAQyTj2UDWVcR9GufT8lQXmIfdtv6WJGkZ
         7SCekI5MUZCaUbQM8cMdvx+LlEv4uRcIg5KtypDMYgDIHNw1v315m1Doin+/vKGjXDka
         6ksMgVylvyuM+SHP77p/msHwoZFmzPGyyZKCWsAXVOyfj8x9HrdkT3OCvWyVBvtk7TuV
         bEabhcg8o8SVlTOWinbvG0+Ydu9cr4gy5ftjqtmLUeVt8sWa4c/83UmnSLarD9m7DZgc
         kJGw==
X-Gm-Message-State: AO0yUKVstNY0ZEs63WwOBCU3o3B8kn3VfDOQPH5pJtYEHhk4uZ+GYAk3
	vujcAzkmmtKRCfsntOE2zaaxEoCrHIC96mOLl/jATw==
X-Google-Smtp-Source: 
 AK7set+ocAuMC9Lw34FR+ipU4tXGRuA5/YrqvfJbPUY/bllTbULe/XpImra+yz2e8OVOj3Ln8NUQqtOTrPqiteXXVKY=
X-Received: by 2002:a05:622a:34d:b0:3e3:8a0e:495f with SMTP id
 r13-20020a05622a034d00b003e38a0e495fmr2368502qtw.13.1679579845233; Thu, 23
 Mar 2023 06:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230323110125.23790-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20230323110125.23790-1-srinivas.kandagatla@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 23 Mar 2023 19:26:49 +0530
Message-ID: 
 <CAMi1Hd0Zg2nydXu0J_zGbcd9AwLbTWU2h_YNAb8ZRSOBRTWQbg@mail.gmail.com>
Subject: Re: [RESEND PATCH] ASoC: codecs: lpass: fix the order or clks turn
 off during suspend
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 3U5GIDPCUYM7A3IY2QG5AFE57XK6PUQU
X-Message-ID-Hash: 3U5GIDPCUYM7A3IY2QG5AFE57XK6PUQU
X-MailFrom: amit.pundir@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 stable <stable@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3U5GIDPCUYM7A3IY2QG5AFE57XK6PUQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 at 16:31, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> The order in which clocks are stopped matters as some of the clock
> like NPL are derived from MCLK.
>
> Without this patch, Dragonboard RB5 DSP would crash with below error:
>  qcom_q6v5_pas 17300000.remoteproc: fatal error received:
>  ABT_dal.c:278:ABTimeout: AHB Bus hang is detected,
>  Number of bus hang detected := 2 , addr0 = 0x3370000 , addr1 = 0x0!!!
>
> Turn off  fsgen first, followed by npl and then finally mclk, which is exactly
> the opposite order of enable sequence.
>

Tested-by: Amit Pundir <amit.pundir@linaro.org>
CC: stable@vger.kernel.org # v6.1.y


> Fixes: 1dc3459009c3 ("ASoC: codecs: lpass: register mclk after runtime pm")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>
> Sorry for noise, resending this one, as I missed the asoc mailing list in my previous send.
>
>
>  sound/soc/codecs/lpass-rx-macro.c  | 4 ++--
>  sound/soc/codecs/lpass-tx-macro.c  | 4 ++--
>  sound/soc/codecs/lpass-wsa-macro.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 9e0a4e8a46c3..372bea8b3525 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3668,9 +3668,9 @@ static int __maybe_unused rx_macro_runtime_suspend(struct device *dev)
>         regcache_cache_only(rx->regmap, true);
>         regcache_mark_dirty(rx->regmap);
>
> -       clk_disable_unprepare(rx->mclk);
> -       clk_disable_unprepare(rx->npl);
>         clk_disable_unprepare(rx->fsgen);
> +       clk_disable_unprepare(rx->npl);
> +       clk_disable_unprepare(rx->mclk);
>
>         return 0;
>  }
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index b044c9c6f89b..d9318799f6b7 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -2096,9 +2096,9 @@ static int __maybe_unused tx_macro_runtime_suspend(struct device *dev)
>         regcache_cache_only(tx->regmap, true);
>         regcache_mark_dirty(tx->regmap);
>
> -       clk_disable_unprepare(tx->mclk);
> -       clk_disable_unprepare(tx->npl);
>         clk_disable_unprepare(tx->fsgen);
> +       clk_disable_unprepare(tx->npl);
> +       clk_disable_unprepare(tx->mclk);
>
>         return 0;
>  }
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 728f26d12ab0..6484c335bd5d 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2504,9 +2504,9 @@ static int __maybe_unused wsa_macro_runtime_suspend(struct device *dev)
>         regcache_cache_only(wsa->regmap, true);
>         regcache_mark_dirty(wsa->regmap);
>
> -       clk_disable_unprepare(wsa->mclk);
> -       clk_disable_unprepare(wsa->npl);
>         clk_disable_unprepare(wsa->fsgen);
> +       clk_disable_unprepare(wsa->npl);
> +       clk_disable_unprepare(wsa->mclk);
>
>         return 0;
>  }
> --
> 2.21.0
>
