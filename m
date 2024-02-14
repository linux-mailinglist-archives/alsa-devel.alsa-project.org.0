Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7998540CF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 01:23:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A350EEB6;
	Wed, 14 Feb 2024 01:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A350EEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707870230;
	bh=ds1jHombM1rmzITyFT/LkXRFY7v4NO/aeENbS+5oo6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UcnM+GHdoqH3QVTR1RCDFT9qduee/T98dj7xhKEls46tR5ShA0XDf41MhlYov+wiI
	 IEC2hB+Qsa9jiO82zkMWkIGTmACwa9DCH1dT0GgtCpcN1Y5nJ1+kV2pN31TANjpEwG
	 sXrNA0e94+HT12oTpVNaHVvZsVxFOYoyrmH99QKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89CC3F80579; Wed, 14 Feb 2024 01:23:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE79F80588;
	Wed, 14 Feb 2024 01:23:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52A8BF80238; Wed, 14 Feb 2024 01:23:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	FSL_HELO_FAKE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41F4CF8015B
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 01:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F4CF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=LKHhNUIg
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-363b5ce4260so14509975ab.0
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 16:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707870180; x=1708474980;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jWP8VrxhP1EJOZNrm4lfKLrk9GA9+9HRFG23gj3nBY=;
        b=LKHhNUIgppoy44xRww1fFxaLQq3FWx/BwOhTuP0+tYKIPnfhnoaTz1S4gX/kpwg+Eg
         rdCRDemBuqJDS1o69K8G+xvZif/Oon5sjCJE3c/GyTqKJZMkEzLjrz/gG+R+MIdLGJzu
         3iQ8aCJDcfH1m7Q0TL5ekEVsamuIANKRur5YGLuM7AmH2yvjYMx1KaSrS3Qcw2xFJcGb
         gPVSl60V9W296M47kpBoOu8JPRdFGDaYkHYzfMfJnT1JZgl1mMuOHUeXdQMfeEwtWrN5
         k4G2VpebE8MwN5i1mOeqIJs+DV8/3H9NEFOs/ZmZFk5+vRlJTcoW53TrbmdPaeASxMlK
         I0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707870180; x=1708474980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jWP8VrxhP1EJOZNrm4lfKLrk9GA9+9HRFG23gj3nBY=;
        b=LbktiTFVETBse154GLVW5ZvfPhT3WSQnrUNBooSb/kKmUc3fKNsFTayS0Po6gUCQY3
         4rPmM+hAVLcACVFJc0LGCzu/oCufjczXBYP9QyTnH6MBt5mSfmnR6GIxnVjJOydv+rIu
         b2W1wcqAkY2b/UaovPWbTVgHmb+5i9weZHo8w22uJlLz6dSHHAKoVw3QAJDit5P7rBY0
         HtqxXHMBEW3lmT9r0pfPq8prNaQOx7SwrJB0A3/0m1TsTsbE5tBokDDDJlZFCou6E2U/
         9TYpbYMael29nykUDcHut3zU0j3MgS1vDgfcg0/lEZ3g6Q0XkiCsgZ1sulzUL4sWUYnY
         8MMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa8j7G5oLK7iesIGO8YHjoPtnsPFEFZMQCVx7bDdjWxwhV0JfQCcI+au+H3XCwKXSBT7k2Kkqpmh9t7r03bR93w68RQ7eXfHA7t/k=
X-Gm-Message-State: AOJu0Yx/dLD/KAh6orvQthXvfiVz7ieT32WBHeDy8gCFr/XMGLgSwaZf
	3QucugQQR594VVztVA17cgvSpSnv8xrdJetkKOsSR5HjgOLjS6DqO1UfcbZZyg==
X-Google-Smtp-Source: 
 AGHT+IGi6VVf6G6G8U5GGlsAZixQm5utU4tQarB9++MQ9JBSEGLE5FtrB605cWFIAkOkehjJn7O4vg==
