Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA984F7212
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 04:29:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD2D172F;
	Thu,  7 Apr 2022 04:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD2D172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649298589;
	bh=N54g/Y0qfE/JzXaZflSaHD/SnyNAEjaSeGXxAP+yLeA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=micdbJBxmEeDTnIQVMBcCEl7CCwvy6wjaXl6qaXk+bP4MBp7UW1WA10jWblf46oBV
	 CIDvMM/HocZMaXK1+iHuRm/hh7l3gNmr9lu4Z1IPwmpkyUk7NchQapK+4aE4JynX6K
	 RD1gddmh1ImgxVuTzCG8ortAbX8Z6AeuoiF33OiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B13F8026A;
	Thu,  7 Apr 2022 04:28:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E7ABF8024C; Thu,  7 Apr 2022 04:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52986F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 04:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52986F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lf8btH98"
Received: by mail-qv1-xf33.google.com with SMTP id e22so3972986qvf.9
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 19:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJ3dXeQzueVB0fldDQFlD+8cW+hY4opLQkNRyye6JVk=;
 b=lf8btH986jNENv6Qf/fWlSp69NR51E9efhRTNT2jya7AIpJBfNBHS4uBz36zs5TbOR
 YcoHQqxIL+/NeCKsM6YNrCotzRN2ahPS5B/3gpywiX9QMh80YjBZoQSq28bTTRLmcdFm
 au2DiXD4rvHjxAiw/LzggS6rX1vJ2aV2ofUjkX3orV1G4kuKQxSUP1GTTZ0HpaXn+6pW
 i4jkjJCQmnAP3rnSHz+KH9OIMpZdBLft49oJmxkZ5wU9jbBdhW5PlI9RyUD2ozSvPQQZ
 GLz5NzdbRqf8h/02jlJNrlLItZ0Ym+DxJHkOUzxFipMQ1YUUQXmKbmhYaGdvpuTb+1jw
 4EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJ3dXeQzueVB0fldDQFlD+8cW+hY4opLQkNRyye6JVk=;
 b=hSxASlFPpih2h/kefKHt+TY4t/+NwCK14N/On78wpLC19ShGODORsAJBS2rNjo0h1V
 r+Z69hDsMpO277gttS2cJo3xta0EkptMa0CWL5Yy+IrVd7tchQALlL4voWVQQdEKkLMp
 SrE2ijcbDPGRxAPJBwpg9jNRn6NF4bFMT3NFRfOF6FK4Aj62UpM8REWQrHZWSu7TboQw
 K0hJGpRnH3QR+b2HzFC5/27X1lFc0DD05QImoKXvzcPDz+X+8VMcbdjChvpxKmB2FdKq
 wlgxkPRu1KTNW6urpsUq6hIhziKJrvcVg4eCe09FRsR5i98UmX9dL+tpLg+aqJHg60Yl
 z0Jw==
X-Gm-Message-State: AOAM531mVRG8L04y9rlrNFwjKdKTbPD7+BN4qjswzennP481AuaGuj+Q
 vtv8KxydIZ3SApB13jE+CUnrY1f+iFWmroc+FPw=
X-Google-Smtp-Source: ABdhPJwNKnzn8yWrA9SRMykBVH3K9Lp+xrAT5MoAdpct3D9KUeVVOsoMCJWxxgRUT1qghcxW6WjF9/S80BCQWl9Ey/0=
X-Received: by 2002:a05:6214:4112:b0:441:720:8434 with SMTP id
 kc18-20020a056214411200b0044107208434mr10161142qvb.23.1649298517738; Wed, 06
 Apr 2022 19:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-9-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-9-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 10:28:27 +0800
Message-ID: <CAA+D8AOZvGXB0e_jYN2+k7Umi8OVCabrchoDDcRo-MzqF0UOQg@mail.gmail.com>
Subject: Re: [PATCH v3 08/20] ASoC: fsl_micfil: drop unused variables
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

On Tue, Apr 5, 2022 at 4:00 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Please add a commit log. Thanks

Best Regards
Wang Shengjiu


> ---
>  sound/soc/fsl/fsl_micfil.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index b88ece31437ab..ffca56d72562d 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -38,10 +38,7 @@ struct fsl_micfil {
>         unsigned int dataline;
>         char name[32];
>         int irq[MICFIL_IRQ_LINES];
> -       unsigned int mclk_streams;
>         int quality;    /*QUALITY 2-0 bits */
> -       bool slave_mode;
> -       int channel_gain[8];
>  };
>
>  struct fsl_micfil_soc_data {
> @@ -342,7 +339,6 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>  {
>         struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
>         int ret;
> -       int i;
>
>         /* set qsel to medium */
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> @@ -353,8 +349,6 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>
>         /* set default gain to max_gain */
>         regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x77777777);
> -       for (i = 0; i < 8; i++)
> -               micfil->channel_gain[i] = 0xF;
>
>         snd_soc_dai_init_dma_data(cpu_dai, NULL,
>                                   &micfil->dma_params_rx);
> --
> 2.30.2
>
>
