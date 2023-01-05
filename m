Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF565E859
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 10:56:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8DDFBB6;
	Thu,  5 Jan 2023 10:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8DDFBB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672912569;
	bh=Sauz5NIaNyePqFm7InBi2MV0d0MVnBNMoz8m63JvFME=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CijXN9X6y8Le1dl1U+95MqoRzdkvuWyM9bmqEvr/a2yKRyYueBW+ikGW+4Ri7HgUP
	 BzYLCsQFDGmWGV2DvIPdV6lJ8xATsVFbSpTzDCyfN1okO4wA+6dDBemqsPz4MjDd+S
	 eX2giBQa62z1oY+Vzv8RUrFCO3h+c5193O5/3tlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D1FF8022B;
	Thu,  5 Jan 2023 10:55:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2793BF804AA; Thu,  5 Jan 2023 10:55:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEFBAF800C0
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 10:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEFBAF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H9/FE7bo
Received: by mail-wr1-x42d.google.com with SMTP id bn26so16099824wrb.0
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q1C4IC8VVW0pFMnjz3SdNh83hl0DQEaik2r9cC18j4I=;
 b=H9/FE7boaJW8ZVCcxRQYdP8s0FaaK3cSrgjxHjn/ewymdA7OJ0OPOSaqm2+4cCxmJJ
 9GvMliA7H8XQwlA04RktyY6D4ARRgtXefqEKt6SZ9vzxGA+UDMOBv5XzAe1v7NTAH8Dg
 vkeUrFTvy1RByZXpwzbcGuYN3UFMSDp3ALeW8O4Z/8wdZDdvy6iP2xyKVg7EemeLChq0
 q23AiXfbUv0LOa8j4s4UUmfjXc3Bep5rvjifbgrXAW33B51LHZackfS2P4by1Uo+wLnj
 38Vo7n0R34yTX6TGV6AFffNaKQ7AXbaQprwIKE6sR22+zOMV9KO1GFWia9qdCmpovksP
 hm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1C4IC8VVW0pFMnjz3SdNh83hl0DQEaik2r9cC18j4I=;
 b=5dYDy6wZe7j6w+qLVerSDzZpXyuASAApjIWvt5blM29flLgZJKc0gDdZlDUEV/7Ru5
 GHwyEuhpxRRVRTHPqtLcc+orJ3icxdDJT34vINw1nzquXlm2vHVPpA5pDu22sAwzwcGt
 dANT/wMptXKs+PFfu8YdGYPLiVcQ617zeELImFaMXEJrNDzFvtyKaGOQCm+B6uKsYCXy
 CFPGrp/drN7U7hfaixUJMDK7wIwjElZ6056dGxWRcZTMMsFYfb+0GFCu6NoUzObRvTzS
 59u4gDaeNJUUIiYJu+pjrLi4NXiiULdtZib7leNrNVIYO9wtpbION0Pvg/iXA2He8rgA
 Qzow==
X-Gm-Message-State: AFqh2krX9ULgPzunOFzXlZKY18Q6tyD4C++SrQeHHgpgCQKUwbVXDs3I
 3Enm7BtYHSyUso/n45DfFgQeQs8a86szzbOugm4=
X-Google-Smtp-Source: AMrXdXuh3vgi4dRDqPARDryrHSYnKkvyrg7FXGqmJmbBNJuu/LeGH5ECiyUJeBHq3ALqHJtAy0XW96WsN/VvhIQU4Nc=
X-Received: by 2002:a05:6000:a10:b0:2af:92d:7c2 with SMTP id
 co16-20020a0560000a1000b002af092d07c2mr63067wrb.34.1672912499215; Thu, 05 Jan
 2023 01:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20230104023953.2973362-1-chancel.liu@nxp.com>
 <20230104023953.2973362-3-chancel.liu@nxp.com>
In-Reply-To: <20230104023953.2973362-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Jan 2023 17:54:47 +0800
Message-ID: <CAA+D8ANvZSu42_M45CYhx9vOy2u3U=3dvYu6e0eRFS-gV-LAnA@mail.gmail.com>
Subject: Re: [RESEND v2 2/3] ASoC: fsl_xcvr: Add support for i.MX93 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 4, 2023 at 10:40 AM Chancel Liu <chancel.liu@nxp.com> wrote:

