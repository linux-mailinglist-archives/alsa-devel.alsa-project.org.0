Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F19964F71E7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 04:17:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81D37172C;
	Thu,  7 Apr 2022 04:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81D37172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649297833;
	bh=DlGp5qC39B4rpsGYBkWZWOM5anGaCEwtsuob+XyH6Zk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVbAB/unb+R4ZEd9E6s5yc35zHkcpRWyYdWGM/Yhcbr8slwW+KoEyhOkDnW3y6d3M
	 m+imDA9knIw/XN6pTNb1cMROjs13TrmAFr8p4QCOMabz1kWpLSUwlMXwUbKb2i7j+n
	 St+ePF+4sUc12snE0VdT2LGLLy3hYhrMvhZXptx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB8C7F8026A;
	Thu,  7 Apr 2022 04:16:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F682F8024C; Thu,  7 Apr 2022 04:16:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE2B0F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 04:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE2B0F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RI9gKrdQ"
Received: by mail-qk1-x732.google.com with SMTP id s4so1142820qkh.0
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 19:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4qEuK7ia3e8DdrCGLK2zYZJP2MvjYTMDD02xzT4C5c=;
 b=RI9gKrdQ2BILEfX3j3OcXhiOgNLl1LPWwWOn+p0Ff8RC9kqiUjuUQMiftoWZnGs1g1
 eE5UsMvrGzIpQeaolQksHJBl8qNAizyRsRMHu6Jt+G3QN71yHiizeM1IGE2DXMAZwCVa
 JdkTJuxWyFkiab/u0Ne9ciLf6Qtbik+O7jFuyxaMa5aGV6HDtdE4l1/JRHuCRvdCaK9s
 1cdhMvnIvmDf/z1k6LwrbO2zMzz8mqTYRq+TRTP+8omUAAIdqHyjL810ts1ZpQ1J8ggb
 YjxspUn7J3iLSEpIa4t2quMp0YzS0xAio/QjrharlGXGxJhG6OnGx9YdDL55Nb6Y5rUm
 5QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4qEuK7ia3e8DdrCGLK2zYZJP2MvjYTMDD02xzT4C5c=;
 b=2FmX85SWlMUMdE/rWg+uv0ifxCJ6rtHm+b8EoUQcsOe5pd1Z7sCBHrwFnFeRtBmbqR
 aY7yIbN01PJL7GZEFKuxnl9nO/XiMgrGZikI5D00mKTZHHYC43wghE1rtuVCRMB1LvZy
 gR2ylJV1iN5B0B6jRWGdIXzkRDzRW6Dpbk9a+9HgoK1PyZ5tvctpT3Rwe4BhLPGqHPGE
 NCBzUgBqYHj9f0sJu66kInw/L6iJ56Yy95uWoVb4yotpv7Lzo+fpLvbS+Ipunh5+Kx8w
 ESnajs5zB9lRtxPJhlySDvNlwZBJg+d7tFYDxEd4FfJ7P2x9VfkKMSY0xgMDWqBT6aQi
 uo9A==
X-Gm-Message-State: AOAM530T8tUS9ZkUcTiKXUgpbpxHAy2S1oc/7MemYuEH9+zBrFqKpVTp
 n8CdZRN0FZl58K6mjdRz+LhlC1no/ke5YhcxmAk=
X-Google-Smtp-Source: ABdhPJw0Tc7nDzEPCAKhl8PIt6OFSp89iEueZmFE6qBSBg1ezjkeQq2AJlOdKUXmvpeZKS5N3xKG79Z6lqNW+U1IbHs=
X-Received: by 2002:a05:620a:178f:b0:699:90a7:ffdf with SMTP id
 ay15-20020a05620a178f00b0069990a7ffdfmr7439079qkb.523.1649297764713; Wed, 06
 Apr 2022 19:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-7-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-7-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 10:15:54 +0800
Message-ID: <CAA+D8AOoq+X1qkQzysa13F6ktZr3J_GsBYV=dm_HWdEn_3=wzA@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] ASoC: fsl_micfil: use clear/set bits
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

> Instead regmap_update_bits() use the simpler variants
> regmap_[set|clear]_bits() where appropriate.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_micfil.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index cfa8af668d921..70185f75d8a04 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -168,19 +168,15 @@ static int fsl_micfil_reset(struct device *dev)
>         struct fsl_micfil *micfil = dev_get_drvdata(dev);
>         int ret;
>
> -       ret = regmap_update_bits(micfil->regmap,
> -                                REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_MDIS,
> -                                0);
> +       ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                               MICFIL_CTRL1_MDIS);
>         if (ret) {
>                 dev_err(dev, "failed to clear MDIS bit %d\n", ret);
>                 return ret;
>         }
>
> -       ret = regmap_update_bits(micfil->regmap,
> -                                REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_SRES,
> -                                MICFIL_CTRL1_SRES);
> +       ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                             MICFIL_CTRL1_SRES);
>         if (ret) {
>                 dev_err(dev, "failed to reset MICFIL: %d\n", ret);
>                 return ret;
> @@ -252,9 +248,8 @@ static int fsl_micfil_trigger(struct snd_pcm_substream
> *substream, int cmd,
>                 }
>
>                 /* Enable the module */
> -               ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                        MICFIL_CTRL1_PDMIEN,
> -                                        MICFIL_CTRL1_PDMIEN);
> +               ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                                     MICFIL_CTRL1_PDMIEN);
>                 if (ret) {
>                         dev_err(dev, "failed to enable the module\n");
>                         return ret;
> @@ -265,9 +260,8 @@ static int fsl_micfil_trigger(struct snd_pcm_substream
> *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>                 /* Disable the module */
> -               ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                        MICFIL_CTRL1_PDMIEN,
> -                                        0);
> +               ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                                       MICFIL_CTRL1_PDMIEN);
>                 if (ret) {
>                         dev_err(dev, "failed to enable the module\n");
>                         return ret;
> @@ -332,8 +326,8 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>         int ret;
>
>         /* 1. Disable the module */
> -       ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_PDMIEN, 0);
> +       ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                                MICFIL_CTRL1_PDMIEN);
>

Alignment should match open parenthesis?


>         if (ret) {
>                 dev_err(dev, "failed to disable the module\n");
>                 return ret;
> --
> 2.30.2
>
>
