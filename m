Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8114C7B4B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 22:03:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7ABC173F;
	Mon, 28 Feb 2022 22:02:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7ABC173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646082228;
	bh=HwFgp/BFw6wiyd1CL+yd/ZLPP3zQ5fxgYx4vbuOvKow=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qv1lB8cqWYwPmLtXecN73WLm/SiRhwbfL1FQ0/JvuAMgAfnY78r/j8M82tW78N2CV
	 gOdsJXwLvuxD1klD+8PkKNo6AQDVKnUDi1Q++siRiiFfgoHqWs2kOzaKNhLLiZzUXh
	 inm13PQlvYAAfR7Mw2UtPzLgRw2v7KBdIhEyJiAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F74CF800F8;
	Mon, 28 Feb 2022 22:02:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE338F8013C; Mon, 28 Feb 2022 22:02:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8260CF80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 22:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8260CF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="BAB4ti96"
Received: by mail-oi1-x22e.google.com with SMTP id j24so14365344oii.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=OjxaRtww+0xjPVA2HOQsw52HxUVAinM3d0O8FoXeDko=;
 b=BAB4ti96IwrLL45RTnLkyVlTAFqJ8Gh6Ntg3w0Rk2WSWnBfnOec8AKO/J2rWYeriVS
 JQbU7JrNNsR9Q3ge5zfmlnX0P7WIOzNbU3ugL6IYLL++VqB3WQeegRpCYo68Lips/lfp
 82gfdqDxH3c2c6zf4vn0pA0w0qTvVqMGOQMAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=OjxaRtww+0xjPVA2HOQsw52HxUVAinM3d0O8FoXeDko=;
 b=VtvDD778a4BkokcVpQycOa0wjXPetDiyuPz4ljl4KcP6Hvf1rgAcbexqeF03rr0pug
 bh1eRLxzBR4QlRmKwWurVkXVEVm2gfnwDHSgIskkbw52Vg5Xi1ZZwLlAo+Dni/ogcEJk
 iRuPlRf+TCl7a4e8ORV4SbUI83gfj0zGiqZWFNeOsYbK5F27c1LyerClhmiMFn2K+SK2
 OxtPMlPpgNteCVxoAmgs5koyZ49YDJF4KtuqbWpZPOSeI+AmVk2oU3oXu0KGeV+rLVv4
 NBeb8hhCDARZC2PqwbRvO0aWQDlN9aseIlPY78Rc1rs6xDSp2KshNeDjTuNqoAQJDoeR
 GeTg==
X-Gm-Message-State: AOAM531SXywIna9GnEZH5XRVgeyGRmM50gZQqeA4/0NL+fTqWwlrc4tt
 Qyjt68G/3dg02Y+HSHZlGLo0A3s+y9nWaGAR/0xZjw==
X-Google-Smtp-Source: ABdhPJz0rtxf29o77JVEbaaT9zWczUDsrAzEfY9cyLITyQ8XWVVDNvI/ytMrImJbvsCu+c4Aupsp99oh6218O1qRzqM=
X-Received: by 2002:a05:6808:1a28:b0:2d7:3c61:e0d6 with SMTP id
 bk40-20020a0568081a2800b002d73c61e0d6mr12241619oib.32.1646082150802; Mon, 28
 Feb 2022 13:02:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 13:02:30 -0800
MIME-Version: 1.0
In-Reply-To: <1646030377-12092-2-git-send-email-quic_srivasam@quicinc.com>
References: <1646030377-12092-1-git-send-email-quic_srivasam@quicinc.com>
 <1646030377-12092-2-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 28 Feb 2022 13:02:30 -0800
Message-ID: <CAE-0n53XVfXeVHFhokw7pwSOnL4MQAzDg-83OaH=FB=cB2gqdA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] soundwire: qcom: Add compatible name for v1.6.0
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, 
 pierre-louis.bossart@linux.intel.com, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, sanyog.r.kale@intel.com, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com, 
 yung-chuan.liao@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-27 22:39:36)
> Update compatible string and master data information in soundwire driver
> to support v1.6.0 in lpass sc7280 based platform.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/soundwire/qcom.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 9eb31ba..fb183bd 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -175,6 +175,11 @@ static struct qcom_swrm_data swrm_v1_5_data = {
>         .default_cols = 16,
>  };
>
> +static struct qcom_swrm_data swrm_v1_6_data = {

Why not const?

> +       .default_rows = 50,
> +       .default_cols = 16,

This is the same as swrm_v1_5_data so just use that struct again?

> +};
> +
>  #define to_qcom_sdw(b) container_of(b, struct qcom_swrm_ctrl, bus)
>
>  static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> @@ -1343,6 +1348,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>  static const struct of_device_id qcom_swrm_of_match[] = {
>         { .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>         { .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },

These other structs for v1.5 and v1.3 could also be const.

> +       { .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
>         {/* sentinel */},
