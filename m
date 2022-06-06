Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9F53DF99
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 04:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 799371A45;
	Mon,  6 Jun 2022 04:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 799371A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654481191;
	bh=xYcr/9rlGUYd5n5IUwd+f2HGXa5L8vXqjzOtoVkxxgI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jgwgfw8DYEDrffuUfcUEsaSaFioOv2zM3FEw5oarTango/9a5kWxJbmxDIZ4LrFWZ
	 +BwzvHoFeYTwZdMiJs5uTh7PN1XaMuK7uHJ0urXEHIMFi2vBVWUX4PLoljg/OBaJIJ
	 ZnMNbIE1821RdTmztX8BKzMkNHUQo9BXj6vLdgg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD234F80109;
	Mon,  6 Jun 2022 04:05:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FB95F801D8; Mon,  6 Jun 2022 04:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90CE9F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 04:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90CE9F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a+vuSOi6"
Received: by mail-lf1-x132.google.com with SMTP id a15so21144445lfb.9
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 19:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=usJf20AAKPNtkFpO9IZiGVXBDrUnP/ALbP63KHhfdLQ=;
 b=a+vuSOi68MhI1PKcYt3CMKt9Uf57841GUcl9gCLFK4tfHAJN48nnCmiwniiVs9BuRd
 yVZLjQ2Kr/LDR1XsRn/V22KGLrjUEHH+ZzYFAg/O8jSBgnHWPPFak/0ZzhGp6h8a14x3
 2HV9wB1P5QXJi9QpbM6nc4o9wKsQc+NUvZSdGTSsYleyR2MdLV/vcPErSZC9yXqqZ01v
 xVBKscWN7yNui6uyk4VDE1KLEOt3PZUkjDphq1o4N5ZDjk3eetObHHVfXgJF3IAEapY7
 QElmOyA0NIFyWqHrxSklUCgxVvhL2tGqDDU6+oGP7ACSFDt6zgNt3fq1XBNo0ZHKkWo4
 Zhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=usJf20AAKPNtkFpO9IZiGVXBDrUnP/ALbP63KHhfdLQ=;
 b=oxecQNB8yKaWq4yf7se+FHSs/qvFh6rSphX9IHvfLsV5TnPrSM1H0i4VO+cFlgm97U
 y+vP4bDHfjP/nm2gtfzC5YWuE8OYQKrcMO+ISrnHI82zNtrjZ1aY5ly3duR/h9Ldf1+d
 Jw6zv7OqnZZBu5oY0Zv0xQyMaQDzrbDg0AuuPqulaUq6MkBEbbOvKxXOcfkpF0jsuIzN
 Le6pDcrJXvdjPW2ze3hRXXnp716YlpiGasTcBfmEZZ0q03FAnB7BkxJ4swaZOlggWoRA
 Q+R+HhldUquRE6G8XgKnRApFD4JeEtgBPnVmA2mSUnmZXdXYP7CbAPJ0uoed1S+JiASc
 /Hnw==
X-Gm-Message-State: AOAM531Qvr/0T/stjvNGpwUFLRPZGwcC6RynVvn5ttvf+ffpY5ukoFPM
 rVNp5bKB5dyP0Ulul8Q1MCbMjv9TRWmtyBtJtC4=
X-Google-Smtp-Source: ABdhPJwBmXnUl2NGPk5lZ8R0xen/iXYV2x5d7WrIVpi6p25LtCkBtFqrb5Op3lqB6XE56tNT16CkC2WEnU654rAl2JY=
X-Received: by 2002:a19:6445:0:b0:479:141c:cb5b with SMTP id
 b5-20020a196445000000b00479141ccb5bmr11724447lfj.280.1654481121323; Sun, 05
 Jun 2022 19:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220602071448.277968-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220602071448.277968-1-chi.minghao@zte.com.cn>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 10:05:10 +0800
Message-ID: <CAA+D8ANagLtpLHP7PpqoSEHkNkCg+Xq-j1QNzoL2SWw1ko_r5g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: remove unnecessary check of
 clk_disable_unprepare
To: cgel.zte@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Zeal Robot <zealci@zte.com.cn>, Liam Girdwood <lgirdwood@gmail.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Thu, Jun 2, 2022 at 3:14 PM <cgel.zte@gmail.com> wrote:

> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Because clk_disable_unprepare already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  sound/soc/fsl/imx-audmux.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index dfa05d40b276..f434fa7decc1 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -71,8 +71,7 @@ static ssize_t audmux_read_file(struct file *file, char
> __user *user_buf,
>         ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
>         pdcr = readl(audmux_base + IMX_AUDMUX_V2_PDCR(port));
>
> -       if (audmux_clk)
> -               clk_disable_unprepare(audmux_clk);
> +       clk_disable_unprepare(audmux_clk);
>

I think the check of audmux_clk before "clk_prepare_enable"  also
can be removed?



>         buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
>         if (!buf)
> @@ -218,8 +217,7 @@ int imx_audmux_v2_configure_port(unsigned int port,
> unsigned int ptcr,
>         writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(port));
>         writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(port));
>
> -       if (audmux_clk)
> -               clk_disable_unprepare(audmux_clk);
> +       clk_disable_unprepare(audmux_clk);
>

ditto

best regards
wang shengjiu

>
>         return 0;
>  }
> --
> 2.25.1
>
>
>
