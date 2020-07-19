Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A81224EC8
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 04:54:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98CFE1665;
	Sun, 19 Jul 2020 04:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98CFE1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595127292;
	bh=XNN6JOaS0jMzIy0CIn7nscNAGMP9b9wU+IDPksqWs58=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fd5CDhMG+4QXeLgrpF8sEFkxzjRSyOeq7GtR4oyRed1NvpezXeubabJzmbuRUZ06p
	 OyOvUvtSkVWBJRO33Ri6zNaofXB2rzsNcn6+QbnjTNPBBw+OmqaCeN1Rzv4WAREics
	 11J7NmuWF+FZEJ8yIpXs8LyW8ryhBGftaOlMIZww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C52CF800BF;
	Sun, 19 Jul 2020 04:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26092F8014C; Sun, 19 Jul 2020 04:53:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C324EF800BF
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 04:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C324EF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JrH+loPf"
Received: by mail-wr1-x442.google.com with SMTP id f18so14699444wrs.0
 for <alsa-devel@alsa-project.org>; Sat, 18 Jul 2020 19:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=O5W9bBIaSXw0wY6EC2n0SEJT3neXg6OZEcQ6GpBeLoY=;
 b=JrH+loPfN5OfjBmTfNUtN2dbhNK0VTgsAsyNTnF0JOcCVTjZIkUlcHt9+YEFEk96rA
 a2RCCG7noTwp/tHqYXtq6LbtCHWKeis+xFPpkeWQ1N4oudScxMTbopBm0X0XO1gcqPoB
 HaLlJO7m7ZnQeTVCek6mqX404tQSIO1GktFoBhDybvaLqBL0HmB1TkBMwWlco8YbvpWY
 Jeq4D9VUUYjvTcCxfYZjMVTf1/DPMafre2Z+YeUhR+d+6NgNw5FXrxgMJ4KsXwwT5kj4
 4tuVFQJ73BaUZa1uy0aX+tKcG8iQmZqzFzvKLVXwbu6qQJ4YcECY56kgTeI4xPfVVH+b
 Oh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=O5W9bBIaSXw0wY6EC2n0SEJT3neXg6OZEcQ6GpBeLoY=;
 b=WoQF7pt+Rqf7hoQx5hWb6QEQZAN2J1mx6jtCSvoz1DTMoT+PpMsTPoq9FE9/c4V7NF
 Og+mpfRHvphJ7WnMgOXaDrxiEWITia6s3mAf1wdegQzOly7Pg1efe0aCQonDnXOR0vCl
 bfZwATbx+Jxj4jxHwSDY0AiKUP+WLhiOZRq3Tx25rRv+ddrgAih7kItC8ic4uVpQmhCI
 VWBFYUJGj7KWDX2CO59JCeT+YTmrgTGKrW3qO2g1Q118L4B6xuBte8NtbnVYEAlaikUE
 +dcv/P/lweqsVx/8IqJcX3G6VfBvWUvf9UmIp+TwD5z2+f/72mfhhmXG5JHPdt7xsHUu
 +NMg==
X-Gm-Message-State: AOAM531l95OGPCmOWe3XnZWX4byh6ELObxVdW3wwdtIKmSK8qv5VOa8I
 DlTXHRwUklYp88Txg35rSB6maGSXQr5GPAb5UtI=
X-Google-Smtp-Source: ABdhPJzVnVzX1NZLH+r/GPPA38l3J7Xp5tSHja15vP4JUQbSnu3rEeoCEgnYy6SHo1q2jhN5ovtnfX1XLfmxROfLNjc=
X-Received: by 2002:adf:f60a:: with SMTP id t10mr17378393wrp.64.1595127179650; 
 Sat, 18 Jul 2020 19:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_2D17145034BA02B43C169473C02C4257AF06@qq.com>
In-Reply-To: <tencent_2D17145034BA02B43C169473C02C4257AF06@qq.com>
From: mnlife qiao <mnlife.qiao@gmail.com>
Date: Sun, 19 Jul 2020 10:52:48 +0800
Message-ID: <CAGjHXR3kE00vcr04YOp1BYEHEzO-Ppdzs8qnF7_f06rNG1uxaA@mail.gmail.com>
Subject: [PATCH] ASoC: soc-jack: calling snd_soc_jack_report causes a null
 pointer access
To: lgirdwood@gmail.com, Jaroslav Kysela <perex@perex.cz>, 
 open list <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org, 
 mnlife <mnlife@foxmail.com>, mnlife qiao <mnlife.qiao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

> From: mnlife <mnlife@foxmail.com>
>
> When snd_soc_card_jack_new is not called or the call fails,
> calling this function causes a null pointer access
>
> Signed-off-by: mnlife <mnlife@foxmail.com>
> ---
>  sound/soc/soc-jack.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
> index 0f1820f36b4d..51b799ee98b7 100644
> --- a/sound/soc/soc-jack.c
> +++ b/sound/soc/soc-jack.c
> @@ -44,7 +44,7 @@ void snd_soc_jack_report(struct snd_soc_jack *jack, int status, int mask)
>         unsigned int sync = 0;
>         int enable;
>
> -       if (!jack)
> +       if (!jack || !jack->jack)
>                 return;
>         trace_snd_soc_jack_report(jack, mask, status);
>
> --
> 2.17.1
>
>
