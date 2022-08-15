Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89948592E36
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 13:30:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6B982C;
	Mon, 15 Aug 2022 13:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6B982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660563021;
	bh=0+/5vaKd21gnL/yChKqhtuaYPxjvX9iHyqh94m+IMrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTkkN4FxJ6883J27KkM0ol1RTsCnW8+gqG8ckQH5Q1CDNKgI5pJvgn5XOsMpyfQvH
	 ANwxhFHUh7Osf0Hvc0Ucg4XqKcfNFh3L99WfrK9qRHSnUZjpNwW2TA4hjhhUN6uCAH
	 MlxlaaUXXdxdkGGI3+qTeuX1i/zwD3FvIgpN7Xoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 229E7F80271;
	Mon, 15 Aug 2022 13:29:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00D35F8025A; Mon, 15 Aug 2022 13:29:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 053F7F80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 13:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 053F7F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eJYZ3FGZ"
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10ea9ef5838so7858986fac.3
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 04:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=z+5ntkds423GH2S+q7c6xH6Cac8ulGfX/i26LSadang=;
 b=eJYZ3FGZruF6cEfms/jF5hfZVxDihcDOkKvZRzWfNik8dlsmzk7sVnv3xAn/G8/Lv+
 zCCbwxR+6gI0eZtB9Jx4ARAvtO3sEC6CYkFJq91u5Qeow0QbtDvMNn0I3l330WIKtB9W
 nYZFJV9gwR8nIB3uYaWPzgoAng959vkRidYOo/Yt6OfPDH57aY5f07kq9stwAuRtxpr7
 YUU/XygwsQK2Czx2WDY2f2M7EB1oDqfK9hKvbKP8pGrP+RooKu8250Qhqt3wYPqBlUMF
 7bnagHErisXVaVElJx2g+IWCzJUid3lLlX6mArisq30YXxEJLq8gnXVHPskg457uLFUd
 nH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=z+5ntkds423GH2S+q7c6xH6Cac8ulGfX/i26LSadang=;
 b=ekj0ww2yQBDSQI++SYX6/6sBDtFTCIPk7B8HQZxvUeXtfvM91Wcy77PdC07vyiWK4J
 VSewKekg5WuBejFvBWuj8U6HEHmif3ow6UOctBTaD3uviYVGrwSfSAkjvm8mm+HGv+GS
 D6ejEgs8CG96K6yrA7fgxCLcFLVy5Htbx8ZvV0QP1lU4LtiMvCyZuQ4In/s+gx/6B77V
 9Q+/0dIsRCg1BxMxrb6YByG8Jcx0YODpLFTC2G03WvA7J/q9bOo0aBmiNso+Gc6vxEAY
 v846IgskQaE0QvLXW45qq9zaE1UZFPqCS6WGhy/PKtBxQtQVCchwrAzeqFIRuaIbMsop
 1qCw==
X-Gm-Message-State: ACgBeo0SGEqo1zTalTi82g0wSwMOlkBs+ep19utabCuFIQaZV7jXSZVg
 y1WM6gu+rw2SzspRFgOwDu4ZL4E4chC4ajti7lH9kA==
X-Google-Smtp-Source: AA6agR4klgeo4FKfPNCXVaIamabi24zc0cZgO2OntT4EhSadiu9bGxlBDYENRPrVt1joz4tO+Fg2AZxf/HE14x5j4WQ=
X-Received: by 2002:a05:6871:54a:b0:118:79c1:431c with SMTP id
 t10-20020a056871054a00b0011879c1431cmr5152885oal.18.1660562949023; Mon, 15
 Aug 2022 04:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220814123800.31200-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20220814123800.31200-1-srinivas.kandagatla@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Mon, 15 Aug 2022 16:58:20 +0530
Message-ID: <CAMi1Hd22sLzRLsiFhGtihYtP_Y9b6TUyLOf2cxiFXrKhjJc4ig@mail.gmail.com>
Subject: Re: [PATCH] soundwire: qcom: remove duplicate reset control get
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org
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

On Sun, 14 Aug 2022 at 18:08, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Looks like adding clock gate flag patch forgot to remove the old code that
> gets reset control.
>
> This causes below crash on platforms that do not need reset.
>
> [   15.653501]  reset_control_reset+0x124/0x170
> [   15.653508]  qcom_swrm_init+0x50/0x1a0
> [   15.653514]  qcom_swrm_probe+0x320/0x668
> [   15.653519]  platform_probe+0x68/0xe0
> [   15.653529]  really_probe+0xbc/0x2a8
> [   15.653535]  __driver_probe_device+0x7c/0xe8
> [   15.653541]  driver_probe_device+0x40/0x110
> [   15.653547]  __device_attach_driver+0x98/0xd0
> [   15.653553]  bus_for_each_drv+0x68/0xd0
> [   15.653559]  __device_attach+0xf4/0x188
> [   15.653565]  device_initial_probe+0x14/0x20
>
> Fix this by removing old code.
>

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Fixes: 1fd0d85affe4 ("soundwire: qcom: Add flag for software clock gating check")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 9df970eeca45..a43961ad4614 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1356,10 +1356,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>         ctrl->bus.compute_params = &qcom_swrm_compute_params;
>         ctrl->bus.clk_stop_timeout = 300;
>
> -       ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> -       if (IS_ERR(ctrl->audio_cgcr))
> -               dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
> -
>         ret = qcom_swrm_get_port_config(ctrl);
>         if (ret)
>                 goto err_clk;
> --
> 2.21.0
>
