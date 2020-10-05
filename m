Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6350D283512
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39A317DA;
	Mon,  5 Oct 2020 13:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39A317DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897810;
	bh=H0rnmd5WbZBw10agVW6LbKGnfvVJdVtsjQvYOHnc5+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vAewBksBeY/OyZ3FAkDtE3a72dlZrecQaX87fdx13sua8V6yNbvVLIZJ2TTBjZzu8
	 RWwaL34JxY4yjhULAuD8lY9Yatu5O1tjknD6P2siiRMw5yhMz47kjqjYHERgsOI4Ku
	 cu0GecaYuHyWO1yaGKFIIXbk9KWjptOHFQo8ZuTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 498C0F80121;
	Mon,  5 Oct 2020 13:34:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 145A0F8026A; Mon,  5 Oct 2020 13:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C343FF80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C343FF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LGjIp8gd"
Received: by mail-lf1-x144.google.com with SMTP id h6so3642401lfj.3
 for <alsa-devel@alsa-project.org>; Mon, 05 Oct 2020 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0oasYUn/DFPHyfpwUSLDafrvSPH+4dMhFJB75nBJ0NA=;
 b=LGjIp8gdHZwZsp9firBczY8q1j24JfL7rxvncNyEQZLC1k29goNe5NEdq9vTCeyD+p
 8q0oGPGG45MyLrS4yKiv78fvKNcAWvBPrf+2rt9RD+kXFB09ex66868LF91Ay9TS69GZ
 jKMhUlGKM9qvNEQcjmP4Vm3qV9XfQSlCmvy60Jx6YDkoNhEDpl+T/6bT6CA1l7zdpPLx
 2jFfM1BwQY7+dLJWElRSkV2YSPEmI3iLKgPGGfniiRIkcf4jCa7i5gR38RkvvNNoGvo0
 Ug4esBn2MUCEb5u9ToEyAC0nnOwJ4lH61cBLZIM3Id0rl8cCaaG5u2kxvGu/dAs6QZmH
 r5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0oasYUn/DFPHyfpwUSLDafrvSPH+4dMhFJB75nBJ0NA=;
 b=E4gBGj2FepRQnILugA8ynwhGcD/+9zspb6556kbIXBazmvJz8DnuiQovAbeFBudAPB
 sxyC8TtnC4xEFYaj/oYCcZt19FWOv0VEYISU9Xc3VCPPPqqO1Il/2VBQuURE38L1g6hx
 nVWWtv36X4du6FSKhmrft4pzYSf89OUInAtU7l4AR3/uu/M+HeXmHcZDFcVk2WNz9QLu
 7vL5DwLKIGFN07oXmMDGg6ctmbiqBY6BcmiL1WRn3m+UUGHHmNPFt7uvL15pGnm5RefK
 BMZ5kEOMltUhPQEQGcNLYA/CPSwNNkprG6rrp0SPPTwuLBffItm5+CJQTqgdcyAZLfoE
 tEVw==
X-Gm-Message-State: AOAM532p5T6G0uqJGmUujIaDRJi5GnXdq69faP1FeWqAAv5hD6k/+Tpe
 q7hx+ZLrkzOVcmLDY6nSt+IndkctctkDotLISak=
X-Google-Smtp-Source: ABdhPJz5PPNoJmUl0u9wvw8E321vxHRtCbwB0xIiPrUZEr07DIHozHYOogOWSqdYp9aclZlMXspxM1LBHcdx/vDv2LQ=
X-Received: by 2002:ac2:4e92:: with SMTP id o18mr5933387lfr.527.1601897674632; 
 Mon, 05 Oct 2020 04:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201005111644.3131604-1-primoz.fiser@norik.com>
In-Reply-To: <20201005111644.3131604-1-primoz.fiser@norik.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Oct 2020 08:34:23 -0300
Message-ID: <CAOMZO5D7=kJJ1RJ5X53aEnBWqqpUL-RVDqBibdZ-N65gg7nq6g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl: fsl_ssi: add ac97 fixed mode support
To: Primoz Fiser <primoz.fiser@norik.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>
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

Hi Primoz,

On Mon, Oct 5, 2020 at 8:16 AM Primoz Fiser <primoz.fiser@norik.com> wrote:
>
> SSI supports "variable" and "fixed" mode of operation in AC'97 mode. Up
> to now, driver always configured SSI port to operate in "variable" AC'97
> mode which is known to be unreliable with some CODECs, see:
> commit 01ca485171e3 ("ASoC: fsl_ssi: only enable proper channel slots in
> AC'97 mode") for more information on issues related to spurious SLOTREQ
> bits. But in summary, when SSI operates in AC'97 variable mode of
> operation, CODECs can sometimes send SLOTREQ bits for non-existent audio
> slots which then "stick" in SSI and completely break audio output.
> Contrary when operating SSI in AC'97 fixed mode, described issues were
> completely gone!
>
> Thus add support for operating SSI in AC'97 Fixed Mode of operation
> which provides better audio reliability when compared to AC'97 Variable
> Mode with some CODECs.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  sound/soc/fsl/fsl_ssi.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index 404be27c15fe..3b89785f6de8 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -243,6 +243,7 @@ struct fsl_ssi_soc_data {
>   * @dma_maxburst: Max number of words to transfer in one go. So far,
>   *                this is always the same as fifo_watermark.
>   * @ac97_reg_lock: Mutex lock to serialize AC97 register access operations
> + * @ac97_fixed_mode: SSI in AC97 fixed mode of operation
>   */
>  struct fsl_ssi {
>         struct regmap *regs;
> @@ -287,6 +288,7 @@ struct fsl_ssi {
>         u32 dma_maxburst;
>
>         struct mutex ac97_reg_lock;
> +       bool ac97_fixed_mode;
>  };
>
>  /*
> @@ -616,7 +618,12 @@ static void fsl_ssi_setup_ac97(struct fsl_ssi *ssi)
>         regmap_write(regs, REG_SSI_SRCCR, SSI_SxCCR_WL(17) | SSI_SxCCR_DC(13));
>
>         /* Enable AC97 mode and startup the SSI */
> -       regmap_write(regs, REG_SSI_SACNT, SSI_SACNT_AC97EN | SSI_SACNT_FV);
> +       if (ssi->ac97_fixed_mode) {
> +               regmap_write(regs, REG_SSI_SACNT, SSI_SACNT_AC97EN);
> +               regmap_write(regs, REG_SSI_SATAG, 0x9800);
> +       } else

Should be } else { because the previous if block used curly braces.

> +               regmap_write(regs, REG_SSI_SACNT,
> +                               SSI_SACNT_AC97EN | SSI_SACNT_FV);
