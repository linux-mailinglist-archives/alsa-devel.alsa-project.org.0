Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A233D5B5DF4
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 18:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25CA784D;
	Mon, 12 Sep 2022 18:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25CA784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662999352;
	bh=EuK07BmdCUlhjcxcrFA/6aIkq9fFEyc61+G65mXLW9g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IuKzGOY92CO889QuN2bcLlqPYh34F96XN3qh3SVhkafjnVK85rt18qSvaqj2XiRbf
	 Z3x7/QSpAZDK4qZM/+DEJUoh0Gmv4X74ZFR72ory+/yTTVcbnvC9vYC8zPHYS2gMnF
	 EzTV109T7XD+1vkcMXTzdZORtC0CiEkcAwZwN9yU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8824BF800FE;
	Mon, 12 Sep 2022 18:14:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 647B8F800FE; Mon, 12 Sep 2022 18:14:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2679F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 18:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2679F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WjrnQt4b"
Received: by mail-wm1-x32b.google.com with SMTP id
 v185-20020a1cacc2000000b003b42e4f278cso8311311wme.5
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=p2UuUVGgNeM7cWoN9co4RiFexO2JQRrTt6fDZRT2l6Q=;
 b=WjrnQt4bUeUHZEbDpxtLxWOhdOwi5lTqQ099s2SU4zwqBVZeCaJ99AWi+Lje4bC1nB
 O3tzwj3cB/y8uJIrxyAMmpAZZiZE1oAoe+CmU6tvH6uuu7kRH4qjFLTPX3X+w5dUwOFX
 o8co/TSCDVVOqEY+F9a2elNlGE789+JRJGg/2swqnsMphCm5dTxSs6un8KvwqrN4el9C
 w0tyhgDMmpoZdlDcn3+rt2sQ0+UJNLN3YSXLC/LCoofMNzJoj+5eLDxrmnRvgtE8+/mt
 XEj06YGEsdvvuzfqdQzL+utyOMeqWfZy+0ykcJCPkT0Rne+IksX8EnxcGIR/uJ517dRo
 zh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=p2UuUVGgNeM7cWoN9co4RiFexO2JQRrTt6fDZRT2l6Q=;
 b=vKpnuljZ2/qd51REn9VWMDJTxa6/+NqDi+czSWmj87sWkK7Mp6KMSuPQRBx1bOvWnq
 AxUXsHWIhTzi+X3aUy+KGIARFJvK7niJynP3B6qDQkZNL/+449lePJrsUt0mpRpkMJJJ
 7kud0EtwZzDOfb4BYbpRRDgEUO3mhHeKux8vbth5QZOCkld6rlM1h+UgM8Cri3zPnU8a
 3E4xjJ6frnOFOgqTh5mxpXsBhJdfEHscmV/a4tKjgur0+NOiwCsBTGbM5XLXua1Zn/w6
 c9FKQZwpvSHFgdIaOyh65uVXALA6sgRjQ5efv1HywbeGu5ET0YM1qKFTWgawBTiN7gM/
 W5Yg==
X-Gm-Message-State: ACgBeo1xiXW7tSjslORzfOu/zAncp56c2CabRm540jQm6VZOa6USfxhu
 YjeoxJIagahKv8cXapy5vmE=
X-Google-Smtp-Source: AA6agR6TxM9HREIppAFy4INv7lrvGZZIc1xY0Z0z6Wz7xBGrYJrUQHdC7xeeaLg8OPCnLJ3WpI/YYw==
X-Received: by 2002:a05:600c:1c1f:b0:3b4:8330:5a46 with SMTP id
 j31-20020a05600c1c1f00b003b483305a46mr5102190wms.45.1662999285997; 
 Mon, 12 Sep 2022 09:14:45 -0700 (PDT)
Received: from jernej-laptop.localnet ([89.101.193.71])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00228aea99efcsm7717117wru.14.2022.09.12.09.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 09:14:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: sun4i-codec: silence misleading error in
 probe
Date: Mon, 12 Sep 2022 18:14:44 +0200
Message-ID: <5600291.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20220911145713.55199-1-mike.rudenko@gmail.com>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Mikhail Rudenko <mike.rudenko@gmail.com>
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

Dne nedelja, 11. september 2022 ob 16:57:11 CEST je Mikhail Rudenko 
napisal(a):
> In the case when a codec device is probed before codec analog
> controls, snd_soc_register_card() returns -EPROBE_DEFER, resulting in
> a misleading error message
> 
>     sun4i-codec 1c22c00.codec: Failed to register our card
> 
> even if the device is probed successfully later. Use dev_err_probe()
> to demote the above error to a debug message.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-codec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 60712f24ade5..01b461c64d68 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1825,7 +1825,7 @@ static int sun4i_codec_probe(struct platform_device
> *pdev)
> 
>  	ret = snd_soc_register_card(card);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Failed to register our card\n");
> +		dev_err_probe(&pdev->dev, ret, "Failed to register our 
card\n");
>  		goto err_assert_reset;
>  	}




