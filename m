Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37054E8757
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 13:11:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5256E201;
	Sun, 27 Mar 2022 13:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5256E201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648379498;
	bh=Pn3NBqVJXcMgz3j9FxijJCMs5aDunlwf9Doddep0VIA=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PpY1sI6crt/pfgaZoLhdpxWlr5/MAiHX2RkVjxSoyHQoQDFIKOAFISa4QTV97S2fY
	 YQTNb8FzaMVD36WHAHsm96s3ZVJgqVk74mGLW5YoDJTfoCyHQ2sfSEFgmwtjWlQrPk
	 9dLcW+INRZyWLw+ew19fXWNlj/kjx5rI9xBJaJlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3A98F80121;
	Sun, 27 Mar 2022 13:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C52F80161; Sun, 27 Mar 2022 13:10:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 441E7F800B6
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 13:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 441E7F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="n+TM4caO"
Received: by mail-wm1-x32e.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so6916048wme.0
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=+BzHZSvsn/H69wlmb/H6rNB8e3j/o17VqP5fAwR3vQU=;
 b=n+TM4caOAp7aEq8To+f6jO0BS7LMe0+DMBVCErD3nIzBkOALI2ZJlInZiWkvYKLyqB
 H+4F7iYjKqYaLj/OPPzW9gq+l/M9Z0u6a8WTTf6LH/6M+0VXHjVNWfLpj5h9WLbTDly9
 PJkw2fhaZ+69LqpOJ+zOCsrcktLX2QSq48Td+AlXqCzNCKa9dO0WK70MfS6fKUQC9Wtk
 +fFh+kf/2aZXUIKt7Qtoq42+r5NKVrbBQryKeKWeDT12xPt7ASgtSsTKwm8D0eA3DWUo
 8Zs14hKV4x0VtL+2deVPC7sbA3/beiz2cDtnHAf4stM2aEO3tYUFOqpZX9yriEm4A7M+
 Mq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=+BzHZSvsn/H69wlmb/H6rNB8e3j/o17VqP5fAwR3vQU=;
 b=AMIc3l1EfoQ1C+i0K3nln8vDgu5cSVOHGdfqDKMSgyOpuaUrPJ1TodK3YeC7ZXDEbn
 hfNQH9Z2KJnqnlZhmwYltckApnI2hWOWm04AaULVTOpCwSlb8wNDe0nPJrsXgbPNMH6p
 zFVfu8xcRuZI4uyRQq4Hd5C3PUmV/mLb+fPXC/kXs5jkcRwlQ2su3odpwtr0ATTQINxv
 I8Jf62RA6+tjzZv3lL323hkyzd6/ia9eC2Nk3W+/XsRjHn1rcvm/WTW6ika1+FeJBc42
 HNC7K27hM8ZQggpFye7wdu6B75X8s3ddUiE7/WiYgwkI/fSij1zSerQTcj6rap5OaE9D
 GVwg==
X-Gm-Message-State: AOAM531yzpQY6PfxBYXfp/yh36I2qAkbEr3NBcvQ1BI3c/G/mtjtj5Wm
 E0IQt0OzqxSKqnX7le3cEr6ywA==
X-Google-Smtp-Source: ABdhPJzw8TxaeNM+RLDCb4Y1lZLHWqMHpKjAx9JRCVm8lX0y2gwyKrD4U6GXSV5yvfD0ii3RXeXiXw==
X-Received: by 2002:a05:600c:1c8e:b0:38c:a386:26aa with SMTP id
 k14-20020a05600c1c8e00b0038ca38626aamr19308151wms.204.1648379425745; 
 Sun, 27 Mar 2022 04:10:25 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm9577806wrv.79.2022.03.27.04.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 04:10:24 -0700 (PDT)
References: <20220327081850.13456-1-xiam0nd.tong@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 narmstrong@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH] soc: meson: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 13:03:14 +0200
In-reply-to: <20220327081850.13456-1-xiam0nd.tong@gmail.com>
Message-ID: <1jk0cf6480.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, martin.blumenstingl@googlemail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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


On Sun 27 Mar 2022 at 16:18, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:

> The bug is here:
> 	*dai_name = dai->driver->name;
>
> For for_each_component_dais(), just like list_for_each_entry,
> the list iterator 'runtime' will point to a bogus position
> containing HEAD if the list is empty or no element is found.
> This case must be checked before any use of the iterator,
> otherwise it will lead to a invalid memory access.
>
> To fix the bug, just move the assignment into loop and return
> 0 when element is found, otherwise return -EINVAL;

Except we already checked that the id is valid and know an element will
be be found once we enter the loop. No bug here and this patch does not
seem necessary to me.

>
> Cc: stable@vger.kernel.org
> Fixes: 6ae9ca9ce986b ("ASoC: meson: aiu: add i2s and spdif support")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  sound/soc/meson/aiu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index d299a70db7e5..b52915c6f53b 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -61,14 +61,14 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
>  		return -EINVAL;
>  
>  	for_each_component_dais(component, dai) {
> -		if (id == 0)
> -			break;
> +		if (id == 0) {
> +			*dai_name = dai->driver->name;
> +			return 0;
> +		}
>  		id--;
>  	}
>  
> -	*dai_name = dai->driver->name;
> -
> -	return 0;
> +	return -EINVAL;
>  }
>  
>  static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,

