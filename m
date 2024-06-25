Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE03916EB0
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 19:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412E083B;
	Tue, 25 Jun 2024 19:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412E083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719334819;
	bh=FpCXBcjNasPCd7gzQ0d/1eVDiQnq9bdmJyABlclUbEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cWRbZz8vXB7fezBW4GWxkHlSzZsB2L3fZw3BJ/sDbshnFF4El/0HuToqFHTiUMV+x
	 bf/Opqn2Ck/7HsBXKMyZZx2vwE7xTGvjshzXG4HM3tMndAy1rax7nOoaEyLScZwBtc
	 vDne8DUj/BJN5FXvzJ0JWmfmwPUC0HDtfQw4/nRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63DDFF80587; Tue, 25 Jun 2024 18:59:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6E60F805A9;
	Tue, 25 Jun 2024 18:59:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4282F80495; Tue, 25 Jun 2024 18:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33F85F8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 18:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33F85F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QnyM4OIw
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so66833401fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334225; x=1719939025;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir2hWbZRQe6JRonqyk5LScY3xCjHxyFZ1ViC/BMSe58=;
        b=QnyM4OIwAYkgQo+8POeXMrseHas0Yn7q8TvE4dnM1UIHJEjGYeM+FL2gSzca3x3c/6
         SXHn5FDB3BDMBDVlqWBs/HIqeOIuIKcqHK682Re5Me3Y6suQ/7Zykt+38UTADjBUu7XL
         RZozlXuQPij0Jk6I7drfLtxJoZ1OkQCOazoWzvToKFzyPAq4r+W0zlvSIrAWL861HpZi
         DxbXl7py30MugAr9TQsX46aeXLNMGWON4nuMB71s5WqwpLmt8H2mzQwwGrQ/V6CCweg3
         xuSLZeChrpRf3AvGobrxu10eBpl+z8N2MPe8klnE0W5J0vQTZDpTiUnYoAI5qyy5FKvz
         cIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334225; x=1719939025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ir2hWbZRQe6JRonqyk5LScY3xCjHxyFZ1ViC/BMSe58=;
        b=WokXpTVkSQNra7w/UHrNPpm8aKrBG4yhHSe+KZ5J+cLIA2Tu/lxfV7sKHdIP2nnwlJ
         9mPlHh7mPo2zXP97MH1xEbKfVYUIhIfNorccbmjXv952jLq6FTb0RwOMvUdoNjqvX5rF
         wKbkGcbsPYx3yUB3U+PV7NDn6YTnL2TuYnXSa/9qGRNkt2RjHw8L28dYtuDdqS0YQUHn
         5pjPqbfAM0YyCp9/W9Cg/1xshvuvWS6TzZQeJ6k8tgz7NS/wUG84ay57mqKHO27N6Kz+
         oVBRECajb7AUm5W6eudVn+5TQxqnOGl5nfM03shAwUeLgKa5UR0eKUiZw6aDe9WDyehk
         5jqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIncFnZieUZP5kajegYx5ybIB2sPTIz+xKBu0eCYWsJ0fx3ypi0rXyXam3MQQNaIHvjtvujpMVLmPsVbHLrw+Wi5PyqSz4H1Swp/Y=
X-Gm-Message-State: AOJu0Yy8AsV1nCMnIexZYS4EbP1twgosfmaPELyHHMZb8JxWFbH5EcNa
	N4s0jBsUu8BoQqAupvIE2hp/mardj8vokNEkfhLQHryy2ilgzUzIF5nmZ8PxibU=
X-Google-Smtp-Source: 
 AGHT+IEWhnQd9LfyRRriXAv2lYlKo5QSl+8ZswlUlB2fAE+H6jrFVIyXYSOJ5WBxj4SizxoPJGOuBw==
X-Received: by 2002:ac2:4823:0:b0:52c:d56f:b2cc with SMTP id
 2adb3069b0e04-52cdf82574bmr5362111e87.58.1719334225501;
        Tue, 25 Jun 2024 09:50:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b47b2sm1279133e87.50.2024.06.25.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:50:25 -0700 (PDT)
Date: Tue, 25 Jun 2024 19:50:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: add missing handling of
 v2.1 codec
Message-ID: <7kw3xiqoc6sltaz5w4m2azprieaqbu7jivupgpzzwesxynyjd3@j2fla7epac6z>
References: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: LOJDIRJFG2NDN756AIJ7IR35BDMSXIC6
X-Message-ID-Hash: LOJDIRJFG2NDN756AIJ7IR35BDMSXIC6
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOJDIRJFG2NDN756AIJ7IR35BDMSXIC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 25, 2024 at 06:06:14PM GMT, Krzysztof Kozlowski wrote:
> We have also v2.1 version of the codec (see 'enum lpass_codec_version'),
> so handle it as well in all switch cases.
> 
> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
