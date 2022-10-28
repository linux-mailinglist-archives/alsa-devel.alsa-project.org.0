Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4824610C25
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 10:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6869E1916;
	Fri, 28 Oct 2022 10:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6869E1916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666945612;
	bh=+sMR2VI6FhSA87Gn4tOFeEFaMDpIp6XyG7JSXjI6n5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljU0IlXJmScdIcC6R1gLlgk/pnxlnHVIVddUi3ydXh+o1hbC+j0U8YICgVcWRnv8Y
	 fo74+jycmNKEmM2mHtkcsO2WDAW4uCmYznZv56qXyt8v5xv6XzKk8lZODX4F4Pf6C8
	 Z5BpId3V1zQS+g79AyEpS0HJbp+Fnwt2BBfKwNo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0F0BF80095;
	Fri, 28 Oct 2022 10:25:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46EFDF8025A; Fri, 28 Oct 2022 10:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08F4DF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 10:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F4DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TyVnnG3t"
Received: by mail-lf1-x135.google.com with SMTP id bp15so7050344lfb.13
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Aze6Vdz40SivY/OyVTioHF5+ECKEXJzUkeeEGjpn7nM=;
 b=TyVnnG3t93HVnGlm8qTCubRTPGcFE9YxDMIwaj6tUIXcxzqTV5RF1jeMaCKF5KhAJx
 F8afYGGyJ4PNLRQPJ5QdXpQjRyDeWPcotAiWGC8XOGW9Nd7zGC8r8izjc5MH6bZ5Zu4y
 ix2uDYpfZvNgBKDUvbOnPEt9bgyg1aEelBblScvXdRfESu2l19o4P9qr+SA5j59N/h1+
 2gm7LtihzGfWuHQrICms9y19Pa8UPlghNsQSFvj0t2r+zwTZP92ZZxstBCFrcF6Y4OUq
 Sn6+WJdWUaJC6f7s8FAfHLjg3KhLvjrSLVbSSxJWgr2jvwVYjHCTQzQ4+tfgbSFwzTgf
 /aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Aze6Vdz40SivY/OyVTioHF5+ECKEXJzUkeeEGjpn7nM=;
 b=eSpkKGB7RLwnYdTy4eDFGF6v662yrxs5S/YOVh1IfsTaixEdYUjdxI+UCUVTHlqaBH
 ncqZT2lpnMqAIPtt4yLgo88EzvbzUv/GCd54xDytfBuhzClUM/JglNfmEYkCmon5CDan
 lcvwcF1tLtgKjqrO9swygCPFvA2RU7+YuznN388+2V9xcG5CLP5b2EVSncVkicRxfj6D
 MZOr5KN6/0Db9aFlFsZimaUOjPsrIMDoh4luafCy3ojlPbGgCeIMdUkRhpCDQrvp3d6w
 NLoxquP/UyiP8kRg+Prw0Zl132rXARNoUIs5IaZIJOuEMPBhCAVZ4ax/+vCzvniIrWIO
 zNqQ==
X-Gm-Message-State: ACrzQf0ge44qQup0RGMhN7ccFR39tjlyM/ox3HNLhZ7ctbwqrqvbPbfM
 j6yUj3AM4wdg2Dd8itwnsG4LTuvZ/AC6t1f0Sik=
X-Google-Smtp-Source: AMsMyM6Bt+HYyjCphx0irVeTv2U6ca6Ir+VpNl77yNcjGX2Nf4ffrXSzqEbrIuQOyZIuEHXTJwINuVPwwlXtijh03mo=
X-Received: by 2002:ac2:58d8:0:b0:4af:af1f:87e0 with SMTP id
 u24-20020ac258d8000000b004afaf1f87e0mr4354978lfo.283.1666945547756; Fri, 28
 Oct 2022 01:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
 <20221027060311.2549711-3-chancel.liu@nxp.com>
In-Reply-To: <20221027060311.2549711-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Oct 2022 16:25:36 +0800
Message-ID: <CAA+D8AOyyn+Ax9Bo=Dh4tUDq=Eh_Ep1RMehwENqiaWeAdWRa-w@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_sai: Add support for i.MX93 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 festevam@gmail.com
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

On Thu, Oct 27, 2022 at 2:04 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> Add compatible string and specific soc data to support SAI on i.MX93
> platform.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 81f89f6767a2..68e1cc4c369a 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1579,6 +1579,17 @@ static const struct fsl_sai_soc_data
> fsl_sai_imx8ulp_data = {
>         .max_register = FSL_SAI_RTCAP,
>  };
>
> +static const struct fsl_sai_soc_data fsl_sai_imx93_data = {
> +       .use_imx_pcm = true,
> +       .use_edma = true,
> +       .fifo_depth = 128,
> +       .reg_offset = 8,
> +       .mclk0_is_mclk1 = false,
> +       .pins = 4,
> +       .flags = 0,
> +       .max_register = FSL_SAI_MCTL,
> +};
> +
>  static const struct of_device_id fsl_sai_ids[] = {
>         { .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
>         { .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
> @@ -1590,6 +1601,7 @@ static const struct of_device_id fsl_sai_ids[] = {
>         { .compatible = "fsl,imx8mp-sai", .data = &fsl_sai_imx8mp_data },
>         { .compatible = "fsl,imx8ulp-sai", .data = &fsl_sai_imx8ulp_data },
>         { .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mp_data },
> +       { .compatible = "fsl,imx93-sai", .data = &fsl_sai_imx93_data },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_sai_ids);
> --
> 2.25.1
>
>