X-Received: by 2002:a05:6e02:dd3:b0:363:9eb7:46ce with SMTP id
 l19-20020a056e020dd300b003639eb746cemr1293877ilj.11.1707870180370;
        Tue, 13 Feb 2024 16:23:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJKMkm18l+fATv5w8BOBEKdFq5seFQbl5h8/yelfPushV4gdBWN7jKSCWpz1BhL0Sti/1SuJTgYJ/fcVNH6XkrSm0NoaHSTSiI/fHwLilNsRJJtzimpBrGCTjtT9d3s2Ax3XegIe224IxqH7rcEwDA/kG7pamQItEMG58Jw4j5Ztxy29vglNeTsEkMdK0qDj8iMdP55M3/SCtxrS7QqjBNmHKuqoD07nm1SOMqL4/+aRObxOrky5V8t79knGogtBK/fly+mKEsz6LWFLZ/wRwleXiVozK6opOE16Q1C7tq1q89SonCNFWA89DU4D2TqFFavCW50sbPG+21GohBloHyGfw0ifOY2bFFrKJpEW3nXIMdIk7lVG+8R/xWdpNr5QXw1S7YliqMm+3mZOK0/P1E6lS9JjXddM/7Krxk56meFswS3dbQgAEWldQtjWJza6FMFw9c/mH20D+fWerx4TZ/afCihkwC1TzV+rBBmcZJRaKcldG2sFu38nMuPrF6aGgtI8dpeqPq8y0bVNRQfBUdTcdcWkCYI2pY3Cm0qX1G3/4M+87FoJzMfaTmNQydVUReHzA5OP8dyUn5MgQ=
Received: from google.com (20.10.132.34.bc.googleusercontent.com.
 [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a056e021a0b00b00363a91effdbsm2807134ild.76.2024.02.13.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:22:59 -0800 (PST)
Date: Wed, 14 Feb 2024 00:22:57 +0000
From: Justin Stitt <justinstitt@google.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] ASoC: meson: aiu: fix function pointer type
 mismatch
Message-ID: <20240214002257.bfp6wk5j3wsaq6f6@google.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
 <20240213215807.3326688-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213215807.3326688-2-jbrunet@baylibre.com>
Message-ID-Hash: RGLEUDEOKVT7I4ILMVNMHSDT5MW4XMLD
X-Message-ID-Hash: RGLEUDEOKVT7I4ILMVNMHSDT5MW4XMLD
X-MailFrom: justinstitt@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGLEUDEOKVT7I4ILMVNMHSDT5MW4XMLD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, Feb 13, 2024 at 10:58:03PM +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   243 |                                        (void(*)(void *))clk_disable_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Silences the warning and makes the code more readable without adding any
new helpers. Awesome!

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/meson/aiu.c | 19 ++++---------------
>  sound/soc/meson/aiu.h |  1 -
>  2 files changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..5d1419ed7a62 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -212,11 +212,12 @@ static const char * const aiu_spdif_ids[] = {
>  static int aiu_clk_get(struct device *dev)
>  {
>  	struct aiu *aiu = dev_get_drvdata(dev);
> +	struct clk *pclk;
>  	int ret;
>
> -	aiu->pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(aiu->pclk))
> -		return dev_err_probe(dev, PTR_ERR(aiu->pclk), "Can't get the aiu pclk\n");
> +	pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return dev_err_probe(dev, PTR_ERR(pclk), "Can't get the aiu pclk\n");
>
>  	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
>  	if (IS_ERR(aiu->spdif_mclk))
> @@ -233,18 +234,6 @@ static int aiu_clk_get(struct device *dev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
>
> -	ret = clk_prepare_enable(aiu->pclk);
> -	if (ret) {
> -		dev_err(dev, "peripheral clock enable failed\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> -	if (ret)
> -		dev_err(dev, "failed to add reset action on pclk");
> -
>  	return ret;
>  }
>
> diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
> index 393b6c2307e4..0f94c8bf6081 100644
> --- a/sound/soc/meson/aiu.h
> +++ b/sound/soc/meson/aiu.h
> @@ -33,7 +33,6 @@ struct aiu_platform_data {
>  };
>
>  struct aiu {
> -	struct clk *pclk;
>  	struct clk *spdif_mclk;
>  	struct aiu_interface i2s;
>  	struct aiu_interface spdif;
> --
> 2.43.0
>
Thanks
Justin
