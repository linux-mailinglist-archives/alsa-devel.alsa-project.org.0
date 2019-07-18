Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6456CE13
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 14:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B60DA1681;
	Thu, 18 Jul 2019 14:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B60DA1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563452997;
	bh=DZkzWnD9gOxzdVsX47c0jSJGwjBNB5Ah9PXbxF+Slxo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IASfeyi/jFFKfm5wbyAZOS9RhRTdVzJOqs6BOxW9S7acXNe+88CHNLO63LYm09BnZ
	 W5egWdUj8+bjaZaFCSOC+vlbxb/MjXpRlxIgecATyjHfy2iZnqqX8HGJX1fwWvQ+yZ
	 9W3ZOYkiwS6eo332ApSsg0ufMFhSQmkIbkyQ4y2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7ECFF800D2;
	Thu, 18 Jul 2019 14:28:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36EFAF80362; Thu, 18 Jul 2019 14:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C002F800D2
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 14:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C002F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G749d2nH"
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CFAB2173E
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563443940;
 bh=AWjdnSfyXbQ/4ZXvUB6IC11P/UFPFsul4lB9tUBMa/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G749d2nHL0eyNgXbOJZvCxu88hdaoi9fxeQDQwWcwRDzp0d0XjTp5eQtv0JP+5XFt
 zQYk7oqffriCSa6CxyffjdO1eTIQ5aIcEkHsY863OMacdmcoOVnB9Mnz8YTq+MbJVS
 ZHvcUn2zHCkjCLVyrl6j6UJ1AvtBkGR80Gbwe7oU=
Received: by mail-lj1-f173.google.com with SMTP id v18so26661532ljh.6
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 02:59:00 -0700 (PDT)
X-Gm-Message-State: APjAAAXmNDsDZE6lgSmLf8H/xrxn26sbt4frQGwjhhCiFo1IHknxTXMD
 ZjXFCrBrzFpCaXygWfjXwOCxQczKJ98OPNGLWGw=
X-Google-Smtp-Source: APXvYqwyiTc2BJqJc/k+YP8sLFe69tVubWrxtf8iAhRiiRjrQvRJaDmNfKv+t71cpGoUpQn2Kl5xR/RzgOxrua6Qu8o=
X-Received: by 2002:a2e:8155:: with SMTP id t21mr23579565ljg.80.1563443938929; 
 Thu, 18 Jul 2019 02:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <c4c10934-f06f-24a8-1162-b023e4ab4066@web.de>
In-Reply-To: <c4c10934-f06f-24a8-1162-b023e4ab4066@web.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 18 Jul 2019 11:58:47 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdRY+HaAKEj+jugJpE6kFYpkRacoCoKnMFjFL0t-EuMcg@mail.gmail.com>
Message-ID: <CAJKOXPdRY+HaAKEj+jugJpE6kFYpkRacoCoKnMFjFL0t-EuMcg@mail.gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: odroid: Use common code in
	odroid_audio_probe()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 18 Jul 2019 at 11:57, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 18 Jul 2019 11:42:29 +0200
>
> Replace a function call and a return statement by a goto statement so that
> a bit of common code will be reused at the end of this function.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  sound/soc/samsung/odroid.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
> index f0f5fa9c27d3..d152ef8dfea3 100644
> --- a/sound/soc/samsung/odroid.c
> +++ b/sound/soc/samsung/odroid.c
> @@ -316,8 +316,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
>         }
>
>         of_node_put(cpu_dai);
> -       of_node_put(codec);
> -       return 0;
> +       goto err_put_node;

No, it does not look good. It makes the code and flow more difficult to follow.

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
