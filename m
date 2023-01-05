Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9865E85C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 10:56:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91BFCFE6F;
	Thu,  5 Jan 2023 10:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91BFCFE6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672912594;
	bh=LiSv5TwNbn5J8t/C6s/tjsqqEuDQj7Md/BTdiJRYvgk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U0T/aclKC39inPhd2Ugh+DAiazUFTmB6Bg+zN3RWLWUFzap3T/XTF7AMFGpQPx/DO
	 hpPP/IyqnxOfqj0EWnOxrwz3xxkH8nq3oCHsS1IGiPdNmjVZb6t8/m0kauMyzAEApJ
	 7HIgRBrqixLw6eWgoLtGgHuarf6/T7GqFfIRaYbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E3BF80548;
	Thu,  5 Jan 2023 10:55:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D225EF80549; Thu,  5 Jan 2023 10:55:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C3F6F80542
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 10:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C3F6F80542
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UmaGtsNE
Received: by mail-wr1-x436.google.com with SMTP id d4so27589992wrw.6
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 01:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rWjiFIuWNg9vj3NtGlYTdrLFGp2rkSz25FDahX023c4=;
 b=UmaGtsNEkxWShoHPRNJhCno1Xu4ezhKPFuKFsxyDrDdoHOErAm281PynHhAkeDd0+t
 qIk1ZGfSV1ZVj0bnG4tTW6ZKdPMxKnv5Ltqr6w7B1PSIEOdJ1RYTtOapEPhOwGfzmnpQ
 NWbB/8Ngpg6HwlrR6CdWGHDMKdCpg/br6KBYN222pLfSQWhVgG059F5LO1wyZspXE7JL
 9JRqCnFSZlRmE6cz+Xzmx1J9ac4xblgevOh3XXKXo+fg3+dSpMYLQFucswdFy7gnmPvo
 YGm5jjSB+f01Rvdz5+qTT+JrPcoMksdcFe76bO1tSNpU87HwbeyWQI9jIMHy6oaAPL8t
 5czA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rWjiFIuWNg9vj3NtGlYTdrLFGp2rkSz25FDahX023c4=;
 b=KnSyT6XFTBNdPGQOAIZGjl/vRkm3hPXWypBBtsp7qHxWIwo1v1NMIV/gQ3VAkTkP18
 QvWFSgS5FwUi9SpGxB1kGSN0lYmxl/UF9UjnbBCTTTLHOWCLQYNo5OgQJpmxSJP/FSwI
 WWzl9x2wLwx5JBecG99zQz26vx5PmbpE06HmKY+wAdHIsk8g7K3V9qcOSfXWaNqKR1cA
 iQJdOqSyZXbx8EW05sdp1LXAxIGZK/tOjsa5jy43pxnb+gnldt7dn39R+ehcKg3CqNC1
 NV9shJ8ow3+5C48rgYFcAz1c0cTRyCaOsIqKV989bK9eAhwAodh6GcdWL+GELf4cbiYr
 oUxg==
X-Gm-Message-State: AFqh2kp5JYNMtSCY2cDs4p4wh538i+CMlcwNI+iuFTAdVr2LgvM9nD10
 +ML9TvR8WVqohwL9DrN8OjmXJFQHHcJG4NujX1c=
X-Google-Smtp-Source: AMrXdXvdOx+OEPd7RZyfpSQM7vMUoE6Z2tStG2ag+Ab8rfzjQfxBbh53yclj3nEVMwqNDRhwKwRUdpe0gSPoc34euF8=
X-Received: by 2002:adf:eec4:0:b0:283:c7b5:ee42 with SMTP id
 a4-20020adfeec4000000b00283c7b5ee42mr1113217wrp.490.1672912535443; Thu, 05
 Jan 2023 01:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20230104023953.2973362-1-chancel.liu@nxp.com>
 <20230104023953.2973362-4-chancel.liu@nxp.com>
In-Reply-To: <20230104023953.2973362-4-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Jan 2023 17:55:24 +0800
Message-ID: <CAA+D8APBcFSdcUSN6J+9a233Z-PpUrQ1kH-XzF+H1QVmaBhCSQ@mail.gmail.com>
Subject: Re: [RESEND v2 3/3] ASoC: fsl_xcvr: Add constraints of period size
 while using eDMA
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

> eDMA on i.MX93 platform requires the period size to be multiple of
> maxburst.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
>  sound/soc/fsl/fsl_xcvr.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index b794158a7876..2a78243df752 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -22,6 +22,7 @@
>  struct fsl_xcvr_soc_data {
>         const char *fw_name;
>         bool spdif_only;
> +       bool use_edma;
>  };
>
>  struct fsl_xcvr {
> @@ -538,6 +539,16 @@ static int fsl_xcvr_startup(struct snd_pcm_substream
> *substream,
>                 return -EBUSY;
>         }
>
> +       /*
> +        * EDMA controller needs period size to be a multiple of
> +        * tx/rx maxburst
> +        */
> +       if (xcvr->soc_data->use_edma)
> +               snd_pcm_hw_constraint_step(substream->runtime, 0,
> +                                          SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> +                                          tx ? xcvr->dma_prms_tx.maxburst
> :
> +                                          xcvr->dma_prms_rx.maxburst);
> +
>         switch (xcvr->mode) {
>         case FSL_XCVR_MODE_SPDIF:
>         case FSL_XCVR_MODE_ARC:
> @@ -1207,6 +1218,7 @@ static const struct fsl_xcvr_soc_data
> fsl_xcvr_imx8mp_data = {
>
>  static const struct fsl_xcvr_soc_data fsl_xcvr_imx93_data = {
>         .spdif_only = true,
> +       .use_edma = true,
>  };
>
>  static const struct of_device_id fsl_xcvr_dt_ids[] = {
> --
> 2.25.1
>
>
