Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8C3AFAFD
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 04:17:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3311685;
	Tue, 22 Jun 2021 04:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3311685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624328247;
	bh=F2edfi4s3f9niJ74V5k0A8ikA/QKdSL+1dsNla29MbY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOPS1+IxCcBXZU9lyqS1qMLIdUhUZTVefcRoWBJVq75S/Ccy+BzLwe9hmRbt3aBal
	 hSEFU4paKqNzUOl8QJEeCP4OR0rlZnVqq/bJKKqjbkCw3ADNy73bhnqpDEM4ZsM0Fd
	 T18OyIhgsfZH6caKdgqTqeife8qBA+HhaIdJgbNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F53F8026A;
	Tue, 22 Jun 2021 04:15:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF79F80268; Tue, 22 Jun 2021 04:15:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A9DFF80137
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 04:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9DFF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tu17vS/f"
Received: by mail-lf1-x12e.google.com with SMTP id p7so33207231lfg.4
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 19:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GpzA+s8lvFsctseOT+5uPm2562t7LAgE0eEfnLZ9Pnk=;
 b=tu17vS/fM+jlMjiPABq2Ut09SAl1FccrJO20rnttQ86LkZwVvGSLjgGo8vxGraZB+v
 kcutcVyqy70RxIUm+t7V9u0WCu+u4UCChFwziU/vtJb1tgoogLW9puWtsEu1V4WE1FNU
 pxDnM6H40WkKN3Njroyh9l5FIe73uWL5VgMpjgHhGrS0+rCibtx8js7T39nxX/ceZbMT
 EFhCT8yG+uOKWPMbwxwQnOo1CpZxS7ZdV9XuZH1Zr9vfwHUVFqIzaILq9wWcPw23WUHt
 iFjiwhWNw9uQ9/HsH1yNmM9Fk2mEMytMkJ3R46w2DEBKYQfk7sKd9Vrkxi8lUhJI+1um
 mQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GpzA+s8lvFsctseOT+5uPm2562t7LAgE0eEfnLZ9Pnk=;
 b=kcF9ydjQ+TXSEvM/5SofNR7+rq+CuzTIPVEzK7DhcnM1yrYlL7LG7LHFcrj5S5SKOj
 Ovr+5kFLXcVo6LJ23irgSxeVL52Ep+I077MLkL1xue7ntHVKEYvnNyrN/dPTnBet1sFG
 FNlW37wNGG0IFd6+o0tJt0ToP/nJZMRGAPDy5CU565/D8nq1qPwUNLPJfkF9eSFSh3Jq
 8atrfFDkb3yjJX9bIsxJe4Fyz6kyfzQfvPDLCtX4kxSN2XgSXoLrFzVxK9tBbPHltGye
 YpSmUDgivE7yorxYmvW9Jqs+nwS1tRCfiUCLQulCgWVm0yi0gZZ2FWHdnG7awgdBYkgR
 l0PQ==
X-Gm-Message-State: AOAM531yAxyJ66FWu92Cg0EHA5cEcnvGNu5ZWIO/iWiDq/KAtW1F0deI
 GrcRakSAJVc6vecnIN53igVg5XjxmEHsdgdG4zs=
X-Google-Smtp-Source: ABdhPJySHFadxRfxD2SOtm1zWGyqRaIAuj8te+5MBb7/YjkBkJfWXviGXjXRVJYQppsXBO3rNOBU78QAAUAO4vVNiMw=
X-Received: by 2002:a05:6512:3b24:: with SMTP id
 f36mr927384lfv.443.1624328148749; 
 Mon, 21 Jun 2021 19:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Jun 2021 23:15:37 -0300
Message-ID: <CAOMZO5A1+HUmUVhYv4en4Vgw93AoS62UwQx1GwC9i4XiG5QZvw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer
 probe
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

Hi Shengjiu,

On Wed, Jun 2, 2021 at 3:59 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Don't need to print error message for defer probe
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 4f55b316cf0f..b40ba910ae9d 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -709,7 +709,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>         of_node_put(framemaster);
>
>         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> -               dev_err(&pdev->dev, "failed to find codec device\n");
> +               dev_dbg(&pdev->dev, "failed to find codec device\n");
>                 ret = -EPROBE_DEFER;

This looks good:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

My previous suggestion of using dev_err_probe() would make the message
never to be printed.

Thanks