> Add compatible string and specific soc data to support XCVR on i.MX93
> platform. XCVR IP on i.MX93 is cut to SPDIF only by removing external
> PHY.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang Shengjiu

> ---
>  sound/soc/fsl/fsl_xcvr.c | 143 ++++++++++++++++++++++++++-------------
>  sound/soc/fsl/fsl_xcvr.h |   7 ++
>  2 files changed, 102 insertions(+), 48 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 2a6802fb2a8b..b794158a7876 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -21,6 +21,7 @@
>
>  struct fsl_xcvr_soc_data {
>         const char *fw_name;
> +       bool spdif_only;
>  };
>
>  struct fsl_xcvr {
> @@ -261,6 +262,9 @@ static int fsl_xcvr_en_phy_pll(struct fsl_xcvr *xcvr,
> u32 freq, bool tx)
>         u32 i, div = 0, log2;
>         int ret;
>
> +       if (xcvr->soc_data->spdif_only)
> +               return 0;
> +
>         for (i = 0; i < ARRAY_SIZE(fsl_xcvr_pll_cfg); i++) {
>                 if (fsl_xcvr_pll_cfg[i].fout % freq == 0) {
>                         div = fsl_xcvr_pll_cfg[i].fout / freq;
> @@ -353,6 +357,7 @@ static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr,
> u32 freq)
>         struct device *dev = &xcvr->pdev->dev;
>         int ret;
>
> +       freq = xcvr->soc_data->spdif_only ? freq / 10 : freq;
>         clk_disable_unprepare(xcvr->phy_clk);
>         ret = clk_set_rate(xcvr->phy_clk, freq);
>         if (ret < 0) {
> @@ -365,6 +370,8 @@ static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr,
> u32 freq)
>                 return ret;
>         }
>
> +       if (xcvr->soc_data->spdif_only)
> +               return 0;
>         /* Release AI interface from reset */
>         ret = regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET,
>                            FSL_XCVR_PHY_AI_CTRL_AI_RESETN);
> @@ -547,10 +554,12 @@ static int fsl_xcvr_startup(struct snd_pcm_substream
> *substream,
>
>         xcvr->streams |= BIT(substream->stream);
>
> -       /* Disable XCVR controls if there is stream started */
> -       fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, false);
> -       fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name, false);
> -       fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name, false);
> +       if (!xcvr->soc_data->spdif_only) {
> +               /* Disable XCVR controls if there is stream started */
> +               fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name,
> false);
> +               fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
> false);
> +               fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
> false);
> +       }
>
>         return 0;
>  }
> @@ -567,12 +576,13 @@ static void fsl_xcvr_shutdown(struct
> snd_pcm_substream *substream,
>
>         /* Enable XCVR controls if there is no stream started */
>         if (!xcvr->streams) {
> -               fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, true);
> -               fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
> -                                     (xcvr->mode == FSL_XCVR_MODE_ARC));
> -               fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
> -                                     (xcvr->mode == FSL_XCVR_MODE_EARC));
> -
> +               if (!xcvr->soc_data->spdif_only) {
> +                       fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name,
> true);
> +                       fsl_xcvr_activate_ctl(dai,
> fsl_xcvr_arc_mode_kctl.name,
> +                                               (xcvr->mode ==
> FSL_XCVR_MODE_ARC));
> +                       fsl_xcvr_activate_ctl(dai,
> fsl_xcvr_earc_capds_kctl.name,
> +                                               (xcvr->mode ==
> FSL_XCVR_MODE_EARC));
> +               }
>                 ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
>                                          FSL_XCVR_IRQ_EARC_ALL, 0);
>                 if (ret < 0) {
> @@ -673,7 +683,10 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream
> *substream, int cmd,
>                                         dev_err(dai->dev, "Failed to stop
> DATA_TX: %d\n", ret);
>                                         return ret;
>                                 }
> -                               fallthrough;
> +                               if (xcvr->soc_data->spdif_only)
> +                                       break;
> +                               else
> +                                       fallthrough;
>                         case FSL_XCVR_MODE_EARC:
>                                 /* clear ISR_CMDC_TX_EN, W1C */
>                                 ret = regmap_write(xcvr->regmap,
> @@ -877,9 +890,13 @@ static int fsl_xcvr_dai_probe(struct snd_soc_dai *dai)
>
>         snd_soc_dai_init_dma_data(dai, &xcvr->dma_prms_tx,
> &xcvr->dma_prms_rx);
>
> -       snd_soc_add_dai_controls(dai, &fsl_xcvr_mode_kctl, 1);
> -       snd_soc_add_dai_controls(dai, &fsl_xcvr_arc_mode_kctl, 1);
> -       snd_soc_add_dai_controls(dai, &fsl_xcvr_earc_capds_kctl, 1);
> +       if (xcvr->soc_data->spdif_only)
> +               xcvr->mode = FSL_XCVR_MODE_SPDIF;
> +       else {
> +               snd_soc_add_dai_controls(dai, &fsl_xcvr_mode_kctl, 1);
> +               snd_soc_add_dai_controls(dai, &fsl_xcvr_arc_mode_kctl, 1);
> +               snd_soc_add_dai_controls(dai, &fsl_xcvr_earc_capds_kctl,
> 1);
> +       }
>         snd_soc_add_dai_controls(dai, fsl_xcvr_tx_ctls,
>                                  ARRAY_SIZE(fsl_xcvr_tx_ctls));
>         snd_soc_add_dai_controls(dai, fsl_xcvr_rx_ctls,
> @@ -930,10 +947,11 @@ static const struct reg_default
> fsl_xcvr_reg_defaults[] = {
>         { FSL_XCVR_ISR_SET,     0x00000000 },
>         { FSL_XCVR_ISR_CLR,     0x00000000 },
>         { FSL_XCVR_ISR_TOG,     0x00000000 },
> -       { FSL_XCVR_RX_DPTH_CTRL,        0x00002C89 },
> -       { FSL_XCVR_RX_DPTH_CTRL_SET,    0x00002C89 },
> -       { FSL_XCVR_RX_DPTH_CTRL_CLR,    0x00002C89 },
> -       { FSL_XCVR_RX_DPTH_CTRL_TOG,    0x00002C89 },
> +       { FSL_XCVR_CLK_CTRL,    0x0000018F },
> +       { FSL_XCVR_RX_DPTH_CTRL,        0x00040CC1 },
> +       { FSL_XCVR_RX_DPTH_CTRL_SET,    0x00040CC1 },
> +       { FSL_XCVR_RX_DPTH_CTRL_CLR,    0x00040CC1 },
> +       { FSL_XCVR_RX_DPTH_CTRL_TOG,    0x00040CC1 },
>         { FSL_XCVR_RX_DPTH_CNTR_CTRL,   0x00000000 },
>         { FSL_XCVR_RX_DPTH_CNTR_CTRL_SET, 0x00000000 },
>         { FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR, 0x00000000 },
> @@ -966,6 +984,12 @@ static const struct reg_default
> fsl_xcvr_reg_defaults[] = {
>
>  static bool fsl_xcvr_readable_reg(struct device *dev, unsigned int reg)
>  {
> +       struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
> +
> +       if (xcvr->soc_data->spdif_only)
> +               if ((reg >= FSL_XCVR_IER && reg <= FSL_XCVR_PHY_AI_RDATA)
> ||
> +                   reg > FSL_XCVR_TX_DPTH_BCRR)
> +                       return false;
>         switch (reg) {
>         case FSL_XCVR_VERSION:
>         case FSL_XCVR_EXT_CTRL:
> @@ -991,6 +1015,12 @@ static bool fsl_xcvr_readable_reg(struct device
> *dev, unsigned int reg)
>         case FSL_XCVR_RX_DPTH_CTRL_SET:
>         case FSL_XCVR_RX_DPTH_CTRL_CLR:
>         case FSL_XCVR_RX_DPTH_CTRL_TOG:
> +       case FSL_XCVR_RX_CS_DATA_0:
> +       case FSL_XCVR_RX_CS_DATA_1:
> +       case FSL_XCVR_RX_CS_DATA_2:
> +       case FSL_XCVR_RX_CS_DATA_3:
> +       case FSL_XCVR_RX_CS_DATA_4:
> +       case FSL_XCVR_RX_CS_DATA_5:
>         case FSL_XCVR_RX_DPTH_CNTR_CTRL:
>         case FSL_XCVR_RX_DPTH_CNTR_CTRL_SET:
>         case FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR:
> @@ -1027,6 +1057,11 @@ static bool fsl_xcvr_readable_reg(struct device
> *dev, unsigned int reg)
>
>  static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
>  {
> +       struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
> +
> +       if (xcvr->soc_data->spdif_only)
> +               if (reg >= FSL_XCVR_IER && reg <= FSL_XCVR_PHY_AI_RDATA)
> +                       return false;
>         switch (reg) {
>         case FSL_XCVR_EXT_CTRL:
>         case FSL_XCVR_EXT_IER0:
> @@ -1103,32 +1138,34 @@ static irqreturn_t irq0_isr(int irq, void *devid)
>         if (isr & FSL_XCVR_IRQ_NEW_CS) {
>                 dev_dbg(dev, "Received new CS block\n");
>                 isr_clr |= FSL_XCVR_IRQ_NEW_CS;
> -               /* Data RAM is 4KiB, last two pages: 8 and 9. Select page
> 8. */
> -               regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
> -                                  FSL_XCVR_EXT_CTRL_PAGE_MASK,
> -                                  FSL_XCVR_EXT_CTRL_PAGE(8));
> -
> -               /* Find updated CS buffer */
> -               reg_ctrl = xcvr->ram_addr + FSL_XCVR_RX_CS_CTRL_0;
> -               reg_buff = xcvr->ram_addr + FSL_XCVR_RX_CS_BUFF_0;
> -               memcpy_fromio(&val, reg_ctrl, sizeof(val));
> -               if (!val) {
> -                       reg_ctrl = xcvr->ram_addr + FSL_XCVR_RX_CS_CTRL_1;
> -                       reg_buff = xcvr->ram_addr + FSL_XCVR_RX_CS_BUFF_1;
> +               if (!xcvr->soc_data->spdif_only) {
> +                       /* Data RAM is 4KiB, last two pages: 8 and 9.
> Select page 8. */
> +                       regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
> +                                          FSL_XCVR_EXT_CTRL_PAGE_MASK,
> +                                          FSL_XCVR_EXT_CTRL_PAGE(8));
> +
> +                       /* Find updated CS buffer */
> +                       reg_ctrl = xcvr->ram_addr + FSL_XCVR_RX_CS_CTRL_0;
> +                       reg_buff = xcvr->ram_addr + FSL_XCVR_RX_CS_BUFF_0;
>                         memcpy_fromio(&val, reg_ctrl, sizeof(val));
> -               }
> +                       if (!val) {
> +                               reg_ctrl = xcvr->ram_addr +
> FSL_XCVR_RX_CS_CTRL_1;
> +                               reg_buff = xcvr->ram_addr +
> FSL_XCVR_RX_CS_BUFF_1;
> +                               memcpy_fromio(&val, reg_ctrl, sizeof(val));
> +                       }
>
> -               if (val) {
> -                       /* copy CS buffer */
> -                       memcpy_fromio(&xcvr->rx_iec958.status, reg_buff,
> -                                     sizeof(xcvr->rx_iec958.status));
> -                       for (i = 0; i < 6; i++) {
> -                               val = *(u32 *)(xcvr->rx_iec958.status +
> i*4);
> -                               *(u32 *)(xcvr->rx_iec958.status + i*4) =
> -                                       bitrev32(val);
> +                       if (val) {
> +                               /* copy CS buffer */
> +                               memcpy_fromio(&xcvr->rx_iec958.status,
> reg_buff,
> +
>  sizeof(xcvr->rx_iec958.status));
> +                               for (i = 0; i < 6; i++) {
> +                                       val = *(u32
> *)(xcvr->rx_iec958.status + i*4);
> +                                       *(u32 *)(xcvr->rx_iec958.status +
> i*4) =
> +                                               bitrev32(val);
> +                               }
> +                               /* clear CS control register */
> +                               memset_io(reg_ctrl, 0, sizeof(val));
>                         }
> -                       /* clear CS control register */
> -                       memset_io(reg_ctrl, 0, sizeof(val));
>                 }
>         }
>         if (isr & FSL_XCVR_IRQ_NEW_UD) {
> @@ -1168,8 +1205,13 @@ static const struct fsl_xcvr_soc_data
> fsl_xcvr_imx8mp_data = {
>         .fw_name = "imx/xcvr/xcvr-imx8mp.bin",
>  };
>
> +static const struct fsl_xcvr_soc_data fsl_xcvr_imx93_data = {
> +       .spdif_only = true,
> +};
> +
>  static const struct of_device_id fsl_xcvr_dt_ids[] = {
>         { .compatible = "fsl,imx8mp-xcvr", .data = &fsl_xcvr_imx8mp_data },
> +       { .compatible = "fsl,imx93-xcvr", .data = &fsl_xcvr_imx93_data},
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_xcvr_dt_ids);
> @@ -1229,7 +1271,7 @@ static int fsl_xcvr_probe(struct platform_device
> *pdev)
>                 return PTR_ERR(xcvr->regmap);
>         }
>
> -       xcvr->reset = devm_reset_control_get_exclusive(dev, NULL);
> +       xcvr->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
>         if (IS_ERR(xcvr->reset)) {
>                 dev_err(dev, "failed to get XCVR reset control\n");
>                 return PTR_ERR(xcvr->reset);
> @@ -1306,12 +1348,14 @@ static __maybe_unused int
> fsl_xcvr_runtime_suspend(struct device *dev)
>         if (ret < 0)
>                 dev_err(dev, "Failed to clear IER0: %d\n", ret);
>
> -       /* Assert M0+ reset */
> -       ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
> -                                FSL_XCVR_EXT_CTRL_CORE_RESET,
> -                                FSL_XCVR_EXT_CTRL_CORE_RESET);
> -       if (ret < 0)
> -               dev_err(dev, "Failed to assert M0+ core: %d\n", ret);
> +       if (!xcvr->soc_data->spdif_only) {
> +               /* Assert M0+ reset */
> +               ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
> +                                       FSL_XCVR_EXT_CTRL_CORE_RESET,
> +                                       FSL_XCVR_EXT_CTRL_CORE_RESET);
> +               if (ret < 0)
> +                       dev_err(dev, "Failed to assert M0+ core: %d\n",
> ret);
> +       }
>
>         regcache_cache_only(xcvr->regmap, true);
>
> @@ -1367,6 +1411,9 @@ static __maybe_unused int
> fsl_xcvr_runtime_resume(struct device *dev)
>                 goto stop_spba_clk;
>         }
>
> +       if (xcvr->soc_data->spdif_only)
> +               return 0;
> +
>         ret = reset_control_deassert(xcvr->reset);
>         if (ret) {
>                 dev_err(dev, "failed to deassert M0+ reset.\n");
> diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
> index 4769b0fca21d..044058fc6aa2 100644
> --- a/sound/soc/fsl/fsl_xcvr.h
> +++ b/sound/soc/fsl/fsl_xcvr.h
> @@ -49,6 +49,13 @@
>  #define FSL_XCVR_RX_DPTH_CTRL_CLR      0x188
>  #define FSL_XCVR_RX_DPTH_CTRL_TOG      0x18c
>
> +#define FSL_XCVR_RX_CS_DATA_0          0x190
> +#define FSL_XCVR_RX_CS_DATA_1          0x194
> +#define FSL_XCVR_RX_CS_DATA_2          0x198
> +#define FSL_XCVR_RX_CS_DATA_3          0x19C
> +#define FSL_XCVR_RX_CS_DATA_4          0x1A0
> +#define FSL_XCVR_RX_CS_DATA_5          0x1A4
> +
>  #define FSL_XCVR_RX_DPTH_CNTR_CTRL     0x1C0
>  #define FSL_XCVR_RX_DPTH_CNTR_CTRL_SET 0x1C4
>  #define FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR 0x1C8
> --
> 2.25.1
>
>
