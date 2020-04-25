Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3811B8444
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Apr 2020 09:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB1C16BD;
	Sat, 25 Apr 2020 09:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB1C16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587801088;
	bh=1EHhPPd3iIPReiJXAvOqO0cJMRED+G8aGJEpp0GqnQg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyCtRDamMheZ1jNmRuHnv31ML0LB6rz2dx7K89IMQSV+pf/PQNL/rSj73RjISdUJL
	 vbXifqssKP/FW6niSvRP12rLwIsnTLD35N/i5ZrK1cjSk5fNwFKfgAlF+E6SI2RCUW
	 ej2Wno071UIUP9jRQLqJvZVoWgjqdhx5xFfJLzM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A972BF801ED;
	Sat, 25 Apr 2020 09:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F8AF801EC; Sat, 25 Apr 2020 09:49:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 121A6F80105
 for <alsa-devel@alsa-project.org>; Sat, 25 Apr 2020 09:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121A6F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CnG+O4+o"
Received: by mail-qv1-xf43.google.com with SMTP id v38so5886112qvf.6
 for <alsa-devel@alsa-project.org>; Sat, 25 Apr 2020 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BgbYCAeNQS+0nZ7Fig9vtQKe5K6A7aPPzIrm8C7qsUo=;
 b=CnG+O4+oOV8iNbmiQlvDFqsA7UGQFM7lwHR/uXwOIq6fSWfg2UihtiYQvVvwKZGx80
 Oo7g3L9ILVnmm5FwSeZY3gPrXkK0x0hKBv0KvYXigh7O7th8Xndn4PWCvbqj0KVonEwu
 7ZR6VvHhK8Y0iZpK4n8s/J/ZkqUk9y3WHmiAHGQpaiSYPo+UKeZbyMN5qIo0bCEXZHMH
 zlHBWaEJeARsiEeEZghohFYg80MeDVwSj2BFoUU3kWX1HB0hp7A4BRvjYthgzHQDjg4r
 drAS+b42bIPzFf97etG2yohqn/G9A+6z2EEISXi97Uk1SdMhllxp+siZqfwVq31dXTQ4
 rStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BgbYCAeNQS+0nZ7Fig9vtQKe5K6A7aPPzIrm8C7qsUo=;
 b=CKjqGzjMFIdv5h89XdPdpOVskgw8XCuJyGapgNY/1vWET0/QypUUbUgDXbtSHHzOZc
 ivZPBfNeyKQlgoOJd/5pD4fCGGNDBP/X8UZ0XZa/8MuiEEICJkDJNPb4XecszLHs76s1
 4OMqoIYxXJ0omKtZDl7Q3i6NVQND6ZFvjICRNvJKG9W3yAM1LtdDtWGFwLH/ScIGV3pR
 dv1y0IcOoQX7CjYjQ0JjcAw+mgf133n+rKSJHL9AA/jOLPWaZVbw0sQipAoG1bAhgz8N
 JPp6kl2u8tAORjeqmVr78l6M4wJumQNU9wWvNuWpc9PVpyzO/skisWpD5MyCRzYdZxiu
 m3lw==
X-Gm-Message-State: AGi0PuZn8Jf9VayyNmgq4YB4Sd6TAAwuLJ5weHT56HM5QiTpqDwsfmmp
 FFUqiwBJKM/sJIZOg3+CGK+PFdxCJOIMdSqCl8I=
X-Google-Smtp-Source: APiQypIZ9cAxzqkKEzDmAZGMWki+YHf3qfiPJ4v1ZBfa7GRLio9jmFZpssBeF/e7X4lg8j6LVxO9uU8x48sUYrDjy4s=
X-Received: by 2002:a0c:a9c2:: with SMTP id c2mr12947457qvb.23.1587800967701; 
 Sat, 25 Apr 2020 00:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <d23c939f1c9eeb3fce34b6c34d44e2d6156f663a.1587799355.git.shengjiu.wang@nxp.com>
In-Reply-To: <d23c939f1c9eeb3fce34b6c34d44e2d6156f663a.1587799355.git.shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 25 Apr 2020 15:49:16 +0800
Message-ID: <CAA+D8APuhgO0DF74GtCcR1AXTU0ZRR+Njupr0VP4o5jNgTQ3ew@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_easrc: Check for null pointer before
 dereferencing "ctx" in fsl_easrc_hw_free()
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Sat, Apr 25, 2020 at 3:30 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote=
:
>
> The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
> drivers" from Apr 16, 2020, leads to the following Smatch complaint:
>
> sound/soc/fsl/fsl_easrc.c:1529 fsl_easrc_hw_free()
> warn: variable dereferenced before check 'ctx' (see line 1527)
>
> sound/soc/fsl/fsl_easrc.c
>   1526          struct fsl_asrc_pair *ctx =3D runtime->private_data;
>   1527          struct fsl_easrc_ctx_priv *ctx_priv =3D ctx->private;
>                                                       ^^^^^
> Dereference
>
>   1528
>   1529          if (ctx && (ctx_priv->ctx_streams & BIT(substream->stream=
))) {
>                     ^^^
> This check is too late, to prevent a NULL dereference.
>
>   1530                  ctx_priv->ctx_streams &=3D ~BIT(substream->stream=
);
>   1531                  fsl_easrc_release_context(ctx);
>
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Sorry=EF=BC=8CI forgot the changes:
changes in v2:
- refine the commit subject.

best regards
Wang shengjiu

>  sound/soc/fsl/fsl_easrc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index 97658e1f4989..20326bffab64 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1524,9 +1524,14 @@ static int fsl_easrc_hw_free(struct snd_pcm_substr=
eam *substream,
>  {
>         struct snd_pcm_runtime *runtime =3D substream->runtime;
>         struct fsl_asrc_pair *ctx =3D runtime->private_data;
> -       struct fsl_easrc_ctx_priv *ctx_priv =3D ctx->private;
> +       struct fsl_easrc_ctx_priv *ctx_priv;
>
> -       if (ctx && (ctx_priv->ctx_streams & BIT(substream->stream))) {
> +       if (!ctx)
> +               return -EINVAL;
> +
> +       ctx_priv =3D ctx->private;
> +
> +       if (ctx_priv->ctx_streams & BIT(substream->stream)) {
>                 ctx_priv->ctx_streams &=3D ~BIT(substream->stream);
>                 fsl_easrc_release_context(ctx);
>         }
> --
> 2.21.0
>
